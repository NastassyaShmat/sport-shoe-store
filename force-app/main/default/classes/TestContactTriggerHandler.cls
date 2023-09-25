@isTest
public with sharing class TestContactTriggerHandler {
  @isTest
  public static void testOnBeforeInsert() {
    Contact testCnt = TestDataFactory.createContact(
      TestDataFactory.createAccount(true).Id,
      'ContactTriggerHandler'
    );
    testCnt.MailingCountryCode = 'PL';
    insert testCnt;

    Map<String, Country_Region_Mapping__c> countryRegionCnfg = TestDataFactory.createCountryRegionCnfg();

    testCnt = [
      SELECT MailingCountryCode, Region__c
      FROM Contact
      WHERE Id = :testCnt.Id
    ];
    Assert.areEqual(
      countryRegionCnfg.get(testCnt.MailingCountryCode).Region__c,
      testCnt.Region__c
    );
  }

  @isTest
  public static void testOnBeforeUpdate() {
    Contact testCnt = TestDataFactory.createContact(
      TestDataFactory.createAccount(true).Id,
      'ContactTriggerHandler'
    );
    insert testCnt;

    testCnt.MailingCountryCode = 'CA';
    update testCnt;

    Map<String, Country_Region_Mapping__c> countryRegionCnfg = TestDataFactory.createCountryRegionCnfg();

    testCnt = [
      SELECT MailingCountryCode, Region__c, Amount_Spent__c
      FROM Contact
      WHERE Id = :testCnt.Id
    ];
    Assert.areEqual(
      countryRegionCnfg.get(testCnt.MailingCountryCode).Region__c,
      testCnt.Region__c
    );
  }
}
