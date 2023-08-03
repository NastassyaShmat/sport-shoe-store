trigger ContactTrigger on Contact(before insert, before update) {
  List<CountryRegionMapping__c> countryRegionMapping = CountryRegionMapping__c.getAll().values();
  List<LoyaltyProgramConfiguration__mdt> loyaltyProgramConfiguration = LoyaltyProgramConfiguration__mdt.getAll().values(); 
 
  TriggerHandler handler = new ContactTriggerHandler(Trigger.isExecuting, Trigger.size);
  if(Trigger.isBefore){
    if(Trigger.isInsert){
      handler.OnBeforeInsert(Trigger.new, countryRegionMapping);
    } else if(Trigger.isUpdate) {
      handler.OnBeforeUpdate(Trigger.new, loyaltyProgramConfiguration);
    }
  }
}
