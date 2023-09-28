public with sharing class OrderItemTriggerHandler {
  public static void onBeforeInsert(List<OrderItem__c> newOrderItems) {
    OrderItemService.calculateAmount(newOrderItems);
  }

  public static void onBeforeUpdate(
    List<OrderItem__c> newOrderItems,
    List<OrderItem__c> oldOrderItems,
    Map<ID, OrderItem__c> newOrderItemsMap,
    Map<ID, OrderItem__c> oldOrderItemsMap
  ) {
    OrderItemService.calculateAmount(newOrderItems);
  }
}
