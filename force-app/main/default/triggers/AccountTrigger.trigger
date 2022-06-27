trigger AccountTrigger on Account (after insert) {
    
    If(Trigger.isAfter){
        
        if(Trigger.isInsert){
				AccountTriggerHandler.AccountOnAfterInsert(Trigger.New);         
        }
        
    }
    
    
    

}