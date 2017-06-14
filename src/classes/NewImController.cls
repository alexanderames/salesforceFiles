public with sharing class NewImController {
	@AuraEnabled
	public static Stock__c saveStock (Stock__c stock) {

		insert stock;
		return stock;

	}
    @AuraEnabled
    public static Stock__c updateStock(Stock__c stock) {
        
        update stock;
        system.debug(stock);
        return stock;
        
    }
}