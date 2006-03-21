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

<div style="float:right;" align="center">
<select name="rd" onchange="goTo(this)">
<option value="" selected="selected">Please select a contest</option>
<option value="0000">HS Single Round Match 1</option>
</select>
<br>
<strong>or</strong>
<br>
<select name="season" onchange="goTo(this)">
<option value="" selected="selected">Please select a season</option>
<option value="0000">2006-2007</option>
</select>
</div>

<span class="bigTitle">Competition: HS SRM 1</span><br>
<span class="bodySubtitle">Season: 2006-2007</span><br>
<span class="bodySubtitle">Competitors: 499</span><br>
<span class="bodySubtitle">Teams: 150</span><br>
<A href="" class="bcLink">Discuss this contest</a>

<div class="pagingBox">
&lt;&lt; prev
| <a href="Javascript:next()" class="bcLink">next &gt;&gt;</a>
</div>
<table class="stat" cellpadding="0" cellspacing="0" width="100%">
   <tr><td class="title" colspan="9">HS SRM 1 Match Results - Team</td></tr>
   <tr>
      <td class="header"><A href="#">Handle</A></td>
      <td class="headerR" nowrap="nowrap"><A href="#">Placement Points</td>
      <td class="headerR" nowrap="nowrap"><A href="#">Coding Phase</td>
      <td class="headerR">+</td>
      <td class="headerR" nowrap="nowrap"><A href="#">Challenge Phase</td>
      <td class="headerR">+</td>
      <td class="headerR" nowrap="nowrap"><A href="#">System Tests</td>
      <td class="headerR">=</td>
      <td class="headerR" nowrap="nowrap"><A href="#">Point Total</td>
   </tr>
   <tr><td class="title" colspan="9" style="border-top:1px solid #999999;">Room 1</td></tr>
   <% boolean even = false; %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
         <div id="popBox">
            <div id="d_144400">Rocky Hill High School</div>
         </div>
         <A href="#" id="a_144400" class="coderTextRed" onmouseover="popUp(this.id,'d_144400')" onmouseout="popHide()">tomek</A>
      </td>
      <td class="valueR">
      5
      </td>
      <td class="valueR">
      1062.82
      </td>
      <td class="valueR" colspan="2">
      775.00
      </td>
      <td class="valueR" colspan="2">
      0.00
      </td>
      <td class="valueR" colspan="2">
      1837.82
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
         <div id="popBox">
            <div id="popUp270505">Woodstock High School</div>
         </div>
         <A href="#" id="270505" class="coderTextRed" onmouseover="popUp(this.id,'popUp270505')" onmouseout="popHide()" style="z-index: inherit;">John Dethridge</A>
      </td>
      <td class="valueR">
      5
      </td>
      <td class="valueR">
      1062.82
      </td>
      <td class="valueR" colspan="2">
      775.00
      </td>
      <td class="valueR" colspan="2">
      0.00
      </td>
      <td class="valueR" colspan="2">
      1837.82
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
         <div id="popBox">
            <div id="popUp7371063">Woodstock High School</div>
         </div>
         <A href="#" id="7371063" class="coderTextBlue" onmouseover="popUp(this.id,'popUp7371063')" onmouseout="popHide()" style="z-index: inherit;">supernova</A>
      </td>
      <td class="valueR">
      5
      </td>
      <td class="valueR">
      1062.82
      </td>
      <td class="valueR" colspan="2">
      775.00
      </td>
      <td class="valueR" colspan="2">
      0.00
      </td>
      <td class="valueR" colspan="2">
      1837.82
      </td>
   </tr>
   <% even = !even;%>
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
