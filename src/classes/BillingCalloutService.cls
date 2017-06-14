public class BillingCalloutService {
	
    //method to run asynchronously or in future, invoked from trigger.
    @future(callout=true)
    public static void callBillingService(String projectRef, Decimal billingAmount){
        //gets the custom settings values.
        ServiceCredentials__c servCred = ServiceCredentials__c.getValues('BillingServiceCredential');
        //creating the project object to be passed in argument below.
        BillingServiceProxy.project project = new BillingServiceProxy.project();
        project.username = servCred.Username__c;
        project.password = servCred.Password__c;
        project.projectRef = projectRef;
        project.billAmount = billingAmount;
		//synchronous call to the Billing Invoice system.
        BillingServiceProxy.InvoicesPortSoap11 invoiceCall = new BillingServiceProxy.InvoicesPortSoap11();
        //getting the response back from billing system.
        String response = invoiceCall.billProject(project);
		//if the response is ok, need to change the billing status to 'Billed'
        List<Project__c> proj;
        if (response != null && response.equalsIgnoreCase('OK')){
			proj = [SELECT Status__c FROM Project__c WHERE ProjectRef__c =: projectRef];
            if(proj.size() > 0){
                proj[0].Status__c = 'Billed';
            }
            update proj;
        }
    }
}