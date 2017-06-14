@isTest
private class TestVerifyDate {
    static testMethod void TestVerifyDate() {
        //within 30 days
        String returnValue=String.valueOf(VerifyDate.CheckDates(
            Date.newInstance(2017, 2, 15),Date.newInstance(2017, 2, 20)
        ));
        
        //over 30 days
        String returnValue2=String.valueOf(VerifyDate.CheckDates(
            Date.newInstance(2017, 2, 15),Date.newInstance(2017, 3, 28)
        ));
    }
}