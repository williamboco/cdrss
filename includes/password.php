<?php
	//function to generate fandom password
	function randomPassword() {
		$alphabet = "abcdefghijklmnopqrstuwxyzABCDEFGHIJKLMNOPQRSTUWXYZ0123456789";
		$pass = array(); //remember to declare $pass as an array
		$alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
		for ($i = 0; $i < 9; $i++) {
			$n = rand(0, $alphaLength);
			$pass[] = $alphabet[$n];
		}
		return implode($pass); //turn the array into a string
	}

	function passwordEncrypt($pass) {
			$hashFormat = "2y$11$";
			$salt = generateSalt();
			$format_and_salt = $hashFormat . $salt;
			$hash = crypt($pass, $format_and_salt);
			return ($hash);
	}

	//function to generate hash
	function generateSalt() {
			$unique_random_string = md5(uniqid(mt_rand(), true));
			$base64_string = base64_encode($unique_random_string);
			$modified_base64_string = str_replace('+', '.', $base64_string);
			$salt = substr($modified_base64_string, 0, 22);
			return ($salt);
		}


	//function to verify password
	function verify($password, $hashedPassword) {
		return(crypt($password, $hashedPassword) == $hashedPassword);	
	}
?>
