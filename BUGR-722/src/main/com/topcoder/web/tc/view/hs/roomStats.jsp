<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java"
         import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.tc.Constants,
                 com.topcoder.web.tc.controller.request.hs.Base,
                 com.topcoder.web.tc.controller.request.hs.ListInfo,
                 com.topcoder.web.tc.controller.request.hs.RoundInfo,
                 java.util.Map" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>TopCoder High School Competitions</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

<script type="text/javascript" src="/js/popup.js"></script>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
    <jsp:param name="key" value="tc_stats"/>
</jsp:include>

<%
    Map resultMap = (Map) request.getAttribute("resultMap");
    ResultSetContainer seasons = (ResultSetContainer) resultMap.get("seasons");
    ResultSetContainer rounds = (ResultSetContainer) resultMap.get("rounds_for_season");
    ResultSetContainer rooms = (ResultSetContainer) resultMap.get("rooms_for_round");
    ResultSetContainer roomResult = (ResultSetContainer) resultMap.get("room_result");

    int rm = -1;
    String roomName = "";
    if (roomResult.getRowCount() > 0) {
        rm = roomResult.getIntItem(0, "room_id");
        roomName = roomResult.getStringItem(0, "name");
    }

    RoundInfo round = (RoundInfo) request.getAttribute("roundInfo");
    ListInfo li = (ListInfo) request.getAttribute("listInfo");

    int cr = Integer.parseInt((String) request.getAttribute("cr"));

    String coderName = null;

    java.text.SimpleDateFormat challengeTime = new java.text.SimpleDateFormat("mm:ss.SSS");
    challengeTime.setTimeZone(java.util.TimeZone.getTimeZone("GMT"));

%>


<script language="JavaScript">
    <!--
    function selectSeason(selection)
    {
        document.seasonForm.snid.value = selection.options[selection.selectedIndex].value;
        document.seasonForm.submit();
    }

    function selectRound(selection)
    {
        document.roundForm.rd.value = selection.options[selection.selectedIndex].value;
        document.roundForm.submit();
    }

    function selectRoom(selection)
    {
        document.roomForm.rm.value = selection.options[selection.selectedIndex].value;
        document.roomForm.submit();
    }

    function selectCoder(coderId)
    {
        document.coderForm.cr.value = coderId;
        document.coderForm.submit();
    }


    function goTo(selection) {
        sel = selection.options[selection.selectedIndex].value;
        if (sel && sel != '#') {
            window.location = '/longcontest/?module=ViewOverview&rd=' + sel;
        }
    }
    // -->
</script>


<STYLE TYPE="text/css">
    /* table cells were wrapping after minus sign */
    table.stat td.value, table.stat td.valueC, table.stat td.valueR {
        white-space: nowrap;
    }
</STYLE>

</head>

<body>

<jsp:include page="/top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="m_hs_stats"/>
    </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="high_school"/>
    <jsp:param name="title" value="Room Statistics"/>
</jsp:include>


<div style="float:right; padding-left:10px;" align="right">
    <% if (seasons.getRowCount() > 1) { %>
    <div style="padding-bottom:5px;">View another <strong>season</strong>:
        <tc-webtag:rscSelect name="snid" list="<%=seasons%>" fieldText="name" fieldValue="season_id" selectedValue="<%= round.getSeasonId() + "" %>" useTopValue="false" onChange="selectSeason(this)"/>
    </div>
    <% } %>
    <div style="padding-bottom:5px;">View another <strong>match</strong>:
        <tc-webtag:rscSelect name="rd" list="<%=rounds%>" fieldText="name" fieldValue="round_id" selectedValue="<%=  round.getRoundId() + "" %>" useTopValue="false" onChange="selectRound(this)"/>
    </div>

    <div style="padding-bottom:5px;">View another <strong>room</strong>:
        <tc-webtag:rscSelect name="rn" list="<%=rooms%>" fieldText="name" fieldValue="room_id" selectedValue="<%=  rm + "" %>" useTopValue="false" onChange="selectRoom(this)"/>
    </div>
</div>


<span class="subtitle"><%= round.getSeasonName() %> > <A href="/tc?<%=Constants.MODULE_KEY%>=HSRoundOverview&rd=<%= round.getRoundId() %>&snid=<%= round.getSeasonId() %>" class="bcLink"><%= round.getRoundName() %></A> > <%= roomName %></span>
<br>
<% if (round.getForumId() > 0) { %>
<A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=<%=round.getForumId() %>" class="bcLink">Discuss
    this contest</a>
<% } %>

<div class="pagingBox" style="clear:both;">&#160;</div>

