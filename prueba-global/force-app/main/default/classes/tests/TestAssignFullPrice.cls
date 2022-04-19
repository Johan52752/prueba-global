@IsTest(SeeAllData=true)
public with sharing class TestAssignFullPrice {
    @IsTest static void TestAssignFullPriceInCar() {
        Lead[] l=[SELECT Id FROM Lead WHERE Name='Johan Muñoz Ocampo'];
        String leadId=l[0].Id;
        String name='Car test';
        String registrationPlate='CCC-222';
        String modelYear='2022';
        Integer price=10000;
        Integer tax=5000;
        Integer downPayment=2000;
        Integer expectedFullPrice=price+tax;
        Car__c newCar=new Car__c(Lead__c=leadId);
        newCar.Name=name;
        newCar.Registration_Plate__c=registrationPlate;
        newCar.Model_Year__c=modelYear;
        newCar.Price__c=price;
        newCar.Tax__c=tax;
        newCar.Down_Payment__c=downPayment;
        insert newCar;
        Car__c newCar2=[SELECT Id, Full_Price__c FROM Car__c WHERE Id=:newCar.Id];
        System.assert(newCar2.Full_Price__c!=null);
        System.assertEquals(expectedFullPrice, newCar2.Full_Price__c);
    }
}
