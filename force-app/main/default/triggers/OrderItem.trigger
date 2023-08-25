trigger OrderItem on OrderItem__c (before insert, before update, before delete, after insert, after update, after delete) {

	if(Trigger.isBefore){
		if(Trigger.isInsert){
			OrderItemTriggerHandler.onBeforeInsert(Trigger.new);
		}
	}
}