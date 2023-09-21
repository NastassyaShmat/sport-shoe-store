@isTest
public with sharing class TestContactService {
    @isTest
    public static void testCalculateTotalAmountSpent() {
        List<Contact> testCnts = TestDataFactory.createContactList(true, 1);
        List<Order__c> testOrders = TestDataFactory.createOrderList(testCnts[0].Id, 3);

        ContactService cntServiceCls = new ContactService();
        cntServiceCls.calculateTotalAmountSpent(testCnts);

        System.assertEquals(cnt.Amount_Spent__c, 360)
    }
}