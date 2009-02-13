<%@ page import="com.topcoder.web.common.BaseServlet,
         		 com.topcoder.web.forums.ForumConstants,
         		 com.jivesoftware.forum.action.UserSettingsAction,
         		 java.util.*"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<tc-webtag:useBean id="user" name="user" type="com.jivesoftware.base.User" toScope="request"/>
<tc-webtag:useBean id="status" name="status" type="java.lang.String" toScope="request"/>
<tc-webtag:useBean id="selectedWatchFrequency" name="selectedWatchFrequency" type="java.lang.Integer" toScope="request"/>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<html>
<head>
<title>TopCoder Forums</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<link type="text/css" rel="stylesheet" href="/css/roundTables.css"/>
<link type="text/css" rel="stylesheet" href="/css/stats.css"/>
<jsp:include page="script.jsp" />

</head>

<body>

<jsp:include page="top_forums.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">

<!-- Left Column Begins-->
      <td width="180">
         <jsp:include page="includes/global_left.jsp">
            <jsp:param name="level1" value="forums"/>
            <jsp:param name="level2" value=""/>
         </jsp:include>
      </td>
<!-- Left Column Ends -->


<!-- Center Column Begins -->
        <td width="100%" class="rtBody">

            <jsp:include page="page_title.jsp" >
                <jsp:param name="image" value="forums"/>
                <jsp:param name="title" value="User Settings"/>
            </jsp:include>

<table cellpadding="0" cellspacing="0" class="rtbcTable">
<tr>
	<td nowrap="nowrap" valign="top">
   <span class="rtbc"><a href="<%=ForumConstants.FORUMS_DIR%>" class="rtbcLink">Forums</a> >> User Settings</span><br><br>
   </td>
   <td align="right" nowrap="nowrap" valign="top">
      <A href="?module=History" class="rtbcLink">My Post History</A>&#160;&#160;|&#160;&#160;<A href="?module=Watches" class="rtbcLink">My Watches</A>&#160;&#160;|&#160;&#160;<b>User Settings</b><br>
   </td>
</tr>
</table>

<%	if (status.equals("error")) { %>
<br><br><span class="rtHeader"><span class="bigRed">Settings updated with errors:</span></span>
<tc-webtag:errorIterator id="errSettings" name="<%=ForumConstants.SETTINGS_STATUS%>"><%=errSettings%></tc-webtag:errorIterator><br/><br/>
<%  } %>

