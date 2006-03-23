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
<jsp:param name="title" value="Team Results"/>
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

<span class="bigTitle">High School Single Round Match 1 > Rocky Hill High School</span><br>
<span class="bodySubtitle">Season: 2006-2007</span><br>
<A href="" class="bcLink">Discuss this contest</a>

<div class="pagingBox" style="clear:both;">&#160;</div>

<table class="stat" cellpadding="0" cellspacing="0" width="100%">
   <tr><td class="title" colspan="15">High School Single Round Match 1 > Rocky Hill High School Team Results</td></tr>
   <tr>
      <td class="headerC" colspan="2">&#160;</td>
      <td class="headerR" colspan="2">Submissions</td>
      <td class="headerR" colspan="2">Defenses</td>
      <td class="headerR" colspan="2">Challenges</td>
      <td class="headerC" colspan="2">&#160;</td>
      <td class="headerC">&#160;</td>
   <tr>
      <td class="header">&#160;</td>
      <td class="header" width="14%"><A href="">Competitors</A></td>
      <td class="headerR" width="14%"><A href="">Qnty</A></td>
      <td class="headerR"><A href="">Points</A></td>
      <td class="headerR" width="14%"><A href="">Qnty</A></td>
      <td class="headerR"><A href="">Points</A></td>
      <td class="headerR" width="14%"><A href="">Qnty</A></td>
      <td class="headerR"><A href="">Points</A></td>
      <td class="headerR" width="14%"><A href="">System Tests</A></td>
      <td class="headerR" width="14%"><A href="">Point Total</A></td>
      <td class="headerR" width="14%"><A href="">Position Points</A></td>
   </tr>
   <% boolean even = false; %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" style="vertical-align: middle;">
      <A href="#"><img src="/i/interface/exp_w.gif" alt="" /></A>
      </td>
      <td class="value">
      <tc-webtag:handle coderId="144400" />
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
      <td class="valueR">
      511.86
      </td>

      <td class="valueR">
      10
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
      <td class="valueR">
      511.86
      </td>

      <td class="valueR">
      10
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
      <td class="valueR">
      511.86
      </td>

      <td class="valueR">
      10
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
      <td class="valueR">
      511.86
      </td>

      <td class="valueR">
      10
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
      <td class="valueR">
      511.86
      </td>

      <td class="valueR">
      10
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
      <td class="valueR">
      511.86
      </td>

      <td class="valueR">
      10
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
      <td class="valueR">
      511.86
      </td>

      <td class="valueR">
      10
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
      <td class="valueR">
      511.86
      </td>

      <td class="valueR">
      10
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
      <td class="valueR">
      511.86
      </td>

      <td class="valueR">
      10
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
      <td class="valueR">
      511.86
      </td>

      <td class="valueR">
      10
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
      <td class="valueR">
      511.86
      </td>

      <td class="valueR">
      10
      </td>
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
