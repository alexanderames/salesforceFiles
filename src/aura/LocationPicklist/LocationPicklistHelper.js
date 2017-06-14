({
    fetchPicklistVal: function(component,filterValue, elementId) {
        var action = component.get("c.getselectOptions");
        var opts = [];
        action.setCallback(this, function(response) {
          if (response.getState() == "SUCCESS") {
              var allValues = response.getReturnValue();
              
          if (allValues != undefined && allValues.length > 0) {
                  opts.push({
                      class: "optionClass",
                      label: "--- None ---",
                      value: ""
                  });
              }
              for (var i = 0; i < allValues.length; i++) {
                  opts.push({
                      class: "optionClass",
                      label: allValues[i].Name,
                      value: allValues[i].Id
                  });
              }
              component.find(elementId).set("v.options", opts);
            }
        });
        $A.enqueueAction(action);
    }  
})