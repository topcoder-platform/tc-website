/*
 * Created on Jun 14, 2005
 */
package com.topcoder.web.forums.controller;

import com.jivesoftware.base.Filter;
import com.jivesoftware.base.FilterManager;
import com.jivesoftware.base.JiveConstants;
import com.jivesoftware.base.JiveGlobals;
import com.jivesoftware.base.Log;
import com.jivesoftware.base.Permissions;
import com.jivesoftware.base.User;
import com.jivesoftware.base.filter.Profanity;
import com.jivesoftware.forum.ForumCategory;
import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ForumMessage;
import com.jivesoftware.forum.ForumThread;
import com.jivesoftware.forum.QueryResult;
import com.jivesoftware.forum.ResultFilter;
import com.jivesoftware.forum.RatingManager;
import com.jivesoftware.forum.database.DbForumFactory;
import com.jivesoftware.forum.database.DbForumMessage;
import com.jivesoftware.util.StringUtils;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.forums.util.filter.TCHTMLFilter;
import com.topcoder.web.forums.ForumConstants;

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
        Iterator itForums = forumCategory.getForums(resultFilter);
        ArrayList forumsList = new ArrayList();
        ArrayList emptyForums = new ArrayList();
        while (itForums.hasNext()) {
            Forum f = (Forum)itForums.next();
            if (f.getMessageCount() > 0) {
                forumsList.add(f);
            } else {
                emptyForums.add(f);
            }
        }
        if (!excludeEmptyForums) {
            forumsList.addAll(emptyForums);
        }
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

    public static boolean displayMemberPhoto(User user, User author) {
        if (user != null && "false".equals(user.getProperty("jiveDisplayAllMemberPhotos"))) {
            return false;
        }
        if (author == null || ("false".equals(author.getProperty("jiveDisplayMemberPhoto"))) || author.getProperty("imagePath") == null) {
            return false;
        }
        return true;
    }

    public static String createTextAreaBody(String body) {
        body = StringUtils.escapeForXML(body);
        body = StringUtils.replace(body, "\"", "&quot;");
        return body;
    }

    public static boolean isAdmin(User user) {
        if (user == null) return false;
        return user.isAuthorized(Permissions.SYSTEM_ADMIN);
    }

    public static byte[] asciiGetBytes(String s) {
        int size = s.length();
        byte[] result = new byte[size];
        for (int i = 0; i < size; i++) {
            result[i] = (byte) s.charAt(i);
        }
        return result;
    }

    public static boolean highlightPost(User user, double pct, double ratingCount) {
        return (user != null &&
                user.getProperty("ratingHighlightThreshold") != null &&
                user.getProperty("ratingHighlightMinCount") != null &&
                pct >= Integer.parseInt(user.getProperty("ratingHighlightThreshold")) &&
                ratingCount >= Integer.parseInt(user.getProperty("ratingHighlightMinCount")));
    }

    public static boolean collapsePost(User user, double pct, double ratingCount, double messageCount) {
        return (user != null &&
                user.getProperty("ratingCollapseThreshold") != null &&
                user.getProperty("ratingCollapseMinCount") != null &&
                user.getProperty("ratingCollapseMinMessages") != null &&
                pct <= Integer.parseInt(user.getProperty("ratingCollapseThreshold")) &&
                ratingCount >= Integer.parseInt(user.getProperty("ratingCollapseMinCount")) &&
                messageCount >= Integer.parseInt(user.getProperty("ratingCollapseMinMessages")));
    }

    public static boolean showRatings(User user) {
        boolean defaultRatingsEnabled = JiveGlobals.getJiveBooleanProperty("tc.default.ratings.enabled", true);
        if (defaultRatingsEnabled) {
            // all registered users see ratings
            return !("false".equals(user.getProperty("showRatings")));
        } else {
            // only users with explicitly chosen user setting see ratings
            return "true".equals(user.getProperty("showRatings"));
        }
    }
    
    // Returns number of positive and negative votes for a message
    //      ratings[0]: number of positive ratings
    //      ratings[1]: number of negative ratings
    public static int[] getRatings(RatingManager ratingManager, ForumMessage message) {
        int[] ratings = new int[2];
        
        Iterator itRatings = ratingManager.getRatings(message);
        while (itRatings.hasNext()) {
            com.jivesoftware.forum.Rating rating = (com.jivesoftware.forum.Rating)itRatings.next();
            int score = rating.getScore();
            switch (score) {
                case 1:
                    ratings[1]++;
                    break;
                case 2:
                    ratings[0]++;
                    break;
            }
        }
 
        return ratings;
    }
    
    // For use in preview.jsp, post.jsp
    public static String getAllowedTagsDisplay() {
        String tagList = JiveGlobals.getJiveProperty("tc.filter.TCHTMLFilter.default.allowedTags", "");
        String[] tags = TCHTMLFilter.DEFAULT_ALLOWED_TAGS;
        if (!tagList.equals("")) {
            tags = tagList.split(","); 
        }
        
        StringBuffer display = new StringBuffer();
        for (int i=0; i<tags.length; i++) {
            display.append("&lt;");
            display.append(tags[i]);
            display.append("&gt;");
            if (i != tags.length-1) {
                display.append(", ");
            }
        }
        return display.toString();
    }
    
    // For use in preview.jsp, post.jsp
    public static String getAllowedAttributesDisplay() {
        String attributeList = JiveGlobals.getJiveProperty("tc.filter.TCHTMLFilter.default.allowedAttributes", "");
        String[] attributes = TCHTMLFilter.DEFAULT_ALLOWED_ATTRIBUTES;
        if (!attributeList.equals("")) {
            attributes = attributeList.split(" "); 
        }
        
        StringBuffer display = new StringBuffer();
        for (int i=0; i<attributes.length; i++) {
            display.append(attributes[i]);
            if (i != attributes.length-1) {
                display.append("; ");
            }
        }
        return display.toString();
    }
    
    // For creating links to news articles, match editorials and statistics pages, etc. in breadcrumb
    public static String createLinkString(Forum forum) {
        String linkNames = forum.getForumCategory().getProperty(ForumConstants.PROPERTY_LINK_NAMES);
        StringBuffer linkStr = new StringBuffer();
        if (linkNames != null) {
        	String[] linkNamesArr = linkNames.split(",");
        	if (linkNamesArr.length > 0) {
        		linkStr.append("(");
				for (int i=0; i<linkNamesArr.length; i++) {
					String linkKey = (i==0) ? ForumConstants.PROPERTY_LINK : ForumConstants.PROPERTY_LINK+(i+1);
					String link = forum.getProperty(linkKey);
					if (link == null) return "";	// only display if well-formed
					if (link.startsWith("/")) {		// relative
						link = ApplicationServer.SERVER_NAME + link;
					}
					if (!link.startsWith("http://") && !link.startsWith("https://")) {
						link = "http://" + link;
					}
					linkStr.append("<a href=\""+link+"\" class=\"rtbcLink\">"+linkNamesArr[i]+"</a>");
					if (i<linkNamesArr.length-1) {
						linkStr.append("&#160;|&#160;");
					}
				}
				linkStr.append(")");
        	}
        }
        return linkStr.toString();
    }
}