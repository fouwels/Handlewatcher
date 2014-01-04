<?php
	require('lib/Twilio.php');
	include ('apiKeys.php');

	$handleDesired = 'kfo';
	$userPhoneNumber = $StoredPhoneNumber; //from apiKeys.php
	echo $userPhoneNumber."\n";


	$twilio = new Services_Twilio($AccountSid, $AuthToken);
	
	$handleCaught = False;

	while($handleCaught == False)
	{
		echo "Requesting b&nd page\n";
		$headers = get_headers("http://twitter.com/".$handleDesired);

		echo substr($headers[0], 9, 3)."\n";
		if (substr($headers[0], 9, 3) == "404" || "301")
		{
			$handleCaught = True;
			echo "Handle Caught\n";

			$sms = $twilio->account->messages->sendMessage($SourceNumber, $userPhoneNumber, ('Handle '.$handleDesired.' is now free'));
		}

		echo "==\nsleeping for 300==\n\n";
		sleep(300); //wait 5 minutes
	}

	echo "\nEND - yay?\n";
?>