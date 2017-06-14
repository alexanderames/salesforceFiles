({
    productDetails: function(component, inputValue) {
        var action = component.get('c.getDetails');
        action.setParams({
          "inputValue": inputValue
        })
        action.setCallback(this, function(response) {
          var state = response.getState();
          if(component.isValid() && state === "SUCCESS") {
            component.set("v.selection", response.getReturnValue());
            console.log(response.getReturnValue());
          }
        });
        $A.enqueueAction(action);
    },
  createNewStock: function(component, inputValue) {
      var action = component.get("c.saveStock");
      action.setParams({
        "stock": inputValue
      });
      action.setCallback(this, function(response) {
          var state = response.getState();
          if (component.isValid() && state === "SUCCESS") {
              console.log("Inventory was saved");
              var appEvent = $A.get("e.c:AddToList");
              appEvent.setParams({"newStock" : response.getReturnValue()});
              appEvent.fire();
          } else if (state === "ERROR") {
              var errors = response.getError();
              if (errors) {
                  if (errors[0] && errors[0].message) {
                      console.log("Error message: " + errors[0].message);
                  }
              } else {
                  console.log("Unknown error");
              }
          } else {
              console.log("Action State returned was: " + state);
          }
      });
      $A.enqueueAction(action);
  }
})