public with sharing class LoyaltyProgramUtils {

    List<LoyaltyProgramConfiguration__mdt> loyaltyProgramConfiguration = LoyaltyProgramConfiguration__mdt.getAll().values(); 
  
    static Map<String, List<CMT__mdt>> vfg {
        get {
            if (vfg==null) {
                vfg = new Map<String, String>();

            }
            return vfg;
        }
        set;
    }
}