<form name="form1" method="post" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>">
<tc-webtag:hiddenInput name="module" value="Settings"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.SETTINGS_STATUS%>" value="save"/>
<table cellpadding="0" cellspacing="0" class="rtTable">
   <tr>
      <td class="rtHeader" colspan="2">General Settings</td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Threads per Forum Page:</strong></td>
      <td class="rtTextCell100">
		<select size="1" name="threadsPerPage">
		<%  int[] threadCounts = { 10, 15, 25, 50 };
			int threadRange = ForumConstants.DEFAULT_THREAD_RANGE;
            try {
                threadRange = Integer.parseInt(user.getProperty("jiveThreadRange"));
            } catch (Exception ignored) {}
			for (int i=0; i<threadCounts.length; i++) {
				if (threadCounts[i] == threadRange) { %>
					<option value="<%=threadCounts[i]%>" selected><%=threadCounts[i]%></option>
			<%	} else { %>
					<option value="<%=threadCounts[i]%>"><%=threadCounts[i]%></option>
			<%	}
			} %>
		</select>
      </td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Messages per Thread Page:</strong></td>
      <td class="rtTextCell100">
		<select size="1" name="messagesPerPage">
		<%  int[] messageCounts = { 10, 15, 25, 50 };
			int messageRange = ForumConstants.DEFAULT_MESSAGE_RANGE;
            try {
                messageRange = Integer.parseInt(user.getProperty("jiveMessageRange"));
            } catch (Exception ignored) {}
			for (int i=0; i<messageCounts.length; i++) {
				if (messageCounts[i] == messageRange) { %>
					<option value="<%=messageCounts[i]%>" selected><%=messageCounts[i]%></option>
			<%	} else { %>
					<option value="<%=messageCounts[i]%>"><%=messageCounts[i]%></option>
			<%	}
			} %>
		</select>
      </td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Messages per Post History Page:</strong></td>
      <td class="rtTextCell100">
		<select size="1" name="messagesPerHistoryPage">
		<%  int[] historyCounts = { 10, 15, 25, 50 };
			int historyRange = ForumConstants.DEFAULT_HISTORY_RANGE;
			try {
				historyRange = Integer.parseInt(user.getProperty("jiveHistoryRange"));
			} catch (Exception ignored) {}
			for (int i=0; i<historyCounts.length; i++) {
				if (historyCounts[i] == historyRange) { %>
					<option value="<%=historyCounts[i]%>" selected><%=historyCounts[i]%></option>
			<%	} else { %>
					<option value="<%=historyCounts[i]%>"><%=historyCounts[i]%></option>
			<%	}
			} %>
		</select>
      </td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Results per Search Page:</strong></td>
      <td class="rtTextCell100">
        <select size="1" name="resultsPerSearchPage">
        <%  int[] searchCounts = { 10, 20, 30, 50 };
            int searchRange = ForumConstants.DEFAULT_SEARCH_RANGE;
            try {
                searchRange = Integer.parseInt(user.getProperty("jiveSearchRange"));
            } catch (Exception ignored) {}
            for (int i=0; i<searchCounts.length; i++) {
                if (searchCounts[i] == searchRange) { %>
                    <option value="<%=searchCounts[i]%>" selected><%=searchCounts[i]%></option>
            <%  } else { %>
                    <option value="<%=searchCounts[i]%>"><%=searchCounts[i]%></option>
            <%  }
            } %>
        </select>
      </td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Thread Page View:</strong></td>
      <td class="rtTextCell100">
		<select size="1" name="threadMode">
		<%  String[][] threadModes = {{"flat","Flat"},{"threaded","Threaded"},{"tree","Tree"}};
			String currentMode = ForumConstants.DEFAULT_GUEST_THREAD_VIEW;
            try {
                currentMode = user.getProperty("jiveThreadMode");
            } catch (Exception ignored) {}
			for (int i=0; i<threadModes.length; i++) {
				if (threadModes[i][0].equals(currentMode)) { %>
					<option value="<%=threadModes[i][0]%>" selected><%=threadModes[i][1]%></option>
			<%	} else { %>
					<option value="<%=threadModes[i][0]%>"><%=threadModes[i][1]%></option>
			<%	}
			} %>
		</select>
      </td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Display member photo:</strong></td>
      <td class="rtTextCell100">
		<input name="displayMemberPhoto" value="true" id="displayMemberPhotoYes" type="radio"
		    <%= (user.getProperty("jiveDisplayMemberPhoto") == null || "true".equals(user.getProperty("jiveDisplayMemberPhoto"))) ? "checked" : ""%>>
		<label for="jiveDisplayMemberPhotoYes">Yes</label>
		&#160;
		<input name="displayMemberPhoto" value="false" id="displayMemberPhotoNo" type="radio"
		    <%= ("false".equals(user.getProperty("jiveDisplayMemberPhoto"))) ? "checked" : ""%>>
		<label for="jiveDisplayMemberPhotoNo">No</label>
      </td>
   </tr>
   <tr>
      <td class="rtHeader" colspan="2">Watch Preferences</td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Always watch threads I create:</strong></td>
      <td class="rtTextCell100">
		<input name="autoWatchNewTopics" value="true" id="autoWatchNewTopicsYes" type="radio"
			<%= ("true".equals(user.getProperty("jiveAutoWatchNewTopics"))) ? "checked" : ""%>>
		<label for="autoWatchNewTopicsYes">Yes</label>
		&#160;
		<input name="autoWatchNewTopics" value="false" id="autoWatchNewTopicsNo" type="radio"
			<%= (user.getProperty("jiveAutoWatchNewTopics") == null || "false".equals(user.getProperty("jiveAutoWatchNewTopics"))) ? "checked" : ""%>>
		<label for="autoWatchNewTopicsNo">No</label>
      </td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Always watch threads I reply to:</strong></td>
      <td class="rtTextCell100">
		<input name="autoWatchReplies" value="true" id="autoWatchRepliesYes" type="radio"
			<%= ("true".equals(user.getProperty("jiveAutoWatchReplies"))) ? "checked" : ""%>>
		<label for="autoWatchRepliesYes">Yes</label>
		&#160;
		<input name="autoWatchReplies" value="false" id="autoWatchRepliesNo" type="radio"
			<%= (user.getProperty("jiveAutoWatchReplies") == null || "false".equals(user.getProperty("jiveAutoWatchReplies"))) ? "checked" : ""%>>
		<label for="autoWatchRepliesNo">No</label>
      </td>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Send watch emails:</strong></td>
      <td class="rtTextCell100">
         <select size=1 name="watchFrequency">
         	<option value="<%= UserSettingsAction.FREQUENCY_IMMEDIATELY %>"
       			<%= (UserSettingsAction.FREQUENCY_IMMEDIATELY == selectedWatchFrequency.intValue()) ? "selected" : "" %>>Immediately (default)</option>
         	<option value="<%= UserSettingsAction.FREQUENCY_ONCE_A_DAY %>"
       			<%= (UserSettingsAction.FREQUENCY_ONCE_A_DAY == selectedWatchFrequency.intValue()) ? "selected" : "" %>>Once per day</option>
         	<option value="<%= UserSettingsAction.FREQUENCY_EVERY_OTHER_DAY %>"
       			<%= (UserSettingsAction.FREQUENCY_EVERY_OTHER_DAY == selectedWatchFrequency.intValue()) ? "selected" : "" %>>Every other day</option>
         	<option value="<%= UserSettingsAction.FREQUENCY_ONCE_A_WEEK %>"
       			<%= (UserSettingsAction.FREQUENCY_ONCE_A_WEEK == selectedWatchFrequency.intValue()) ? "selected" : "" %>>Once per week</option>
         </select>
         (<%= user.getEmail() %>)
      </td>
   </tr>
   </tr>
</table>
<div align="right">
<input type="image" src="/i/roundTables/save.gif" alt="Save" />
</div></form>

<p><br/></p>

</td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>