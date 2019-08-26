public class ApexP0Exercises {

	/*
 * 1. Return the nth Fibonacci number
 * Test Cases:
 * Input: 0     Output: 0
 * Input: 1    Output: 1
 * Input: 2     Output: 1
 * Input: 10    Output: 55
*/
	public static Integer nFibonacci( Integer n ){
        if(n==0) {
            return 0;
        } else if(n==1) {
            return 1;
        } else {
            return ((nFibonacci(n-1)) + (nFibonacci(n-2)));
        }
	}
    
    /*
 * 2. Sort an array of integers.
 * Test Cases:
 * Input: [2,4,5,1,3,1]     Output: [1,1,2,3,4,5]
 * Input: [5,4,3,2,1]     Output: [1,2,3,4,5]
 *
 * Don't use the sort() method... that would be lame.
*/
	public static Integer[] sortArray( Integer[] intList ) {
        for(Integer i=0;i<intList.size();i++) {
            Integer temp;
            for(Integer j=i;j<intList.size();j++) {
                if(intList[i]>intList[j]) {
                    temp = intList[i];
                    intList[i] = intList[j];
                    intList[j] = temp;
                }
            }
        }
        return intList;
	}
    
    /*
 * 3. Return the factorial of n.
 * Test Cases:
 * Input: 0    Output: 1
 * Input: 1    Output: 1
 * Input: 3    Output: 6
*/
	public static Integer nFactorial( Integer n) {
        if(n==0) {
            return 1;
        } else if(n==1) {
            return 1;
        }
        Integer curr = 1;
        for(Integer i=n;i>1;i--) {
            curr = curr * i;
        }
        return curr;
	}
    
    /*
 * 4. Rotate left
 * Given an array, array, and an integer, n, rotate the values in array left n times and return array
 * Test Cases:
 * Input: [1,2,3,4,5], 1    Output: [2,3,4,5,1]
 * Input: [1,2,3,4,5], 6    Output: [2,3,4,5,1]
 * Input: [1,2,3,4,5], 3    Output: [4,5,1,2,3]
*/
	public static Integer[] rotateLeftNTimes( Integer[] arrayTest, Integer n) {
        for(Integer i=0;i<n;i++) {
            Integer temp = arrayTest[0];
            for(Integer j=0;j<arrayTest.size()-1;j++) {
                arrayTest[j] = arrayTest[j+1];
            }
            arrayTest[arrayTest.size()-1] = temp;
        }
        return arrayTest;
	}
    
    /*
 * 5. Balanced Brackets
 * A bracket is any one of the following: (, ), {, }, [, or ]
 * 
 * The following are balanced brackets:
 *    ( )
 *    ( ) ( )
 *    ( ( ) )
 *    ( { [ ] } )
 *
 * The following are NOT balanced brackets:
 *   (
 *   )
 *   ( ( )
 *   ( [ ) ]
 *
 * Return true if balanced
 * Return false if not balanced
*/
	public static Boolean bracketsAreBalanced( String s ) {
        Boolean t = True;
        String temp = '';
        /*s = s.trim();
        s = s.replaceAll(' ', '');
        system.debug(s);*/
        for(Integer i=0;i<s.length();i++) {
            if(s.substring(i,i+1).contains('}')) {
                if(!String.isEmpty(temp)) {
                	if(temp.substring(temp.length()-1).contains('{')) {
                    	temp = temp.substring(0, temp.length()-1);
                	} else {
                   		return False;
                	}
                } else {
                   return False;
                }
            } else if(s.substring(i,i+1).contains(')')) {
                if(!String.isEmpty(temp)) {
                	if(temp.substring(temp.length()-1).contains('(')) {
                    	temp = temp.substring(0, temp.length()-1);
                	} else {
                    	return False;
                	}
                } else {
                    return False;
                }
            } else if(s.substring(i,i+1).contains(']')) {
                if(String.isEmpty(temp)) {
                    return False;
                } else {
                	if(temp.substring(temp.length()-1).contains('[')) {
                    	temp = temp.substring(0, temp.length()-1);
                	} else {
                    	return False;
                	}
                }
            } else {
                if(s.substring(i,i+1).contains('{') || s.substring(i,i+1).contains('(') || s.substring(i,i+1).contains('[')) {
                    temp = temp + s.substring(i, i+1);
                }
            }
        }
        if(String.isEmpty(temp)) {
            return True;
        } else {
            return False;
	}
	}
    
    /* You should NOT be submitting answers that you find online. You will be expected to be able to defend any of these solutions without notice. */
/*
 * 6. Create a method that retrieves a list of all accounts and updates those accounts.
 *      Create a custom field on the Account standard object called Size__c that will be a 
 * 		picklist containing small/medium/large.
 *     Create a method that retrieves a list of all accounts. 
 *         - If an account has between 1-1000 employees then it is classified as small.
 *         - If an account has between 1001-10000 employees it is classified as medium.
*         - If an account has more than 10000 employees it is classified as large.
 *     Update the Size__c field on each account to reflect the amount of employees in the Account.
*/
	public static void updateAccountSize( ) {
        List<Account> newAcc = [Select name, NumberOfEmployees, Size__c
                                From Account];
        List<Account> updateAcc = new List<Account>();
        for(Account a: newAcc) {
            if(a.NumberOfEmployees >= 1 && a.NumberOfEmployees <=1000) {
                Account accUp = new Account();
                accUp.Id = a.Id;
                accUp.Size__c = 'Small';
                updateAcc.add(accUp);
            } else if (a.NumberOfEmployees >= 1001 && a.NumberOfEmployees <=10000) {
                Account accUp = new Account();
                accUp.Id = a.Id;
                accUp.Size__c = 'Medium';
                updateAcc.add(accUp);
            } else if (a.NumberOfEmployees > 10000) {
                Account accUp = new Account();
                accUp.Id = a.Id;
                accUp.Size__c = 'Large';
                updateAcc.add(accUp);
            }
        }
        database.update(updateAcc);
	}
    
    /* 
 * 7. Create a method that will find all leads that contain 'ca' in their fields. 
 *     If a lead is located in California(CA), change their Lead Status field to 'Closed - Not 
 * Converted' and their description should display the message, "We are no longer doing 
 * business in California."
 */
	public static void updateCALeads( ) {
        List<Lead> newLead = [Select name, state, status, description 
                              From Lead 
                              Where state='CA'];
        List<Lead> updateList = new List<Lead>();
        for(Lead s: newLead) {
            if(s.state=='CA') {
               Lead  lUpdate = new Lead();
                lUpdate.Id = s.Id;
                lUpdate.Status = 'Closed - Not Converted';
                lUpdate.Description = 'We are no longer doing business in California.';
                updateList.add(lUpdate);
            }
        }
        database.update(updateList);
        //system.debug(updateList);
        //system.debug(newLead);
	}
    
    /*
 * 8. Create a method that will find all Opportunities which have already passed their Close Date 
 * and have a Stage field that is not 'Closed Won'. Since they have passed their Close Date and 
 * they are not marked as 'Closed Won', they should be marked as 'Closed Lost'.
 */
	public static void closePastDueOpportunities( ) {
        List<Opportunity> newOpp = [Select name, StageName, CloseDate
									From Opportunity
									Where StageName != 'Closed Won'];
        List<Opportunity> updateOpp = new List<Opportunity>();
        Date todaysDate = system.today();
        for(Opportunity o: newOpp) {
            if(o.CloseDate < todaysDate && o.StageName != 'Closed Won') {
                Opportunity oUpdate = new Opportunity();
                oUpdate.Id = o.Id;
                oUpdate.StageName = 'Closed Lost';
                updateOpp.add(oUpdate);
                //System.debug(todaysDate);
        		//System.debug(newOpp);
        	}
        }
        database.update(updateOpp);
	}
}
