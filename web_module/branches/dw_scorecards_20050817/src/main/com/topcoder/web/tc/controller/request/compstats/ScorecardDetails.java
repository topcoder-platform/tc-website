/*
 * CompList.java
 *
 * Created on August 12, 2005 by Cucu
 *
 * To change this template, choose Tools | Options and locate the template under
 * the Source Creation and Management node. Right-click the template and choose
 * Open. You can then make changes to the template in the Source Editor.
 */

package com.topcoder.web.tc.controller.request.compstats;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.Constants;
import java.util.Iterator;
import java.util.Map;

/**
 *
 * @author cucu
 */
public class ScorecardDetails extends Base {



    protected void businessProcessing() throws TCWebException {
        try {
            Request r = new Request();

            String projectId = StringUtils.checkNull(getRequest().getParameter("pi"));
            String userId = StringUtils.checkNull(getRequest().getParameter("uid"));
            String reviewerId = getRequest().getParameter("rid");


            r.setContentHandle("get_scorecard");
            r.setProperty("pj", projectId);
            r.setProperty("cr", userId);  // FIX ok?

            ResultSetContainer rscScorecard = null;

            if (reviewerId == null) {
                // screening
                r.setProperty("??", reviewerId); // FIX

                rscScorecard = (ResultSetContainer) getDataAccess(true).getData(r).get("get_review_scorecard");

            } else {
                // review
                rscScorecard = (ResultSetContainer) getDataAccess(true).getData(r).get("get_screening_scorecard");
            }

            String scorecardId = rscScorecard.getStringItem(0, "scorecard_id");
            String scorecardTemplateId = rscScorecard.getStringItem(0, "scorecard_template_id");

            r = new Request();
            r.setContentHandle("scorecard_details");
            r.setProperty("", scorecardId); // FIX
            r.setProperty("", scorecardTemplateId); // FIX

            Map result = getDataAccess(true).getData(r);

            getRequest().setAttribute("resultMap", result);

            setNextPage("/compstats/scorecardDetails.jsp");
            setIsNextPageInContext(true);

        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}

/*
- COMMAND  get_scorecard

> query get_review_scorecard
select scorecard_id, scorecard_template_id
from submission_screening
where project_id = @pj@
and user_id = @FIX@

> query get_screening_scorecard
select scorecard_id, scorecard_template_id
from submission_review
where project_id = @pj@
and user_id = @FIX@
and reviewer_id = @FIX@

- COMMAND scorecard_details
query scorecard_details

select sq.question_text,
    sq.question_weight,
        sq.section_weight,
        sq.section_desc,
        sq.question_desc,
        (select evaluation_desc from evaluation_lu where evaluation_id = sr.evaluation_id) as evaluation,
        tr.num_tests,
        tr.num_passed,
        sjr.response_text,
    sjr.response_type_desc
FROM scorecard_question sq,
OUTER  scorecard_response sr, OUTER testcase_response tr,  OUTER subjective_response sjr
where
    sq.scorecard_question_id  = tr.scorecard_question_id
and sq.scorecard_question_id  = sr.scorecard_question_id
and sq.scorecard_question_id  = sjr.scorecard_question_id
and tr.scorecard_id = sr.scorecard_id
and tr.scorecard_id = sjr.scorecard_id
and tr.scorecard_id = @FIX@
and sq.scorecard_template_id = @FIX@
order by sq.sort, sjr.sort
*/