<?php
require('../php/database.config');
require('../php/database.php');

$connection = dbConnect();
$query = sprintf("SELECT * FROM posts WHERE lang='%s' AND deleted=false ORDER BY id DESC", $lang);
$posts = dbQuery($query, $connection);

foreach ($posts as $post)
{
?>
	<div class="msg">
	<h2><a href="display.php?msg_id=<?php echo $post['id'];?>" ><?php echo $post['title'];?></a></h2>
	<h5>by <?php echo $post['web_admins_username'];?>&nbsp; on&nbsp;
	<?php echo substr($post['date'], 8, 2).' / '.substr($post['date'], 5, 2).' / '.substr($post['date'], 0, 4);?></h5>
	<p><?php echo $post['body'];?></p>
	<?php if (!empty($post['edit_date'])) {?><h6 style="font: italic 11px Arial, Helvetica, sans-serif;">Last edit on
	<?php echo substr($post['edit_date'], 8, 2).' / '.substr($post['edit_date'], 5, 2).' / '.substr($post['edit_date'], 0, 4); echo '</h6>'; }?>
	</div>
<?php
}
?>
