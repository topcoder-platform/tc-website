package com.topcoder.mpsqas.appletmanager;

import com.topcoder.ejb.MPSQASServices.MPSQASServices;
import com.topcoder.ejb.MPSQASServices.MPSQASServicesHome;
import com.topcoder.mpsqas.common.ApplicationConstants;
import com.topcoder.mpsqas.common.ContestInformation;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;

import javax.naming.InitialContext;
import java.util.ArrayList;

/**
 * A thread running in the background responsible for ongoing tasks like seeing
 * which problems have been used, logging chat, etc...
 */
public class BackgroundProcessor extends Thread {
    private long lastChatLog;
    private long lastUpcomingContestsCheck;
    private long lastPing;
    private ArrayList upcomingContests;
    private MainAppletProcessor mainAppletProcessor;
    private MPSQASServicesHome mpsqasHome; //MPSQAS bean home
    private static Logger log = Logger.getLogger(BackgroundProcessor.class);

    /**
     * Sets up the bean home and stores some information.
     *
     * @param map Handle on the main applet processor.
     */
    public BackgroundProcessor(MainAppletProcessor map) {
        mainAppletProcessor = map;

        try {
            InitialContext ctx = (InitialContext) TCContext.getInitial();
            mpsqasHome = (MPSQASServicesHome) ctx.lookup(ApplicationServer.MPSQAS_SERVICES);
        } catch (Exception e) {
            log.debug("Error getting MPSQASServices for Background processor\n");
            e.printStackTrace();
        }

        //set up timers
        lastChatLog = System.currentTimeMillis();
        lastUpcomingContestsCheck = 0;
        lastPing = System.currentTimeMillis();

        upcomingContests = new ArrayList();
    }

    /**
     * Checks every ApplicationConstants.BACKGROUND_CHECK seconds to see what
     * jobs it has to do and calls the methods to perform the jobs.
     */
    public void run() {
        while (!isInterrupted()) {
            log.debug("Checking tasks.");
            if (System.currentTimeMillis() - lastChatLog >
                    ApplicationConstants.CHAT_LOG_FREQUENCY) {
                logChat();
            }

            if (System.currentTimeMillis() - lastUpcomingContestsCheck >
                    ApplicationConstants.UPCOMING_CONTESTS_CHECK_FREQUENCY) {
                checkUpcomingContests();
            }

            if (System.currentTimeMillis() - lastPing >
                    ApplicationConstants.PING_FREQUENCY) {
                lastPing = System.currentTimeMillis();
                mainAppletProcessor.pingUsers();
            }

            try {
                sleep(ApplicationConstants.BACKGROUND_CHECK_FREQUENCY);
            } catch (Exception e) {
            }
        }
    }

    /**
     * Empties the stack queue and calls the bean to store the history in the
     * database.
     */
    private void logChat() {
        log.debug("Logging chat.");
        try {
            ArrayList chat = mainAppletProcessor.clearChatHistory();
            if (chat.size() > 0) {
                MPSQASServices ms = ((MPSQASServices) mpsqasHome.create());
                ms.logChat(chat);
            }
            lastChatLog = System.currentTimeMillis();
        } catch (Exception e) {
            log.debug("Error logging chat:");
            e.printStackTrace();
        }
    }

    /**
     * Gets a list of upcoming contests from the bean and stores the contest
     * information.  If any contest has ended since the last check, the bean's
     * wrapUpContest method is called, causing the status of the problems used
     * to be changed to "Used".
     */
    private void checkUpcomingContests() {
        log.debug("Checking upcoming contests.");

        try {
            MPSQASServices ms = (MPSQASServices) mpsqasHome.create();
            ArrayList contests = ms.getContests(-1);
            ArrayList newContests = new ArrayList();
            for (int i = 0; i < contests.size(); i++) {
                newContests.add(new Integer(
                        ((ContestInformation) contests.get(i)).getRoundId()));
            }

            for (int i = 0; i < upcomingContests.size(); i++) {
                if (newContests.indexOf(upcomingContests.get(i)) == -1)
                //contest used to be there, disappeared, must have happened
                {
                    int roundId = ((Integer) upcomingContests.get(i)).intValue();
                    ms.wrapUpContest(roundId);
                }
            }
            lastUpcomingContestsCheck = System.currentTimeMillis();
            upcomingContests = newContests;
        } catch (Exception e) {
            log.debug("Error analyzing upcoming contests:");
            e.printStackTrace();
        }
    }

}
