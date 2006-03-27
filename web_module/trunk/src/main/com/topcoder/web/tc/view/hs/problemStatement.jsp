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
// -->
</script>
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
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Problem Statement"/>
</jsp:include>

<span class="bigTitle">IntegerGenerator</span>
<br><br>
<span class="bodySubtitle">Problem Statement</span><br>

   <div class="bodyIndented">
   As part of a larger scale project, you need to write a component which generates consecutive positive integers. Only certain digits may appear in the input and in the integers generated, and leading zeros aren't allowed.
   <br><br>
   You are given a int[] <b>allowed</b> containing the list of allowed digits, and a String <b>current</b> representing the current integer. Return a String representing the first integer larger than <b>current</b> composed only of digits in <b>allowed</b>.
   <br><br>
   If <b>current</b> represents an invalid integer according to the first paragraph, return &quot;<tt>INVALID INPUT</tt>&quot; (quotes for clarity).
   </div>

<br><br>
<span class="bodySubtitle">Definition</span><br>

   <div class="bodyIndented">
   <table cellpadding="3" cellspacing="0" border="0">
      <tr>
         <td>Class:</td>
         <td>IntegerGenerator</td>
      </tr>
      <tr>
         <td>Method:</td>
         <td>nextInteger</td>
      </tr>
      <tr>
         <td>Parameters:</td>
         <td>int[], String</td>
      </tr>
      <tr>
         <td>Returns:</td>
         <td>String</td>
      </tr>
      <tr>
         <td>Method signature:</td>
         <td>String nextInteger(int[] allowed, String current)</td>
      </tr>
      <tr>
         <td colspan="2">(be sure your methodis public):</td>
      </tr>
   </table>
   </div>

<br><br>
<span class="bodySubtitle">Constraints</span><br>

   <div class="bodyIndented">
   - <strong>allowed</strong> will contain between 0 and 10 elements, inclusive.<br>
   - Each element in <strong>allowed</strong> will be between 0 and 9, inclusive.<br>
   - <strong>allowed</strong> will contain no duplicates.<br>
   - <strong>current</strong> will contain between 1 and 10 digits ('0'-'9'), inclusive.
   </div>

<br><br>
<span class="bodySubtitle">Examples</span>

<br><br>

0)
   <div class="bodyIndented">
   <pre>
{ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 }

"16"

Returns: "17"
   </pre>
   With all digits available, the next number is 17.
   </div>

<br><br>

1)
   <div class="bodyIndented">
   <pre>
{ 0, 1, 2, 3, 4, 5, 6, 8, 9 }

"16"

Returns: "18"
   </pre>
   The digit 7 is no longer allowed, so the next smallest valid integer is 18.
   </div>

<br><br>
<hr>
This problem statement is the exclusive and proprietary property of TopCoder, Inc. Any unauthorized use or reproduction of this information without the prior written consent of TopCoder, Inc. is strictly prohibited. (c)2006, TopCoder, Inc. All rights reserved.
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
