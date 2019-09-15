({
	doInit : function(component, event, helper) {
        
        let getMyOpenCases = component.get("c.getMyOpenCases");
        
        getMyOpenCases.setCallback(this, function(response) {
            if (response.getState() === "SUCCESS") {
                component.set("v.cases", response.getReturnValue());
            }
        });
        
        $A.enqueueAction(getMyOpenCases);
	},
})
