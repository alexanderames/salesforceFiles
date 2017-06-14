({
  doInit : function(component, event, helper) {
    var action = component.get("c.getProduct");
    action.setCallback(this, function(a) {
        component.set("v.products", a.getReturnValue());
    });
    $A.enqueueAction(action);
  },
	submitForm : function(component, event, helper) {
		var newStock = component.get("v.newStock");
		helper.submitForm(component, newStock);
	}
})