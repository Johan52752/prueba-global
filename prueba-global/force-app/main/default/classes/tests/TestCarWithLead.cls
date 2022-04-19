@IsTest(SeeAllData=true)
public with sharing class TestCarWithLead {
    @IsTest static void TestGetCarWithLead() {
        Lead[] l=[SELECT Id FROM Lead WHERE Name='Johan Muñoz Ocampo'];
        System.debug(l);
        RestRequest request = new RestRequest();
        request.requestUri ='https://genlab-dev-ed.my.salesforce.com/services/apexrest/v1/carWithLead/';
        request.addParameter('id', l[0].Id);
        request.httpMethod = 'GET';
        RestContext.request = request;
        List<Lead> responseLead=carWithLead.getCarsWithLeadId();
        Lead[] expectedLead=[SELECT Name, (SELECT Full_name__c FROM Cars__r) FROM Lead WHERE Id=:l[0].Id];
        System.assertEquals(expectedLead[0].Cars__r[0], responseLead[0].Cars__r[0]);
    }
    @IsTest static void TestCreateCarWithLead(){
        Lead[] l=[SELECT Id FROM Lead WHERE Name='Johan Muñoz Ocampo'];
        Car__c carResponse=carWithLead.createCarByLeadId(l[0].Id, 'Car test', 'CCC-222', '2022', 10000, 5000, 2000);
        System.assert(carResponse.Id != null);
        Car__c thisCar=[SELECT Id, Name FROM Car__c WHERE Id=:carResponse.Id];
        System.assert(thisCar!=null);
        System.assertEquals(thisCar.Name, 'Car test');
    }
}
