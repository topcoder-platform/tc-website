package com.topcoder.web.tc.controller.request.tournament.tco08;



public class SymposiumRegister extends SymposiumRegBase {


    @Override
    protected void dbProcessing() throws Exception {
        setNextPage("tournaments/tco08/symposium/symposiumRegister.jsp");
        setIsNextPageInContext(true);                        
    }

}
