<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 Collegiate Challenge - Computer Programming Tournament - Overview</title>

<jsp:include page="../../script.jsp" />

</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
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
   <jsp:param name="selectedTab" value="overview"/>
</jsp:include>

<!-- Tab bar sublinks
<jsp:include page="tccc04Sublinks.jsp" >
   <jsp:param name="selectedList" value=""/>
   <jsp:param name="selectedTab" value=""/>
</jsp:include>-->

            <h2>Overview of the Coding Tournament</h2>

            <ul>
                <li><strong>Dates: </strong><br />
                    October 7th through December 5th, 2003</li>
                <li><strong>Rounds: </strong><br />
                    Two qualification rounds - online<br />
                    Four elimination rounds - online<br />
                    The Semifinal and Championship rounds will be held at the Mohegan Sun Casino in Uncasville, CT on December 4th and 5th</li>
                <li><strong>Prizes: </strong><br />
                    Total Prize Purse: $100,000 in cash<br />
                    Up to 500 competitors will receive a prize just for competing in Online Round #1<br />
                    Up to 200 eligible competitors will receive cash prizes</li>
                <li><strong>Finalists: </strong><br />
                    The top 16 finishers in the online rounds will advance to the onsite Semifinal and Championship rounds</li>
            </ul>

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
