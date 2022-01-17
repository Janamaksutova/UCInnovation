trigger AddressTrigger on Address__c (before insert, before update,after insert,after update,after delete) {
    if(trigger.isbefore && trigger.isInsert){
        AddressTriggerHelper.onBeforeInsert(trigger.new, trigger.oldMap);
    }
}