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
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="press_room"/>
                <jsp:param name="level2" value=""/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
         <td width="100%" align="center">


            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                    <jsp:include page="../page_title.jsp" >
                        <jsp:param name="image" value="press_room"/>
                        <jsp:param name="title" value="&#160;"/>
                    </jsp:include>

            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr><td class="bodyText"><div align="right"><strong>Current News</strong>&#160;&#160;|&#160;&#160;<A href="/tc?module=Static&d1=pressroom&d2=pr_archive">Press Releases Archive</A>&#160;&#160;|&#160;&#160;<A href="/tc?module=Static&d1=pressroom&d2=art_archive">Articles Archive</A></div></td></tr>
            </table>
            
<%-- 2005 --%>
            <table width="100%" border="0" cellpadding="4" cellspacing="0">
                <tr><td class="statTextBig" bgcolor="#858B91"><font size="3">2005</font></td></tr>
            </table>
            
            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>

<%-- Forbes --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.forbes.com/home/work/2005/12/09/silicon-valley-hiring-cx_rr_1212hire.html" target="_blank"><img src="/i/pressroom/forbes_logo.gif" alt="Forbes" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.forbes.com/home/work/2005/12/09/silicon-valley-hiring-cx_rr_1212hire.html" target="_blank">Help Wanted In Silicon Valley</A> </strong></font><br />
                        For programmers, happy days are here again. But for their employers, fear is setting in.<br />
                        <span class="prHead"> [December 12]</span></p>                   
                        </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />
  

<%-- BusinessWeek --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.businessweek.com/magazine/content/05_50/b3963021.htm" target="_blank"><img src="/i/pressroom/businessweekCover120205.jpg" alt="BusinessWeek" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.businessweek.com/magazine/content/05_50/b3963021.htm" target="_blank">Rise Of A Powerhouse</A> </strong></font><br />
                        How the young knowledge workers of Central Europe are pushing the region to a new level.<br />
                        They came from around the world, young men with handles like SnapDragon and Bladerunner attacking computing problems so complex that even experienced coders could only stare at the screen in bewilderment. Only one mastered the final algorithm problem: Eryk Kopczynski, a.k.a. Eryx, a reticent Warsaw University student who wears his long hair in a ponytail and says his life's ambition is to "discover some interesting notion."<br />
                        <span class="prHead"> [December 2]</span></p>                   
                        </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />
  
<%-- USA Today --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/pdfs/press_room/usatoday_113005.pdf" target="_blank"><img src="/i/pressroom/usatoday_logo.gif" alt="USA Today" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/pdfs/press_room/usatoday_113005.pdf" target="_blank">TopCoder Survey in USA Today [PDF]</A> </strong></font><br />
A TopCoder survey on where members would prefer to work (given equal pay) is running as a Snapshot in today's Money section of USA Today (bottom left).<span class="prHead"> [November 30]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />
 
<%-- Google Code Jam China --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.infoworld.com/article/05/11/22/HNgooglecompetition_1.html" target="_blank"><img src="/i/pressroom/infoworld_logo.gif" alt="InfoWorld" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.infoworld.com/article/05/11/22/HNgooglecompetition_1.html" target="_blank">Google to hold programming competition in China</A> </strong></font><br />
Hoping to attract talented Chinese programmers to Google's (Profile, Products, Articles) planned research and development (R&D) center in Beijing, the company will host a programming competition, called the Google China Code Jam.<span class="prHead"> [November 22]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%--  DES/DEV $1 million --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_112105"><img src="/i/pressroom/milestone_million.gif" alt="Milestone: $1 Million" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_112105">TopCoder Payouts to Winners of Design and Development Competitions Surpass $1 Million</A></strong></font><br />
                        "The strength of TopCoder, simply put, is the TopCoder community - that's what makes us unique and successful," said Jack Hughes, Chairman and Founder of TopCoder, Inc.<span class="prHead"> [November 21]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- FTP ONLINE --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.ftponline.com/weblogger/forum.aspx?ID=13&DATE=11/01/2005&blog=#449" target="_blank"><img src="/i/pressroom/ftponline_logo.gif" alt="FTP Online" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.ftponline.com/weblogger/forum.aspx?ID=13&DATE=11/01/2005&blog=#449" target="_blank">Spirited Reusable Component Development</A> </strong></font><br />
The key to TopCoder's approach is the building of reusable components that can be adopted by customers to not only help these organizations save money on software development, but to employ a rigorous engineering methodology that lays out the metrics for the application project deliverables.<span class="prHead"> [November 1]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Info Week --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.informationweek.com/showArticle.jhtml?articleID=172901456" target="_blank"><img src="/i/pressroom/info_week_logo.gif" alt="Information Week" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.informationweek.com/showArticle.jhtml?articleID=172901456" target="_blank">Winning Design Ways</A> </strong></font><br />
Tim "Pops" Roberts is an independent IT consultant who makes a pretty good living doing contract project-management work. But it's his side job that gets his creative juices flowing: competing in software-design contests, in which the winning creations are used as building blocks for real business.<span class="prHead"> [October 31]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%--  TCO06 --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_102105"><img src="/i/pressroom/lasvegas_logo.gif" alt="Las Vegas" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_102105">TopCoder Selects Aladdin Resort in Las Vegas for TopCoder Open 2006</A></strong></font><br />
                        TopCoder today announced that the world famous Aladdin Resort and Casino in Las Vegas, Nevada will host its 2006 flagship event, the TopCoder Open, May 3rd through 5th, 2006.<span class="prHead"> [October 21]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%--  TCO05 Winners --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_101705"><img src="/i/pressroom/tco05_logo.gif" alt="TCO05" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_101705">Champions Announced In 2005 TopCoder&#174; Open Sponsored by Sun Microsystems</A></strong></font><br />
                        Eryk Kopczy&#241;ski of Poland, Nikolay Archak of the Russian Federation, and Qi Liu of China have won the Algorithm, Design and Development Component tournaments of the 2005 TopCoder Open sponsored by Sun, held at the Santa Clara Marriott in Santa Clara, CA on October 14th.<span class="prHead"> [October 17]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Mass High Tech --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.masshightech.com/displayarticledetail.asp?Art_ID=69982" target="_blank"><img src="/i/pressroom/mass_high_tech.gif" alt="Cary News" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.masshightech.com/displayarticledetail.asp?Art_ID=69982" target="_blank">Sorrowful state of software</A> </strong></font><br />
"I think it’s critical to improve the level of quality," [Jack Hughes] said. Hughes has immersed himself in the development world for more than 15 years.<span class="prHead"> [October 17 - MHT]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Cary News --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.carynews.com/enterprise/story/2805639p-9249369c.html" target="_blank"><img src="/i/pressroom/carynews_logo.gif" alt="Cary News" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.carynews.com/enterprise/story/2805639p-9249369c.html" target="_blank">Ready, again, for TopCoder battle</A> </strong></font><br />
"Now working with computers with a financial industry consulting firm, Roberts relocated to Cary two and half years ago. He has been a regular on the TopCoder site since its start at the beginning of the decade - for the fun, and for the money." <span class="prHead"> [September 28 - CN]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%--  TCO05 Alg Finalists --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_092805"><img src="/i/pressroom/tco05_logo.gif" alt="TCO05" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_092805">Onsite Finalists Announced In 2005 TopCoder Open Sponsored by Sun Microsystems</A></strong></font><br />
                        The 61 TopCoder onsite finalists represent 19 countries including China, Poland, the Russian Federation, South Africa, Japan, Australia and Argentina as well as the US.<span class="prHead"> [September 28]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- GCJ 05 winners --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.irishdev.com/NewsArticle.aspx?id=1046" target="_blank"><img src="/i/pressroom/irishdev_logo.gif" alt="Irish Dev" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.irishdev.com/NewsArticle.aspx?id=1046" target="_blank">Google announces Winner of 2005 Code Jam</A> </strong></font><br />
