public with sharing class RegionUtils {

    private static Map<String, CountryRegionMapping__c> countryRegionConfiguration {
        get {
            if (countryRegionConfiguration == null) {

                countryRegionConfiguration = new Map<String, CountryRegionMapping__c>();

                for(CountryRegionMapping__c crm: CountryRegionMapping__c.getAll().values()) {
                    countryRegionConfiguration.put(crm.Country__c, crm); 
                }
            }
            return countryRegionConfiguration;
        }
        set;
    }

    public static Map<String, ResponsibleSalesRepConfiguration__c> salesRepConfiguration {
        get {
            if (salesRepConfiguration == null) {
                salesRepConfiguration = new Map<String, ResponsibleSalesRepConfiguration__c>();
                
                for(ResponsibleSalesRepConfiguration__c src: ResponsibleSalesRepConfiguration__c.getAll().values()) {
                    salesRepConfiguration.put(src.Country__c, src);
                }
            }
            return salesRepConfiguration;
        }
        set;
    } 

    public static void setRegion(List<SObject> sObjects, String addressField, String regionField) {
        for (SObject sObj: sObjects) {
            String countryCode = sObj.get(addressField);
            sObj.put(regionField, countryRegionConfiguration.get(countryCode)?.get('Region__c')); 
        }
    }

    public static Map<Id, Contact> getContactsRegion(List<SObject> records) {
        Set<Id> recordIdSet = new Set<Id>(records.id);
        Map<Id, Contact> contactsMap = new Map<Id, Contact>([SELECT Id, Region__c FROM Contact WHERE Id IN :recordIdSet]);

        return contactsMap;
    }

}