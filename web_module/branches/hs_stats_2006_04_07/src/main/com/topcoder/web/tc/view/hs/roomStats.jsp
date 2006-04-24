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
ListInfo li = (ListInfo)request.getAttribute("listInfo");

int cr = Integer.parseInt((String) request.getAttribute("cr"));
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

function selectRoom(selection)
{
    document.roomForm.rm.value  = selection.options[selection.selectedIndex].value;
    document.roomForm.submit();
}

function selectCoder(coderId)
{
    document.coderForm.cr.value  = coderId;
    document.coderForm.submit();
}


function goTo(selection){
sel = selection.options[selection.selectedIndex].value;
if (sel && sel != '#'){
window.location='/longcontest/?module=ViewOverview&rd='+sel;
}
}
var objPopUp = null;
function popUp(event,objectID){
   objPopTrig = document.getElementById(event);
   objPopUp = document.getElementById(objectID);
   xPos = objPopTrig.offsetLeft+objPopTrig.offsetWidth;
   yPos = objPopTrig.offsetTop + objPopTrig.offsetHeight;
   if(xPos + objPopUp.offsetWidth > document.body.clientWidth) xPos = xPos - objPopUp.offsetWidth;
   if(yPos + objPopUp.offsetHeight > document.body.clientHeight) yPos = yPos - objPopUp.offsetHeight - objPopTrig.offsetHeight;
   objPopUp.style.left = xPos + 'px';
   objPopUp.style.top = yPos + 'px';
   objPopUp.style.visibility = 'visible';
}
function popHide(){
   objPopUp.style.visibility = 'hidden';
   objPopUp = null;
}
// -->
</script>

</script>

<form name="pageForm" method="get" action ="/tc">
<input type="hidden" name="sc" value="<%= li.getSortColumn() %>">
<input type="hidden" name="sd" value="<%= li.getSortDirection() %>">
<input type="hidden" name="rd" value="<%= round.getRoundId() %>">
<input type="hidden" name="snid" value="<%= round.getSeasonId() %>">
<input type="hidden" name="module" value="HSRoomStats">
</form>

<form name="seasonForm" method="get" action ="/tc">
<input type="hidden" name="sc" value="<%= li.getSortColumn() %>">
<input type="hidden" name="sd" value="<%= li.getSortDirection() %>">
<input type="hidden" name="snid" value="<%= round.getSeasonId() %>">
<input type="hidden" name="module" value="HSRoomStats">
</form>

<form name="roomForm" method="get" action ="/tc">
<input type="hidden" name="sc" value="<%= li.getSortColumn() %>">
<input type="hidden" name="sd" value="<%= li.getSortDirection() %>">
<input type="hidden" name="rd" value="<%= round.getRoundId() %>">
<input type="hidden" name="rm" value="<%= rm %>">
<input type="hidden" name="snid" value="<%= round.getSeasonId() %>">
<input type="hidden" name="module" value="HSRoomStats">
</form>

<form name="coderForm" method="get" action ="/tc">
<input type="hidden" name="sc" value="<%= li.getSortColumn() %>">
<input type="hidden" name="sd" value="<%= li.getSortDirection() %>">
<input type="hidden" name="rd" value="<%= round.getRoundId() %>">
<input type="hidden" name="rm" value="<%= rm %>">
<input type="hidden" name="cr" value="<%= cr %>">
<input type="hidden" name="snid" value="<%= round.getSeasonId() %>">
<input type="hidden" name="module" value="HSRoomStats">
</form>


