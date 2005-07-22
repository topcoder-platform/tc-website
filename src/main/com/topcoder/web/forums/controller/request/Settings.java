/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.JiveConstants;
import com.jivesoftware.base.JiveGlobals;
import com.jivesoftware.base.Log;
import com.jivesoftware.forum.action.UserSettingsAction;
import com.jivesoftware.util.CronTimer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;

import java.text.ParseException;

/**
 * @author mtong
 *
 * Manages and saves user settings. Some functionality is replicated from Jive's UserSettingsAction.
 */
public class Settings extends ForumsProcessor {
    private int maxThreadsPerPage =
            JiveGlobals.getJiveIntProperty("skin.default.maxThreadsPerPage", ForumConstants.DEFAULT_MAX_THREADS_PER_PAGE);
    private int maxMessagesPerPage =
            JiveGlobals.getJiveIntProperty("skin.default.maxMessagesPerPage", ForumConstants.DEFAULT_MAX_MESSAGES_PER_PAGE);
    private int maxSearchResultsPerPage =
        JiveGlobals.getJiveIntProperty("skin.default.maxSearchResultsPerPage", ForumConstants.DEFAULT_MAX_SEARCH_RESULTS_PER_PAGE);

    // For watch email notification setting of "never"
    public final static int FREQUENCY_NEVER = -1;
    private int FREQUENCY_NEVER_YEAR = 1981;
    
