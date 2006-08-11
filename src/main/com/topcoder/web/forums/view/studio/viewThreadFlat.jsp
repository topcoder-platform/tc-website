<%@ page import="com.jivesoftware.base.JiveConstants,
                 com.jivesoftware.base.User,
                 com.jivesoftware.forum.*,
                 com.jivesoftware.forum.action.util.Page,
                 com.topcoder.shared.util.DBMS,
                 com.topcoder.web.common.BaseProcessor,
                 com.topcoder.web.common.StringUtils,
                 com.topcoder.web.forums.ForumConstants,
                 com.topcoder.web.forums.controller.ForumsUtil,
                 java.util.HashMap,
                 java.util.Iterator"
        %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>

<tc-webtag:useBean id="authToken" name="authToken" type="com.jivesoftware.base.AuthToken" toScope="request"/>
<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="forum" name="forum" type="com.jivesoftware.forum.Forum" toScope="request"/>
<tc-webtag:useBean id="thread" name="thread" type="com.jivesoftware.forum.ForumThread" toScope="request"/>
<tc-webtag:useBean id="paginator" name="paginator" type="com.jivesoftware.forum.action.util.Paginator" toScope="request"/>
<tc-webtag:useBean id="resultFilter" name="resultFilter" type="com.jivesoftware.forum.ResultFilter" toScope="request"/>
<tc-webtag:useBean id="historyBean" name="historyBean" type="com.topcoder.web.ejb.messagehistory.MessageHistory" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>

<% HashMap errors = (HashMap) request.getAttribute(BaseProcessor.ERRORS_KEY);
    User user = (User) request.getAttribute("user");
    String threadView = StringUtils.checkNull(request.getParameter(ForumConstants.THREAD_VIEW));
    RatingManager ratingManager = RatingManagerFactory.getInstance(authToken);
    ReadTracker readTracker = forumFactory.getReadTracker();
    ForumThread nextThread = (ForumThread) request.getAttribute("nextThread");
    ForumThread prevThread = (ForumThread) request.getAttribute("prevThread");
    boolean showPrevNextThreads = !(user != null && "false".equals(user.getProperty("jiveShowPrevNextThreads")));
    String prevTrackerClass = "", nextTrackerClass = "";
    ForumMessage prevPost = null, nextPost = null;

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

