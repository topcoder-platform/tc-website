<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
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
            
<%-- 2007 --%>
            <table width="100%" border="0" cellpadding="4" cellspacing="0">
                <tr><td class="statTextBig" bgcolor="#858B91"><font size="3">2007</font></td></tr>
            </table>

            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>

<%-- AOL to Webcast TopCoder Open 2007 Finals Live on June 29 --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_060507"><img src="/i/pressroom/tco07_logo.png" alt="TCO07" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_060507">AOL to Webcast TopCoder Open 2007 Finals Live on June 29</A></strong></font><br />
                        Coverage of High Stakes Programming Competition Available Globally at <a target="_blank" href="<tc-webtag:linkTracking link='http://dev.aol.com' refer='pr_060507' />">http://dev.aol.com</a><span class="prHead"> [June 5]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Yodlee to Sponsor TopCoder Single Round Match Series --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A target="_blank" href="/tc?module=Static&d1=pressroom&d2=pr_052207"><img src="/i/pressroom/yodlee_logo.png" alt="TopCoder" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A target="_blank" href="/tc?module=Static&d1=pressroom&d2=pr_052207">Yodlee to Sponsor TopCoder Single Round Match Series</A></strong></font><br />
                        TopCoder today announced that Yodlee, a leader in online banking solutions, will sponsor a series of three SRMs beginning on May 29th and continuing on June 14th and July 12th. Each match will offer prize purses of $5,000 for a total of $15,000 in cash payouts over the three part series. <span class="prHead"> [May 23]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />
            
<%-- Russian, Croatian and US High School Programmers Win TopCoder Championship at Purdue University --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_021307"><img src="/i/pressroom/tchs07.png" alt="TCHS07" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A target="_blank" href="/tc?module=Static&d1=pressroom&d2=pr_052307">Russian, Croatian and US High School Programmers Win TopCoder Championship at Purdue University</A></strong></font><br />
                        First World Championship for TopCoder High School Members Sees Eastern Europe Prevail in Individual and Team Tournaments<span class="prHead"> [May 21]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />
            
<%-- TopCoder Appoints Russ Malz Vice President of Sales --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A target="_blank" href="/tc?module=Static&d1=pressroom&d2=pr_040907"><img src="/i/pressroom/topcoder_logo.png" alt="TopCoder" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A target="_blank" href="/tc?module=Static&d1=pressroom&d2=pr_040907">TopCoder Appoints Russ Malz Vice President of Sales</A></strong></font><br />
                        TopCoder announced the appointment of Russ Malz as Vice President of Sales. In this role, Malz will be responsible for aligning TopCoder's capabilities with the growing corporate demand for high quality application development, and shaping the TopCoder competitive methodology platform to the enterprise market. <span class="prHead"> [April 9]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />
            
<%-- TopCoder Appoints Jiazhi Wu VP of Technology for China --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A target="_blank" href="/tc?module=Static&d1=pressroom&d2=pr_040307"><img src="/i/pressroom/china_20061027.gif" alt="TopCoder & China" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A target="_blank" href="/tc?module=Static&d1=pressroom&d2=pr_040307">TopCoder Appoints Jiazhi Wu VP of Technology for China</A></strong></font><br />
                        TopCoder announced it has hired Jiazhi Wu as Vice President of Technology for the company's operations in China. Wu, known by his handle "WishingBone", will oversee the development of systems and application development for all competitions and technologies and be responsible for introducing and training new members in China to the TopCoder software process. <span class="prHead"> [April 3]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />
            
