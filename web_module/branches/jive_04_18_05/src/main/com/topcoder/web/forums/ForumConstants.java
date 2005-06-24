/*
 * Created on May 3, 2005
 */
package com.topcoder.web.forums;

/**
 * @author mtong
 */
public interface ForumConstants {
    public final static String FORUMS_DIR = "/forums/";
    
    public final static String CATEGORY_ID = "categoryID";
	public final static String FORUM_ID = "forumID";
	public final static String THREAD_ID = "threadID";
	public final static String MESSAGE_ID = "messageID";
    public final static String USER_ID = "userID";
	
    public final static String THREAD_VIEW = "view";
    public final static String THREAD_ERROR = "error";
    
	public final static String MESSAGE_SUBJECT = "subject";
	public final static String MESSAGE_BODY = "body";
    public final static int MESSAGE_SUBJECT_MAX_LENGTH = 800;
    public final static int MESSAGE_BODY_MAX_LENGTH = 8000;
    public final static String MESSAGE_COUNT = "mc";
	
	public final static String START_IDX = "start";
	
	public final static String POST_MODE = "mode";
    
    public final static String SETTINGS_STATUS = "status";
    
    public final static String SORT_FIELD = "sortField";
    public final static String SORT_ORDER = "sortOrder";
    
    // Search
    public final static String SEARCH_STATUS = "status";
    public final static String SEARCH_QUERY = "query";
    public final static String SEARCH_SCOPE = "scope";
    public final static String SEARCH_DATE_RANGE = "dateRange";
    public final static String SEARCH_HANDLE = "handle";
    public final static String SEARCH_RESULT_SIZE = "resultSize";
    public final static String SEARCH_SORT_FIELD = "sort";
    public final static String SEARCH_MODE = "mode";
    public final static String SEARCH_MODE_BASIC = "basic";
    
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
    public final static String WATCHLIST_STATUS = "status";
    public final static String WATCH_TYPE = "type";
    public final static String WATCH_ID = "ID";
    public final static String WATCH_COMMAND = "cmd";
    public final static String WATCH_THREAD = "watchThread";
    
    public final static String WATCHES_UPDATE = "update";
    public final static String WATCHES_SAVE_THREAD = "save";
    public final static String WATCHES_DELETE_THREAD = "delete";
    
    // Defaults
    public final static int DEFAULT_MAX_THREADS_PER_PAGE = 100;
    public final static int DEFAULT_MAX_MESSAGES_PER_PAGE = 100;
    public final static int DEFAULT_MAX_SEARCH_RESULTS_PER_PAGE = 100;
    public final static int DEFAULT_MAX_THREAD_WATCHES = 200;
    public final static int DEFAULT_SEARCH_RANGE = 20;
    public final static int DEFAULT_MESSAGE_RANGE = 15;
    public final static int DEFAULT_THREAD_RANGE = 15;  
    public final static int DEFAULT_HISTORY_RANGE = 10;
    public final static String DEFAULT_GUEST_THREAD_VIEW = "flat";
    
    // Error messages
    public final static String ERR_EMPTY_MESSAGE_SUBJECT =
        "Please include a message subject.";
    public final static String ERR_EMPTY_MESSAGE_BODY =
        "Please include a message body.";
    public final static String ERR_LONG_MESSAGE_SUBJECT =
        "Error: Message body exceeds " + MESSAGE_SUBJECT_MAX_LENGTH + " characters.";
    public final static String ERR_LONG_MESSAGE_BODY =
        "Error: Message body exceeds " + MESSAGE_BODY_MAX_LENGTH + " characters.";
    public final static String ERR_THREAD_RANGE_EXCEEDED =
        "Error: Thread view range exceeded.";
    public final static String ERR_MESSAGE_RANGE_EXCEEDED =
        "Error: Message view range exceeded.";
    public final static String ERR_MESSAGE_HISTORY_RANGE_EXCEEDED =
        "Error: Message view range for post history exceeded.";
    public final static String ERR_SEARCH_RANGE_EXCEEDED =
        "Error: Search result view range exceeded.";
    public final static String ERR_THREAD_WATCHES_EXCEEDED =
        "A maximum of " + DEFAULT_MAX_THREAD_WATCHES + " threads can be watched. " +
        "Delete some watches in \"My Watches\" to free additional space.";
    public final static String ERR_NO_SEARCH_TERMS = 
        "Please enter some search terms.";
    public final static String ERR_NO_SEARCH_HANDLE = 
        "No user exists with the specified handle.";
}
