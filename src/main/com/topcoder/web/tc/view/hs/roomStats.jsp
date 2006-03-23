<%@ page import="com.topcoder.web.tc.Constants"%>
<%@ page language="java" %>
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
<script language="JavaScript">
<!--
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
<jsp:param name="title" value="Match Results"/>
</jsp:include>

<div style="float:right; padding-left:10px;" align="right">
<div style="padding-bottom:5px;">
   <select name="season" onchange="goTo(this)" width="200">
   <option value="" selected="selected">View another room:</option>
   <option value="0000">Room 1</option>
   </select>
</div>
<div style="padding-bottom:5px;">
   <select name="rd" onchange="goTo(this)">
   <option value="" selected="selected">View another contest:</option>
   <option value="0000">High School Single Round Match 1</option>
   </select>
</div>
<div style="padding-bottom:5px;">
   <select name="season" onchange="goTo(this)">
   <option value="" selected="selected">View another season:</option>
   <option value="0000">2006-2007</option>
   </select>
</div>
</div>

<span class="bigTitle">High School Single Round Match 1 > Room 1</span><br>
<span class="bodySubtitle">Season: 2006-2007</span><br>
<A href="" class="bcLink">Discuss this contest</a>

<div class="pagingBox" style="clear:both;">&#160;</div>

<table class="stat" cellpadding="0" cellspacing="0" width="100%">
   <tr><td class="title" colspan="18">High School Single Round Match 1 > Room 1 Results</td></tr>
   <tr>
      <td class="headerC" colspan="3">&#160;</td>
      <td class="headerR" colspan="2">Submissions</td>
      <td class="headerR" colspan="2">Defenses</td>
      <td class="headerR" colspan="2">Challenges</td>
      <td class="headerC" colspan="2" style="border-right:1px solid #999999;">&#160;</td>
      <td class="headerC" colspan="3">Rating</td>
   <tr>
      <td class="header">&#160;</td>
      <td class="header" width="16%" colspan="2"><A href="">Competitors</A></td>
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
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" style="vertical-align: middle;">
      <A href="#"><img src="/i/interface/exp_w.gif" alt="" /></A>
      </td>
      <td class="value">
         <tc-webtag:handle coderId="144400" />
      </td>

      <td class="value">
         <div id="popBox">
            <div id="d_CODERID">Rocky Hill High School</div>
         </div>
         <A href="teamResults" id="a_CODERID" onmouseover="popUp(this.id,'d_CODERID')" onmouseout="popHide()">team</A>
      </td>

      <td class="valueR">
      2
      </td>
      <td class="valueR">
      511.86
      </td>

      <td class="valueR">
      0
      </td>
      <td class="valueR">
      0.00
      </td>

      <td class="valueR">
      0
      </td>
      <td class="valueR">
      0.00
      </td>

      <td class="valueR">
      0.00
      </td>
      <td class="valueR" style="border-right:1px solid #999999;">
      511.86
      </td>

      <td class="valueR">
      2484
      </td>
      <td class="valueR">
      2513
      </td>
      <td class="value" style="vertical-align: middle;">
      <img src="/i/interface/greenUp.gif" alt="" />
      </td>
   </tr>
   <% even = !even;%>
