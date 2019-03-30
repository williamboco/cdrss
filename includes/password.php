<?php
	//function to generate fandom password
	function randomPassword() {
		$alphabet = "abcdefghijklmnopqrstuwxyzABCDEFGHIJKLMNOPQRSTUWXYZ0123456789";
		$pass = array(); //remember to declare $pass as an array
		$alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
		for ($i = 0; $i < 8; $i++) {
			$n = rand(0, $alphaLength);
			$pass[] = $alphabet[$n];
		}
		return implode($pass); //turn the array into a string
	}

	//function to generate hash
	function generateHash($pass) {
		if(defined("CRYPT_BLOWFISH") && CRYPT_BLOWFISH) {
			$salt = '$2y$11$'.substr(md5(uniqid(rand(), true)), 0, 22);
			return crypt($pass, $salt);
		}
	}

	//function to verify password
	function verify($password, $hashedPassword) {
		return (crypt($password, $hashedPassword) == $hashedPassword);
	}
?>
