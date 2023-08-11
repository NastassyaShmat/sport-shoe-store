public with sharing class LeadService {

    public static void calculateRegion(List<Lead> newLeads){

        for (Lead lead : newLeads) {
            String countryCode = lead.get('CountryCode');
            lead.Region__c = cfg.get(countryCode);
        }

    }
}