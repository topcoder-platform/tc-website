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
            <jsp:param name="node" value="hs_team_match_results"/>
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


int totalRows = Integer.parseInt((String) request.getAttribute("totalRows"));
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
    document.pageForm.rd.value  = selection.options[selection.selectedIndex].value;
    document.pageForm.submit();
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

    if (sr > <%= totalRows %> ) sr = <%= totalRows %>;
    document.pageForm.sr.value = sr;
    document.pageForm.nr.value = nr;
    document.pageForm.submit();
}

function next()
{
    var n = parseInt(document.pageForm.sr.value) + parseInt(document.pageForm.nr.value);
    if (n > <%= totalRows %> ) n = <%= totalRows %>;


    document.pageForm.sr.value = n;
    document.pageForm.submit();
}

function previous()
{
    var n = parseInt(document.pageForm.sr.value) - parseInt(document.pageForm.nr.value);
    if (n < 1) n = 1;

    document.pageForm.sr.value = n;
    document.pageForm.submit();
}

function clickColumn(n)
{
    if(n == <%= li.getSortColumn() %>) {
        if ("asc" == "<%= li.getSortDirection() %>") {
            document.pageForm.sd.value = "desc";
        }
        else  {
            document.pageForm.sd.value = "asc";
        }
    } else {
        document.pageForm.sd.value = "asc";
        document.pageForm.sc.value = n;
    }
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
<input type="hidden" name="module" value="HSRoundStatsTeam">
</form>

<form name="seasonForm" method="get" action ="/tc">
<input type="hidden" name="sr" value="<%= li.getStartRow() %>">
<input type="hidden" name="nr" value="<%= li.getNumberOfRows() %>">
<input type="hidden" name="sc" value="<%= li.getSortColumn() %>">
<input type="hidden" name="sd" value="<%= li.getSortDirection() %>">
<input type="hidden" name="snid" value="<%= round.getSeasonId() %>">
<input type="hidden" name="module" value="HSRoundStatsTeam">
</form>


<div style="float:right; padding-left:10px;" align="right">
   <% if(seasons.getRowCount() > 1) { %>
   <div style="padding-bottom:5px;">View another <strong>season</strong>:
       <tc-webtag:rscSelect name="snid" list="<%=seasons%>" fieldText="name" fieldValue="season_id" selectedValue="<%= round.getSeasonId() + "" %>" useTopValue="false" onChange="selectSeason(this)"/>
   </div>
   <% }  %>
   <div style="padding-bottom:5px;">View another <strong>match</strong>:
       <tc-webtag:rscSelect name="rd" list="<%=rounds%>" fieldText="name" fieldValue="round_id" selectedValue="<%=  round.getRoundId() + "" %>" useTopValue="false" onChange="selectRound(this)"/>
   </div>
</div>

<span class="bigTitle"><%= round.getSeasonName() %> > <%= round.getRoundName() %></span><br>
<% if(round.getForumId() > 0) { %>
<A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=<%=round.getForumId() %>" class="bcLink">Discuss this contest</a>
<% } %>

<div class="pagingBox">
<%=(teamResult.croppedDataBefore()?"<a href=\"Javascript:previous()\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
| <%=(teamResult.croppedDataAfter()?"<a href=\"Javascript:next()\" >next &gt;&gt;</a>":"next &gt;&gt;")%>
</div>
<table class="stat" cellpadding="0" cellspacing="0" width="100%">
   <tr><td class="title" colspan="17">Match Results - Team</td></tr>
   <tr>
      <td class="header"><A href="javascript:clickColumn(0)">Team</A></td>
      <td class="headerR" nowrap="nowrap"><A href="javascript:clickColumn(1)">Placement Points</td>
      <td class="headerR" nowrap="nowrap"><A href="javascript:clickColumn(2)">Coding Phase</td>
      <td class="headerR">+</td>
      <td class="headerR" nowrap="nowrap"><A href="javascript:clickColumn(3)">Challenge Phase</td>
      <td class="headerR">+</td>
      <td class="headerR" nowrap="nowrap"><A href="javascript:clickColumn(4)">System Tests</td>
      <td class="headerR">=</td>
      <td class="headerR" nowrap="nowrap"><A href="javascript:clickColumn(5)">Point Total</td>
   </tr>
   <% boolean even = true; %>
    <rsc:iterator list="<%= teamResult %>" id="resultRow">
        <%   even = !even;  %>
        <tr class="<%=even?"dark":"light"%>">
          <td class="value">
        <A href='/tc?module=HSTeamResults&rd=<%= round.getRoundId() %>&tmid=<%= resultRow.getItem("team_id") %>' >
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
              <rsc:item name="total_challenge_points" row="<%=resultRow%>"/>
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
<%=(teamResult.croppedDataBefore()?"<a href=\"Javascript:previous()\" >&lt;&lt; prev</a>":"&lt;&lt; prev")%>
| <%=(teamResult.croppedDataAfter()?"<a href=\"Javascript:next()\" >next &gt;&gt;</a>":"next &gt;&gt;")%>
<br>
<form name="rowsForm" method="get" action ="/tc">
View &nbsp;
<input name="nr" size="4" maxlength="4" onkeypress="submitEnter(event)" value="<%= li.getNumberOfRows() %>" type="text">
&nbsp;at a time starting with &nbsp;

<input name="sr" size="4" maxlength="4" onkeypress="submitEnter(event)" value="<%= li.getStartRow() %>" type="text">
<a href="javascript:showRows(rowsForm.sr.value, rowsForm.nr.value);" class="bcLink">&nbsp;[ submit ]</a>
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
