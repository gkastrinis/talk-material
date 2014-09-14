<?php
require('../php/database.config');
require('../php/database.php');

$msg_id = preg_replace("/[^0-9]/","", htmlentities($_GET['msg_id'], ENT_QUOTES));

$connection = dbConnect();
$query = sprintf("SELECT * FROM posts WHERE lang='%s' AND id=%s AND deleted=false ORDER BY id DESC", $lang, $msg_id);
$posts = dbQuery($query, $connection);
$post = $posts[0];

if (!empty($posts))
{
	$GLOBALS['valid_id'] = true;
?>
	<div class="msg">
	<h2><a href="display.php?msg_id=<?php echo $post['id'];?>" ><?php echo $post['title'];?></a></h2>
	<h5>by <?php echo $posts[0]['web_admins_username'];?>&nbsp; on&nbsp;
	<?php echo substr($post['date'], 8, 2).' / '.substr($post['date'], 5, 2).' / '.substr($post['date'], 0, 4);?></h5>
	<p><?php echo $post['body'];?></p>
	<?php if (!empty($post['edit_date'])) {?><h6 style="font: italic 11px Arial, Helvetica, sans-serif;">Last edit on
	<?php echo substr($post['edit_date'], 8, 2).' / '.substr($post['edit_date'], 5, 2).' / '.substr($post['edit_date'], 0, 4); echo '</h6>'; }?>
	</div>
<?php
}
else
	$GLOBALS['valid_id'] = false;
?>
