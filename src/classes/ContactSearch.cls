public class ContactSearch {
    public static List<Contact> searchForContacts(string lname, string mpcode) {
        try{
            List<Contact> contacts = [SELECT Name FROM Contact WHERE (LastName = :lname AND MailingPostalCode = :mpcode)];
            return contacts;
        }catch(DmlException e){
            System.debug('An error occurred: ' + e.getMessage());
            return null;
        }
    }
}