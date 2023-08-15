public with sharing class LeadService {

    public static void calculateRegion(List<Lead> newLeads){
        RegionUtils.setRegion(newLeads, 'CountryCode', 'Region__c');
    }
}