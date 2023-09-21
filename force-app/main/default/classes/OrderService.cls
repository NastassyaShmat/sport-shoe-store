public with sharing class OrderService {
  public static void calculateResponsibleSalesRep(List<Order__c> newOrders) {
    Set<Id> contactIds = new Set<Id>();
    for (Order__c order : newOrders) {
      contactIds.add((Id) order.get('Contact__c'));
    }
    Map<Id, Contact> contactsMap = new Map<Id, Contact>(
      [SELECT Id, MailingCountryCode FROM Contact WHERE Id IN :contactIds]
    );

    for (Order__c order : newOrders) {
      String countryCode = (String) contactsMap.get(order.Contact__c)
        ?.get('MailingCountryCode');
      order.put(
        'Responsible_Sales_Rep__c',
        RegionUtils.salesRepConfiguration.get(countryCode)?.get('SalesRepId__c')
      );
    }
  }

    public static void updateContacts(List<Order__c> newOrders) {
        Set<Id> contactIds = new Set<Id>();
        for (Order__c order: newOrders) {
            contactIds.add(order.Contact__c);
        }

        update contactIds;
    }
}