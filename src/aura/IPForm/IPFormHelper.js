({
	submitForm : function(component, stock) {
		this.upsertForm(component, stock, function(a) {
			var stocks = component.get("v.newStock");
			//stocks.push(a.getReturnValue());
			component.set(stocks, a.getReturnValue());
		});
	},
	upsertForm : function(component, stock, callback) {
		var action = component.get("c.saveStock");
		action.setParams({
			"stock": stock
		});
		if (callback) {
			action.setCallback(this, callback);
		}
		$A.enqueueAction(action);
	}
})