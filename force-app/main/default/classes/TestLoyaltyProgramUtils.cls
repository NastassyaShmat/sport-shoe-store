@isTest
private class TestLoyaltyProgramUtils {
  @isTest
  public static void testSetContactCustomerType() {
    List<Contact> testCnts = TestDataFactory.createContactList(true, 2);

    LoyaltyProgramUtils loyaltyProgramUtilsCls = new LoyaltyProgramUtils();
    loyaltyProgramUtilsCls.setContactCustomerType(testCnts);

    for (Contact cnt : [SELECT Region__c FROM Contact WHERE Id IN :testCnts]) {
        Assert.areEqual(expected, actual);
        //the same question as testRegionUtils
      }
  }
}
