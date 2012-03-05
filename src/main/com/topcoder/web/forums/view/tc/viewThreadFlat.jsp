<%@ page import="com.jivesoftware.base.JiveConstants,
                com.jivesoftware.base.Poll,
                com.jivesoftware.base.PollManager,
                com.jivesoftware.base.User,
                com.jivesoftware.forum.*,
                com.jivesoftware.forum.action.util.Page,
                com.jivesoftware.forum.database.DbAttachmentManager,
                com.topcoder.shared.util.ApplicationServer,
                com.topcoder.web.common.BaseProcessor,
                com.topcoder.web.common.StringUtils,
                com.topcoder.web.forums.ForumConstants,
                com.topcoder.web.forums.controller.ForumsUtil,
                com.topcoder.web.forums.model.ImageData,
                java.text.DecimalFormat,
                java.text.NumberFormat,
                java.util.HashMap,
                java.util.Hashtable"
%>
<%@ page import="java.util.Iterator" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %>

<tc-webtag:useBean id="authToken" name="authToken" type="com.jivesoftware.base.AuthToken" toScope="request"/>
<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="forum" name="forum" type="com.jivesoftware.forum.Forum" toScope="request"/>
<tc-webtag:useBean id="thread" name="thread" type="com.jivesoftware.forum.ForumThread" toScope="request"/>
<tc-webtag:useBean id="paginator" name="paginator" type="com.jivesoftware.forum.action.util.Paginator" toScope="request"/>
<tc-webtag:useBean id="resultFilter" name="resultFilter" type="com.jivesoftware.forum.ResultFilter" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>

<%  HashMap errors = (HashMap)request.getAttribute(BaseProcessor.ERRORS_KEY);
    User user = (User)request.getAttribute("user");
    String threadView = StringUtils.checkNull(request.getParameter(ForumConstants.THREAD_VIEW));
    RatingManager ratingManager = RatingManagerFactory.getInstance(authToken);
    ReadTracker readTracker = forumFactory.getReadTracker();
    PollManager pollManager = forumFactory.getPollManager();
    ForumThread nextThread = (ForumThread)request.getAttribute("nextThread");
    ForumThread prevThread = (ForumThread)request.getAttribute("prevThread");
    boolean showPrevNextThreads = !(user != null && "false".equals(user.getProperty("jiveShowPrevNextThreads")));
    String prevTrackerClass = "", nextTrackerClass = "";
    ForumMessage prevPost = null, nextPost = null;
    NumberFormat formatter = new DecimalFormat("0.00");
    Hashtable editCountTable = (Hashtable)request.getAttribute("editCountTable");

    String cmd = "";
    String watchMessage = "";
    WatchManager watchManager = forumFactory.getWatchManager();
    if (!authToken.isAnonymous() && watchManager.isWatched(user, thread)) {
       Watch watch = watchManager.getWatch(user, thread);
       watchMessage = "Stop Watching Thread";
       cmd = "remove";
    } else {
       watchMessage = "Watch Thread";
       cmd = "add";
    }
%>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="CACHE-CONTROL" content="NO-CACHE">
    
<title>TopCoder Forums</title>
    <jsp:include page="script.jsp" />
        <jsp:include page="/style.jsp">
          <jsp:param name="key" value="tc_forums"/>
        </jsp:include>

</head>

<body>

<jsp:include page="top.jsp" >
    <jsp:param name="level1" value="forums"/>
</jsp:include>

<script type="text/javascript">
<!--
function toggle(obj) {
    var el = document.getElementById(obj);
    if ( el.style.display != "none" ) {
        el.style.display = 'none';
    }
    else {
        el.style.display = '';
    }
}

var req;
function rate(messageID, voteValue) {
   var url = "?module=Rating";
   if (window.XMLHttpRequest) {
       req = new XMLHttpRequest();
   } else if (window.ActiveXObject) {
       req = new ActiveXObject("Microsoft.XMLHTTP");
   }
   req.open("POST", url, true);
   req.onreadystatechange = callbackRating;
   req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
   req.send("messageID="+messageID+"&voteValue="+voteValue);
}

