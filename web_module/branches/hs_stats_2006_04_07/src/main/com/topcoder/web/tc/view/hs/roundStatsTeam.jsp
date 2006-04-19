<%@  page language="java"
    import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*, com.topcoder.web.tc.Constants,
          java.util.Map, java.text.DecimalFormat, com.topcoder.web.tc.controller.request.hs.RoundInfo, com.topcoder.web.tc.controller.request.hs.ListInfo,
          com.topcoder.shared.util.ApplicationServer"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>TopCoder High School Competitions</title>

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
            <jsp:param name="node" value="m_competitions"/>
         </jsp:include>
        </td>
        <!-- Left Column Ends -->

        <!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="high_school"/>
<jsp:param name="title" value="Match Results - Team"/>
</jsp:include>

<%
Map resultMap = (Map) request.getAttribute("resultMap");
ResultSetContainer seasons = (ResultSetContainer) resultMap.get("seasons");
ResultSetContainer rounds = (ResultSetContainer) resultMap.get("rounds_for_season");
ResultSetContainer teamResult = (ResultSetContainer) resultMap.get("team_result");

RoundInfo round = (RoundInfo) request.getAttribute("roundInfo");
ListInfo li = (ListInfo)request.getAttribute("listInfo");

int sr = 1;
try {
  sr = Integer.parseInt((String) request.getParameter("sr"));
} catch(Exception e){}

int nr = 50;
try {
  nr = Integer.parseInt((String) request.getParameter("nr"));
} catch(Exception e){}


%>

<script language="JavaScript">
<!--
function selectSeason(selection)
{
    sel = selection.options[selection.selectedIndex].value;
    window.location='/tc?module=HSRoundStatsTeam&snid='+ sel + '&nr=<%=nr%>&sr=<%=sr%>';
}

function selectRound(selection)
{
    sel = selection.options[selection.selectedIndex].value;
    window.location='/tc?module=HSRoundStatsTeam&rd='+ sel + '&snid=<%= round.getSeasonId() %>&nr=<%=nr%>&sr=<%=sr%>';
}

function submitForm()
{
    var frm = document.coderRankForm;
    if (isNaN(parseInt(frm.nr.value)) || parseInt(frm.nr.value) < 1)
    {
        alert(frm.nr.value + " is not a valid positive integer");
        return false;
     }
    if (isNaN(parseInt(frm.sr.value)) || parseInt(frm.sr.value) < 1)
    {
        alert(frm.sr.value + " is not a valid positive integer");
        return false;
     }

     frm.nr.value = parseInt(frm.nr.value);
     frm.sr.value = parseInt(frm.sr.value);
     frm.submit();
}

function submitEnter(e)
{
    var keycode;
    if (window.event) keycode = window.event.keyCode;
    else if (e) keycode = e.which;
    else return true;
    if (keycode == 13) {
         document.pageFrom;
         return false;
    } else return true;
 }

function showRows(sr, nr)
{
    document.pageForm.sr.value = sr;
    document.pageForm.nr.value = nr;
    document.pageForm.submit();
}

function next()
{
    document.pageForm.sr.value += document.pageForm.nr.value;
    document.pageForm.submit();
}

function next()
{
    document.pageForm.sr.value -= document.pageForm.nr.value;
    document.pageForm.submit();
}

// -->
</script>

<form name="pageForm" method="get" action ="/tc">
<input type="hidden" name="sr" value="<%= li.getStartRow() %>">
<input type="hidden" name="nr" value="<%= li.getNumberOfRows() %>">
<input type="hidden" name="sc" value="<%= li.getSortColumn() %>">
<input type="hidden" name="sd" value="<%= li.getSortDirection() %>">
<input type="hidden" name="rd" value="<%= round.getRoundId() %>">
<input type="hidden" name="snid" value="<%= round.getSeasonId() %>">
<input type="hidden" name="module" value="HSRoundOverview">
</form>

