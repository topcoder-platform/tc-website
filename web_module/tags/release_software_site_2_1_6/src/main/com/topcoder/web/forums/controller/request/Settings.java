/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.JiveConstants;
import com.jivesoftware.base.JiveGlobals;
import com.jivesoftware.forum.action.UserSettingsAction;
import com.jivesoftware.util.CronTimer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;

import java.text.ParseException;

/**
 * @author mtong
 *         <p/>
 *         Manages and saves user settings. Some functionality is replicated from Jive's UserSettingsAction.
 */
public class Settings extends ForumsProcessor {

    // For watch email notification setting of "never"
    public final static int FREQUENCY_NEVER = -1;
    private int FREQUENCY_NEVER_YEAR = 2098;

    protected void businessProcessing() throws Exception {
        super.businessProcessing();
        if (isGuest()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        int watchFrequency = -1;
        String status = StringUtils.checkNull(getRequest().getParameter(ForumConstants.STATUS));
        if (status.equals("save")) {
            int forumsPerPage = Integer.parseInt(getRequest().getParameter("forumsPerPage"));
            int threadsPerPage = Integer.parseInt(getRequest().getParameter("threadsPerPage"));
            int messagesPerPage = Integer.parseInt(getRequest().getParameter("messagesPerPage"));
            int messagesPerHistoryPage = Integer.parseInt(getRequest().getParameter("messagesPerHistoryPage"));
            int resultsPerSearchPage = Integer.parseInt(getRequest().getParameter("resultsPerSearchPage"));
            String threadMode = getRequest().getParameter("threadMode");
            String flatMode = getRequest().getParameter("flatMode");
            String showPrevNextThreads = getRequest().getParameter("showPrevNextThreads");
            String displayMemberPhoto = getRequest().getParameter("displayMemberPhoto");
            String displayAllMemberPhotos = getRequest().getParameter("displayAllMemberPhotos");
            String autoWatchNewTopics = getRequest().getParameter("autoWatchNewTopics");
            String autoWatchReplies = getRequest().getParameter("autoWatchReplies");
            String markWatchesRead = getRequest().getParameter("markWatchesRead");
            watchFrequency = Integer.parseInt(getRequest().getParameter("watchFrequency"));

            String showRatings = getRequest().getParameter("showRatings");
            String ratingHighlightThreshold = getRequest().getParameter("ratingHighlightThreshold");
            String ratingHighlightMinCount = getRequest().getParameter("ratingHighlightMinCount");
            String ratingCollapseThreshold = getRequest().getParameter("ratingCollapseThreshold");
            String ratingCollapseMinCount = getRequest().getParameter("ratingCollapseMinCount");
            String ratingCollapseMinMessages = getRequest().getParameter("ratingCollapseMinMessages");

            String collapseRead = getRequest().getParameter("collapseRead");
            if (collapseRead == null) collapseRead = "false";
            String collapseReadDays = getRequest().getParameter("collapseReadDays");
            String collapseReadPosts = getRequest().getParameter("collapseReadPosts");
            String collapseReadShowReplied = getRequest().getParameter("collapseReadShowReplied");
            if (collapseReadShowReplied == null) collapseReadShowReplied = "false";

            checkMax(forumsPerPage, ForumConstants.maxForumsPerPage, "jiveForumRange", ForumConstants.ERR_FORUM_RANGE_EXCEEDED);
            checkMax(threadsPerPage, ForumConstants.maxThreadsPerPage, "jiveThreadRange", ForumConstants.ERR_THREAD_RANGE_EXCEEDED);
            checkMax(messagesPerPage, ForumConstants.maxMessagesPerPage, "jiveMessageRange", ForumConstants.ERR_MESSAGE_RANGE_EXCEEDED);
            checkMax(messagesPerHistoryPage, ForumConstants.maxMessagesPerPage, "jiveHistoryRange", ForumConstants.ERR_MESSAGE_HISTORY_RANGE_EXCEEDED);
            checkMax(resultsPerSearchPage, ForumConstants.maxSearchResultsPerPage, "jiveSearchRange", ForumConstants.ERR_SEARCH_RANGE_EXCEEDED);

            if (getRequest().getParameter("categoryResultsPerSearchPage") != null) {
                int categoryResultsPerSearchPage = Integer.parseInt(getRequest().getParameter("categoryResultsPerSearchPage"));
                checkMax(categoryResultsPerSearchPage, ForumConstants.maxSearchCategoryResultsPerPage, "jiveSearchCategoryRange", ForumConstants.ERR_SEARCH_RANGE_EXCEEDED);
            }

            if (hasErrors()) {
                status = "error";
            }

            user.setProperty("jiveThreadMode", threadMode);
            user.setProperty("jiveFlatMode", flatMode);
            user.setProperty("jiveDisplayMemberPhoto", displayMemberPhoto);
            user.setProperty("jiveDisplayAllMemberPhotos", displayAllMemberPhotos);
            user.setProperty("jiveShowPrevNextThreads", showPrevNextThreads);
            user.setProperty("jiveAutoWatchNewTopics", autoWatchNewTopics);
            user.setProperty("jiveAutoWatchReplies", autoWatchReplies);
            user.setProperty("markWatchesRead", markWatchesRead);

            user.setProperty("showRatings", showRatings);
            user.setProperty("ratingHighlightThreshold", ratingHighlightThreshold);
            user.setProperty("ratingHighlightMinCount", ratingHighlightMinCount);
            user.setProperty("ratingCollapseThreshold", ratingCollapseThreshold);
            user.setProperty("ratingCollapseMinCount", ratingCollapseMinCount);
            user.setProperty("ratingCollapseMinMessages", ratingCollapseMinMessages);

            user.setProperty("collapseRead", collapseRead);
            if (collapseReadDays != null) {
                user.setProperty("collapseReadDays", collapseReadDays);
            }
            if (collapseReadPosts != null) {
                user.setProperty("collapseReadPosts", collapseReadPosts);
            }
            if (collapseReadShowReplied != null) {
                user.setProperty("collapseReadShowReplied", collapseReadShowReplied);
            }

            CronTimer current = forumFactory.getWatchManager().getBatchTimer(user);
            if (current == null && watchFrequency != UserSettingsAction.FREQUENCY_IMMEDIATELY) {
                // We've received a request to create a new batch timer
                current = createCronTimer(watchFrequency);
                // update timer in the database
                forumFactory.getWatchManager().setBatchTimer(user, current);
            } else if (determineWatchFrequency(current) != watchFrequency) {
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
        getRequest().setAttribute(ForumConstants.SETTINGS_SECTION,
                getRequest().getParameter(ForumConstants.SETTINGS_SECTION));

        setNextPage("/userSettings.jsp");
        setIsNextPageInContext(true);
    }

    private int determineWatchFrequency(CronTimer timer) {
        // determine watch frequency
        if (timer == null) {
            return UserSettingsAction.FREQUENCY_IMMEDIATELY;
        } else if (timer.getCronExpression().endsWith(String.valueOf(FREQUENCY_NEVER_YEAR))) {
            return FREQUENCY_NEVER;
        } else if (timer.getNextFireTimeAfter(timer.getNextFireTime()).getTime() -
                timer.getNextFireTime().getTime() == JiveConstants.DAY) {
            return UserSettingsAction.FREQUENCY_ONCE_A_DAY;
        } else if (timer.getNextFireTimeAfter(timer.getNextFireTime()).getTime() -
                timer.getNextFireTime().getTime() == 2 * JiveConstants.DAY) {
            return UserSettingsAction.FREQUENCY_EVERY_OTHER_DAY;
        } else if (timer.getNextFireTimeAfter(timer.getNextFireTime()).getTime() -
                timer.getNextFireTime().getTime() == JiveConstants.WEEK) {
            return UserSettingsAction.FREQUENCY_ONCE_A_WEEK;
        } else {
            // unknown
            log.warn("Unknown watch frequency for user " + user.getUsername() +
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
            } else if (watchFrequency == UserSettingsAction.FREQUENCY_EVERY_OTHER_DAY) {
                return new CronTimer("0 " + minute + " " + hour + " */2 * ?");
            } else if (watchFrequency == UserSettingsAction.FREQUENCY_ONCE_A_WEEK) {
                return new CronTimer("0 " + minute + " " + hour + " ? * " + day);
            } else if (watchFrequency == FREQUENCY_NEVER) {
                return new CronTimer("0 15 10 ? * 6L " + FREQUENCY_NEVER_YEAR);    // time never reached
            }
        }
        catch (ParseException e) {
            log.error(e);
        }
        return null;
    }

    private void checkMax(int value, int maxValue, String property, String error) throws Exception {
        if (value <= maxValue) {
            user.setProperty((property), String.valueOf(value));
        } else {
            addError(ForumConstants.STATUS, error);
        }
    }
}