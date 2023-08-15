public with sharing class RegionUtils {

    private static Map<String, CountryRegionMapping__c> countryRegionConfiguration {
        get {
            if (countryRegionConfiguration==null) {

                countryRegionConfiguration = new Map<String, CountryRegionMapping__c>();

                for(CountryRegionMapping__c crm: CountryRegionMapping__c.getAll().values()) {
                    countryRegionConfiguration.put(crm.Country__c, crm);
                }
            }
            return countryRegionConfiguration;
        }
        set;
    }

    private static Map<String, ResponsibleSalesRepConfiguration__c> salesRepConfiguration {
        get {
            if(salesRepConfiguration==null) {
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
        for(SObject sObj: sObjects) {
            String countryCode = sObj.get(addressField);
            sObj.put(regionField, countryRegionConfiguration.get(countryCode)?.get('Region__c')); 
        }
    }

    public static void setResponsibleSalesRep(List<SObject> sObjects) {
        for(SObject sObj: sObjects) {
            sObj.put('ResponsibleSalesRep__c', salesRepConfiguration.get()?.get());
        }
    }

}