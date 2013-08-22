/*
 * MatchRules.java
 *
 * Created on February 23, 2006, 3:34 PM
 *
 * To change this template, choose Tools | Options and locate the template under
 * the Source Creation and Management node. Right-click the template and choose
 * Open. You can then make changes to the template in the Source Editor.
 */

package com.topcoder.web.tc.controller.request.calendar;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.algo.RoundType;

/**
 * @author cstjohn
 */
public class MatchRules extends MatchInfo {

    protected void businessProcessing() throws TCWebException {
        super.businessProcessing();
    }

    protected void setForwardPage(int roundType) {
        if (RoundType.HS_SRM == roundType) {
            setNextPage("/calendar/hsSRMRules.jsp");
        } else if (RoundType.SRM == roundType) {
            setNextPage("/calendar/srmRules.jsp");
        } else if (RoundType.MARATHON == roundType || RoundType.MARATHON_QA == roundType) {
            setNextPage("/calendar/mmRules.jsp");
        } else {
            throw new IllegalArgumentException("invalid round type specified " + roundType);
        }
    }
}
