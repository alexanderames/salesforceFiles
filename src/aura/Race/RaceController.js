({
    handleUpdate: function(component, event, helper) {
        helper.updateStck(component);
    },
    deleteEvent : function(component, event, helper) {
	    // Call the helper function to delete record and update view
	    helper.deleteStock(component, event.getParam("stock"));
	    console.log(event.getParam("stock"));
	}
})