<table class="stat" cellpadding="0" cellspacing="0" width="100%">
    <tr><td class="title" colspan="18">Room Statistics</td></tr>
    <tr>
        <td class="headerC" colspan="3">&#160;</td>
        <td class="headerR" colspan="2">Submissions</td>
        <td class="headerR" colspan="2">Defenses</td>
        <td class="headerR" colspan="2">Challenges</td>
        <td class="headerC B" colspan="2">&#160;</td>
        <td class="headerC" colspan="3">Rating</td>
    </tr>
    <tr>
        <td class="header" width="1%">&#160;</td>
        <td class="header" width="16%" colspan="2">
	   		<A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=HSRoomStats<tc-webtag:sort column="<%=roomResult.getColumnIndex("handle")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">
	            Coders
	        </A>
	    </td>   
        
        <td class="headerR" width="16%">
	   		<A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=HSRoomStats<tc-webtag:sort column="<%=roomResult.getColumnIndex("problems_submitted")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">
	            Qnty
	        </A>

        <td class="headerR">
	   		<A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=HSRoomStats<tc-webtag:sort column="<%=roomResult.getColumnIndex("submission_points")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">
	            Points
	        </A>

        <td class="headerR" width="16%">
	   		<A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=HSRoomStats<tc-webtag:sort column="<%=roomResult.getColumnIndex("challenge_attempts_received")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">
	            Qnty
	        </A>

        <td class="headerR">
	   		<A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=HSRoomStats<tc-webtag:sort column="<%=roomResult.getColumnIndex("defense_points")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">
	            Points
	        </A>

        <td class="headerR" width="16%">
	   		<A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=HSRoomStats<tc-webtag:sort column="<%=roomResult.getColumnIndex("challenge_attempts_made")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">
	            Qnty
	        </A>

        <td class="headerR">
	   		<A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=HSRoomStats<tc-webtag:sort column="<%=roomResult.getColumnIndex("challenge_points")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">
	            Points
	        </A>

        <td class="headerR" width="16%">
	   		<A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=HSRoomStats<tc-webtag:sort column="<%=roomResult.getColumnIndex("system_test_points")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">
	            System<br>Test
	        </A>

        <td class="headerR B" width="16%">
	   		<A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=HSRoomStats<tc-webtag:sort column="<%=roomResult.getColumnIndex("final_points")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">
	            Point<br>Total
	        </A>

        <td class="headerR">
	   		<A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=HSRoomStats<tc-webtag:sort column="<%=roomResult.getColumnIndex("old_rating")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">
	            Old
	        </A>
	        
        <td class="headerR">
	   		<A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=HSRoomStats<tc-webtag:sort column="<%=roomResult.getColumnIndex("new_rating")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">
	            New
	        </A>
        
        <td class="headerR">&#160;</td>
    </tr>

    <% boolean even = true; %>
    <rsc:iterator list="<%= roomResult%>" id="resultRow">
        <%

        even = !even;
             if (resultRow.getIntItem("coder_id") == cr) {
                 coderName = resultRow.getStringItem("handle");
             }


        %>
    <tr class='<%= resultRow.getIntItem("coder_id") == cr? "highlight" :
                   even? "dark":"light"
               %>'>
        <td class="value" style="vertical-align: middle;">
            <A href="javascript:selectCoder(<%= resultRow.getItem("coder_id").toString() %>)">
                <img src='<%= "/i/interface/" + (resultRow.getIntItem("coder_id") == cr? "exp_ed_w.gif" : "exp_w.gif") %>' alt=""/>
            </A>
        </td>
        <td class="value" nowrap>
            <tc-webtag:handle coderId='<%= resultRow.getItem("coder_id").toString() %>' context='hs_algorithm'/>
        </td>

        <td class="value" nowrap>
            <div id="d_CODERID_<%=resultRow.getItem("coder_id").toString() %>" class="popUp"><div><rsc:item name="team_name" row="<%=resultRow%>"/></div></div>
            <A href="/tc?module=HSTeamResults&rd=<%= round.getRoundId() %>&tmid=<%= resultRow.getItem("team_id") %>" id="a_CODERID" onMouseOver="popUp(this,'d_CODERID_<%=resultRow.getItem("coder_id").toString() %>')" onMouseOut="popHide()">
                <%= Base.cutTeamName(resultRow.getStringItem("team_name")) %></A>
        </td>

        <td class="valueR">
            <rsc:item name="problems_submitted" row="<%=resultRow%>"/>
        </td>
        <td class="valueR">
            <rsc:item name="submission_points" row="<%=resultRow%>" format="0.00"/>
        </td>

        <td class="valueR">
            <rsc:item name="challenge_attempts_received" row="<%=resultRow%>"/>
        </td>
        <td class="valueR">
            <rsc:item name="defense_points" row="<%=resultRow%>" format="0.00"/>
        </td>

        <td class="valueR">
            <rsc:item name="challenge_attempts_made" row="<%=resultRow%>"/>
        </td>
        <td class="valueR">
            <rsc:item name="challenge_points" row="<%=resultRow%>" format="0.00"/>
        </td>

        <td class="valueR">
            <rsc:item name="system_test_points" row="<%=resultRow%>" format="0.00"/>
        </td>
        <td class="valueR B">
            <rsc:item name="final_points" row="<%=resultRow%>" format="0.00"/>
        </td>

        <td class="valueR">
            <rsc:item name="old_rating" row="<%=resultRow%>"/>
        </td>
        <td class="valueR">
            <rsc:item name="new_rating" row="<%=resultRow%>"/>
        </td>
        <td class="value" style="vertical-align: middle;">
            <% if (resultRow.getIntItem("rating_change") < 0) { %>
            <IMG src="/i/interface/redDown.gif" border="0"/>
            <% } %>
            <% if (resultRow.getIntItem("rating_change") > 0) { %>
            <IMG src="/i/interface/greenUp.gif" border="0"/>
            <% } %>
        </TD>

