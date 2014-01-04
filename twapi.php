<?php
	require('lib/Twilio.php');
	include ('apiKeys.php');

	$handleDesired = "kfo"
	$userPhoneNumber = $StoredPhoneNumber; //from apiKeys.php


	$twilio = new Services_Twilio($AccountSid, $AuthToken);
	
	
	$sms = $client->account->messages->sendMessage($userPhoneNumber, "Handle @".$handleDesired." is now free");

?>