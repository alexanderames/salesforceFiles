({


    createStock : function(component, event, helper) {
    	var location = component.get("v.location");
    	console.log(location);
        helper.createNewStock(component, location);
    },
    handleProductChange : function(component, event, helper) {
        var input = event.target.id; //this is = one-id
        var inputValue = document.getElementById(input).value;
        console.log('inputValue : ', inputValue);
        helper.productDetails(component, inputValue);
    },
    handleCategoryChange : function(component, event, helper) {
        
        // Get a reference to the dependent picklist
        var selectContact = component.find("product");
        
        // Call the helper function to refresh the
        // dependent picklist, based on the new controlling value
        component.set("v.productOptions",
            selectContact.optionsByControllingValue[event.target.value]);
    },
	handleInit : function(component, event, helper) {
        var self = this;		
        // Enqueue the action and configure the callback handler
        // to set the Product picklist to be dependent
        // on the Category picklist, simultaneously enumerating
        // the Category picklist options
        var getProducts = component.get("c.getProduct");
        getProducts.setCallback(self, function(a) {
            var contacts = a.getReturnValue();  // Array<Object>
            
            // Construct the list of Category picklist options
            var categoryOptions = [];
            
            // Construct the map of dependent Product picklist
            // options, keyed on Category ID values
            var productOptionsByCategory = new Object();
            
            // Go through all of the returned Product records
            // to enumerate the list of Category options and also
            // to build the map of dependent Product options
            contacts.forEach(function(element, index, array) {
                var categoryId = element.Product_Category__c;
                
                // If the product's Category is new to us
                if (productOptionsByCategory[categoryId] === undefined) {
                    
                    // Add the Category as an option for the
                    // Category picklist
                    var categoryOption = new Object();
                    categoryOption.value = element.Product_Category__c;
                    categoryOption.label = element.Product_Category__c;
                    categoryOptions.push(categoryOption);
                    
                    // Construct an empty array to initialize
                    // the list of dependent Product picklist options
                    productOptionsByCategory[categoryId] = [];
                }
                
                // Add the Product as an option under the appropriate
                // controlling Category value
                var productOption = new Object();
                productOption.value = element.Id;
                productOption.label = element.Name;
                productOptionsByCategory[categoryId].push(productOption);
            });
            
            // Set the Category options
            component.set("v.categoryOptions", categoryOptions);
            
            // Attach the map of Product options, keyed on
            // controlling Category values
            var selectProduct = component.find("product");
            selectProduct.optionsByControllingValue = productOptionsByCategory;
        });
        $A.enqueueAction(getProducts);      
    }
})