public with sharing class controllerCars {
    public static List<Car__c> getCars(){
        Car__c[] carsRecords= [
                SELECT Name,
                    Model_Year__c,
                    Registration_Plate__c,
                    Full_name__c,
                    Price__c,
                    Tax__c,
                    Full_Price__c,
                    Leasing__c,
                    Down_Payment__c,
                    Lead__r.Name
                FROM Car__c
        ];
        return carsRecords;
    }
}
