@isTest
public class AccountTriggerHandlerTest {

	@isTest
    static void AccountOnAfterInsertTest(){
        
        List<Account> accountList = new List<Account>();
        for(Integer x = 1; x<=200; x++){
            Account acc = new Account(
                Name = 'Account'+ x
            );
            accountList.add(acc);
        }
        
        try{
            Test.startTest();
            	AccountTriggerHandler.AccountOnAfterInsert(accountList);
            Test.stopTest();
        }catch(AccountTriggerHandler.MyCustomException e){
           System.assertEquals('An error has ocurred.', e.getMessage());
        }
        
    
    }    
    
    
    
}