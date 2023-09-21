@isTest
public class TestRegionUtils {
  @isTest
  public static void testSetRegion() {
    List<Lead> testLeads = new List<Lead>{
      TestDataFactory.createLead('TestLead1'),
      TestDataFactory.createLead('TestLead2')
    };

    for (Lead lead : testLeads) {
      lead.CountryCode = 'PL';
    }

    insert testLeads;

    Map<String, Country_Region_Mapping__c> countryRegionCnfg = TestDataFactory.createCountryRegionCnfg();

    testLeads = [
      SELECT Region__c
      FROM Lead
      WHERE Id IN :testLead
    ];
    Assert.areEqual(
      countryRegionCnfg.get(testLeads[0].CountryCode).Region__c,
      testLeads[0].Region__c
    );
  }
}
