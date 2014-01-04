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

		echo "\nRequesting b&nd page";
		$headers = get_headers("http://twitter.com/".$handleDesired);
		
		if (substr($headers[0], 9, 3) == "404")
		{
			$sms = $twilio->account->messages->sendMessage($SourceNumber, $userPhoneNumber, ('Handle '.$handleDesired.' is now free'));
		}

		//$page = file_get_contents("http://twitter.com/".$handleDesired);
		//$page = file_get_contents("http://twitter.com/asdadsukneariulgnelgr");
		//if (strpos($page, "Sorry, that page doesn’t exist!") == True)
		//{
		//	echo "\nPage does not exist!";
		//	$sms = $twilio->account->messages->sendMessage($SourceNumber, $userPhoneNumber, ('Handle '.$handleDesired.' is now free'));
		//	$handleCaught = True;
		//}






		echo "\nsleeping for 300";
		sleep(300); //wait 5 minutes


	}

	echo "\nEND - yay?";


?>