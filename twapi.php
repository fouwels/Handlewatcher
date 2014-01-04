<?php
	require('lib/Twilio.php');
	include ('apiKeys.php');

	$handleDesired = "kfo";
	$userPhoneNumber = $StoredPhoneNumber; //from apiKeys.php
	echo $userPhoneNumber;


	$twilio = new Services_Twilio($AccountSid, $AuthToken);
	
	
	$sms = $twilio->account->messages->sendMessage($userPhoneNumber, "Handle @".$handleDesired." is now free");

	echo "END - yay?"
?>