package com.topcoder.web.tc.controller.request.tournament.tco08;

import com.topcoder.web.common.BaseProcessor;


public class SymposiumRegister extends BaseProcessor {

    @Override
    protected void businessProcessing() throws Exception {
        setNextPage("tournaments/tco08/symposium/symposiumRegister.jsp");
        setIsNextPageInContext(true);                
    }

}
