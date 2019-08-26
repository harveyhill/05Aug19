///////////////////////////////////////////////////////////////////
//
//          Apex Homework due 8/26
//          Author: Geoffrey Murray
//          Description: This is homework from Revature training
//              assigned to get us more familiar with using Apex.
//              There should be 8 exercises contained here.
//
//
///////////////////////////////////////////////////////////////////

public with sharing class ApexP0Exercises {
    public ApexP0Exercises() {

    }
    //Exercise 1: Make a fibonacci calculator
    //      I'm taking a recursive approach, since the fibonacci sequence is usually defined recursively
    public static Integer nfibonacci( Integer n){

        if(n == 0){
            return 0;
        }
        else if(n==1){
            return 1;
        }
        else{
            return (nfibonacci(n-1) + nfibonacci(n-2));
        }
    }

    //Exercise 2: Sort the array
    //      I'm going with an insertion sort, since it's one I'm familiar with,
    //      and has the added benefit of being faster than the bubble sort for
    //      array sizes larger than like 5.
    public static Integer[] sortArray( Integer[] intList) {

        Integer i, key, j;


        //Go through each position in the array
        for(i = 1; i<intList.size(); i++){
            
            //Select the current value and look at the value of the position prior.
            //Also, save the value of the current position.
            key = intList[i];
            j = i-1;

            //go backwards through the list, and as long as that value is larger than
            //the value we're working with, move each value up
            while(j >= 0 && intList[j]> key){
                intList[j+1]=intList[j];
                j--;

            }
            //when all values have been moved up, we can insert the value we were holding onto.
            intList[j+1]=key;
        }
        return intList;
    }

    //Exercise 3: factorial calculator
    //      Again, this function is usually defined recursively,
    //      so that's the approach I decided to take.
    public static Integer nFactorial(Integer n)
    {
        if(n==1 || n == 0){
            return 1;}
        else{
            return n*nFactorial(n-1);}

    }

    //Exercise 4: rotate left n times
    //      I broke this into 3 steps: copy, move, replace.
    //      I don't know what else to say here. 
    public static List<Integer> rotateLeftNTimes(List<Integer> passedArray, Integer n) {
        
        //We're beginning by making a tempArray to hold the first n values, so they can be shifted later.
        List<Integer> tempArray = new List<Integer>();
        //fill in the tempArray with the first n values
        for(Integer i=0; i<n; i++){

            tempArray.set((i), passedArray.get(i));
        
        }
        //Scooch all the values to the left n spaces.
        for(Integer i=0; i<(passedArray.size()-n); i++){

            passedArray.set(i, passedArray.get(i+n));

        }

        //since I don't wanna do math right now, this is to start the tempArray at 0.
        Integer j = 0;
        //Now replace the values removed at the end of the array.
        for(Integer i=passedArray.size()-n; i<passedArray.size(); i++){

            passedArray.set(i, tempArray.get(j));
            j++;
        }
        j=0;
        return passedArray;
    }
        
    
    public static Boolean bracketsAreBalanced(String s){

		List<String> allChars = new List<String>();
        Integer bracketBalance = 0;
        for(Integer i = 0; i < s.length(); i++){
            
            allChars.add(i, s.substring(i, i));
            
        }
        
        for(String c: allChars){
            
            Switch on c{
                when '(', '{', '['{
                    bracketBalance++;
                    
                }
                when ']', ')', '}' {
                    bracketBalance--;
                                     
                }
            }               
        }
        
        if(bracketBalance == 0)
        {return true;}
        else
        {return false;}

    }
    
    public static void updateAccountSize(){
        
        List<Account> allAccounts = [SELECT NumberOfEmployees, Size__c FROM Account];
        for(Account a: allAccounts){
            
            if(a.NumberOfEmployees <= 1000){
                a.Size__c = 'Small';
                
            } else if(a.NumberOfEmployees>1000 && a.NumberOfEmployees <=10000){
                
             a.Size__c = 'Medium';
                
            } else {
                a.Size__c = 'Large';
                
            }
        }
        update allAccounts;
    }
    
    public static void updateCALeads(){
        
        List<Lead> allLeads = new List<Lead>();
        allLeads = [SELECT Status, Address, Description FROM Lead];
        for(Lead l: allLeads){
            if(l.address != null){
            Address location = l.Address;
            
            if(location.getStateCode() == 'CA')
            {
                l.Status = 'Closed -Not Converted';
                l.Description = 'We are no longer doing business in California.';
                
            }  
        }
        }
        update allLeads;
        
    }
    
    public static void closePastDueOpportunities(){
        
        Date checkAgainstThis = Date.today();
        
        List<Opportunity> allOpportunities = new List<Opportunity>();
        allOpportunities = [SELECT CloseDate, StageName FROM Opportunity WHERE CloseDate < :checkAgainstThis AND StageName != 'Closed Won'];
        
        for(Opportunity o: allOpportunities){
            
            o.StageName = 'Closed Lost';
            
        }
        update allOpportunities;
    }
    
    
}
