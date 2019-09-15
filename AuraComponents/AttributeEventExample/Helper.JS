({
	helperMethod1 : function(component) {
        var text = 'The sum attribute has changed.';
        
		this.helperMethod2(component, text);
	}, 
    
    helperMethod2 : function(component, text) {
        component.set("v.changedText", text);
    },
})
