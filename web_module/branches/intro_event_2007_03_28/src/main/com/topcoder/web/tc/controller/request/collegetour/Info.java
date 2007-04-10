package com.topcoder.web.tc.controller.request.collegetour;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 5, 2005
 */
public class Info extends Base {

    protected void collegeTourProcessing() throws Exception {
/*        loadConfigInfo();
        setNextPage("/collegetour/info.jsp");
        setIsNextPageInContext(true);*/
        
        setNextPage("tc?module=IntroEventAlgoInfo&eid" + (getEventId() * 3 + 1001));
        setIsNextPageInContext(false);

    }

}
