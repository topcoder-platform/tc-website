<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>

<jsp:include page="../script.jsp" />
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="press_room"/>
                <jsp:param name="level2" value=""/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">


            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                    <jsp:include page="../page_title.jsp" >
                        <jsp:param name="image" value="press_room"/>
                        <jsp:param name="title" value="Press Release"/>
                    </jsp:include>
                        <div align="center">
                        <p><span class="bodyTitle">TopCoder&#174; Announces Return of Cash Prizes to Weekly Online Programming Contests</span><br />
                        <span class="bodySubTitle"><em>$5,000 Purse at Stake During Select Matches as TopCoder Opens Sponsorship of Highly Popular Single Round Series</em></span></p>
                        </p>
                        </div>
                        
<p><strong>GLASTONBURY, CT, June 20, 2005&#151;</strong>TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced the return of prize purses to its popular weekly online Single Round Match (SRM) series on a select basis. Eligible TopCoder members can now compete for a share of  $5,000 across multiple divisions inside the renowned TopCoder Arena (<a href="/tc">http://www.topcoder.com/tc</a>). Previously, TopCoder sponsored SRMs awarded more than $860,000 in total prize money. The first group of prize SRMs in more than 2 years will take place on Tuesday June 21, Tuesday July 19 and Monday August 8th. Registration starts at 6:00 p.m. for a 9:00 p.m. match time (all times are Eastern U.S.) See the event schedule on TopCoder's web site for the dates and times of all upcoming SRMs.
<br><br>
"We're excited to be able to offer a return to prize money in our SRMs," said Rob Hughes, President and COO of TopCoder. "It provides another option for sponsors to reach our high caliber membership while giving weekly participants a chance to earn cash, gain recognition amongst the TopCoder community and learn about quality employment opportunities."
<br><br>
<span class="bodySubtitle">How to Register for SRMs</span><br>
Contestants can register for matches by visiting the TopCoder Developer Center  (<a href="/tc">http://www.topcoder.com/tc</a>) and downloading the competition arena as an applet or Java Web Start application. Plug-ins are also available for the competition arena. All TopCoder members in good standing, who are at least 13 years of age, may compete in SRM competitions, however contestants must be at least 18 years of age in order to be eligible for cash prizes. In addition to SRMs, TopCoder holds two advancement tournaments (the TopCoder Open and the TopCoder Collegiate Challenge) each year. Advancement tournaments are elimination tournaments and have substantial prize purses involved. 
<br><br>
<span class="bodySubtitle">About TopCoder, Inc.</span><br>
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit <a href="/">www.topcoder.com</a>.
<br><br>
TopCoder is a trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.
                        </p>
                        <p>###</p>
                        <p><br /></p>
                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
