public with sharing class OrderItemService {
    
    public static void calculateAmount(List<OrderItem__c> newOrderItems) {
        Set<Id> productIds = new Set<Id>();
        Set<Id> orderIds = new Set<Id>();     

        for (OrderItem__c orderItem: newOrderItems) {
            productIds.add(orderItem.Product__c);
            orderIds.add(orderItem.Order__c);
        }

        Map<Id, Order> ordersMap = new Map<Id, Order>([SELECT Contact__r.Region__c FROM Order WHERE Id IN :orderIds]);       
        Set<String> regions = new Set<String>();

        for(Order order: ordersMap.values()) {
            regions.add(order.Contact__r.Region__c);
        }

       List<PricebookEntry> priceBookEntryRecords = [SELECT Product2Id, UnitPrice, Product2.Region__c 
                                                    FROM PricebookEntry 
                                                    WHERE Product2Id IN :productIds 
                                                    AND Pricebook2Id IN :[SELECT Id FROM Pricebook2 WHERE Region__c IN :regions]];

        Map<String, PricebookEntry> priceBookEntryByKye = new Map<String, PricebookEntry>();

        for (PricebookEntry pbe: priceBookEntryRecords) {
            priceBookEntryByKye.put(pbe.Product2Id + pbe.Product2.Region__c, pbe);
        }
        
        for (OrderItem__c orderItem: newOrderItems){
            
            if(priceBookEntryByKye.containsKey(orderItem.Product__c + ordersMap.get(orderItem.Order__c).Contact__r.Region__c)) {
                orderItem.Amount__c = priceBookEntryByKye.get(orderItem.Product__c + ordersMap.get(orderItem.Order__c).Contact__r.Region__c).UnitPrice * orderItem.Count__c;
            }
        }
    }
}