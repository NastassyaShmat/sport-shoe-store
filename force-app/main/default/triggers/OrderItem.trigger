trigger OrderItem on OrderItem (before insert, before update, before delete, after insert, after update, after delete) {

	if(Trigger.isBefore){
		if(Trigger.isInsert){
			OrderItemTriggerHandler.onBeforeInsert(Trigger.new);
		}
	}
}