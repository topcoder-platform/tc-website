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

<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
    <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<script type="text/javascript" src="/js/popup.js"></script>

<%
    Map resultMap = (Map) request.getAttribute("resultMap");
    ResultSetContainer seasons = (ResultSetContainer) resultMap.get("seasons");
    ResultSetContainer rounds = (ResultSetContainer) resultMap.get("rounds_for_season");
    ResultSetContainer result = (ResultSetContainer) resultMap.get("hs_ind_result");

    RoundInfo round = (RoundInfo) request.getAttribute("roundInfo");
    ListInfo li = (ListInfo) request.getAttribute("listInfo");

    int sr = 1;
    try {
        sr = Integer.parseInt((String) request.getParameter("sr"));
    } catch (Exception e) {
    }

    int nr = 50;
    try {
        nr = Integer.parseInt((String) request.getParameter("nr"));
    } catch (Exception e) {
    }

    boolean groupByRoom = "true".equals(request.getAttribute("groupByRoom"));

    int totalRows = Integer.parseInt((String) request.getAttribute("totalRows"));

%>

<script language="JavaScript">
    <!--

    function selectSeason(selection)
    {
        window.location = "/tc?module=HSRoundStatsInd&snid=" + selection.options[selection.selectedIndex].value;
    }

    function selectRound(selection)
    {
        window.location = "/tc?module=HSRoundStatsInd&snid=<%= round.getSeasonId() %>&rd=" + selection.options[selection.selectedIndex].value;
    }

    function showRows(sr, nr, adjust)
    {

        if (adjust) {
            if (sr > <%= totalRows %>) sr = <%= totalRows %>;
            if (sr < 1) sr = 1;
        } else {

            if (isNaN(parseInt(nr)) || parseInt(nr) < 1)
            {
                alert(nr + " is not a valid positive integer");
                return;
            }
            if (isNaN(parseInt(sr)) || parseInt(sr) < 1)
            {
                alert(sr + " is not a valid positive integer");
                return;
            }
        }


    <% if (groupByRoom) { %>
        window.location = "/tc?module=HSRoundStatsInd&snid=<%= round.getSeasonId() %>&rd=<%= round.getRoundId() %>" +
                          "&sr=" + sr + "&nr=" + nr;
    <% } else { %>
        window.location = "/tc?module=HSRoundStatsInd&snid=<%= round.getSeasonId() %>&rd=<%= round.getRoundId() %>" +
                          "&sc=<%= li.getSortColumn() %>&sd=<%= li.getSortDirection() %>&sr=" + sr + "&nr=" + nr;
    <% } %>

    }

    function submitEnter(e)
    {
        var keycode;
        if (window.event) keycode = window.event.keyCode;
        else if (e) keycode = e.which;
        else return true;
        if (keycode == 13) {
            showRows(document.pagingForm.sr.value, document.pagingForm.nr.value, false);
        } else return true;
    }



    // -->
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
        <jsp:param name="node" value="hs_ind_match_results"/>
    </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="high_school"/>
    <jsp:param name="title" value="Match Results - Individual"/>
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
</div>

<span class="subtitle"><%= round.getSeasonName() %> > <A href="/tc?<%=Constants.MODULE_KEY%>=HSRoundOverview&rd=<%= round.getRoundId() %>&snid=<%= round.getSeasonId() %>" class="bcLink"><%= round.getRoundName() %></A></span>
<br>
<% if (round.getForumId() > 0) { %>
<A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=<%=round.getForumId() %>" class="bcLink">Discuss
    this contest</a>
<% } %>

<div class="pagingBox">
    <%=(result.croppedDataBefore() ? ("<a href='Javascript:showRows(" + (li.getStartRow() - li.getNumberOfRows()) + "," + li.getNumberOfRows() + ", true)'>&lt;&lt; prev</a>") : "&lt;&lt; prev")%>
    | <%=(result.croppedDataAfter() ? ("<a href='Javascript:showRows(" + (li.getStartRow() + li.getNumberOfRows()) + "," + li.getNumberOfRows() + ", true)'>next &gt;&gt;</a>") : "next &gt;&gt;")%>
</div>

