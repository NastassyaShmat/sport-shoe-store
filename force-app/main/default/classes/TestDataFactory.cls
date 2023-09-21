@isTest
public with sharing class TestDataFactory {
  public static Account createAccount(Boolean doInsert) {
    Account acct = new Account();
    acct.Name = 'Test Account';

    if (doInsert) {
      insert act;
    }

    return acct;
  }

  public static Lead createLead(String lastName) {
    Lead testLead = new Lead();
    testLead.FirstName = 'Test';
    testLead.LastName = lastName;
    testLead.Company = 'TC';
    testLead.Status = 'contacted';

    return testLead;
  }

  public static Contact createContact(Id accountId, String lastName) {
    Contact cnt = new Contact(
      firstname = 'Test',
      lastname = lastName,
      AccountId = accountId.Id
    );

    return cnt;
  }

  public static Order__c createOrder(Id contactId) {
    Order__c order = new Order__c(Contanct__c = contactId);
    return order;
  }

  public static OrderItem__c createOrderItem(Id orderId) {
    OrderItem__c orderItem = new OrderItem__c(Order__c = orderId);
    return orderItem;
  }

  public static Map<String, Country_Region_Mapping__c> createCountryRegionCnfg() {
    List<Country_Region_Mapping__c> countryRegionMapping = new List<Country_Region_Mapping__c>{
      new Country_Region_Mapping__c(Country__c = 'PL', Region__c = 'Europe'),
      new Country_Region_Mapping__c(
        Country__c = 'CA',
        Region__c = 'North America'
      )
    };

    Map<String, Country_Region_Mapping__c> countryRegionCnfg = new Map<String, Country_Region_Mapping__c>();
    for (Country_Region_Mapping__c crm : countryRegionMapping) {
      countryRegionCnfg.put(crm.Country__c, crm);
    }
    return countryRegionCnfg;
  }

  public static Map<String, Responsible_Sales_Rep_Configuration__c> createResponsibleSalesRepCnfg() {
    List<Responsible_Sales_Rep_Configuration__c> respSalesRepMapping = new List<Responsible_Sales_Rep_Configuration__c>{
      new Responsible_Sales_Rep_Configuration__c(
        Country__c = 'PL',
        SalesRepId__c = '0057R00000DnpfA'
      ),
      new Responsible_Sales_Rep_Configuration__c(
        Country__c = 'CA',
        SalesRepId__c = '0057R00000DnpfG'
      )
    };

    Map<String, Responsible_Sales_Rep_Configuration__c> respSalesRepCnfg = new Map<String, Responsible_Sales_Rep_Configuration__c>();
    for (Responsible_Sales_Rep_Configuration__c rsr : respSalesRepMapping) {
      respSalesRepCnfg.put(rsr.Country__c, rsr);
    }
    return respSalesRepCnfg;
  }

  // public static List<Contact> createContactList(Integer numCntsPerAcct) {
  //   List<Contact> cnts = new List<Contact>();
  //   Account act = createAccount(true);
  //   for (Integer i = numContactsPerAcct; i < numContactsPerAcct; i++) {
  //     cnts.add(
  //       new Contact(
  //         firstname = 'Test' + i,
  //         lastname = 'Test' + i,
  //         AccountId = acct.Id
  //       )
  //     );
  //   }

  //   return cnts;
  // }
}
