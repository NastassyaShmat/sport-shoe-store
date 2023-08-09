trigger ContactTrigger on Contact (before insert, before update) {
  List<CountryRegionMapping__c> countryRegionMapping = CountryRegionMapping__c.getAll().values();
  List<LoyaltyProgramConfiguration__mdt> loyaltyProgramConfiguration = LoyaltyProgramConfiguration__mdt.getAll().values(); 
 
  if(Trigger.isBefore){
    if(Trigger.isInsert){
      ContactTriggerHandler.onBeforeInsert(Trigger.new, countryRegionMapping);
    } else if(Trigger.isUpdate) {
      ContactTriggerHandler.onBeforeUpdate(Trigger.new, loyaltyProgramConfiguration);
    }
  }
}
