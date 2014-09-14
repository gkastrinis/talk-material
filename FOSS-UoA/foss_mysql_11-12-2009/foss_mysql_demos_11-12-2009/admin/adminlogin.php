<?php
require('../php/database.config');
require('../php/database.php');

session_start();

// LOGGED IN
if (isset($_SESSION['loggedIn']))
{
	header('Location: admincp.php');
}


$emptyName = false; $emptyPass = false; $valid_err = false;
// LOGIN
if (isset($_POST['loginForm']))
{
	if (empty($_POST['username'])) 	$emptyName = true;
	if (empty($_POST['pass'])) 		$emptyPass = true;
	
	if (!$emptyName && !$emptyPass)
	{
		$connection = dbConnect();
		$query = sprintf("SELECT * FROM web_admins WHERE username='%s'", dbEsc($_POST['username']));
		$res = dbQuery($query, $connection);

		if (crypt($_POST['pass'], $res[0]['pass']) == $res[0]['pass'])
		{
			$_SESSION['loggedIn'] = true;
			$_SESSION['username'] = $res[0]['username'];
			
			$_SESSION['postLang'] = 'gr';
			$_SESSION['feedLang'] = 'gr';
			
			dbLog('login', $connection);
			header('Location: admincp.php');
		}
		else
		{
			dbLog('failed login', $connection);
			$valid_err = true;
		}
	}
}


$title = 'Foss UoA - Κοινότητα Ανοιχτού Λογισμικού Καποδιστριακού Πανεπιστημίου Αθηνών - Admin Login';
$bodyfile = 'dot_body/adminlogin.body';

$lang = 'gr';
require('../template.txt');
?>
