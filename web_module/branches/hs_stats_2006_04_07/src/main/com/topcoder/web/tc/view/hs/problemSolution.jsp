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
            <jsp:param name="node" value="m_hs_stats"/>
         </jsp:include>
        </td>
        <!-- Left Column Ends -->

        <!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="high_school"/>
<jsp:param name="title" value="Problem Solution"/>
</jsp:include>

<span class="bodySubtitle">High School Statistics > <A href="" class="bcLink">Match Overview</A> > <A href="" class="bcLink">Room Statistics</A> > Problem Solution</span></span>
<br><br>
<strong>Match:</strong> <A href="" class="bcLink">HS SRM 1 > Round 1</A><br>
<strong>Room:</strong> <A href="" class="bcLink">4</A><br>
<strong>Coder:</strong> <tc-webtag:handle coderId="267834" /><br>
<a href="http://forums.dev.topcoder.com/?module=ThreadList&amp;forumID=505540" class="bcLink">Discuss this contest</a>
<br><br>


<table cellpadding="0" cellspacing="0" border="0" class="stat" width="100%">
   <tr>
      <td class="title" colspan="5">
         Problem Solutions
      </td>
   </tr>
   <tr>
      <td class="header">
         Class Name
      </td>
      <td class="header">
         Method Name
      </td>
      <td class="header">
         Difficulty
      </td>
      <td class="header">
         Status
      </td>
      <td class="headerR">
         Points
      </td>
   </tr>
   <tr class="light">
      <td class="value">
         <A href="">Knights</A>
      </td>
      <td class="value">
         makeFriendly
      </td>
      <td class="value">
         Level One
      </td>
      <td class="value">
         Passed System Test
      </td>
      <td class="valueR">
         378.04
      </td>
   </tr>
   <tr class="highlight">
      <td class="value">
         Knights
      </td>
      <td class="value">
         makeFriendly
      </td>
      <td class="value">
         Level Two
      </td>
      <td class="value">
         <span class="bigRed">Failed System Test</span>
      </td>
      <td class="valueR">
         0.00
      </td>
   </tr>
   <tr class="light">
      <td class="value">
         <A href="">Knights</A>
      </td>
      <td class="value">
         makeFriendly
      </td>
      <td class="value">
         Level Three
      </td>
      <td class="value">
         Compiled
      </td>
      <td class="valueR">
         0.00
      </td>
   </tr>
</table>

<br><br>

<div style="float:right;"><A href="">view problem statement</A></div>
<span class="title">> <tc-webtag:handle coderId="267834" />'s solution to Knights</span>
<br><br>

<pre>
 public class SpiralNumbers {
  public String getPosition(int num) {
    if (num == 1) return "(0,0)";
    int row = 0, col = 0, w, s, p;
    w = Math.round((float)Math.ceil(Math.sqrt((double)num)));
    if (w%2 == 0) w++;
    
    num -= (w-2)*(w-2);
    s = (w-1)/2;
    p = num%(w-1);
    switch (num/(w-1)) {
      case 0:  // R
        row = -s+p;
        col = s;
        break;
      case 1:  // D
        row = s;
        col = s-p;
        break;
      case 2:  // L
        row = s-p;
        col = -s;
        break;
      case 3:  // U
        row = -s;
        col = -s+p;
        break;
    }
    
    return "(" + row + "," + col + ")";
  }
}

</pre>


<table cellpadding="0" cellspacing="0" border="0" class="stat" width="100%">
   <tr>
      <td class="title" colspan="3">
          System Test Results
      </td>
   </tr>
   <tr>
      <td class="header">
         Test Arguments
      </td>
      <td class="headerR">
         Expected Results
      </td>
      <td class="headerR">
         Success
      </td>
   </tr>
   <% boolean even = false; %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
         3
      </td>
      <td class="valueR">
         "(1,1)"
      </td>
      <td class="valueR">
         Passed
      </td>
   </tr>
   <% even = !even; %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
         7
      </td>
      <td class="valueR">
         "(-1,-1)"
      </td>
      <td class="valueR">
         <span class="bigRed">FAILED - Result:    "(0,0)"</span>
      </td>
   </tr>
   <% even = !even; %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
         17
      </td>
      <td class="valueR">
         "(2,-2)"
      </td>
      <td class="valueR">
         Passed
      </td>
   </tr>
   <% even = !even; %>
</table>

</td>
        <!-- Center Column Ends -->

        <!-- Right Column Begins -->
        <td width="170">
            <jsp:include page="/public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
        <!-- Right Column Ends -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>

    </tr>
</table>

<jsp:include page="/foot.jsp"/>

</body>

</html>
