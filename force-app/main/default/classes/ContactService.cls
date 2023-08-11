public with sharing class ContactService {

    public static void calculateRegion(List<Contact> newContacts){

        for (Contact cnt : newContacts) {
            String countryCode = cnt.get('MailingCountryCode');
            cnt.Region__c = 
        }

    }

    public static void calculateCustomerType(){

    }

}