<%@ page import="com.jivesoftware.base.JiveGlobals,
                 com.jivesoftware.forum.action.UserSettingsAction,
                 com.topcoder.web.forums.ForumConstants,
                 com.topcoder.web.forums.controller.request.Settings"
%>

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<tc-webtag:useBean id="user" name="user" type="com.jivesoftware.base.User" toScope="request"/>
<tc-webtag:useBean id="status" name="status" type="java.lang.String" toScope="request"/>
<tc-webtag:useBean id="selectedWatchFrequency" name="selectedWatchFrequency" type="java.lang.Integer" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<%  String section = (String)request.getParameter(ForumConstants.SETTINGS_SECTION);    
    if (section == null) { section = "gen"; } %>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Aolicq Developer Challenge :: Powered by TopCoder</title>

<jsp:include page="style.jsp">
    <jsp:param name="key" value="tc_aolicq_forums"/>
</jsp:include>
<script type="text/javascript">
<!--
var section;
function toggleTabs(anchor,id) {
   var genStyle = (id=="gen")?'':'none';
   var watchStyle = (id=="watch")?'':'none';
   var rateStyle = (id=="rate")?'':'none';
   if(anchor.blur)anchor.blur();
   if(id=='gen'){
      document.getElementById('tabGen').className = 'tableTabOn';
      document.getElementById('tabWatch').className = 'tableTabOff';
      document.getElementById('tabRate').className = 'tableTabOff';
   }else if(id=='watch'){
      document.getElementById('tabGen').className = 'tableTabOff';
      document.getElementById('tabWatch').className = 'tableTabOn';
      document.getElementById('tabRate').className = 'tableTabOff';
   }else if(id=='rate'){
      document.getElementById('tabGen').className = 'tableTabOff';
      document.getElementById('tabWatch').className = 'tableTabOff';
      document.getElementById('tabRate').className = 'tableTabOn';
   }
   for (i=1; i<=11; i++) {
      document.getElementById('bodyGen'+i).style.display = genStyle;
   }
   for (i=1; i<=5; i++) {
      document.getElementById('bodyWatch'+i).style.display = watchStyle;
   }
   for (i=1; i<=4; i++) {
      document.getElementById('bodyRate'+i).style.display = rateStyle;
   }
   document.getElementById('infoRate').style.display = rateStyle;
}
//-->
</script>

<style type="text/css">
<!--
.rtDesc { font-size: 11px; }
-->
</style>

<body onLoad="toggleTabs('','gen')">

<jsp:include page="tcTop.jsp"/>

<div align="center">
    <div id="aimFrame">
        <div id="aimFrameN">
            <div id="aimFrameS">

                <jsp:include page="aolicqTop.jsp"/>

                <div class="content" align="right">
                    <div class="contentTexture">
                        <jsp:include page="topNav.jsp"/>
                        <div class="siteBoxFull">

<table cellpadding="0" cellspacing="0" class="rtbcTable">
<tr>
   <td class="categoriesBox" style="padding-right: 20px;">
      <jsp:include page="categoriesHeader.jsp" />
   </td>
   <td nowrap="nowrap" valign="top" width="100%" style="padding-right: 20px;">
      <jsp:include page="searchHeader.jsp" />
    </td>
    <td align="right" nowrap="nowrap" valign="top">
        <a href="?module=History" class="rtbcLink">My Post History</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="?module=Watches" class="rtbcLink">My Watches</a>&nbsp;&nbsp;|&nbsp;&nbsp;User Settings<br />
    </td>
</tr>
<tr>
	<td colspan="2" style="padding-bottom:3px;">
		<b><a href="?module=Main" class="rtbcLink">Forums</a> > User Settings</b>
	</td>
</tr>
</table>

<%   if (status.equals("error")) { %>
<br /><br /><span class="rtHeader"><span class="bigRed">Settings updated with errors:</span></span>
<tc-webtag:errorIterator id="errSettings" name="<%=ForumConstants.STATUS%>"><%=errSettings%></tc-webtag:errorIterator><br /><br />
<%  } %>