<table class="stat" cellpadding="0" cellspacing="0" width="100%">
    <tr><td class="title" colspan="18">
        <div style="float:right;">
            <% if (!groupByRoom) { %>
            <a href="/tc?module=HSRoundStatsInd&snid=<%= round.getSeasonId() %>&rd=<%= round.getRoundId() %>">Group by
                room</a>
            <% } %>
        </div>
        Match Results - Individual
    </td></tr>
    <tr>
        <td class="header" rowspan="2" width="1%">&#160;</td>
        <td class="header" colspan="2" rowspan="2">
            <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=HSRoundStatsInd<tc-webtag:sort column="<%=result.getColumnIndex("handle")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">
	            Coder
	        </A>
		</td>        
        <td class="headerR" rowspan="2">
            <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=HSRoundStatsInd<tc-webtag:sort column="<%=result.getColumnIndex("team_points")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">
	            Team<br>Points
	        </A>
		</td>

        <td class="headerR" rowspan="2">
            <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=HSRoundStatsInd<tc-webtag:sort column="<%=result.getColumnIndex("submission_points")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">
	            Coding<br>Phase
	        </A>
		</td>       
        <td class="headerR" rowspan="2">+</td>
        <td class="headerR" rowspan="2">
            <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=HSRoundStatsInd<tc-webtag:sort column="<%=result.getColumnIndex("total_challenge_points")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">
	            Challenge<br>Phase
	        </A>
		</td>
        <td class="headerR" rowspan="2">+</td>
        <td class="headerR" rowspan="2">
            <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=HSRoundStatsInd<tc-webtag:sort column="<%=result.getColumnIndex("system_test_points")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">
	            System<br>Tests
	        </A>
		</td>
        <td class="headerR" rowspan="2">=</td>

        <td class="headerR" rowspan="2">
            <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=HSRoundStatsInd<tc-webtag:sort column="<%=result.getColumnIndex("final_points")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">
	            Point<br>Total
	        </A>
		</td>
        <td class="headerR B" rowspan="2">Advanced
        <td class="headerC" colspan="6">Rating</td>
    </tr>
    <tr>
        <td class="headerR">
            <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=HSRoundStatsInd<tc-webtag:sort column="<%=result.getColumnIndex("old_rating")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">
	            Old
	        </A>        
		</td>
        <td class="headerR">+</td>

        <td class="headerR">
            <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=HSRoundStatsInd<tc-webtag:sort column="<%=result.getColumnIndex("rating_change")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">
	            &#916;
	        </A>                
        <td class="headerR">=</td>
        <td class="headerR">
            <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=HSRoundStatsInd<tc-webtag:sort column="<%=result.getColumnIndex("new_rating")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">
	            New
	        </A>                
        </td>
        <td class="headerR">&#160;</td>
    </tr>

    <% boolean even = true;
        int lastRoom = -1;
    %>
    <rsc:iterator list="<%= result%>" id="resultRow">
        <%
            even = !even;
            if (groupByRoom && (lastRoom != resultRow.getIntItem("room_id"))) {
        %>
        <tr><td class="title" colspan="18" style="border-top:1px solid #999999;">
            <A href='/tc?module=HSRoomStats&rm=<%=resultRow.getIntItem("room_id")%>&snid=<%= round.getSeasonId() %>&rd=<%= round.getRoundId() %>'>
                <rsc:item name="name" row="<%=resultRow%>"/></A></td></tr>
        <%
                lastRoom = resultRow.getIntItem("room_id");
            }
        %>
        <tr class="<%=even?"dark":"light"%>">
            <td class="value" style="vertical-align: middle;">
                <A href="/tc?module=HSRoomStats&snid=<%= round.getSeasonId() %>&rd=<%= round.getRoundId() %>&cr=<%= resultRow.getItem("coder_id") %>&rm=<%= resultRow.getItem("room_id") %>"><img src="/i/interface/exp_w.gif" alt=""/></A>

            </td>
            <td class="value" nowrap="nowrap">
                <tc-webtag:handle coderId='<%= resultRow.getItem("coder_id").toString() %>' context='hs_algorithm'/>
            </td>
            <td class="value" nowrap>
                <div id="d_CODERID_<%=resultRow.getItem("coder_id").toString() %>" class="popUp"><div><rsc:item name="team_name" row="<%=resultRow%>"/></div></div>
                <A href="/tc?module=HSTeamResults&rd=<%= round.getRoundId() %>&tmid=<%= resultRow.getItem("team_id") %>" id="a_CODERID" onMouseOver="popUp(this,'d_CODERID_<%=resultRow.getItem("coder_id").toString() %>')" onMouseOut="popHide()">
                    <%= Base.cutTeamName(resultRow.getStringItem("team_name")) %></A>
            </td>


            <td class="valueR">
                <rsc:item name="team_points" row="<%=resultRow%>"/>
            </td>
            <td class="valueR">
                <rsc:item name="submission_points" row="<%=resultRow%>" format="0.00"/>
            </td>
            <td class="valueR" colspan="2">
                <rsc:item name="total_challenge_points" row="<%=resultRow%>" format="0.00"/>
            </td>
            <td class="valueR" colspan="2">
                <rsc:item name="system_test_points" row="<%=resultRow%>" format="0.00" />
            </td>
            <td class="valueR" colspan="2">
                <rsc:item name="final_points" row="<%=resultRow%>" format="0.00"/>
            </td>
            <td class="valueC B">
                <rsc:item name="advanced" row="<%=resultRow%>"/>
            </td>
            <td class="valueR">
                <rsc:item name="old_rating" row="<%=resultRow%>"/>
            </td>
            <td class="valueR" colspan="2">
                <rsc:item name="rating_change" row="<%=resultRow%>"/>
            </td>
            <td class="valueR" colspan="2">
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

        </tr>
    </rsc:iterator>

</table>

<div class="pagingBox">
    <%=(result.croppedDataBefore() ? ("<a href='Javascript:showRows(" + (li.getStartRow() - li.getNumberOfRows()) + "," + li.getNumberOfRows() + ", true)'>&lt;&lt; prev</a>") : "&lt;&lt; prev")%>
    | <%=(result.croppedDataAfter() ? ("<a href='Javascript:showRows(" + (li.getStartRow() + li.getNumberOfRows()) + "," + li.getNumberOfRows() + ", true)'>next &gt;&gt;</a>") : "next &gt;&gt;")%>

    <form name="pagingForm">
        View &nbsp;
        <input name="nr" size="4" maxlength="4" onKeyPress="submitEnter(event)" value="<%= li.getNumberOfRows() %>" type="text">
        <%= groupByRoom ? " rooms " : "" %>
        &nbsp;at a time starting with &nbsp;

        <input name="sr" size="4" maxlength="4" onKeyPress="submitEnter(event)" value="<%= li.getStartRow() %>" type="text">
        <a href="Javascript:showRows(document.pagingForm.sr.value, document.pagingForm.nr.value, false)" class="bcLink">
            &nbsp;[ submit ]</a>
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