function poll(pollID, hasMultipleOptions, numOptions) {
	var url = "?module=PollVote";
	if (window.XMLHttpRequest) {
		req = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		req = new ActiveXObject("Microsoft.XMLHTTP");
	}
    
	var reqStr = "pollID="+pollID+"&";
	var answered = false;
	if (hasMultipleOptions) {
		for (var i=0; i<numOptions; i++) {
			var el = document.getElementById("q"+pollID+","+i);
 			if (el.checked) {
 				reqStr += el.name + "=" + el.value + "&";
 				answered = true;
  			}
		}
	} else {
		var els = document.getElementsByName("q"+pollID);
		for (var i=0; i<els.length; i++) {
			if (els[i].checked) {
				reqStr += els[i].name + "=" + els[i].value + "&";
				answered = true;
			}
		}
	}

	if (answered) {
		req.open("POST", url, true);
		req.onreadystatechange = callbackPollVote;
		req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		req.send(reqStr);
	} else {
		var pollVotingErrorID = 'pollVotingError'+pollID;
		var pollVotingErrorEl = document.getElementById(pollVotingErrorID);
		if (hasMultipleOptions) {
			pollVotingErrorEl.innerHTML = 'Please select one or more answers.';
		} else {
			pollVotingErrorEl.innerHTML = 'Please select an answer.';
		}
	}
}

function callbackRating() {
    if (req.readyState == 4) {
        if (req.status == 200) {
            var messageID = req.responseXML.getElementsByTagName("messageID")[0].firstChild.nodeValue;
            var posRatings = req.responseXML.getElementsByTagName("posRatings")[0].firstChild.nodeValue;
            var negRatings = req.responseXML.getElementsByTagName("negRatings")[0].firstChild.nodeValue;
            var userRating = req.responseXML.getElementsByTagName("userRating")[0].firstChild.nodeValue;
            displayVotes(messageID, posRatings, negRatings, userRating);
        }
    }
}

function callbackPollVote() {
	if (req.readyState == 4) {
		if (req.status == 200) {
			var pollID = req.responseXML.getElementsByTagName("pollID")[0].firstChild.nodeValue;
			var numVoters = req.responseXML.getElementsByTagName("numVoters")[0].firstChild.nodeValue;
			var voteCounts = req.responseXML.getElementsByTagName("voteCount");
			for (var i=0; i<voteCounts.length; i++) {
				var voteCount = voteCounts[i].firstChild.nodeValue;                       
				var voteCountEl = document.getElementById("voteCount"+pollID+"_"+i);
				voteCountEl.innerHTML = voteCount;
				var votePctEl = document.getElementById("votePct"+pollID+"_"+i);
				var votePct = 100.0 * voteCount / numVoters;
				votePctEl.innerHTML = votePct.toFixed(2) + "%";
				var votePctBarEl = document.getElementById("votePctBar"+pollID+"_"+i);
				var votePctBarStr = "width:"+parseInt(votePct)+"px;";
				if (parseInt(votePct) > 0) {
					votePctBarEl.innerHTML = '<div class="resultsBar" style="' + votePctBarStr + '"><img src="/i/clear.gif" alt="bar" width="1" height="13" border="0" /></div>';
				} else {
					votePctBarEl.innerHTML = '';
				}
	            
				displayPoll(pollID, 'results');
				var pollResultsFooterID = 'pollResultsFooter'+pollID;
				var pollResultsFooterEl = document.getElementById(pollResultsFooterID);
				pollResultsFooterEl.style.display = 'none';
			}
		}
	}
}

function displayVotes(messageID, posVotes, negVotes, userRating) {
    var mspan = document.getElementById("ratings"+messageID);
    mspan.innerHTML = "(+"+posVotes+"/-"+negVotes+")";
    var title = "Your vote: ";
    if (userRating == 2) {
    	title += "+1";
    } else if (userRating == 1) {
    	title += "-1";
    } else {
    	title += "0";
    }
    mspan.title = title;
}

