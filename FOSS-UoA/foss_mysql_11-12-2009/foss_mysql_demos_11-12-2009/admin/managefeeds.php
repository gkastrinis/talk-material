<?php
require('../php/database.config');
require('../php/database.php');

session_start();

// LOGGED IN
if (!isset($_SESSION['loggedIn']))
{
	header('Location: adminlogin.php');
}


$emptyTitle = false; $emptyLink = false; $emptyDesc = false;
if (isset($_POST['addFeedForm']))
{
	if (empty($_POST['title'])) $emptyTitle = true;
	if (empty($_POST['link'])) $emptyLink = true;
	if (empty($_POST['desc'])) $emptyDesc = true;

	$errors = $emptyTitle || $emptyLink || $emptyDesc;

	if (!$errors)
	{
		$title = $_POST['title'];
		$link = stripslashes($_POST['link']);
		$desc = stripslashes($_POST['desc']);
		
		$connection = dbConnect();
		$query = sprintf("INSERT INTO feeds (web_admins_username, title, link, description, date, type, lang) VALUES ('%s', '%s', '%s', '%s', '%s', '%s', '%s')",
					$_SESSION['username'], dbEsc($_POST['title']), dbEsc($_POST['link']), dbEsc($_POST['desc']), date("Y-m-d"), $_POST['feedType'], $_SESSION['feedLang']);
		dbUpdate($query, $connection);
		dbLog('new feed entry', $connection);
		header('Location: managefeeds.php');
	}
}
else if (isset($_POST['editFeedForm']))
{
	if (empty($_POST['title'])) $emptyTitle = true;
	if (empty($_POST['link'])) $emptyLink = true;
	if (empty($_POST['desc'])) $emptyDesc = true;

	$errors = $emptyTitle || $emptyLink || $emptyDesc;

	if (!$errors)
	{
		$mid = preg_replace("/[^0-9]/","", htmlentities($_GET['mid'], ENT_QUOTES));
		$connection = dbConnect();
		$query = sprintf("UPDATE feeds SET web_admins_username='%s', title='%s', link='%s', description='%s', date='%s', type='%s', lang='%s'  WHERE id=%s",
					$_SESSION['username'], dbEsc($_POST['title']), dbEsc($_POST['link']), dbEsc($_POST['desc']), date("Y-m-d"), $_POST['feedType'], $_SESSION['feedLang'], $mid);
		dbUpdate($query, $connection);
		dbLog('edit feed entry '.$mid, $connection);
		header('Location: managefeeds.php');
	}
}
else if (isset($_GET['action']) && $_GET['action'] === "delete")
{
	$mid = preg_replace("/[^0-9]/","", htmlentities($_GET['mid'], ENT_QUOTES));
	$connection = dbConnect();
	$query = sprintf("UPDATE feeds SET deleted=true WHERE id=%s", $mid);
	dbUpdate($query, $connection);
	dbLog('delete feed entry '.$mid, $connection);
	header('Location: managefeeds.php');
}
else if (isset($_GET['action']) && $_GET['action'] === "update" && isset($_GET['type']))
{
	$type = ($_GET['type'] == 'generalRSS' ? 'General RSS' : 'Meetings RSS');

	$connection = dbConnect();
	$query = sprintf("SELECT * FROM feeds WHERE type='%s' AND lang='%s' AND deleted=false ORDER BY id DESC", $type, $_SESSION['feedLang']);
	$entries = dbQuery($query, $connection);
	$file = fopen ('../'.$_SESSION['feedLang'].'/RSSfeed'.($type == 'General RSS' ? '' : '_meetings').'.xml', 'w');
	// exclusive lock
	if (flock($file,LOCK_EX))
	{
		fwrite ($file, '<?xml version="1.0" encoding="ISO-8859-'.($_SESSION['feedLang'] == 'gr' ? '7' : '1').'" ?>'."\n");
		fwrite ($file, '<?xml-stylesheet type="text/xsl" href="../styles.xsl"?>'."\n");
		fwrite ($file, '<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">'."\n");
		fwrite ($file, "<channel>\n");
		fwrite ($file, "\t<title>Foss UoA RSS Feed".($type == 'General RSS' ? '' : ' - Meetings\' RSS')."</title>\n");
		fwrite ($file, "\t<description>Foss UoA RSS Feed".($type == 'General RSS' ? '' : ' - Meetings\' RSS')."</description>\n");
		fwrite ($file, "\t<copyright>2008-2009 Refsnes Data as. All rights reserved.</copyright>\n");
		
		foreach ($entries as $entry)
		{
			fwrite ($file, "\t<item>\n");
			fwrite ($file, "\t\t<title>".htmlspecialchars($entry['title'], ENT_QUOTES)."</title>\n");
			fwrite ($file, "\t\t<link>".htmlspecialchars($entry['link'], ENT_QUOTES)."</link>\n");
			fwrite ($file, "\t\t<description>".htmlspecialchars($entry['description'], ENT_QUOTES)."</description>\n");
			fwrite ($file, "\t\t<guid isPermaLink=\"false\">foss-uoa/gr/rss/item_".$entry['id']."</guid>\n");
			fwrite ($file, "\t\t<author>foss.uoa@gmail.com</author>\n");
			fwrite ($file, "\t\t<pubDate>".substr($entry['date'], 8, 2)." ".substr($entry['date'], 5, 2)." ".substr($entry['date'], 0, 4)."</pubDate>\n");
			fwrite ($file, "\t</item>\n");
		}
		fwrite ($file, "</channel>\n");
		fwrite ($file, "</rss>\n");
		flock ($file,LOCK_UN);
		
		$connection = dbConnect();
		dbLog('update '.$_SESSION['feedLang'].' '.$type.' RSS file', $connection);
	}
	else
	{
		die('Error locking file!');
	}
	fclose ($file);

	header('Location: managefeeds.php');
}


$title = 'Foss UoA - Κοινότητα Ανοιχτού Λογισμικού Καποδιστριακού Πανεπιστημίου Αθηνών - Manage Feeds';
$bodyfile = 'dot_body/managefeeds.body';

$lang = 'gr';
require('../template.txt');
?>
