<?php
	require('lib/Twilio.php');
	include ('apiKeys.php');

	$handleDesired = 'kfo';
	$userPhoneNumber = $StoredPhoneNumber; //from apiKeys.php
	echo $userPhoneNumber."\n";


	$twilio = new Services_Twilio($AccountSid, $AuthToken);
	
	
	$sms = $twilio->account->messages->sendMessage($SourceNumber, $userPhoneNumber, ('Handle '.$handleDesired.' is now free'));

	echo "\nEND - yay?"
?>