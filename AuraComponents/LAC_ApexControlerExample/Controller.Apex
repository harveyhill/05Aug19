public without sharing class LACApexControllerExampleController {
    @AuraEnabled
    public static List<ID> getMyOpenCases(){
        
        // Check if user can access to view Case
        if (!Schema.SObjectType.Case.isAccessible()) {
            // Pass error to client
            throw new AuraHandledException('You cannot access the Case object');
        } 
        List<Case> cases = [ SELECT id, casenumber, subject, status
            				FROM Case
            				WHERE status != 'Closed']; 
        
        list<ID> ids = new list<ID>();
        for(case c: cases){
            ids.add(c.Id);
        }
        return ids;
        
    }
    
    
}
