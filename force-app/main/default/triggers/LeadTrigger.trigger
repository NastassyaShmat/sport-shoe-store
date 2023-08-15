trigger LeadTrigger on Lead (before insert, before update, before delete, after insert, after update, after delete) {

	if(Trigger.isBefore){
		if(Trigger.isInsert){
		  LeadTriggerHandler.onBeforeInsert(Trigger.new);
		} else if(Trigger.isUpdate) {
		  LeadTriggerHandler.onBeforeUpdate(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
		}
	  }
}