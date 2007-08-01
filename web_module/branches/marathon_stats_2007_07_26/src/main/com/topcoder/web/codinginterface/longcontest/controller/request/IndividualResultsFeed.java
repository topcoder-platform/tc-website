package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.datafeed.AllColumns;
import com.topcoder.web.common.datafeed.CommandRunner;
import com.topcoder.web.common.datafeed.DataFeeder;
import com.topcoder.web.common.datafeed.RSCDataFeed;
import com.topcoder.web.common.security.TCSAuthorization;
import com.topcoder.web.tc.model.DataResource;

/**
 * @author cucu
 */
public class IndividualResultsFeed extends Base {


    protected void longContestProcessing() throws Exception {
        int coderId = Integer.parseInt(getRequest().getParameter(Constants.CODER_ID));
        int roundId = Integer.parseInt(getRequest().getParameter(Constants.ROUND_ID));

        Request r = new Request();
        r.setContentHandle("dd_marathon_individual_results");
        r.setProperty(Constants.CODER_ID, coderId + "");
        r.setProperty(Constants.ROUND_ID, roundId + "");

        DataResource resource = new DataResource(r.getContentHandle());
        
        if (new TCSAuthorization(getUser()).hasPermission(resource)) {
            DataAccessInt da = getDataAccess(DBMS.DW_DATASOURCE_NAME, false);
            CommandRunner cmd = new CommandRunner(da, r);

            DataFeeder df = new DataFeeder("individual_results");

            RSCDataFeed testcases = new RSCDataFeed("testcases", "testcase", cmd, "dd_marathon_individual_results"); 
            AllColumns ac = new AllColumns("");
//            ac.replace(new Column("component", "component_name", "id", "component_id"));
            testcases.add(ac);

            df.add(testcases);
            /*
            // Add reviewer information
            RSCDataFeed reviewers = new RSCDataFeed("reviewers", "reviewer", cmd, "dd_reviewers_for_project"); 
            ac = new AllColumns("N/A");
            ac.replace(new Column("reviewer", "reviewer", "id", "reviewer_id"));
            ac.replace(new Column("reviewer_role", "review_resp_desc", "id", "review_resp_id"));
            reviewers.add(ac);
            
            df.add(reviewers);

            // Add submission information
            RSCDataFeed submissions = new RSCDataFeed("submissions", "submission", cmd, "dd_submissions"); 
            ac = new AllColumns("N/A");
            ac.replace(new Column("coder", "coder", "id", "user_id"));
           
            submissions.add(ac);
            
            Request reqReview = new Request();
            reqReview.setContentHandle("dd_project_review");
            reqReview.setProperty(Constants.PROJECT_ID, getRequest().getParameter(Constants.PROJECT_ID));

            RSCParamDataFeed reviews = new RSCParamDataFeed("reviews", "review", da, reqReview, "dd_project_review");
            reviews.addParam("cr", "user_id");

            ac = new AllColumns("N/A");           
            ac.replace(new Column("reviewer", "reviewer_handle", "id", "reviewer_id"));
            ac.replace(new Column("reviewer_role", "review_resp_desc", "id", "review_resp_id"));
            reviews.add(ac);
            submissions.addChild(reviews);

            df.add(submissions);
            */
            getResponse().setContentType("text/xml");

            df.writeXML(getResponse().getOutputStream());

            getResponse().flushBuffer();


        } else {
            throw new PermissionException(getUser(), resource);
        }
    }
}
