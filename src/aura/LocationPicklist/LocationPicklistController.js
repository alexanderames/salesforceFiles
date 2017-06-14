({

	doInit : function(component, event, helper) {
		helper.fetchPicklistVal(component, 'Location', 'InputSelectDynamic')
	},

	fireAppEvent : function(component, event) {
		var locale = component.find("InputSelectDynamic").get("v.value");
		var appEvent = $A.get("e.c:SetLocation");
		appEvent.setParams({
			"location": locale
		})
		appEvent.fire();
		console.log(locale);
		
	}

})