<div class="tableTabOff" id="tabGen"><a href="javascript:void(0)" onClick="toggleTabs(this,'gen')" class="tableTabOff">General Settings</a></div>
<div class="tableTabOff" id="tabWatch"><a href="javascript:void(0)" onClick="toggleTabs(this,'watch')" class="tableTabOff">Watch Preferences</a></div>
<div class="tableTabOff" id="tabRate"><a href="javascript:void(0)" onClick="toggleTabs(this,'rate')" class="tableTabOff">Rating Preferences</a></div>
<br  clear="all"/>

<form name="form1" method="post" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>">
<tc-webtag:hiddenInput name="module" value="Settings"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.SETTINGS_SECTION%>" value="gen"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.STATUS%>" value="save"/>
<table cellpadding="0" cellspacing="0" class="rtTable">
   <tr style="display:none;" id="bodyGen1">
        <td class="rtHeader" colspan="2">General Settings</td>
   </tr>
   <tr style="display:none;" id="bodyGen2">
      <td class="rtThreadCell" nowrap="nowrap"><strong>Forums per Category page:</strong></td>
      <td class="rtThreadCell" style="width:100%;">
      <select size="1" name="forumsPerPage">
      <%  int[] forumCounts = { 10, 15, 25 };
          int forumRange = ForumConstants.DEFAULT_FORUM_RANGE;
          try {
              forumRange = Integer.parseInt(user.getProperty("jiveForumRange"));
          } catch (Exception ignored) {}
          for (int i=0; i<forumCounts.length; i++) {
	          if (forumCounts[i] == forumRange) { %>
	              <option value="<%=forumCounts[i]%>" selected><%=forumCounts[i]%></option>
	      <%  } else { %>
	              <option value="<%=forumCounts[i]%>"><%=forumCounts[i]%></option>
	      <%  }
          } %>
      </select>
      </td>
   </tr>
   <tr style="display:none;" id="bodyGen3">
      <td class="rtThreadCell" nowrap="nowrap"><strong>Threads per Forum page:</strong></td>
      <td class="rtThreadCell">
      <select size="1" name="threadsPerPage">
      <%  int[] threadCounts = { 10, 15, 25, 50 };
            int threadRange = JiveGlobals.getJiveIntProperty("skin.default.defaultThreadsPerPage",
                ForumConstants.DEFAULT_THREAD_RANGE);
            try {
                threadRange = Integer.parseInt(user.getProperty("jiveThreadRange"));
            } catch (Exception ignored) {}
         for (int i=0; i<threadCounts.length; i++) {
            if (threadCounts[i] == threadRange) { %>
               <option value="<%=threadCounts[i]%>" selected><%=threadCounts[i]%></option>
         <%   } else { %>
               <option value="<%=threadCounts[i]%>"><%=threadCounts[i]%></option>
         <%   }
         } %>
      </select>
      </td>
   </tr>
   <tr style="display:none;" id="bodyGen4">
      <td class="rtThreadCell" nowrap="nowrap"><strong>Messages per Thread page:</strong></td>
      <td class="rtThreadCell">
      <select size="1" name="messagesPerPage">
      <%  int[] messageCounts = { 10, 15, 25, 50 };
         int messageRange = JiveGlobals.getJiveIntProperty("skin.default.defaultMessagesPerPage",
                ForumConstants.DEFAULT_MESSAGE_RANGE);
            try {
                messageRange = Integer.parseInt(user.getProperty("jiveMessageRange"));
            } catch (Exception ignored) {}
         for (int i=0; i<messageCounts.length; i++) {
            if (messageCounts[i] == messageRange) { %>
               <option value="<%=messageCounts[i]%>" selected><%=messageCounts[i]%></option>
         <%   } else { %>
               <option value="<%=messageCounts[i]%>"><%=messageCounts[i]%></option>
         <%   }
         } %>
      </select>
      </td>
   </tr>
   <tr style="display:none;" id="bodyGen5">
      <td class="rtThreadCell" nowrap="nowrap"><strong>Messages per Post History page:</strong></td>
      <td class="rtThreadCell">
      <select size="1" name="messagesPerHistoryPage">
      <% int[] historyCounts = { 10, 15, 25, 50 };
         int historyRange = ForumConstants.DEFAULT_HISTORY_RANGE;
         try {
            historyRange = Integer.parseInt(user.getProperty("jiveHistoryRange"));
         } catch (Exception ignored) {}
         for (int i=0; i<historyCounts.length; i++) {
            if (historyCounts[i] == historyRange) { %>
               <option value="<%=historyCounts[i]%>" selected><%=historyCounts[i]%></option>
         <%   } else { %>
               <option value="<%=historyCounts[i]%>"><%=historyCounts[i]%></option>
         <%   }
         } %>
      </select>
      </td>
   </tr>
   <tr style="display:none;" id="bodyGen6">
      <td class="rtThreadCell" nowrap="nowrap"><strong>Results per Search page:</strong></td>
      <td class="rtThreadCell">
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
   <tr style="display:none;" id="bodyGen7">
      <td class="rtThreadCell" nowrap="nowrap"><strong>Default thread page view:</strong></td>
      <td class="rtThreadCell">
      <select size="1" name="threadMode">
      <%  String[][] threadModes = {{"flat","Flat (oldest to newest)"},{"flat_new","Flat (newest to oldest)"},{"threaded","Threaded"},{"tree","Tree"}};
         String currentMode = ForumConstants.DEFAULT_GUEST_THREAD_VIEW;
            try {
                currentMode = user.getProperty("jiveThreadMode");
            } catch (Exception ignored) {}
         for (int i=0; i<threadModes.length; i++) {
            if (threadModes[i][0].equals(currentMode)) { %>
               <option value="<%=threadModes[i][0]%>" selected><%=threadModes[i][1]%></option>
         <%   } else { %>
               <option value="<%=threadModes[i][0]%>"><%=threadModes[i][1]%></option>
         <%   }
         } %>
      </select>
      </td>
   </tr>
   <tr style="display:none;" id="bodyGen8">
      <td class="rtThreadCell" nowrap="nowrap"><strong>Default flat page view:</strong></td>
      <td class="rtThreadCell">
      <select size="1" name="flatMode">
      <%  String[][] flatModes = {{"flat","Oldest to newest&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;"},{"flat_new","Newest to oldest"}};
          String flatMode = ForumConstants.DEFAULT_FLAT_THREAD_VIEW;
            try {
                flatMode = user.getProperty("jiveFlatMode");
            } catch (Exception ignored) {}
         for (int i=0; i<flatModes.length; i++) {
            if (flatModes[i][0].equals(flatMode)) { %>
               <option value="<%=flatModes[i][0]%>" selected><%=flatModes[i][1]%></option>
         <%   } else { %>
               <option value="<%=flatModes[i][0]%>"><%=flatModes[i][1]%></option>
         <%   }
         } %>
      </select>
      </td>
   </tr>
   <tr style="display:none;" id="bodyGen9">
      <td class="rtThreadCell" nowrap="nowrap"><strong>Show previous/next threads:</strong></td>
      <td class="rtThreadCell">
        <input name="showPrevNextThreads" value="true" id="showPrevNextThreadsYes" type="radio"
            <%= (user.getProperty("jiveShowPrevNextThreads") == null || "true".equals(user.getProperty("jiveShowPrevNextThreads"))) ? "checked" : ""%>>
        <label for="jiveShowPrevNextThreadsYes">Yes</label>
        &#160;
        <input name="showPrevNextThreads" value="false" id="showPrevNextThreadsNo" type="radio"
            <%= ("false".equals(user.getProperty("jiveShowPrevNextThreads"))) ? "checked" : ""%>>
        <label for="jiveShowPrevNextThreadsNo">No</label>
      </td>
   </tr>
   <tr style="display:none;" id="bodyGen10">
      <td class="rtThreadCell" nowrap="nowrap"><strong>Display my member photo:</strong></td>
      <td class="rtThreadCell">
      <input name="displayMemberPhoto" value="true" id="displayMemberPhotoYes" type="radio"
          <%= (user.getProperty("jiveDisplayMemberPhoto") == null || "true".equals(user.getProperty("jiveDisplayMemberPhoto"))) ? "checked" : ""%>>
      <label for="jiveDisplayMemberPhotoYes">Yes</label>
      &#160;
      <input name="displayMemberPhoto" value="false" id="displayMemberPhotoNo" type="radio"
          <%= ("false".equals(user.getProperty("jiveDisplayMemberPhoto"))) ? "checked" : ""%>>
      <label for="jiveDisplayMemberPhotoNo">No</label>
      </td>
   </tr>
   <tr style="display:none;" id="bodyGen11">
      <td class="rtThreadCell" nowrap="nowrap"><strong>Display member photos:</strong></td>
      <td class="rtThreadCell">
      <input name="displayAllMemberPhotos" value="true" id="displayAllMemberPhotosYes" type="radio"
          <%= (user.getProperty("jiveDisplayAllMemberPhotos") == null || "true".equals(user.getProperty("jiveDisplayAllMemberPhotos"))) ? "checked" : ""%>>
      <label for="jiveDisplayAllMemberPhotosYes">Yes</label>
      &#160;
      <input name="displayAllMemberPhotos" value="false" id="displayAllMemberPhotosNo" type="radio"
          <%= ("false".equals(user.getProperty("jiveDisplayAllMemberPhotos"))) ? "checked" : ""%>>
      <label for="jiveDisplayAllMemberPhotosNo">No</label>
      </td>
   </tr>
   <tr style="display:none;" id="bodyWatch1">
      <td class="rtHeader" colspan="2">Watch Preferences</td>
   </tr>
   <tr style="display:none;" id="bodyWatch2">
      <td class="rtThreadCell" nowrap="nowrap"><strong>Always watch threads I create:</strong></td>
      <td class="rtThreadCell" style="width:100%;">
      <input name="autoWatchNewTopics" value="true" id="autoWatchNewTopicsYes" type="radio"
         <%= ("true".equals(user.getProperty("jiveAutoWatchNewTopics"))) ? "checked" : ""%>>
      <label for="autoWatchNewTopicsYes">Yes</label>
      &#160;
      <input name="autoWatchNewTopics" value="false" id="autoWatchNewTopicsNo" type="radio"
         <%= (user.getProperty("jiveAutoWatchNewTopics") == null || "false".equals(user.getProperty("jiveAutoWatchNewTopics"))) ? "checked" : ""%>>
      <label for="autoWatchNewTopicsNo">No</label>
      </td>
   </tr>
   <tr style="display:none;" id="bodyWatch3">
      <td class="rtThreadCell" nowrap="nowrap"><strong>Always watch threads I reply to:</strong></td>
      <td class="rtThreadCell">
      <input name="autoWatchReplies" value="true" id="autoWatchRepliesYes" type="radio"
         <%= ("true".equals(user.getProperty("jiveAutoWatchReplies"))) ? "checked" : ""%>>
      <label for="autoWatchRepliesYes">Yes</label>
      &#160;
      <input name="autoWatchReplies" value="false" id="autoWatchRepliesNo" type="radio"
         <%= (user.getProperty("jiveAutoWatchReplies") == null || "false".equals(user.getProperty("jiveAutoWatchReplies"))) ? "checked" : ""%>>
      <label for="autoWatchRepliesNo">No</label>
      </td>
   </tr>
   <tr style="display:none;" id="bodyWatch4">
      <td class="rtThreadCell" nowrap="nowrap"><strong>Mark watched threads as read:</strong></td>
      <td class="rtThreadCell">
      <input name="markWatchesRead" value="true" id="markWatchesReadYes" type="radio"
         <%= ("true".equals(user.getProperty("markWatchesRead"))) ? "checked" : ""%>>
      <label for="markWatchesReadYes">Yes</label>
      &#160;
      <input name="markWatchesRead" value="false" id="markWatchesReadNo" type="radio"
         <%= (user.getProperty("markWatchesRead") == null || "false".equals(user.getProperty("markWatchesRead"))) ? "checked" : ""%>>
      <label for="markWatchesReadNo">No</label>
      </td>
   </tr>
   <tr style="display:none;" id="bodyWatch5">
      <td class="rtThreadCell" nowrap="nowrap"><strong>Send watch emails:</strong></td>
      <td class="rtThreadCell">
         <select size=1 name="watchFrequency">
            <option value="<%= UserSettingsAction.FREQUENCY_IMMEDIATELY %>"
                <%= (UserSettingsAction.FREQUENCY_IMMEDIATELY == selectedWatchFrequency.intValue()) ? "selected" : "" %>>Immediately (default)</option>
            <option value="<%= UserSettingsAction.FREQUENCY_ONCE_A_DAY %>"
                <%= (UserSettingsAction.FREQUENCY_ONCE_A_DAY == selectedWatchFrequency.intValue()) ? "selected" : "" %>>Once per day</option>
            <option value="<%= UserSettingsAction.FREQUENCY_EVERY_OTHER_DAY %>"
                <%= (UserSettingsAction.FREQUENCY_EVERY_OTHER_DAY == selectedWatchFrequency.intValue()) ? "selected" : "" %>>Every other day</option>
            <option value="<%= UserSettingsAction.FREQUENCY_ONCE_A_WEEK %>"
                <%= (UserSettingsAction.FREQUENCY_ONCE_A_WEEK == selectedWatchFrequency.intValue()) ? "selected" : "" %>>Once per week</option>
            <option value="<%= Settings.FREQUENCY_NEVER %>"
                <%= (Settings.FREQUENCY_NEVER == selectedWatchFrequency.intValue()) ? "selected" : "" %>>Never</option>
         </select>
         (<%= user.getEmail() %>)
      </td>
   </tr>
   <tr style="display:none;" id="bodyRate1">
        <td class="rtHeader" colspan="2">Rating Preferences</td>
   </tr>
   <tr style="display:none;" id="bodyRate2">
      <td class="rtThreadCell" nowrap="nowrap"><strong>Show ratings:</strong></td>
      <td class="rtThreadCell" style="width:100%;">
      <input name="showRatings" value="true" id="showRatingsYes" type="radio"
         <%= (user.getProperty("showRatings") == null || "true".equals(user.getProperty("showRatings"))) ? "checked" : ""%>>
      <label for="showRatingsYes">Yes</label>
      &#160;
      <input name="showRatings" value="false" id="showRatingsNo" type="radio"
         <%= ("false".equals(user.getProperty("showRatings"))) ? "checked" : ""%>>
      <label for="showRatingsNo">No</label>
      </td>
   </tr>
   <tr style="display:none;" id="bodyRate3">
      <td class="rtThreadCell" nowrap="nowrap"><strong>Highlight posts:</strong></td>
      <td class="rtThreadCell" valign="top">
      <select size="1" name="ratingHighlightThreshold">
      <%  int[] ratingHltPcts = { 50, 60, 70, 80, 90, 100 };
          int ratingHltPct = ForumConstants.DEFAULT_RATING_HIGHLIGHT_THRESHOLD;
          try {
              ratingHltPct = Integer.parseInt(user.getProperty("ratingHighlightThreshold"));
          } catch (Exception ignored) {}
          for (int i=0; i<ratingHltPcts.length; i++) {
            if (ratingHltPcts[i] == ratingHltPct) { %>
               <option value="<%=ratingHltPcts[i]%>" selected><%=ratingHltPcts[i]%></option>
         <%   } else { %>
               <option value="<%=ratingHltPcts[i]%>"><%=ratingHltPcts[i]%></option>
         <%   }
         } %>
      </select>
      % or higher rating with
      <select size="1" name="ratingHighlightMinCount">
      <%  int[] ratingHltCnts = { 1, 5, 10, 20, 50, 100 };
          int ratingHltCnt = ForumConstants.DEFAULT_RATING_HIGHLIGHT_MIN_COUNT;
          try {
              ratingHltCnt = Integer.parseInt(user.getProperty("ratingHighlightMinCount"));
          } catch (Exception ignored) {}
          for (int i=0; i<ratingHltCnts.length; i++) {
            if (ratingHltCnts[i] == ratingHltCnt) { %>
               <option value="<%=ratingHltCnts[i]%>" selected><%=ratingHltCnts[i]%></option>
         <%   } else { %>
               <option value="<%=ratingHltCnts[i]%>"><%=ratingHltCnts[i]%></option>
         <%   }
         } %>
      </select>
      or more votes
      </td>
   </tr>
   <tr style="display:none;" id="bodyRate4">
      <td class="rtThreadCell" nowrap="nowrap"><strong>Collapse posts:</strong></td>
      <td class="rtThreadCell" valign="top">
      <select size="1" name="ratingCollapseThreshold">
      <%  int[] ratingCollapsePcts = { 0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100 };
          int ratingCollapsePct = ForumConstants.DEFAULT_RATING_COLLAPSE_THRESHOLD;
          try {
              ratingCollapsePct = Integer.parseInt(user.getProperty("ratingCollapseThreshold"));
          } catch (Exception ignored) {}
          for (int i=0; i<ratingCollapsePcts.length; i++) {
            if (ratingCollapsePcts[i] == ratingCollapsePct) { %>
               <option value="<%=ratingCollapsePcts[i]%>" selected><%=ratingCollapsePcts[i]%></option>
         <%   } else { %>
               <option value="<%=ratingCollapsePcts[i]%>"><%=ratingCollapsePcts[i]%></option>
         <%   }
         } %>
      </select>
      % or lower rating with
      <select size="1" name="ratingCollapseMinCount">
      <%  int[] ratingCollapseCnts = { 0, 1, 5, 10, 20, 50, 100 };
          int ratingCollapseCnt = ForumConstants.DEFAULT_RATING_COLLAPSE_MIN_COUNT;
          try {
              ratingCollapseCnt = Integer.parseInt(user.getProperty("ratingCollapseMinCount"));
          } catch (Exception ignored) {}
          for (int i=0; i<ratingCollapseCnts.length; i++) {
            if (ratingCollapseCnts[i] == ratingCollapseCnt) { %>
               <option value="<%=ratingCollapseCnts[i]%>" selected><%=ratingCollapseCnts[i]%></option>
         <%   } else { %>
               <option value="<%=ratingCollapseCnts[i]%>"><%=ratingCollapseCnts[i]%></option>
         <%   }
         } %>
      </select>
      or more votes in threads with
      <select size="1" name="ratingCollapseMinMessages">
      <%  int[] ratingCollapseMsgs = { 1, 5, 10, 25, 50, 100 };
          int ratingCollapseMsg = ForumConstants.DEFAULT_RATING_COLLAPSE_MIN_MESSAGES;
          try {
              ratingCollapseMsg = Integer.parseInt(user.getProperty("ratingCollapseMinMessages"));
          } catch (Exception ignored) {}
          for (int i=0; i<ratingCollapseMsgs.length; i++) {
            if (ratingCollapseMsgs[i] == ratingCollapseMsg) { %>
               <option value="<%=ratingCollapseMsgs[i]%>" selected><%=ratingCollapseMsgs[i]%></option>
         <%   } else { %>
               <option value="<%=ratingCollapseMsgs[i]%>"><%=ratingCollapseMsgs[i]%></option>
         <%   }
         } %>
      </select>
      or more messages
      </td>
   </tr>
</table>

<span id="infoRate" class="rtDesc">TopCoder provides the ability to rate posts.  You may click the [+] next to the thread title if you think it is of high quality.   Similarly, you may click the [-] if it is of low quality.  We recommend that you also post your comments if you agree or disagree with the content of a post. Also, when ratings are enabled, you may click on a post's subject to expand or collapse the post.</span>

<div>
   <div style="float:right;">
   <input type="image" src="/i/events/aolicq/interface/btnSave.png"/>
   </div>
</div>
</form>

<br /><br /><br />

                        </div>
                        <div style="clear: both;">&nbsp;</div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<jsp:include page="tcFoot.jsp"/>

</body>
</html>