public class AddressTriggerHelper {
    public static void onBeforeInsert(List<Address__c> newCountrycodeList, Map<id, Address__c> oldCountrycodeMap ){
        List<ISO_country_code__mdt> countryIsoList = [SELECT Label, Alpha_2__c,Alpha_3_Code__c,UN_Code__c FROM ISO_country_code__mdt];
        Map<String, String> countryNameByAlpha2 = new Map<String, String>();
        Map<String, String> countryNameByAlpha3 = new Map<String, String>();
        Map<String, String> countryNameByUnCode = new Map<String, String>();
        for(ISO_country_code__mdt countryIso : countryIsoList){
            countryNameByAlpha2.put(countryIso.Alpha_2__c, countryIso.label);
            countryNameByAlpha3.put(countryIso.Alpha_3_Code__c, countryIso.label);
            countryNameByUnCode.put(countryIso.UN_Code__c, countryIso.label);
        }
        for( Address__c  addrs : newCountrycodeList) {
            if(countryNameByAlpha2.containsKey(addrs.country_code__c)){
                addrs.country__c = countryNameByAlpha2.get(addrs.Country_Code__c);
            }
            if(countryNameByAlpha3.containsKey(addrs.country_code__c)){
                addrs.country__c = countryNameByAlpha3.get(addrs.Country_Code__c);
            }
            if(countryNameByUnCode.containsKey(addrs.country_code__c)){
                addrs.country__c = countryNameByUnCode.get(addrs.Country_Code__c);
            }
        }
        
    }
    
}