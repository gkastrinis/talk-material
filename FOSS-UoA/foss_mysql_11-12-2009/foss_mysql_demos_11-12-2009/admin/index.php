<?php
session_start();

// LOGGED IN
if (isset($_SESSION['loggedIn']))
{
	header('Location: admincp.php');
}
else
{
	header('Location: adminlogin.php');
}
?>