<%--
FOR A HIGHLIGHTED ROW, THE TR NEEDS TO BE class="highlight"
THE LEFT CELL NEEDS TO HAVE THE SUFFIX _leftside
THE RIGHT CELL NEEDS TO HAVE THE SUFFIC _rightside
(all because god damn IE won't recognize a <TR> border, a w3c standard, BLA!)
--%>
   <tr class="highlight">
      <td class="valueR" style="vertical-align: middle;>
      <A href="#"><img src="/i/interface/exp_ed_w.gif" alt="" /></A>
      </td>
      <td class="value">
      <tc-webtag:handle coderId="144400" />
      </td>

      <td class="value">
         <div id="popBox">
            <div id="d_CODERID">Rocky Hill High School</div>
         </div>
         <A href="teamResults" id="a_CODERID" onmouseover="popUp(this.id,'d_CODERID')" onmouseout="popHide()">team</A>
      </td>

      <td class="valueR">
      2
      </td>
      <td class="valueR">
      511.86
      </td>

      <td class="valueR">
      0
      </td>
      <td class="valueR">
      0.00
      </td>

      <td class="valueR">
      0
      </td>
      <td class="valueR">
      0.00
      </td>

      <td class="valueR">
      0.00
      </td>
      <td class="valueR" style="border-right:1px solid #999999;">
      511.86
      </td>

      <td class="valueR">
      2484
      </td>
      <td class="valueR">
      2513
      </td>
      <td class="value" style="vertical-align: middle;">
      <img src="/i/interface/greenUp.gif" alt="" />
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" style="vertical-align: middle;">
      <A href="#"><img src="/i/interface/exp_w.gif" alt="" /></A>
      </td>
      <td class="value">
      <tc-webtag:handle coderId="144400" />
      </td>

      <td class="value">
         <div id="popBox">
            <div id="d_CODERID">Rocky Hill High School</div>
         </div>
         <A href="teamResults" id="a_CODERID" onmouseover="popUp(this.id,'d_CODERID')" onmouseout="popHide()">team</A>
      </td>

      <td class="valueR">
      2
      </td>
      <td class="valueR">
      511.86
      </td>

      <td class="valueR">
      0
      </td>
      <td class="valueR">
      0.00
      </td>

      <td class="valueR">
      0
      </td>
      <td class="valueR">
      0.00
      </td>

      <td class="valueR">
      0.00
      </td>
      <td class="valueR" style="border-right:1px solid #999999;">
      511.86
      </td>

      <td class="valueR">
      2484
      </td>
      <td class="valueR">
      2513
      </td>
      <td class="value" style="vertical-align: middle;">
      <img src="/i/interface/greenUp.gif" alt="" />
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" style="vertical-align: middle;">
      <A href="#"><img src="/i/interface/exp_w.gif" alt="" /></A>
      </td>
      <td class="value">
      <tc-webtag:handle coderId="144400" />
      </td>

      <td class="value">
         <div id="popBox">
            <div id="d_CODERID">Rocky Hill High School</div>
         </div>
         <A href="teamResults" id="a_CODERID" onmouseover="popUp(this.id,'d_CODERID')" onmouseout="popHide()">team</A>
      </td>

      <td class="valueR">
      2
      </td>
      <td class="valueR">
      511.86
      </td>

      <td class="valueR">
      0
      </td>
      <td class="valueR">
      0.00
      </td>

      <td class="valueR">
      0
      </td>
      <td class="valueR">
      0.00
      </td>

      <td class="valueR">
      0.00
      </td>
      <td class="valueR" style="border-right:1px solid #999999;">
      511.86
      </td>

      <td class="valueR">
      2484
      </td>
      <td class="valueR">
      2513
      </td>
      <td class="value" style="vertical-align: middle;">
      <img src="/i/interface/greenUp.gif" alt="" />
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" style="vertical-align: middle;">
      <A href="#"><img src="/i/interface/exp_w.gif" alt="" /></A>
      </td>
      <td class="value">
      <tc-webtag:handle coderId="144400" />
      </td>

      <td class="value">
         <div id="popBox">
            <div id="d_CODERID">Rocky Hill High School</div>
         </div>
         <A href="teamResults" id="a_CODERID" onmouseover="popUp(this.id,'d_CODERID')" onmouseout="popHide()">team</A>
      </td>

      <td class="valueR">
      2
      </td>
      <td class="valueR">
      511.86
      </td>

      <td class="valueR">
      0
      </td>
      <td class="valueR">
      0.00
      </td>

      <td class="valueR">
      0
      </td>
      <td class="valueR">
      0.00
      </td>

      <td class="valueR">
      0.00
      </td>
      <td class="valueR" style="border-right:1px solid #999999;">
      511.86
      </td>

      <td class="valueR">
      2484
      </td>
      <td class="valueR">
      2513
      </td>
      <td class="value" style="vertical-align: middle;">
      <img src="/i/interface/greenUp.gif" alt="" />
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" style="vertical-align: middle;">
      <A href="#"><img src="/i/interface/exp_w.gif" alt="" /></A>
      </td>
      <td class="value">
      <tc-webtag:handle coderId="144400" />
      </td>

      <td class="value">
         <div id="popBox">
            <div id="d_CODERID">Rocky Hill High School</div>
         </div>
         <A href="teamResults" id="a_CODERID" onmouseover="popUp(this.id,'d_CODERID')" onmouseout="popHide()">team</A>
      </td>

      <td class="valueR">
      2
      </td>
      <td class="valueR">
      511.86
      </td>

      <td class="valueR">
      0
      </td>
      <td class="valueR">
      0.00
      </td>

      <td class="valueR">
      0
      </td>
      <td class="valueR">
      0.00
      </td>

      <td class="valueR">
      0.00
      </td>
      <td class="valueR" style="border-right:1px solid #999999;">
      511.86
      </td>

      <td class="valueR">
      2484
      </td>
      <td class="valueR">
      2513
      </td>
      <td class="value" style="vertical-align: middle;">
      <img src="/i/interface/greenUp.gif" alt="" />
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" style="vertical-align: middle;">
      <A href="#"><img src="/i/interface/exp_w.gif" alt="" /></A>
      </td>
      <td class="value">
      <tc-webtag:handle coderId="144400" />
      </td>

      <td class="value">
         <div id="popBox">
            <div id="d_CODERID">Rocky Hill High School</div>
         </div>
         <A href="teamResults" id="a_CODERID" onmouseover="popUp(this.id,'d_CODERID')" onmouseout="popHide()">team</A>
      </td>

      <td class="valueR">
      2
      </td>
      <td class="valueR">
      511.86
      </td>

      <td class="valueR">
      0
      </td>
      <td class="valueR">
      0.00
      </td>

      <td class="valueR">
      0
      </td>
      <td class="valueR">
      0.00
      </td>

      <td class="valueR">
      0.00
      </td>
      <td class="valueR" style="border-right:1px solid #999999;">
      511.86
      </td>

      <td class="valueR">
      2484
      </td>
      <td class="valueR">
      2513
      </td>
      <td class="value" style="vertical-align: middle;">
      <img src="/i/interface/greenUp.gif" alt="" />
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" style="vertical-align: middle;">
      <A href="#"><img src="/i/interface/exp_w.gif" alt="" /></A>
      </td>
      <td class="value">
      <tc-webtag:handle coderId="144400" />
      </td>

      <td class="value">
         <div id="popBox">
            <div id="d_CODERID">Rocky Hill High School</div>
         </div>
         <A href="teamResults" id="a_CODERID" onmouseover="popUp(this.id,'d_CODERID')" onmouseout="popHide()">team</A>
      </td>

      <td class="valueR">
      2
      </td>
      <td class="valueR">
      511.86
      </td>

      <td class="valueR">
      0
      </td>
      <td class="valueR">
      0.00
      </td>

      <td class="valueR">
      0
      </td>
      <td class="valueR">
      0.00
      </td>

      <td class="valueR">
      0.00
      </td>
      <td class="valueR" style="border-right:1px solid #999999;">
      511.86
      </td>

      <td class="valueR">
      2484
      </td>
      <td class="valueR">
      2513
      </td>
      <td class="value" style="vertical-align: middle;">
      <img src="/i/interface/greenUp.gif" alt="" />
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" style="vertical-align: middle;">
      <A href="#"><img src="/i/interface/exp_w.gif" alt="" /></A>
      </td>
      <td class="value">
      <tc-webtag:handle coderId="144400" />
      </td>

      <td class="value">
         <div id="popBox">
            <div id="d_CODERID">Rocky Hill High School</div>
         </div>
         <A href="teamResults" id="a_CODERID" onmouseover="popUp(this.id,'d_CODERID')" onmouseout="popHide()">team</A>
      </td>

      <td class="valueR">
      2
      </td>
      <td class="valueR">
      511.86
      </td>

      <td class="valueR">
      0
      </td>
      <td class="valueR">
      0.00
      </td>

      <td class="valueR">
      0
      </td>
      <td class="valueR">
      0.00
      </td>

      <td class="valueR">
      0.00
      </td>
      <td class="valueR" style="border-right:1px solid #999999;">
      511.86
      </td>

      <td class="valueR">
      2484
      </td>
      <td class="valueR">
      2513
      </td>
      <td class="value" style="vertical-align: middle;">
      <img src="/i/interface/greenUp.gif" alt="" />
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" style="vertical-align: middle;">
      <A href="#"><img src="/i/interface/exp_w.gif" alt="" /></A>
      </td>
      <td class="value">
      <tc-webtag:handle coderId="144400" />
      </td>

      <td class="value">
         <div id="popBox">
            <div id="d_CODERID">Rocky Hill High School</div>
         </div>
         <A href="teamResults" id="a_CODERID" onmouseover="popUp(this.id,'d_CODERID')" onmouseout="popHide()">team</A>
      </td>

      <td class="valueR">
      2
      </td>
      <td class="valueR">
      511.86
      </td>

      <td class="valueR">
      0
      </td>
      <td class="valueR">
      0.00
      </td>

      <td class="valueR">
      0
      </td>
      <td class="valueR">
      0.00
      </td>

      <td class="valueR">
      0.00
      </td>
      <td class="valueR" style="border-right:1px solid #999999;">
      511.86
      </td>

      <td class="valueR">
      2484
      </td>
      <td class="valueR">
      2513
      </td>
      <td class="value" style="vertical-align: middle;">
      <img src="/i/interface/greenUp.gif" alt="" />
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" style="vertical-align: middle;">
      <A href="#"><img src="/i/interface/exp_w.gif" alt="" /></A>
      </td>
      <td class="value">
      <tc-webtag:handle coderId="144400" />
      </td>

      <td class="value">
         <div id="popBox">
            <div id="d_CODERID">Rocky Hill High School</div>
         </div>
         <A href="teamResults" id="a_CODERID" onmouseover="popUp(this.id,'d_CODERID')" onmouseout="popHide()">team</A>
      </td>

      <td class="valueR">
      2
      </td>
      <td class="valueR">
      511.86
      </td>

      <td class="valueR">
      0
      </td>
      <td class="valueR">
      0.00
      </td>

      <td class="valueR">
      0
      </td>
      <td class="valueR">
      0.00
      </td>

      <td class="valueR">
      0.00
      </td>
      <td class="valueR" style="border-right:1px solid #999999;">
      511.86
      </td>

      <td class="valueR">
      2484
      </td>
      <td class="valueR">
      2513
      </td>
      <td class="value" style="vertical-align: middle;">
      <img src="/i/interface/greenUp.gif" alt="" />
      </td>
   </tr>
   <% even = !even;%>
</table>

<br><br>

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
