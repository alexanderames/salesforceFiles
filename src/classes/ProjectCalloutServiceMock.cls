@isTest
global class ProjectCalloutServiceMock implements HttpCalloutMock {
   	//Implement http mock callout here
   	global HTTPResponse respond(HTTPRequest request) {
	// Create a fake response
        HttpResponse response = new HttpResponse();
        response.setStatusCode(201);
        response.setStatus('Created');
        return response; 
	}
}