</td>
</tr>
</rsc:iterator>
</table>

<br><br>

<% if ((cr >= 0) && (coderName != null)) {
    ResultSetContainer rscProblems = (ResultSetContainer) (ResultSetContainer) resultMap.get("Coder_Problems");
    ResultSetContainer rscChallenge = (ResultSetContainer) resultMap.get("Coder_Challenges");
    ResultSetContainer rscDefense = (ResultSetContainer) resultMap.get("Coder_Defenses");

    java.text.SimpleDateFormat sdfTime = new java.text.SimpleDateFormat("H:mm:ss.SSS");
    sdfTime.setTimeZone(java.util.TimeZone.getTimeZone("GMT"));

%>
<table class="stat" cellpadding="0" cellspacing="0" width="100%">
    <tr><td class="title" colspan="6">Problem Information > <%= coderName %></td></tr>
    <tr>
        <td class="header">Class</td>
        <td class="header">Method</td>
        <td class="header">Difficulty</td>
        <td class="headerC">Coding Time</td>
        <td class="header">Status</td>
        <td class="headerR">Points</td>
    </tr>
    <% even = true; %>
    <rsc:iterator list="<%= rscProblems %>" id="resultRow">
        <% even = !even; %>
        <tr class="<%=even?"dark":"light"%>">
            <td class="value">
                <A href='tc?module=HSProblemSolution&amp;cr=<%=cr%>&amp;rd=<%=round.getRoundId()%>&amp;pm=<%= resultRow.getIntItem("problem_id") %>'>
                    <rsc:item name="class_name" row="<%=resultRow%>"/></A></td>
            <td class="value"><rsc:item name="method_name" row="<%=resultRow%>"/></td>
            <td class="value"><rsc:item name="level_desc" row="<%=resultRow%>"/></td>

            <td class="valueC"><%= sdfTime.format(new java.sql.Time(resultRow.getLongItem("time_elapsed"))).toString() %>
            </td>
            <td class="value"><rsc:item name="end_status_text" row="<%=resultRow%>"/></td>
            <td class="valueR"><rsc:item name="submission_points" row="<%=resultRow%>" format="0.00"/></td>
        </tr>
    </rsc:iterator>
</table>

<br><br>

<% if (rscChallenge.getRowCount() > 0) { %>
<table class="stat" cellpadding="0" cellspacing="0" width="100%">
    <tr><td class="title" colspan="17">Challenge Information > <%= coderName %></td></tr>
    <tr>
        <td class="header">Challenger</td>
        <td class="header">Defendant</td>
        <td class="header">Problem</td>
        <td class="header">Succeeded</td>
        <td class="headerC">Challenge Time</td>        
        <td class="headerR">Points</td>
        <td class="headerC">&#160;</td>
    </tr>
    <% even = true; %>
    <rsc:iterator list="<%= rscChallenge %>" id="resultRow">
        <% even = !even; %>
        <tr class="<%=even?"dark":"light"%>">
            <td class="value">
                <tc-webtag:handle coderId="<%= resultRow.getItem("challenger_id").toString() %>" context='hs_algorithm'/></td>
            <td class="value">
                <tc-webtag:handle coderId="<%= resultRow.getItem("defendant_id").toString() %>" context='hs_algorithm'/></td>
            <td class="value"><rsc:item name="class_name" row="<%=resultRow%>"/></td>
            <td class="value"><rsc:item name="succeeded" row="<%=resultRow%>"/></td>
            <td class="valueC"> <%= resultRow.getItem("time_elapsed").getResultData() == null? "" : challengeTime.format(new java.sql.Time(Long.parseLong(resultRow.getItem("time_elapsed").toString()))).toString() %>                   </td>            
            <td class="valueR"><rsc:item name="challenger_points" row="<%=resultRow%>" format="0.00"/></td>
            <td class="valueC">
                <A href='tc?module=HSProblemSolution&amp;cr=<%=resultRow.getItem("defendant_id").toString()%>&amp;rd=<%=round.getRoundId()%>&amp;pm=<%= resultRow.getIntItem("problem_id") %>#Defenses'>
                    details</A></td>
        </tr>
    </rsc:iterator>
</table>

<br><br>

<% } // rscChallenge has rows %>

<% if (rscDefense.getRowCount() > 0) { %>
<table class="stat" cellpadding="0" cellspacing="0" width="100%">
    <tr><td class="title" colspan="17">Defense Information > <%= coderName %></td></tr>
    <tr>
        <td class="header">Defendant</td>
        <td class="header">Challenger</td>
        <td class="header">Problem</td>
        <td class="header">Succeeded</td>
        <td class="headerC">Challenge Time</td>              
        <td class="headerR">Points</td>
        <td class="headerC">&#160;</td>
    </tr>
    <% even = true; %>
    <rsc:iterator list="<%= rscDefense %>" id="resultRow">
        <% even = !even; %>
        <tr class="<%=even?"dark":"light"%>">
            <td class="value">
                <tc-webtag:handle coderId="<%= resultRow.getItem("defendant_id").toString() %>" context='hs_algorithm'/></td>
            <td class="value">
                <tc-webtag:handle coderId="<%= resultRow.getItem("challenger_id").toString() %>" context='hs_algorithm'/></td>
            <td class="value"><rsc:item name="class_name" row="<%=resultRow%>"/></td>
            <td class="value"><rsc:item name="succeeded" row="<%=resultRow%>"/></td>
            <td class="valueC"> <%= resultRow.getItem("time_elapsed").getResultData() == null? "" : challengeTime.format(new java.sql.Time(Long.parseLong(resultRow.getItem("time_elapsed").toString()))).toString() %></td>                        
            <td class="valueR"><rsc:item name="defendant_points" row="<%=resultRow%>" format="0.00"/></td>
            <td class="valueC">&#160;</td>
        </tr>
    </rsc:iterator>
</table>

<br><br>

<% } // rscDefense has rows %>


<% }    // cr >= 0 %>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
<td width="170">
    <jsp:include page="/public_right.jsp">
        <jsp:param name="level1" value="tchs"/>
    </jsp:include>
