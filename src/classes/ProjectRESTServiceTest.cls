@isTest
private class ProjectRESTServiceTest {
	
    @testSetup static void testSetupData(){
        //creating the opportunity record
        Opportunity opp = new Opportunity();
        opp.Name = 'TestRun';
        opp.CloseDate = (Date.today()).addDays(15);
        opp.StageName = 'Submitted Project';
        opp.DeliveryInstallationStatus__c = 'Yet to begin';
        insert opp;
        //creating the related project record
        Project__c newProject = new Project__c();
        newProject.Opportunity__c = opp.Id;
        newProject.ProjectRef__c = 'TestRef';
        newProject.Name = 'TestProject';    
        newProject.Start_Date__c = Date.today();
        newProject.End_Date__c = (Date.today()).addDays(15);
        newProject.Billable_Amount__c = 1000;
        newProject.Status__C = 'Billed';
        insert newProject;
    }
    
    @isTest static void testUpsertProjectsUpdateSuccess(){
        Opportunity opp = [SELECT Id FROM Opportunity WHERE Name = 'TestRun' LIMIT 1];
        Test.startTest();
        String message = ProjectRESTService.postProjectData('TestRef', 'TestName', String.valueOf(opp.Id), Date.today(),Date.today(), 1200, 'Billed');
        Test.stopTest();
        System.assertEquals('OK', message);
        opp = [SELECT DeliveryInstallationStatus__c FROM Opportunity WHERE Id =: opp.Id LIMIT 1];
        System.assertEquals('In progress', opp.DeliveryInstallationStatus__c);
        Project__c proj = [SELECT Name FROM Project__c WHERE ProjectRef__c =: 'TestRef'];
        System.assertEquals('TestName', proj.Name);
    }

    @isTest static void testUpsertProjectsInsertSuccess(){
        Opportunity opp = [SELECT Id FROM Opportunity WHERE Name = 'TestRun' LIMIT 1];
        Test.startTest();
        String message = ProjectRESTService.postProjectData('TestRef2', 'TestName', String.valueOf(opp.Id), Date.today(),Date.today(), 1200, 'Billed');
        Test.stopTest();
        System.assertEquals('OK', message);
        opp = [SELECT DeliveryInstallationStatus__c FROM Opportunity WHERE Id =: opp.Id LIMIT 1];
        System.assertEquals('In progress', opp.DeliveryInstallationStatus__c);
        Project__c proj = [SELECT Name FROM Project__c WHERE ProjectRef__c =: 'TestRef2'];
        System.assertEquals('TestName', proj.Name);
    }

    @isTest static void testUpsertProjectsNoOpportunity(){
        Test.startTest();
        String message = ProjectRESTService.postProjectData('TestRef', 'TestName', 'invalidOppId', Date.today(),Date.today(), 1200, 'Billed');
        Test.stopTest();
        System.assertEquals('Opportunity not found', message);
    }
                                                            
    @isTest static void testUpsertProjectsFailure(){
        Opportunity opp = [SELECT Id FROM Opportunity WHERE Name = 'TestRun' LIMIT 1];
        Test.startTest();
        String message = ProjectRESTService.postProjectData('TestNoRef', 'TestName', String.valueOf(opp.Id), Date.today(),Date.today(), 1200, 'Failure');
        Test.stopTest();
        System.assertNotEquals('OK', message);
        System.assertNotEquals('Opportunity not found', message);
		List<Project__c> proj = [SELECT Name FROM Project__c WHERE ProjectRef__c =: 'TestNoRef'];
        System.assertEquals(0, proj.size());        
    }    

}