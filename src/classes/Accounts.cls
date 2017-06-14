public class Accounts extends fflib_SObjectDomain {
   public Accounts(List<Account> sObjectList)
   {
       super(sObjectList);
   }
    
     public class Constructor implements fflib_SObjectDomain.IConstructable {
        public fflib_SObjectDomain construct(List<sObject> sObjectList) {
            return new Accounts(sObjectList);
        }
     }
    
    public override void onApplyDefaults()
    {
        // Apply defaults to account
        for(Account acc: (List<Account>) Records)
        {
            if(acc.Description == null)
            {
            acc.Description = 'Domain classes rock!';
            }
        }
    }
    
    public override void handleBeforeInsert()
    {
        onApplyDefaults();
    }
    
    public override void onBeforeUpdate(Map<Id,sObject> existingRecords) {
        String rock = 'Domain classes rock!';
        List<Account> updatedAccounts = new List<Account>();
        for(Account acc : (List<Account>) Records) {                  
            acc.AnnualRevenue = rock.getLevenshteinDistance(acc.Description);
            updatedAccounts.add(acc);
        }
       
        fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(new Schema.SObjectType[] { Account.SObjectType });
        uow.registerDirty(updatedAccounts);
    }
    

}