<%-- USA Today --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A target="_blank" href="http://www.usatoday.com/tech/techinvestor/industry/2007-03-13-google-poland_N.htm"><img src="/i/pressroom/usatoday_logo.gif" alt="USA Today" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A target="_blank" href="http://www.usatoday.com/tech/techinvestor/industry/2007-03-13-google-poland_N.htm">Why Google put a research lab in Poland</A></strong></font><br />
                        "Last year's TopCoder Collegiate Challenge drew 21000 registrants from around the world, but half of the 48 finalists were from former Soviet bloc nations, including the winner, Petr Mitrichev of Russia, who also won last year's Global Code Jam." <span class="prHead"> [March 13]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- TopCoder Announces TopCoder Open 2007 Sponsored by AOL --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_022207"><img src="/i/pressroom/tco07_logo.png" alt="TCO07" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_022207">TopCoder Announces TopCoder Open 2007 Sponsored by AOL</A></strong></font><br />
                        Top 80 Programmers from Around the World to Compete for $260,000 in Prizes June 27th through 29th at The Mirage, Las Vegas.<span class="prHead"> [February 22]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- BusinessWeek Ideagora --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A target="_blank" href="http://www.businessweek.com/print/innovate/content/feb2007/id20070215_251519.htm"><img src="/i/pressroom/businessweek_logo.gif" alt="BusinessWeek" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A target="_blank" href="http://www.businessweek.com/print/innovate/content/feb2007/id20070215_251519.htm">Ideagora, a Marketplace for Minds</A></strong></font><br />
                        Companies seeking solutions to seemingly insoluble problems can tap the insights of hundreds of thousands of enterprising scientists without having to employ everybody full-time. This shift is rippling through Corporate America and changing the way companies invent and develop products and services. <span class="prHead"> [February 15]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Computerworld --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.computerworld.com/action/article.do?command=viewArticleBasic&taxonomyId=11&articleId=9011098&intsrc=hm_topic"><img src="/i/pressroom/computerworld.gif" alt="ComputerWorld logo" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.computerworld.com/action/article.do?command=viewArticleBasic&taxonomyId=11&articleId=9011098&intsrc=hm_topic">Microsoft launches 'mashup' competition for developers</A></strong></font><br />
                        Microsoft Corp. and BT Group PLC launched a competition to encourage developers to create "network mashups" that merge telecommunications features such as voice and text messaging with Web 2.0 applications like mapping and search... TopCoder Inc., which runs several competitions for programmers, will manage the Microsoft/BT event.<span class="prHead"> [February 14]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- TCHS07 --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_021307"><img src="/i/pressroom/tchs07.png" alt="TCHS07" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_021307">Registration Opens for First TopCoder High School Global Programming Tournament</A></strong></font><br />
                        The TopCoder High School Tournament follows in the full tradition of the company's flagship TopCoder Open and TopCoder Collegiate Challenge professional and collegiate events by providing a world class platform for high school students. <span class="prHead"> [February 13]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- MS CSF --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_021207"><img src="/i/pressroom/csflogo.png" alt="Microsoft CSF Logo" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_021207">Connected Services Sandbox Launches</A></strong></font><br />
                        TopCoder has announced the launch of the Connected Services Sandbox competition series for Microsoft and BT. TopCoder will manage the competitions to help promote the development of innovative customer solutions that merge traditional telecommunications offerings. <span class="prHead"> [February 12]</span></p>
                    </td>
                </tr>
            </table>

            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>

<%-- 2006 --%>
            <table width="100%" border="0" cellpadding="4" cellspacing="0">
                <tr><td class="statTextBig" bgcolor="#858B91"><font size="3">2006</font></td></tr>
            </table>

            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>


