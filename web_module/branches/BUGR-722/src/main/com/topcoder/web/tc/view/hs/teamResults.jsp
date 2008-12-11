<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java"
         import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.tc.controller.request.hs.ListInfo,
                 com.topcoder.web.tc.controller.request.hs.RoundInfo,
                 com.topcoder.web.tc.Constants,                 
                 java.util.Map" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder High School Competitions</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>


    <%
        boolean competed = "true".equals(request.getAttribute("competed"));
        if (competed) {
            Map resultMap = (Map) request.getAttribute("resultMap");
            ResultSetContainer seasons = (ResultSetContainer) resultMap.get("seasons_for_team");
            ResultSetContainer rounds = (ResultSetContainer) resultMap.get("rounds_for_season_and_team");
            ResultSetContainer result = (ResultSetContainer) resultMap.get("hs_ind_result_for_team");
            ResultSetContainer teams = (ResultSetContainer) resultMap.get("teams_for_round");

            RoundInfo round = (RoundInfo) request.getAttribute("roundInfo");
            ListInfo li = (ListInfo) request.getAttribute("listInfo");

            int tmid = Integer.parseInt((String) request.getAttribute("tmid"));

            String teamName = result.getStringItem(0, "team_name");
    %>

    <script language="JavaScript">
        <!--

  function selectSeason(selection)
  {
      window.location = "/tc?module=HSTeamResults&tmid=<%= tmid %>&snid=" + selection.options[selection.selectedIndex].value;
}

function selectRound(selection)
{
    window.location = "/tc?module=HSTeamResults&tmid=<%= tmid %>&snid=<%= round.getSeasonId() %>&rd=" + selection.options[selection.selectedIndex].value;
}

function selectTeam(selection)
{
    window.location = "/tc?module=HSTeamResults&tmid=" + selection.options[selection.selectedIndex].value + "&snid=<%= round.getSeasonId() %>&rd=<%= round.getRoundId() %>";
}

-->
    </script>
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
        <jsp:param name="title" value="Team Results"/>
    </jsp:include>

    <div style="float:right; padding-left:10px;" align="right">
        <% if (seasons.getRowCount() > 1) { %>
        <div style="padding-bottom:5px;">View another <strong>season</strong>:
            <tc-webtag:rscSelect name="snid" list="<%=seasons%>" fieldText="name" fieldValue="season_id" selectedValue="<%= round.getSeasonId() + ""%>" useTopValue="false" onChange="selectSeason(this)"/>
        </div>
        <% } %>
        <div style="padding-bottom:5px;">View another <strong>match</strong>:
            <tc-webtag:rscSelect name="rd" list="<%=rounds%>" fieldText="name" fieldValue="round_id" selectedValue="<%=  round.getRoundId() + ""%>" useTopValue="false" onChange="selectRound(this)"/>
        </div>

        <div style="padding-bottom:5px;">View another <strong>team</strong>:
            <tc-webtag:rscSelect name="tmid" list="<%=teams%>" fieldText="name" fieldValue="team_id" selectedValue="<%=  tmid + "" %>" useTopValue="false" onChange="selectTeam(this)"/>
        </div>
    </div>

    <span class="subtitle"><%= round.getRoundName() %></span><br>
    <span class="bodySubtitle">Season: <%= round.getSeasonName() %></span><br>
    <% if (round.getForumId() > 0) { %>
    <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=<%=round.getForumId() %>" class="bcLink">Discuss
        this contest</a>
    <% } %>


    <div class="pagingBox" style="clear:both;">&#160;</div>

    <table class="stat" cellpadding="0" cellspacing="0" width="100%">
        <tr><td class="title" colspan="15">Team Results</td></tr>
        <tr>
            <td class="headerC" colspan="3">&#160;</td>
            <td class="headerR" colspan="2">Submissions</td>
            <td class="headerR" colspan="2">Defenses</td>
            <td class="headerR" colspan="2">Challenges</td>
            <td class="headerC" colspan="2">&#160;</td>
            <tr>
                <td class="header">&#160;</td>
                <td class="header" width="14%">
					<A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=HSTeamResults<tc-webtag:sort column="<%=result.getColumnIndex("name")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">
			            Coder
			        </A>
				</td>
                <td class="headerR" width="14%">
					<A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=HSTeamResults<tc-webtag:sort column="<%=result.getColumnIndex("team_points")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">
			            Team Points
			        </A>
				</td>

                <td class="headerR" width="14%">
					<A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=HSTeamResults<tc-webtag:sort column="<%=result.getColumnIndex("problems_submitted")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">
			            Qnty
			        </A>
				</td>

                <td class="headerR">
					<A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=HSTeamResults<tc-webtag:sort column="<%=result.getColumnIndex("submission_points")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">
			            Points
			        </A>
				</td>

                <td class="headerR" width="14%">
					<A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=HSTeamResults<tc-webtag:sort column="<%=result.getColumnIndex("challenge_attempts_received")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">
			            Qnty
			        </A>
				</td>

                <td class="headerR">
					<A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=HSTeamResults<tc-webtag:sort column="<%=result.getColumnIndex("defense_points")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">
			            Points
			        </A>
				</td>

                <td class="headerR" width="14%">
					<A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=HSTeamResults<tc-webtag:sort column="<%=result.getColumnIndex("challenge_attempts_made")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">
			            Qnty
			        </A>
				</td>

                <td class="headerR">
					<A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=HSTeamResults<tc-webtag:sort column="<%=result.getColumnIndex("challenge_points")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">
			            Points
			        </A>
				</td>

                <td class="headerR" width="14%">
					<A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=HSTeamResults<tc-webtag:sort column="<%=result.getColumnIndex("system_test_points")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">
			            System Tests
			        </A>
				</td>

                <td class="headerR" width="14%">
					<A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=HSTeamResults<tc-webtag:sort column="<%=result.getColumnIndex("final_points")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">
			            Point Total
			        </A>
				</td>
            </tr>
            <% boolean even = true; %>
            <rsc:iterator list="<%= result %>" id="resultRow">
                <%   even = !even; %>
            <tr class="<%=even?"dark":"light"%>">
                <td class="value" style="vertical-align: middle;">
                    <A href="/tc?module=HSRoomStats&snid=<%= round.getSeasonId() %>&rd=<%= round.getRoundId() %>&cr=<%= resultRow.getItem("coder_id") %>&rm=<%= resultRow.getItem("room_id") %>"><img src="/i/interface/exp_w.gif" alt=""/></A>
                </td>
                <td class="value">
                    <tc-webtag:handle coderId='<%= resultRow.getItem("coder_id").toString() %>' context='hs_algorithm'/>
                </td>

                <td class="valueR">
                    <rsc:item name="team_points" row="<%=resultRow%>" ifNull=""/>
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
                <td class="valueR">
                    <rsc:item name="final_points" row="<%=resultRow%>" format="0.00"/>
                </td>

            </tr>
            </rsc:iterator>
    </table>
    <% } else { // the team didn't compete
    %>
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
                <jsp:param name="node" value="m_competitions"/>
            </jsp:include>
        </td>
        <!-- Left Column Ends -->

        <!-- Center Column Begins -->
        <td width="100%" align="left" class="bodyColumn">

            <jsp:include page="/page_title.jsp">
                <jsp:param name="image" value="high_school"/>
                <jsp:param name="title" value="Team Results"/>
            </jsp:include>

            <center><span class="bigTitle">This team has never competed</span></center>
            <% }  // end the team didn't compete
            %>
            <br><br>


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

</body>

</html>
