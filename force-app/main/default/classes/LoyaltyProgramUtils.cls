public with sharing class LoyaltyProgramUtils {

    private static Map<String, List<Loyalty_Program_Configuration__mdt>> loyaltyProgramConfiguration {
        get {
            if (loyaltyProgramConfiguration == null) {

                loyaltyProgramConfiguration = new Map<String, List<Loyalty_Program_Configuration__mdt>>();

                for (Loyalty_Program_Configuration__mdt loyaltyProgram: [SELECT Region__c, Discount_Level__c, Amount_Spent__c, Discount_Amount__c 
                                                                        FROM Loyalty_Program_Configuration__mdt ORDER BY Amount_Spent__c DESC]) {

                    if (!loyaltyProgramConfiguration.containsKey(loyaltyProgram.Region__c)) {
                        loyaltyProgramConfiguration.put(loyaltyProgram.Region__c, new List<Loyalty_Program_Configuration__mdt>());
                    } 
                    loyaltyProgramConfiguration.get(loyaltyProgram.Region__c).add(loyaltyProgram);                  
                }               
            }
            return loyaltyProgramConfiguration;
        }
        set;
    }

    public static void setContactCustomerType(List<Contact> contacts) {
        for(Contact cont: contacts){
            for(Loyalty_Program_Configuration__mdt loyaltyProgram: loyaltyProgramConfiguration.get((String)cont.get('Region__c'))) {
                if((Decimal)cont.get('Amount_Spent__c') > (Decimal)loyaltyProgram.get('Amount_Spent__c')) {
                    cont.put('Customer_Type__c', loyaltyProgram.get('Discount_Level__c'));
                    cont.put('Discount__c', loyaltyProgram.get('Discount_Amount__c'));
                }
            }
        }
    }
}