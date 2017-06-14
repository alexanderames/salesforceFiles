public with sharing class ImController {
	// return a list of stock, filter by location
	@AuraEnabled
    public static List<Stock__c> getStock(Id location) {
        return [SELECT
                Name,
                Product__c,
                Product__r.Name,
                Product__r.Product_Category__c,
                Product__r.Wholesale_Price__c,
                Product__r.Suggested_Retail_Price__c,
                Current_Quantity__c,
                Stock_Shipment_Quantity__c,
                Location_Retail_Price__c,
                Order__c,
                Location__c
                FROM
                Stock__c
                WHERE
                Location__c = :location];
    }
	//return a list of product options
	@AuraEnabled
	public static List<Product2> getProduct() {	
		return [SELECT
						Id,
						Name,
						Product_Category__c
						FROM
						Product2
		        WHERE Product_Category__c != null];		
	}

	@AuraEnabled
	public static List<Product2> getDetails(Id inputValue) {
		return [SELECT
						Id,
						Suggested_Retail_Price__c,
						Wholesale_Price__c
						FROM
						Product2
						WHERE Id = :inputValue];
	}

 // return a list of location options
  @AuraEnabled
		public static List<Location__c> getselectOptions() {
  List<Location__c> lstLocation = new List<Location__c>();
      
      for(Location__c loc :
      		[SELECT
      		Id,
      		Name
      		FROM
      		Location__c
      		WHERE Name != null]){
        lstLocation.add(loc); 
      }
      return lstLocation;
   }

  @AuraEnabled
	public static Stock__c saveStock (Stock__c stock) {

		insert stock;
		return stock;

	}
  @AuraEnabled
  public static Stock__c updateStock(Stock__c stock) {
      
  update stock;
  return stock;
      
  }

  @AuraEnabled
	public static Stock__c deleteStock(Stock__c stock) {
	    // Perform isDeletable() check here 
	    delete stock;
	    return stock;
	}
}