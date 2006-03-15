<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
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
                <jsp:param name="node" value="press_room"/>
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
            
<%-- 2006 --%>
            <table width="100%" border="0" cellpadding="4" cellspacing="0">
                <tr><td class="statTextBig" bgcolor="#858B91"><font size="3">2006</font></td></tr>
            </table>

            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>

<%-- ADT --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.adtmag.com/article.aspx?id=18109" target="_blank"><img src="/i/pressroom/adt_logo.gif" alt="ADT" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.adtmag.com/article.aspx?id=18109" target="_blank">SOA vendors partner with LogicLibrary to create integrated governance platform</A></strong></font><br />
Service-oriented architecture vendors Blue Titan Software, TopCoder and Metallect have joined forces with LogicLibrary to support an end-to-end approach to SOA governance, from development through deployment. <span class="prHead"> [March 14 - ADT]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Wall Street & Technology --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.wallstreetandtech.com/showArticle.jhtml?articleID=181502379" target="_blank"><img src="/i/pressroom/wallstreetnTech_logo.gif" alt="Wall Street &amp; Technology" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.wallstreetandtech.com/showArticle.jhtml?articleID=181502379" target="_blank">UBS Sponsors TopCoder Open</A> </strong></font><br />
                        "UBS has signed on as a Premier sponsor of the 2006 TopCoder Open (TCO06). This marks the first time a financial sector organization has sponsored a TopCoder Inc. flagship event." <span class="prHead"> [March 13]</span></p>
                        </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- DNA India --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.dnaindia.com/report.asp?NewsID=1017289&CatID=2" target="_blank"><img src="/i/pressroom/dnaIndia_logo.gif" alt="DNA India" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.dnaindia.com/report.asp?NewsID=1017289&CatID=2" target="_blank">Code jockey contest returns to IT hub</A> </strong></font><br />
                        "Last year, it whetted its recruiting appetite in India. Now, Internet giant Google is back for more. The second edition of Code Jam India, a contest to identify the best code jockey in this part of the world will be held in Bangalore." <span class="prHead"> [March 13]</span></p>
                        </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Pat Conley interview --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=art_031006"><img src="/i/pressroom/patconley.jpg" alt="Pat Conley" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=art_031006">Exclusive: Interview with Pat Conley, VP VeriSign O&I and TopCoder Member</A> </strong></font><br />
                         "Pat shares his impressions of TopCoder, talks about his background <br>and what's going on at industry leader VeriSign." <span class="prHead"> [March 10]</span></p>
                        </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- The Post Online --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://thepost.baker.ohiou.edu/show_news.php?article=N3&date=030806" target="_blank"><img src="/i/pressroom/postOnline_logo.gif" alt="The Post Online" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://thepost.baker.ohiou.edu/show_news.php?article=N3&date=030806" target="_blank">Gurus compete in coding competition</A> </strong></font><br />
                         "A handful of those men whom students call when their computers won't cooperate gathered Monday night to pit their computer programming skills against one another in a coding competition." <span class="prHead"> [March 8]</span></p>
                        </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- UBS --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_030306"><img src="/i/pressroom/ubs_logo.gif" alt="UBS Investment Bank" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_030306">TopCoder Names UBS as Premier Sponsor of 2006 TopCoder Open</A> </strong></font><br />
                        "Financial Services Leader Becomes First Wall Street Firm to Participate at Premier Level with Top Global Coding Competition" <span class="prHead"> [March 3]</span></p>                   
                        </td>
                </tr>
            </table>
            
            <hr width="100%" size="1" noshade="noshade" />

<%-- Spartan Daily --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.thespartandaily.com/media/paper852/news/2006/02/16/News/Sjsu-Codes.A.Win-1616451.shtml?norewrite&sourcedomain=www.thespartandaily.com" target="_blank"><img src="/i/pressroom/spartanDaily_logo.gif" alt="Spartan Daily logo" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.thespartandaily.com/media/paper852/news/2006/02/16/News/Sjsu-Codes.A.Win-1616451.shtml?norewrite&sourcedomain=www.thespartandaily.com" target="_blank">SJSU codes a win</A> </strong></font><br />
                         "San Jose State University's computer science department has earned a world ranking in a prestigious online computer programming competition called Topcoder." <span class="prHead"> [February 16]</span></p>
                        </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- TCHS Global Tourney --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_020806"><img src="/i/pressroom/tchs.gif" alt="TopCoder High School - Competition, evolved." border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_020806">TopCoder High School Launches Global Programming Tournament in June</A> </strong></font><br />
                        "Worldwide Contest From TopCoder Will Promote Problem Solving Skills in Math and Science Among High School-Age Students" <span class="prHead"> [February 8]</span></p>
                        </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- WSJ --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://webreprints.djreprints.com/1404341094425.html" target="_blank"><img src="/i/pressroom/wsj_logo.gif" alt="Wall Street Journal" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://webreprints.djreprints.com/1404341094425.html" target="_blank">Programming Contest Pits World's Top Geeks In Battles Over Coding</A></strong></font><br />
