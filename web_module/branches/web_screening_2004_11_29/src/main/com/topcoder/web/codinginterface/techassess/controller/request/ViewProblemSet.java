package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.codinginterface.techassess.Constants;

/**
 * User: dok
 * Date: Dec 22, 2004
 * Time: 3:13:10 PM
 */
public class ViewProblemSet extends Index {

    /* we really just need to load up the problem sets for this request
     * if it's too slow making them distinct requests, we can starting throwing
     * the problem sets in the session so we don't have to retrieve them.
     */
    protected void businessProcessing() throws Exception {
        indexProcessing(Constants.RP_VIEW_PROBLEM_SET_RESPONSE);
    }

}
