/*
 * Created on Jul 25, 2006
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.PollManager;
import com.jivesoftware.base.Poll;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;
import com.topcoder.web.forums.controller.ForumsUtil;

/**
 * @author mtong
 *
 * Provides operations for voting in a poll.
 */
public class PollVote extends ForumsProcessor {
	protected void businessProcessing() throws Exception {
		super.businessProcessing();

		long pollID = Long.parseLong(getRequest().getParameter(ForumConstants.POLL_ID));
		log.info("*** Poll ID: "+pollID);
		
		PollManager pollManager = forumFactory.getPollManager();
		Poll poll = pollManager.getPoll(pollID);
		
		if (!poll.hasUserVoted(user)) {
			if (poll.isModeEnabled(Poll.MULTIPLE_SELECTIONS_ALLOWED)) {
				for (int i=0; i<poll.getOptionCount(); i++) {
					boolean isVoting = (getRequest().getParameter("q"+pollID+","+i) != null);
					log.info("*** Poll option "+i+": "+isVoting+" | value: " + getRequest().getParameter("q"+pollID+","+i));
					if (isVoting) {
						poll.addUserVote(i, user);
					}
				}
			} else {
				int pollChoice = Integer.parseInt(getRequest().getParameter("q"+pollID));
				poll.addUserVote(pollChoice, user);
			}
		}
		
		int[] voteCounts = new int[poll.getOptionCount()];
		for (int i=0; i<voteCounts.length; i++) {
			voteCounts[i] = poll.getUserVoteCount(i);	// not working properly in Jive 4.2.5 - look for update
		}
		
		getResponse().setContentType("text/xml");
        getResponse().addHeader("Cache-Control", "no-cache");
        getResponse().getOutputStream().write(ForumsUtil.asciiGetBytes
                (getXML(pollID, poll.getUserVoteCount(), voteCounts)));
        getResponse().flushBuffer();
	}
	
	private String getXML(long pollID, int numVoters, int[] voteCounts) {
		StringBuffer xml = new StringBuffer();
        xml.append("<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n");
        xml.append("<response>\n");
        xml.append("<pollID>").append(pollID).append("</pollID>\n");
        xml.append("<numVoters>").append(numVoters).append("</numVoters>\n");
        for (int i=0; i<voteCounts.length; i++) {
        	xml.append("<voteCount>").append(voteCounts[i]).append("</voteCount>");
        }
        xml.append("</response>");
        return xml.toString();
    }
}