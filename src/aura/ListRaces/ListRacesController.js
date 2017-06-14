({
	doInit : function(component, event, helper) {
		
	},
    handleAddToList : function(component, event, helper) {
        helper.addTo(component, event);
    },
    handlePicklist : function(component, event, helper) {
    	var location = event.getParam("location");
    	helper.getProducts(component, location);
    },
    updateStock : function(component, event, helper) {
        helper.updateStock(component);
    },
    delete : function(component, event, helper) {
        var stock = component.get("v.products");    
        var deleteEvent = component.getEvent("deleteStockItem");
        deleteEvent.setParams({ "stock": stock }).fire();
    }
})