function displayPoll(pollID, status) {
	var pollVotingID = 'pollVoting'+pollID;
	var pollResultsID = 'pollResults'+pollID;
	var pollResultsFooterID = 'pollResultsFooter'+pollID;
	var pollVotingEl = document.getElementById(pollVotingID);
	var pollResultsEl = document.getElementById(pollResultsID);
	var pollResultsFooterEl = document.getElementById(pollResultsFooterID);
	if (status == 'vote') {
		pollVotingEl.style.display = '';
		pollResultsEl.style.display = 'none';
	} else if (status == 'results') {
		pollVotingEl.style.display = 'none';
		pollResultsFooterEl.style.display = '';
		pollResultsEl.style.display = '';
	}
}

//-->
</script>

<style type="text/css">
<!--
.pointer {
    cursor: pointer;
}

.rtTextCellHlt
{
    background-color: #FFFF99;
    padding: 10px 15px 10px 15px;
    color: #333;
    font-size: 12px;
    vertical-align: top;
}

div.resultsBar{
float:left;
margin: 4px 0px 4px 0px;
padding:0px;
background: #6363E3 url(/i/survey/bar_bg.gif) center left repeat-x;
}
-->
</style>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
      <td width="180">
          <jsp:include page="includes/global_left.jsp">
             <jsp:param name="node" value="forums"/>
          </jsp:include>
      </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
        <td width="99%" class="rtBody">

        <jsp:include page="page_title.jsp" >
            <jsp:param name="image" value="forums"/>
            <jsp:param name="title" value="&#160;"/>
        </jsp:include>

