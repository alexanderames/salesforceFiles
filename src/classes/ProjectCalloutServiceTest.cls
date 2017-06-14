@isTest
private class ProjectCalloutServiceTest {
    //Implement mock callout tests here

    @testSetup static void testSetupdata(){
		//create the opportunity record
        Opportunity opp1 = new Opportunity();
        opp1.Name = 'ABC Corp1';
        opp1.Type = 'New Project';
        opp1.Amount = 1000;
        opp1.CloseDate = Date.today();
        opp1.StageName = 'Submitted Project';
        insert opp1;
		//create the opportunity record
        Opportunity opp2 = new Opportunity();
        opp2.Name = 'ABC Corp2';
        opp2.Type = 'New Project';
        opp2.Amount = 1000;
        opp2.CloseDate = Date.today();
        opp2.StageName = 'Resubmit Project';
        insert opp2;
        //create the Custom Settings
        ServiceTokens__c servToken = new ServiceTokens__c();
        servToken.Name = 'ProjectServiceToken';
        servToken.Token__c = 'shgglskgblsbglbdsflgbldmfbgldb';
        insert servToken;
    }
    
    @isTest static void testPostCalloutSuccess() {
        Opportunity opp = [Select Id, Name FROM Opportunity WHERE Name = 'ABC Corp1' Limit 1];
        List<Id> oppList = new List<Id>();
        oppList.add(opp.Id);
        System.assertEquals('ABC Corp1', opp.Name);
        System.assertEquals(1,oppList.size());
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new ProjectCalloutServiceMock()); 
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        Test.startTest();
        ProjectCalloutService.postOpportunityToPMS(oppList);
        Test.stopTest();    
        // Verify that the response received contains fake values        
        opp = [select StageName from Opportunity where id =: opp.Id];
        System.assertEquals('Submitted Project',opp.StageName);
    }
    
    @isTest static void testPostCalloutFailure() {
        Opportunity opp = [Select Id, Name FROM Opportunity WHERE Name = 'ABC Corp2' Limit 1];
        List<Id> oppList = new List<Id>();
        oppList.add(opp.Id);
        System.assertEquals('ABC Corp2', opp.Name);
        System.assertEquals(1,oppList.size());
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new ProjectCalloutServiceMockFailure()); 
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        Test.startTest();
        ProjectCalloutService.postOpportunityToPMS(oppList);
        Test.stopTest();        
        // Verify that the response received contains fake values        
        opp = [select StageName from Opportunity where id =: opp.Id];
        System.assertEquals('Resubmit Project',opp.StageName);
    }
    
}