@RestResource(urlMapping='/Accounts/*/contacts')
global class AccountManager {

    @HttpGet
    global static Account getAccount() {
        RestRequest req = RestContext.request;
        String acctId = req.requestURI.substringBetween('Accounts/','/contacts');
        Account acct = [SELECT Id, Name, (SELECT Id, Name FROM Contacts)
                       FROM Account WHERE Id = :acctId];
        return acct;
    }
}