<%-- HRE Magazine --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="<tc-webtag:linkTracking link="/pdfs/press_room/hre_article_20061213.pdf"/>" refer="pressroom"/><img src="/i/pressroom/hre_magazine_logo.png" alt="Human Resources Executive Magazine" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="<tc-webtag:linkTracking link="/pdfs/press_room/hre_article_20061213.pdf"/>" refer="pressroom"/>And the Winner Is&#8230;</A> [PDF]</strong></font><br />
                        The beauty of contests is that they appeal to a person's competitive nature. People like to test themselves. That's why contests can be effective in recruiting an elusive audience&#8230;<span class="prHead"> [December 13]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- China Daily --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.chinadaily.com.cn/china/2006-12/08/content_754200.htm"><img src="/i/pressroom/chinadaily_logo.png" alt="China Daily logo" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.chinadaily.com.cn/china/2006-12/08/content_754200.htm">Undergraduate VP of multinational company</A></strong></font><br />
                        Wu Yingying, 21, holding patents for three of her 100 inventions, has become Asia operations vice president with TopCoder, a Connecticut-based multinational company, before her graduation.<span class="prHead"> [December 8]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- IEEE software --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/pdfs/press_room/ieeeSoftware_20061206.pdf"><img src="/i/pressroom/ieeesoftware_logo.png" alt="IEEE Software logo" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/pdfs/press_room/ieeeSoftware_20061206.pdf">Programming Contests Show Impressive Growth</A> [PDF]</strong></font><br />
                        Global software programming contests are expanding in number, size, and scope. Student programmers and, increasingly, their professional colleagues are taking the opportunity to 'show their stuff' under the trying conditions of controlled competition. <span class="prHead"> [December 6]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Success --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/pdfs/press_room/success200612.pdf"><img src="/i/pressroom/success_logo.png" alt="Success logo" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/pdfs/press_room/success200612.pdf">Maverick Rules for Success</A> [PDF]</strong></font><br />
                        Our panelists hail from a wide range of industries, but they agree on a critical element of success in the 21st century: You can't do big things with your company or career if you're content with doing things a little better than everyone else. <span class="prHead"> [November]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- AOL mash up --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_113006"><img src="/i/pressroom/aol_logo.jpg" alt="AOL logo" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_113006">AOL and TopCoder Announce Web AIM Mashup Competition</A></strong></font><br />
                        Top Prize of $5,000 for Developer With Most Innovative Web AIM Mashup Concept. <span class="prHead"> [November 30]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Gartner CIO Summit --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_112906"><img src="/i/pressroom/gartner_logo.gif" alt="Gartner" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_112906">TopCoder to Present Keynote Address: Future of Virtual Communities as Business; at Gartner CIO Summit 2006</A></strong></font><br />
                        Jack Hughes, TopCoder Chairman and Founder To Discuss Managing Social Network Web Communities as a New Model for Global Productivity.<span class="prHead"> [November 29]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- TCCC06 Champions --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_112106"><img src="/i/pressroom/tccc06_logo.gif" alt="TCCC06 logo" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_112106">Russia's nicka81 and Petr, China's PE Triumph at TopCoder Collegiate Challenge in San Diego</A></strong></font><br />
                        New York, Moscow and Zhejiang University Students Are TopCoder's World Champion Programmers<span class="prHead"> [November 21]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- internetnews.com --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.internetnews.com/dev-news/article.php/3644456"><img src="/i/pressroom/internetnews_logo.gif" alt="internetnews.com logo" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.internetnews.com/dev-news/article.php/3644456">Who is the Top Coder?</A></strong></font><br />
                        Coding as competitive sport? You bet, complete with a famous ESPN anchor and $200,000 in prizes. It's called the TopCoder Collegiate Challenge and the finals are being webcast live Friday thanks to sponsor AOL. <span class="prHead"> [November 17]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- AOL TCCC webcast team --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.prnewswire.com/mnr/topcoder/26099/"><img src="/i/pressroom/aol_logo.jpg" alt="AOL logo" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.prnewswire.com/mnr/topcoder/26099/">Meet the AOL TCCC Webcast Team</A></strong></font><br />
                        AOL today announced that ESPN's Jeremy Schaap will join TopCoder veterans John Dethridge and Ken_Vogel to host the live webcast of the TCCC finals. The webcast will be broadcast live on November 17, starting at 1:30 p.m. PST (21:30 GMT). <span class="prHead"> [November 13]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- China TopCoders in BusinessWeek --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=art_110206"><img src="/i/pressroom/businessweek_logo.gif" alt="BusinessWeek" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=art_110206">A Growing Cadre Of Code Warriors</A></strong></font><br />
                        China's young programming hotshots are gaining global attention <span class="prHead"> [November 2]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Christian Science Monitor --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.csmonitor.com/2006/1101/p01s04-usec.htm" target="_blank"><img src="/i/pressroom/csmonitor_logo.jpg" alt="Christian Science Monitor" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.csmonitor.com/2006/1101/p01s04-usec.htm" target="_blank">How to build software? Henry Ford, meet eBay.</A></strong></font><br />
                        "By tapping the best freelance programmers in the world, and letting them compete to write pieces of software, TopCoder and its competitors are creating a new kind of assembly line. In essence, they're dragging Henry Ford into the eBay era." <span class="prHead"> [November 1]</span></p>
                        </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- TopCoder in China --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_102506"><img src="/i/pressroom/china_20061027.gif" alt="Now Open in China" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_102506">TopCoder Launches Operations in China with New Beijing Appointment</A></strong></font><br />
                        TopCoder today announced it has hired Yingying Wu as Vice President of Operations for TopCoder in Asia. Wu will oversee and manage TopCoder business relationships and will build TopCoder's market presence and member enrollment throughout the greater China and Asia region.<span class="prHead"> [October 25]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- gigaOm --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://gigaom.com/2006/10/23/the-new-american-idol-the-coder/" target="_blank"><img src="/i/pressroom/gigaOm_logo.jpg" alt="gigaOm" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://gigaom.com/2006/10/23/the-new-american-idol-the-coder/" target="_blank">The New American Idol&#8230; The Coder</A></strong></font><br />
                        Om Malik discusses his take on the newest trend of big technology companies promoting and webcasting <i>codercons</i>, aka marathon coder events where hackers jock for hacking props. <span class="prHead"> [October 24]</span></p>
                        </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- TCCC06 Algorithm Competition Semifinalists --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_102306"><img src="/i/pressroom/tccc06_logo.gif" alt="TCCC06 logo" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_102306">Semifinalists Announced for 2006 TopCoder Collegiate Challenge Sponsored by AOL</A></strong></font><br />
                        Collegiate coding talent from 19 countries to meet at World Championship of Programming scheduled for November 17th in San Diego, CA.<span class="prHead"> [October 23]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Wall Street & Technology --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.wallstreetandtech.com/showArticle.jhtml;jsessionid=0U21ZF2KMDLJYQSNDLPCKHSCJUNN2JVN?articleID=193400878" target="_blank"><img src="/i/pressroom/wallstreetnTech_logo.gif" alt="Wall Street &amp; Technology" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.wallstreetandtech.com/showArticle.jhtml;jsessionid=0U21ZF2KMDLJYQSNDLPCKHSCJUNN2JVN?articleID=193400878" target="_blank"><i>Wall Street & Technology</i> on TopCoder and UBS</A> </strong></font><br />
                        "Ken Vogel didn't join TopCoder looking for a job, but a job came looking for him when UBS evaluated his success in online competitive development." <span class="prHead"> [October 23]</span></p>
                        </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- AOL Title TCCC Sponsor --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_101106"><img src="/i/pressroom/aol_logo.jpg" alt="AOL logo" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_101106">AOL to Webcast TopCoder World Championship of Computer Programming Live on November 17</A></strong></font><br />
                        "One of TopCoder's core goals is to bring value to the programming community, and with the help of AOL we'll now be able to present much of the excitement and thrill of the onsite contest live, via the internet," said Rob Hughes, President and COO of TopCoder, Inc.<span class="prHead"> [October 11]</span> - <A href="/movies/tournament/tccc06/tccc06AOLWebcast.mpeg">Watch the trailer!</A></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />


