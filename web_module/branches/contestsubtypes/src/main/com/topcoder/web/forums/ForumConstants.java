/*
 * Copyright (C) 2005 - 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.forums;

import com.jivesoftware.base.JiveGlobals;
import com.jivesoftware.forum.ForumPermissions;

/**
 * <p>This class contains the constants used by the forums EJB.</p>
 *
 * <p>
 * Version 1.1 (Release Assembly - TopCoder Cockpit Post Software Milestone Feedback to Forum)) Change notes:
 *   <ol>
 *     <li>Added {@link #QUESTION_FORUM_SUFFIX} constant.</li>
 *   </ol>
 * </p>
 * 
 * @author mtong, TCSASSEMBER
 * @version 1.1
 */
public interface ForumConstants {    
    public final static String CATEGORY_ID = "categoryID";
	public final static String FORUM_ID = "forumID";
	public final static String THREAD_ID = "threadID";
	public final static String MESSAGE_ID = "messageID";
	public final static String TEMP_MESSAGE_ID = "tmID";
    public final static String USER_ID = "userID";
    public final static String ANNOUNCEMENT_ID = "annID";
    public final static String POLL_ID = "pollID";
    
    public final static String FORUM_NAME = "name";
    public final static String FORUM_DESCRIPTION = "desc";
    public final static int FORUM_NAME_MAX_LENGTH = 250;
    public final static int FORUM_DESCRIPTION_MAX_LENGTH = 1000;
    
    public final static String THREAD_VIEW = "view";
    public final static String THREAD_ERROR = "error";
    
	public final static String MESSAGE_SUBJECT = "subject";
	public final static String MESSAGE_BODY = "body";
    public final static int MESSAGE_SUBJECT_MAX_LENGTH = 800;
    public final static int MESSAGE_BODY_MAX_LENGTH = 8000;
    public final static String MESSAGE_COUNT = "mc";
    
    public final static String ANNOUNCEMENT_SUBJECT = "subject";
    public final static String ANNOUNCEMENT_BODY = "body";
    public final static String ANNOUNCEMENT_COMMAND = "cmd";
	
    public final static String ATTACHMENT_ID = "attID";
    public final static String ATTACHMENT_ERROR = "attError";
    public final static String ATTACHMENT_CONTENT_TYPE = "attContentType";
    
	public final static String START_IDX = "start";
	public final static String POST_MODE = "mode";
    
    public final static String SETTINGS_SECTION = "section";
    public final static String MARK_READ = "markRead";

    public final static String SORT_FIELD = "sortField";
    public final static String SORT_ORDER = "sortOrder";
    
    public final static Long FORUM_MODERATE_PERMISSION = new Long(1);
    public final static Long FORUM_POST_PERMISSION = new Long(2);
    public final static Long FORUM_MODERATE_AND_POST_PERMISSION = new Long(3);


    public final static String EMAIL_ACTIVATE = "/authentication/emailActivate.jsp";

     /**
     * <p>
     * Represents the suffix for all the specification review comment forums.
     * </p>
     */
    public final static String SPEC_REVIEW_FORUM_SUFFIX = "Spec Review";
    
    /**
     * <p>
     * Represents the suffix for all the question forums.
     * </p>
     * 
     * @since 1.1
     */
    public final static String QUESTION_FORUM_SUFFIX = "Questions";
    
    /**
     * <p>
     * Represents the maximum no of characters the subject/title of a message
     * in the specification review comment forum may have.
     * </p>
     */
    public final static int SPEC_REVIEW_FORUM_MAX_CHAR_SUBJECT = 100;

    // Groups
    public final static String GROUP_SOFTWARE_MODERATORS_PREFIX = "Software_Moderators_";
    public final static String GROUP_SOFTWARE_USERS_PREFIX = "Software_Users_";
    public final static String GROUP_SOFTWARE_ADMINS = "Software Admins";
    
    // Extended Properties
    public final static String PROPERTY_HIDE_EMPTY_CATEGORIES = "hideEmptyCategories";
    public final static String PROPERTY_MERGE_EMPTY_CATEGORIES = "mergeEmptyCategories";    // merge with non-empty categories
    public final static String PROPERTY_HIDE_EMPTY_FORUMS = "hideEmptyForums";
    public final static String PROPERTY_HIDE_SEARCH_FORUMS = "hideSearchForums";
    public final static String PROPERTY_LEFT_NAV_NAME = "leftNavName";
    public final static String PROPERTY_DISPLAY_LIMIT = "displayLimit";
    public final static String PROPERTY_SORT = "sort";
    public final static String PROPERTY_SHOW_EMPTY_FORUMS_ON_MAIN = "showEmptyForumsOnMain";
    public final static String PROPERTY_HIDE_MAIN_RSS = "hideMainRSS";
    public final static String PROPERTY_LINK_NAMES = "linkNames";
    public final static String PROPERTY_LINK = "link";
    public final static String PROPERTY_MODIFY_FORUMS = "modifyForums";
    
