package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.codinginterface.techassess.Constants;

/**
 * User: dok
 * Date: Dec 22, 2004
 */
public class ViewProblemSetInner extends IndexInner {

    protected void businessProcessing() throws Exception {
        indexProcessing(Constants.PAGE_VIEW_PROBLEM_SET_INNER, Constants.RP_VIEW_PROBLEM_SET);
    }
}
