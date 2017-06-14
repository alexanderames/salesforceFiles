@isTest
private class WarrantySummaryTest {
	
	@isTest static void createCase() {
		// create a case
		Case myCase = new Case();
		// make the purchase date today
		myCase.Product_Purchase_Date__c 		= Date.today();
		// add 10 warranty days
		myCase.Product_Total_Warranty_Days__c 	= 10;
		// check extended warranty box
		myCase.Product_Has_Extended_Warranty__c = true;
		insert myCase;
	}
}