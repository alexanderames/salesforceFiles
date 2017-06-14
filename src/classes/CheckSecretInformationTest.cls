@isTest
private class CheckSecretInformationTest {
	
	@isTest static void createCaseWithSecretInfo() {
		// create or update a case
		Case myCase = new Case();
		// case subject can't begin with "warning"
		myCase.Subject = 'HELP!!!';
		// case description can't be null
		// case description contains a secret keyword
		myCase.Description = 'My bodyweight is 180 pounds.';
		insert myCase;
		System.debug('Case ' + myCase.Id + ' created with description ' + myCase.Description);
	}
	
}