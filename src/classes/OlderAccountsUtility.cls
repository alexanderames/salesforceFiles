public class OlderAccountsUtility {
    public static void updateOlderAccounts() {
        // get 5 old accts
        Account[] oldAccounts = [SELECT Id, Description FROM Account ORDER BY
                                CreatedDate ASC LIMIT 5];
        // loop thru and update description
        for (Account acct : oldAccounts) {
            acct.Description = 'Heritage Account';
        }
        // save changes
        update oldAccounts;
    }
}