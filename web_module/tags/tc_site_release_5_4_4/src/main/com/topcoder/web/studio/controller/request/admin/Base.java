package com.topcoder.web.studio.controller.request.admin;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.ContestProperty;

import java.text.SimpleDateFormat;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 2, 2006
 */
public abstract class Base extends ShortHibernateProcessor {

    protected void loadGeneralEditContestData() throws Exception {
        getRequest().setAttribute("docTypes", StudioDAOUtil.getFactory().getDocumentTypeDAO().getDocumentTypes());
        getRequest().setAttribute("contestStatuses", StudioDAOUtil.getFactory().getContestStatusDAO().getContestStatuses());

        getRequest().setAttribute("forums", getForumList());

    }

    protected ResultSetContainer getForumList() throws Exception {
        Request r = new Request();
        r.setContentHandle("forum_list");
        DataAccessInt da = new DataAccess(DBMS.STUDIO_DATASOURCE_NAME);
        return (ResultSetContainer) da.getData(r).get("forum_list");

    }

    protected void loadEditContestData(Contest contest) throws Exception {
        if (contest == null) {
            throw new IllegalArgumentException("null contest specified");
        }
        loadGeneralEditContestData();
        getRequest().setAttribute("contest", contest);

        SimpleDateFormat sdf = new SimpleDateFormat(Constants.JAVA_DATE_FORMAT);

        if (contest.getOverview() != null) {
            setDefault(Constants.CONTEST_PROPERTY + ContestProperty.CONTEST_OVERVIEW_TEXT,
                    contest.getOverview().getValue());
        }
        if (contest.getPrizeDescription() != null) {
            setDefault(Constants.CONTEST_PROPERTY + ContestProperty.PRIZE_DESCRIPTION,
                    contest.getPrizeDescription().getValue());
        }
        setDefault(Constants.CONTEST_STATUS_ID,
                contest.getStatus().getId());

        setDefault(Constants.CONTEST_ID, contest.getId());
        setDefault(Constants.CONTEST_NAME, contest.getName());
        setDefault(Constants.START_TIME, sdf.format(contest.getStartTime()));
        setDefault(Constants.END_TIME, sdf.format(contest.getEndTime()));

    }
}
