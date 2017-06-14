@isTest
private class AccountManagerTest {

     private static testMethod void getAccountTest1() {
        Id recordId = createTestRecord();
        //setup test request
         RestRequest request = new RestRequest();
         request.requestURI =
             'https://na1.salesforce.com/services/apexrest/Accounts/' +recordId +'/contacts';
         request.httpMethod = 'GET';
         RestContext.request = request;
        //call the method to test
         Account thisAccount = AccountManager.getAccount();
        //verify results
         System.assert(thisAccount != null);
         System.assertEquals('Test record', thisAccount.Name);
    }
    //helper method
    static Id createTestRecord() {
        Account TestAcct = new Account(
        Name = 'Test record');
        insert TestAcct;
        Contact TestCon = new Contact(
        LastName = 'Test',
        AccountId = TestAcct.id);
        return TestAcct.Id;
    }
}