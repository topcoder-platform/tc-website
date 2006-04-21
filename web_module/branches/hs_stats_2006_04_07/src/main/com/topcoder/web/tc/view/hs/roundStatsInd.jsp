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
ResultSetContainer result = (ResultSetContainer) resultMap.get("hs_ind_result");

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
    document.seasonForm.snid.value = selection.options[selection.selectedIndex].value;
    document.seasonForm.submit();
}

function selectRound(selection)
{
    document.pageForm.rd.value  = selection.options[selection.selectedIndex].value;
    document.pageForm.submit();
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
<jsp:param name="title" value="Match Results - Individual"/>
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
</div>

<span class="bigTitle"><%= round.getRoundName() %></span><br>
<span class="bodySubtitle">Season: <%= round.getSeasonName() %></span><br>
<% if(round.getForumId() > 0) { %>
<A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=<%=round.getForumId() %>" class="bcLink">Discuss this contest</a>
<% } %>

<div class="pagingBox">
&lt;&lt; prev
| <a href="Javascript:next()" class="bcLink">next &gt;&gt;</a>
</div>
<table class="stat" cellpadding="0" cellspacing="0" width="100%">
   <tr><td class="title" colspan="10">High School Single Round Match 1 > Individual Results</td></tr>
   <tr>
      <td class="header" colspan="2"><A href="#">Coder</A></td>
      <td class="headerR" nowrap="nowrap"><A href="#">Placement Points</td>
      <td class="headerR" nowrap="nowrap"><A href="#">Coding Phase</td>
      <td class="headerR">+</td>
      <td class="headerR" nowrap="nowrap"><A href="#">Challenge Phase</td>
      <td class="headerR">+</td>
      <td class="headerR" nowrap="nowrap"><A href="#">System Tests</td>
      <td class="headerR">=</td>
      <td class="headerR" nowrap="nowrap"><A href="#">Point Total</td>
   </tr>

   <% boolean even = false;
      int lastRoom = -1;
   %>
   <rsc:iterator list="<%= result%>" id="resultRow">
   <%
       even = !even;
       if (lastRoom != resultRow.getIntItem("room_id")) {
   %>
   <tr><td class="title" colspan="10" style="border-top:1px solid #999999;"><A href=""><rsc:item name="name" row="<%=resultRow%>"/></A></td></tr>
   <%
        lastRoom = resultRow.getIntItem("room_id");
      }
   %>
   <tr class="<%=even?"dark":"light"%>">
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
      <rsc:item name="division_placed" row="<%=resultRow%>"/>
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
