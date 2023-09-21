@isTest
public with sharing class TestOrderTriggerHandler {
  @isTest
  public static void testOnBeforeInsert() {
    Contact testCnt = TestDataFactory.createContact(
      TestDataFactory.createAccount(false).Id,
      'OrderTriggerHandler'
    );
    testCnt.MailingCountryCode = 'CA';
    insert testCnt;

    Order__c testOrder = TestDataFactory.createOrder(testCnt.Id);
    insert testOrder;

    Map<String, Responsible_Sales_Rep_Configuration__c> respSalesRepCnfg = TestDataFactory.createResponsibleSalesRepCnfg();

    testOrder = [
      SELECT Responsible_Sales_Rep__c
      FROM Order__c
      WHERE Id = :testOrder
    ];
    Assert.areEqual(
      respSalesRepCnfg.get(testCnt.MailingCountryCode).SalesRepId__c,
      testOrder.Responsible_Sales_Rep__c
    );
  }

  @isTest
  public static void testOnBeforeUpdate() {
    Contact testCnt = TestDataFactory.createContact(
      TestDataFactory.createAccount(false).Id,
      'OrderTriggerHandler'
    );
    insert testCnt;

    Order__c testOrder = TestDataFactory.createOrder(testCnt.Id);
    insert testOrder;

    testCnt.MailingCountryCode = 'CA';
    update testCnt;
    update testOrder;

    Map<String, Responsible_Sales_Rep_Configuration__c> respSalesRepCnfg = TestDataFactory.createResponsibleSalesRepCnfg();

    testOrder = [
      SELECT Responsible_Sales_Rep__c
      FROM Order__c
      WHERE Id = :testOrder
    ];
    Assert.areEqual(
      respSalesRepCnfg.get(testCnt.MailingCountryCode).SalesRepId__c,
      testOrder.Responsible_Sales_Rep__c
    );
  }

  @isTest
  public static void testOnAfterUpdate() {
    Contact testCnt = TestDataFactory.createContact(
      TestDataFactory.createAccount(false).Id,
      'OrderTriggerHandler'
    );
    insert testCnt;

    Order__c testOrder = TestDataFactory.createOrder(testCnt.Id);
    insert testOrder;
    testOrder.Status__c = 'Completed';
    testOrder.Total_Amount__c = 1000;
    update testOrder;

    testCnt = [
      SELECT Amount_Spent__c
      FROM Contact
      WHERE Id = :testCnt
    ];
    Assert.areEqual(testOrder.Total_Amount__c, testCnt.Amount_Spent__c);
  }
}
