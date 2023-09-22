public with sharing class OrderItemTriggerHandler {
  public static void onBeforeInsert(List<OrderItem__c> newOrderItems) {
    OrderItemService.calculateAmount(newOrderItems);
  }
}
