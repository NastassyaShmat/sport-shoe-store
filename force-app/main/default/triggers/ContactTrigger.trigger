trigger ContactTrigger on Contact (before insert, before update, before delete, after insert, after update, after delete) {

  if(Trigger.isBefore){
    if(Trigger.isInsert){
      ContactTriggerHandler.onBeforeInsert(Trigger.new);
    } else if(Trigger.isUpdate) {
      ContactTriggerHandler.onBeforeUpdate(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
    }
  }
}
