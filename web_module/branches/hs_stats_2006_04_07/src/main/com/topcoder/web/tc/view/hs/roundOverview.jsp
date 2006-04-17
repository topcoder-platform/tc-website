<%@  page language="java"
    import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*, com.topcoder.web.tc.Constants,
          java.util.Map, java.text.DecimalFormat, com.topcoder.web.tc.controller.request.hs.RoundInfo"%>
<%@ page language="java" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
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
} catch(Exception e){}

%>

<script language="JavaScript">
<!--
function selectSeason(selection){
	sel = selection.options[selection.selectedIndex].value;
	window.location='/tc?module=HSRoundOverview&snid='+ sel;
}

function selectRound(selection){
	sel = selection.options[selection.selectedIndex].value;
	window.location='/tc?module=HSRoundOverview&rd='+ sel + '&snid=<%= round.getSeasonId() %>';
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
<A href="" class="bcLink">Discuss this contest</a>

<div class="pagingBox" style="clear:both;">&#160;</div>

<table class="stat" cellpadding="0" cellspacing="0" width="100%">
   <tr><td class="title" colspan="8"><%= round.getRoundName() %> Leaders</td></tr>
   <tr>
      <td class="header">&#160;</td>
      <td class="header" nowrap="nowrap" width="50%">Top Teams</td>
      <td class="headerC">Room</td>
      <td class="headerR" style="border-right:1px solid #999999;">Score</td>
      <td class="header">&#160;</td>
      <td class="header" nowrap="nowrap" width="50%">Top Individuals</td>
      <td class="headerC">Room</td>
      <td class="headerR">Score</td>
   </tr>
   <% boolean even = false;

      for (int i=0; i < topN; i++) {
       even = !even;
   %>
   <tr class="<%=even?"dark":"light"%>">
      <% if (teamResult.isValidRow(i)) {      	     %>
		     <td class="valueC">
		     <%= i + 1 %>
		     </td>
		     <td class="value">
		     <A href="#"><%= teamResult.getStringItem(i, "name") %></A>
		     </td>
		     <td class="valueC" nowrap="nowrap">
		     Room 20
		     </td>
		     <td class="valueR" style="border-right:1px solid #999999;">
		     teamResult.getItem(i, "team_points").toString()
		     </td>
      <% } else { %>
	      <td class="valueC" colspan="4">
          </td>
      <% } %>
		     
	  <% if (leaders.isValidRow(i)) {      	     %>
        
      <td class="valueC">
      <%= i + 1 %>
      </td>
      <td class="value">
      <tc-webtag:handle coderId='<%= leaders.getIntItem(i, "coder_id") %>' />
      </td>
      <td class="value" nowrap="nowrap">
      <%= leaders.getStringItem(i, "room_name") %>
      </td>
      <td class="valueR">
      <%= leaders.getItem(i, "final_points").toString() %>
      </td>
      <% } else { %>
	      <td class="valueC" colspan="4">
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
   
   
   <rsc:iterator list="<%=percents%>" id="currentRow">
   <% 
               even = !even;
               String problemLevel = currentRow.getItem("problem_level").toString();
               String problemName = currentRow.getItem("problem_name").toString();
               int submissions =Integer.parseInt(currentRow.getItem("submissions").toString());
               int correct = Integer.parseInt(currentRow.getItem("successful_submissions").toString());
               int problemID = Integer.parseInt(currentRow.getItem("problem_id").toString());
               double total = correct==0?0.0D:Double.parseDouble(currentRow.getItem("total_points").toString())/correct;
               String perCor = dfp.format(submissions==0?0.0D:(((double)correct)/submissions));
               String avgPoints = df.format(total);
  %>

   <tr class="<%=even?"dark":"light"%>">
      <td class="value" nowrap="nowrap">
      &#160;<%=problemLevel%>
      </td>
      <td class="value">
      &#160;&#160;<A HREF="/stat?c=problem_statement&pm=<%= problemID %>&rd=<%= round.getRoundId() %>" class="statText"><%=problemName%></A>
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
      &#160;<a href="JavaScript:getGraph('/graph?c=problem_distribution_graph&rd=<%= round.getRoundId() %>&pm=<%= problemID %>','600','400','distribution')" class="statText">Distribution Graph</a>
      </td>
      <td class="valueC">
      &#160;<a href="Javascript:void openProblemRating(<%= problemID %>)" class="statText"><img border="0" src="/i/rate_it.gif" /></a>
      </td>
   </tr>
   </rsc:iterator>

</table>
<div class="pagingBox">
<form name="coderRankForm" method="get" action ="/tc">
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
