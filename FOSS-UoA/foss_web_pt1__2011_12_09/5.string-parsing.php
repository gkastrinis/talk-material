<?php
	class Person
	{
		public $firstName; 		// a PHP String
		public $lastName; 		// a PHP String
		public $age; 			// a PHP Integer
		public $height; 		// a PHP Float
		public $isMale; 		// a PHP Boolean 
	}

	$person = new Person();

	$person->firstName = "John";
	$person->lastName = "Doe";
	$person->age = 23;
	$person->height = 1.85;
	$person->isMale = true;

	$great = 'awesome';
	echo "This is $great";
	echo "Age {$person->age}";
	echo "Time " . time();
?>
