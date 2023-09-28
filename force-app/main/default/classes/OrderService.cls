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

  public static void updateContacts(
    List<Order__c> newOrders,
    Map<Id, Order__c> oldOrdersMap
  ) {
    Map<ID, Contact> contactsToUpdateMap = new Map<ID, Contact>();
    for (Order__c order : newOrders) {
      if (
        order.Status__c == 'Completed' &&
        order.Total_Amount__c != oldOrdersMap.get(order.Id).Total_Amount__c
      ) {
        Contact cnt = new Contact(Id = order.Contact__c);
        contactsToUpdateMap.put(order.Contact__c, cnt);
      }
    }

    if (!contactsToUpdateMap.isEmpty()) {
      update contactsToUpdateMap.values();
    }
  }
}
