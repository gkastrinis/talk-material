<?php

	function getSeason()
	{
		$month  = date('m');
		$day    = date('d');

		if ( ($month == 12 && $day >= 5) || ($month == 1 && $day <= 5) )
			return 'xmasPeriod';
		else
			return 'normal';
	}

?>
