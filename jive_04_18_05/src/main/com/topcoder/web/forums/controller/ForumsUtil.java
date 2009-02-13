/*
 * Created on Jun 14, 2005
 */
package com.topcoder.web.forums.controller;

import java.util.Iterator;

import com.jivesoftware.base.Filter;
import com.jivesoftware.base.FilterManager;
import com.jivesoftware.base.JiveConstants;
import com.jivesoftware.base.JiveGlobals;
import com.jivesoftware.base.Log;
import com.jivesoftware.base.filter.Profanity;

import com.jivesoftware.forum.ForumCategory;
import com.jivesoftware.forum.ForumMessage;
import com.jivesoftware.forum.ForumThread;
import com.jivesoftware.forum.QueryResult;
import com.jivesoftware.forum.ResultFilter;
import com.jivesoftware.forum.database.DbForumFactory;
import com.jivesoftware.forum.database.DbForumMessage;
import com.jivesoftware.util.StringUtils;

/**
 * @author mtong
 */
public class ForumsUtil {
    private static boolean filterHTMLEnabled
        = JiveGlobals.getJiveBooleanProperty("search.filterHTMLEnabled",true);
    
    // use until Jive fixes its version of ForumThread.getLatestMessage()
    public static ForumMessage getLatestMessage(ForumThread thread) {
        ForumMessage lastPost = null;
        ResultFilter filter = new ResultFilter();
        filter.setSortOrder(ResultFilter.DESCENDING);
        filter.setSortField(JiveConstants.MODIFICATION_DATE);
        filter.setNumResults(1);
        Iterator messages = thread.getMessages(filter);
        if (messages.hasNext()) {
            lastPost = (ForumMessage)messages.next();
        }
        return lastPost;
    }
    
    /**
     * Returns the message's subject where the search term(s) appear.
     * @return the message's subject where the search term(s) appear.
     * @deprecated Use {@link #getHighlightedText(QueryResult)} instead
     */
    public static String getMessageSubjectPreview(ForumMessage message, String q) {
        if (message != null && q != null) {
            String[] queryWords = StringUtils.toLowerCaseWordArray(q);
            String subject = message.getUnfilteredSubject().trim();
            if (filterHTMLEnabled) {
                subject = StringUtils.stripTags(subject, true);
            }

            subject = StringUtils.highlightWords(subject, queryWords, "<b>", "</b>");

            // we special case the profanity filter since we want to filter that from the
            // output
            try {
                DbForumFactory factory = DbForumFactory.getInstance();
                DbForumMessage dbMessage = (DbForumMessage) factory.getMessage(message.getID());
                FilterManager manager = dbMessage.getForumThread().getForum().getFilterManager();
                Filter[] filters = manager.getFilters();
                boolean found = false;
                for (int i = 0; i < filters.length; i++) {
                    if (filters[i] instanceof Profanity) {
                        Profanity f = (Profanity) filters[i];
                        subject = f.doFilter(subject);
                        found = true;
                        break;
                    }
                }

                if (!found) {
                    // check up the tree recursively
                    ForumCategory cat = dbMessage.getForumThread().getForum().getForumCategory();
                    if (cat != null && !found) {
                        manager = cat.getFilterManager();
                        filters = manager.getFilters();
                        for (int i = 0; i < filters.length; i++) {
                            if (filters[i] instanceof Profanity) {
                                Profanity f = (Profanity) filters[i];
                                subject = f.doFilter(subject);
                                found = true;
                                break;
                            }
                        }

                        if (!found) {
                            cat = cat.getParentCategory();
                        }
                    }

                    // check global filters
                    if (!found) {
                        manager = DbForumFactory.getInstance().getFilterManager();
                        filters = manager.getFilters();
                        for (int i = 0; i < filters.length; i++) {
                            if (filters[i] instanceof Profanity) {
                                Profanity f = (Profanity) filters[i];
                                subject = f.doFilter(subject);
                                found = true;
                                break;
                            }
                        }
                    }
                }
            }
            catch (Exception e) {
                Log.error(e);
            }

            return subject;
        }
        else if (message != null) {
             return message.getSubject().trim();
        }

        return "";
    }
    
    /**
     * Returns a snippet of the message's body where the search term(s) appear.
     * @return a snippet of the message's body where the search term(s) appear.
     * @deprecated Use {@link #getHighlightedText(QueryResult)} instead
     */
    public static String getMessageBodyPreview(ForumMessage message, String q) {
        if (message != null && q != null) {
            String[] queryWords = StringUtils.toLowerCaseWordArray(q);

            String body = message.getUnfilteredBody().trim();
            if (filterHTMLEnabled) {
                body = StringUtils.stripTags(body, true);
            }
            body = StringUtils.chopAtWordsAround(body, queryWords, 100);
            if (body.length() > 100) {
                body += " ...";
            }
            if (!filterHTMLEnabled) {
                body = StringUtils.escapeHTMLTags(body);
            }
            body = StringUtils.highlightWords(body, queryWords, "<b>", "</b>");

            // we special case the profanity filter since we want to filter that from the
            // output
            try {
                DbForumFactory factory = DbForumFactory.getInstance();
                DbForumMessage dbMessage = (DbForumMessage) factory.getMessage(message.getID());
                FilterManager manager = dbMessage.getForumThread().getForum().getFilterManager();
                Filter[] filters = manager.getFilters();
                boolean found = false;
                for (int i = 0; i < filters.length; i++) {
                    if (filters[i] instanceof Profanity) {
                        Profanity f = (Profanity) filters[i];
                        body = f.doFilter(body);
                        found = true;
                        break;
                    }
                }

                if (!found) {
                    // check up the tree recursively
                    ForumCategory cat = dbMessage.getForumThread().getForum().getForumCategory();
                    if (cat != null && !found) {
                        manager = cat.getFilterManager();
                        filters = manager.getFilters();
                        for (int i = 0; i < filters.length; i++) {
                            if (filters[i] instanceof Profanity) {
                                Profanity f = (Profanity) filters[i];
                                body = f.doFilter(body);
                                found = true;
                                break;
                            }
                        }

                        if (!found) {
                            cat = cat.getParentCategory();
                        }
                    }

                    // check global filters
                    if (!found) {
                        manager = DbForumFactory.getInstance().getFilterManager();
                        filters = manager.getFilters();
                        for (int i = 0; i < filters.length; i++) {
                            if (filters[i] instanceof Profanity) {
                                Profanity f = (Profanity) filters[i];
                                body = f.doFilter(body);
                                found = true;
                                break;
                            }
                        }
                    }
                }
            }
            catch (Exception e) {
                Log.error(e);
            }

            return body;
        }
        return null;
    }
}
