<?php

session_start();

include ('header.html');
require_once ('config.php');
require_once ('connect.php');
require_once ('Post.class.php');
require_once ('Thread.class.php');

$tID = $_GET['tID'];

$st = $db->prepare("SELECT title FROM threads WHERE tID=:tID");

$st->execute( array(':tID' => $tID) );

$thread = $st->fetchAll(PDO::FETCH_CLASS, "Thread");
$thread = $thread[0];


$st = $db->prepare("SELECT username, body, pID FROM users, posts WHERE users.uID=posts.uID AND tID=:tID ORDER BY postDate");

$st->execute( array(':tID' => $tID) );

$posts = $st->fetchAll(PDO::FETCH_CLASS, "Post");

if ( isset ($_SESSION['loggedIn']) ) {
?>
	<h2><?php echo $thread->title; ?> - <a href="newPost.php?tID=<?php echo $tID; ?>">Add New Post</a></h2>
<?php
} else {
?>
	<h2><?php echo $thread->title; ?></h2>
<?php
}

foreach ($posts as $post)
{
?>
	<div class="post"><h4><?php echo $post->username; ?></h4><p><?php echo $post->body; ?></p></div>
<?php
}
?>

<?php include ('footer.html'); ?>