    /* Some of the following software-related properties are now retrieved directly from the TCS database */
    
    /* See Catalog.JAVA_CATALOG, etc. Determines technology icon displayed by the ImageData. */
    //public final static String PROPERTY_COMPONENT_ROOT_CATEGORY_ID = "compRootCategoryId";
    
    /* See ComponentVersionInfo.COLLABORATION, etc. Determines phase icon displayed by the ImageData. */
    //public final static String PROPERTY_COMPONENT_PHASE = "componentPhase";		
    
    /* See ComponentInfo.APPROVED, etc. Only approved components are displayed. */
    //public final static String PROPERTY_COMPONENT_STATUS = "componentStatus";
    
    public final static String PROPERTY_COMPONENT_ID = "componentId";
    public final static String PROPERTY_COMPONENT_VERSION_ID = "compVersionId";
    public final static String PROPERTY_COMPONENT_VERSION_TEXT = "versionText";
    public final static String PROPERTY_COMPONENT_TECH_TYPES = "compTechTypes";

    public final static String PROPERTY_ARCHIVAL_STATUS = "archivalStatus";
    public final static String PROPERTY_ARCHIVAL_STATUS_ACTIVE = "1";
    public final static String PROPERTY_ARCHIVAL_STATUS_CLOSED = "2";
    
    // Admin
    public final static String ADMIN_COMMAND = "cmd";
    public final static String ADMIN_COMMAND_HTML_ESCAPE = "htmlEscape";
    public final static String ADMIN_COMMAND_ADD_CONTEST = "addContest";
    public final static String ADMIN_COMMAND_CREATE_FORUMS_ALGO = "createForumsAlgo";
    public final static String ADMIN_COMMAND_DELETE_FORUMS_ALGO = "deleteForumsAlgo";
    public final static String ADMIN_ENABLE_RATINGS = "enableRatings";
    public final static String ADMIN_CREATE_FORUM_FROM_EJB = "createForumFromEJB";
    public final static String ADMIN_CONVERT_TCS_FORUMS = "convertTCSForums";
    public final static String ADMIN_CONVERT_TCS_FORUM_PERMS = "convertTCSForumPerms";

    public final static String ADMIN_MATCH = "match";

    // Search
    public final static String SEARCH_QUERY = "query";
    public final static String SEARCH_SCOPE = "scope";
    public final static String SEARCH_DATE_RANGE = "dateRange";
    public final static String SEARCH_HANDLE = "handle";
    public final static String SEARCH_RESULT_SIZE = "resultSize";
    public final static String SEARCH_SORT_FIELD = "sort";
    public final static String SEARCH_MODE = "mode";
    public final static String SEARCH_MODE_BASIC = "basic";
    public final static String SEARCH_CATEGORY_RESULT_SIZE = "catResultSize";
    public final static String SEARCH_CATEGORY_START_IDX = "catStart";

    public final static String SEARCH_DATE_YESTERDAY = "dateYesterday";
    public final static String SEARCH_DATE_LAST_7_DAYS = "dateLast7Days";
    public final static String SEARCH_DATE_LAST_30_DAYS = "dateLast30Days";
    public final static String SEARCH_DATE_LAST_90_DAYS = "dateLast90Days";
    public final static String SEARCH_DATE_THIS_YEAR = "dateThisYear";
    public final static String SEARCH_DATE_LAST_YEAR = "dateLastYear";
    public final static String[] SEARCH_DATES = {
            SEARCH_DATE_YESTERDAY, SEARCH_DATE_LAST_7_DAYS, SEARCH_DATE_LAST_30_DAYS,
            SEARCH_DATE_LAST_90_DAYS, SEARCH_DATE_THIS_YEAR, SEARCH_DATE_LAST_YEAR
    };
    public final static String[] SEARCH_DATE_LABELS = {
            "Yesterday", "Last 7 Days", "Last 30 Days", "Last 90 Days", "This Year", "Last Year"
    };

    // Watches
    public final static String WATCH_TYPE = "type";
    public final static String WATCH_ID = "ID";
    public final static String WATCH_COMMAND = "cmd";
    public final static String WATCH_THREAD = "watchThread";

