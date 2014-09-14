<?php
	include ('header.html');

	require_once('serverConfig.php');

	function greetAdmin()
	{
		global $serverUser, $serverPassword;
?>
	<h1><?php echo $serverUser; ?></h1>
	<div>Password: <?php echo $serverPassword; ?></div>
<?php
	}

	greetAdmin();

	include ('footer.html');
?>
