package com.topcoder.web.openaim.controller.request.admin;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.dwload.CacheClearer;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.openaim.Constants;
import com.topcoder.web.openaim.dao.OpenAIMDAOUtil;
import com.topcoder.web.openaim.dao.SubmissionDAO;
import com.topcoder.web.openaim.model.Contest;
import com.topcoder.web.openaim.model.ContestResult;
import com.topcoder.web.openaim.model.Submission;

/**
 * @author dok
 * @version $Revision: 68803 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 26, 2007
 */
public class LoadFromReview extends Base {

    protected void dbProcessing() throws Exception {

        String contestId = getRequest().getParameter(Constants.CONTEST_ID);

        if (!"".equals(StringUtils.checkNull(contestId))) {
            //load
            Contest contest = OpenAIMDAOUtil.getFactory().getContestDAO().find(new Long(contestId));
            if (contest != null) {
                SubmissionDAO dao = OpenAIMDAOUtil.getFactory().getSubmissionDAO();

                Request r = new Request();
                r.setContentHandle("or_results");
                r.setProperty(Constants.CONTEST_ID, contestId);
                DataAccessInt da = new DataAccess(DBMS.OPENAIM_DATASOURCE_NAME);
                ResultSetContainer rsc = da.getData(r).get("or_results");

                Submission s;

                for (ResultSetContainer.ResultSetRow row : rsc) {
                    if (row.getItem("final_score").getResultData() == null) {
                        throw new NavigationException("Results not complete " + row.getLongItem("submission_id"));
                    }
                    s = dao.find(row.getLongItem("submission_id"));
                    ContestResult cr;
                    if (s.getResult() == null) {
                        cr = new ContestResult(s);
                    } else {
                        cr = s.getResult();
                    }
                    cr.setFinalScore(row.getFloatItem("final_score"));
                    cr.setPlaced(row.getIntItem("placement"));
                }

                refreshCache(contest);

                setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY +
                        "=AdminViewSubmissions&" + Constants.CONTEST_ID + "=" + contestId);
                setIsNextPageInContext(false);
            } else {
                throw new NavigationException("Invalid contest specified");
            }

        }


    }


    private void refreshCache(Contest c) {
        try {
            //todo fix this to work with both caches
            log.debug("refreshing cache");
            String key = Constants.CONTEST_ID + "=" + c.getId();
            CacheClearer.removelike(key);
        } catch (Exception ignore) {
            ignore.printStackTrace();
        }
    }




}
