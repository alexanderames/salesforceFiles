({
	getProducts : function(component, location) {
		var action = component.get('c.getStock');
      action.setParams({
        "location": location
      })
      action.setCallback(this, function(response) {
          var state = response.getState();
          if(component.isValid() && state === "SUCCESS") {
              component.set("v.products", response.getReturnValue());
          }
      });
    $A.enqueueAction(action);
	},
  addTo: function(component, event) {
      var newStock = event.getParam('newStock');
      var newStocks = component.get('v.products');
      newStocks.unshift(newStock);
      component.set('v.products', newStocks);
  },
})