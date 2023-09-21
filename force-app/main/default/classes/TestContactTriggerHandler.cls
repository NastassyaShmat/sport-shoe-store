@isTest
public with sharing class TestContactTriggerHandler {
  @isTest
  public static void testOnBeforeInsert() {
    Contact testCnt = TestDataFactory.createContact(
      TestDataFactory.createAccount(false).Id,
      'ContactTriggerHandler'
    );
    testCnt.MailingCountryCode = 'PL';
    insert testCnt;

    Map<String, Country_Region_Mapping__c> countryRegionCnfg = TestDataFactory.createCountryRegionCnfg();
    // for custom metadata don't need to cteate test data in dataFactory and it is private variable

    testCnt = [
      SELECT Region__c
      FROM Contact
      WHERE Id = :testCnt
    ];
    Assert.areEqual(
      countryRegionCnfg.get(testCnt.MailingCountryCode).Region__c,
      testCnt.Region__c
    );
  }

  public static void testOnBeforeUpdate() {
    Contact testCnt = TestDataFactory.createContact(
      TestDataFactory.createAccount(false).Id,
      'ContactTriggerHandler'
    );
    insert testCnt;

    Order testOrder = TestDataFactory.createOrder(testCnt.Id);
    testOrder.Total_Amount__c = 1000;
    testOrder.Status__c = 'Completed';

    testCnt.MailingCountryCode = 'CA';
    update testCnt;

    Map<String, Country_Region_Mapping__c> countryRegionCnfg = TestDataFactory.createCountryRegionCnfg();

    // for custom metadata don't need to cteate test data in dataFactory and it is private variable

    testCnt = [
      SELECT Region__c, Amount_Spent__c
      FROM Contact
      WHERE Id = :testCnt
    ];
    Assert.areEqual(
      countryRegionCnfg.get(testCnt.MailingCountryCode).Region__c,
      testCnt.Region__c
    );
    Assert.areEqual(testOrder.Total_Amount__c, testCnt.Amount_Spent__c);
  }
}
