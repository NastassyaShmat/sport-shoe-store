public with sharing class ContactService {

    public static void calculateRegion(List<Contact> newContacts){
        RegionUtils.setRegion(newContacts, 'MailingCountryCode', 'Region__c');
    }

    public static void calculateCustomerType(List<Contact> newContacts){
        LoyaltyProgramUtils.setCustomerType(newContacts);
    }

}