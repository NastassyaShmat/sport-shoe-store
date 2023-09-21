@isTest
public with sharing class TestOrderItemTriggerHandler {
  @isTest
  public static void testOnBeforeInsert() {
    Contact testCnt = TestDataFactory.createContact(
      TestDataFactory.createAccount(false).Id,
      'OrderItemTriggerHandler'
    );
    insert testCnt;

    Order__c testOrder = TestDataFactory.createOrder(testCnt.Id);
    insert testOrder;

    OrderItem__c testOrderItem = TestDataFactory.createOrderItem(testOrder.Id);
    testOrderItem.Count__c = 5;
    insert testOrderItem;

    testOrderItem = [
      SELECT Amount__c
      FROM OrderItem__c
      WHERE Id = :testOrderItem
    ];
    Assert.areEqual(
      //where is located product price,
      testOrderItem.Amount__c
    );
  }
}
