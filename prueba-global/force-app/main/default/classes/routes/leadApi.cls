@RestResource(urlMapping='/v1/leadApi/*')
global with sharing class leadApi {
    @HttpGet
    global static List<Lead> getLeads(){
        RestRequest req=RestContext.request;
        RestResponse res=RestContext.response;
        Lead[] leadList=[SELECT Id, Name, Email, Company, Website, Phone FROM Lead];
        return leadList;
    }
}
