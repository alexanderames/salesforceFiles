({
    updateStck: function(component) {
        var stock = component.get("v.product");
        var action = component.get("c.updateStock");
        action.setParams({"stock": stock});
        action.setCallback(this, function(response){
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                console.log("updated successfully!");
            } else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + errors[0].message);
                    }
                }
            }
        })
      $A.enqueueAction(action);
    },
    deleteExpense : function(component, stock, callback) {
    // Call the Apex controller and update the view in the callback
    var action = component.get("c.deleteStock");
    action.setParams({
        "stock": stock
    });
    action.setCallback(this, function(response) {
        var state = response.getState();
        if (state === "SUCCESS") {
            // Remove only the deleted stock from view
            var expenses = component.get("v.products");
            console.log(expenses);
            var items = [];
            for (i = 0; i < expenses.length; i++) {
                if(expenses[i]!==expense) {
                    items.push(expenses[i]);  
                }
            }
            component.set("v.products", items);
            // Other client-side logic
        }
    });
    $A.enqueueAction(action);
}
})