<?php

session_start();

if ( !isset ($_SESSION['loggedIn']) )
{
	header ('Location: index.php');
	die;
}

include ('header.html');

?>

	<h2>Thread Title</h2>

	<form action="queries.php" method="POST">
		<div><label for="body">Body</label>
			<textarea name="body" id="body"></textarea></div>
		<div><input type="submit" value="Add" /></div>
		<div><input type="hidden" name="postForm" value="add" />
			<input type="hidden" name="tID" value="<?php echo $_GET['tID']; ?>" /></div>
	</form>

<?php include ('footer.html'); ?>
