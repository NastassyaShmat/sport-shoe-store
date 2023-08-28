public with sharing class ContactService {
  public static void calculateRegion(List<Contact> newContacts) {
    RegionUtils.setRegion(newContacts, 'MailingCountryCode', 'Region__c');
  }

  public static void calculateCustomerType(List<Contact> newContacts) {
    LoyaltyProgramUtils.setContactCustomerType(newContacts);
  }

  public static void calculateTotalAmountSpent(List<Contact> newContacts) {
    List<AggregateResult> groupedResult = [
      SELECT Contact__c, SUM(Total_Amount__c) total
      FROM Order__c
      WHERE Status__c = 'Completed' AND Contact__c IN :newContacts
      GROUP BY Contact__c
    ];
    Map<Id, Contact> contactsMap = new Map<Id, Contact>(newContacts);
    
    for (AggregateResult ar : groupedResult) {
      contactsMap.get((Id) ar.get('Contact__c'))
        .Amount_Spent__c = (Decimal) ar.get('total');
    }
  }
}
