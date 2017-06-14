@isTest
private class HelloWorldTest {
    @isTest static void updateLead() {
        //create Lead
        Lead myLead = new Lead();
        myLead.FirstName = 'David';
        myLead.LastName = 'Liu';
        myLead.Company = 'Google';
        insert myLead;
        //update Lead
        myLead.Company = 'PluralSight';
        update myLead;
    }

}