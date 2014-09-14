<?php
	$foo = "A string";
	$foo = 1;
	echo $bar;
	$bar = &$foo;
	$bar = TRUE;
	echo $foo;
?>
