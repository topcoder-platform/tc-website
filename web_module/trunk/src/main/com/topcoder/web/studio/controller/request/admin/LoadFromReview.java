package com.topcoder.web.studio.controller.request.admin;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.dao.SubmissionDAO;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.Submission;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 26, 2007
 */
public class LoadFromReview extends Base {

    protected void dbProcessing() throws Exception {

        String contestId = getRequest().getParameter(Constants.CONTEST_ID);

        if (!"".equals(StringUtils.checkNull(contestId))) {
            //load
            Contest contest = StudioDAOUtil.getFactory().getContestDAO().find(new Long(contestId));
            if (contest != null) {
                SubmissionDAO dao = StudioDAOUtil.getFactory().getSubmissionDAO();

                Request r = new Request();
                r.setContentHandle("or_results");
                r.setProperty(Constants.CONTEST_ID, contestId);
                DataAccessInt da = new DataAccess(DBMS.STUDIO_DATASOURCE_NAME);
                ResultSetContainer rsc = da.getData(r).get("project_list");

                Submission s;

                for (ResultSetContainer.ResultSetRow row : rsc) {
                    if (row.getItem("final_score").getResultData() == null) {
                        throw new NavigationException("Results not complete " + row.getLongItem("submission_id"));
                    }
                    s = dao.find(row.getLongItem("submission_id"));
                    s.getResult().setFinalScore(row.getFloatItem("final_score"));
                    s.getResult().setPlaced(row.getIntItem("placement"));
                }

            } else {
                throw new NavigationException("Invalid contest specified");
            }

        }


    }


}
