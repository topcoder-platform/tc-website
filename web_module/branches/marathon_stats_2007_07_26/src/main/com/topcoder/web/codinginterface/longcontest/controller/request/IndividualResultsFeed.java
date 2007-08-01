package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.datafeed.AllColumns;
import com.topcoder.web.common.datafeed.CommandRunner;
import com.topcoder.web.common.datafeed.DataFeeder;
import com.topcoder.web.common.datafeed.RSCDataFeed;
import com.topcoder.web.common.datafeed.Value;
import com.topcoder.web.common.security.TCSAuthorization;
import com.topcoder.web.tc.model.DataResource;

/**
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

        DataResource resource = new DataResource(r.getContentHandle());
        
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
            submissions.add(acSubm);

            df.add(submissions);

            
            RSCDataFeed testcases = new RSCDataFeed("testcases", "testcase", cmd, "dd_marathon_individual_results"); 
            AllColumns ac = new AllColumns("");
            ac.skip("round_id");
            ac.skip("coder_id");
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


/*
 * Your idea about including the details is fine with me. 
 *  What you call “row” I think should be submission.  
 *  If “time” is submission time, be sure to document that on the description page for the feed.   You can probably shorten “submission_number” to “number” if the parent element is “submission”.
 
<dd_marathon_individual_results>
<round_id>10086</round_id>
<coder_id>14883513</coder_id>
<handle>ZLATKO</handle>
<history>
    <submission>
        <number>1</number>
        <time>02.23.2007 21:16:29</time>
        <score>99.28</score>
        <language>C++</language>
    </submission>
     ...
</history>
<testcases>
    <row>
        <test_case_id>22685350</test_case_id>
        <score>1.0649955403405122</score>
        <processing_time>0</processing_time>
        <arguments>n = 10</arguments>
        <fatal_errors/>
    </row>
    ....
</testcases>
</dd_marathon_individual_results>

*/