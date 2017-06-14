@isTest
global class ParkServiceMock implements WebServiceMock{
	global void doInvoke(
        Object stub,
        Object request,
        Map<String, Object> response,
        String endpoint,
        String soapAction,
        String requestName,
        String responseNS,
        String responseName,
        String responseType) {
      // start - specify response to send
      parkService.byCountryResponse response_x = new parkService.byCountryResponse();
      response_x.return_x = new List<String>{'Lal Bhag', 'CubbonPark', 'Pazhassi Dam'};
      //end
      response.put('response_x', response_x);
        }
}