@isTest
public class TestOrderItemTriggerHandler {
  @isTest
  public static void testOnBeforeInsert() {
    TestDataFactory.createCountryRegionCnfg(true);

    Contact testCnt = TestDataFactory.createContact(
      TestDataFactory.createAccount(true).Id,
      'OrderItemTriggerHandler'
    );
    testCnt.MailingCountryCode = 'PL';
    insert testCnt;

    Product2 testProd = new Product2(Name = 'Adidas NMD_R1');
    insert testProd;

    Id priceBookId = Test.getStandardPricebookId();
    PricebookEntry stdPBE = new PricebookEntry(
      Pricebook2Id = pricebookId,
      Product2Id = testProd.Id,
      UnitPrice = 100,
      IsActive = true
    );
    insert stdPBE;

    Pricebook2 customPB = new Pricebook2(
      Name = 'Custom Europe Pricebook',
      Region__c = 'Europe',
      isActive = true
    );
    insert customPB;

    PricebookEntry customPBE = new PricebookEntry(
      Pricebook2Id = customPB.Id,
      Product2Id = testProd.Id,
      UnitPrice = 120,
      IsActive = true
    );
    insert customPBE;

    Order__c testOrder = TestDataFactory.createOrder(testCnt.Id);
    testOrder.Shipping_Address__City__s = 'Test City';
    testOrder.Shipping_Address__Street__s = 'Test Street';
    testOrder.Shipping_Address__PostalCode__s = 'Test code';
    insert testOrder;

    OrderItem__c testOrderItem = TestDataFactory.createOrderItem(testOrder.Id);
    testOrderItem.Product__c = testProd.Id;
    testOrderItem.Count__c = 5;

    insert testOrderItem;

    testOrderItem = [
      SELECT Amount__c
      FROM OrderItem__c
      WHERE Id = :testOrderItem.Id
    ];
    Assert.areEqual(600, testOrderItem.Amount__c);
  }
}
