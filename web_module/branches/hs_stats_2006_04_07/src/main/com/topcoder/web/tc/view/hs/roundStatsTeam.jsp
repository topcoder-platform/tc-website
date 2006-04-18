<%@  page language="java"
    import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*, com.topcoder.web.tc.Constants,
          java.util.Map, java.text.DecimalFormat, com.topcoder.web.tc.controller.request.hs.RoundInfo, com.topcoder.shared.util.ApplicationServer"%>
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
function selectSeason(selection){
	sel = selection.options[selection.selectedIndex].value;
	window.location='/tc?module=HSRoundStatsTeam&snid='+ sel + '&nr=<%=nr%>&sr=<%=sr%>';
}

function selectRound(selection){
	sel = selection.options[selection.selectedIndex].value;
	window.location='/tc?module=HSRoundStatsTeam&rd='+ sel + '&snid=<%= round.getSeasonId() %>&nr=<%=nr%>&sr=<%=sr%>';
}
function submitForm(){
	var frm = document.coderRankForm;
	if (isNaN(parseInt(frm.er.value)) || parseInt(frm.er.value) < 1)
   		alert(frm.er.value+" is not a valid positive integer");
	 else{
   		frm.er.value = parseInt(frm.er.value);
   		frm.submit();
	 }
}

// -->
</script>


<div style="float:right; padding-left:10px;" align="right">
<div style="padding-bottom:5px;">
	<tc-webtag:rscSelect name="snid" list="<%=seasons%>" fieldText="name" fieldValue="season_id" selectedValue="<%= round.getSeasonId() + "" %>" useTopValue="false" onChange="selectSeason(this)"/>
</div>
<div style="padding-bottom:5px;">
   	<tc-webtag:rscSelect name="rd" list="<%=rounds%>" fieldText="name" fieldValue="round_id" selectedValue="<%=  round.getRoundId() + "" %>" useTopValue="false" onChange="selectRound(this)"/>
</div>
</div>

<span class="bigTitle"><%= round.getRoundName() %></span><br>
<span class="bodySubtitle">Season: <%= round.getSeasonName() %></span><br>
<A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=<%=round.getForumId() %>" class="bcLink">Discuss this contest</a>


<div class="pagingBox">
&lt;&lt; prev
| <a href="Javascript:next()" class="bcLink">next &gt;&gt;</a>
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
   <% for (int i = sr - 1; i < (sr + nr) && teamResult.isValidRow(i); i++) {
       even = !even;

   %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
    <A href='/tc?module=TeamResults&rd=<%= round.getRoundId() %>&tmid=<%= teamResult.getItem(i, "team_id") %>' >
      <%= teamResult.getStringItem(i, "name") %>
      </A>
      </td>
      <td class="valueR">
      <%= teamResult.getItem(i, "team_points").toString() %>
      </td>
      <td class="valueR">
      <%= teamResult.getItem(i, "submission_points").toString() %>
      </td>
      <td class="valueR" colspan="2">
      <%= teamResult.getItem(i, "challenge_points").toString() %>
      </td>
      <td class="valueR" colspan="2">
      <%= teamResult.getItem(i, "system_test_points").toString() %>
      </td>
      <td class="valueR" colspan="2">
      <%= teamResult.getItem(i, "final_points").toString() %>
      </td>
   </tr>
	<% } %>
</table>

<div class="pagingBox">
&lt;&lt; prev
| <a href="Javascript:next()" class="bcLink">next &gt;&gt;</a>

<br>

View &nbsp;
<input name="nr" size="4" maxlength="4" onkeypress="submitEnter(event)" value="50" type="text">
&nbsp;at a time starting with &nbsp;

<input name="sr" size="4" maxlength="4" onkeypress="submitEnter(event)" value="1" type="text">
<a href="javascript:document.matchListForm.submit();" class="bcLink">&nbsp;[ submit ]</a>

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
