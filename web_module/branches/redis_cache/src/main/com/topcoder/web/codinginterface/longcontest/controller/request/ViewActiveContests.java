package com.topcoder.web.codinginterface.longcontest.controller.request;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.codinginterface.longcontest.model.LongContest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.ImageInfo;
import com.topcoder.web.ejb.roundregistration.RoundRegistration;
import com.topcoder.web.ejb.roundregistration.RoundRegistrationLocal;

/**
 * Displays active contests
 *
 * @author farsight, cucu
 * @version 1.0
 */
public class ViewActiveContests extends Base {

    protected static final Logger log = Logger.getLogger(ViewActiveContests.class);

    protected void longContestProcessing() throws TCWebException {

        User usr = getUser();

        // The collection of contests to display
        List<LongContest> contests = new ArrayList<LongContest>();

        try {
            // Data source
            DataAccessInt dai = getDataAccess();

            // Prepare a request to get active contest information
            Request r = new Request();
            //r.setContentHandle("long_contest_active_contests");
			// changed query that is called to allow discluding of hidden rounds
			r.setContentHandle("long_contest_active_contests_user");
			r.setProperty(Constants.CODER_ID, String.valueOf(getUser().getId()));

            // Fetch Data
            Map<String, ResultSetContainer> m = dai.getData(r);
            ResultSetContainer rsc = m.get("long_contest_active_contests_user");

            RoundRegistrationLocal reg =
                    (RoundRegistrationLocal) createLocalEJB(getInitialContext(), RoundRegistration.class);

            // Go through the list of active contests
            for (int i = 0; i < rsc.getRowCount(); i++) {

                LongContest longContest = new LongContest();

                // Store the values into a model
                longContest.setContestName(rsc.getStringItem(i, "contest_name"));
                longContest.setRoundID(rsc.getLongItem(i, "round_id"));
                longContest.setRoundName(rsc.getStringItem(i, "round_name"));
                longContest.setStartTime((Date) rsc.getItem(i, "start_time").getResultData());
                longContest.setEndTime((Date) rsc.getItem(i, "end_time").getResultData());
                longContest.setCoderRegistered(reg.exists(usr.getId(), rsc.getLongItem(i, "round_id")));
                longContest.setContestID(rsc.getLongItem(i, "contest_id"));
                longContest.setStarted(true);
                longContest.setNumCompetitors(rsc.getIntItem(i, "num_competitors"));
                longContest.setNumRegistrants(rsc.getIntItem(i, "num_registrants"));
                longContest.setSubmissionCount(rsc.getIntItem(i, "submission_count"));
                longContest.setRoundTypeId(rsc.getIntItem(i, "round_type_id"));
                if (rsc.getStringItem(i, "forum_id") != null) {
                    longContest.setForumId(rsc.getLongItem(i, "forum_id"));
                }
                if (rsc.getStringItem(i, "file_path") != null) {
                    longContest.setSponsorImage(makeImage(rsc.getRow(i)));
                }

                // Get the problem assigned to the round
                RoundProblem prob = getRoundProblem(dai, rsc.getLongItem(i, "round_id"));

                if (prob != null) {
                    longContest.setComponentID(prob.getComponentID());
                    longContest.setProblemID(prob.getProblemID());
                    longContest.setProblemName(prob.getName());
                }

                // Marks the contest as not passed
                longContest.setPassed(false);

                contests.add(longContest);

            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }

        
        getRequest().setAttribute("isAnonymous", usr.isAnonymous());
        getRequest().setAttribute(Constants.CONTEST_LIST_KEY, contests);

        setNextPage(Constants.PAGE_ACTIVE_CONTESTS);
        setIsNextPageInContext(true);
    }

    private ImageInfo makeImage(ResultSetContainer.ResultSetRow row) {
        ImageInfo image = new ImageInfo();
        image.setSrc(row.getStringItem("file_path"));
        image.setLink(row.getStringItem("link"));
        if (row.getItem("height").getResultData() != null) {
            image.setHeight(row.getIntItem("height"));
        }
        if (row.getItem("width").getResultData() != null) {
            image.setHeight(row.getIntItem("width"));
        }

        return image;
    }

    /**
     * Gets the problem for the specified round
     *
     * @param dai     Data source
     * @param roundID The round ID
     * @return The problem for the round
     * @throws Exception Propagates unexpected exceptions
     */
    protected RoundProblem getRoundProblem(DataAccessInt dai, long roundID) throws Exception {
        Request r = new Request();
        ResultSetContainer rsc;
        RoundProblem ret = null;
        try {
            r.setContentHandle("long_contest_round_problems");
            r.setProperty("rd", "" + roundID);
            Map m = dai.getData(r);
            rsc = (ResultSetContainer) m.get("long_contest_round_problems");
            if (rsc.size() > 0) {
                ret = new RoundProblem();
                ret.setComponentID(rsc.getLongItem(0, "component_id"));
                ret.setProblemID(rsc.getLongItem(0, "problem_id"));
                ret.setName(rsc.getStringItem(0, "name"));
            }
        } catch (Exception e) {
            log.error("Error occured executing DB command: long_contest_coder_registered", e);
            throw e;
        }
        return ret;
    }

    /**
     * Wraps the round problem data
     *
     * @author farsight
     */
    protected static class RoundProblem {

        private long componentID;
        private long problemID;
        private String name;

        public long getComponentID() {
            return componentID;
        }

        public void setComponentID(long componentID) {
            this.componentID = componentID;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public long getProblemID() {
            return problemID;
        }

        public void setProblemID(long problemID) {
            this.problemID = problemID;
        }

    }
}