	protected void businessProcessing() throws Exception {
		super.businessProcessing();
        if (isGuest()) {
        	throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        int watchFrequency = -1;
        String status = StringUtils.checkNull(getRequest().getParameter(ForumConstants.SETTINGS_STATUS));
        if (status.equals("save")) {
            int threadsPerPage = Integer.parseInt(getRequest().getParameter("threadsPerPage"));
            int messagesPerPage = Integer.parseInt(getRequest().getParameter("messagesPerPage"));
            int messagesPerHistoryPage = Integer.parseInt(getRequest().getParameter("messagesPerHistoryPage"));
            int resultsPerSearchPage = Integer.parseInt(getRequest().getParameter("resultsPerSearchPage"));
            String threadMode = getRequest().getParameter("threadMode");
            String displayMemberPhoto = getRequest().getParameter("displayMemberPhoto");
            String autoWatchNewTopics = getRequest().getParameter("autoWatchNewTopics");
            String autoWatchReplies = getRequest().getParameter("autoWatchReplies");
            watchFrequency = Integer.parseInt(getRequest().getParameter("watchFrequency"));

            if (threadsPerPage <= maxThreadsPerPage) {
            	user.setProperty(("jiveThreadRange"), String.valueOf(threadsPerPage));
            } else {
            	addError(ForumConstants.SETTINGS_STATUS, ForumConstants.ERR_THREAD_RANGE_EXCEEDED);
                status = "error";
            }
            if (messagesPerPage <= maxMessagesPerPage) {
            	user.setProperty(("jiveMessageRange"), String.valueOf(messagesPerPage));
            } else {
                addError(ForumConstants.SETTINGS_STATUS, ForumConstants.ERR_MESSAGE_RANGE_EXCEEDED);
                status = "error";
            }
            if (messagesPerHistoryPage <= maxMessagesPerPage) {
                user.setProperty(("jiveHistoryRange"), String.valueOf(messagesPerHistoryPage));
            } else {
                addError(ForumConstants.SETTINGS_STATUS, ForumConstants.ERR_MESSAGE_HISTORY_RANGE_EXCEEDED);
                status = "error";
            }
            if (resultsPerSearchPage <= maxSearchResultsPerPage) {
                user.setProperty(("jiveSearchRange"), String.valueOf(resultsPerSearchPage));
            } else {
                addError(ForumConstants.SETTINGS_STATUS, ForumConstants.ERR_SEARCH_RANGE_EXCEEDED);
                status = "error";
            }

            user.setProperty(("jiveThreadMode"), threadMode);
            user.setProperty(("jiveDisplayMemberPhoto"), displayMemberPhoto);
            user.setProperty(("jiveAutoWatchNewTopics"), autoWatchNewTopics);
            user.setProperty(("jiveAutoWatchReplies"), autoWatchReplies);

            CronTimer current = forumFactory.getWatchManager().getBatchTimer(user);
            if (current == null && watchFrequency != UserSettingsAction.FREQUENCY_IMMEDIATELY) {
                // We've received a request to create a new batch timer
                current = createCronTimer(watchFrequency);
                // update timer in the database
                forumFactory.getWatchManager().setBatchTimer(user, current);
            }
            else if (determineWatchFrequency(current) != watchFrequency) {
                CronTimer newTimer = null;

                if (watchFrequency != UserSettingsAction.FREQUENCY_IMMEDIATELY) {
                    newTimer = createCronTimer(watchFrequency);
                }

                // update timer in the database
                forumFactory.getWatchManager().setBatchTimer(user, newTimer);
            }
        } else {
            watchFrequency = UserSettingsAction.FREQUENCY_IMMEDIATELY;
            CronTimer timer = forumFactory.getWatchManager().getBatchTimer(user);
            if (timer != null) {
                watchFrequency = determineWatchFrequency(timer);
            }
        }

        getRequest().setAttribute("status", status);
        getRequest().setAttribute("selectedWatchFrequency", new Integer(watchFrequency));

		setNextPage("/userSettings.jsp");
		setIsNextPageInContext(true);
	}

    private int determineWatchFrequency(CronTimer timer) {
        // determine watch frequency
        if (timer == null) {
            return UserSettingsAction.FREQUENCY_IMMEDIATELY;
        }
        else if (timer.getCronExpression().endsWith(String.valueOf(FREQUENCY_NEVER_YEAR))) {
            return FREQUENCY_NEVER;
        }
        else if (timer.getNextFireTimeAfter(timer.getNextFireTime()).getTime() -
                timer.getNextFireTime().getTime() == JiveConstants.DAY) {
            return UserSettingsAction.FREQUENCY_ONCE_A_DAY;
        }
        else if (timer.getNextFireTimeAfter(timer.getNextFireTime()).getTime() -
                timer.getNextFireTime().getTime() == 2 * JiveConstants.DAY) {
            return UserSettingsAction.FREQUENCY_EVERY_OTHER_DAY;
        }
        else if (timer.getNextFireTimeAfter(timer.getNextFireTime()).getTime() -
                timer.getNextFireTime().getTime() == JiveConstants.WEEK) {
            return UserSettingsAction.FREQUENCY_ONCE_A_WEEK;
        }
        else {
            // unknown
            Log.warn("Unknown watch frequency for user " + user.getUsername() +
                    ": " + timer.getCronExpression());
            return UserSettingsAction.FREQUENCY_IMMEDIATELY;
        }
    }

    private CronTimer createCronTimer(int watchFrequency) {
        try {
            int minute = (int) (Math.random() * 60);
            // 3 am by default, configurable
            int hour = (JiveGlobals.getJiveProperty("watches.email.digest.time") == null)
                    ? 3
                    : Integer.parseInt(JiveGlobals.getJiveProperty("watches.email.digest.time"));
            String day = (JiveGlobals.getJiveProperty("watches.email.digest.day") == null)
                    ? "SUN"
                    : JiveGlobals.getJiveProperty("watches.email.digest.day");

            if (watchFrequency == UserSettingsAction.FREQUENCY_ONCE_A_DAY) {
                return new CronTimer("0 " + minute + " " + hour + " ? * *");
            }
            else if (watchFrequency == UserSettingsAction.FREQUENCY_EVERY_OTHER_DAY) {
                return new CronTimer("0 " + minute + " " + hour + " */2 * ?");
            }
            else if (watchFrequency == UserSettingsAction.FREQUENCY_ONCE_A_WEEK) {
                return new CronTimer("0 " + minute + " " + hour + " ? * " + day);
            }
            else if (watchFrequency == FREQUENCY_NEVER) {
                return new CronTimer("0 15 10 ? * 6L " + FREQUENCY_NEVER_YEAR);    // time in the past
            }
        }
        catch (ParseException e) {
            Log.error(e);
        }
        return null;
    }
}