</td>
<!-- Right Column Ends -->

<!-- Gutter -->
<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
</tr>
</table>

<jsp:include page="/foot.jsp"/>

<form name="roundForm" method="get" action="/tc">
    <input type="hidden" name="sc" value="<%= li.getSortColumn() %>">
    <input type="hidden" name="sd" value="<%= li.getSortDirection() %>">
    <input type="hidden" name="rd" value="<%= round.getRoundId() %>">
    <input type="hidden" name="snid" value="<%= round.getSeasonId() %>">
    <input type="hidden" name="module" value="HSRoomStats">
</form>

<form name="sortForm" method="get" action="/tc">
    <input type="hidden" name="sc" value="<%= li.getSortColumn() %>">
    <input type="hidden" name="sd" value="<%= li.getSortDirection() %>">
    <input type="hidden" name="rd" value="<%= round.getRoundId() %>">
    <input type="hidden" name="rm" value="<%= rm %>">
    <input type="hidden" name="cr" value="<%= cr %>">
    <input type="hidden" name="snid" value="<%= round.getSeasonId() %>">
    <input type="hidden" name="module" value="HSRoomStats">
</form>

<form name="seasonForm" method="get" action="/tc">
    <input type="hidden" name="sc" value="<%= li.getSortColumn() %>">
    <input type="hidden" name="sd" value="<%= li.getSortDirection() %>">
    <input type="hidden" name="snid" value="<%= round.getSeasonId() %>">
    <input type="hidden" name="module" value="HSRoomStats">
</form>

<form name="roomForm" method="get" action="/tc">
    <input type="hidden" name="sc" value="<%= li.getSortColumn() %>">
    <input type="hidden" name="sd" value="<%= li.getSortDirection() %>">
    <input type="hidden" name="rd" value="<%= round.getRoundId() %>">
    <input type="hidden" name="rm" value="<%= rm %>">
    <input type="hidden" name="snid" value="<%= round.getSeasonId() %>">
    <input type="hidden" name="module" value="HSRoomStats">
</form>

<form name="coderForm" method="get" action="/tc">
    <input type="hidden" name="sc" value="<%= li.getSortColumn() %>">
    <input type="hidden" name="sd" value="<%= li.getSortDirection() %>">
    <input type="hidden" name="rd" value="<%= round.getRoundId() %>">
    <input type="hidden" name="rm" value="<%= rm %>">
    <input type="hidden" name="cr" value="<%= cr %>">
    <input type="hidden" name="snid" value="<%= round.getSeasonId() %>">
    <input type="hidden" name="module" value="HSRoomStats">
</form>

</body>

</html>
