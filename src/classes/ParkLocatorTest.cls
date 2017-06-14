@isTest
private class ParkLocatorTest {
    @isTest static void testCallout() {
        //fake response generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        //call method, invokes a callout
        String country = 'India';
        //verify fake result is returned
        System.assertEquals(new List<String>{'Lal Bhag', 'Cubbon Park', 'Pazhassi Dam'}, ParkLocator.country(country));
    }
}