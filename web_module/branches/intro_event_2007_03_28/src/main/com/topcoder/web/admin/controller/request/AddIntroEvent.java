package com.topcoder.web.admin.controller.request;

import com.topcoder.web.common.NavigationException;

/**
 * @author cucu
 */
public class AddIntroEvent extends IntroEventBase {

    @Override
    protected void dbProcessing() throws Exception {
        
        boolean hasAlgo = "1".equals(getRequest().getParameter("ha"));
        boolean hasComp = "1".equals(getRequest().getParameter("hc"));
        
        if (!hasAlgo && !hasComp) {
            throw new NavigationException("ha and/or hc parameters expected to be 1");
        }
        
        setEditIntroEventSelects(hasAlgo, hasComp);            

        setDefault("school_type", "1");
        setDefault("create_forum", "1");
        setDefault("use_round_sel", "1");
        
        getRequest().setAttribute("hasAlgo", hasAlgo);
        getRequest().setAttribute("hasComp", hasComp);
        
        setNextPage("/editIntroEvent.jsp");
        setIsNextPageInContext(true);
    }


}
