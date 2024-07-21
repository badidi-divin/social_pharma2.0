<?php
	try {
			$connection='mysql:host=localhost;dbname=social_pharma';
			// Création de la classe PDO
				$pdo=new PDO($connection,'root','');

		} catch (PDOException $e) {
			// message d'erreur 
			$msg='ERREUR PDO dans '.$e->getMessage();
			die($msg); 
		}


