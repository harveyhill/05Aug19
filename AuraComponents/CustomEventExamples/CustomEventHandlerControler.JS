({
	handleCustomEvent : function(component, event, helper) {
        let message = event.getParam("message");
		component.set("v.messageFromEvent", message);
        let numEventsFired = parseInt(component.get("v.eventsFired")) +1;
        component.set("v.eventsFired", numEventsFired);
	},
    
    handleCustomAppEvent : function(component, event, helper) {
        console.log('Starting handling of app event');
        let message = event.getParam("message");
        component.set("v.messageFromAppEvent", message);
        let numAppEventsFired = parseInt(component.get("v.appEventsFired")) +1;
        component.set("v.appEventsFired", numAppEventsFired);
    }
    
})
