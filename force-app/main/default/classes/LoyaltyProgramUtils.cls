public with sharing class LoyaltyProgramUtils {

    private static Map<String, List<LoyaltyProgramConfiguration__mdt>> loyaltyProgramConfiguration {
        get {
            if (loyaltyProgramConfiguration==null) {

                loyaltyProgramConfiguration = new Map<String, List<LoyaltyProgramConfiguration__mdt>>();

                for(LoyaltyProgramConfiguration__mdt loyaltyProgram: [SELECT FIELDS(ALL) FROM LoyaltyProgramConfiguration__mdt ORDER BY AmountSpent__c DESC]) {

                    if(!loyaltyProgramConfiguration.containsKey(loyaltyProgram.get('Region__c'))) {
                        loyaltyProgramConfiguration.put(loyaltyProgram.get('Region__c'), new List<LoyaltyProgramConfiguration__mdt>());
                    } 
                    loyaltyProgramConfiguration.get(loyaltyProgram.get('Region__c')).add(loyaltyProgram);                  
                }               
            }
            return loyaltyProgramConfiguration;
        }
        set;
    }

    public static void setCustomerType(List<SObject> sObjects) {
        for(SObject sObj: sObjects){
            for(LoyaltyProgramConfiguration__mdt loyaltyProtram: loyaltyProgramConfiguration.get(sObj.get('Region__c'))) {
                if(sObj.get('AmountSpent__c') > loyaltyProgram.get('AmountSpent__c')) {
                    sObj.put('CustomerType__c', loyaltyProgram.get('DiscountLevel__c'));
                    sObj.put('Discount__c', loyaltyProgram.get('DiscountAmount__c'));
                }
            }
        }
    }
}