"Imagine a reality TV show that combines the performance-under-time-pressure of 'Iron Chef' with the scheming and psych-outs of 'Survivor,' then adds the soaring braininess of -- well, that's the problem, really: There isn't anything this smart on TV."<span class="prHead"> [February 8]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Jolt Awards --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_012306"><img src="/i/pressroom/jolt_logo.gif" alt="Jolt Awards" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_012606">TopCoder Software Component Libraries Selected as Finalist for the 16th Annual Jolt Awards</A> </strong></font><br />
                        "Software Development Magazine Recognizes CBD Best Practices and Engineering Discipline in TopCoder's Reusable .NET and Java Component Catalogs" <span class="prHead"> [January 26]</span></p>
                        </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Intel --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_012306"><img src="/i/pressroom/intel_software_logo.gif" alt="Intel Software Network" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_012306">TopCoder Names Intel Corporation as First Sponsor of New Marathon Match Series</A> </strong></font><br />
                        "Multi-Core Processing the Focus as New Format Promoting Optimization in Problem Solving is Added to TopCoder Schedule of Tournaments" <span class="prHead"> [January 23]</span></p>
                        </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Java Posse --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.javaposse.com/media/dickwall/JavaPosse026.mp3" target="_blank"><img src="/i/pressroom/javaPosse_logo.gif" alt="The Java Posse" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.javaposse.com/media/dickwall/JavaPosse026.mp3" target="_blank">Java Posse - Bill Goggin interview [PODCAST]</A> </strong></font><br />
                        TopCoder Project Manager Bill Goggin describes the in's and out's of TopCoder, and the company's use of Java.<span class="prHead"> [January 20]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- BusinessWeek --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.businessweek.com/magazine/content/06_04/b3968007.htm" target="_blank"><img src="/i/pressroom/businessweek_logo.gif" alt="BusinessWeek" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.businessweek.com/magazine/content/06_04/b3968007.htm" target="_blank">The NSA: Security in Numbers</A> </strong></font><br />
                        "The techno-spy agency has a greater need than ever for American math talent, but recruiting in the age of Google is a lot tougher." <span class="prHead"> [January 13]</span></p>
                        </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- DNA India --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://dnaindia.com/report.asp?NewsID=1007225&CatID=2" target="_blank"><img src="/i/pressroom/dnaIndia_logo.gif" alt="DNA India" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://dnaindia.com/report.asp?NewsID=1007225&CatID=2" target="_blank">Contest a coded message for job seekers</A> </strong></font><br />
                        "Write a software to land that dream job straight out of college. Now Indian technology grads can win jobs and internships at tech majors by competing in coding contests." <span class="prHead"> [January 12]</span></p>
                        </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%--  TCO06 NSA --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_010906"><img src="/i/pressroom/nsa_logo.gif" alt="NSA" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_010906">TopCoder Announces NSA Participation in 2006 TopCoder Open in Las Vegas</A></strong></font><br />
                        "TopCoder&#174;, Inc. today announced additional details of its 2006 TopCoder Open (TCO06) which include the continued support of the National Security Agency as an event patron."<span class="prHead"> [January 9]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- INC --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.inc.com/magazine/20060101/handson-global.html" target="_blank"><img src="/i/pressroom/incDOTcom_logo.gif" alt="Inc.com" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.inc.com/magazine/20060101/handson-global.html" target="_blank">Put a hacker to work</A> </strong></font><br />
                        "Software developer TopCoder's brilliant strategy to find - and register - the world's best programmers"<span class="prHead"> [January 2006]</span></p>
                    </td>
                </tr>
            </table>

            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>


<%-- 2005 --%>
            <table width="100%" border="0" cellpadding="4" cellspacing="0">
                <tr><td class="statTextBig" bgcolor="#858B91"><font size="3">2005</font></td></tr>
            </table>

            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>

<%--  TCO06 Verisign --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_121905"><img src="/i/pressroom/verisign_logo.gif" alt="Verisign" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_121905">TopCoder Welcomes VeriSign as Return Sponsor of 2006 TopCoder Open in Las Vegas</A></strong></font><br />
                        "We are proud to be a returning sponsor of the 2006 TopCoder Open, which provides companies like VeriSign a pool of talented professional and academic minds to choose the next-generation of employees that will develop advanced services and technologies."<span class="prHead"> [December 19]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Forbes --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.forbes.com/home/work/2005/12/09/silicon-valley-hiring-cx_rr_1212hire.html" target="_blank"><img src="/i/pressroom/forbes_logo.gif" alt="Forbes" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.forbes.com/home/work/2005/12/09/silicon-valley-hiring-cx_rr_1212hire.html" target="_blank">Help Wanted In Silicon Valley</A> </strong></font><br />
                        For programmers, happy days are here again. But for their employers, fear is setting in. <span class="prHead"> [December 12]</span></p>
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
                        They came from around the world, young men with handles like SnapDragon and Bladerunner attacking computing problems so complex that even experienced coders could only stare at the screen in bewilderment. Only one mastered the final algorithm problem: Eryk Kopczynski, a.k.a. Eryx, a reticent Warsaw University student who wears his long hair in a ponytail and says his life's ambition is to "discover some interesting notion."
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
"I think it�s critical to improve the level of quality," [Jack Hughes] said. Hughes has immersed himself in the development world for more than 15 years.<span class="prHead"> [October 17 - MHT]</span></p>
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

                    <td width="274"><A href="http://www.adtmag.com/article.asp?id=11752" target="_blank"><img src="/i/pressroom/adt_logo.gif" alt="ADT" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.adtmag.com/article.asp?id=11752" target="_blank">Components for SOAs and Other App Dev Projects</A></strong></font><br />
The result of the partnership between LogicLibrary and TopCoder reached earlier this year is that TopCoder�s components for Java and .NET are now stored in Logidex, LogicLibrary's collaborative SDA management solution. <span class="prHead"> [September 6 - ADT]</span></p>
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
It�s the grand slam of programming or, as the tourney organiser calls it, 'the X-games of software development'. It�s gruelling and needs speed, accuracy and skill. Sounds like a sports contest?<span class="prHead"> [August 28 - Times of India]</span></p>
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