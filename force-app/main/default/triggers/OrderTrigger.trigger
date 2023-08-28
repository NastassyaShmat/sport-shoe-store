trigger OrderTrigger on Order__c (before insert, before update, before delete, after insert, after update, after delete) {
	
	if (Trigger.isBefore) {
		if(Trigger.isInsert) {
			OrderTriggerHandler.onBeforeInsert(Trigger.new);
		} else if (Trigger.isUpdate) {
			OrderTriggerHandler.onBeforeUpdate(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
		}
	} else if (Trigger.isAfter) {
		if (Trigger.isUpdate) {
			OrderTriggerHandler.onAfterUpdate(Trigger.new, Trigger.old, Trigger.oldMap, Trigger.newMap);
		}
	}
}
