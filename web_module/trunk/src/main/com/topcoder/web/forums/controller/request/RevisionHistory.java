/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.topcoder.web.forums.ForumConstants;
import com.topcoder.web.forums.model.Revision;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.ejb.messagehistory.MessageHistory;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import java.util.ArrayList;
import java.sql.Date;
import javax.naming.InitialContext;


/**
 * @author mtong
 *
 * Processor providing data related to a message's revision history.
 */
public class RevisionHistory extends ForumsProcessor {
	protected void businessProcessing() throws Exception {
		super.businessProcessing();

        long messageID = Long.parseLong(getRequest().getParameter(ForumConstants.MESSAGE_ID));
        
        InitialContext ctx = TCContext.getInitial();
        MessageHistory historyBean = (MessageHistory)createEJB(ctx, MessageHistory.class);

        int range = ForumConstants.DEFAULT_MESSAGE_RANGE;
        if (user != null) {
            try {
                range = Integer.parseInt(user.getProperty("jiveMessageRange"));
            } catch (Exception ignored) {}
        }
        
        ArrayList revisionList = new ArrayList();
        ResultSetContainer rsc = historyBean.getEdits(messageID, "java:JiveDS");
        for (int i=0; i<rsc.size(); i++) {
            revisionList.add(new Revision(rsc.getIntItem(i, "historyid"), rsc.getIntItem(i, "messageid"),
                rsc.getStringItem(i, "subject"), rsc.getStringItem(i, "body"),
                new Date(rsc.getLongItem(i, "modificationdate"))));
        }

        String threadView = StringUtils.checkNull(getRequest().getParameter(ForumConstants.THREAD_VIEW));
        getRequest().setAttribute("threadView", threadView);
        
        getRequest().setAttribute("forumFactory", forumFactory);
        getRequest().setAttribute("message", forumFactory.getMessage(messageID));
        getRequest().setAttribute("revisionList", revisionList);

		setNextPage("/revisionHistory.jsp");
		setIsNextPageInContext(true);
	}
}