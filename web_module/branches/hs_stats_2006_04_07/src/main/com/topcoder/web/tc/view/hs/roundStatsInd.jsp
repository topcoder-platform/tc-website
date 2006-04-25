<%@  page language="java"
    import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*, com.topcoder.web.tc.Constants,
          java.util.Map, java.text.DecimalFormat, com.topcoder.web.tc.controller.request.hs.RoundInfo, com.topcoder.web.tc.controller.request.hs.ListInfo,
                    com.topcoder.web.tc.controller.request.hs.Base,
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

boolean groupByRoom = "true".equals(request.getAttribute("groupByRoom"));

int totalRows = Integer.parseInt((String) request.getAttribute("totalRows"));

%>

<script language="JavaScript">
<!--

function selectSeason(selection)
{
    window.location = "/tc?module=HSRoundStatsInd&snid=" + selection.options[selection.selectedIndex].value;}

function selectRound(selection)
{
    window.location = "/tc?module=HSRoundStatsInd&snid=<%= round.getSeasonId() %>&rd=" + selection.options[selection.selectedIndex].value;
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

function clickColumn(n)
{
    var sd = "asc";

    if(n == <%= li.getSortColumn() %>) {
        if ("asc" == "<%= li.getSortDirection() %>") {
            sd = "desc";
        }
    }

    window.location = "/tc?module=HSRoundStatsInd&snid=<%= round.getSeasonId() %>&rd=<%= round.getRoundId() %>&sc=" + n +
                  "&sd=" + sd + "&sr=<%= li.getStartRow() %>&nr=<%= li.getNumberOfRows() %>";


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
    if (sr < 1) sr = 1;


    <%= if (groupByRoom) { %>
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
        showRows(document.pagingForm.sr.value, document.pagingForm.nr.value);
    } else return true;
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
<%=(result.croppedDataBefore()? ("<a href='Javascript:showRows(" + li.getStartRow() +", " + (li.getStartRow() - li.getNumberOfRows()) + ")'>&lt;&lt; prev</a>") :"&lt;&lt; prev")%>
| <%=(result.croppedDataAfter()? ("<a href='Javascript:showRows(" + li.getStartRow() +", "+ (li.getStartRow() + li.getNumberOfRows()) + ")'>next &gt;&gt;</a>") :"next &gt;&gt;")%>
</div>

<% if (!groupByRoom) { %>
    <a href="/tc?module=HSRoundStatsInd&snid=<%= round.getSeasonId() %>&rd=<%= round.getRoundId() %>">Group by room</a>
<% } %>

<table class="stat" cellpadding="0" cellspacing="0" width="100%">
   <tr><td class="title" colspan="16"><%= round.getRoundName() %> > Individual Results</td></tr>
   <tr>
      <td class="header" colspan="2" rowspan="2"><A href="javascript:clickColumn(0)">Coder</A></td>
      <td class="headerR" rowspan="2"><A href="javascript:clickColumn(1)">Placement<br>Points</td>
      <td class="headerR" rowspan="2"><A href="javascript:clickColumn(2)">Coding<br>Phase</td>

      <td class="headerR" rowspan="2">+</td>
      <td class="headerR" rowspan="2"><A href="javascript:clickColumn(3)">Challenge<br>Phase</td>
      <td class="headerR" rowspan="2">+</td>
      <td class="headerR" rowspan="2"><A href="javascript:clickColumn(4)">System<br>Tests</td>
      <td class="headerR" rowspan="2">=</td>

      <td class="headerR" rowspan="2" style="border-right:1px solid #999999;"><A href="javascript:clickColumn(5)">Point<br>Total</td>
      <td class="headerC" colspan="6">Rating</td>
   </tr>
   <tr>
      <td class="headerR"><A href="javascript:clickColumn(6)">Old</A></td>
      <td class="headerR">+</td>

      <td class="headerR"><A href="javascript:clickColumn(7)">&#916;</A></td>
      <td class="headerR">=</td>
      <td class="headerR"><A href="javascript:clickColumn(8)">New</A></td>
      <td class="headerR">&#160;</td>
   </tr>

   <% boolean even = false;
      int lastRoom = -1;
   %>
   <rsc:iterator list="<%= result%>" id="resultRow">
   <%
           even = !even;
           if (groupByRoom && (lastRoom != resultRow.getIntItem("room_id"))) {
           %>
                 <tr><td class="title" colspan="16" style="border-top:1px solid #999999;"><A href=""><rsc:item name="name" row="<%=resultRow%>"/></A></td></tr>
           <%
                 lastRoom = resultRow.getIntItem("room_id");
           }
           %>
           <tr class="<%=even?"dark":"light"%>">
              <td class="value">
                 <tc-webtag:handle coderId='<%= resultRow.getItem("coder_id").toString() %>' />
              </td>
              <td class="value" nowrap>
                 <div id="popBox">
                    <div id="d_CODERID_<%=resultRow.getItem("coder_id").toString() %>"><rsc:item name="team_name" row="<%=resultRow%>"/></div>
                 </div>
                 <A href="results" id="a_CODERID" onmouseover="popUp(this.id,'d_CODERID_<%=resultRow.getItem("coder_id").toString() %>')" onmouseout="popHide()">
                 <%= Base.cutTeamName(resultRow.getStringItem("team_name")) %></A>
              </td>


              <td class="valueR">
              <rsc:item name="division_placed" row="<%=resultRow%>"/>
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
              <td class="valueR" colspan="2" style="border-right:1px solid #999999;">
              <rsc:item name="final_points" row="<%=resultRow%>"/>
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
                <% if (resultRow.getIntItem("rating_change")<0) { %>
                <IMG src="/i/interface/redDown.gif" border="0"/>
                <% } %>
                <% if (resultRow.getIntItem("rating_change")>0) { %>
                <IMG src="/i/interface/greenUp.gif" border="0"/>
                <% } %>
            </TD>

           </tr>
   </rsc:iterator>

</table>

<div class="pagingBox">
<%=(result.croppedDataBefore()? ("<a href='Javascript:showRows(" + li.getStartRow() +", " + (li.getStartRow() - li.getNumberOfRows()) + ")'>&lt;&lt; prev</a>") :"&lt;&lt; prev")%>
| <%=(result.croppedDataAfter()? ("<a href='Javascript:showRows(" + li.getStartRow() +", "+ (li.getStartRow() + li.getNumberOfRows()) + ")'>next &gt;&gt;</a>") :"next &gt;&gt;")%>

<form name="pagingForm">
View &nbsp;
<input name="nr" size="4" maxlength="4" onkeypress="submitEnter(event)" value="50" type="text">
&nbsp;at a time starting with &nbsp;

<input name="sr" size="4" maxlength="4" onkeypress="submitEnter(event)" value="1" type="text">
<a href="Javascript:showRows(document.pagingForm.sr.value, document.pagingForm.nr.value)" class="bcLink">&nbsp;[ submit ]</a>
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
