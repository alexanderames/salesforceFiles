public class RandomContactFactory {
	public static List<Contact> generateRandomContacts(integer numofContacts,string LastNameGen)
    {
    	List<Contact> con= new List<Contact>();
    	for(Integer i=0;i<numofContacts;i++)
    	{
        	LastNameGen='Test'+ i;
        	Contact a=new Contact(FirstName=LastNameGen,LastName=LastNameGen);
            con.add(a);
        }
        return con;
    }
}