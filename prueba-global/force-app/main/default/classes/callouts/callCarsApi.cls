global with sharing class callCarsApi {
    @future (callout=true)
    Public static void myMethod(String PostalCode)
    {
        Http http= new Http();
        HttpRequest request=new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://agsdev-ags.cs10.force.com/services/apexrest/v1/carsApi?zipcode='+PostalCode);
        request.setHeader('api-key', 'Ow8VcQTZTCWFsQYAUOjz');
        HttpResponse response=http.send(request);
        System.debug(response);
    }
}