<div style="float:right; padding-left:10px;" align="right">
<% if(seasons.getRowCount() > 1) { %>
<div style="padding-bottom:5px;">
    <tc-webtag:rscSelect name="snid" list="<%=seasons%>" fieldText="name" fieldValue="season_id" selectedValue="<%= round.getSeasonId() + "" %>" useTopValue="false" onChange="selectSeason(this)"/>
</div>
<% }  %>
<div style="padding-bottom:5px;">
    <tc-webtag:rscSelect name="rd" list="<%=rounds%>" fieldText="name" fieldValue="round_id" selectedValue="<%=  round.getRoundId() + "" %>" useTopValue="false" onChange="selectRound(this)"/>
</div>
</div>

<span class="bigTitle"><%= round.getRoundName() %></span><br>
<span class="bodySubtitle">Season: <%= round.getSeasonName() %></span><br>
<% if(round.getForumId() > 0) { %>
<A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=<%=round.getForumId() %>" class="bcLink">Discuss this contest</a>
<% } %>

<div class="pagingBox">
<%=(teamResult.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"statText\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
| <%=(teamResult.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"statText\">next &gt;&gt;</a>":"next &gt;&gt;")%>
</div>
<table class="stat" cellpadding="0" cellspacing="0" width="100%">
   <tr><td class="title" colspan="17">High School Single Round Match 1 > Team Results</td></tr>
   <tr>
      <td class="header"><A href="#">Team</A></td>
      <td class="headerR" nowrap="nowrap"><A href="#">Placement Points</td>
      <td class="headerR" nowrap="nowrap"><A href="#">Coding Phase</td>
      <td class="headerR">+</td>
      <td class="headerR" nowrap="nowrap"><A href="#">Challenge Phase</td>
      <td class="headerR">+</td>
      <td class="headerR" nowrap="nowrap"><A href="#">System Tests</td>
      <td class="headerR">=</td>
      <td class="headerR" nowrap="nowrap"><A href="#">Point Total</td>
   </tr>
   <% boolean even = false; %>
    <rsc:iterator list="<%= teamResult %>" id="resultRow">
   <% //for (int i = sr - 1; i < (sr + nr -1) && teamResult.isValidRow(i); i++) {
       even = !even;

   %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
    <A href='/tc?module=TeamResults&rd=<%= round.getRoundId() %>&tmid=<%= resultRow.getItem("team_id") %>' >
          <rsc:item name="name" row="<%=resultRow%>"/>
      </A>
      </td>
      <td class="valueR">
          <rsc:item name="team_points" row="<%=resultRow%>"/>
      </td>
      <td class="valueR">
          <rsc:item name="submission_points" row="<%=resultRow%>"/>

      </td>
      <td class="valueR" colspan="2">
          <rsc:item name="challenge_points" row="<%=resultRow%>"/>
      </td>
      <td class="valueR" colspan="2">
          <rsc:item name="system_test_points" row="<%=resultRow%>"/>
      </td>
      <td class="valueR" colspan="2">
          <rsc:item name="final_points" row="<%=resultRow%>"/>
      </td>
   </tr>
    </rsc:iterator>
</table>

<div class="pagingBox">
&lt;&lt; prev
| <a href="Javascript:next()" class="bcLink">next &gt;&gt;</a>

<br>
<form name="rowsForm" method="get" action ="/tc">
View &nbsp;
<input name="nr" size="4" maxlength="4" onkeypress="submitEnter(event)" value="<%= li.getNumberOfRows() %>" type="text">
&nbsp;at a time starting with &nbsp;

<input name="sr" size="4" maxlength="4" onkeypress="submitEnter(event)" value="<%= li.getStartRow() %>" type="text">
<a href="javascript:showRows(rowsForm.sr.value, rowsForm.er.value);" class="bcLink">&nbsp;[ submit ]</a>
</form>
</div>
</td>
        <!-- Center Column Ends -->

        <!-- Right Column Begins -->
        <td width="170">
            <jsp:include page="/public_right.jsp">
                <jsp:param name="level1" value="default"/>
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
