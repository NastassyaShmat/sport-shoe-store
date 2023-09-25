@isTest
public class TestRegionUtils {
  @isTest
  public static void testSetRegion() {
    List<Contact> testCnts = new List<Contact>{
      TestDataFactory.createContact(
        TestDataFactory.createAccount(false).Id,
        'TestContact1'
      ),
      TestDataFactory.createContact(
        TestDataFactory.createAccount(false).Id,
        'TestContact2'
      )
    };

    for (Contact cnt : testCnts) {
      cnt.MailingCountryCode = 'PL';
    }

    RegionUtils.setRegion(testCnts, 'MailingCountryCode', 'Region__c');

    Map<String, Country_Region_Mapping__c> countryRegionCnfg = TestDataFactory.createCountryRegionCnfg();

    Assert.areEqual(
      countryRegionCnfg.get(testCnts[0].MailingCountryCode).Region__c,
      testCnts[0].Region__c
    );
  }
}
