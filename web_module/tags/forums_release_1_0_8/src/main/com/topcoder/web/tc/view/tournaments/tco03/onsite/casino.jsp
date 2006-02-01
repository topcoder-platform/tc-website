<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2003 TopCoder Open sponsored by Intel&#174;  - Mohegan Sun</title>

<jsp:include page="../../../script.jsp" />

</head>

<body>

<jsp:include page="../../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="..//includes/global_left.jsp">
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

<jsp:include page="../tco03Head.jsp" />

<!-- Tab bar links-->
<jsp:include page="../tco03Links.jsp" >
   <jsp:param name="selectedContest" value="both"/>
   <jsp:param name="selectedTab" value="onsite"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="../tco03Sublinks.jsp" >
   <jsp:param name="selectedList" value="onsite"/>
   <jsp:param name="selectedTab" value="casino"/>
</jsp:include>

            <h2>About Mohegan Sun</h2>

            <p><img src="/i/tournament/tco03/pic_about_entry.jpg" width="160" height="478" border="0" alt="" align="right" hspace="10">
            Created by the Mohegan Tribe of Connecticut in 1996, Mohegan Sun is a legendary gaming and entertainment destination.
            Renowned for exceptional service, hospitality and excitement, Mohegan Sun offers some of the region's finest dining, hotel
            accommodations, live entertainment and retail shopping. It also hosts the fabulous Kids Quest/Cyber Quest family
            entertainment facility, a luxurious day spa, convention event center and meeting facilities, and major sporting events such
            as Arena Football and Ultimate Fighting Championships. Featuring an extraordinary Mohegan-themed design unlike any other
            in the industry, Mohegan Sun is one of the most unique casinos in the world.</p>

            <p>On September 25th, 2000, Mohegan Sun evolved even further to become one of the world's most amazing destinations. It
            now hosts 300,000 square feet of gaming excitement, including games such as Baccarat, Blackjack, Craps, Caribbean Stud
            Poker, Keno, Pai Gow Poker, Roulette, Sic Bo, Spanish 21 and Wheel of Fortune. It also features over 29 delectable dining
            options, over 30 fine shops and boutiques, and some of the hottest concerts and live entertainment in the area. Mohegan Sun
            is also home to the WNBA's new Connecticut Sun. Unlike other casino properties, Mohegan Sun Casino features stunning
            architecture and design. The Casino of the Sky and Wombi Rock reside under the Sky Dome, the world's largest, most
            spectacular planetarium dome, decorating the casino with an ever-changing display of sparkling constellations. The amazing
            7-story waterfall located at The Shops at Mohegan Sun also adds to the breathtaking Mohegan Sun experience.</p>

            <p>Visit the Mohegan Sun <a href="http://www.mohegansun.com" target="_blank">web site.</a></p>

            <p><br/></p>

         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../../foot.jsp" />

</body>

</html>