    public final static String WATCHES_UPDATE = "update";
    public final static String WATCHES_SAVE_THREAD = "save";
    public final static String WATCHES_DELETE_THREAD = "delete";

    // Statuses
	public final static String STATUS = "status";
	public final static String STATUS_CREATE = "create";
	public final static String STATUS_DELETE = "delete";
	public final static String STATUS_SAVE = "save";
	public final static String STATUS_UPDATE = "update";
    
    // Defaults
    public final static int DEFAULT_SEARCH_RANGE = 20;
    public final static int DEFAULT_SEARCH_CATEGORY_RANGE = 5;
    public final static int DEFAULT_MESSAGE_RANGE = 15;
    public final static int DEFAULT_THREAD_RANGE = 15;
    public final static int DEFAULT_FORUM_RANGE = 15;
    public final static int DEFAULT_HISTORY_RANGE = 10;
    
    public final static String DEFAULT_GUEST_THREAD_VIEW = "flat";
    public final static String DEFAULT_FLAT_THREAD_VIEW = "flat";
    
    public final static boolean DEFAULT_COLLAPSE_READ = true;
    public final static int DEFAULT_COLLAPSE_READ_DAYS = 3;
    public final static int DEFAULT_COLLAPSE_READ_POSTS = 100;
    public final static boolean DEFAULT_COLLAPSE_READ_SHOW_REPLIED = true;
    
    public final static int DEFAULT_RATING_HIGHLIGHT_THRESHOLD = 80;
    public final static int DEFAULT_RATING_HIGHLIGHT_MIN_COUNT = 10;
    public final static int DEFAULT_RATING_COLLAPSE_THRESHOLD = 40;
    public final static int DEFAULT_RATING_COLLAPSE_MIN_COUNT = 10;
    public final static int DEFAULT_RATING_COLLAPSE_MIN_MESSAGES = 50;

    // Maximums
    public final static int MAX_FORUMS_PER_PAGE = 50;
    public final static int MAX_THREADS_PER_PAGE = 100;
    public final static int MAX_MESSAGES_PER_PAGE = 100;
    public final static int MAX_SEARCH_RESULTS_PER_PAGE = 100;
    public final static int MAX_SEARCH_CATEGORY_RESULTS_PER_PAGE = 50;
    public final static int MAX_THREAD_WATCHES = 2000;
    public final static int MAX_DISPLAYED_FORUMS_PER_CATEGORY = 15;
    public final static int MAX_POLL_CHOICES = 100;

    // Permissions
    public final static long[] ANONYMOUS_PERMS = {
		ForumPermissions.READ_FORUM };
    public final static long[] REGISTERED_PERMS = {
		ForumPermissions.READ_FORUM, ForumPermissions.CREATE_THREAD, ForumPermissions.CREATE_MESSAGE,
		ForumPermissions.RATE_MESSAGE, ForumPermissions.CREATE_POLL, ForumPermissions.VOTE_IN_POLL};
    public final static long[] ADMIN_PERMS = {
    	ForumPermissions.READ_FORUM, ForumPermissions.CREATE_THREAD, ForumPermissions.CREATE_MESSAGE,
    	ForumPermissions.RATE_MESSAGE, ForumPermissions.CREATE_MESSAGE_ATTACHMENT, ForumPermissions.CREATE_POLL, 
    	ForumPermissions.VOTE_IN_POLL, ForumPermissions.ANNOUNCEMENT_ADMIN, ForumPermissions.FORUM_CATEGORY_ADMIN};
    public final static long[] MODERATOR_PERMS = {
    	ForumPermissions.READ_FORUM, ForumPermissions.CREATE_THREAD, ForumPermissions.CREATE_MESSAGE,
    	ForumPermissions.RATE_MESSAGE, ForumPermissions.FORUM_CATEGORY_ADMIN, 
    	ForumPermissions.CREATE_MESSAGE_ATTACHMENT, ForumPermissions.CREATE_POLL, ForumPermissions.VOTE_IN_POLL};
    public final static long[] SW_BLOCK_PERMS = {	    // permissions blocked in software component forums
    	ForumPermissions.READ_FORUM, ForumPermissions.CREATE_THREAD, ForumPermissions.CREATE_MESSAGE,
    	ForumPermissions.RATE_MESSAGE, ForumPermissions.CREATE_MESSAGE_ATTACHMENT, ForumPermissions.CREATE_POLL, 
    	ForumPermissions.VOTE_IN_POLL, ForumPermissions.ANNOUNCEMENT_ADMIN};
    