<%-- Mavericks --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_101006"><img src="/i/pressroom/mavericks_logo.jpg" alt="Mavericks at Work" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_101006">TopCoder joins "Mavericks at Work" book tour</A></strong></font><br />
                        On November 7, the "Mavericks at Work" book tour will be coming to Hartford. Jack Hughes of TopCoder will join the authors and greater 
                        Hartford-area business leaders to discuss how, in an age of hyper-competition and non-stop innovation, the only way to stand out from the crowd 
                        is to stand for something truly unique. <span class="prHead"> [October 10]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- InfoWeek --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><img src="/i/pressroom/info_week_logo.gif" alt="InformationWeek" border="0" /></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong>TopCoder helps "free" AOL</strong></font><br />
                        InformationWeek interviewed TopCoder CTO Mike Lydon for a recent article on AOL, citing TopCoder's alliance with the company as evidence of a "monumental shift in its approach." <span class="prHead">[October 10]</span><br>
                        <A href="/i/pressroom/infoweek_excerpt.gif" target="_blank">excerpt</A>&#160;|&#160;
                        <A href="http://www.informationweek.com/internet/showArticle.jhtml?articleID=193104723" target="_blank">full story</A></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Open Source --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><img src="/i/pressroom/opensource_logo.gif" alt="Open Source" border="0" /></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong>TopCoder featured on public radio's "Open Source" [PODCAST] </strong></font><br />
                        Jack Hughes joined <i>Mavericks at Work</i> author William Taylor and host Christopher Lydon to discuss TopCoder's "maverick" approach. <span class="prHead">[October 4]</span><br>
                        <A href="/audio/open_source_060928_24kb.mp3" target="_blank">lo 6.8mb</A> &#160;|&#160;
                        <A href="/audio/open_source_060928_48kb.mp3" target="_blank">hi 13.8mb</A> &#160;|&#160;
                        <A href="/i/pressroom/pdfs/mavericks_at_work.pdf" target="_blank">Mavericks at Work excerpt</A> [PDF]</p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- NSA TCCC Patron --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_082906"><img src="/i/pressroom/nsa_logo.gif" alt="NSA logo" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_082906">NSA Continues TopCoder Patronage with Support of 2006 TopCoder Collegiate Challenge in San Diego</A></strong></font><br />
                        U.S. National Security Agency Extends Involvement with TopCoder Developer Community <span class="prHead"> [August 29]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- MHT --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><img src="/i/pressroom/mht_logo.gif" alt="Mass High Tech" border="0" /></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><i>Mass High Tech</i> features TopCoder staff</strong></font><br />
                        The latest issue of <i>Mass High Tech</i> names TheFaxman one of the six best programmers in New England, and features an article from FogleBird on identifying talented developers. <span class="prHead">[July 12]</span><br>
                        <A href="http://masshightech.bizjournals.com/masshightech/stories/2006/07/10/focus1.html">Code Commanders</A>&#160;|&#160;
       <A href="http://masshightech.bizjournals.com/masshightech/stories/2006/07/10/focus6.html">TheFaxman Codeth</A>&#160;|&#160;
       <A href="http://masshightech.bizjournals.com/masshightech/stories/2006/07/10/focus8.html">Identifying Best Developers</A></p>
       </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- UBS Premier TCCC Sponsor --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_071206"><img src="/i/pressroom/ubs_logo.gif" alt="UBS logo" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_071206">UBS Extends Premier Sponsorship of TopCoder Events</A></strong></font><br />
                        Banking and Financial Services Leader to Support November Tournament and World's Top Student Computer Programmers <span class="prHead"> [July 12]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Java Posse --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://media32b.libsyn.com/aHeceJl2a3eTdmd2bHOcq5qkZnaZ/podcasts/dickwall/JavaPosse065.mp3" target="_blank"><img src="/i/pressroom/javaPosse_logo.gif" alt="The Java Posse" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://media32b.libsyn.com/aHeceJl2a3eTdmd2bHOcq5qkZnaZ/podcasts/dickwall/JavaPosse065.mp3" target="_blank">Interviews from Topcoder and Java One</A> [PODCAST] </strong></font><br />
                        This is a pair of previously un-aired interviews. The first was recorded by Joe, Carl and Dick at TopCoder with Ari Balogh, Vice President of Engineering for Verisign Inc. It is a short but technically meaty interview.<span class="prHead"> [July 5]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Bloomberg Premier TCCC Sponsor --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_062606"><img src="/i/pressroom/bloomberg_logo.gif" alt="Bloomberg logo" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_062606">TopCoder Announces Bloomberg L.P. As Premier Sponsor of TCCC06</A></strong></font><br />
                        Leading Global Provider of Data, News and Analytics Backs Top Computer Science Tournament <span class="prHead"> [June 26]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- AOL Title TCCC Sponsor --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_061906"><img src="/i/pressroom/aol_logo.jpg" alt="AOL logo" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_061906">AOL Named Title Sponsor of 2006 TopCoder Collegiate Challenge</A></strong></font><br />
                        AOL Supports Global Student Programming Community in $200,000 Technical Software Contest.<span class="prHead"> [June 19]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- SMM Partners with TCHS --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_060706"><img src="/i/pressroom/smm_logo.gif" alt="Science Museum of Minnesota logo" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_060706">Science Museum of Minnesota Partners with TopCoder High School Competitions</A></strong></font><br />
                        Launch of Worldwide Computer Contest for High School-Age Students Promotes Problem Solving Skills in Math and Science.<span class="prHead"> [June 7]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- TCCC Sponsors --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_060606"><img src="/i/pressroom/tccc06_sponsor_logos.jpg" alt="2006 TCCC Sponsor Logos" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_060606">AOL, Bloomberg, UBS and NSA Announced as Sponsors/Patrons of 2006 TopCoder Collegiate Challenge</A></strong></font><br />
                        AOL&#174; and Bloomberg LP will join returning TopCoder premier sponsor UBS&#174; and patron National Security Agency (NSA). Thousands of students in computer science, mathematics, physics and other disciplines from universities around the world will begin registering in August to compete online with the goal of advancing to the world-renowned TCCC onsite finals being held in San Diego, CA this coming November.<span class="prHead"> [June 6]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Gartner Press Release --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=art_051606"><img src="/i/pressroom/gartner_logo.gif" alt="Gartner" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=art_051606">Gartner cites TopCoder as model for "Web 2.0" community</A></strong></font><br />
                        A press release from the Gartner Symposium/ITxpo cited TopCoder as a model for a "Web Community," one of the "three key focal points" for understanding Web 2.0.<span class="prHead"> [May 16]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- IT Week --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://garyflood.itweek.co.uk/2006/05/idol_or_idle_wh.html" target="_blank"><img src="/i/pressroom/itWeek_logo.gif" alt="IT Week" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://garyflood.itweek.co.uk/2006/05/idol_or_idle_wh.html" target="_blank">Idol or idle: which one are you?</A></strong></font><br />
                        "Which nation produces the cleverest programmers in the world? According to the finals of the latest TopCoder global programming competition, held in Las Vegas recently, you should pick from Russia, Poland, Australia, China, Japan and Slovakia."<span class="prHead"> [May 15]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- CNBC --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/movies/press/cnbc_051506.mov" target="_blank"><img src="/i/pressroom/cnbc_logo.gif" alt="CNBC TV" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/movies/press/cnbc_051506.mov" target="_blank">CNBC's Jane's Addiction and Squawk Box at the TCO06</A> [MOVIE]</strong></font><br />
                        Featuring members antimatter, John Dethridge, tomek and Ken Vogel.<span class="prHead"> [May 15]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Java Posse --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://media31b.libsyn.com/bXdveMh1nHzGfGd1mHluo2%2BlkXWb/podcasts/dickwall/JavaPosse053.mp3" target="_blank"><img src="/i/pressroom/javaPosse_logo.gif" alt="The Java Posse" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://media31b.libsyn.com/bXdveMh1nHzGfGd1mHluo2%2BlkXWb/podcasts/dickwall/JavaPosse053.mp3" target="_blank">Listener Feedback and TopCoder Interviews</A> [PODCAST] </strong></font><br />
                        Another installment from the TopCoder Open 06. Check out the interviews conducted during the competition, with antimatter and Pops.<span class="prHead"> [May 15]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- WSJ --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/?t=sponsor&c=link&link=http://webreprints.djreprints.com/1466111183234.html" target="_blank"><img src="/i/pressroom/wsjreprint_logo.gif" alt="Wall Street Journal" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?t=sponsor&c=link&link=http://webreprints.djreprints.com/1466111183234.html" target="_blank">Cause for Concern? Americans Are Scarce In Top Tech Contest</A></strong></font><br />
                        "Of the 48 best computer programmers in the world, only four of them are Americans. But what that bit of data says about the state of the U.S. education system is open to debate."<span class="prHead"> [May 10]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Java Posse --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://media32b.libsyn.com/a3edeJR1nnyUeGx8bXttpWytZHKZ/podcasts/dickwall/JavaPosse054.mp3" target="_blank"><img src="/i/pressroom/javaPosse_logo.gif" alt="The Java Posse" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://media32b.libsyn.com/a3edeJR1nnyUeGx8bXttpWytZHKZ/podcasts/dickwall/JavaPosse054.mp3" target="_blank">Live at the TopCoder Open</A> [PODCAST] </strong></font><br />
                        Play by play coverage of the algorithm competition finals, as well as some fun moments and surprise guests. This recording was made live at the TopCoder Open event held in Las Vegas, and you'll be hearing it less-than-live about a week later.<span class="prHead"> [May 11]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Moscow Times --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.themoscowtimes.com/stories/2006/05/11/042.html" target="_blank"><img src="/i/pressroom/moscowTimes_logo.gif" alt="The Moscow Times" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.themoscowtimes.com/stories/2006/05/11/042.html" target="_blank">Russian Talents Shine in IT Contests</A></strong></font><br />
                        Moscow State University student Pyotr Mitrichev, 21, took the gold this month at a major programming competition in the United States. His prize was the latest in a string of victories by Russian programmers.<span class="prHead"> [May 11]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- ComputerWorld --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.computerworld.com/action/article.do?command=viewArticleBasic&articleId=9000323" target="_blank"><img src="/i/pressroom/computerworld.gif" alt="Computerworld" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.computerworld.com/action/article.do?command=viewArticleBasic&articleId=9000323" target="_blank">Programming contest garners enterprise interest</A></strong></font><br />
                        <i>Users tap TopCoder's "virtual sourcing" model</i> - More than 64 computer programmers from 19 countries gathered in Las Vegas last week for the 2006 TopCoder Open, a competition where developers go head-to-head to solve a complex algorithmic problem, design an application or develop a software component for $150,000 in cash prizes.<span class="prHead"> [May 10]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- TCO champions --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_050806"><img src="/i/pressroom/tco06_logo.gif" alt="2006 TopCoder Open" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_050806">Russian, US and Indonesian Programmers Win $150,000 TopCoder Open Sponsored By AMD in Las Vegas</A></strong></font><br />
                        "Computer Programmers Celebrated at TopCoder Open World Championship Sponsored by AMD, UBS, National Security Agency and VeriSign." <span class="prHead"> [May 8]</span></p>
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
                        <p><font size="3"><strong><A href="http://media41b.libsyn.com/mHdxeJp1cXvHfZd5anptq26sZXGb/podcasts/dickwall/JavaPosse052.mp3" target="_blank">Java Posse - Jack Hughes interview from the TCO06</A> [PODCAST] </strong></font><br />
                        The Java Posse interviews TopCoder Founder Jack Hughes right from the TCO06 Arena, including topics like how Jack came up with the idea for TopCoder.<span class="prHead"> [May 4]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- CNET news.com --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://news.com.com/Coding+for+fame%2C+and+dollars/2100-1007_3-6067549.html?tag=nefd.lede" target="_blank"><img src="/i/pressroom/cnetNews_logo.gif" alt="CNET News.com" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://news.com.com/Coding+for+fame%2C+and+dollars/2100-1007_3-6067549.html?tag=nefd.lede" target="_blank">Coding for fame, and dollars</A></strong></font><br />
                        Las Vegas has seen its share of title fights, but the only thing that will get pounded by the 64 finalists arriving this week for the 2006 TopCoder Open will be a computer keyboard.<span class="prHead"> [May 2]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- UGA - ACM --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.cs.uga.edu/~acm/topcoder.html" target="_blank"><img src="/i/pressroom/uga_acm_logo.gif" alt="UGA-ACM" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.cs.uga.edu/~acm/topcoder.html" target="_blank">TopCoder College Tour: Report from University of Georgia</A></strong></font><br />
                        9:00 PM - Rock, Paper, Scissors Tournament, 9:15 PM - Build Card Bridge, 9:45 PM - Help Jimmy "The Lightning" Alberto Steal Diamonds. This looks like an odd (but busy) schedule. Actually, these were the challenges that UGA programmers faced in an algorithm competition Wednesday night.<span class="prHead"> [April 5]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Whitworthian --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.whitworth.edu/Students/Whitworthian/V96/I14/Students-compete-in-online-competition.html" target="_blank"><img src="/i/pressroom/whitworthian_logo.gif" alt="The Whitworthian" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.whitworth.edu/Students/Whitworthian/V96/I14/Students-compete-in-online-competition.html" target="_blank">Students compete in online competition</A></strong></font><br />
                        Bob the chicken walks only in a sequence of straight lines to reach his destination. How many times will he cross the road along the way? In the world of computer science, this problem and others were the tasks to solve in a recent software coding competition.<span class="prHead"> [March 30]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- AMD --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_031606"><img src="/i/pressroom/amd_logo.gif" alt="AMD" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_031606">TopCoder Announces AMD as Title Sponsor of 2006 TopCoder Open in Las Vegas</A></strong></font><br />