Google Inc. have announced Marek Cygan, a student at Warsaw University, as the grand prize winner of the 2005 Google Code Jam, Google's annual computer programming competition..."It's an honor to host the most talented computer programmers in the world," said Alan Eustace, vice president, Engineering and Research, Google Inc. "With more than twice as many participants in the Google Code Jam this year, competition was fierce. Congratulations to Marek and all of our finalists." <span class="prHead"> [September 26]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- DNDJ --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/pdfs/press_room/dndj_082005.pdf"><img src="/i/pressroom/dndj_logo.gif" alt="DNDJ" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/pdfs/press_room/dndj_082005.pdf">Engineering + Reuse = Savings</A> [PDF]</strong></font><br />
Why are contract outsourcing and offshore development failing to deliver the expected benefit of lower costs and increased end-user satisfaction to enterprise software development users? <span class="prHead"> [August - DNDJ]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- PCWK --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=art_091205"><img src="/i/pressroom/pcwk_logo.gif" alt="PCWK" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=art_091205">Poland Takes the Lead</A></strong> [Translation]</font><br />
Poland has just left the US behind and taken first place in TopCoder's country ranking. Warsaw University occupies the first place in university ranking (University of Wroclaw is 13th, Jagiellonian University is 14th). <span class="prHead"> [September 12 - PCWK - <A href="http://www.pcworld.pl/news/82941.html">original article</A>]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- ADT --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://timesofindia.indiatimes.com/articleshow/1212895.cms" target="_blank"><img src="/i/pressroom/adt_logo.gif" alt="ADT" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.adtmag.com/article.asp?id=11752" target="_blank">Components for SOAs and Other App Dev Projects</A></strong></font><br />
The result of the partnership between LogicLibrary and TopCoder reached earlier this year is that TopCoder’s components for Java and .NET are now stored in Logidex, LogicLibrary's collaborative SDA management solution. <span class="prHead"> [September 6 - ADT]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%--  TCO05 Component Finalists --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_090205"><img src="/i/pressroom/tco05_logo.gif" alt="TCO05" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_090205">TopCoder&#174; Announces First Software Developer Conference at 2005 TopCoder Open</A></strong></font><br />
                        Attendees will be invited to participate in an open forum with lead technologists from TopCoder, clients and TopCoder Open finalists discussing real world examples.<span class="prHead"> [September 2]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Times of India --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://timesofindia.indiatimes.com/articleshow/1212895.cms" target="_blank"><img src="/i/pressroom/toi_logo.gif" alt="Times of India" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://timesofindia.indiatimes.com/articleshow/1212895.cms" target="_blank">Wanna codejam? May the best techie win</A></strong></font><br />
It’s the grand slam of programming or, as the tourney organiser calls it, 'the X-games of software development'. It’s gruelling and needs speed, accuracy and skill. Sounds like a sports contest?<span class="prHead"> [August 28 - Times of India]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%--  TCO05 Component Finalists --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_082405"><img src="/i/pressroom/tco05_logo.gif" alt="TCO05" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_082405">TopCoder&#174; Announces 16 Finalists in Component Tournament of 2005 TopCoder Open</A></strong></font><br />
                        "We've seen a dramatic growth in the component division - more than twice the number of participants registered this year compared to last year and that really shows it's the hottest area of interest in TopCoder competitions," said Rob Hughes, President and COO of TopCoder.<span class="prHead"> [August 24]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- GCJ05 --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.google.com/intl/en/press/pressrel/codejam3.html"><img src="/i/pressroom/gcj05.gif" alt="GCJ 2005" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.google.com/intl/en/press/pressrel/codejam3.html">Registration Opens for Google Code Jam 2005</A></strong></font><br />
