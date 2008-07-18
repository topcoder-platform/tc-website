package com.topcoder.web.codinginterface.longcontest.controller.request.stats;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.codinginterface.longcontest.controller.request.Base;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.datafeed.AllColumns;
import com.topcoder.web.common.datafeed.Column;
import com.topcoder.web.common.datafeed.CommandRunner;
import com.topcoder.web.common.datafeed.DataFeeder;
import com.topcoder.web.common.datafeed.DateFormatter;
import com.topcoder.web.common.datafeed.RSCDataFeed;
import com.topcoder.web.common.datafeed.Value;
import com.topcoder.web.common.security.TCSAuthorization;
import com.topcoder.web.common.security.DataResource;

/**
 * Data feed to show history and results for a coder in a round.
 *
 * @author cucu
 */
public class IndividualResultsFeed extends Base {


    protected void longContestProcessing() throws Exception {
        String roundId = getRequest().getParameter(Constants.ROUND_ID);
        String coderId = getRequest().getParameter(Constants.CODER_ID);

        try {
            Integer.parseInt(coderId);
            Integer.parseInt(roundId);
        } catch (Exception e) {
            throw new NavigationException("Parameter " + Constants.CODER_ID + " or " + Constants.ROUND_ID + " not specified o not a valid number");
        }

        Request r = new Request();
        r.setContentHandle("dd_marathon_individual_results");
        r.setProperty(Constants.CODER_ID, coderId);
        r.setProperty(Constants.ROUND_ID, roundId);

        DataResource resource = new DataResource(r.getContentHandle(), Constants.DW_DATASOURCE_ID);

        if (new TCSAuthorization(getUser()).hasPermission(resource)) {
            DataAccessInt da = getDataAccess(DBMS.DW_DATASOURCE_NAME, false);
            CommandRunner cmd = new CommandRunner(da, r);

            String handle = "N/A";
            ResultSetContainer rsc = cmd.getData().get("dd_marathon_individual_results");
            if (rsc.size() > 0) {
                handle = rsc.getStringItem(0, "handle");
            }
            DataFeeder df = new DataFeeder("marathon_individual_results");

            df.add(new Value("round_id", roundId));
            df.add(new Value("coder_id", coderId));
            df.add(new Value("handle", handle));

            RSCDataFeed submissions = new RSCDataFeed("submissions", "submission", cmd, "dd_marathon_submission_history");
            AllColumns acSubm = new AllColumns("");
            acSubm.replace(new Column("time", "time", null, null, new DateFormatter()));

            submissions.add(acSubm);

            df.add(submissions);


            RSCDataFeed testcases = new RSCDataFeed("testcases", "testcase", cmd, "dd_marathon_individual_results");
            AllColumns ac = new AllColumns("");
            ac.skip("handle");

            testcases.add(ac);

            df.add(testcases);

            getResponse().setContentType("text/xml");

            df.writeXML(getResponse().getOutputStream());

            getResponse().flushBuffer();


        } else {
            throw new PermissionException(getUser(), resource);
        }
    }

}