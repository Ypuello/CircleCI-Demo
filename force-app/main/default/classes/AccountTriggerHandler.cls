public without sharing class AccountTriggerHandler {
    
    public class MyCustomException extends Exception {} 
        
        
    public static void AccountOnAfterInsert(List<Account> accountList){
      
        List<Opportunity> opportunityList = new List<Opportunity>();
        
        for(Account acc: accountList){
        
        	Opportunity opp = new Opportunity(
            	Name = 'Opportunity ' + acc.Name,
                AccountId = acc.Id,
                StageName = 'Prospecting'
                //CloseDate = date.today().addMonths(2)
            );
            
            opportunityList.add(opp);
        
        }
        
        try{
            Boolean isCloseDateNull = false;
            for(Opportunity opp: opportunityList){
                if(opp.CloseDate == null) throw new MyCustomException('Close date cant be empty.');
            }
           
            if(!isCloseDateNull) insert opportunityList;
            
        }catch(MyCustomException e){
            throw new MyCustomException('Changes mades',  e);
        }
        
        
        
        
    }
    
    
    
    

}