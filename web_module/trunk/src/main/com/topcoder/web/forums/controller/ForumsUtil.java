/*
 * Created on Jun 14, 2005
 */
package com.topcoder.web.forums.controller;

import com.jivesoftware.base.Filter;
import com.jivesoftware.base.FilterManager;
import com.jivesoftware.base.JiveConstants;
import com.jivesoftware.base.JiveGlobals;
import com.jivesoftware.base.Log;
import com.jivesoftware.base.filter.Profanity;
import com.jivesoftware.forum.ForumCategory;
import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ForumMessage;
import com.jivesoftware.forum.ForumThread;
import com.jivesoftware.forum.QueryResult;
import com.jivesoftware.forum.ResultFilter;
import com.jivesoftware.forum.database.DbForumFactory;
import com.jivesoftware.forum.database.DbForumMessage;
import com.jivesoftware.util.StringUtils;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;

import java.util.Iterator;
import java.util.ArrayList;

/**
 * @author mtong
 */
public class ForumsUtil {
    protected static Logger log = Logger.getLogger(BaseProcessor.class);
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
    
    // Returns forums in a category, with empty forums omitted or placed at the list's end.
    public static ArrayList getForums(ForumCategory forumCategory, ResultFilter resultFilter, 
            boolean excludeEmptyForums) {
        log.debug("$$$$$$$$$$$in getForums()");
        Iterator itForums = forumCategory.getForums(resultFilter);
        log.debug("$$$$$$$$$$$obtained forums()");
        ArrayList forumsList = new ArrayList();
        ArrayList emptyForums = new ArrayList();
        while (itForums.hasNext()) {
            Forum f = (Forum)itForums.next();
            //if (f.getMessageCount() > 0) {
            //    forumsList.add(f);
            //} else {
            //    emptyForums.add(f);
            //}
        }
        log.debug("$$$$$$$$$$$separated forums()");
        if (!excludeEmptyForums) {
            forumsList.addAll(emptyForums);
        }
        log.debug("$$$$$$$$$$$combined forums()");
        return forumsList;
    }
    
    // Returns one page of forums in a category
    public static ArrayList getForumsPage(ArrayList forumsList, int startIdx, int forumRange) {
        int endIdx = Math.min(startIdx+forumRange, forumsList.size());
        ArrayList pageList = new ArrayList();
        for (int i=startIdx; i<endIdx; i++) {
            pageList.add(forumsList.get(i));
        }
        return pageList;
    }
    
    // Returns the forum object's category hierarchy by increasing depth, starting from the root level.
    public static Iterator getCategoryTree(ForumCategory category) {
        ArrayList categoryList = new ArrayList();
        categoryList.add(category);
        while ((category = category.getParentCategory()) != null) {
            categoryList.add(0, category);
        }
        return categoryList.iterator();
    }
    public static Iterator getCategoryTree(Forum forum) {
        return getCategoryTree(forum.getForumCategory());
    }
    public static Iterator getCategoryTree(ForumThread thread) {
        return getCategoryTree(thread.getForum().getForumCategory());
    }
    public static Iterator getCategoryTree(ForumMessage message) {
        return getCategoryTree(message.getForum().getForumCategory());
    }
    
    public static String display(int numItems, String itemName) {
        StringBuffer ret = new StringBuffer();
        ret.append(numItems);
        ret.append(' ');
        ret.append(itemName);
        if (numItems != 1) {
            ret.append('s');
        }
        return ret.toString();
    }
}
