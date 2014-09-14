<?php
require('../php/database.config');
require('../php/database.php');

session_start();

// LOGGED IN
if (!isset($_SESSION['loggedIn']))
{
	header('Location: adminlogin.php');
}


function getMonth($month)
{
    $monthNames = array('January','February','March','April','May','June','July','August','September','October','November','December');
    return $monthNames[((int) $month) - 1];
}


$emptyDate = false; $emptyMsgEN = false; $emptyMsgGR = false; $emptyLink = false;
if (isset($_POST['addEventForm']))
{
	if (empty($_POST['date'])) $emptyDate = true;
	if (empty($_POST['msg_en'])) $emptyMsgEN = true;
	if (empty($_POST['msg_gr'])) $emptyMsgGR = true;
	if (empty($_POST['link'])) $emptyLink = true;
	if (!$emptyDate && !preg_match("/^(19|20)[0-9]{2}[-](0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])$/i", $_POST['date'])) $dateError = true;

	$errors = $emptyDate || $empdtyMsgEN || $emptyMsgGR || $emptyLink || $dateError;

	if (!$errors)
	{
		$connection = dbConnect();
		$query = sprintf("INSERT INTO events (web_admins_username, date, msg_en, msg_gr, link) VALUES ('%s', '%s', '%s', '%s', '%s')",
					$_SESSION['username'], $_POST['date'], dbEsc($_POST['msg_en']), dbEsc($_POST['msg_gr']), dbEsc($_POST['link']));
		dbUpdate($query, $connection);
		dbLog('new event', $connection);
		header('Location: manageevents.php');
	}
}
else if (isset($_POST['editEventForm']))
{
	if (empty($_POST['date'])) $emptyDate = true;
	if (empty($_POST['msg_en'])) $emptyMsgEN = true;
	if (empty($_POST['msg_gr'])) $emptyMsgGR = true;
	if (empty($_POST['link'])) $emptyLink = true;
	if (!$emptyDate && !preg_match("/^(19|20)[0-9]{2}[-](0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])$/i", $_POST['date'])) $dateError = true;

	$errors = $emptyDate || $empdtyMsgEN || $emptyMsgGR || $emptyLink || $dateError;

	if (!$errors)
	{
		$mid = preg_replace("/[^0-9]/","", htmlentities($_GET['mid'], ENT_QUOTES));
		$connection = dbConnect();
		$query = sprintf("UPDATE events SET web_admins_username='%s', date='%s', msg_en='%s', msg_gr='%s', link='%s' WHERE id=%s",
					$_SESSION['username'], $_POST['date'], dbEsc($_POST['msg_en']), dbEsc($_POST['msg_gr']), dbEsc($_POST['link']), $mid);
		dbUpdate($query, $connection);
		dbLog('edit event '.$mid, $connection);
		header('Location: manageevents.php');
	}
}
else if (isset($_GET['action']) && $_GET['action'] === 'delete')
{
	$mid = preg_replace("/[^0-9]/","", htmlentities($_GET['mid'], ENT_QUOTES));
	$connection = dbConnect();
	$query = sprintf("UPDATE events SET deleted=true WHERE id=%s", $mid);
	dbUpdate($query, $connection);
	dbLog('delete event '.$mid, $connection);
	header('Location: manageevents.php');
}
else if (isset($_GET['action']) && $_GET['action'] === 'update')
{
	$connection = dbConnect();
	$events = dbQuery("SELECT * FROM events WHERE deleted=false ORDER BY date", $connection);
	$file = fopen ('../events.xml', 'w');
	// exclusive lock
	if (flock($file,LOCK_EX))
	{
		fwrite ($file, '<?xml version="1.0" encoding="iso-8859-7"?>'."\n");
		fwrite ($file, "<Records>\n");
		foreach ($events as $event)
		{
			fwrite ($file, "\t<Event>\n");
			fwrite ($file, "\t\t<Year>".substr($event['date'], 0, 4)."</Year>\n");
			fwrite ($file, "\t\t<Month>".getMonth(substr($event['date'], 5, 2))."</Month>\n");
			fwrite ($file, "\t\t<Day>".sprintf("%d", substr($event['date'], 8, 2))."</Day>\n");
			fwrite ($file, "\t\t<Desc_en>".htmlspecialchars($event['msg_en'], ENT_QUOTES)."</Desc_en>\n");
			fwrite ($file, "\t\t<Desc_gr>".htmlspecialchars($event['msg_gr'], ENT_QUOTES)."</Desc_gr>\n");
			fwrite ($file, "\t\t<Link>".htmlspecialchars($event['link'], ENT_QUOTES)."</Link>\n");
			fwrite ($file, "\t</Event>\n");
		}
		fwrite ($file, "</Records>\n");
		flock ($file,LOCK_UN);
		
		$connection = dbConnect();
		dbLog('update XML event file', $connection);
	}
	else
	{
		echo 'Error locking file!';
	}
	fclose ($file);

	header('Location: manageevents.php');
}


$title = 'Foss UoA - Κοινότητα Ανοιχτού Λογισμικού Καποδιστριακού Πανεπιστημίου Αθηνών - Manage Events';
$bodyfile = 'dot_body/manageevents.body';

$lang = 'gr';
require('../template.txt');
?>
