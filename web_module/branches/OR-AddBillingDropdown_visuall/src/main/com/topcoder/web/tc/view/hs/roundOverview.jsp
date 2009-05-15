<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java"
         import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.tc.controller.request.hs.RoundInfo,
                 java.text.DecimalFormat,
                 java.util.Map" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title>TopCoder High School Competitions</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>

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
        <jsp:param name="node" value="hs_match_overview"/>
    </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="high_school"/>
    <jsp:param name="title" value="Match Overview"/>
</jsp:include>

<%
    Map resultMap = (Map) request.getAttribute("resultMap");
    ResultSetContainer seasons = (ResultSetContainer) resultMap.get("seasons");
    ResultSetContainer rounds = (ResultSetContainer) resultMap.get("rounds_for_season");
    ResultSetContainer percents = (ResultSetContainer) resultMap.get("Round_Percentages");
    ResultSetContainer leaders = (ResultSetContainer) resultMap.get("High_Scorers");
    ResultSetContainer teamResult = (ResultSetContainer) resultMap.get("team_result");

    RoundInfo round = (RoundInfo) request.getAttribute("roundInfo");

    DecimalFormat df = new DecimalFormat("0.00");
    DecimalFormat dfp = new DecimalFormat("0.00%");


    int topN = 5;
    try {
        topN = Integer.parseInt((String) request.getParameter("er"));
    } catch (Exception e) {
    }

%>

<script language="JavaScript">
    <!--
    function selectSeason(selection) {
        sel = selection.options[selection.selectedIndex].value;
        window.location = '/tc?module=HSRoundOverview&snid=' + sel + '&er=<%= topN %>';
    }

    function selectRound(selection) {
        sel = selection.options[selection.selectedIndex].value;
        window.location = '/tc?module=HSRoundOverview&rd=' + sel + '&snid=<%= round.getSeasonId() %>&er=<%= topN %>';
    }
    function submitForm() {
        var frm = document.coderRankForm;
        if (isNaN(parseInt(frm.er.value)) || parseInt(frm.er.value) < 1)
            alert(frm.er.value + " is not a valid positive integer");
        else {
            frm.er.value = parseInt(frm.er.value);
            frm.submit();
        }
    }

    // -->
</script>

<div style="float:right; padding-left:10px;" align="right">
    <% if (seasons.getRowCount() > 1) { %>
    <div style="padding-bottom:5px;">View another <strong>season</strong>:
        <tc-webtag:rscSelect name="snid" list="<%=seasons%>" fieldText="name" fieldValue="season_id" selectedValue="<%= round.getSeasonId() + "" %>" useTopValue="false" onChange="selectSeason(this)"/>
    </div>
    <% } %>
    <div style="padding-bottom:5px;">View another <strong>match</strong>:
        <tc-webtag:rscSelect name="rd" list="<%=rounds%>" fieldText="name" fieldValue="round_id" selectedValue="<%=  round.getRoundId() + "" %>" useTopValue="false" onChange="selectRound(this)"/>
    </div>
</div>

<span class="subtitle"><%= round.getSeasonName() %> > <%= round.getRoundName() %></span><br>
<% if (round.getForumId() > 0) { %>
<A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=<%= round.getForumId() %>" class="bcLink">Discuss
    this contest</a>
<% } %>

<div class="pagingBox" style="clear:both;">&#160;</div>

