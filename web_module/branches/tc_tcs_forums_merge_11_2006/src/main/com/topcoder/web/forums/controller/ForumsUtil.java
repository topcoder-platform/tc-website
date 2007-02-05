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
import com.jivesoftware.forum.ForumCategoryNotFoundException;
import com.jivesoftware.forum.ForumFactory;
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
import com.topcoder.web.ejb.forums.Forums;
import com.topcoder.web.forums.model.TCAuthToken;
import com.topcoder.web.forums.util.filter.TCHTMLFilter;
import com.topcoder.web.forums.ForumConstants;
import com.topcoder.dde.catalog.ComponentInfo;

import java.rmi.RemoteException;
import java.text.NumberFormat;
import java.text.DecimalFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Iterator;
import java.util.ArrayList;

/**
 * @author mtong
 */
public class ForumsUtil {
    protected static Logger log = Logger.getLogger(BaseProcessor.class);
    private static boolean filterHTMLEnabled
        = JiveGlobals.getJiveBooleanProperty("search.filterHTMLEnabled",true);
    
    public static long tempMessageID = 1L;
    
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
        return getForums(itForums, excludeEmptyForums);
    }
    
    // Returns forums in a category and its subcategories, with empty forums omitted or placed at the list's end.
    public static ArrayList getRecursiveForums(ForumCategory forumCategory, ResultFilter resultFilter,
            boolean excludeEmptyForums) {
    	Iterator itForums = forumCategory.getRecursiveForums(resultFilter);
    	return getForums(itForums, excludeEmptyForums);
    }
    
    public static ArrayList getForums(Iterator itForums, boolean excludeEmptyForums) {
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
    
    // Returns subcategories within a category, with empty/inactive/unapproved categories omitted or placed at 
    // the list's end. Only forums for approved software components are displayed.
    public static ArrayList getCategories(Forums forumsBean, ForumCategory forumCategory, ResultFilter resultFilter,
            boolean excludeEmptyCategories) throws RemoteException {
    	log.info("*** Entered getCategories()");
    	Iterator itCategories = forumCategory.getCategories();
    	log.info("*** Created iterator traversing " + forumCategory.getCategoryCount() + " elements");
        ArrayList categoriesList = new ArrayList();
        ArrayList emptyCategories = new ArrayList();
        
        long[] componentIDs = new long[forumCategory.getCategoryCount()];
        int n=0;
        while (itCategories.hasNext()) {
        	n++;
        	log.info("*** Category: " + n + " of " + forumCategory.getCategoryCount());
        	ForumCategory c = (ForumCategory)itCategories.next();
        	try {
        		componentIDs[n] = Long.parseLong(c.getProperty(ForumConstants.PROPERTY_COMPONENT_ID));
        	} catch (NumberFormatException nfe) {
        		log.info("*** Category " + c.getID() + " has no PROPERTY_COMPONENT_ID: add ID or remove category");
        		continue;
        	}
        }
        log.info("*** Start: Find approved components");
        HashSet approvedComponents = forumsBean.getApprovedComponents(componentIDs);
    	log.info("*** approvedComponents.size() = " + approvedComponents.size());
        log.info("*** End: Find approved components");
        
        itCategories = forumCategory.getCategories();
        n = 0;
        while (itCategories.hasNext()) {
        	log.info("*** Category: " + ++n + " of " + forumCategory.getCategoryCount());
        	ForumCategory c = (ForumCategory)itCategories.next();
        	String archivalStatus = c.getProperty(ForumConstants.PROPERTY_ARCHIVAL_STATUS);
        	log.info("*** found archival status");
        	if (ForumConstants.PROPERTY_ARCHIVAL_STATUS_ARCHIVED.equals(archivalStatus) ||
        			ForumConstants.PROPERTY_ARCHIVAL_STATUS_CLOSED.equals(archivalStatus)) continue; 
        	/*
        	try {
        		log.info("*** start EJB call");
        		long componentStatus = forumsBean.getComponentStatus(Long.parseLong(c.getProperty(ForumConstants.PROPERTY_COMPONENT_ID)));
            	log.info("*** end EJB call");
        		if (componentStatus != ComponentInfo.APPROVED) continue; 
        	} catch (NumberFormatException nfe) {
        		log.info("*** Category " + c.getID() + " has no PROPERTY_COMPONENT_ID: add ID or remove category");
        		continue;
        	}      	
        	*/
        	if (approvedComponents.contains(String.valueOf(c.getID()))) {
        		log.info("*** category " + c.getID() + " is approved");
	        	if (c.getMessageCount() > 0) {
	        		categoriesList.add(c);
	        	} else {
	        		emptyCategories.add(c);
	        	}
        	} else {
        		log.info("*** category " + c.getID() + " is not approved");
        	}
        	log.info("*** added to list");
        }
        log.info("*** Began sort of categoriesList");
        Collections.sort(categoriesList, 
        		new JiveCategoryComparator(resultFilter.getSortField(), resultFilter.getSortOrder()));
        log.info("*** Began sort of emptyCategories");
        Collections.sort(emptyCategories, 
        		new JiveCategoryComparator(resultFilter.getSortField(), resultFilter.getSortOrder()));
        if (!excludeEmptyCategories) {
        	categoriesList.addAll(emptyCategories);
        }
        log.info("*** Exited getCategories()");
        return categoriesList;
    }

    // Returns one page of items in a list
    public static ArrayList getPage(ArrayList list, int startIdx, int forumRange) {
        int endIdx = Math.min(startIdx+forumRange, list.size());
        ArrayList pageList = new ArrayList();
        for (int i=startIdx; i<endIdx; i++) {
            pageList.add(list.get(i));
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
		String[] tags = TCHTMLFilter.DEFAULT_ALLOWED_TAGS;
    	
    	int filterCount = JiveGlobals.getJiveIntProperty("filter.global.filterCount", 0);
    	for (int i=0; i<filterCount; i++) {
    		String filterName = "filter.global.filter" + String.valueOf(i);
    		String className = JiveGlobals.getJiveProperty(filterName+".className", "");
    		if (className.equals("com.topcoder.web.forums.util.filter.TCHTMLFilter")) {
    			String tagList = JiveGlobals.getJiveProperty(filterName+".properties.allowedTagsString", "");
    	        if (!tagList.equals("")) {
    	            tags = tagList.split(","); 
    	        }
    		}
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
    	String[] attributes = TCHTMLFilter.DEFAULT_ALLOWED_ATTRIBUTES;
    	
    	int filterCount = JiveGlobals.getJiveIntProperty("filter.global.filterCount", 0);
    	for (int i=0; i<filterCount; i++) {
    		String filterName = "filter.global.filter" + String.valueOf(i);
    		String className = JiveGlobals.getJiveProperty(filterName+".className", "");
    		if (className.equals("com.topcoder.web.forums.util.filter.TCHTMLFilter")) {
    			String attributeList = JiveGlobals.getJiveProperty(filterName+".properties.allowedAttributesString", "");
    	        if (!attributeList.equals("")) {
    	            attributes = attributeList.split(" "); 
    	        }
    		}
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
    
    // Creates links to news articles, match editorials and statistics pages, etc. in breadcrumb.
    // The link names are specified by the "linkNames" property in either the forum or category - most links 
    // in a category will follow the same format, but for exceptions, add a "linkNames" property to the 
    // forum to override the default category link names.
    //
    // Specifying links in a category:
    // -------------------------------
    // linkNames = Article,Article (Part 2)
    // link = tc?module=Static&d1=tutorials&d2=complexity1
    // link2 = tc?module=Static&d1=tutorials&d2=complexity2
    //
    // Specifying links in a forum:
    // ----------------------------
    // linkNames = Article,Article (Part 2)
    // link_Article = tc?module=Static&d1=tutorials&d2=complexity1
    // link_Article (Part 2) = tc?module=Static&d1=tutorials&d2=complexity2
    //
    public static String createLinkString(Forum forum) {
    	String linkNames = forum.getProperty(ForumConstants.PROPERTY_LINK_NAMES);
        StringBuffer linkStr = new StringBuffer();
    	if (linkNames != null) {
    		String[] linkNamesArr = linkNames.split(",");
    		if (linkNamesArr.length > 0) {
    			linkStr.append("(");
    			for (int i=0; i<linkNamesArr.length; i++) {
    				String linkKey = ForumConstants.PROPERTY_LINK + "_" + linkNamesArr[i];
    				String link = forum.getProperty(linkKey);
					if (link == null) return "";	// only display if well-formed
					if (link.startsWith("/")) {		// relative
						link = ApplicationServer.SERVER_NAME + link;
					}
					if (!link.startsWith("http://") && !link.startsWith("https://")) {
						link = "http://" + link;
					}
					if (i>0) {
						linkStr.append("&#160;|&#160;");
					}
					linkStr.append("<a href=\""+link+"\" class=\"rtbcLink\">"+linkNamesArr[i]+"</a>");
    			}
    			linkStr.append(")");
    		} 
    		return linkStr.toString();
    	}
    	
        linkNames = forum.getForumCategory().getProperty(ForumConstants.PROPERTY_LINK_NAMES);
        if (linkNames != null) {
        	String[] linkNamesArr = linkNames.split(",");
        	if (linkNamesArr.length > 0) {
        		linkStr.append("(");
				for (int i=0; i<linkNamesArr.length; i++) {
					String linkKey = (i==0) ? ForumConstants.PROPERTY_LINK : ForumConstants.PROPERTY_LINK+(i+1);
					String link = forum.getProperty(linkKey);
					if (link == null) break;		// displays links until one is not found
					if (link.startsWith("/")) {		// relative
						link = ApplicationServer.SERVER_NAME + link;
					}
					if (!link.startsWith("http://") && !link.startsWith("https://")) {
						link = "http://" + link;
					}
					if (i>0) {
						linkStr.append("&#160;|&#160;");
					}
					linkStr.append("<a href=\""+link+"\" class=\"rtbcLink\">"+linkNamesArr[i]+"</a>");
				}
				linkStr.append(")");
        	}
        }
        return linkStr.toString();
    }
    
    // Converts a file size into a formatted string. Sizes of < 1 KB are expressed in B, < 1 MB are 
    // expressed in KB, and >= 1 MB are expressed in MB.
    public static String getFileSizeStr(long bytes) {
    	NumberFormat formatter = new DecimalFormat("0.0");  
    	if (bytes < 1024) {
    		return bytes + " B";
    	} else if (bytes < 1048576) {
    		return formatter.format(((double)bytes)/1024.0) + " KB";
    	} else {
    		return formatter.format(((double)bytes)/1048576.0) + " MB";
    	}
    }
    
    public static ForumCategory getMasterCategory(ForumCategory category) throws ForumCategoryNotFoundException {
    	ForumFactory masterFactory = ForumFactory.getInstance(new TCAuthToken(100129));
    	return masterFactory.getForumCategory(category.getID());
    }
    
    public static String getComponentCategoryName(String name, String versionText, long forumType) {
        if (versionText != null && !versionText.trim().equals("")) {
        	boolean wellFormatted = versionText.trim().matches("\\d+(\\.\\d+)*\\w?");    	
        	if (wellFormatted) {
            	name += " v" + versionText.trim();            		
        	} else {
        		name += " (" + versionText.trim() + ")";
        	}
        }
        /*
        if (forumType == ForumConstants.CUSTOMER_FORUM) {
        	name += " - " + "Customer Forum";
        } else if (forumType == ForumConstants.DEVELOPER_FORUM) {
        	name += " - " + "Developer Forum";
        }
        */
        return name;
    }
    
    public static boolean isSoftwareSubcategory(ForumCategory category) {
    	ForumCategory parentCategory = category.getParentCategory();
    	if (parentCategory == null) return false;
    	return ("software".equals(parentCategory.getProperty(ForumConstants.PROPERTY_LEFT_NAV_NAME)));
    }
}

class JiveCategoryComparator implements Comparator {
	private int sortField;
	private int sortOrder;
	
	public JiveCategoryComparator(int sortField, int sortOrder) {
		this.sortField = sortField;
		this.sortOrder = sortOrder;
	}
	
	public final int compare(Object o1, Object o2) {
		ForumCategory c1 = (ForumCategory)o1;
		ForumCategory c2 = (ForumCategory)o2;
		
		int retVal = 0;
		if (sortField == JiveConstants.FORUM_NAME) {
			retVal = c1.getName().compareTo(c2.getName());
		} else if (sortField == JiveConstants.MODIFICATION_DATE) {
			retVal = c1.getModificationDate().compareTo(c2.getModificationDate());
		}
		if (sortOrder == ResultFilter.DESCENDING) {
			retVal = -retVal;
		}
		return retVal;
    }
}