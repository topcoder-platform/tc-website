<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder News Archive</title>

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
			<jsp:include page="../includes/global_left.jsp">
				<jsp:param name="level1" value=""/>
				<jsp:param name="level2" value=""/>
			</jsp:include>
		</td>
<!-- Left Column Ends -->
 
<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="myTCBody">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="news_archive"/>
            <jsp:param name="title" value="Movies"/>
        </jsp:include>

            <table border=0 cellpadding=2 cellspacing=0 width="100%">
            <tr class="bodyText" valign="top"><td nowrap="nowrap">06.01.05 9:00 AM&#160;-&#160</td><td width="100%"><A href="/i/tournament/tccc05/onsite_movies/reviewBoard.mov">The TopCoder Review Board</A></td></tr>
            <tr class="bodyText" valign="top"><td nowrap="nowrap">04.25.05 11:20 AM&#160;-&#160</td><td width="100%"><A href="/i/tournament/tccc05/onsite_movies/JohnDethridge.mov">John Dethridge on the TCCC05</A></td></tr>
            <tr class="bodyText" valign="top"><td nowrap="nowrap">03.13.05 11:00 AM&#160;-&#160</td><td width="100%"><A href="/i/tournament/tccc05/onsite_movies/GeorgeCygan.mov">Motorola Senior Resource Manager George Cygan on "Intelligence Everywhere"</A></td></tr>
            <tr class="bodyText" valign="top"><td nowrap="nowrap">03.09.05 1:45 PM&#160;-&#160</td><td width="100%"><A href="/i/tournament/tco04/onsite_movies/marybeth.mov">MaryBeth Luce on finding the best</A></td></tr>
            <tr class="bodyText" valign="top"><td nowrap="nowrap">02.21.05 12:30 PM&#160;-&#160</td><td width="100%"><A href="/i/tournament/tco04/onsite_movies/heidiBurgett.mov">Yahoo!'s Heidi Burgett on hiring the "best and the brightest"</A></td></tr>
            <tr class="bodyText" valign="top"><td nowrap="nowrap">02.07.05 1:15 PM&#160;-&#160</td><td width="100%"><A href="/i/tournament/tco04/onsite_movies/reid.mov">reid, on going to an onsite event</A></td></tr>
            <tr class="bodyText" valign="top"><td nowrap="nowrap">01.25.05 10:00 AM&#160;-&#160</td><td width="100%"><A href="/i/tournament/tco04/onsite_movies/Nvidia2.mov">NVIDIA's Nick Trientos on the TopCoder community</A></td></tr>
            <tr class="bodyText" valign="top"><td nowrap="nowrap">01.25.05 10:00 AM&#160;-&#160</td><td width="100%"><A href="/i/tournament/tco04/onsite_movies/DaveOBrien.mov">TopCoder VP of Sales Dave O'Brien on TopCoder's Component Methodology</A></td></tr>
            <tr class="bodyText" valign="top"><td nowrap="nowrap">01.04.05 5:00 PM&#160;-&#160</td><td width="100%"><A href="/i/tournament/tco04/onsite_movies/rhughes.mov">President/COO Rob Hughes discusses "Performance & Credibility"</A></td></tr>
            <tr class="bodyText" valign="top"><td nowrap="nowrap">12.21.04 5:00 PM&#160;-&#160</td><td width="100%"><A href="/i/tournament/tco04/onsite_movies/MikeMorris.mov">TopCoder VP of Software Development Mike Morris on TopCoder's Component Methodology</A></td></tr>
            </table>

        </div>
        <p><br/></p>
        </td>
<!-- Center Column Ends -->

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