<script type="text/javascript">
    <!--
    function toggle(obj) {
        var el = document.getElementById(obj);
        if (el.style.display != "none") {
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
        req.onreadystatechange = callback;
        req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        req.send("messageID=" + messageID + "&voteValue=" + voteValue);
    }

    function callback() {
        if (req.readyState == 4) {
            if (req.status == 200) {
                var resp = req.responseXML.getElementsByTagName("response")[0];
                var messageID = req.responseXML.getElementsByTagName("messageID")[0].firstChild.nodeValue;
                var posRatings = req.responseXML.getElementsByTagName("posRatings")[0].firstChild.nodeValue;
                var negRatings = req.responseXML.getElementsByTagName("negRatings")[0].firstChild.nodeValue;
                displayVotes(messageID, posRatings, negRatings);
            }
        }
    }

    function displayVotes(messageID, posVotes, negVotes) {
        mspan = document.getElementById("ratings" + messageID);
        mspan.innerHTML = "(+" + posVotes + "/-" + negVotes + ")";
    }

    //-->
</script>

<style type="text/css">
    <!--
    .pointer {
        cursor: pointer;
    }

    .rtTextCellHlt {
        background-color: #FFFF99;
        padding: 10px 15px 10px 15px;
        color: #333;
        font-size: 12px;
        vertical-align: top;
    }

    -->
</style>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio_forums"/>
    </jsp:include>
</head>

<body>

<div align="center">
<div class="contentOut">
<jsp:include page="top.jsp">
    <jsp:param name="section" value="default"/>
</jsp:include>
<jsp:include page="topNav.jsp">
    <jsp:param name="node" value="forums"/>
</jsp:include>
<div class="contentIn">
<img src="/i/studio/layout/contentInN.gif" alt="" style="display:block;"/>

<div class="contentSpacer">

<table cellpadding="0" cellspacing="0" class="rtbcTable" border="0">
    <tr>
        <td class="categoriesBox" style="padding-right: 20px;">
            <jsp:include page="categoriesHeader.jsp"/>
        </td>
        <td nowrap="nowrap" valign="top" width="100%" style="padding-right: 20px;">
            <jsp:include page="searchHeader.jsp">
            </jsp:include>
        </td>
        <td align="right" nowrap="nowrap" valign="top">
            <A href="?module=Watch&<%=ForumConstants.WATCH_TYPE%>=<%=JiveConstants.THREAD%>&<%=ForumConstants.WATCH_ID%>=<jsp:getProperty name="thread" property="ID"/><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>&<%=ForumConstants.WATCH_COMMAND%>=<%=cmd%>"
               class="rtbcLink"><%=watchMessage%></A>&#160;&#160;|&#160;&#160;<A href="?module=History" class="rtbcLink">My
            Post History</A>&#160;&#160;|&#160;&#160;<A href="?module=Watches" class="rtbcLink">My Watches</A>&#160;&#160;|&#160;&#160;<A href="?module=Settings" class="rtbcLink">User
            Settings</A><br>
            View:
            <span class="currentPage">Flat</span>
            <% if (resultFilter.getSortOrder() == ResultFilter.ASCENDING) { %>
            (<A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&mc=<jsp:getProperty name="thread" property="messageCount"/>&<%=ForumConstants.THREAD_VIEW%>=flat_new" class="rtbcLink">newest
            first</A>)<% } else { %>
            (<A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&mc=<jsp:getProperty name="thread" property="messageCount"/>&<%=ForumConstants.THREAD_VIEW%>=flat" class="rtbcLink">oldest
            first</A>)<% } %>&#160;&#160;|
            <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&mc=<jsp:getProperty name="thread" property="messageCount"/>&<%=ForumConstants.THREAD_VIEW%>=threaded" class="rtbcLink">Threaded</A>&#160;&#160;|
            <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&mc=<jsp:getProperty name="thread" property="messageCount"/>&<%=ForumConstants.THREAD_VIEW%>=tree" class="rtbcLink">Tree</A>
            <% if (errors.get(ForumConstants.WATCH_THREAD) != null) { %><br>
            <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.WATCH_THREAD%>"><%=err%>
            </tc-webtag:errorIterator></span><% } %>
            <% if (showPrevNextThreads && (nextThread != null || prevThread != null)) { %><br>
            <% if (prevThread != null) { %>
            <% prevPost = ForumsUtil.getLatestMessage(prevThread);
                prevTrackerClass = (user == null || readTracker.getReadStatus(user, prevPost) == ReadTracker.READ) ? "rtbcLink" : "rtLinkBold"; %>
            <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=prevThread.getID()%>&<%=ForumConstants.START_IDX%>=0&mc=<%=prevThread.getMessageCount()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="<%=prevTrackerClass%>">Previous
                Thread</A>
            <% } else { %>
            Previous Thread
            <% } %>&#160;|&#160;
            <% if (nextThread != null) { %>
            <% nextPost = ForumsUtil.getLatestMessage(nextThread);
                nextTrackerClass = (user == null || readTracker.getReadStatus(user, nextPost) == ReadTracker.READ) ? "rtbcLink" : "rtLinkBold"; %>
            <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=nextThread.getID()%>&<%=ForumConstants.START_IDX%>=0&mc=<%=nextThread.getMessageCount()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="<%=nextTrackerClass%>">Next
                Thread</A>
            <% } else { %>
            Next Thread
            <% } %>
            <% } %>
        </td>
    </tr>

    <tr>
        <td colspan="3" style="padding-bottom:3px;">
            <b>
                <% if (paginator.getNumPages() > 1) { %>
                <div style="float:right;" class="rtbc"><b>
                    <% if (paginator.getPreviousPage()) { %>
                    <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&<%=ForumConstants.START_IDX%>=<jsp:getProperty name="paginator" property="previousPageStart"/>&mc=<jsp:getProperty name="thread" property="messageCount"/><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="rtbcLink">
                        <<PREV</A>&#160;&#160;&#160;
                    <% } %> [
                    <% Page[] pages = paginator.getPages(5);
                        for (int i = 0; i < pages.length; i++) {
                    %>  <% if (pages[i] != null) { %>
                    <% if (pages[i].getNumber() == paginator.getPageIndex() + 1) { %>
                    <span class="currentPage"><%= pages[i].getNumber() %></span>
                    <% } else { %>
                    <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&<%=ForumConstants.START_IDX%>=<%=pages[i].getStart()%>&mc=<jsp:getProperty name="thread" property="messageCount"/><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="rtbcLink">
                        <%= pages[i].getNumber() %></A>
                    <% } %>
                    <% } else { %> ... <% } %>
                    <% } %> ]
                    <% if (paginator.getNextPage()) { %>
                    &#160;&#160;&#160;<A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&<%=ForumConstants.START_IDX%>=<jsp:getProperty name="paginator" property="nextPageStart"/>&mc=<jsp:getProperty name="thread" property="messageCount"/><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="rtbcLink">NEXT
                    ></A>
                    <% } %>
                </b>
                </div>
                <% } %>
                <tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=ForumsUtil.getCategoryTree(forum.getForumCategory())%>'>
                    <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<jsp:getProperty name="category" property="ID"/>" class="rtbcLink">
                        <jsp:getProperty name="category" property="name"/>
                    </A> >
                </tc-webtag:iterator>
                <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<jsp:getProperty name="forum" property="ID"/>&mc=<jsp:getProperty name="forum" property="messageCount"/>" class="rtbcLink">
                    <jsp:getProperty name="forum" property="name"/>
                </A> >
                <jsp:getProperty name="thread" property="name"/>
            </b>
        </td>
    </tr></table>

<%-------------POSTS---------------%>
<tc-webtag:iterator id="message" type="com.jivesoftware.forum.ForumMessage" iterator='<%=(Iterator)request.getAttribute("messages")%>'>
    <table cellpadding="0" cellspacing="0" class="rtTable">
        <tr>
            <td class="rtHeader" colspan="2">
                <% String msgBodyID = "msgBody" + message.getID();
                    String ratingsID = "ratings" + message.getID();
                    int ratingCount = -1;
                    int posRatings = -1;
                    int negRatings = -1; %>
                <div style="float: right; padding-left: 5px; white-space: nowrap;">
                    <% int editCount = historyBean.getEditCount(message.getID(), DBMS.FORUMS_DATASOURCE_NAME);
                        if (editCount > 0) { %>
                    <a href="?module=RevisionHistory&<%=ForumConstants.MESSAGE_ID%>=<jsp:getProperty name="message" property="ID"/>" class="rtbcLink" title="Last updated <tc-webtag:beanWrite name="message" property="modificationDate" format="EEE, MMM d, yyyy 'at' h:mm a z"/>"><%=ForumsUtil.display(editCount, "edit")%></a>
                    |
                    <% } %>
                    <a name=
                        <jsp:getProperty name="message" property="ID"/>
                            >
                        <tc-webtag:beanWrite name="message" property="creationDate" format="EEE, MMM d, yyyy 'at' h:mm a z"/></a>
                </div>
                <% if (ratingManager.isRatingsEnabled() && user != null && ForumsUtil.showRatings(user)) { %>
                <a class="pointer" onMouseOver="this.style.color='#FF0000'"; onMouseOut="this.style.color='#333'"; onclick="toggle('<%=msgBodyID%>')";>
                    <jsp:getProperty name="message" property="subject"/></ a>
                        <%  } else { %>
                        <jsp:getProperty name="message" property="subject"/>
                        <%  } %>
                        <%  if (message.getParentMessage() != null) { %>
                    (response to
                    <A href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<%=message.getParentMessage().getID()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="rtbcLink">post</A><%if (message.getParentMessage().getUser() != null) {%>
                    by
                        <studio:handle coderId="<%=message.getParentMessage().getUser().getID()%>"/>
                        <%}%>)
                        <%  } %>
                        <%

                        if (ratingManager.isRatingsEnabled() && user != null && ForumsUtil.showRatings(user)) {
                     int[] ratings = ForumsUtil.getRatings(ratingManager, message);
                     posRatings = ratings[0];
                     negRatings = ratings[1];
                     ratingCount = posRatings+negRatings;

                        %>
                    | Feedback: <span id="<%=ratingsID%>">(+<%=posRatings%>/-<%=negRatings%>)</span> |
                    <a href="javascript:void(0)" onclick="rate('<%=message.getID()%>','2')" class="rtbcLink">[+]</a>
                    <a href="javascript:void(0)" onclick="rate('<%=message.getID()%>','1')" class="rtbcLink">[-]</a>
                        <%  } %>
                    |
                    <A href="?module=Post&<%=ForumConstants.POST_MODE%>=Reply&<%=ForumConstants.MESSAGE_ID%>=<jsp:getProperty name="message" property="ID"/>" class="rtbcLink">Reply</A>
                        <%  if (message.getUser() != null && message.getUser().equals(user)) { %>
                    |
                    <A href="?module=Post&<%=ForumConstants.POST_MODE%>=Edit&<%=ForumConstants.MESSAGE_ID%>=<jsp:getProperty name="message" property="ID"/>" class="rtbcLink">Edit</A>
                        <%  } %>
            </td>
        </tr>
        <% double pct = ratingCount <= 0 ? 0 : 100 * (double) (posRatings) / (double) (ratingCount);
            String msgBodyDisplay = ForumsUtil.collapsePost(user, pct, ratingCount, thread.getMessageCount()) ? "display:none" : "";
        %>
        <tr id="<%=msgBodyID%>" style="<%=msgBodyDisplay%>">
            <td class="rtPosterCell">
                <div class="rtPosterSpacer">
                    <% if (ForumsUtil.displayMemberPhoto(user, message.getUser())) { %>
                    <img src="<%=message.getUser().getProperty("imagePath")%>" width="55" height="61" border="0" class="rtPhoto"/>
                    <br>
                    <% } %>
                    <span class="bodyText"><%if (message.getUser() != null) {%><studio:handle coderId="<%=message.getUser().getID()%>"/><%}%></span>
                    <br><%if (message.getUser() != null) {%><A href="?module=History&<%=ForumConstants.USER_ID%>=<%=message.getUser().getID()%>"><%=ForumsUtil.display(forumFactory.getUserMessageCount(message.getUser()), "post")%></A><%}%>
                </div>
            </td>
            <% if (ForumsUtil.highlightPost(user, pct, ratingCount)) { %>
            <td class="rtTextCellHlt" width="100%">
                <jsp:getProperty name="message" property="body"/>
            </td>
            <% } else { %>
            <td class="rtTextCell" width="100%">
                <jsp:getProperty name="message" property="body"/>
            </td>
            <% } %>
        </tr>
    </table>
</tc-webtag:iterator>
<%-------------POSTS END---------------%>

<div><b>
    <% if (paginator.getNumPages() > 1) { %>
    <div style="float:right; text-align:right; class=" rtbc">< b>
        <%  if (paginator.getPreviousPage()) { %>
        <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&<%=ForumConstants.START_IDX%>=<jsp:getProperty name="paginator" property="previousPageStart"/>&mc=<jsp:getProperty name="thread" property="messageCount"/><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="rtbcLink">
            &lt;&lt;PREV</A>&#160;&#160;&#160;
        <%  } %> [
        <%

        Page[] pages = paginator.getPages(5);
            for (int i=0; i<pages.length; i++) {


        %> <%  if (pages[i] != null) { %>
        <%  if (pages[i].getNumber() == paginator.getPageIndex()+1) { %>
        <span class="currentPage"><%= pages[i].getNumber() %></span>
        <%  } else { %>
        <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&<%=ForumConstants.START_IDX%>=<%=pages[i].getStart()%>&mc=<jsp:getProperty name="thread" property="messageCount"/><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="rtbcLink">
            <%= pages[i].getNumber() %></A>
        <%  } %>
        <%  } else { %> ... <%  } %>
        <%  } %> ]
        <%  if (paginator.getNextPage()) { %>
        &#160;&#160;&#160;<A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&<%=ForumConstants.START_IDX%>=<jsp:getProperty name="paginator" property="nextPageStart"/>&mc=<jsp:getProperty name="thread" property="messageCount"/><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="rtbcLink">NEXT
        ></A>
        <%  } %>
</b><br><br>
    <a href="?module=RSS&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>"><img border="none" src="http://www.topcoder.com/i/interface/btn_rss.gif"/></a>
</div>
<% } else { %>
<div style="float:right; text-align:right;">
    <a href="?module=RSS&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>"><img border="none" src="http://www.topcoder.com/i/interface/btn_rss.gif"/></a>
</div>
<% } %>
<tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=ForumsUtil.getCategoryTree(forum.getForumCategory())%>'>
    <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<jsp:getProperty name="category" property="ID"/>&mc=<jsp:getProperty name="category" property="messageCount"/>" class="rtbcLink">
        <jsp:getProperty name="category" property="name"/>
    </A> >
</tc-webtag:iterator>
<A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<jsp:getProperty name="forum" property="ID"/>&mc=<jsp:getProperty name="forum" property="messageCount"/>" class="rtbcLink">
    <jsp:getProperty name="forum" property="name"/>
</A> >
<jsp:getProperty name="thread" property="name"/>
</b>
<% if (showPrevNextThreads && (nextThread != null || prevThread != null)) { %><br>
<% if (prevThread != null) { %>
<% prevPost = ForumsUtil.getLatestMessage(prevThread);
    prevTrackerClass = (user == null || readTracker.getReadStatus(user, prevPost) == ReadTracker.READ) ? "rtbcLink" : "rtLinkBold"; %>
<A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=prevThread.getID()%>&<%=ForumConstants.START_IDX%>=0&mc=<%=prevThread.getMessageCount()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="<%=prevTrackerClass%>">Previous
    Thread</A>
<% } else { %>
Previous Thread
<% } %>&#160;|&#160;
<% if (nextThread != null) { %>
<% nextPost = ForumsUtil.getLatestMessage(nextThread);
    nextTrackerClass = (user == null || readTracker.getReadStatus(user, nextPost) == ReadTracker.READ) ? "rtbcLink" : "rtLinkBold"; %>
<A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=nextThread.getID()%>&<%=ForumConstants.START_IDX%>=0&mc=<%=nextThread.getMessageCount()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="<%=nextTrackerClass%>">Next
    Thread</A>
<% } else { %>
Next Thread
<% } %>
<% } %>
</div>

</div>
<img src="/i/studio/layout/contentInS.gif" alt="" style="display:block;"/>
</div>
<jsp:include page="foot.jsp"/>
<img src="/i/studio/layout/contentOutS.gif" alt="" style="display:block;"/>
</div>
</div>

</body>
</html>