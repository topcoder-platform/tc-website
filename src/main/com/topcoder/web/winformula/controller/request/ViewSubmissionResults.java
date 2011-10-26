package com.topcoder.web.winformula.controller.request;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.winformula.Constants;
import com.topcoder.web.winformula.dao.WinformulaDAOUtil;
import com.topcoder.web.winformula.model.Submission;

import java.util.Date;

/**
 * @author dok
 * @version $Revision: 72012 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 18, 2007
 */
public class ViewSubmissionResults extends ShortHibernateProcessor {

    protected void dbProcessing() throws Exception {
        Long submissionId;

        try {
            submissionId = new Long(getRequest().getParameter(Constants.SUBMISSION_ID));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid Submission Specified");
        }

        Submission s = WinformulaDAOUtil.getFactory().getSubmissionDAO().find(submissionId);

        boolean isOver = new Date().after(s.getContest().getEndTime());

        if (!isOver && s.getResult() != null) {
            throw new NavigationException("Submissions are not available until the contest is over.");
        } else if (s.getResult()==null) {
            throw new NavigationException("Results are not available for this submission.");
        } else {
            DataAccess da = new CachedDataAccess(DBMS.WINFORMULA_DATASOURCE_NAME);
            Request r = new Request();
            r.setContentHandle("submission_results");
            r.setProperty(Constants.SUBMISSION_ID, s.getId().toString());
            getRequest().setAttribute("submission_results", da.getData(r));

            getRequest().setAttribute("submission", s);
            setNextPage("/submissionResult.jsp");
            setIsNextPageInContext(true);

        }

    }
}

