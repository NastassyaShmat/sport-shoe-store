public with sharing class RegionUtils {

    private static Map<String, Country_Region_Mapping__c> countryRegionConfiguration {
        get {
            if (countryRegionConfiguration == null) {

                countryRegionConfiguration = new Map<String, Country_Region_Mapping__c>();

                for(Country_Region_Mapping__c crm: Country_Region_Mapping__c.getAll().values()) {
                    countryRegionConfiguration.put(crm.Country__c, crm); 
                }
            }
            return countryRegionConfiguration;
        }
        set;
    }

    public static Map<String, Responsible_Sales_Rep_Configuration__c> salesRepConfiguration {
        get {
            if (salesRepConfiguration == null) {
                salesRepConfiguration = new Map<String, Responsible_Sales_Rep_Configuration__c>();
                
                for(Responsible_Sales_Rep_Configuration__c src: Responsible_Sales_Rep_Configuration__c.getAll().values()) {
                    salesRepConfiguration.put(src.Country__c, src);
                }
            }
            return salesRepConfiguration;
        }
        set;
    } 

    public static void setRegion(List<SObject> sObjects, String addressField, String regionField) {
        for (SObject sObj: sObjects) {
            String countryCode = (String)sObj.get(addressField);
            sObj.put(regionField, countryRegionConfiguration.get(countryCode)?.get('Region__c')); 
        }
    }
}