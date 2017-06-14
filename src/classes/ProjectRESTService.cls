@RestResource(urlMapping='/project/*')
global with sharing class ProjectRESTService {
   
    // Post method to create project data back from PMS system call.
    @HttpPost
    global static String postProjectData(String ProjectRef, String ProjectName, String OpportunityId,
                                      Date StartDate, Date EndDate, Double Amount, String Status) {
        String errorMessage = 'OK';   
        // SOQL to fetch opportunity using opportunity Id and related project records with project reference.                                 
        List<Opportunity> listOpp = [SELECT Id, DeliveryInstallationStatus__c, 
                                     (SELECT Id FROM Projects__r WHERE ProjectRef__c =: ProjectRef) 
                                     FROM Opportunity WHERE Id =: OpportunityId LIMIT 1]; 
			//checking if there is any opportunity or not.
            if (listOpp.size() > 0) {
            //creating a save point.    
            Savepoint savePoint = Database.setSavepoint();  
            try {
                //creating a project reference for upsert.
                Project__c newProject = new Project__c(Opportunity__c=OpportunityId);
                //if it's an existing project, then linking to the existing id for update only.
                if(listOpp[0].Projects__r.size() > 0){
                	newProject.Id=listOpp[0].Projects__r[0].Id;
                }  
                //setting field values from request variables & upserting.
                newProject.ProjectRef__c = ProjectRef;
                newProject.Name = ProjectName;    
                newProject.Start_Date__c = StartDate;
                newProject.End_Date__c = EndDate;
                newProject.Billable_Amount__c = Amount;
                newProject.Status__C = Status;
                upsert newProject; 
                //updating the parent opportunity record.                                  
                listOpp[0].DeliveryInstallationStatus__c = 'In Progress';                           
                update listOpp;
                
            } catch (Exception ex) {
                //if there is an exception, then rollback.
                Database.rollback(savePoint);
                errorMessage = ex.getMessage();
            }                                  

        } else {
            errorMessage = 'Opportunity not found';
        }
        return errorMessage;
    }
}