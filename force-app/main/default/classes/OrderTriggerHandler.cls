public with sharing class OrderTriggerHandler {

    public static void onBeforeInsert(List<Order__c> newOrders) {
        OrderService.calculateResponsibleSalesRep(newOrders);
    }

    public static void onBeforeUpdate(List<Order__c> newOrders, List<Order__c> oldOrders, Map<ID, Order__c> newOrderMap, Map<ID, Order__c> oldOrderMap) {
        OrderService.calculateResponsibleSalesRep(newOrders);
    }

    public static void onAfterInsert(List<Order__c> newOrders) {
        OrderService.updateContacts(newOrders);
    }

    public static void onAfterUpdate(List<Order__c> newOrders) {
        OrderService.updateContacts(newOrders);
    }
}