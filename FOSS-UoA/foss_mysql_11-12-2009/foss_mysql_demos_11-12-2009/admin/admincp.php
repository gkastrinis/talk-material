<?php
require('../php/database.config');
require('../php/database.php');

session_start();

// LOGGED IN
if (!isset($_SESSION['loggedIn']))
{
	header('Location: adminlogin.php');
}

// LOGOUT
if (isset($_POST['logoutForm']))
{
	$connection =  dbConnect();
	dbLog('logout', $connection);
	
	// UNSET ALL SESSION VARIABLES
	$_SESSION = array();
	
	// DELETE SESSION COOKIE
	if (isset($_COOKIE[session_name()]))
		setcookie(session_name(), '', time()-42000, '/');

	// DESTROY THE SESSION
	session_destroy();
	
	header('Location: adminlogin.php');
}


$title = 'Foss UoA - Κοινότητα Ανοιχτού Λογισμικού Καποδιστριακού Πανεπιστημίου Αθηνών - ';
if (isset($_GET['action']) && $_GET['action'] === 'changePass')
{
	$title .= 'Change Password';
	$bodyfile = 'dot_body/changepass.body';
	
	$emptyCurrent = false; $emptyPassword1 = false; $emptyPassword2 = false;
	$valid_err = false; $passMismatch = false;
	if (isset($_POST['changePassForm']))
	{
		if (empty($_POST['current'])) $emptyCurrent = true;
		if (empty($_POST['pass1'])) $emptyPassword1 = true;
		if (empty($_POST['pass2'])) $emptyPassword2 = true;
		if (!$emptyPassword1 && !$emptyPassword2 && ($_POST['pass1'] !== $_POST['pass2']))
			$passMismatch = true;

		$errors = $emptyCurrent || $emptyPassword1 || $emptyPassword2;
		if (!$errors)
		{
			$connection = dbConnect();
			$query = sprintf("SELECT pass FROM web_admins WHERE username='%s'", $_SESSION['username']);
			$res = dbQuery($query, $connection);
			if (crypt($_POST['current'], $res[0]['pass']) != $res[0]['pass']) $valid_err = true;
		}
		$errors = $errors || $valid_err || $passMismatch;

		if (!$errors)
		{
			$newpass = crypt($_POST['pass1']);
			$query = sprintf("UPDATE web_admins SET pass='%s' WHERE username='%s'", $newpass, $_SESSION['username']);
			dbUpdate($query, $connection);
			dbLog('change pass', $connection);
			header('Location: admincp.php');
		}
	}
}
else if (isset($_GET['action']) && $_GET['action'] === 'addAdmin')
{
	$title .= 'Add Site Admin';
	$bodyfile = 'dot_body/addadmin.body';
	
	$emptyCurrent = false; $emptyName = false; $emptyPassword1 = false; $emptyPassword2 = false;
	$valid_err = false; $passMismatch = false;
	if (isset($_POST['addAdminForm']))
	{
		if (empty($_POST['current'])) $emptyCurrent = true;
		if (empty($_POST['username'])) $emptyName = true;
		if (empty($_POST['pass1'])) $emptyPassword1 = true;
		if (empty($_POST['pass2'])) $emptyPassword2 = true;
		if (!$emptyPassword1 && !$emptyPassword2 && ($_POST['pass1'] !== $_POST['pass2']))
			$passMismatch = true;

		$errors = $emptyCurrent || $emptyName || $emptyPassword1 || $emptyPassword2;
		if (!$errors)
		{
			$connection = dbConnect();
			$query = sprintf("SELECT pass FROM web_admins WHERE username='%s'", $_SESSION['username']);
			$res = dbQuery($query, $connection);
			if (crypt($_POST['current'], $res[0]['pass']) != $res[0]['pass']) $valid_err = true;
		}
		$errors = $errors || $valid_err || $passMismatch;

		if (!$errors)
		{
			$newpass = crypt($_POST['pass1']);
			$query = sprintf("INSERT INTO web_admins (username, pass) VALUES('%s', '%s')", $_POST['username'], $newpass);
			dbUpdate($query, $connection);
			dbLog('add site admin '.$_POST['username'], $connection);
			header('Location: admincp.php');
		}
	}
}
else
{
	$title .= 'Admin Control Panel';
	$bodyfile = 'dot_body/admincp.body';
}


$lang = 'gr';
require('../template.txt');
?>
