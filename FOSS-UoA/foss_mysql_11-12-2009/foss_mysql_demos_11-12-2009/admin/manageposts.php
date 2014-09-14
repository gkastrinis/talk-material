<?php
require('../php/database.config');
require('../php/database.php');

session_start();

// LOGGED IN
if (!isset($_SESSION['loggedIn']))
{
	header('Location: adminlogin.php');
}


$emptyTitle = false; $emptyBody = false;
if (isset($_POST['addPostForm']))
{
	if (empty($_POST['title'])) $emptyTitle = true;
	if (empty($_POST['body'])) $emptyBody = true;

	$errors = $emptyTitle || $emptyBody;

	if (!$errors && !isset($_POST['preview']))
	{
		$connection = dbConnect();
		$query = sprintf("INSERT INTO posts (web_admins_username, title, date, body, lang) VALUES ('%s', '%s', '%s', '%s', '%s')",
					$_SESSION['username'], dbEsc($_POST['title']), date("Y-m-d"), dbEsc($_POST['body']), $_SESSION['postLang']);
		dbUpdate($query, $connection);
		dbLog('new post', $connection);
		header('Location: manageposts.php');
	}
}
else if (isset($_POST['editPostForm']))
{
	if (empty($_POST['title'])) $emptyTitle = true;
	if (empty($_POST['body'])) $emptyBody = true;

	$errors = $emptyTitle || $emptyBody;

	if (!$errors && !isset($_POST['preview']))
	{
		$mid = preg_replace("/[^0-9]/","", htmlentities($_GET['mid'], ENT_QUOTES));
		$connection = dbConnect();
		$query = sprintf("UPDATE posts SET web_admins_username='%s', title='%s', edit_date='%s', body='%s', lang='%s' WHERE id=%s",
					$_SESSION['username'], dbEsc($_POST['title']), date("Y-m-d"), dbEsc($_POST['body']), $_SESSION['postLang'], $mid);
		dbUpdate($query, $connection);
		dbLog('edit post '.$mid, $connection);
		header('Location: manageposts.php');
	}
}
else if (isset($_GET['action']) && $_GET['action'] === "delete")
{
	$mid = preg_replace("/[^0-9]/","", htmlentities($_GET['mid'], ENT_QUOTES));
	$connection = dbConnect();
	$query = sprintf("UPDATE posts SET deleted=true WHERE id=%s", $mid);
	dbUpdate($query, $connection);
	dbLog('delete post '.$mid, $connection);
	header('Location: manageposts.php');
}


$title = 'Foss UoA - Κοινότητα Ανοιχτού Λογισμικού Καποδιστριακού Πανεπιστημίου Αθηνών - Manage Posts';
$bodyfile = 'dot_body/manageposts.body';

$lang = 'gr';
require('../template.txt');
?>
