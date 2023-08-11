public with sharing class LeadTriggerHandler {

    public static void onBeforeInsert(List<Lead> newLeads) {
        LeadService.calculateRegion(newLeads);
    }

    public static void onBeforeUpdate(List<Lead> newLeads, List<Lead> oldLeads, Map<ID, Lead> newLeadMap, Map<ID, Lead> oldLeadMap) {
        LeadService.calculateRegion(newLeads);
    }
}