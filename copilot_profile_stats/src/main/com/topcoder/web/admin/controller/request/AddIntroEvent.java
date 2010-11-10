package com.topcoder.web.admin.controller.request;

import com.topcoder.web.common.NavigationException;

/**
 * @author cucu
 */
public class AddIntroEvent extends IntroEventBase {

    @Override
    protected void dbProcessing() throws Exception {

        boolean hasAlgo = "1".equals(getRequest().getParameter(HAS_ALGO));
        boolean hasComp = "1".equals(getRequest().getParameter(HAS_COMP));

        if (!hasAlgo && !hasComp) {
            throw new NavigationException("ha and/or hc parameters expected to be 1");
        }

        setEditIntroEventSelects(hasAlgo, hasComp, true);

        setDefault(SCHOOL_TYPE, "1");
        setDefault(USE_ROUND_SEL, "1");
        setDefault(COMPETITION_USE_ROUND_SEL, "1");
        setDefault(ALGO_REG_USE_TIMEZONE, "true");
        setDefault(COMP_REG_USE_TIMEZONE, "true");

        getRequest().setAttribute("hasAlgo", hasAlgo);
        getRequest().setAttribute("hasComp", hasComp);

        setNextPage("/editIntroEvent.jsp");
        setIsNextPageInContext(true);
    }


}