<table cellpadding="0" cellspacing="0" class="rtbcTable" border="0">
<tr>
	<td class="categoriesBox" style="padding-right: 20px;">
   		<jsp:include page="categoriesHeader.jsp" />
	</td>
	<td nowrap="nowrap" valign="top" width="100%" style="padding-right: 20px;">
        <jsp:include page="searchHeader.jsp" />
       	<%  if (ForumsUtil.isSoftwareSubcategory(forum.getForumCategory())) { %>
	    	<%	ImageData imageData = (ImageData)request.getAttribute("imageData"); %>
			<%	if (!"".equals(StringUtils.checkNull(imageData.getPhaseIcon()))) { %>
	    		<img align="middle" src="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/i/<%=imageData.getPhaseIcon()%>" alt="<%=imageData.getPhaseText()%>" width="25" height="17" border="0">
			<%	} %>
			<%	if (!"".equals(StringUtils.checkNull(imageData.getTechnologyIcon()))) { %>
				<img align="middle" src="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/i/<%=imageData.getTechnologyIcon()%>" alt="<%=imageData.getTechnologyText()%>" border="0"/>
			<%	} %>
		<%	} %>
	</td>
   <td align="right" nowrap="nowrap" valign="top">
   <A href="?module=Watch&<%=ForumConstants.WATCH_TYPE%>=<%=JiveConstants.THREAD%>&<%=ForumConstants.WATCH_ID%>=<%=thread.getID()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>&<%=ForumConstants.WATCH_COMMAND%>=<%=cmd%>"
   class="rtbcLink"><%=watchMessage%></A>&#160;&#160;|&#160;&#160;<A href="?module=History" class="rtbcLink">My Post History</A>&#160;&#160;|&#160;&#160;<A href="?module=Watches" class="rtbcLink">My Watches</A>&#160;&#160;|&#160;&#160;<A href="?module=Settings" class="rtbcLink">User Settings</A><br>
   View:
   <span class="currentPage">Flat</span>
   <%   if (resultFilter.getSortOrder() == ResultFilter.ASCENDING) { %>
            (<A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>&mc=<%=thread.getMessageCount()%>&<%=ForumConstants.THREAD_VIEW%>=flat_new" class="rtbcLink">newest first</A>)<%   } else { %>
            (<A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>&mc=<%=thread.getMessageCount()%>&<%=ForumConstants.THREAD_VIEW%>=flat" class="rtbcLink">oldest first</A>)<%   } %>&#160;&#160;|
   <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>&mc=<%=thread.getMessageCount()%>&<%=ForumConstants.THREAD_VIEW%>=threaded" class="rtbcLink">Threaded</A>&#160;&#160;|
   <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>&mc=<%=thread.getMessageCount()%>&<%=ForumConstants.THREAD_VIEW%>=tree" class="rtbcLink">Tree</A>
   <% if (errors.get(ForumConstants.WATCH_THREAD) != null) { %><br><span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.WATCH_THREAD%>"><%=err%></tc-webtag:errorIterator></span><% } %>
   <%   if (showPrevNextThreads && (nextThread != null || prevThread != null)) { %><br>
        <% if (prevThread != null) { %>
            <%  prevPost = ForumsUtil.getLatestMessage(prevThread);
                prevTrackerClass = (user == null || readTracker.getReadStatus(user, prevPost) == ReadTracker.READ) ? "rtbcLink" : "rtLinkBold"; %>
           <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=prevThread.getID()%>&<%=ForumConstants.START_IDX%>=0&mc=<%=prevThread.getMessageCount()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="<%=prevTrackerClass%>">Previous Thread</A>
        <% } else { %>
           Previous Thread
        <% } %>&#160;|&#160;
        <% if (nextThread != null) { %>
            <%  nextPost = ForumsUtil.getLatestMessage(nextThread);
                nextTrackerClass = (user == null || readTracker.getReadStatus(user, nextPost) == ReadTracker.READ) ? "rtbcLink" : "rtLinkBold"; %>
           <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=nextThread.getID()%>&<%=ForumConstants.START_IDX%>=0&mc=<%=nextThread.getMessageCount()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="<%=nextTrackerClass%>">Next Thread</A>
        <% } else { %>
           Next Thread
        <% } %>
   <%   }   %>
   </td>
</tr>

<%	int colspan = (paginator.getNumPages() > 1) ? 2 : 3; %>
<tr><td colspan="<%=colspan%>" style="padding-bottom:3px;"><b>
   <%	boolean showComponentLink = "true".equals((String)request.getAttribute("showComponentLink"));
   		Iterator itCategories = ForumsUtil.getCategoryTree(forum.getForumCategory());
    	while (itCategories.hasNext()) {
    		ForumCategory category = (ForumCategory)itCategories.next(); %>
	        <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtbcLink"><%=category.getName()%></A>
	<%      if (!itCategories.hasNext() && showComponentLink) { %>
	        	(<a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<%=forum.getForumCategory().getProperty(ForumConstants.PROPERTY_COMPONENT_ID)%>" class="rtbcLink">Component</a>)	
		<%	} %>
			<img src="/i/interface/exp_w.gif" align="absmiddle"/>
   <%	} %>
   <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>&mc=<%=forum.getMessageCount()%>" class="rtbcLink"><%=forum.getName()%></A>
   <%	String linkStr = ForumsUtil.createLinkString(forum);
   		if (!linkStr.equals("()")) { %>
   			<%=linkStr%>
   <% 	} %>
   <img src="/i/interface/exp_w.gif" align="absmiddle"/> <%=thread.getName()%></b>
   </td>
<% if (paginator.getNumPages() > 1) { %>
   <td class="rtbc" align="right" style="padding-bottom:3px;"><b>
      <%  if (paginator.getPreviousPage()) { %>
         <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>&<%=ForumConstants.START_IDX%>=<%=paginator.getPreviousPageStart()%>&mc=<%=thread.getMessageCount()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="rtbcLink">
               << PREV</A>&#160;&#160;&#160;
        <%  } %> [
        <%  Page[] pages = paginator.getPages(5);
            for (int i=0; i<pages.length; i++) {
        %>  <%  if (pages[i] != null) { %>
                 <%  if (pages[i].getNumber() == paginator.getPageIndex()+1) { %>
                       <span class="currentPage"><%= pages[i].getNumber() %></span>
                 <%  } else { %>
                        <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>&<%=ForumConstants.START_IDX%>=<%=pages[i].getStart()%>&mc=<%=thread.getMessageCount()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="rtbcLink">
                         <%= pages[i].getNumber() %></A>
                   <%  } %>
            <%  } else { %> ... <%  } %>
        <%  } %> ]
      <%  if (paginator.getNextPage()) { %>
         &#160;&#160;&#160;<A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>&<%=ForumConstants.START_IDX%>=<%=paginator.getNextPageStart()%>&mc=<%=thread.getMessageCount()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="rtbcLink">NEXT ></A>
        <%  } %>
   </b></td>
<% } %>
</tr></table>

<%-------------POSTS---------------%>
<tc-webtag:iterator id="message" type="com.jivesoftware.forum.ForumMessage" iterator='<%=(Iterator)request.getAttribute("messages")%>'>
<table cellpadding="0" cellspacing="0" class="rtTable" style="margin-bottom:6px;">
   	<tr>
      	<td class="rtHeader" colspan="2">
      	<%  String msgBodyID = "msgBody" + message.getID(); 
       		String ratingsID = "ratings" + message.getID(); 
          	int ratingCount = -1;
          	int posRatings = -1;
          	int negRatings = -1; %>  
         	<div style="float: right; padding-left: 5px; white-space: nowrap;">
            <%  int editCount = editCountTable.containsKey(String.valueOf(message.getID())) ? 
            		Integer.parseInt((String)editCountTable.get(String.valueOf(message.getID()))) : 0;
            	if (editCount > 0) { %> 
                	<a href="?module=RevisionHistory&<%=ForumConstants.MESSAGE_ID%>=<%=message.getID()%>" class="rtbcLink" title="Last updated <tc-webtag:format object="${message.modificationDate}" format="EEE, MMM d, yyyy 'at' h:mm a z" timeZone="${sessionInfo.timezone}"/>"><%=ForumsUtil.display(editCount, "edit")%></a> | 
            	<%  } %>
            	<a name=<%=message.getID()%>><tc-webtag:format object="${message.creationDate}" format="EEE, MMM d, yyyy 'at' h:mm a z" timeZone="${sessionInfo.timezone}"/></a>
         	</div>
         	<%  if (ratingManager.isRatingsEnabled() && user != null && ForumsUtil.showRatings(user)) { %>
             	<a class="pointer" onMouseOver="this.style.color='#FF0000'"; onMouseOut="this.style.color='#333'"; onclick="toggle('<%=msgBodyID%>')";><%=message.getSubject()%></a>
         	<%  } else { %>
            	<%=message.getSubject()%>
         	<%  } %>
         	<%  if (message.getParentMessage() != null) { %>
         		(response to <A href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<%=message.getParentMessage().getID()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="rtbcLink">post</A><%if (message.getParentMessage().getUser() != null) {%> by <tc-webtag:handle coderId="<%=message.getParentMessage().getUser().getID()%>"/><%}%>)
         	<%  } %>
         	<%  if (ratingManager.isRatingsEnabled() && user != null && ForumsUtil.showRatings(user)) {
					int[] ratings = ForumsUtil.getRatings(ratingManager, message);
					posRatings = ratings[0];
					negRatings = ratings[1];
					ratingCount = posRatings+negRatings; 
					Rating rating = ratingManager.getRating(user, message); 
                    String ratingVal = (rating == null) ? "0" : rating.getScore() == 2 ? "+1":"-1"; %>
				| Feedback: <span id="<%=ratingsID%>" class="pointer" title="Your vote: <%=ratingVal%>">(+<%=posRatings%>/-<%=negRatings%>)</span> | <a href="javascript:void(0)" onclick="rate('<%=message.getID()%>','2')" class="rtbcLink">[+]</a> <a href="javascript:void(0)" onclick="rate('<%=message.getID()%>','1')" class="rtbcLink">[-]</a>
        	<%  } %>
         | <A href="?module=Post&<%=ForumConstants.POST_MODE%>=Reply&<%=ForumConstants.MESSAGE_ID%>=<%=message.getID()%>" class="rtbcLink">Reply</A>
         <%  if (message.getUser() != null && message.getUser().equals(user)) { %>
         | <A href="?module=Post&<%=ForumConstants.POST_MODE%>=Edit&<%=ForumConstants.MESSAGE_ID%>=<%=message.getID()%>" class="rtbcLink">Edit</A>
         <%  } %>
      </td>
   	</tr>
   	<% if (message.getAttachmentCount() > 0) { %>
	<tr>
		<td class="rtHeader" colspan="2">
			Attachments:
			<%	Iterator attachments = message.getAttachments();
				while(attachments.hasNext()) {
					Attachment attachment = (Attachment)attachments.next(); %>&nbsp;
					<A href="?module=GetAttachment&<%=ForumConstants.ATTACHMENT_ID%>=<%=attachment.getID()%>"><img align="absmiddle" src="/i/roundTables/icons/<%=DbAttachmentManager.getThumbnailImage(attachment.getContentType())%>" border="0" alt="Attachment" /></A>
					<A href="?module=GetAttachment&<%=ForumConstants.ATTACHMENT_ID%>=<%=attachment.getID()%>" class="rtbcLink"><%=attachment.getName()%></A> (<%=ForumsUtil.getFileSizeStr(attachment.getSize())%>)&nbsp;&nbsp;
			<% 	} %>
		</td>
 	</tr>
    <% } %>
   	<%   double pct = ratingCount<=0 ? 0 : 100*(double)(posRatings)/(double)(ratingCount);
        String msgBodyDisplay = ForumsUtil.collapsePost(user, pct, ratingCount, thread.getMessageCount())?"display:none":"";
   	%>
   	<tr id="<%=msgBodyID%>" style="<%=msgBodyDisplay%>">
      <td class="rtPosterCell">
         <div class="rtPosterSpacer">
            <%  if (ForumsUtil.displayMemberPhoto(user, message.getUser())) { %>
            <img src="<%=message.getUser().getProperty("imagePath")%>" width="55" height="61" border="0" class="rtPhoto" /><br>
            <%  } %>
            <span class="bodyText"><%if (message.getUser() != null) {%><tc-webtag:handle coderId="<%=message.getUser().getID()%>"/><%}%></span><br><%if (message.getUser() != null) {%><A href="?module=History&<%=ForumConstants.USER_ID%>=<%=message.getUser().getID()%>"><%=ForumsUtil.display(forumFactory.getUserMessageCount(message.getUser()), "post")%></A><%}%>
         </div>
      </td>
	  <%   if (pollManager.getPollCount(JiveConstants.MESSAGE, message.getID()) > 0) { %>
      <td class="rtTextCell" width="100%">
           <%	Iterator itPolls = pollManager.getPolls(JiveConstants.MESSAGE, message.getID());
           		while (itPolls.hasNext()) {
           			Poll poll = (Poll)itPolls.next(); 
           			String pollVotingID = "pollVoting" + poll.getID(); 
           			String pollResultsID = "pollResults" + poll.getID();
           			String pollResultsFooterID = "pollResultsFooter" + poll.getID();
        			String pollVotingErrorID = "pollVotingError" + poll.getID();
           			String pollVotingDisplay = (user != null && !poll.hasUserVoted(user))?"":"display:none";
           			String pollResultsDisplay = (user != null && !poll.hasUserVoted(user))?"display:none":"";
           			String pollResultsFooterDisplay = "display:none"; 
           			%>
           			<table id="<%=pollVotingID%>" style="<%=pollVotingDisplay%>" width="50%" border="0" cellpadding="5" cellspacing="0" class="stat">
                     <tr class="light">
                        <td colspan="2" class="light" valign="top" width="100%">
                           <span><b><%=poll.getName()%></b></span><br/><br/>
                        </td>
                     </tr>
                     <%  for (int i=0; i<poll.getOptionCount(); i++) {                              
                     		String rowStyle = (i%2==0) ? "formTextEven" : "formTextOdd"; %>
	                     <tr class=<%=rowStyle%>>
	                        <td width="100%">
	                            <%=poll.getOption(i)%>
	                        </td>
	                        <td align="right">
	                        	<%	if (poll.isModeEnabled(Poll.MULTIPLE_SELECTIONS_ALLOWED)) { %>
	                        		<input type="checkbox" id="<%="q"+poll.getID()+","+i%>" name="<%="q"+poll.getID()+","+i%>"/>
	                        	<%	} else { %>
	                            	<input type="radio" id="<%="q"+poll.getID()%>" name="<%="q"+poll.getID()%>" value="<%=i%>"/>
	                            <%	} %>
	                        </td>
	                     </tr>
	                 <%	 } %>
	                 <tr>
                     	<td colspan="2">
                     		<img style="vertical-align: middle" class="pointer" src="/i/answer.gif" alt="Vote" onclick="poll('<%=poll.getID()%>', <%=poll.isModeEnabled(Poll.MULTIPLE_SELECTIONS_ALLOWED)%>, <%=poll.getOptionCount()%>)"/>
                     		<img style="vertical-align: middle" class="pointer" src="/i/results.gif" alt="Results" onclick="displayPoll('<%=poll.getID()%>','results')"/>
                     		&#160;&#160;<span id="<%=pollVotingErrorID%>" class="bigRed"></span>
                     	</td>
                     </tr>  
                    </table>
           			<table id="<%=pollResultsID%>" style="<%=pollResultsDisplay%>" width="50%" border="0" cellpadding="5" cellspacing="0" class="stat">
                     <tr class="light">
                        <td colspan="4" class="light" valign="top" width="100%">
                           <span><b><%=poll.getName()%></b></span><br/><br/>
                        </td>
                     </tr>
                     <tr>
                        <td class="header">Answer</td>
                        <td class="headerR">Responses</td>
                        <td class="headerR">Percentage</td>
                        <td class="header"><div style="width:100px;">&#160;</div></td>
                     </tr> 
                     <%  for (int i=0; i<poll.getOptionCount(); i++) {                             
                     		String rowStyle = (i%2==0) ? "dark" : "light"; 
                     		int votePctBarWidth = 0; 
                     		String voteCountID = "voteCount" + poll.getID() + "_" + i;
                     		String votePctID = "votePct" + poll.getID() + "_" + i;
                     		String votePctBarID = "votePctBar" + poll.getID() + "_" + i; %>
                     <tr class=<%=rowStyle%>>
                        <td class="value" style="padding-bottom: 10px;">
                        	<%=poll.getOption(i)%>
                        </td>
                        <td class="valueR" id="<%=voteCountID%>">
                        	<%=poll.getUserVoteCount(i)%>
                        </td>
                        <td class="valueR" id="<%=votePctID%>">
                        	<%	if (poll.getUserVoteCount() > 0) { 
                        			double votePct = 100.0*(double)poll.getUserVoteCount(i)/(double)poll.getUserCount(); 
                        			votePctBarWidth = (int)votePct; %>
                        			<%=formatter.format(votePct)%>%
                        	<%	} %>
                        </td>
                        <td class="value" valign="top" id="<%=votePctBarID%>">
                        	<%	String votePctBarStr = "width:"+votePctBarWidth+"px;";
                        		if (votePctBarWidth > 0) { %>
                        			<div class="resultsBar" style="<%=votePctBarStr%>"><img src="/i/clear.gif" alt="bar" width="1" height="13" border="0" /></div>
                        	<%	} %>
                        </td>
                     </tr>
                     <%  } %>
                     <tr id="<%=pollResultsFooterID%>" style="<%=pollResultsFooterDisplay%>">
                     	<td colspan="4">
                     		<img class="pointer" src="/i/answer.gif" alt="Vote" onclick="displayPoll('<%=poll.getID()%>','vote')"/>
                     		<img class="pointer" src="/i/results.gif" alt="Results" onclick="displayPoll('<%=poll.getID()%>','results')"/>
                     	</td>
                     </tr>   
                  </table>
           <%	} %>
      </td>
      <%   } else if (ForumsUtil.highlightPost(user, pct, ratingCount)) { %>
      <td class="rtTextCellHlt" width="100%"><%=message.getBody()%></td>
      <%   } else { %>
      <td class="rtTextCell" width="100%"><%=message.getBody()%></td>
      <%   } %>
   	</tr>
	<tr>
		<td></td>
		<td width="100%"></td>
	</tr>
</table>
</tc-webtag:iterator>
<%-------------POSTS END---------------%>

<table cellpadding="0" cellspacing="0" class="rtbcTable">
<tr><td><b>
   <%	itCategories = ForumsUtil.getCategoryTree(forum.getForumCategory());
    	while (itCategories.hasNext()) {
    		ForumCategory category = (ForumCategory)itCategories.next(); %>
	        <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtbcLink"><%=category.getName()%></A>
	<%      if (!itCategories.hasNext() && showComponentLink) { %>
	        	(<a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<%=forum.getForumCategory().getProperty(ForumConstants.PROPERTY_COMPONENT_ID)%>" class="rtbcLink">Component</a>)	
		<%	} %>
			<img src="/i/interface/exp_w.gif" align="absmiddle"/>
   <%	} %>
   <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>&mc=<%=forum.getMessageCount()%>" class="rtbcLink"><%=forum.getName()%></A>
   <%	linkStr = ForumsUtil.createLinkString(forum);
   		if (!linkStr.equals("()")) { %>
   			<%=linkStr%>
   <% 	} %>
   <img src="/i/interface/exp_w.gif" align="absmiddle"/> <%=thread.getName()%></b>
   <%   if (showPrevNextThreads && (nextThread != null || prevThread != null)) { %><br>
        <% if (prevThread != null) { %>
            <%  prevPost = ForumsUtil.getLatestMessage(prevThread);
                prevTrackerClass = (user == null || readTracker.getReadStatus(user, prevPost) == ReadTracker.READ) ? "rtbcLink" : "rtLinkBold"; %>
           <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=prevThread.getID()%>&<%=ForumConstants.START_IDX%>=0&mc=<%=prevThread.getMessageCount()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="<%=prevTrackerClass%>">Previous Thread</A>
        <% } else { %>
           Previous Thread
        <% } %>&#160;|&#160;
        <% if (nextThread != null) { %>
            <%  nextPost = ForumsUtil.getLatestMessage(nextThread);
                nextTrackerClass = (user == null || readTracker.getReadStatus(user, nextPost) == ReadTracker.READ) ? "rtbcLink" : "rtLinkBold"; %>
           <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=nextThread.getID()%>&<%=ForumConstants.START_IDX%>=0&mc=<%=nextThread.getMessageCount()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="<%=nextTrackerClass%>">Next Thread</A>
        <% } else { %>
           Next Thread
        <% } %>
   <%   }   %>
   </td>
<% if (paginator.getNumPages() > 1) { %>
   <td class="rtbc" align="right" width=20%><b>
      <%  if (paginator.getPreviousPage()) { %>
         <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>&<%=ForumConstants.START_IDX%>=<%=paginator.getPreviousPageStart()%>&mc=<%=thread.getMessageCount()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="rtbcLink">
               << PREV</A>&#160;&#160;&#160;
        <%  } %> [
        <%  Page[] pages = paginator.getPages(5);
            for (int i=0; i<pages.length; i++) {
        %>  <%  if (pages[i] != null) { %>
                 <%  if (pages[i].getNumber() == paginator.getPageIndex()+1) { %>
                       <span class="currentPage"><%= pages[i].getNumber() %></span>
                 <%  } else { %>
                        <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>&<%=ForumConstants.START_IDX%>=<%=pages[i].getStart()%>&mc=<%=thread.getMessageCount()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="rtbcLink">
                         <%= pages[i].getNumber() %></A>
                   <%  } %>
            <%  } else { %> ... <%  } %>
        <%  } %> ]
      <%  if (paginator.getNextPage()) { %>
         &#160;&#160;&#160;<A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>&<%=ForumConstants.START_IDX%>=<%=paginator.getNextPageStart()%>&mc=<%=thread.getMessageCount()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="rtbcLink">NEXT ></A>
        <%  } %>
   </b></td></tr>
<% } else { %>
    <td align="right"><a href="?module=RSS&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>"><img alt="RSS" border="none" src="/i/interface/btn_rss.gif"/></a></td>
<% } %>
</table>
<% if (paginator.getNumPages() > 1) { %>
    <br><a href="?module=RSS&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>"><img alt="RSS" border="none" align="right" src="/i/interface/btn_rss.gif"/></a>
<% } %>

<div style="clear:both;">&nbsp;</div>

        </td>

<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>