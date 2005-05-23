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

<html>
<head>
<title>TopCoder Forums</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="/css/roundTables.css"/>
<link type="text/css" rel="stylesheet" href="/css/stats.css"/>
<jsp:include page="script.jsp" />

</head>

<body>

<jsp:include page="top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">

<!-- Left Column Begins-->
      <td width="180">
         <jsp:include page="includes/global_left.jsp">
            <jsp:param name="level1" value=""/>
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

<div class="topLinksL">
<A href="/" class="rtbcLink">Search:</A>&#160;
<input name="q" size="20" maxlength="100" value="" id="terms" type="text">
<input value="Search" onclick="" type="submit">
&#160;<a href="" class="rtLinkNew">Search Tips</a>
</div>
<div class="topLinksR">
<A href="?module=History&<%=ForumConstants.USER_ID%>=<jsp:getProperty name="user" property="ID"/>" class="rtbcLink">Post History</A>&#160;&#160;|&#160;&#160;<A href="?module=Watches" class="rtbcLink">My Watches</A>&#160;&#160;|&#160;&#160;<A href="?module=Settings" class="rtbcLink">User Settings</A><br>
</div>

<%  if (status.equals("save")) { %>
		<span class="rtTextCell">Settings updated successfully.</span><br/>
<%	} else if (status.equals("error")) { %>
		<span class="rtTextCell">Settings updated with errors:</span><br/>
		<tc-webtag:errorIterator id="errSettings" name="<%=ForumConstants.SETTINGS_STATUS%>"><%=errSettings%></tc-webtag:errorIterator><br/>
<%  } %>

<div style="clear:both;">
<span class="bodySubtitle">User Settings</span><br>
<table cellpadding="0" cellspacing="0" class="rtTable">
   <tr>
      <td class="rtHeader" colspan="2">General Settings</td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Threads per Forum Page:</strong></td>
      <td class="rtTextCell100">
		<select size="1" name="threadsPerPage">
		<%  int[] threadCounts = { 10, 15, 25, 50 };
			int threadRange = Integer.parseInt(user.getProperty("jiveThreadRange"));
			for (int i=0; i<threadCounts.length; i++) {
				if (threadCounts[i] == threadRange) { %>
					<option value="<%=threadCounts[i]%>" selected="selected"><%=threadCounts[i]%></option>
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
			int messageRange = Integer.parseInt(user.getProperty("jiveMessageRange"));
			for (int i=0; i<messageCounts.length; i++) {
				if (messageCounts[i] == messageRange) { %>
					<option value="<%=messageCounts[i]%>" selected="selected"><%=messageCounts[i]%></option>
			<%	} else { %>
					<option value="<%=messageCounts[i]%>"><%=messageCounts[i]%></option>
			<%	}
			} %>
		</select>
      </td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Thread Page View:</strong></td>
      <td class="rtTextCell100">
		<select size="1" name="threadMode">
		<%  String[][] threadModes = {{"flat","Flat"},{"threaded","Threaded"},{"tree","Tree"}};
			String currentMode = user.getProperty("jiveThreadMode");
			for (int i=0; i<threadModes.length; i++) {
				if (threadModes[i][0].equals(currentMode)) { %>
					<option value="<%=threadModes[i][0]%>" selected="selected"><%=threadModes[i][1]%></option>
			<%	} else { %>
					<option value="<%=threadModes[i][0]%>"><%=threadModes[i][1]%></option>
			<%	}
			} %>
		</select>
      </td>
   </tr>
   <tr>
      <td class="rtHeader" colspan="2">Watch Preferences</td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Always watch threads I create:</strong></td>
      <td class="rtTextCell100">
<input name="autoWatchNewTopics" value="true" id="autoWatchNewTopicsYes" type="radio" 
	checked=<%= (user.getProperty("jiveAutoWatchNewTopics").equals("true")) ? "checked" : ""%>>
<label for="autoWatchNewTopicsYes">Yes</label>
&#160;
<input name="autoWatchNewTopics" value="false" id="autoWatchNewTopicsNo" type="radio" 
	checked=<%= (user.getProperty("jiveAutoWatchNewTopics").equals("true")) ? "" : "checked"%>>
<label for="autoWatchNewTopicsNo">No</label>
      </td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Always watch threads I reply to:</strong></td>
      <td class="rtTextCell100">
<input name="autoWatchReplies" value="true" id="autoWatchRepliesYes" type="radio" 
	checked=<%= (user.getProperty("jiveAutoWatchReplies").equals("true")) ? "checked" : ""%>>
<label for="autoWatchRepliesYes">Yes</label>
&#160;
<input name="autoWatchReplies" value="false" id="autoWatchRepliesNo" type="radio" 
	checked=<%= (user.getProperty("jiveAutoWatchReplies").equals("true")) ? "" : "checked"%>>
<label for="autoWatchRepliesNo">No</label>
      </td>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Send watch emails:</strong></td>
      <td class="rtTextCell100">
         <select name="watchFrequency">
         	<option value="<%= UserSettingsAction.FREQUENCY_IMMEDIATELY %>" 
       			selected=<%= (UserSettingsAction.FREQUENCY_IMMEDIATELY == selectedWatchFrequency.intValue()) ? "selected" : ""%>>Immediately (default)</option>
         	<option value="<%= UserSettingsAction.FREQUENCY_ONCE_A_DAY %>" 
       			selected=<%= (UserSettingsAction.FREQUENCY_ONCE_A_DAY == selectedWatchFrequency.intValue()) ? "selected" : ""%>>Once per day</option>
         	<option value="<%= UserSettingsAction.FREQUENCY_EVERY_OTHER_DAY %>" 
       			selected=<%= (UserSettingsAction.FREQUENCY_EVERY_OTHER_DAY == selectedWatchFrequency.intValue()) ? "selected" : ""%>>Every other day</option>
         	<option value="<%= UserSettingsAction.FREQUENCY_ONCE_A_WEEK %>" 
       			selected=<%= (UserSettingsAction.FREQUENCY_ONCE_A_WEEK == selectedWatchFrequency.intValue()) ? "selected" : ""%>>Once per week</option>
         </select>
         (<%= user.getEmail() %>)
      </td>
   </tr>
   </tr>
</table>
<div align="right">
<A href="/?module=Settings&status=save"><img src="/i/roundTables/save.gif" alt="Save" border="0" /></A>
</div>

</div>

<p><br></p>

</td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>