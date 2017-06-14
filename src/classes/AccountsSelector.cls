public class AccountsSelector extends fflib_SObjectSelector {

    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
            Account.ID,
            Account.Description,
            Account.Name,
            Account.AnnualRevenue };
    }

    public Schema.SObjectType getSObjectType() {
        return Account.sObjectType;
    }

    public List<Account> selectById(Set<ID> idSet) {
        List <Account> acclist = new List <Account>();
        acclist =(List<Account>) selectSObjectsById(idSet);
        //System.debug('accountlist' +acclist);
        return acclist;
        //return (List<Account>) selectSObjectsById(idSet);
        //System.debug('account');
        //AccountsSelector().selectById
    }
}