/*
 * Created on May 3, 2005
 */
package com.topcoder.web.forums;

/**
 * @author mtong
 */
public interface ForumConstants {
	public final static String FORUM_ID = "forumID";
	public final static String THREAD_ID = "threadID";
	public final static String MESSAGE_ID = "messageID";
    public final static String USER_ID = "userID";
	
    public final static String THREAD_VIEW = "threadView";
    
	public final static String MESSAGE_SUBJECT = "subject";
	public final static String MESSAGE_BODY = "body";
    public final static int MESSAGE_BODY_MAX_LENGTH = 8000;
	
	public final static String START_IDX = "start";
	
	public final static String POST_MODE = "mode";
    
    public final static String SETTINGS_STATUS = "status";
	
	public final static String FORUMS_DIR = "/forums/";
    
    public final static String ERR_EMPTY_MESSAGE_SUBJECT =
        "Error: Please include a message subject.";
    public final static String ERR_EMPTY_MESSAGE_BODY =
        "Error: Please include a message body.";
    public final static String ERR_LONG_MESSAGE_BODY =
        "Error: Message body exceeds " + MESSAGE_BODY_MAX_LENGTH + " characters.";
    public final static String ERR_THREAD_RANGE_EXCEEDED =
        "Error: Thread view range exceeded.";
    public final static String ERR_MESSAGE_RANGE_EXCEEDED =
        "Error: Message view range exceeded.";
    public final static String ERR_MESSAGE_HISTORY_RANGE_EXCEEDED =
        "Error: Message view range for post history exceeded.";
}
