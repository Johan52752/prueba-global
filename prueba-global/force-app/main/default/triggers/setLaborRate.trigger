
trigger setLaborRate on Lead (after insert) {
    List<Lead> leadsRecords=new List<Lead>([ SELECT Labor_Rate__c, PostalCode FROM Lead WHERE (Id IN :Trigger.New) ]);
    for (Lead l : leadsRecords) {
        callCarsApi.myMethod(l.PostalCode);
    }
}