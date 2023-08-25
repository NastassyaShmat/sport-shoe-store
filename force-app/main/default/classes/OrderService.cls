public with sharing class OrderService {

    public static void calculateResponsibleSalesRep(List<Order__c> newOrders) {
        Map<Id, Contact> contactsMap = RegionUtils.getContactsRegion(newOrders);

        for (Order__c order: newOrders) {
            String region = contactsMap.get(order.Contact__c).Region__c;
            order.put('Responsible_Sales_Rep__c', RegionUtils.salesRepConfiguration.get(region)?.get('Sales_Rep_Id__c'));
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