"AMD Developer Central, AMD's program to support software developers, is pleased to sponsor the 2006 TopCoder Open and help showcase the unique creativity and genius shown by TopCoder members in this competition." <span class="prHead"> [March 16]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- ADT --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.adtmag.com/article.aspx?id=18109" target="_blank"><img src="/i/pressroom/adt_logo.gif" alt="ADT" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.adtmag.com/article.aspx?id=18109" target="_blank">SOA vendors partner with LogicLibrary to create integrated governance platform</A></strong></font><br />
Service-oriented architecture vendors Blue Titan Software, TopCoder and Metallect have joined forces with LogicLibrary to support an end-to-end approach to SOA governance, from development through deployment. <span class="prHead"> [March 14]</span></p>
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
"I think it's critical to improve the level of quality," [Jack Hughes] said. Hughes has immersed himself in the development world for more than 15 years.<span class="prHead"> [October 17 - MHT]</span></p>
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
                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_050205"><img src="/i/pressroom/javaone_event.gif" alt="javaone" width="135" height="40" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_050205">TopCoder&#174;-Powered Coding Challenge to Feature at Sun's 2005 JavaOne<sup>SM</sup> Conference</A></strong></font><br />
                        TopCoder today announced that they are again teaming up with Sun Microsystems, Inc. (Nasdaq: SUNW) to host the JavaOne Coding Challenge at the tenth annual 2005 JavaOne conference, scheduled for June 27 - 30th at Moscone Center in San Francisco.<span class="prHead"> [May 2]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- CHE --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=art_040805"><img src="/i/pressroom/che_logo.gif" alt="Chronicle of Higher Education" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=art_040805">Code Warriors</A></strong></font><br />
                     Young computer programmers battle for fame, money, and the love of algorithms<span class="prHead"> [April 8 - Chronicle of Higher Education]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- BusinessWeek --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=art_042205"><img src="/i/pressroom/businessweek_logo.gif" alt="BusinessWeek" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=art_042205">How Google Searches - For Talent</A></strong></font><br />
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

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_031405a"><img src="/i/pressroom/tccc05_logo.gif" alt="TCCC05" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_031405a">Champions Announced In 2005 TCCC Sponsored by Yahoo!&#174;</A></strong></font><br />
                        TopCoder today announced that Mathijs Vogelzang of the University of Groningen, The Netherlands, Adrian Nicolae Carcu of  the Babes-Bolyai Computer Science University, Romania, and Gary Linscott of Queens University, Canada have won the Algorithm, Design and Development Component tournaments of the 2005 TopCoder Collegiate Challenge sponsored by Yahoo!<span class="prHead"> [March 14]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Logic Library --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_031405b"><img src="/i/pressroom/logiclib_logo.gif" alt="Logic Library" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_031405b">LogicLibrary Teams with TopCoder to Accelerate SOA Deployments</A></strong></font><br />
                        "As developers turn to SOA, reusable components are becoming the building blocks of applications because of their ability to reduce costs, streamline projects and improve productivity."<span class="prHead"> [March 14]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- NW Polska --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=art_021305"><img src="/i/pressroom/nw_polska_logo.gif" alt="NewsWeek Poland" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=art_021305">Program for life</A></strong></font><br />
                        They get their Ph.D.'s at the age of twenty. At thirty they become professors in America. Warsaw University graduates are some of the best computer scientists in the world.<span class="prHead"> [February 13 - NewsWeek Poland]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- TCCC05 --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_022205"><img src="/i/pressroom/tccc05_logo.gif" alt="TCCC05" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_022205">Semifinalists Announced for 2005 TCCC Sponsored by Yahoo!&#174;</A></strong></font><br />
                        TopCoder today announced the 31 International onsite semifinalists who have advanced to the Championship rounds of the 2005 TopCoder Collegiate Challenge sponsored by Yahoo!<span class="prHead"> [February 22]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- NVIDIA TCCC--%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_021605"><img src="/i/pressroom/nvidia_badge.gif" alt="nvidia" width="135" height="117" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_021605">NVIDIA Corporation Returns as Premier Sponsor of 2005 TopCoder&#174; Collegiate Challenge</A></strong></font><br />
                        TopCoder announced NVIDIA Corporation (Nasdaq: NVDA), a worldwide leader in graphics and digital media processors, as Premier sponsor of its 2005 TopCoder Collegiate Challenge (TCCC 05).<span class="prHead"> [February 16]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- Devloper Subscriptions --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_021505"><img src="/i/pressroom/tcs_logo.gif" alt="TCS" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_021505">TopCoder Software&#153; Opens Access to Reusable Java&#153; and .NET&#153; Component Catalogs</A></strong></font><br />
                        TopCoder Software today announced TopCoder Software is providing individual member developers free subscriptions to its full catalog of software components.<span class="prHead"> [February 15]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- GICJ05 --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_020905"><img src="/i/pressroom/gicj05_logo.gif" alt="" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_020905">Google Code Jam Comes to India</A></strong></font><br />
                        The Google India Code Jam is an extension of Google's annual Code Jam competition and celebrates the art of computer science, demonstrating to software professionals everywhere the value Google places on excellent coding. <span class="prHead"> [February 9]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- 50,000 --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_020705"><img src="/i/pressroom/50k_promo.gif" alt="" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_020705">TC Community Surpasses 50,000 Worldwide Nears 10,000 Rated Member Mark</A></strong></font><br />
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

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=art_020105"><img src="/i/pressroom/adt_logo.gif" alt="ADT" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=art_020105">DE-CODER: The kings of coding</A></strong></font><br />
                        "Tomek" and "Pops" may be unfamiliar names to you, but in the world of coding competitions, they're as big as rock stars.  Now they're at the top of the stack, according to their peers who participate in online programming contests at TopCoder.com, a mecca for those willing to publicly test their programming chops.<span class="prHead"> [February 1 - ADT]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- CRPF --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_012505"><img src="/i/pressroom/crpf_logo.gif" alt="" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_012505">TCS Delivers for International Consortium of Spinal Cord Injury Researchers</A></strong></font><br />
                        TopCoder today announced it has successfully deployed a high-quality, web-based application to disseminate critical microarray data between the Christopher Reeve Paralysis Foundation's (CRPF) Research Consortium on Spinal Cord Injury and the general scientific community. <span class="prHead"> [January 25]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<%-- TCCC05 MOTOROLA --%>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/tc?module=Static&d1=pressroom&d2=pr_011805"><img src="/i/pressroom/motorola_logo.gif" alt="Motorola" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/tc?module=Static&d1=pressroom&d2=pr_011805">TopCoder&#174; Announces Motorola as Premier Sponsor of 2005 TopCoder Collegiate Challenge</A></strong></font><br />
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