public class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(string name) {
        List<List<sObject>> searchList = [FIND :name IN ALL FIELDS RETURNING
                                          Contact(FirstName,LastName) ,Lead(FirstName,LastName)];
        return searchList;
    }
}