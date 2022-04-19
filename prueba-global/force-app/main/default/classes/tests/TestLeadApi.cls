@IsTest
public with sharing class TestLeadApi {
    @IsTest static void TestGetLeads() {
        Lead[] expectedLeads=[SELECT Id, Name, Email, Company, Website, Phone FROM Lead];
        Lead[] responseLeads=leadApi.getLeads();
        System.assertEquals(expectedLeads, responseLeads);
    }
}
