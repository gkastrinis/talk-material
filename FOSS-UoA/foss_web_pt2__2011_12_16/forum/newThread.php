<?php

session_start();

if ( !isset ($_SESSION['loggedIn']) )
{
	header ('Location: index.php');
	die;
}

include ('header.html');

?>

	<form action="queries.php" method="POST">
		<div><label for="title">Title</label>
			<input type="text" name="title" id="title" /></div>
		<div><label for="body">Body</label>
			<textarea name="body" id="body"></textarea></div>
		<div><input type="submit" value="Add" /></div>
		<div><input type="hidden" name="threadForm" value="add" /></div>
	</form>

<?php include ('footer.html'); ?>
