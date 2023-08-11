public with sharing class RegionUtils {
    static List<CountryRegionMapping__c> countryRegionMapping = CountryRegionMapping__c.getAll().values();

    static Map<String, CountryRegionMapping__c> cfg {
        get {
            if (cfg==null) {
                cfg = new Map<String, CountryRegionMapping__c>();

                for(CountryRegionMapping__c crm: countryRegionMapping){
                    cfg.put(crm.Country__c, crm);
                }
            }
            return cfg;
        }
        set;
    }

}