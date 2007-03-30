package com.topcoder.web.oracle.controller.request.admin;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.oracle.Constants;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.model.Contest;
import com.topcoder.web.oracle.model.Round;
import com.topcoder.web.oracle.model.RoundProperty;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 27, 2007
 */
abstract class Base extends ShortHibernateProcessor {
    protected static final Integer[] ROUND_PROPS = {RoundProperty.MAX_SELECTED_CANDIDATES,
            RoundProperty.NUMBER_OF_CANDIDDATE_ADVANCERS};

    

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



    protected void loadGeneralEditRoundData() throws Exception {
        getRequest().setAttribute("roundStatuses", OracleDAOUtil.getFactory().getRoundStatusDAO().getRoundStatuses());
    }


    protected void loadEditRoundData(Round round) throws Exception {
        if (round == null) {
            throw new IllegalArgumentException("null round specified");
        }
        loadGeneralEditContestData();
        getRequest().setAttribute("round", round);


/*        ContestPropertyDAO dao = OracleDAOUtil.getFactory().getRoundPropertyDAO();
        ContestConfig temp;
        for (int i = 0; i < CONTEST_PROPS.length; i++) {
            temp = contest.getConfig(dao.find(CONTEST_PROPS[i]));
            if (temp != null) {
                setDefault(Constants.CONTEST_PROPERTY + CONTEST_PROPS[i], temp.getValue());
            }
        }*/


        setDefault(Constants.ROUND_STATUS_ID, round.getStatus().getId());
        setDefault(Constants.ROUND_ID, round.getId());
        setDefault(Constants.ROUND_NAME, round.getName());
/*
        setDefault(Constants.START_TIME, sdf.format(contest.getStartTime()));
        setDefault(Constants.END_TIME, sdf.format(contest.getEndTime()));
*/


    }


}
