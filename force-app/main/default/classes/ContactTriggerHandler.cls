public with sharing class ContactTriggerHandler {

    static Map<String, List<CMT__mdt>> vfg {
        get {
            if (vfg==null) {
                vfg = new Map<String, String>();

            }
            return vfg;
        }
        set;
    }

    public static void onBeforeInsert(List<Contact> newContacts, List<CountryRegionMapping__c> countryRegionMapping) {
        Map<String, String> codeRegion = new Map<String, String>();

        for(CountryRegionMapping__c crm: countryRegionMapping){
            code_region.put(crm.Country__c, crm.Region__c);
        }

        for (Contact cnt : newContacts) {
            String countryCode = cnt.get('MailingCountryCode');
            cnt.Region__c = codeRegion.get(countryCode);
        }
    }

    public static void onBeforeUpdate(List<Contact> newContacts, List<LoyaltyProgramConfiguration__mdt> loyaltyProgramConfiguration){

    }

}