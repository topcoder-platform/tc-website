package com.topcoder.web.creative.controller.request.admin;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.creative.Constants;
import com.topcoder.web.creative.dao.CreativeDAOUtil;
import com.topcoder.web.creative.model.Contest;
import com.topcoder.web.creative.model.ContestProperty;

import java.text.SimpleDateFormat;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 2, 2006
 */
public abstract class Base extends ShortHibernateProcessor {

    protected void loadEditContestData(Contest contest) {
        if (contest == null) {
            throw new IllegalArgumentException("null contest specified");
        }
        getRequest().setAttribute("contest", contest);
        getRequest().setAttribute("docTypes", CreativeDAOUtil.getFactory().getDocumentTypeDAO().getDocumentTypes());

        SimpleDateFormat sdf = new SimpleDateFormat(Constants.JAVA_DATE_FORMAT);

        if (contest.getOverview() != null) {
            setDefault(Constants.CONTEST_PROPERTY + ContestProperty.CONTEST_OVERVIEW_TEXT,
                    contest.getOverview().getValue());
        }
        if (contest.getPrizeDescription() != null) {
            setDefault(Constants.CONTEST_PROPERTY + ContestProperty.PRIZE_DESCRIPTION,
                    contest.getPrizeDescription().getValue());
        }

        setDefault(Constants.CONTEST_ID, contest.getId());
        setDefault(Constants.CONTEST_NAME, contest.getName());
        setDefault(Constants.START_TIME, sdf.format(contest.getStartTime()));
        setDefault(Constants.END_TIME, sdf.format(contest.getEndTime()));

    }
}
