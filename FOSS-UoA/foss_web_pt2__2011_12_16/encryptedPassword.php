<?php
/* PHASE 1 */
$plainText = 'querty';
$encrypted = crypt("qwerty");
// eg. $1$2uXsd3Sa$xN9zWaqx8sNZrV68mki7D0


/* PHASE 2 */
$submittedPassword = 'querty';
$storedPassword = '$1$2uXsd3Sa$xN9zWaqx8sNZrV68mki7D0';
if ( ( crypt($submittedPassword, $storedPassword) == $storedPassword ) )
{
	echo 'Valid Password!';
}
?>
