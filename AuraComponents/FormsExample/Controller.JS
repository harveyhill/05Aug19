({
	createContact : function(component, event, helper) {
        let newContact = component.get('v.newContact');
		let saveContact = component.get('c.saveContact');
        console.log('Attempting to save ' + JSON.stringify(newContact));
        saveContact.setParams({
            "con": newContact
        });
        saveContact.setCallback(this, function(response){
        });
        $A.enqueueAction(saveContact);
        
        
	}
})
