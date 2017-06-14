@isTest
private class LeadingCompetitorTest {
	
	@isTest static void createOppWithCompetitors() {
		// create an opportunity and set required fields
		Opportunity opp = new Opportunity();
		opp.Name 		= 'Big Deal';
		opp.CloseDate 	= Date.today();
		opp.StageName 	= 'Prospecting';

		// set competitor price fields
		opp.Competitor_1_Price__c = 5000;
		opp.Competitor_2_Price__c = 1500;
		opp.Competitor_3_Price__c = 2500;

		// set competitor fields
		opp.Competitor_1__c = 'Amazon';
		opp.Competitor_2__c = 'Google';
		opp.Competitor_3__c = 'Microsoft';

		// save record using DML
		insert opp;
		System.debug('Opportunity' + opp.Name + ' inserted with all competitor fields populated.');
	}
	
}