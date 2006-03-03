<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Collegiate Challenge - Computer Programming Tournament - Description</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>


<link type="text/css" rel="stylesheet" href="/css/TCCC04style.css"/>

</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
<jsp:param name="node" value="topcoder_tournaments"/>
</jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" WIDTH="100%">

<jsp:include page="tccc04Head.jsp" />

<!-- Tab bar links-->
<jsp:include page="tccc04links.jsp" >
   <jsp:param name="tabLev1" value="algorithm"/>
   <jsp:param name="tabLev2" value="details"/>
   <jsp:param name="tabLev3" value="description"/>
</jsp:include>

            <h2>Description of the Algorithm Competition</h2>

            <p>
            The 2004 TopCoder Collegiate Challenge is bigger and better than ever! 24 Algorithm finalists will be invited to compete live at the onsite finals in Boston.</p>
            <ul>
                <li><strong>Registration</strong><br />
                    STARTS: Sunday, February 1 at 9:00 AM<br/>
                    ENDS: Monday, February 23 at 9:00 AM</li>
                <li><strong>Open Qualification Round</strong><br />
                    STARTS: Monday, February 23 at 12:00 PM (noon)<br/>
                    ENDS: Tuesday, February 24 at 12:00 PM (noon)</li>
                <li><strong>Elimination Rounds Start</strong><br/>
                     February 28</li>
                <li><strong>Onsite Finals</strong><br />
                    April 15 & 16 at the Boston Park Plaza Hotel & Towers in Boston, MA, USA</li>
                <li><strong>Free Competition</strong></li>
                <li><strong>Open to all eligible college students</strong></li>
            </ul>

            <p>See the official rules and regulations for more details.</p>

         <p><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
