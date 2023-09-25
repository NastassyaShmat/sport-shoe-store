@isTest
public class TestContactService {
  @isTest
  public static void testCalculateRegion() {
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
  public static void testCalculateCustomerType() {
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

  @isTest
  public static void testCalculateTotalAmountSpent() {
    List<Contact> testCnts = TestDataFactory.createContactList(true, 1);
    List<Order__c> testOrders = TestDataFactory.createOrderList(
      testCnts[0].Id,
      3
    );

    ContactService.calculateTotalAmountSpent(testCnts);

    System.assertEquals(cnt.Amount_Spent__c, 360);
  }
}