    // Error messages
    public final static String ERR_EMPTY_MESSAGE_SUBJECT =
        "Please include a message subject.";
    public final static String ERR_EMPTY_MESSAGE_BODY =
        "Please include a message body.";
    public final static String ERR_EMPTY_FORUM_NAME =
        "Please include a forum name.";
    public final static String ERR_CANNOT_POST_THREAD =
        "You do not have permission to post a new thread in this forum.";
    public final static String ERR_CANNOT_POST_MESSAGE =
        "You do not have permission to post a new message in this forum.";
    public final static String ERR_CANNOT_POST_ANNOUNCEMENT =
        "You do not have permission to post a new announcement.";
    public final static String ERR_CANNOT_EDIT_FOREIGN_POST =
    	"You cannot edit messages created by other users.";
    public final static String ERR_LONG_MESSAGE_SUBJECT =
        "Error: Message subject exceeds " + MESSAGE_SUBJECT_MAX_LENGTH + " characters.";
    public final static String ERR_LONG_MESSAGE_BODY =
        "Error: Message body exceeds " + MESSAGE_BODY_MAX_LENGTH + " characters.";
    public final static String ERR_LONG_FORUM_NAME =
        "Error: Forum name exceeds " + FORUM_NAME_MAX_LENGTH + " characters.";
    public final static String ERR_LONG_FORUM_DESCRIPTION =
        "Error: Forum description exceeds " + FORUM_DESCRIPTION_MAX_LENGTH + " characters.";
    public final static String ERR_FORUM_RANGE_EXCEEDED =
        "Error: Forum view range exceeded.";
    public final static String ERR_THREAD_RANGE_EXCEEDED =
        "Error: Thread view range exceeded.";
    public final static String ERR_MESSAGE_RANGE_EXCEEDED =
        "Error: Message view range exceeded.";
    public final static String ERR_MESSAGE_HISTORY_RANGE_EXCEEDED =
        "Error: Message view range for post history exceeded.";
    public final static String ERR_SEARCH_RANGE_EXCEEDED =
        "Error: Search result view range exceeded.";
    public final static String ERR_THREAD_WATCHES_EXCEEDED =
        "A maximum of " + MAX_THREAD_WATCHES + " threads can be watched. " +
        "Delete some watches in \"My Watches\" to free additional space.";
    public final static String ERR_NO_SEARCH_TERMS =
        "Please enter some search terms.";
    public final static String ERR_NO_SEARCH_HANDLE =
        "No user exists with the specified handle.";;
    public final static String ERR_ATTACHMENT_PERMS = 
    	"You are not authorized to create or modify attachments in this forum.";
    public final static String ERR_ATTACHMENT_DELETE_PERMS = 
    	"You are not authorized to delete this attachment.";
    public final static String ERR_ATTACHMENT_NOT_FOUND = 
    	"Message does not contain the specified attachment.";
    public final static String ERR_NO_POLL_ANSWER = 
    	"Please select an answer.";
    public final static String ERR_NO_POLL_ANSWERS = 
    	"Please select one or more answers.";

    // Occur when attempting to change the query string while posting a message
    public final static String ERR_POST_MODE_UNRECOGNIZED = "Post mode unrecognized.";

    // Constants based on Jive properties
    public static int maxThreadWatchesPerPage =
        JiveGlobals.getJiveIntProperty("skin.tc.maxThreadWatches", ForumConstants.MAX_THREAD_WATCHES);
    public static int maxForumsPerPage =
        JiveGlobals.getJiveIntProperty("skin.default.maxForumsPerPage", ForumConstants.MAX_FORUMS_PER_PAGE);
    public static int maxThreadsPerPage =
        JiveGlobals.getJiveIntProperty("skin.default.maxThreadsPerPage", ForumConstants.MAX_THREADS_PER_PAGE);
    public static int maxMessagesPerPage =
        JiveGlobals.getJiveIntProperty("skin.default.maxMessagesPerPage", ForumConstants.MAX_MESSAGES_PER_PAGE);
    public static int maxSearchResultsPerPage =
        JiveGlobals.getJiveIntProperty("skin.default.maxSearchResultsPerPage", ForumConstants.MAX_SEARCH_RESULTS_PER_PAGE);
    public static int maxSearchCategoryResultsPerPage =
        JiveGlobals.getJiveIntProperty("skin.default.maxSearchCategoryResultsPerPage", ForumConstants.MAX_SEARCH_CATEGORY_RESULTS_PER_PAGE);
}
