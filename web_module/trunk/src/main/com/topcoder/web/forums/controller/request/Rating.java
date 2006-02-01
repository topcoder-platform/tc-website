/*
 * Created on Jan 24, 2006
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.forum.ForumMessage;
import com.jivesoftware.forum.RatingManager;
import com.jivesoftware.forum.RatingManagerFactory;
import com.topcoder.web.forums.ForumConstants;

/**
 * @author mtong
 *
 * Provides processing related to the rating of messages. As of version 4.*, Jive's rating system
 * only supports positive integers as rating scores. Thus, we temporarily assign 1 point to each 
 * negative rating and 2 points to each positive rating, and modify calculations accordingly.
 */
public class Rating extends ForumsProcessor {
	protected void businessProcessing() throws Exception {
		super.businessProcessing();
        if (authToken.isAnonymous()) return;
        RatingManager ratingManager = RatingManagerFactory.getInstance(authToken); 
        if (!ratingManager.isRatingsEnabled()) return;
        
        long messageID = Long.parseLong(getRequest().getParameter(ForumConstants.MESSAGE_ID));
        int voteValue = Integer.parseInt(getRequest().getParameter("voteValue"));
        ForumMessage message = forumFactory.getMessage(messageID);
        
        ratingManager.addRating(user, message, ratingManager.getRatingFromScore(voteValue));
        double avgRating = ratingManager.getMeanRating(message);
        int ratingCount = ratingManager.getRatingCount(message);
        int posRatings = (int)(Math.round(avgRating*ratingCount)-ratingCount);
        int negRatings = ratingCount - posRatings;
        
        getHttpResponse().setContentType("text/xml");
        getHttpResponse().setHeader("Cache-Control", "no-cache");
        getHttpResponse().getWriter().write("test");
        //getHttpResponse().getOutputStream().println(getXML(posRatings, negRatings));
	}
    
	private String getXML(int posRatings, int negRatings) {
	    String xml = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n" +
            "<response>\n" +
	            "<posRatings>"+posRatings+"</posRatings>\n" + 
	            "<negRatings>"+negRatings+"</negRatings>\n" +
            "</response>";
        return xml;
    }
}