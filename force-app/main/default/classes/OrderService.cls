public with sharing class OrderService {

    public static void calculateResponsibleSalesRep(List<Order__c> newOrders) {
        Map<Id, Contact> contactsMap = RegionUtils.getContactsRegion(newOrders);

        for (Order__c order: newOrders) {
            String region = contactsMap.get(order.Contact__c);
            order.put('ResponsibleSalesRep__c', RegionUtils.salesRepConfiguration.get(region)?.get('SalesRepId__c'));
        }

    }

    public static void updateContacts(List<Order__c> newOrders) {
        Set<Id> contactIds = new Set<Id>(newOrders.Contact__c);
        update contactIds;
    }
}