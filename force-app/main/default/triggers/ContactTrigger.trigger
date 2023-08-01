trigger ContactTrigger on Contact(before insert, before update) {
  List<Contact> contacts = new List<Contact>();
  Map<String, CountryRegionMapping__c> countryRegionMapping = CountryRegionMapping__c.getAll();

  for (Contact cnt : Trigger.new) {
    cnt.Region__c = countryRegionMapping[cnt.MailingAddress].Region__c;
    contacts.add(cnt);
  }
  insert contacts;
}
