package com.topcoder.web.tc.controller.request.data;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.datafeed.AllColumns;
import com.topcoder.web.common.datafeed.Column;
import com.topcoder.web.common.datafeed.CommandRunner;
import com.topcoder.web.common.datafeed.DataFeeder;
import com.topcoder.web.common.datafeed.RSCDataFeed;
import com.topcoder.web.common.security.TCSAuthorization;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.common.security.DataResource;

/**
 * @author dok
 * @version $Revision: 70545 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 23, 2007
 * @deprecated this class has been moved to its own module and will be removed in the future
 */
public class ComponentProject extends Base {


    protected void businessProcessing() throws Exception {
        Request r = new Request();
        r.setContentHandle("dd_project_data");
        r.setProperty(Constants.PROJECT_ID, getRequest().getParameter(Constants.PROJECT_ID));

        DataResource resource = new DataResource(r.getContentHandle(), Constants.TCS_DW_DATASOURCE_ID);
        if (new TCSAuthorization(getUser()).hasPermission(resource)) {
            CommandRunner cmd = new CommandRunner(getDataAccess(DBMS.TCS_DW_DATASOURCE_NAME, true), r);

            DataFeeder df = new DataFeeder("project_details");

            // Add general project information
            RSCDataFeed projectInfo = new RSCDataFeed(null, "project_info", cmd, "dd_project_info");
            AllColumns ac = new AllColumns();
            ac.replace(new Column("component", "component_name", "id", "component_id"));
            ac.replace(new Column("winner", "winner", "id", "winner_id"));
            ac.replace(new Column("stage", "stage", "id", "stage_id"));
            projectInfo.add(ac);

            df.add(projectInfo);

            // Add reviewer information
            RSCDataFeed reviewers = new RSCDataFeed("reviewers", "reviewer", cmd, "dd_reviewers_for_project");
            ac = new AllColumns();
            ac.replace(new Column("reviewer", "reviewer", "id", "reviewer_id"));
            ac.replace(new Column("review_resp", "review_resp_desc", "id", "review_resp_id"));
            reviewers.add(ac);

            df.add(reviewers);

            // Add submission information
            RSCDataFeed submissions = new RSCDataFeed("submissions", "submission", cmd, "dd_submissions");
            ac = new AllColumns();
            ac.replace(new Column("coder", "coder", "id", "user_id"));
            ac.replace(new Column("score1", "score1", "review_resp_id", "score1_review_resp_id"));
            ac.replace(new Column("score2", "score2", "review_resp_id", "score2_review_resp_id"));
            ac.replace(new Column("score3", "score3", "review_resp_id", "score3_review_resp_id"));

            submissions.add(ac);
            df.add(submissions);

            getResponse().setContentType("text/xml");

            df.writeXML(getResponse().getOutputStream());

            getResponse().flushBuffer();


        } else {
            throw new PermissionException(getUser(), resource);
        }
    }

//project
    //project_id
    //component name
    //phase desc
    //category desc
    //posting date
    //submit by date
    //complete date
    //rating date
    //status desc
    //version text
    //num submissions passed review
    //num registrations
    //num submissions
    //num_valid submissions
    //winner id
    //winner handle
    //stage
    //digital run?

    //submission
    //handle
    //user id
    //
    //review
    //reviewer
    //user id
    //num appeals
    //num successful appeals
    //final score
    //raw score
    //reviewer responsibility


}