<STYLE TYPE="text/css">
#popBox{ position: relative; }
#popBox div
{
position: absolute;
font-size: 11px;
font-weight: bold;
background-color: #FFFFCC;
visibility: hidden;
padding: 3px;
border: 1px solid #000000;
white-space: nowrap;
z-index: 2;
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
            <jsp:param name="node" value="m_competitions"/>
         </jsp:include>
        </td>
        <!-- Left Column Ends -->

        <!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="high_school"/>
<jsp:param name="title" value="Match Results"/>
</jsp:include>


<div style="float:right; padding-left:10px;" align="right">
<% if(seasons.getRowCount() > 1) { %>
<div style="padding-bottom:5px;">
    <tc-webtag:rscSelect name="snid" list="<%=seasons%>" fieldText="name" fieldValue="season_id" selectedValue="<%= round.getSeasonId() + "" %>" useTopValue="false" onChange="selectSeason(this)"/>
</div>
<% }  %>
<div style="padding-bottom:5px;">
    <tc-webtag:rscSelect name="rd" list="<%=rounds%>" fieldText="name" fieldValue="round_id" selectedValue="<%=  round.getRoundId() + "" %>" useTopValue="false" onChange="selectRound(this)"/>
</div>

<div style="padding-bottom:5px;">
    <tc-webtag:rscSelect name="rn" list="<%=rooms%>" fieldText="name" fieldValue="room_id" selectedValue="<%=  rm + "" %>" useTopValue="false" onChange="selectRoom(this)"/>
</div>

</div>


<span class="bigTitle"><%= round.getRoundName() %></span><br>
<span class="bodySubtitle">Season: <%= round.getSeasonName() %></span><br>
<% if(round.getForumId() > 0) { %>
<A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=<%=round.getForumId() %>" class="bcLink">Discuss this contest</a>
<% } %>

<div class="pagingBox" style="clear:both;">&#160;</div>

<table class="stat" cellpadding="0" cellspacing="0" width="100%">
   <tr><td class="title" colspan="18"><%= round.getRoundName() %> > <%= roomName %> Results</td></tr>
   <tr>
      <td class="headerC" colspan="3">&#160;</td>
      <td class="headerR" colspan="2">Submissions</td>
      <td class="headerR" colspan="2">Defenses</td>
      <td class="headerR" colspan="2">Challenges</td>
      <td class="headerC" colspan="2" style="border-right:1px solid #999999;">&#160;</td>
      <td class="headerC" colspan="3">Rating</td>
   </tr>
   <tr>
      <td class="header">&#160;</td>
      <td class="header" width="16%" colspan="2"><A href="">Coders</A></td>
      <td class="headerR" width="16%"><A href="">Qnty</A></td>
      <td class="headerR"><A href="">Points</A></td>
      <td class="headerR" width="16%"><A href="">Qnty</A></td>
      <td class="headerR"><A href="">Points</A></td>
      <td class="headerR" width="16%"><A href="">Qnty</A></td>
      <td class="headerR"><A href="">Points</A></td>
      <td class="headerR" width="16%"><A href="">System Tests</A></td>
      <td class="headerR" width="16%" style="border-right:1px solid #999999;"><A href="">Point Total</A></td>
      <td class="headerR"><A href="">Old</A></td>
      <td class="headerR"><A href="">New</A></td>
      <td class="headerR">&#160;</td>
   </tr>

   <% boolean even = false; %>
   <rsc:iterator list="<%= roomResult%>" id="resultRow">
   <%   even = !even; %>
   <tr class='<%= resultRow.getIntItem("cr") == cr? "highlight" :
                   even? "dark":"light"
               %>'>
      <td class="value" style="vertical-align: middle;">
      <A href="javascript:selectCoder(<%= resultRow.getItem("coder_id").toString() %>)"><img src="/i/interface/exp_w.gif" alt="" /></A>
      </td>
      <td class="value">
         <tc-webtag:handle coderId='<%= resultRow.getItem("coder_id").toString() %>' />
      </td>

      <td class="value">
         <div id="popBox">
            <div id="d_CODERID"><rsc:item name="team_name" row="<%=resultRow%>"/></div>
         </div>
         <A href="teamResults" id="a_CODERID" onmouseover="popUp(this.id,'d_CODERID')" onmouseout="popHide()">team</A>
      </td>

      <td class="valueR">
      <rsc:item name="problems_submitted" row="<%=resultRow%>"/>
      </td>
      <td class="valueR">
      <rsc:item name="submission_points" row="<%=resultRow%>"/>
      </td>

      <td class="valueR">
      <rsc:item name="challenge_attempts_received" row="<%=resultRow%>"/>
      </td>
      <td class="valueR">
      <rsc:item name="defense_points" row="<%=resultRow%>"/>
      </td>

      <td class="valueR">
      <rsc:item name="challenge_attempts_made" row="<%=resultRow%>"/>
      </td>
      <td class="valueR">
      <rsc:item name="challenge_points" row="<%=resultRow%>"/>
      </td>

      <td class="valueR">
      <rsc:item name="system_test_points" row="<%=resultRow%>"/>
      </td>
      <td class="valueR" style="border-right:1px solid #999999;">
      <rsc:item name="final_points" row="<%=resultRow%>"/>
      </td>

      <td class="valueR">
      <rsc:item name="old_rating" row="<%=resultRow%>"/>
      </td>
      <td class="valueR">
      <rsc:item name="new_rating" row="<%=resultRow%>"/>
      </td>
      <td class="value" style="vertical-align: middle;">
      <img src="/i/interface/greenUp.gif" alt="" />
      </td>
   </tr>
   </rsc:iterator>

<%--
FOR A HIGHLIGHTED ROW, THE TR NEEDS TO BE class="highlight"
THE LEFT CELL NEEDS TO HAVE THE SUFFIX _leftside
THE RIGHT CELL NEEDS TO HAVE THE SUFFIC _rightside
(all because god damn IE won't recognize a <TR> border, a w3c standard, BLA!)
--%>
</table>

<br><br>

<% if (cr >= 0) {
%>
<table class="stat" cellpadding="0" cellspacing="0" width="100%">
   <tr><td class="title" colspan="6">Problem Information > tomek</td></tr>
   <tr>
      <td class="header">Class</td>
      <td class="header">Method</td>
      <td class="header">Difficulty</td>
      <td class="headerC">Coding Time</td>
      <td class="header">Status</td>
      <td class="headerR">Points</td>
   </tr>
   <% even = false; %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value"><A href="">FallingBall</A></td>
      <td class="value">howMany</td>
      <td class="value">Level One</td>
      <td class="valueC">0:06:09.903</td>
      <td class="value">Failed System Test</td>
      <td class="valueR">238.92</td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value"><A href="">CMajor</A></td>
      <td class="value">getLongest</td>
      <td class="value">Level Two</td>
      <td class="valueC">0:22:36.876</td>
      <td class="value">Passed System Test</td>
      <td class="valueR">333.32</td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value"><A href="">ShrinkingPills</A></td>
      <td class="value">escape</td>
      <td class="value">Level Three</td>
      <td class="valueC">0:14:30.420</td>
      <td class="value">Passed System Test</td>
      <td class="valueR">809.41</td>
   </tr>
</table>

<br><br>

<table class="stat" cellpadding="0" cellspacing="0" width="100%">
   <tr><td class="title" colspan="17">Challenge Information > tomek</td></tr>
   <tr>
      <td class="header">Challenger</td>
      <td class="header">Defendant</td>
      <td class="header">Problem</td>
      <td class="header">Succeeded</td>
      <td class="headerR">Points</td>
      <td class="headerC">&#160;</td>
   </tr>
   <% even = false; %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value"><tc-webtag:handle coderId="144400" /></td>
      <td class="value"><tc-webtag:handle coderId="272072" /></td>
      <td class="value">FallingBall</td>
      <td class="value">Yes</td>
      <td class="valueR">50.00</td>
      <td class="valueC"><A href="">details</A></td>
   </tr>
   <% even = !even;%>
</table>

<br><br>

<% } %>
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
