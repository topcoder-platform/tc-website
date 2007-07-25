package com.topcoder.web.oracle.controller.request.admin;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.oracle.Constants;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.model.Contest;
import com.topcoder.web.oracle.model.Phase;
import com.topcoder.web.oracle.model.Round;
import com.topcoder.web.oracle.model.RoundProperty;

import java.text.SimpleDateFormat;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 27, 2007
 */
abstract class Base extends ShortHibernateProcessor {
    protected static final Integer[] ROUND_PROPS = {RoundProperty.MAX_SELECTED_CANDIDATES,
            RoundProperty.NUMBER_OF_CANDIDDATE_ADVANCERS, RoundProperty.MAX_ROOM_SIZE};


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

        setDefault(Constants.CONTEST_STATUS_ID, contest.getStatus().getId());
        setDefault(Constants.CONTEST_TYPE_ID, contest.getType().getId());
        setDefault(Constants.CONTEST_ID, contest.getId());
        setDefault(Constants.CONTEST_NAME, contest.getName());
    }


    protected void loadGeneralEditRoundData() throws Exception {
        getRequest().setAttribute("roundStatuses", OracleDAOUtil.getFactory().getRoundStatusDAO().getRoundStatuses());

        Request r = new Request();
        r.setContentHandle("oracle_admin_contest_list");
        DataAccessInt da = new DataAccess(DBMS.STUDIO_DATASOURCE_NAME);
        getRequest().setAttribute("studio_contests", da.getData(r).get("oracle_admin_contest_list"));
    }


    protected void loadEditRoundData(Round round) throws Exception {
        if (round == null) {
            throw new IllegalArgumentException("null round specified");
        }
        loadGeneralEditRoundData();
        getRequest().setAttribute("round", round);

        for (Integer prop : ROUND_PROPS) {
            setDefault(Constants.ROUND_PROPERTY + prop, round.getConfigMap().get(prop));
        }

        SimpleDateFormat sdf = new SimpleDateFormat(Constants.JAVA_DATE_FORMAT);

        setDefault(Constants.ROUND_STATUS_ID, round.getStatus().getId());
        setDefault(Constants.ROUND_ID, round.getId());
        setDefault(Constants.ROUND_NAME, round.getName());
        setDefault(Constants.CONTEST_ID, round.getContest().getId());

        setDefault(Constants.START_TIME + Phase.REGISTRATION,
                sdf.format(round.getPhaseMap().get(Phase.REGISTRATION).getStartTime()));
        setDefault(Constants.END_TIME + Phase.REGISTRATION,
                sdf.format(round.getPhaseMap().get(Phase.REGISTRATION).getEndTime()));
        setDefault(Constants.START_TIME + Phase.SUBMISSION,
                sdf.format(round.getPhaseMap().get(Phase.SUBMISSION).getStartTime()));
        setDefault(Constants.END_TIME + Phase.SUBMISSION,
                sdf.format(round.getPhaseMap().get(Phase.SUBMISSION).getEndTime()));

    }


    protected void loadGeneralEditCandidateData() {
        getRequest().setAttribute("properties", OracleDAOUtil.getFactory().getCandidatePropertyDAO().getProperties());
    }

}