Google's annual online coding competition consisting of a series of problem-solving challenges that invite participants to select a programming language and use their programming skills to code solutions to the problems.<span class="prHead"> [July 25 - Google]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- CNN --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/pdfs/press_room/cnn_072105.pdf"><img src="/i/pressroom/cnn_logo.gif" alt="CNN" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/pdfs/press_room/cnn_072105.pdf">On your marks, get set, code!</A></strong></font><br />
TopCoder chief operating officer Rob Hughes told CNN that the competitions were growing in popularity among software engineers, as well as among technology companies who use them to scout for future employees.<span class="prHead"> [July 21 - CNN]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%--  TCO05 Yahoo --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_071105"><img src="/i/pressroom/yahoo_logo.gif" alt="yahoo" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_071105">TopCoder&#174; Announces Return of Premier Sponsor to 2005 TopCoder Open</A></strong></font><br />
                        "Yahoo! truly sees that we are at the dawn of a new era in recruiting in terms of world-class talent and world-wide distribution of that talent," said Rob Hughes, President and COO of TopCoder. "Yahoo!'s return as a longtime sponsor of TopCoder events shows the quality and reach of our member base."<span class="prHead"> [July 11]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%--  TCO05 Verisign --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_070705"><img src="/i/pressroom/verisign_logo.gif" alt="Verisign" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_070705">VeriSign Sponsors 2005 TopCoder Open</A></strong></font><br />
                        "With rapid advances in technology occurring everyday, companies are looking for the next generation of leaders to author the code that will provide the backbone for advanced applications."<span class="prHead"> [July 7]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%--  TCO05 Sun --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_062705"><img src="/i/pressroom/tco05_logo.gif" alt="TCO05" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_062705">TopCoder Announces Sun Microsystems as Title Sponsor for 2005 TopCoder Open</A></strong></font><br />
                        "Sun is excited that this year's TopCoder Open Component Competition will introduce a Java-centric theme," said Dan Roberts, Group Manager Development Tools Marketing at Sun Microsystems.<span class="prHead"> [June 27]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%--  SRM Prizes --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_062005"><img src="/i/pressroom/tc_srm_prizes.gif" alt="TC SRM Prizes" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_062005">TopCoder&#174; Announces Return of Cash Prizes to Weekly Online Programming Contests</A></strong></font><br />
                        $5,000 Purse at Stake During Select Matches as TopCoder Opens Sponsorship of Highly Popular Single Round Series.<span class="prHead"> [June 20]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Queen's University TJ --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.queensjournal.ca/articlephp/point-vol133/issue1/news/story1" target="_blank"><img src="/i/pressroom/qutj_logo.gif" alt="Queen's University TJ" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.queensjournal.ca/articlephp/point-vol133/issue1/news/story1" target="_blank">Computer programmer wins big</A></strong></font><br />
                     It's not often a student is awarded $13,000 U.S. for seven hours of work. Gary Linscott, ArtSci '05, took home the cash as the top prize winner in the 2005 TopCoder Collegiate Challenge. <span class="prHead"> [May 24 - QU The Journal]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%--  Caliper --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_060705"><img src="/i/pressroom/caliper_logo.gif" alt="Caliper" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_060705">Caliper Hires TopCoder Software&#153; to Enhance Organizational Development Platform & Services</A></strong></font><br />
                        Leading Personality Assessment Firm Employs TopCoder's Reusable Component-Based Methodology to Support IT Functions Across the Enterprise.<span class="prHead"> [June 7]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Roanoke --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.roanoke.com/business%5C24837.html" target="_blank"><img src="/i/pressroom/roanoke_logo.gif" alt="Roanoke.com" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.roanoke.com/business%5C24837.html" target="_blank">Geeks for Charity holds code to help New River charities</A></strong></font><br />
                     If Brett Malone's plan works, some New River Valley organizations could benefit from a different kind of technology boom. <span class="prHead"> [June 4 - Roanoke.com]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Sourcing Mag --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.sourcingmag.com/home/home.aspx?i=18_6/3/2005_cn_507_2_00_00" target="_blank"><img src="/i/pressroom/sourcingmag_logo.gif" alt="Sourcing Mag" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.sourcingmag.com/home/home.aspx?i=18_6/3/2005_cn_507_2_00_00" target="_blank">How To Hire Best-of-Breed Programmers for Your Project</A></strong></font><br />
                     TopCoder Software literally calls on the services of thousands of programmers all around the world for its development work -- and only the best results end up getting used in the code they provide to their clients. They believe their approach saves clients money and time. How do they pull it off? <span class="prHead"> [June 2 - Sourcing Mag]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Boiler Station --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.boilerstation.com/planet/stories/200505160purdue_planet1116219600.shtml" target="_blank"><img src="/i/pressroom/boilerstation_logo.gif" alt="Boiler Station" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.boilerstation.com/planet/stories/200505160purdue_planet1116219600.shtml" target="_blank">Purdue computer programmer making his mark in competitions</A></strong></font><br />
                     Tomasz Czajka, 23-year-old Purdue doctoral candidate, has already improved software for Microsoft and performed research for IBM. This summer he's headed to California to intern with a smaller company named Google. <span class="prHead"> [May 16 - Boiler Station]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- TWST --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=art_051205"><img src="/i/pressroom/twst_logo.gif" alt="The Wall Street Transcript" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=art_051205">Interview with Jack Hughes</A></strong></font><br />
                     The following is an interview The Wall Street Transcript had with Jack Hughes.<span class="prHead"> [April 22 - The Wall Street Transcript]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%--  Javaone --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&t=news_events&c=pr_05_02_05"><img src="/i/pressroom/javaone_event.gif" alt="javaone" width="135" height="40" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=pr_05_02_05">TopCoder&#174;-Powered Coding Challenge to Feature at Sun's 2005 JavaOne<sup>SM</sup> Conference</A></strong></font><br />
                        TopCoder today announced that they are again teaming up with Sun Microsystems, Inc. (Nasdaq: SUNW) to host the JavaOne Coding Challenge at the tenth annual 2005 JavaOne conference, scheduled for June 27 - 30th at Moscone Center in San Francisco.<span class="prHead"> [May 2]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- CHE --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/?&t=news_events&c=art_04_08_05"><img src="/i/pressroom/che_logo.gif" alt="Chronicle of Higher Education" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=art_04_08_05">Code Warriors</A></strong></font><br />
                     Young computer programmers battle for fame, money, and the love of algorithms<span class="prHead"> [April 8 - Chronicle of Higher Education]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- BusinessWeek --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/?&t=news_events&c=art_04_22_05"><img src="/i/pressroom/businessweek_logo.gif" alt="BusinessWeek" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=art_04_22_05">How Google Searches - For Talent</A></strong></font><br />
                     "It's a dog-eat-dog world," says Robert Hughes, president of TopCoder Inc., the Glastonbury (Conn.) testing company that runs the Code Jams. "Wherever the best talent is, Google wants them."<span class="prHead">[April 22 - BusinessWeek]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- SDT --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/i/pressroom/SDT_041305.jpg" target="_blank"><img src="/i/pressroom/sd_times_logo.gif" alt="SDT" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/i/pressroom/SDT_041305.jpg" target="_blank">LogicLibrary, TopCoder Business Brief</A></strong></font><br />
                     Through a joint agreement, LogicLibrary will make TopCoder Software's component catalog available to the users of the Logidex asset management system.<span class="prHead">[April 13 - SDT]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- .NET Developer's Journal --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.sys-con.com/story/?storyid=49134" target="_blank"><img src="/i/pressroom/dndj_logo.gif" alt=".NET Developer's Journal" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.sys-con.com/story/?storyid=49134" target="_blank">LogicLibrary Checks Out TopCoder to Enable SOA</A></strong></font><br />
                     This strategic partnership is intended to bolster the collection of "out-of-the box" content preinstalled with Logidex. <span class="prHead">[April 9 - .NET Developer's Journal]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Barrhaven --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/i/pressroom/040105.pdf" target="_blank"><img src="/i/pressroom/barrhaven_logo.gif" alt="Barrhaven Independent" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/i/pressroom/040105.pdf" target="_blank">University computer whiz wins big at tech tourney</A></strong></font><br />
                     A nice piece on the TCCC05 Component Development Competition Champion, Gary Linscott, aka gladius.<span class="prHead">[April 1 - Barrhaven Independent]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Computer User Article --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.computeruser.com/articles/2404,1,1,1,0401,05.html" target="_blank"><img src="/i/pressroom/comp_user_logo.gif" alt="Computer User" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.computeruser.com/articles/2404,1,1,1,0401,05.html" target="_blank">Do you have what it takes?</A></strong></font><br />
                  CIOs and other H.R. decision-makers have some specific ideas about what they want from IT job applicants. Setting yourself apart from the pack has never been more crucial, but how does one go about doing that?<span class="prHead">[April - ComputerUser]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- TCCC05 --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/?&t=news_events&c=pr_03_14_05a"><img src="/i/pressroom/tccc05_logo.gif" alt="TCCC05" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=pr_03_14_05a">Champions Announced In 2005 TCCC Sponsored by Yahoo!&#174;</A></strong></font><br />
                        TopCoder today announced that Mathijs Vogelzang of the University of Groningen, The Netherlands, Adrian Nicolae Carcu of  the Babes-Bolyai Computer Science University, Romania, and Gary Linscott of Queens University, Canada have won the Algorithm, Design and Development Component tournaments of the 2005 TopCoder Collegiate Challenge sponsored by Yahoo!<span class="prHead"> [March 14]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Logic Library --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/?&t=news_events&c=pr_03_14_05b"><img src="/i/pressroom/logiclib_logo.gif" alt="Logic Library" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=pr_03_14_05b">LogicLibrary Teams with TopCoder to Accelerate SOA Deployments</A></strong></font><br />
                        "As developers turn to SOA, reusable components are becoming the building blocks of applications because of their ability to reduce costs, streamline projects and improve productivity."<span class="prHead"> [March 14]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- NW Polska --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/?&t=news_events&c=art_02_13_05"><img src="/i/pressroom/nw_polska_logo.gif" alt="NewsWeek Poland" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=art_02_13_05">Program for life</A></strong></font><br />
                        They get their Ph.D.'s at the age of twenty. At thirty they become professors in America. Warsaw University graduates are some of the best computer scientists in the world.<span class="prHead"> [February 13 - NewsWeek Poland]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- TCCC05 --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/?&t=news_events&c=pr_02_22_05"><img src="/i/pressroom/tccc05_logo.gif" alt="TCCC05" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=pr_02_22_05">Semifinalists Announced for 2005 TCCC Sponsored by Yahoo!&#174;</A></strong></font><br />
                        TopCoder today announced the 31 International onsite semifinalists who have advanced to the Championship rounds of the 2005 TopCoder Collegiate Challenge sponsored by Yahoo!<span class="prHead"> [February 22]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- NVIDIA TCCC--%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&t=news_events&c=pr_02_16_05"><img src="/i/pressroom/nvidia_badge.gif" alt="nvidia" width="135" height="117" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=pr_02_16_05">NVIDIA Corporation Returns as Premier Sponsor of 2005 TopCoder&#174; Collegiate Challenge</A></strong></font><br />
                        TopCoder announced NVIDIA Corporation (Nasdaq: NVDA), a worldwide leader in graphics and digital media processors, as Premier sponsor of its 2005 TopCoder Collegiate Challenge (TCCC 05).<span class="prHead"> [February 16]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Devloper Subscriptions --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&t=news_events&c=pr_02_15_05"><img src="/i/pressroom/tcs_logo.gif" alt="TCS" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=pr_02_15_05">TopCoder Software&#153; Opens Access to Reusable Java&#153; and .NET&#153; Component Catalogs</A></strong></font><br />
                        TopCoder Software today announced TopCoder Software is providing individual member developers free subscriptions to its full catalog of software components.<span class="prHead"> [February 15]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- GICJ05 --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&t=news_events&c=pr_02_09_05"><img src="/i/pressroom/gicj05_logo.gif" alt="" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=pr_02_09_05">Google Code Jam Comes to India</A></strong></font><br />
                        The Google India Code Jam is an extension of Google's annual Code Jam competition and celebrates the art of computer science, demonstrating to software professionals everywhere the value Google places on excellent coding. <span class="prHead"> [February 9]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- 50,000 --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&t=news_events&c=pr_02_07_05"><img src="/i/pressroom/50k_promo.gif" alt="" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=pr_02_07_05">TC Community Surpasses 50,000 Worldwide Nears 10,000 Rated Member Mark</A></strong></font><br />
                        In less than four years since the organization's inception, TopCoder programming tournaments have awarded more than $2 million in prize money to some of the best collegiate and professional programmers from 187 countries around the globe. <span class="prHead"> [February 7]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Wired Article --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.wired.com/news/medtech/0,1286,66458,00.html?tw=wn_tophead_1" target="_blank"><img src="/i/pressroom/wired_logo.gif" alt="Wired" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.wired.com/news/medtech/0,1286,66458,00.html?tw=wn_tophead_1" target="_blank">Software Taming Gene Data Pool</A></strong></font><br />
                  Software engineers are finally getting together with biologists to translate the pile of letters and numbers into scientific discoveries. <span class="prHead">[February 2 - Wired]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- ADT --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/?&t=news_events&c=art_02_01_05"><img src="/i/pressroom/adt_logo.gif" alt="ADT" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=art_02_01_05">DE-CODER: The kings of coding</A></strong></font><br />
                        "Tomek" and "Pops" may be unfamiliar names to you, but in the world of coding competitions, they're as big as rock stars.  Now they're at the top of the stack, according to their peers who participate in online programming contests at TopCoder.com, a mecca for those willing to publicly test their programming chops.<span class="prHead"> [February 1 - ADT]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- CRPF --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&t=news_events&c=pr_01_25_05"><img src="/i/pressroom/crpf_logo.gif" alt="" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=pr_01_25_05">TCS Delivers for International Consortium of Spinal Cord Injury Researchers</A></strong></font><br />
                        TopCoder today announced it has successfully deployed a high-quality, web-based application to disseminate critical microarray data between the Christopher Reeve Paralysis Foundation's (CRPF) Research Consortium on Spinal Cord Injury and the general scientific community. <span class="prHead"> [January 25]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- TCCC05 MOTOROLA --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/?&t=news_events&c=pr_01_18_05"><img src="/i/pressroom/motorola_logo.gif" alt="Motorola" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=pr_01_18_05">TopCoder&#174; Announces Motorola as Premier Sponsor of 2005 TopCoder Collegiate Challenge</A></strong></font><br />
                        TopCoder today announced Motorola, Inc., (NYSE: MOT), a global leader in wireless, broadband and automotive communications technologies, as a premier sponsor for its 2005 TopCoder Collegiate Challenge (TCCC 05).  <span class="prHead">[January 18]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- ComputerWorld Article --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.computerworld.com/industrytopics/financial/story/0,10801,98834,00.html" target="_blank"><img src="/i/pressroom/compworld_logo.gif" alt="ComputerWorld" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.computerworld.com/industrytopics/financial/story/0,10801,98834,00.html" target="_blank">Code Reuse Pays Off for ING </A></strong></font><br />
                  ING Americas last month finished work on a quality-management application built using an innovative development process that the company estimated saved it $300,000 and 1,200 man-hours. <span class="prHead">[January 10 - ComputerWorld]</span></p>
                    </td>
                </tr>
            </table>

            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>
            
<%-- 2004 --%>
            <table width="100%" border="0" cellpadding="4" cellspacing="0">
                <tr><td class="statTextBig" bgcolor="#858B91"><font size="3">2004</font></td></tr>
            </table>
            
            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>
            
<%-- TCCC05 YAHOO --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/?&t=news_events&c=pr_12_20_04"><img src="/i/pressroom/tccc05_logo.gif" alt="TCCC05" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=pr_12_20_04">TopCoder&#174; Announces Yahoo! as Title Sponsor for 2005 TCCC</A></strong></font><br />
                        TopCoder today announced Yahoo! Inc. as the title sponsor of the 2005 TopCoder Collegiate Challenge (TCCC).  The 2005 TCCC will bring many of the world's finest student programmers together in competition for international ranking, notoriety and a share of the $150,000 prize purse.  <span class="prHead">[December 20]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- SCMP --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/?&t=news_events&c=art_12_03_04"><img src="/i/pressroom/scmp_logo.gif" alt="AP" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=art_12_03_04">Top coders seek bigger prize than cash</A></strong></font><br />
                  At the semi-annual event, held earlier this month in California, four mainland programmers competed in a field of just 24, having beaten out more than 1,500 in preliminary events. To hear them tell it, they came for the networking opportunities as much as for the prize money.<span class="prHead"> [December 3 - SCMP]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- TCO 04 Finalists --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/?&t=news_events&c=pr_11_15_04"><img src="/i/pressroom/tco04_logo.gif" alt="TCO04" width="135" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=pr_11_15_04">Champions Announced In 2004 TopCoder&#174; Open Sponsored by Microsoft&#174;</A></strong></font><br />
                  TopCoder announced that Tomasz Czajka of Stalowej, Poland, Adrian Nicolae Carcu of Bistrita, Romania, and Jin GuanZhou of HangZhou City, China have won the Algorithm, Design and Development Competitions of the 2004 TopCoder Open, sponsored by Microsoft.  <span class="prHead">[November 15]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- CNN GCJ04 --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/i/pressroom/cnn_110404.pdf"><img src="/i/pressroom/cnn_logo.gif" alt="CNN" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/i/pressroom/cnn_110404.pdf">Brain teasers help Google recruit workers</A></strong></font><br />
                  As its rapidly growing business creates hundreds of new jobs, Google is trying to lure premier talent with offbeat tactics, including a computer-coding competition and a brain-twisting aptitude test that mixes geek humor with a daunting mathematical workout.<span class="prHead"> [November 4 - CNN]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- TCO 04 Finalists --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/?&t=news_events&c=pr_11_01_04"><img src="/i/pressroom/tco04_logo.gif" alt="TCO04" width="135" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=pr_11_01_04">TopCoder&#174; Announces Finalists for 2004 TopCoder Open Sponsored by Microsoft&#174;</A></strong></font><br />
                  The semifinalists endured numerous online elimination rounds to earn a trip to the prestigious onsite finals, and will now compete head-to-head over two days of intense competition to determine the winners who will share the $150,000 prize purse.  <span class="prHead">[November 1]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Associated Press Article --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/?&t=news_events&c=art_10_25_04"><img src="/i/pressroom/ap_logo.gif" alt="AP" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=art_10_25_04">Google's creative search for elite programmers</A></strong></font><br />
                  Google Inc. finds almost anything on the Internet within seconds, but finding the sharp-minded computer engineers who program the company's lightning-quick search engine takes more time -- and a quirky bit of ingenuity.<span class="prHead"> [October 25 - Associated Press]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- GCJ04 Article --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/?&t=news_events&c=art_10_19_04"><img src="/i/pressroom/sj_mercury_logo.gif" alt="GCJ04" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=art_10_19_04">Google holds coding contest</A></strong></font><br />
                  Some people like to play tennis or golf to blow off steam after a hard day. Bolek Szewcyzk likes to pound out line after line after line of code on his computer, solving complex problems or just exulting in the art of creation.<span class="prHead">[October 19 - SJ Mercury]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Tendances Tomek Article --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/i/pressroom/tendances_tomek.pdf"><img src="/i/pressroom/tendances_logo.gif" alt="Tendances" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/i/pressroom/tendances_tomek.pdf">Dream Job and Juicy Premiums for Young, Crackshot Programmers</A></strong> [Translation]</font><br />
                  <span class="prHead">[October]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- GCJ04 Article --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/?&t=news_events&c=pr_10_05_04"><img src="/i/pressroom/gcj_logo.gif" alt="GCJ04" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=pr_10_05_04">Google announces 50 Google Code Jam Finalists</A></strong></font><br />
                  Google Inc. today announced the 50 finalists in the second annual Google Code Jam, Google's online coding competition consisting of a series of problem-solving challenges that invite participants to select a programming language and use their programming skills to code solutions to the problems. <span class="prHead">[October 5]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Newsforge Article --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.newsforge.com/article.pl?sid=04/09/30/187225" target="_blank"><img src="/i/pressroom/newsforge_logo.gif" alt="Newsforge" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.newsforge.com/article.pl?sid=04/09/30/187225" target="_blank">Coders win, winners code</A></strong></font><br />
                  TopCoder announced on September 29 the completion of the final elimination round in the Algorithm Competition portion of its 2004 annual TopCoder Open coding contest. But the real winner may be TopCoder's open source development model, which gives programmers a chance to build enterprise applications for cash prizes. <span class="prHead">[October 5]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- SoftDevMag --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&t=news_events&c=art_10_03_04"><img src="/i/pressroom/softdevmag_logo.gif" alt="" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=art_10_03_04">Triple Threat</A></strong></font><br />
                        TopCoder is itself a triple threat: It ranks programmers through competitions, has a catalog of commercial software components built by its members, and offers services using a patented process of distributing specifications in the form of problems up for bid. <span class="prHead"> [October]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Brainerd Article --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.brainerddispatch.com/stories/100204/bus_1002040018.shtml" target="_blank"><img src="/i/pressroom/brainerd_logo.gif" alt="Newsforge" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.brainerddispatch.com/stories/100204/bus_1002040018.shtml" target="_blank">Hometown hero</A></strong></font><br />
                  Jimb Esser left Minnesota for San Jose, Calif., after being sought by Cryptic Studios, makers of the City of Heroes online game. Cryptic Studios sought Esser after finding him -- where else but online -- through the TopCoder Web site and a programming tournament. <span class="prHead">[October 2]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- CRPF --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&t=news_events&c=pr_09_27_04"><img src="/i/pressroom/crpf_logo.gif" alt="" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=pr_09_27_04">TopCoder Developing Application for CRPF Spinal Cord Injury Research Group</A></strong></font><br />
                        TopCoder today announced it has begun developing a  high-quality, web-based application to disseminate critical microarray data between the Christopher Reeve Paralysis Foundation's (CRPF) Research Consortium on Spinal Cord Injury and the general scientific community. <span class="prHead"> [September 27]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- CIO Article --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://searchcio.techtarget.com/originalContent/0,289142,sid19_gci1006375,00.html" target="_blank"><img src="/i/pressroom/searchcio_logo.gif" alt="CIO" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://searchcio.techtarget.com/originalContent/0,289142,sid19_gci1006375,00.html" target="_blank">Outsourcing trend touches independents, too</A></strong></font><br />
                        During 14 years of contract work, Roberts [Pops] managed to secure long-term agreements with major corporations to provide IT services ranging from project management to development. One contract spread over seven years. Another project lasted six years. But those kinds of gigs are scarce nowadays. <span class="prHead">[September 15]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Morris --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&t=news_events&c=pr_09_07_04"><img src="/i/pressroom/sdbp_logo.gif" alt="" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=pr_09_07_04">TopCoder Software Industry Expert Michael Morris to Speak at 2004 SD Best Practices Conference</A></strong></font><br />
                        Michael Morris, vice president of software development, will be speaking at the Software Development Best Practices Conference and Expo at the Hynes Convention Center in Boston, MA September 20-23rd. Produced by CMP Media's SD Events group, the SD Best Practices Conference and Expo gives software management professionals an expansive range of topics that focus on boosting efficiency, streamlining infrastructure and producing successful project outcomes to enhance the quality of software production.<span class="prHead"> [September 7]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Yahoo! TCO--%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&t=news_events&c=pr_09_02_04"><img src="/i/pressroom/yahoo_logo.gif" alt="yahoo" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=pr_09_02_04">Yahoo! Signs On as Premier Sponsor of 2004 TopCoder Open</A></strong></font><br />
                        "As a sponsor of the TopCoder Collegiate Challenge, Yahoo! had the opportunity to recruit several truly talented individuals. We are excited to continue our relationship with TopCoder and are looking forward to meeting with the top talent competing in the TopCoder Open," said Libby Sartain, Senior Vice President, Human Resources and Chief People Yahoo. <span class="prHead">[September 1]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%--  Intel Sponsor TCO04 --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&t=news_events&c=pr_08_18_04"><img src="/i/pressroom/intel.gif" alt="" width="135" height="35" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=pr_08_18_04">Intel Corporation Sponsors 2004 TopCoder Open Tournament</A></strong></font><br />
                          "We are pleased to participate as a sponsor of the 2004 TopCoder Open, which is recognized as one of the pre-eminent events of its kind in the world," said Melissa Laird, general manager, Solutions Enabling Division, Intel Corporation. "We look forward to an exciting tournament and the interaction with an exceptional field of contestants."<span class="prHead"> [August 18]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%--  RedHerring --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&t=news_events&c=art_08_10_04"><img src="/i/pressroom/redherring_logo.gif" alt="" width="135" height="21" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=art_08_10_04">Better than You: King of code</A></strong></font><br />
                         Known in his competitive coding circles by first name only, Tomek Czajka is one of the world's best programmers. He's earned over $75,000 in algorithm-writing contests over the last few years on TopCoder, the Top Gun of programming competition sites. In addition to fortune and fame in the developer community, TopCoder winners are often recruited by event sponsors like Microsoft, Yahoo, and Google.<span class="prHead"> [August 10 - Red Herring]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- TCS --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&t=news_events&c=pr_08_10_04"><img src="/i/pressroom/tcs_logo.gif" alt="nvidia" width="135" height="30" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=pr_08_10_04">TopCoder Software Wins New Customer Contracts</A></strong></font><br />
                        TopCoder, Inc. today announced that TopCoder Software has won new accounts including Thomson Prometric and Burlington Coat Factory. The latest projects will utilize TopCoder Software's competitive application development model which harnesses the talent of software developers from around the world to design, develop and deploy software. <span class="prHead">[August 10]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- NVIDIA TCO--%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&t=news_events&c=pr_08_04_04"><img src="/i/pressroom/nvidia_badge.gif" alt="nvidia" width="135" height="117" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=pr_08_04_04">NVIDIA Named Premier Level Sponsor of 2004 TopCoder Open Tournament</A></strong></font><br />
                        "We are thrilled to be a part of this exciting coding competition for the 3rd consecutive year," said Daniel Rohrer, Manager of DirectX Graphics. "The characteristics that allow TopCoder competitors to be successful closely mirror qualities we look for in our engineers at NVIDIA" <span class="prHead">[August 4]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%--  TCO04 --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&t=news_events&c=pr_07_28_04"><img src="/i/pressroom/tco04_logo.gif" alt="TCO04" width="135" height="85" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=pr_07_28_04">TopCoder Announces Microsoft as Title Sponsor for 2004 TCO</A></strong></font><br />
                        The 2004 TopCoder Open will bring the world's finest professional and collegiate programmers together in competition for international ranking, celebrity and a share of the $150,000 prize purse for Algorithm, Component Design and Development categories. The Onsite Finals will take place November 11th and 12th at the Santa Clara Marriott in Santa Clara, CA.<span class="prHead"> [July 28]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- DevX Article --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://www.devx.com/Java/Article/21602" target="_blank"><img src="/i/pressroom/devx_logo.gif" alt="DevX" width="135" height="92" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.devx.com/Java/Article/21602" target="_blank">The Smart Choice for Smart Clients: J2EE or .NET?</A></strong></font><br />
                        In a world of distributed computing, the demand for smart-client applications is growing quickly. IT managers realize they must keep users happy-the user's experience will make or break any application-while leveraging their existing service-oriented architectures (SOAs). The problem is that most development teams either do not know where to begin or they are unprepared for the challenges that come with smart-client implementation. <span class="prHead">[July 27]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%--  Computer World--%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://www.computerworld.com/managementtopics/outsourcing/story/0,10801,94452,00.html" target="_blank"><img src="/i/pressroom/compworld_logo.gif" alt="ComputerWorld" width="135" height="25" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.computerworld.com/managementtopics/outsourcing/story/0,10801,94452,00.html" target="_blank">BearingPoint Move Raises China's Profile</A></strong></font><br />
                        Wu Jiazhi is a China-based programmer who works for TopCoder Inc., a Glastonbury, Conn.-based firm that conducts online competitions for recruiting programming talent for outsourcing projects. Wu said he believes China's workers have the technical skills that will enable the country to rival or exceed India within several years.<span class="prHead"> [July 12]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%--  Builder.com Javaone --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://builder.com.com/5100-6370_14-5260946.html" target="_blank"><img src="/i/pressroom/builder_logo.gif" alt="javaone" width="135" height="40" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://builder.com.com/5100-6370_14-5260946.html" target="_blank">CNET engineer wins JavaOne Coding Challenge</A></strong></font><br />
                        We always thought we worked with a bunch of smart people here at CNET, but now we have actual proof. Matthew McEachen, a senior software engineer based in our San Francisco office, won the Coding Challenge at the recent JavaOne conference. We got a few minutes from him recently to answer some questions about his accomplishment.<span class="prHead"> [July 9]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%--  Javaone --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://java.sun.com/javaone/top_coder.html" target="_blank"><img src="/i/pressroom/javaone_event.gif" alt="javaone" width="135" height="40" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://java.sun.com/javaone/top_coder.html" target="_blank">JavaOne Coding Challenge: Meet the Best</A></strong></font><br />
                        The JavaOne Coding Competition is finished, which means three Grand Prize winners and a host of Runners Up have been crowned as this year's top coders. This year, the number of competitors rose to almost double that of last year. There were 188 competitors on day two of the three-day competition.<span class="prHead"> [July 1]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Mass High Tech article --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://www.masshightech.com/displayarticledetail.asp?art_id=65934" target="_blank"><img src="/i/pressroom/mass_high_tech.gif" alt="cio" width="135" height="60" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.masshightech.com/displayarticledetail.asp?art_id=65934" target="_blank">Focus on software talent</A></strong></font><br />
                       CaA confluence of events has set the stage for an interesting scenario over the next several quarters. Companies have pared down staff over the past few years, schools and universities are producing fewer computer science graduates, and offshore outsourcing is meeting with mixed results. Companies are searching for better, cheaper alternatives to software development, fearing a return to 1999, when they paid through the nose for developers to work on projects, most of which failed to see the light of day. <span class="prHead">[July]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Fast Company --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/i/pressroom/FastCompany0704.pdf" target="_blank"><img src="/i/pressroom/fastcompany_logo.gif" alt="fcLogo" width="135" height="33" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/i/pressroom/FastCompany0704.pdf" target="_blank">"There are good people everywhere"</A></strong></font><br />
                       Tomasz Czajka, a 23-year-old Polish university student, has won two big computer-programming contests in a row - and he's ranked first among TopCoder's 38,000 coders.  Is he the world's best geek?<span class="prHead">[June 21]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%--  Javaone --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://java.sun.com/developer/technicalArticles/Programming/TopCoder2004/" target="_blank"><img src="/i/pressroom/javaone_event.gif" alt="javaone" width="135" height="40" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://java.sun.com/developer/technicalArticles/Programming/TopCoder2004/" target="_blank">Who's the Best Coder?</A></strong></font><br />
                        Three days of qualification rounds. Brilliant competitors. Thousands of spectators. Big prizes. Bragging rights. Now check yourself. Any increase in your pulse rate might be the first sign you're a potential competitor. Sweaty palms are a sure sign. If neither happened, but your pulse rate dropped and a shark fin popped out of your back, your seat is waiting.<span class="prHead"> [June]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%--  Workforce --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&t=news_events&c=art_06_01_04"><img src="/i/pressroom/workforce.gif" alt="" width="135" height="45" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=art_06_01_04">Cracking the Hiring Code</A></strong></font><br />
                         Companies are shelling out anywhere from $35,000 to $150,000 to participate in contests such as those that challenge programmers to write code. For companies, the payoff is twofold: the ability to see the skills of employees that a traditional interview will never deliver, and a chance to spread their brand name.<span class="prHead"> [June 1]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- WSJO --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://online.wsj.com/article_email/0,,SB108605863196125506-IVjeoNllaV3nJunZXSGcaaBm4,00.html" target="_blank"><img src="/i/pressroom/wsjo.gif" alt="wsjo" width="135" height="50" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://online.wsj.com/article_email/0,,SB108605863196125506-IVjeoNllaV3nJunZXSGcaaBm4,00.html" target="_blank">Win in a Corporate Competition, Land on Square That Offers a Job</A></strong></font><br />
                         More companies are using competitions to discover candidates with standout skills and talent. Fields such as architecture and fashion design have long held competitions to allow students to showcase their work. But others, including technology companies and advertisers, also are interested in seeing how people perform against their peers.<span class="prHead"> [June 1]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- UPI --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://www.upi.com/view.cfm?StoryID=20040525-104135-2776r" target="_blank"><img src="/i/pressroom/upi_logo.gif" alt="UPI" width="135" height="100" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.upi.com/view.cfm?StoryID=20040525-104135-2776r" target="_blank">The Web: Search engine wars flare online</A></strong></font><br />
                         Search engine developers, such as Yahoo!, Google and Microsoft, are aggressively seeking new strategies -- and technologies -- that will give them even a slight edge in the struggle for dominance in what is becoming the Internet's most glamorous niche, experts told United Press International.<span class="prHead"> [May 26]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%--  USDC --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&t=news_events&c=pr_05_12_04"><img src="/i/pressroom/usdc_logo.gif" alt="USDC" width="135" height="50" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=pr_05_12_04">TopCoder Announces the Ultimate Software Development Contest</A></strong></font><br />
                        The online competition will give eligible TopCoder members chances to win cash prizes totaling $50,000 during a series of weekly, monthly and quarterly contests, as well as match skills with other members around the globe using TopCoder's unique Competitive Development Methodology.<span class="prHead"> [May 12]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%--  Javaone --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&t=news_events&c=pr_05_03_04"><img src="/i/pressroom/javaone_event.gif" alt="javaone" width="135" height="40" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=pr_05_03_04">JavaOne Coding Challenge Powered by TopCoder</A></strong></font><br />
                        "The TopCoder-powered Coding Challenge was one of the highest rated programs by our attendees last year," said Mike Bellisimo, Senior Director of Sun Developer Outreach. "It's an exciting and fun event that creates a buzz among our community and adds a new dimension of interaction and participation to the JavaOne Conference experience."<span class="prHead"> [May 3]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- BWO --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href=" /?&t=news_events&c=art_04_29_04"><img src="/i/pressroom/bwo_logo.gif" alt="bwo_logo" width="135" height="25" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href=" /?&t=news_events&c=art_04_29_04">And The Champion Coders Are...</A></strong></font><br />
                         In software, no country is hotter than India. But at the Apr. 16 TopCoder Collegiate Challenge, software's world championship in Boston, the programming powerhouse was all but invisible. A 22-year-old Pole, Tomasz Czajka, won the $25,000 prize for the second year in a row, edging out rivals from the U.S., Canada, and Australia.<span class="prHead"> [April 29]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Po  --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://biz.yahoo.com/prnews/040422/dcth080_1.html" target="_blank"><img src="/i/pressroom/po.jpg" alt="Po" width="135" height="136" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://biz.yahoo.com/prnews/040422/dcth080_1.html" target="_blank">ASA Honors Po-Shen Loh</A></strong></font><br />
                        Po-Shen Loh, son of ASA member Wei-Yin Loh and Theresa Loh is the recipient of multiple honors that will enable him to pursue his graduate study and research. A student a California Institute of Technology, Po-Shen grew up in Madison, Wisconsin, where his parents still reside. This academic year, Loh has been offered the National Science Foundation (NSF) award, a Churchill Scholarship, a Hertz fellowship, and a National Defense Science and Engineering Graduate Fellowship.<span class="prHead"> [April 22]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />
 
<%-- JavaOne  --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://www.tmcnet.com/usubmit/2004/Apr/1033792.htm" target="_blank"><img src="/i/pressroom/tmcnet.gif" alt="TMCNET" width="135" height="60" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.tmcnet.com/usubmit/2004/Apr/1033792.htm" target="_blank">Java Technology Spreads Like Wildfire at JavaOne</A></strong></font><br />
                        One of the highest-rated Attendee events in 2003, the JavaOne Coding Challenge is back this year. Sun has teamed up with TopCoder, Inc. to bring Java technology programmers together for coding, competition, and fun.<span class="prHead"> [April 21]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />
 
<%-- TCO Announcement --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&t=news_events&c=pr_04_19b_04"><img src="/i/pressroom/tccc04_winners.jpg" alt="TCCC04" width="135" height="100" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=pr_04_19b_04">Champions Announced In 2004 TCCC Sponsored by Yahoo!&#174;</A></strong></font><br />
                        TopCoder announced today that Tomasz Czajka of Warsaw, Poland, Pavlo Aksonov of the Ukraine and Roman Koshlyak, also of the Ukraine, have won the Coding, Design and Development Component tournaments of the 2004 TopCoder Collegiate Challenge sponsored by Yahoo!<span class="prHead"> [April 19]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%--  Stage Stores Announcement --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&t=news_events&c=pr_04_19_04"><img src="/i/pressroom/stagestores.gif" alt="stagestores" width="135" height="30" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=pr_04_19_04">Custom Web Application Enables Online Gift Card Service</A></strong></font><br />
                         Stage Stores has implemented a high quality enterprise solution to reduce the inconvenience and cost of customers having to call an 800 number to purchase gift cards. The customized web solution is compatible across Apache Web Server, Tomcat Servlet Engine and Oracle RDBMS platforms and was designed and developed by TopCoder Software using the company's unique development methodology and catalog of more than 150 reusable components.<span class="prHead"> [April 19]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- BWO Google article --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href=" http://www.businessweek.com/technology/content/apr2004/tc20040413_3592_tc146.htm" target="_blank"><img src="/i/pressroom/bwo_logo.gif" alt="bwo_logo" width="135" height="25" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href=" http://www.businessweek.com/technology/content/apr2004/tc20040413_3592_tc146.htm" target="_blank">Hiring Techies Is as Tricky as Ever</A></strong></font><br />
                         TopCoder rounded up about 100 programmers to participate in this software smackdown, some 10 of whom made it to the final round. DoubleClick Chief Information Officer Mok Choe says the company has already hired a few of the winners. "We can filter out the cream of the crop," says Choe. <span class="prHead">[April 13]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Yahoo TCCC Announcement --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&t=news_events&c=pr_04_06_04"><img src="/i/pressroom/tccc_yahoo.gif" alt="TCCC - Yahoo" width="135" height="100" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=pr_04_06_04">TopCoder&#174; Announces 32 Semifinalists for 2004 TCCC</A></strong></font><br />
                        The 32 semifinalists endured numerous online elimination rounds to earn a trip to the prestigious onsite finals, and will now compete head-to-head over two days of intense competition to determine the winners who will share the $100,000 prize purse.<span class="prHead">[April 6]</span>
                        </p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- NVIDIA TCCC--%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&t=news_events&c=pr_03_08_04"><img src="/i/pressroom/nvidia_badge.gif" alt="nvidia" width="135" height="117" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=pr_03_08_04">NVIDIA Sponsors 2004 TopCoder Collegiate Challenge</A></strong></font><br />
                        "NVIDIA truly believes that the TopCoder arena fosters an unparalleled competitive spirit among the most brilliant programmers in the world. We are proud to be a part of this initiative again," said Daniel Rohrer, Manager of DirectX Graphics.  "Our corporate culture encourages innovation and excellence and the TopCoder competition model is a perfect complement to that philosophy." <span class="prHead">[March 8]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Fortune  --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://www.fortune.com/fortune/print/0,15935,594536,00.html" target="_blank"><img src="/i/pressroom/fortune.gif" alt="Computer World" width="135" height="35" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.fortune.com/fortune/print/0,15935,594536,00.html" target="_blank">Geek Gods</A></strong></font><br />
                        Eleven years of practice and training have brought "Tomek" to this final match. He's spent the past hour in seclusion, meditating to achieve mental focus, then 
                        stretching and hopping to warm up. As the judges call his name, Tomek smiles, flashes peace signs to the spectators, and sits at a computer keyboard. "You may begin," 
                        says an announcer.<span class="prHead"> [March 5]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />
 
<%-- Mass High Tech article --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://www.masshightech.com/displayarticledetail.asp?art_id=64966&cat_id=3" target="_blank"><img src="/i/pressroom/mass_high_tech.gif" alt="cio" width="135" height="60" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.masshightech.com/displayarticledetail.asp?art_id=64966&cat_id=3" target="_blank">Regional programmers take the TopCoder challenge</A></strong></font><br />
                       Called the TopCoder Collegiate Challenge and this year sponsored by Yahoo, the event is a nail-biting competition among a field of the world's most promising technologists, all vying for $100,000 in prize money. <span class="prHead">[March 1]</span></p>
                        
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- DoubleClick Announcement --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&t=news_events&c=pr_03_01_04"><img src="/i/pressroom/dccc.gif" alt="DoubleClick" width="135" height="100" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td> 
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=pr_03_01_04">Columbia University Student Wins DoubleClick's 2004 TopCoder Programming Challenge</A></strong></font><br />
                        Jason Winokur of Columbia University has won the DoubleClick 2004 Coding Challenge.  In the DoubleClick employee competition, 
                        first place finisher was Eliot Horowitz of the New York City office.  The competition was open to all eligible students at Columbia 
                        University and New York University as well as DoubleClick employees. The tournament was designed to highlight the competitors' 
                        relative skills in the analysis of complex algorithmic problems and the ability to write software to solve those problems.<span class="prHead"> [March 1]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Yahoo TCCC Announcement --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&t=news_events&c=pr_02_16_04"><img src="/i/pressroom/tccc_yahoo.gif" alt="TCCC - Yahoo" width="135" height="100" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=pr_02_16_04">TopCoder Announces Yahoo! as Title Sponsor for TCCC04</A></strong></font><br />
                        "Yahoo! is proud to sponsor the TopCoder Collegiate Challenge and showcase the programmers and developers of tomorrow as they put their skills to the test," said Libby Sartain, Senior Vice President, Human Resources and Chief People Yahoo. "Many of the participants in this event are as fun, innovative and talented as our own employees and we are excited to have the Yahoo! team on-site to meet the competitors and witness their considerable coding capabilities."<span class="prHead"> [February 16]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- DoubleClick Announcement --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&t=news_events&c=pr_02_02_04"><img src="/i/pressroom/dccc.gif" alt="DoubleClick" width="135" height="100" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&t=news_events&c=pr_02_02_04">TopCoder Announces DoubleClick 2004 Coding Challenge</A></strong></font><br />
                        Having self-administered coding competitions for its employees for the last two years, DoubleClick is now 
                        turning to TopCoder to expand this year's competition to include external applicants. The DoubleClick 2004 
                        Coding Challenge is open to all DoubleClick employees worldwide. As an added dimension this year, DoubleClick 
                        is also opening the contest to students at two local universities - Columbia and NYU.<span class="prHead"> [February 2]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Computer World  --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://www.computerworld.com/developmenttopics/development/story/0,10801,89274,00.html?SKC=development-89274" target="_blank"><img src="/i/pressroom/computerworld.gif" alt="Computer World" width="135" height="35" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.computerworld.com/developmenttopics/development/story/0,10801,89274,00.html?SKC=development-89274" target="_blank">Standards penetrate telecom industry</A></strong></font><br />
                        Transferring phone numbers between telecommunications service providers seems like a logical 
                        feature that should have always existed. However, it took an act of Congress to enable the Federal 
                        Communications Commission to announce that cell phone numbers could be transferred between carriers 
                        beginning last fall. (As if it were so simple that an act of Congress could make it work.).<span class="prHead"> [January 26]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />
 
<%-- Digital Journal.com --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://www.digitaljournal.com/news/?articleID=3913" target="_blank"><img src="/i/pressroom/digital_journal.gif" alt="Digital Journal" width="135" height="70" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.digitaljournal.com/news/?articleID=3913" target="_blank">World's Top Coder Takes Home $50,000 in Computing Contest</A></strong></font><br />
                        Czajka began the tournament as the #2 seed, rated second among more than 34,000 developers in the TopCoder online community. 
                        After "out-coding" Jimmy Mardell of Stockholm, Sweden, Bogdan Stanescu of Fairfax, VA, and Jiqing Tang of Hong Kong in the 
                        Championship round, Czajka earned his spot as the highest-rated TopCoder member.<span class="prHead"> [January 9]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />
 
 <%-- Mason Gazette --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://gazette.gmu.edu/articles/index.php?id=5180" target="_blank"><img src="/i/pressroom/mason_gazette.gif" alt="The Daily Mason Gazette" width="135" height="70" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://gazette.gmu.edu/articles/index.php?id=5180" target="_blank">George Mason Student Wins Third Place in International Coding Competition</A></strong></font><br />
                        Computer science Ph.D. candidate Bogdan Stanescu won third place in the international 2003 TopCoder Open programming tournament 
                        sponsored by Intel. Of the top 4 finishers, he was the only one representing the United States in the contest that concluded in early December. 
                        <span class="prHead"> [January 9]</span></p>
                    </td>
                </tr>
            </table>


                    </td>
                </tr>
            </table>
        </td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
