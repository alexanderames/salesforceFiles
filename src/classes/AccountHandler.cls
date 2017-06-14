public class AccountHandler {
    public static Account insertNewAccount(string acct) {
        try{
            Account x = new Account(Name=acct);
            insert x;
            System.debug('Account '+acct+' created');
            return x;
        }	catch(DmlException e){
            system.debug('DML Error:'+ e.getMessage());
            return null;
        }
    }
}