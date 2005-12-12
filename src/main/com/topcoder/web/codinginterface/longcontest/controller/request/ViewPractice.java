package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.codinginterface.longcontest.model.LongContest;
import com.topcoder.web.common.TCWebException;

import java.util.Date;
import java.util.Map;
import java.util.Vector;

public class ViewPractice extends ViewActiveContests {

    protected static final Logger log = Logger.getLogger(ViewPractice.class);

    protected void longContestProcessing() throws TCWebException {

        Vector contests = new Vector();

        try {
            // Data source
            DataAccessInt dai = getDataAccess();

            // Prepare data request
            Request r = new Request();
            r.setContentHandle("long_contest_round_view_practice");

            Map m = dai.getData(r);

            // Get the practice rounds
            ResultSetContainer rsc = (ResultSetContainer) m.get("long_contest_round_practice");

            // Go through the practice rounds and build a list of them
            for (int i = 0; i < rsc.getRowCount(); i++) {

                LongContest longContest = new LongContest();

                // Get contest properties
                String contestName = rsc.getStringItem(i, "contest_name");
                long contestID = rsc.getLongItem(i, "contest_id");
                String roundName = rsc.getStringItem(i, "round_name");
                long roundID = rsc.getLongItem(i, "round_id");
                Date startTime = (Date) rsc.getItem(i, "start_time").getResultData();
                Date endTime = (Date) rsc.getItem(i, "end_time").getResultData();
                boolean hasStarted = true; // Practices don't have time contraints
                int numParticipants = getNumParticipants(dai, roundID);
                boolean usrRoundRegistered = true;

                // Save contest properties to be displayed later on
                longContest.setContestName(contestName);
                longContest.setRoundID(roundID);
                longContest.setRoundName(roundName);
                longContest.setStartTime(startTime);
                longContest.setEndTime(endTime);
                longContest.setCoderRegistered(usrRoundRegistered);
                longContest.setContestID(contestID);
                longContest.setStarted(hasStarted);
                longContest.setNumCompetitors(numParticipants);

                // Get the problem for the round
                RoundProblem prob = getRoundProblem(dai, roundID);

                if (prob != null) {
                    longContest.setComponentID(prob.getComponentID());
                    longContest.setProblemID(prob.getProblemID());
                    longContest.setProblemName(prob.getName());
                }

                longContest.setPassed(false);

                contests.add(longContest);
            }

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }

        // Store the list of practice contests in the http request
        getRequest().setAttribute(Constants.CONTEST_LIST_KEY, contests);

        setNextPage(Constants.PAGE_VIEW_PRACTICE);
        setIsNextPageInContext(true);
    }

    /**
     * Gets the number of participants in a round
     *
     * @param dai     Data source
     * @param roundID The round ID
     * @throws Exception Propagates unexpected exceptions
     * @return The number of participants in the specified round.
     */
    private int getNumParticipants(DataAccessInt dai, long roundID) throws Exception {
        Request r = new Request();
        ResultSetContainer rsc;
        try {
            r.setContentHandle("long_contest_round_num_participants");
            r.setProperty("rd", "" + roundID);
            Map m = dai.getData(r);
            rsc = (ResultSetContainer) m.get("long_contest_round_num_participants");
        } catch (Exception e) {
            log.error("Error occured executing DB command: getNumParticipants", e);
            throw e;
        }
        return rsc.getIntItem(0, 0);
    }

}
