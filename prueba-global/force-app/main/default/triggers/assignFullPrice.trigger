trigger assignFullPrice on Car__c (after insert) {
    // Allow Bulk Apex triggers
    List<Car__c> carsRecords= new List<Car__c>([SELECT Price__c, Tax__c, Full_Price__c FROM Car__c WHERE (Id IN :Trigger.new)]);
    List<Car__c> carsToUpdate=new List<Car__c>();
    for(Car__c car:carsRecords){
        Integer priceCar= (Integer) car.Price__c;
        Integer taxCar= (Integer) car.Tax__c;
        car.Full_Price__c= priceCar + taxCar;
        carsToUpdate.add(car);
    }
    update carsToUpdate;
}