package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.codinginterface.longcontest.model.LongContest;
import com.topcoder.web.common.TCWebException;

import java.util.Date;
import java.util.Map;
import java.util.Vector;

/**
 * Displays active and a couple of pass contests
 *
 * @author farsight
 * @version 1.0
 */
public class ViewActiveContests extends Base {

    protected static final Logger log = Logger.getLogger(ViewActiveContests.class);

    protected void businessProcessing() throws TCWebException {

        User usr = getUser();

        // The collection of contests to display
        Vector contests = new Vector();

        try {
            // Data source
            DataAccessInt dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);

            // Prepare a request to get active contest information
            Request r = new Request();
            r.setContentHandle("long_contest_active_contests");

            // Fetch Data
            Map m = dai.getData(r);
            ResultSetContainer rsc = (ResultSetContainer) m.get("long_contest_active_contests");

            // Go through the list of active contests
            for (int i = 0; i < rsc.getRowCount(); i++) {

                LongContest longContest = new LongContest();

                // Store the values into a model
                longContest.setContestName(rsc.getStringItem(i, "contest_name"));
                longContest.setRoundID(rsc.getLongItem(i, "round_id"));
                longContest.setRoundName(rsc.getStringItem(i, "round_name"));
                longContest.setStartTime((Date) rsc.getItem(i, "start_time").getResultData());
                longContest.setEndTime((Date) rsc.getItem(i, "end_time").getResultData());
                longContest.setCoderRegistered(isCoderRoundRegistered(dai, rsc.getLongItem(i, "round_id"), usr.getId()));
                longContest.setContestID(rsc.getLongItem(i, "contest_id"));
                longContest.setStarted(rsc.getBooleanItem(i, "started"));
                longContest.setNumCompetitors(rsc.getIntItem(i, "num_competitors"));
                longContest.setNumRegistrants(rsc.getIntItem(i, "num_registrants"));

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

            if (rsc.getRowCount() < 5) { // list some pass contests
                Request reqPassContests = new Request();
                reqPassContests.setContentHandle("long_contest_pass_contests");
                Map mapPassContests = dai.getData(reqPassContests);
                ResultSetContainer rscPassContests = (ResultSetContainer) mapPassContests.get("long_contest_pass_contests");
                for (int i = 0; i < rscPassContests.getRowCount(); i++) {
                    if (rsc.getRowCount() + i + 1 >= 5) {
                        break;
                    }
                    LongContest longContest = new LongContest();

                    // Store the values into a model
                    longContest.setContestName(rscPassContests.getStringItem(i, "contest_name"));
                    longContest.setRoundID(rscPassContests.getLongItem(i, "round_id"));
                    longContest.setRoundName(rscPassContests.getStringItem(i, "round_name"));
                    longContest.setStartTime((Date) rscPassContests.getItem(i, "start_time").getResultData());
                    longContest.setEndTime((Date) rscPassContests.getItem(i, "end_time").getResultData());
                    longContest.setCoderRegistered(isCoderRoundRegistered(dai, rscPassContests.getLongItem(i, "round_id"), usr.getId()));
                    longContest.setContestID(rscPassContests.getLongItem(i, "contest_id"));
                    longContest.setNumCompetitors(rscPassContests.getIntItem(i, "num_competitors"));
                    longContest.setNumRegistrants(rscPassContests.getIntItem(i, "num_registrants"));

                    // Gets the problem for the round
                    RoundProblem prob = getRoundProblem(dai, rscPassContests.getLongItem(i, "round_id"));

                    if (prob != null) {
                        longContest.setComponentID(prob.getComponentID());
                        longContest.setProblemID(prob.getProblemID());
                        longContest.setProblemName(prob.getName());
                    }

                    // Marks this contest as a passed contest
                    longContest.setPassed(true);

                    contests.add(longContest);

                }
            }


        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }

        // Store the contests in the http request
        getRequest().setAttribute(Constants.CONTEST_LIST_KEY, contests);

        setNextPage(Constants.PAGE_ACTIVE_CONTESTS);
        setIsNextPageInContext(true);
    }

    /**
     * Gets the number of registrants for a specified round.
     *
     * @param dai     Data source
     * @param roundID The round's ID
     * @throws Exception
     * @return The number of registrants for a given round
     */
/*
    private int getNumRegistrants(DataAccessInt dai, long roundID) throws Exception {
        Request r = new Request();
        ResultSetContainer rsc;
        try {
            r.setContentHandle("long_contest_num_registered");
            r.setProperty("rd", "" + roundID);
            Map m = dai.getData(r);
            rsc = (ResultSetContainer) m.get("long_contest_num_registered");
        } catch (Exception e) {
            log.error("Error occured executing DB command: long_contest_num_registered", e);
            throw e;
        }
        return rsc.getIntItem(0, 0);
    }
*/

    /**
     * Determines whether the coder is registered for the specified round.
     *
     * @param dai     Data source
     * @param roundID The round's ID
     * @param coderID The coder's ID
     * @throws Exception Propagates unexpected exceptions
     * @return True if the coder is registered for the specified round, false otherwise.
     */
    private boolean isCoderRoundRegistered(DataAccessInt dai, long roundID, long coderID) throws Exception {
        Request r = new Request();
        ResultSetContainer rsc;
        log.debug("isCoderRoundRegistered called w/ roundID=" + roundID + " coderID=" + coderID);
        try {
            r.setContentHandle("long_contest_coder_registered");
            r.setProperty("rd", "" + roundID);
            r.setProperty("cr", "" + coderID);
            Map m = dai.getData(r);
            rsc = (ResultSetContainer) m.get("long_contest_coder_registered");
        } catch (Exception e) {
            log.error("Error occured executing DB command: long_contest_coder_registered", e);
            throw e;
        }
        return rsc.getIntItem(0, 0) > 0;
    }

    /**
     * Gets the problem for the specified round
     *
     * @param dai     Data source
     * @param roundID The round ID
     * @throws Exception Propagates unexpected exceptions
     * @return The problem for the round
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
