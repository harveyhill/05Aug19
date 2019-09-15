({
	doInit : function(component, event, helper) {
        // grab the value of the attribute where name="numberOne"
		var numberOne = component.get("v.numberOne");
        // grab the value of the attribute where name="numberTwo"
        var numberTwo = component.get("v.numberTwo");
        
        if (numberOne === undefined) 
            console.log("numberOne is undefined upon initialization");
        if (numberTwo === undefined) 
            console.log("numberTwo is undefined upon initialization");
	},
    
    addNumbers : function(component, event, helper) {
        var numberOne = component.get("v.numberOne");
        var numberTwo = component.get("v.numberTwo");
        
        var sum = numberOne + numberTwo;
        component.set("v.sum", sum);
        
    },
    
    sumChanged : function(component, event, helper) {
		helper.helperMethod1(component);  
    },
    
    
    
})
