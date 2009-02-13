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
<jsp:param name="title" value="Match Results - Individual"/>
</jsp:include>

<div style="float:right; padding-left:10px;" align="right">
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

<span class="bigTitle">High School Single Round Match 1</span><br>
<span class="bodySubtitle">Season: 2006-2007</span><br>
<A href="" class="bcLink">Discuss this contest</a>

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
   <tr><td class="title" colspan="10" style="border-top:1px solid #999999;"><A href="">Room 1</A></td></tr>
   <% boolean even = false; %>
   <tr class="<%=even?"dark":"light"%>">
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
         <tc-webtag:handle coderId="144400" />
      </td>
      <td class="value">
         <div id="popBox">
            <div id="d_CODERID">Rocky Hill High School</div>
         </div>
         <A href="teamResults" id="a_CODERID" onmouseover="popUp(this.id,'d_CODERID')" onmouseout="popHide()">team</A>
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
         <tc-webtag:handle coderId="144400" />
      </td>
      <td class="value">
         <div id="popBox">
            <div id="d_CODERID">Rocky Hill High School</div>
         </div>
         <A href="teamResults" id="a_CODERID" onmouseover="popUp(this.id,'d_CODERID')" onmouseout="popHide()">team</A>
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
         <tc-webtag:handle coderId="144400" />
      </td>
      <td class="value">
         <div id="popBox">
            <div id="d_CODERID">Rocky Hill High School</div>
         </div>
         <A href="teamResults" id="a_CODERID" onmouseover="popUp(this.id,'d_CODERID')" onmouseout="popHide()">team</A>
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
         <tc-webtag:handle coderId="144400" />
      </td>
      <td class="value">
         <div id="popBox">
            <div id="d_CODERID">Rocky Hill High School</div>
         </div>
         <A href="teamResults" id="a_CODERID" onmouseover="popUp(this.id,'d_CODERID')" onmouseout="popHide()">team</A>
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
         <tc-webtag:handle coderId="144400" />
      </td>
      <td class="value">
         <div id="popBox">
            <div id="d_CODERID">Rocky Hill High School</div>
         </div>
         <A href="teamResults" id="a_CODERID" onmouseover="popUp(this.id,'d_CODERID')" onmouseout="popHide()">team</A>
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
         <tc-webtag:handle coderId="144400" />
      </td>
      <td class="value">
         <div id="popBox">
            <div id="d_CODERID">Rocky Hill High School</div>
         </div>
         <A href="teamResults" id="a_CODERID" onmouseover="popUp(this.id,'d_CODERID')" onmouseout="popHide()">team</A>
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
         <tc-webtag:handle coderId="144400" />
      </td>
      <td class="value">
         <div id="popBox">
            <div id="d_CODERID">Rocky Hill High School</div>
         </div>
         <A href="teamResults" id="a_CODERID" onmouseover="popUp(this.id,'d_CODERID')" onmouseout="popHide()">team</A>
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
         <tc-webtag:handle coderId="144400" />
      </td>
      <td class="value">
         <div id="popBox">
            <div id="d_CODERID">Rocky Hill High School</div>
         </div>
         <A href="teamResults" id="a_CODERID" onmouseover="popUp(this.id,'d_CODERID')" onmouseout="popHide()">team</A>
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
         <tc-webtag:handle coderId="144400" />
      </td>
      <td class="value">
         <div id="popBox">
            <div id="d_CODERID">Rocky Hill High School</div>
         </div>
         <A href="teamResults" id="a_CODERID" onmouseover="popUp(this.id,'d_CODERID')" onmouseout="popHide()">team</A>
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
   <tr><td class="title" colspan="10" style="border-top:1px solid #999999;"><A href="">Room 2</A></td></tr>
   <% even = false; %>
   <tr class="<%=even?"dark":"light"%>">
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
         <tc-webtag:handle coderId="144400" />
      </td>
      <td class="value">
         <div id="popBox">
            <div id="d_CODERID">Rocky Hill High School</div>
         </div>
         <A href="teamResults" id="a_CODERID" onmouseover="popUp(this.id,'d_CODERID')" onmouseout="popHide()">team</A>
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
         <tc-webtag:handle coderId="144400" />
      </td>
      <td class="value">
         <div id="popBox">
            <div id="d_CODERID">Rocky Hill High School</div>
         </div>
         <A href="teamResults" id="a_CODERID" onmouseover="popUp(this.id,'d_CODERID')" onmouseout="popHide()">team</A>
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
         <tc-webtag:handle coderId="144400" />
      </td>
      <td class="value">
         <div id="popBox">
            <div id="d_CODERID">Rocky Hill High School</div>
         </div>
         <A href="teamResults" id="a_CODERID" onmouseover="popUp(this.id,'d_CODERID')" onmouseout="popHide()">team</A>
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
         <tc-webtag:handle coderId="144400" />
      </td>
      <td class="value">
         <div id="popBox">
            <div id="d_CODERID">Rocky Hill High School</div>
         </div>
         <A href="teamResults" id="a_CODERID" onmouseover="popUp(this.id,'d_CODERID')" onmouseout="popHide()">team</A>
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
         <tc-webtag:handle coderId="144400" />
      </td>
      <td class="value">
         <div id="popBox">
            <div id="d_CODERID">Rocky Hill High School</div>
         </div>
         <A href="teamResults" id="a_CODERID" onmouseover="popUp(this.id,'d_CODERID')" onmouseout="popHide()">team</A>
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
         <tc-webtag:handle coderId="144400" />
      </td>
      <td class="value">
         <div id="popBox">
            <div id="d_CODERID">Rocky Hill High School</div>
         </div>
         <A href="teamResults" id="a_CODERID" onmouseover="popUp(this.id,'d_CODERID')" onmouseout="popHide()">team</A>
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
         <tc-webtag:handle coderId="144400" />
      </td>
      <td class="value">
         <div id="popBox">
            <div id="d_CODERID">Rocky Hill High School</div>
         </div>
         <A href="teamResults" id="a_CODERID" onmouseover="popUp(this.id,'d_CODERID')" onmouseout="popHide()">team</A>
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
         <tc-webtag:handle coderId="144400" />
      </td>
      <td class="value">
         <div id="popBox">
            <div id="d_CODERID">Rocky Hill High School</div>
         </div>
         <A href="teamResults" id="a_CODERID" onmouseover="popUp(this.id,'d_CODERID')" onmouseout="popHide()">team</A>
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
         <tc-webtag:handle coderId="144400" />
      </td>
      <td class="value">
         <div id="popBox">
            <div id="d_CODERID">Rocky Hill High School</div>
         </div>
         <A href="teamResults" id="a_CODERID" onmouseover="popUp(this.id,'d_CODERID')" onmouseout="popHide()">team</A>
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