<table class="stat" cellpadding="0" cellspacing="0" width="100%">
    <tr><td class="title" colspan="7">Individual and Team Leaders</td></tr>
    <tr>
        <td class="header">&#160;</td>
        <td class="header" nowrap="nowrap" width="50%">Top Teams</td>
        <td class="headerR B">Score</td>
        <td class="header">&#160;</td>
        <td class="header" nowrap="nowrap" width="50%">Top Individuals</td>
        <td class="headerC">Room</td>
        <td class="headerR">Score</td>
    </tr>
    <% boolean even = true;

        for (int i = 0; i < topN; i++) {
            even = !even;
            if (!teamResult.isValidRow(i) && !leaders.isValidRow(i)) {
                break;
            }
    %>
    <tr class="<%=even?"dark":"light"%>">
        <% if (teamResult.isValidRow(i)) { %>
        <td class="valueC">
            <%= teamResult.getItem(i, "team_placed").toString() %>
        </td>
        <td class="value">
            <A href='/tc?module=HSTeamResults&rd=<%= round.getRoundId() %>&tmid=<%= teamResult.getItem(i, "team_id") %>'><%= teamResult.getStringItem(i, "name") %></A>
        </td>
        <td class="valueR B">
            <%= teamResult.getItem(i, "team_points").toString() %>
        </td>
        <% } else { %>
        <td class="valueC">&nbsp;
        </td>
        <td class="value">&nbsp;
        </td>
        <td class="valueR B">&nbsp;
        </td>
        <% } %>

        <% if (leaders.isValidRow(i)) { %>

        <td class="valueC">
            <%= leaders.getStringItem(i, "division_placed") %>
        </td>
        <td class="value">
            <tc-webtag:handle coderId='<%= leaders.getIntItem(i, "coder_id") %>' context='hs_algorithm'/>
        </td>
        <td class="value" nowrap="nowrap">
            <%= leaders.getStringItem(i, "room_name") %>
        </td>
        <td class="valueR">
            <%= leaders.getItem(i, "final_points").toString() %>
        </td>
        <% } else { %>
        <td class="valueC">&nbsp;
        </td>
        <td class="value" colspan="2">&nbsp;
        </td>
        <td class="valueR">&nbsp;
        </td>
        <% } %>
    </tr>
    <% }
    %>
</table>

<br><br>

<table class="stat" cellpadding="0" cellspacing="0" width="100%">
    <tr><td class="title" colspan="8">Problem Sets</td></tr>
    <tr>
        <td class="header">&#160;</td>
        <td class="header" nowrap="nowrap" width="40%">Problem</td>
        <td class="headerR" width="20%">Submissions</td>
        <td class="headerR" width="20%" nowrap="nowrap">Correct %</td>
        <td class="headerR" width="20%" nowrap="nowrap">Average Points</td>
        <td class="header" colspan="2">&#160;</td>
    </tr>

    <% even = true; %>
    <rsc:iterator list="<%=percents%>" id="currentRow">
        <%
            even = !even;
            String problemLevel = currentRow.getItem("problem_level").toString();
            String problemName = currentRow.getItem("problem_name").toString();
            int submissions = Integer.parseInt(currentRow.getItem("submissions").toString());
            int correct = Integer.parseInt(currentRow.getItem("successful_submissions").toString());
            int problemID = Integer.parseInt(currentRow.getItem("problem_id").toString());
            double total = correct == 0 ? 0.0D : Double.parseDouble(currentRow.getItem("total_points").toString()) / correct;
            String perCor = dfp.format(submissions == 0 ? 0.0D : (((double) correct) / submissions));
            String avgPoints = df.format(total);
        %>

        <tr class="<%=even?"dark":"light"%>">
            <td class="value" nowrap="nowrap">
                &#160;<%=problemLevel%>
            </td>
            <td class="value">
                &#160;&#160;<A HREF="/tc?module=HSProblemStatement&pm=<%= problemID %>&rd=<%= round.getRoundId() %>"><%=problemName%></A>
            </td>
            <td class="valueR">
                <%=submissions%> &#160;&#160;
            </td>
            <td class="valueR">
                <%=perCor%> &#160;&#160;
            </td>
            <td class="valueR">
                <%=avgPoints%>
            </td>
            <td class="valueC" nowrap="nowrap">
                &#160;<a href="JavaScript:getGraph('/graph?c=problem_distribution_graph&rd=<%= round.getRoundId() %>&pm=<%= problemID %>','600','400','distribution')">Distribution
                Graph</a>
            </td>
            <td class="valueC">
                &#160;<a href="Javascript:void openProblemRating(<%= problemID %>)"><img border="0" src="/i/rate_it.gif"/></a>
            </td>
        </tr>
    </rsc:iterator>

</table>
<div class="pagingBox">
    <form name="coderRankForm" method="get" action="/tc">
        <input type="hidden" name="rd" value="<%= round.getRoundId() %>">
        <input type="hidden" name="snid" value="<%= round.getSeasonId() %>">
        <input type="hidden" name="module" value="HSRoundOverview">
        Viewing top
        <input name="er" maxlength="4" size="4" value="<%= topN %>" type="text">
        <a href="javaScript:submitForm();" class="bcLink">[ submit ]</a>
    </form>
</div>

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
