({
	// Load stock from Salesforce
	doInit: function(component, event, helper) {
    // Create the action
    var action = component.get("c.getStock");
    // Add callback behavior for when response is received
    action.setCallback(this, function(response) {
    	var state = response.getState();
        if (component.isValid() && state === "SUCCESS") {
            component.set("v.stock", response.getReturnValue());
        }
        else {
            Console.log("Failed with state: " + state);
        }
    });
    // Send action off to be executed
    $A.enqueueAction(action);
	},

	handleAddStock: function(component, event, helper) {
		var action = component.get("c.saveStock");
			action.setParams({"stock": newStock});
			action.setCallback(this, function(response) {
				var state = response.getState();
				if (component.isValid() && state === "SUCCESS") {
					var stocks = component.get("v.stocks");
					stocks.push(response.getReturnValue());
					component.set("v.stocks", stocks);
				}
			});
		$A.enqueueAction(action);
	}
})