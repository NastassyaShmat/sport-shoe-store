public with sharing class ContactTriggerHandler {

    public static void onBeforeInsert(List<Contact> newContacts) {
        ContactService.calculateRegion(newContacts);
        ContactService.calculateCustomerType(newContacts);     
    }

    public static void onBeforeUpdate(List<Contact> newContacts, List<Contact> oldContacts, Map<ID, Contact> newContactMap, Map<ID, Contact> oldContactMap) {
        ContactService.calculateRegion(newContacts);
        ContactService.calculateCustomerType(newContacts);
        ContactService.calculateTotalAmountSpent(newContacts);
    }
}