public with sharing class ContactService {

    public static void calculateRegion(List<Contact> newContacts) {
        RegionUtils.setRegion(newContacts, 'MailingCountryCode', 'Region__c');
    }

    public static void calculateCustomerType(List<Contact> newContacts) {
        LoyaltyProgramUtils.setCustomerType(newContacts);
    }

    public static void calculateTotalAmountSpent(List<Contact> newContacts) {
        List<AggregateResult> groupedResult = [SELECT Contact__c, SUM(TotalAmount__c) total FROM Order__c  WHERE Id IN :newContacts GROUP BY Contact__c];
        Map<Id, Contact> contactsMap = new Map<Id,Contact>(newContacts);
        for (AggregateResult ar : groupedResult) {
            contactsMap.get((Id)ar.get('Contact__c')).TotalAmount__c = ar.get('total');
        }
    }
}