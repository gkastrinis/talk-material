<?php
	require ('utilities.php');
	include ('header.html');
?>
	<div>
<?php

	$season = getSeason();
	if ( $season == 'normal' )
	{
?>
		<h1><img src="php.gif" alt="logo" title="Logo" /></h1>
<?php
	}
	else if ( $season == 'xmasPeriod' )
	{
?>
		<h1><img src="php_snow.gif" alt="logo" title="Logo" /></h1>
		<h2>Hohoho</h2>
<?php
	}
?>
	<hr />
<?php


	// get thread and user info from database
	/*
	    ...
	 */

	$threads = array(
		'Web Development',
		'Site issues',
		'New Projects',
		'Relax'
	);

	$usersOnline = array(
		'Spg' => 'moderator',
		'gpf' => 'admin',
		'Sudavar' => 'user',
		'google [bot]' => 'bot',
		'bill' => 'user'
	);

?>
	<h2>Threads</h2>
<?php
	foreach ($threads as $thread)
	{
?>
	<div><h4><a href=""><?php echo $thread; ?></a></h4></div>
<?php
	}
?>
	<hr />
	<h2><?php echo count($usersOnline); ?> Users Online</h2>
	<div>
<?php
	$first = true;
	foreach ($usersOnline as $user => $group)
	{
		echo ($first ? '' : ' , ') . "<span class=\"$group\">$user</span>";
		$first = false;
	}
?>
	</div>

	</div>
<?php
	include ('footer.html');
?>
