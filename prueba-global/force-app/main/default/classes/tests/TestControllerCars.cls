@IsTest
public with sharing class TestControllerCars {
    @IsTest static void testGetAllCars(){
        Car__c[] resultCars=ControllerCars.getCars();
        Car__c[] expectedCars= [
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
        System.assertEquals(expectedCars, resultCars);
    }
}
