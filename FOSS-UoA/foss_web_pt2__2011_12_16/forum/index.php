<?php

session_start();

include ('header.html');
require_once ('config.php');
require_once ('connect.php');
require_once ('Thread.class.php');

if ( !isset ($_SESSION['loggedIn']) ) {
?>
	<form action="queries.php" method="POST">
		<div><label for="username">Username</label>
			<input type="text" name="username" id="username" /></div>
		<div><label for="password">Password</label>
			<input type="password" name="password" id="password" /></div>
		<div><input type="submit" value="Login" /></div>
		<div><input type="hidden" name="loginForm" value="" /></div>
	</form>
<?php
} else {
?>
	<h1>Hello <?php echo $_SESSION['username']; ?> - <a href="queries.php?logout">logout</a></h1>
<?php
}
?>
	<hr />
<?php
$st = $db->prepare ("SELECT tID, title, username FROM threads, users WHERE opener_uID=uID ORDER BY tID");
$st->execute ( array() );
$threads = $st->fetchAll (PDO::FETCH_CLASS, "Thread");

if ( isset ($_SESSION['loggedIn']) ) {
?>
	<h2>Threads - <a href="newThread.php">Add New</a></h2>
<?php
} else {
?>
	<h2>Threads</h2>
<?php
}

foreach ($threads as $thread) {
?>
	<div><h4><a href="viewThread.php?tID=<?php echo $thread->tID; ?>"><?php echo $thread->title; ?></a> by <?php echo $thread->username; ?></h4></div>
<?php
}
?>
	
<?php include ('footer.html'); ?>
