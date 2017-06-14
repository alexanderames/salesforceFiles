({
  // Fetch the product/stock from the Apex controller
  getProductList: function(component) {
    var action = component.get('c.getProduct');
    action.setCallback(this, function(actionResult) {
      component.set('v.stock', actionResult.getReturnValue());
    });
    $A.enqueueAction(action);
  }
})