<?php

session_start();

require_once ('config.php');
require_once ('connect.php');
require_once ('User.class.php');

if ( isset ($_GET['logout']) )
{
	// UNSET ALL SESSION VARIABLES
	$_SESSION = array();

	// DELETE SESSION COOKIE
	if ( isset($_COOKIE[session_name()]) )
		setcookie(session_name(), '', time()-42000, '/');

	// DESTROY THE SESSION
	session_destroy();

	header('Location: index.php');
	die;
}
else if ( isset ($_POST['loginForm']) && !empty($_POST['username']) && !empty($_POST['password']) )
{
	$st = $db->prepare("SELECT * FROM users WHERE username=:username AND password=:password");

	$st->execute( array(':username' => $_POST['username'], ':password' => $_POST['password']) );

	$users = $st->fetchAll(PDO::FETCH_CLASS, "User");
	
	$_SESSION['loggedIn'] = true;
	$_SESSION['username'] = $users[0]->username;
	$_SESSION['uID'] = $users[0]->uID;
	$_SESSION['group'] = $users[0]->group;

	header('Location: index.php');
	die;
}

if ( !isset ($_SESSION['loggedIn']) )
{
	header('Location: index.php');
	die;
}

if ( isset ($_POST['threadForm']) && $_POST['threadForm'] == 'add' && !empty($_POST['title']) && !empty($_POST['body']) )
{
	$st = $db->prepare("INSERT INTO threads (title, opener_uID) VALUES(:title, :opener_uID)");

	$st->execute( array(':title' => $_POST['title'], ':opener_uID' => $_SESSION['uID']) );

	$tID = $db->lastInsertId();

	$st = $db->prepare("INSERT INTO posts (tID, uID, body) VALUES(:tID, :uID, :body)");

	$st->execute( array(':tID' => $tID, ':uID' => $_SESSION['uID'], ':body' => $_POST['body']) );

	header('Location: viewThread.php?tID=' . $tID);
	die;
}
else if ( isset ($_POST['postForm']) && $_POST['postForm'] == 'add' && !empty($_POST['body']) )
{
	$st = $db->prepare("INSERT INTO posts (tID, uID, body) VALUES(:tID, :uID, :body)");

	$st->execute( array(':tID' => $_POST['tID'], ':uID' => $_SESSION['uID']), ':body' => $_POST['body']) );

	$pID = $db->lastInsertId();

	header('Location: viewThread.php?tID=' . $_POST['tID']);
	die;
}
else
{
	header('Location: index.php');
}

?>
