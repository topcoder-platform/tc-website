package com.topcoder.web.tc.controller.request.collegetour;

/**
 * @author cucu
 */
public class CompResults extends Base {

    protected void collegeTourProcessing() throws Exception {
        setNextPage("tc?module=IntroEventCompResults&eid=" + (getEventId() * 3 + 1002));
        setIsNextPageInContext(false);
    }
}
