package com.topcoder.web.tc.controller.request.data;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.datafeed.AllColumns;
import com.topcoder.web.common.datafeed.Column;
import com.topcoder.web.common.datafeed.CommandRunner;
import com.topcoder.web.common.datafeed.DataFeeder;
import com.topcoder.web.common.datafeed.RSCDataFeed;
import com.topcoder.web.common.datafeed.RSCParamDataFeed;
import com.topcoder.web.common.security.TCSAuthorization;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.common.security.DataResource;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 23, 2007
 * @deprecated this class has been moved to its own module and will be removed in the future
 */
public class ComponentProjectResultFeed extends Base {


    protected void businessProcessing() throws Exception {
        Request r = new Request();
        r.setContentHandle("dd_project_data");
        r.setProperty(Constants.PROJECT_ID, getRequest().getParameter(Constants.PROJECT_ID));

        DataResource resource = new DataResource(r.getContentHandle(), Constants.TCS_DW_DATASOURCE_ID);
        if (new TCSAuthorization(getUser()).hasPermission(resource)) {
            DataAccessInt da = getDataAccess(DBMS.TCS_DW_DATASOURCE_NAME, false);
            CommandRunner cmd = new CommandRunner(da, r);

            DataFeeder df = new DataFeeder("project_details");

            // Add general project information
            RSCDataFeed projectInfo = new RSCDataFeed(null, "project_info", cmd, "dd_project_info");
            AllColumns ac = new AllColumns("N/A");
            ac.replace(new Column("component", "component_name", "id", "component_id"));
            ac.replace(new Column("winner", "winner", "id", "winner_id"));
            ac.replace(new Column("stage", "stage", "id", "stage_id"));
            projectInfo.add(ac);

            df.add(projectInfo);

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

            getResponse().setContentType("text/xml");

            df.writeXML(getResponse().getOutputStream());

            getResponse().flushBuffer();


        } else {
            throw new PermissionException(getUser(), resource);
        }
    }
}