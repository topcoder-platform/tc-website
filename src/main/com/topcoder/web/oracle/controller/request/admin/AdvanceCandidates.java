package com.topcoder.web.oracle.controller.request.admin;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.oracle.Constants;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.model.Round;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2007
 */
public class AdvanceCandidates extends ShortHibernateProcessor {
    protected void dbProcessing() throws Exception {
        //take a round id, figure out which candidates advanced.
        //take them, create a new round for the contest
        //and assign them to rooms

        //todo take which class to use for assignment from user

        String roundName = getRequest().getParameter(Constants.ROUND_NAME);
        String startTime = getRequest().getParameter(Constants.START_TIME);
        String endTime = getRequest().getParameter(Constants.END_TIME);
        //round name
        //round config properties

        //todo only accept post requests
        if (userLoggedIn()) {
            String roundId = getRequest().getParameter(Constants.ROUND_ID);
            if ("".equals(StringUtils.checkNull(roundId))) {
                throw new NavigationException("No round specified");
            } else {
                Integer rid;
                try {
                    rid = new Integer(roundId);
                } catch (NumberFormatException e) {
                    throw new NavigationException("Invalid round specified");
                }
                Round round = OracleDAOUtil.getFactory().getRoundDAO().find(rid);

                Round newRound = new Round();
                //newRound.setName();
            }
        }
    }
}
