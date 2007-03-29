package com.topcoder.web.oracle.controller.request.admin;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.oracle.Constants;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.model.Contest;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 27, 2007
 */
abstract class Base extends ShortHibernateProcessor {
    protected void loadGeneralEditContestData() throws Exception {
        getRequest().setAttribute("contestStatuses", OracleDAOUtil.getFactory().getContestStatusDAO().getContestStatuses());
        getRequest().setAttribute("contestTypes", OracleDAOUtil.getFactory().getContestTypeDAO().getContestTypes());
        

    }


    protected void loadEditContestData(Contest contest) throws Exception {
        if (contest == null) {
            throw new IllegalArgumentException("null contest specified");
        }
        loadGeneralEditContestData();
        getRequest().setAttribute("contest", contest);


/*        ContestPropertyDAO dao = OracleDAOUtil.getFactory().getRoundPropertyDAO();
        ContestConfig temp;
        for (int i = 0; i < CONTEST_PROPS.length; i++) {
            temp = contest.getConfig(dao.find(CONTEST_PROPS[i]));
            if (temp != null) {
                setDefault(Constants.CONTEST_PROPERTY + CONTEST_PROPS[i], temp.getValue());
            }
        }*/


        setDefault(Constants.CONTEST_STATUS_ID, contest.getStatus().getId());
        setDefault(Constants.CONTEST_ID, contest.getId());
        setDefault(Constants.CONTEST_NAME, contest.getName());
/*
        setDefault(Constants.START_TIME, sdf.format(contest.getStartTime()));
        setDefault(Constants.END_TIME, sdf.format(contest.getEndTime()));
*/


    }



}
