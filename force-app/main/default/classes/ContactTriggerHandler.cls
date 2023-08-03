public with sharing class ContactTriggerHandler {
    private boolean triggerIsExecuting;
    private integer triggerSize;
    
    public ContactTriggerHandler(boolean isExecuting, integer size) {
        this.triggerIsExecuting = isExecuting;
        this.triggerSize = size;
    }

    public void OnBeforeInsert(List<Contact> newContacts, List<CountryRegionMapping__c> countryRegionMapping, 
        List<LoyaltyProgramConfiguration__mdt> loyaltyProgramConfiguration) {
        Map<String, String> code_region = new Map<String, String>();

        for(CountryRegionMapping__c crm: countryRegionMapping){
            code_region.put(crm.Country__c, crm.Region__c);
        }

        for (Contact cnt : newContacts) {
            String countryCode = (String)cnt.get(MailingAddress);
            cnt.Region__c = code_region.get(countryCode);
        }
    }

    public void OnBeforeUpdate(List<Contact> newContacts, List<LoyaltyProgramConfiguration__mdt> loyaltyProgramConfiguration){

    }

}