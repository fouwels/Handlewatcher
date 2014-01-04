<?php
	require('lib/Twilio.php');
	include ('apiKeys.php');

	$handleDesired = '@kfouwels';
	$userPhoneNumber = $StoredPhoneNumber; //from apiKeys.php
	echo $userPhoneNumber."\n";

	$twilio = new Services_Twilio($AccountSid, $AuthToken);
	
	$handleCaught = False;

	while($handleCaught == False)
	{
		echo "Requesting b&nd page for ".$handleDesired."\n";
		$url = "http://twitter.com/".$handleDesired."\n";		
		echo $url;		

		$headers = get_headers($url, 1);
		echo $headers[0];

		if(strpos($headers[0], "404") !== false)
		{
			$handleCaught = True;
			echo "Handle Caught\n";

			//$sms = $twilio->account->messages->sendMessage($SourceNumber, $userPhoneNumber, ('Handle '.$handleDesired.' is now free'));
		}
		else
		{
			echo "\nsleeping\n\n";
			sleep(2); //wait 5 minutes
		}
	}

	echo "\nEND - yay?\n";
?>
