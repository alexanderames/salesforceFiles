({
  getStocks: function(component) {
      	var newStock = component.get("v.newStock");
        var action = component.get("c.saveStock");
      	action.setParams({ 
            "stock": newStock
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            
                component.set("v.newStock", response.getReturnValue());
                console.log(response.getReturnValue());
            
        });
        $A.enqueueAction(action);
  }/*,
    createStock: function(component, stock) {
    this.upsertStock(component, stock, function(a) {
        
        stock.push(a.getReturnValue());
        component.set("v.Stocks", stock);
      });
    },
    upsertStock : function(component, stock, callback) {
        var action = component.get("c.saveStock");
        
        if (callback) {
          action.setCallback(this, callback);
        }
        $A.enqueueAction(action);
    }*/
})