@isTest
public with sharing class TestLeadTriggerHandler {
  @isTest
  public static void testOnBeforeInsert() {
    Lead testLead = TestDataFactory.createLead('LeadTriggerHandler');
    testLead.CountryCode = 'PL';
    insert testLead;

    Map<String, Country_Region_Mapping__c> countryRegionCnfg = TestDataFactory.createCountryRegionCnfg();

    testLead = [
      SELECT Region__c
      FROM Lead
      WHERE Id = :testLead
    ];
    Assert.areEqual(
      countryRegionCnfg.get(testLead.CountryCode).Region__c,
      testLead.Region__c
    );
  }

  @isTest
  public static void testOnBeforeUpdate() {
    Lead testLead = TestDataFactory.createLead('LeadTriggerHandler');
    insert testLead;

    testLead.CountryCode = 'PL';
    update testLead;

    Map<String, Country_Region_Mapping__c> countryRegionCnfg = TestDataFactory.createCountryRegionCnfg();

    testLead = [
      SELECT Region__c
      FROM Lead
      WHERE Id = :testLead
    ];
    Assert.areEqual(
      countryRegionCnfg.get(testLead.CountryCode).Region__c,
      testLead.Region__c
    );
  }
}
