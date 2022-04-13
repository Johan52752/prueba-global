@RestResource(urlMapping='/v1/carWithLead/*')
global with sharing class carWithLead {
    @HttpGet
    global static List<Lead> getCarsWithLeadId(){
        String id=RestContext.request.params.get('id');
        Lead[] lead=[SELECT Name, (SELECT Full_name__c FROM Cars__r) FROM Lead WHERE Id=:id];
        return lead;
    }

    @HttpPost
    global static Car__c createCarByLeadId(String leadId, String name, String registrationPlate, String modelYear, Integer price, Integer tax, Integer downPayment){
        Car__c newCar=new Car__c(Lead__c=leadId);
        newCar.Name=name;
        newCar.Registration_Plate__c=registrationPlate;
        newCar.Model_Year__c=modelYear;
        newCar.Price__c=price;
        newCar.Tax__c=tax;
        newCar.Down_Payment__c=downPayment;
        insert newCar;
        return newCar;
    }
}
