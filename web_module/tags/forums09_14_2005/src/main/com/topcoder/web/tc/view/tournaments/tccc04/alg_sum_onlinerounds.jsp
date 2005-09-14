<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Collegiate Challenge - Computer Programming Tournament - Summary</title>

<jsp:include page="../../script.jsp" />

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
                <jsp:param name="level1" value="events"/>
                <jsp:param name="level2" value="tournaments"/>
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
   <jsp:param name="tabLev2" value="summary"/>
   <jsp:param name="tabLev3" value="online"/>
</jsp:include>

            <h2>Online Rounds</h2>

                        <table width="400" class="formFrame" cellspacing="2" cellpadding="6" align="center">
                            <tr><td class="sidebarTitle" colspan="2">Problem Set Analyses</td></tr>
                            <tr><td class="sidebarText">&#160;02.28.04</td><td class="sidebarText" nowrap="0">&#160;TCCC04 - Online Round 1 - <a href="/index?t=statistics&amp;c=tccc04_online_rd_1">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="sidebarText">&#160;03.03.04</td><td class="sidebarText" nowrap="0">&#160;TCCC04 - Online Round 2 - <a href="/index?t=statistics&amp;c=tccc04_online_rd_2">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="sidebarText">&#160;03.10.04</td><td class="sidebarText" nowrap="0">&#160;TCCC04 - Online Round 3 - <a href="/index?t=statistics&amp;c=tccc04_online_rd_3">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="sidebarText">&#160;03.17.04</td><td class="sidebarText" nowrap="0">&#160;TCCC04 - Online Round 4 - <a href="/index?t=statistics&amp;c=tccc04_online_rd_4">Problem Set &amp; Analysis</a></td></tr>
                        </table>

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
