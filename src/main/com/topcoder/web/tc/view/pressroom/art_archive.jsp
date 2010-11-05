<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>TopCoder Press Room</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
    <jsp:param name="key" value="tc_pressroom"/>
    </jsp:include>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
</head>
<body>

<jsp:include page="../top.jsp" >
<jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div align="center">
<%-- YOUR WORK GOES HERE --%>

<%-- pr_wrapper begin --%>
<div id="pr_wrapper">

    <%-- pr_header begin --%>
    <div id="pr_header">
        <h1><a onFocus="this.blur();" href="/tc?module=Static&amp;d1=pressroom&amp;d2=index" name="pr_top">Press Room</a></h1>
    </div>
    <%-- pr_header end --%>

    <%-- pr_menu begin --%>
    <div id="pr_menu">
        <ul>
        <li><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=index" title="Current News"><span>Current News</span></a></li>
        <li><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_archive" title="Press Release Archive"><span>Press Release Archive</span></a></li>
        <li id="pr_menuactive"><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_archive" title="Articles Archive"><span>Articles Archive</span></a></li>
        <li><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=mediaResources" title="Media Resources"><span>Media</span></a></li>
        <li><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=mediaRequestForm" title="Media Request Form"><span>Media Request Form</span></a></li>
        </ul>
    </div>
    <%-- pr_menu end --%>
    <div class="pr_clear"></div>


    <%-- content rounded frame wrapper --%>
    <div id="pr_frame"><div id="pr_frame2"><div id="pr_frame3">

        <div id="pr_content" align="left">
        <div class="pr_subheader">
                <h2><span>2010</span></h2>
            </div>
        
        
        
            <%-- pr_border creation --%>
            <div class="pr_box"><div class="pr_box2"><div class="pr_boxcontent">
            
                <div class="pr_newsarchive">
                    <dl>
                    <dd><a href="http://www.eschoolnews.com/2010/11/04/darpa-funded-project-to-spark-computer-science-education/">DARPA-funded project to spark computer science education<br /><small style="margin-left:10px;">[November 5 - eSchool News]</small></a></dd>
                    <dd><a href="http://www.ibtimes.com/articles/75118/20101023/science-high-school-stem-interest-learning-poptech-topcoder-time-warner-project-lead-the-way-educati.htm">Searching For The Next Generation Of Tech Innovators<br /><small style="margin-left:10px;">[October 25 - International Business Times]</small></a></dd>
                    <dd><a href="http://www.investors.com/NewsAndAnalysis/Article/550124/201010121650/Win-With-Customer-Input.aspx">Win With Customer Input<br /><small style="margin-left:10px;">[October 19 - Investors.com]</small></a></dd>
                    <dd><a href="http://www.informationweek.com/news/software/showArticle.jhtml?articleID=227800070">NASA To Crowdsource Software Development<br /><small style="margin-left:10px;">[October 19 - InformationWeek]</small></a></dd>
                    <dd><a href="http://www.prnewswire.com/news-releases/nasa-establishes-tournament-lab-for-software-developers-104894204.html">NASA Establishes Tournament Lab for Software Developers<br /><small style="margin-left:10px;">[October 19 - PR Newswire]</small></a></dd>
                    <dd><a href="http://gcn.com/articles/2010/10/12/darpa-launches-computer-science-education-program.aspx">DARPA seeks to shape young minds<br /><small style="margin-left:10px;">[October 12 - GCN Government Computer News]</small></a></dd>
                    <dd><a href="http://www.scmagazineus.com/global-village/article/164049/">Testing competitions can improve code, but crowdsourcing brings new concerns to security governance.<br /><small style="margin-left:10px;">[March 1 - SC Magazine]</small></a></dd>
                    <dd><a href="http://www.computer.org/portal/web/buildyourcareer/et13/contests">Developer Contests Abound<br /><small style="margin-left:10px;">[January 8th - IEEE Computer Society]</small></a></dd>
                    </dl>
                </div>
            </div></div></div>
        
        
        <div id="pr_content" align="left">
        <div class="pr_subheader">
                <h2><span>2009</span></h2>
            </div>
        
        
        
            <%-- pr_border creation --%>
            <div class="pr_box"><div class="pr_box2"><div class="pr_boxcontent">
            
                <div class="pr_newsarchive">
                    <dl>
                    <dd><a href="http://www.huffingtonpost.com/tom-luce/educating-our-own-compute_b_242436.html">Educating Our Own Computer Hackers<br /><small style="margin-left:10px;">[August 5th - Huffington Post]</small></a></dd>
                    <dd><a href="/i/pressroom/pdfs/STN_June09.pdf">Competitive Testing: Eyes on the Quality Prize<br /><small style="margin-left:10px;">[June - Software Tech News]</small></a></dd>
                    <dd><a href="/pdfs/press_room/MITSloanMR.pdf">What is Your Management Model?<br /><small style="margin-left:10px;">[February 16th - MIT Sloan]</small></a></dd>
                    <dd><a href="/pdfs/press_room/virtual_workforce.pdf">How The Virtual Workforce is Changing Everything<br /><small style="margin-left:10px;">[January 9th - Linux Insider]</small></a></dd>                  
                    </dl>
                </div>
            </div></div></div>
        
        
            <%-- Yearly Sub Content Container --%>
            <div class="pr_subheader">
                <h2><span>2008</span></h2>
            </div>

            <%-- pr_border creation --%>
            <div class="pr_box"><div class="pr_box2"><div class="pr_boxcontent">

                <div class="pr_newsarchive">
                    <dl>
                    <dt>&nbsp;</dt>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='http://industry.bnet.com/technology/1000470/aol-finds-topcoder-tops/' refer='art_archive' />">AOL Finds TopCoder Tops <br /><small style="margin-left:10px;">[October 17 - BNET]</small></a></dd>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='http://www.pcworld.com/businesscenter/article/152324/topcoder_eyeing_smb_market.html' refer='art_archive' />">TopCoder Eyeing SMB Market <br /><small style="margin-left:10px;">[October 15 - PC World]</small></a></dd>
                    <dd>Cool Programmer Challenge: Football Algorithm = $50,000 [September 19 - CIO] <br /><a target="_blank" href="<tc-webtag:linkTracking link='http://www.cio.com/article/449523/Cool_Programmer_Challenge_Football_Algorithm_' refer='art_archive' />">original article</a> | <a target="_blank" href="/i/pressroom/pdfs/cio_20080919.pdf">PDF</a></dd>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='http://weblog.infoworld.com/stratdev/archives/2008/08/what_does_progr.html' refer='art_archive' />">What does programming have to do with football? <br /><small style="margin-left:10px;">[August 29 - InfoWorld]</small></a></dd>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='/i/pressroom/pdfs/infoworld_20080716.pdf' refer='art_archive' />">Five Web 2.0 dev lessons for enterprise IT [PDF] <br /><small style="margin-left:10px;">[July 17 - InfoWorld]</small></a></dd>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='http://www.managementlab.org/files/LabNotes8.pdf' refer='art_archive' />">TopCoder: open for competition [PDF] <br /><small style="margin-left:10px;">[July 8 - London Business School]</small></a></dd>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='http://www.portfolio.com/careers/job-of-the-week/2008/07/06/Top-Coder-Tomek-Czajka' refer='art_archive' />">The Top Coder <br /><small style="margin-left:10px;">[July 6 - Portfolio.com]</small></a></dd>
                    <dd>Which Side Are You On? [June - THE Journal] <br /><a target="_blank" href="<tc-webtag:linkTracking link='http://www.thejournal.com/articles/22736_2' refer='art_archive' />">original article</a> | <a target="_blank" href="/i/pressroom/pdfs/thejournal_200806.pdf">PDF</a></dd>
                    <dd>Why We All Want to Grow Towards the Sun [May 29 - People Management] <br /><a target="_blank" href="<tc-webtag:linkTracking link='http://www.peoplemanagement.co.uk/pm/articles/2008/05/why-we-all-want-to-grow-towards-the-sun.htm?EmailSent=true' refer='art_archive' />">original article</a> | <a target="_blank" href="/i/pressroom/pdfs/peoplemgmt_20080529.pdf">PDF</a></dd>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='http://blogs.wsj.com/biztech/2008/05/16/keeping-it-simple-pays-for-a-champion-coder/?mod=WSJBlog' refer='art_archive' />">Keeping it Simple Pays for a Champion Coder <br /><small style="margin-left:10px;">[May 16 - WSJ]</small></a></dd>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='http://www.cio.com/article/358813/Where_Programming_Meets_American_Idol' refer='art_archive' />">Where Programming Meets American Idol <br /><small style="margin-left:10px;">[May 15 - CIO]</small></a></dd>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='http://www.computerworld.com/action/article.do?command=viewArticleBasic&articleId=9085562&intsrc=hm_list' refer='art_archive' />">Eli Lilly aims to tap 'rock star' programmers <br /><small style="margin-left:10px;">[May 15 - Computerworld]</small></a></dd>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='http://weblog.infoworld.com/stratdev/archives/2008/05/topcoder_develo.html' refer='art_archive' />">TopCoder: developer productivity and code quality through competition <br /><small style="margin-left:10px;">[May 9 - InfoWorld]</small></a></dd>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='http://www.ddj.com/architect/207404123' refer='art_archive' />">There Must be Contest <br /><small style="margin-left:10px;">[May 1 - Dr. Dobb's Portal]</small></a></dd>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='http://www.ft.com/cms/s/0/2290a6b0-14c6-11dd-a741-0000779fd2ac.html?nclick_check=1' refer='art_archive' />">Working in IT: The tournament approach to finding talent <br /><small style="margin-left:10px;">[April 30 - Financial Times]</small></a></dd>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='http://www.2theadvocate.com/features/18320734.html' refer='art_archive' />">Top programmer, 15, says talent same as sports aptitude <br /><small style="margin-left:10px;">[April 27 - 2theadvocate.com]</small></a></dd>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='/i/pressroom/pdfs/courant_20080416.pdf' refer='art_archive' />">Glastonbury Firm's Online Software Contests Attract High-Rolling Sponsors <br /><small style="margin-left:10px;">[April 16 - Courant.com]</small></a></dd>
                    <dd>TopCoder's network drives innovation [April 15 - PricewaterhouseCoopers] <br /><a target="_blank" href="<tc-webtag:linkTracking link='http://www.globalbestpractices.com/Home/Document.aspx?Q=273,4383,205,3FB60597-A4BD-47AA-9F61-3E96E6E3E10D' refer='art_archive' />">original article</a> | <a target="_blank" href="/i/pressroom/pdfs/pwc_20080415.pdf">PDF</a></dd>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='http://blogs.zdnet.com/enterprisealley/?p=124' refer='art_archive' />">TopCoder: breaking the development cost rules <br /><small style="margin-left:10px;">[March 25 - ZDNet]</small></a></dd>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='http://reddevnews.com/qandas/article.aspx?editorialsid=123' refer='art_archive' />">Open Counsel <br /><small style="margin-left:10px;">[March 24 - Redmond Developer News]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_032408">Multicore boom needs new developer skills <br /><small style="margin-left:10px;">[March 24 - washingtonpost.com]</small></a></dd>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='http://www.networkworld.com/news/2008/031708-china-us-and-poland-take.html' refer='art_archive' />">China, US and Poland take high-school coding prizes <br /><small style="margin-left:10px;">[March 17 - Network World]</small></a></dd>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='http://www.sdtimes.com/content/article.aspx?ArticleID=31779' refer='art_archive' />">Not Your Father's Outsourcing <br /><small style="margin-left:10px;">[March 10 - SD Times]</small></a></dd>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='http://www.computerworld.com/action/article.do?command=viewArticleBasic&articleId=9057899&source=NLT_AM&nlid=1' refer='art_archive' />">Rock star coders <br /><small style="margin-left:10px;">[January 22 - Computerworld]</small></a></dd>
                    <dd>Gaming the System [January 3 - CFO.com] <br /><a target="_blank" href="<tc-webtag:linkTracking link='http://www.cfo.com/article.cfm/10345535/c_10346944?f=magazine_alsoinside' refer='art_archive' />">original article</a> | <a target="_blank" href="/i/pressroom/pdfs/cfo_20080103_v2.pdf">PDF</a></dd>
                    </dl>
                </div>

                <p class="pr_backtop"><a href="#pr_top">Back to Top</a></p>
                <div class="pr_clear"></div>

            </div></div></div>
            <%-- Yearly Container end --%>
            

            <%-- Yearly Sub Content Container --%>
            <div class="pr_subheader">
                <h2><span>2007</span></h2>
            </div>

            <%-- pr_border creation --%>
            <div class="pr_box"><div class="pr_box2"><div class="pr_boxcontent">

                <div class="pr_newsarchive">
                    <dl>
                    <dt>&nbsp;</dt>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='http://www.networkworld.com/podcasts/panorama/2007/122007pan-topcoder.html' refer='art_archive' />">Coder contests drive app development [PODCAST] <br /><small style="margin-left:10px;">[December 21 - Network World]</small></a></dd>
                    <dd>Eight business technology trends to watch [December 12 - The McKinsey Quarterly] <br /><a target="_blank" href="<tc-webtag:linkTracking link='http://www.mckinseyquarterly.com/article_abstract_visitor.aspx?ar=2080&l2=13&l3=11' refer='art_archive' />">original article</a> | <a target="_blank" href="/i/pressroom/pdfs/mckinsey_20071212.pdf">PDF</a></dd>
                    <dd>Should your company 'crowdsource' its next project? [December 6 - Computerworld] <br /><a target="_blank" href="<tc-webtag:linkTracking link='http://www.computerworld.com/action/article.do?command=viewArticleBasic&articleId=9050920&pageNumber=1' refer='art_archive' />">original article</a> | <a target="_blank" href="/i/pressroom/pdfs/computerworld_20071206.pdf">PDF</a></dd>
                    <dd>Contested Code [December 4 - Redmond Developer News] <br /><a target="_blank" href="<tc-webtag:linkTracking link='http://reddevnews.com/features/article.aspx?editorialsid=2387' refer='art_archive' />">original article</a> | <a target="_blank" href="/i/pressroom/pdfs/rdn_20071204.pdf">PDF</a></dd>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='http://www.russiatoday.ru/news/news/16968' refer='art_archive' />">Russian computer whiz crowned world's best <br /><small style="margin-left:10px;">[November 15 - Russia Today]</small></a></dd>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='http://thedaily.washington.edu/article/2007/11/9/uwSeniorWinsNationalCodingCompetition' refer='art_archive' />">UW senior wins national coding competition <br /><small style="margin-left:10px;">[November 9 - The Daily | University of Washington]</small></a></dd>
                    <dd>Russian programmer twice the best worldwide [November 8 - CNews] <br /><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_110807">English translation</a>&#160;|&#160;<a target="_blank" href="<tc-webtag:linkTracking link='http://www.cnews.ru/news/top/index.shtml?2007/11/07/273856' refer='art_archive' />">original article</a></dd>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='http://seattletimes.nwsource.com/html/localnews/2003991315_coder03m.html' refer='art_archive' />">Skilled at code, he wins a load <br /><small style="margin-left:10px;">[November 6 - The Seattle Times]</small></a></dd>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='http://www.orlandosentinel.com/community/news/lakebuenavista/orl-topcoder0207nov02,0,4540773.story' refer='art_archive' />">Computer coders vie for $260,000 in prize money (with video) <br /><small style="margin-left:10px;">[November 2 - Orlando Sentinel]</small></a></dd>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='http://www.orlandosentinel.com/business/orl-bk-topcoder110107,0,3810238.story?coll=orl_tab01_layout' refer='art_archive' />">Local eliminated, but TopCoder Collegiate Challenge continues <br /><small style="margin-left:10px;">[November 1 - Orlando Sentinel]</small></a></dd>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='http://www.nytimes.com/idg/IDG_002570DE00740E1800257384005A2F1F.html?ref=technology' refer='art_archive' />">College Coders Vie for Cash in Contest <br /><small style="margin-left:10px;">[November 1 - The New York Times]</small></a></dd>
                    <dd>TopCoder Finds Tech Top Guns [October 31 - Investor's Business Daily] <br /><a target="_blank" href="<tc-webtag:linkTracking link='http://www.thefreelibrary.com/TopCoder+Finds+Tech+Top+Guns-a01610910252' refer='art_archive' />">article</a> | <a target="_blank" href="<tc-webtag:linkTracking link='http://www.investors.com/editorial/IBDArticles.asp?artsec=17&artnum=1&issue=20071026' refer='art_archive' />">original article</a> | <a target="_blank" href="/i/pressroom/pdfs/ibd_20071031.pdf">PDF</a></dd>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='http://archives.seattletimes.nwsource.com/cgi-bin/texis.cgi/web/vortex/display?slug=coder31m&date=20071031&query=michael+skinner' refer='art_archive' />">Whose mouse is mightiest? UW code whiz hopes it's his <br /><small style="margin-left:10px;">[October 31 - The Seattle Times]</small></a></dd>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='http://www.publicbroadcasting.net/wnpr/news.newsmain?action=article&ARTICLE_ID=1139736' refer='art_archive' />">6 State companies among fastest growing <br /><small style="margin-left:10px;">[August 23 - WNPR]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_080207">Fox TV: "Top Computer Programmers Compete" <br /><small style="margin-left:10px;">[August 2 - Fox TV Chicago]</small></a></dd>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='/pdfs/press_room/computerworld_20070709.pdf' refer='art_archive' />">Programming's Crack Competitor <br /><small style="margin-left:10px;">[PDF] [July 11 - Computerworld]</small></a></dd>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='http://technology.guardian.co.uk/opinion/story/0,,2120402,00.html' refer='art_archive' />">Bill Taylor on big ideas <br /><small style="margin-left:10px;">[July 10 - Guardian Unlimited]</small></a></dd>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='http://www.computerworld.com.au/index.php/id;1241090047;fp;2;fpid;1' refer='art_archive' />">Outsourcing the eBay way <br /><small style="margin-left:10px;">[June 15 - Computerworld]</small></a></dd>
                    <dd><a target="_blank" href="http://www.usatoday.com/tech/techinvestor/industry/2007-03-13-google-poland_N.htm">Why Google put a research lab in Poland <br /><small style="margin-left:10px;">[March 13 - USA Today]</small></a></dd>
                    <dd><a target="_blank" href="http://www.businessweek.com/print/innovate/content/feb2007/id20070215_251519.htm">Ideagora, a Marketplace for Minds <br /><small style="margin-left:10px;">[February 15 - BusinessWeek]</small></a></dd>
                    <dd><a target="_blank" href="http://www.computerworld.com/action/article.do?command=viewArticleBasic&taxonomyId=11&articleId=9011098&intsrc=hm_topic">Microsoft launches 'mashup' competition for developers <br /><small style="margin-left:10px;">[February 14 - Computerworld]</small></a></dd>
                    </dl>
                </div>

                <p class="pr_backtop"><a href="#pr_top">Back to Top</a></p>
                <div class="pr_clear"></div>

            </div></div></div>
            <%-- Yearly Container end --%>


            <%-- Yearly Sub Content Container --%>
            <div class="pr_subheader">
                <h2><span>2006</span></h2>
            </div>

            <%-- pr_border creation --%>
            <div class="pr_box"><div class="pr_box2"><div class="pr_boxcontent">

                <div class="pr_newsarchive">
                    <dl>
                    <dt>&nbsp;</dt>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='/pdfs/press_room/hre_article_20061213.pdf' refer='art_archive' />">And the Winner Is&#8230; <br /><small style="margin-left:10px;">[PDF] [December 13 - Human Resource Executive Magazine]</small></a></dd>
                    <dd><a target="_blank" href="http://www.chinadaily.com.cn/china/2006-12/08/content_754200.htm">Undergraduate VP of multinational company <br /><small style="margin-left:10px;">[December 8 - China Daily]</small></a></dd>
                    <dd><a target="_blank" href="/pdfs/press_room/ieeeSoftware_20061206.pdf">Programming Contests Show Impressive Growth <br /><small style="margin-left:10px;">[PDF] [December 6 - IEEE Software]</small></a></dd>
                    <dd><a target="_blank" href="/pdfs/press_room/success200612.pdf">Maverick Rules for Success <br /><small style="margin-left:10px;">[PDF] [November - Success]</small></a></dd>
                    <dd><a target="_blank" href="http://www.internetnews.com/dev-news/article.php/3644456">Who is the Top Coder? <br /><small style="margin-left:10px;">[November 17 - internetnews.com]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_110206">A Growing Cadre Of Code Warriors <br /><small style="margin-left:10px;">[November 2 - BusinessWeek]</small></a></dd>
                    <dd><a target="_blank" href="http://www.csmonitor.com/2006/1101/p01s04-usec.htm">How to build software? Henry Ford, meet eBay. <br /><small style="margin-left:10px;">[November 1 - Christian Science Monitor]</small></a></dd>
                    <dd><a target="_blank" href="http://gigaom.com/2006/10/23/the-new-american-idol-the-coder/">The New American Idol&#8230; The Coder <br /><small style="margin-left:10px;">[October 24 - gigaOm]</small></a></dd>
                    <dd><a target="_blank" href="http://www.wallstreetandtech.com/showArticle.jhtml;jsessionid=0U21ZF2KMDLJYQSNDLPCKHSCJUNN2JVN?articleID=193400878"><em>Wall Street &amp; Technology</em> on TopCoder and UBS <br /><small style="margin-left:10px;">[October 23 - Wall Street &amp; Technology]</small></a></dd>
                    <dd>TopCoder helps "free" AOL &#160; [October 10 - Information Week] <br /><a target="_blank" href="/i/pressroom/infoweek_excerpt.gif">excerpt</a>&#160;|&#160;<a target="_blank" href="http://www.informationweek.com/internet/showArticle.jhtml?articleID=193104723">full story</a></dd>
                    <dd>TopCoder featured on public radio's "Open Source" [PODCAST] &#160; [October 4 - Open Source] <br /><a target="_blank" href="/audio/open_source_060928_24kb.mp3">lo 6.8mb</a> &#160;|&#160;<a target="_blank" href="/audio/open_source_060928_48kb.mp3">hi 13.8mb</a> &#160;|&#160;<a target="_blank" href="/i/downloads/mavericks_at_work.pdf">Mavericks at Work excerpt</a> [PDF]</dd>
                    <dd><em>Mass High Tech</em> features TopCoder staff &#160; [July 12 - Mass High Tech] <br /><a target="_blank" href="http://masshightech.bizjournals.com/masshightech/stories/2006/07/10/focus1.html">Code Commanders</a>&#160;|&#160;<a target="_blank" href="http://masshightech.bizjournals.com/masshightech/stories/2006/07/10/focus6.html">TheFaxman Codeth</a>&#160;|&#160;<a target="_blank" href="http://masshightech.bizjournals.com/masshightech/stories/2006/07/10/focus8.html">Identifying Best Developers</a></dd>
                    <dd><a target="_blank" href="http://media32b.libsyn.com/aHeceJl2a3eTdmd2bHOcq5qkZnaZ/podcasts/dickwall/JavaPosse065.mp3">Java Posse - Interviews from TopCoder and Java One <br /><small style="margin-left:10px;">[PODCAST] [July 5 - Java Posse]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_051606">Gartner cites TopCoder as model for "Web 2.0" community <br /><small style="margin-left:10px;">[May 16 - Gartner]</small></a></dd>
                    <dd><a target="_blank" href="http://garyflood.itweek.co.uk/2006/05/idol_or_idle_wh.html">Idol or idle: which one are you? <br /><small style="margin-left:10px;">[May 15 - IT Week]</small></a></dd>
                    <dd><a target="_blank" href="/movies/press/cnbc_051506.mov">CNBC's Jane's Addiction and Squawk Box at the TCO06 <br /><small style="margin-left:10px;">[MOVIE] [May 15 - CNBC TV]</small></a></dd>
                    <dd><a target="_blank" href="http://media31b.libsyn.com/bXdveMh1nHzGfGd1mHluo2%2BlkXWb/podcasts/dickwall/JavaPosse053.mp3">Java Posse - Listener Feedback and TopCoder Interviews <br /><small style="margin-left:10px;">[PODCAST] [May 15 - Java Posse]</small></a></dd>
                    <dd><a target="_blank" href="http://www.themoscowtimes.com/stories/2006/05/11/042.html">Russian Talents Shine in IT Contests <br /><small style="margin-left:10px;">[May 11 - The Moscow Times]</small></a></dd>
                    <dd><a target="_blank" href="http://media32b.libsyn.com/a3edeJR1nnyUeGx8bXttpWytZHKZ/podcasts/dickwall/JavaPosse054.mp3">Java Posse - Live at the TopCoder Open <br /><small style="margin-left:10px;">[PODCAST] [May 11 - Java Posse]</small></a></dd>
                    <dd><a target="_blank" href="http://www.computerworld.com/action/article.do?command=viewArticleBasic&articleId=9000323">Programming contest garners enterprise interest <br /><small style="margin-left:10px;">[May 10 - Computerworld]</small></a></dd>
                    <dd><a target="_blank" href="/?t=sponsor&c=link&link=http://webreprints.djreprints.com/1466111183234.html">Cause for Concern? Americans Are Scarce In Top Tech Contest <br /><small style="margin-left:10px;">[May 10 - Wall Street Journal]</small></a></dd>
                    <dd><a target="_blank" href="http://media41b.libsyn.com/mHdxeJp1cXvHfZd5anptq26sZXGb/podcasts/dickwall/JavaPosse052.mp3">Java Posse - Jack Hughes interview from the TCO06 <br /><small style="margin-left:10px;">[PODCAST] [May 4 - Java Posse]</small></a></dd>
                    <dd><a target="_blank" href="http://news.com.com/Coding+for+fame%2C+and+dollars/2100-1007_3-6067549.html?tag=nefd.lede">Coding for fame, and dollars <br /><small style="margin-left:10px;">[May 2 - CNET]</small></a></dd>
                    <dd><a target="_blank" href="http://www.cs.uga.edu/~acm/topcoder.html">TopCoder College Tour: Report from University of Georgia <br /><small style="margin-left:10px;">[April 5 - UGA - ACM]</small></a></dd>
                    <dd><a target="_blank" href="http://www.whitworth.edu/Students/Whitworthian/V96/I14/Students-compete-in-online-competition.html">Students compete in online competition <br /><small style="margin-left:10px;">[March 30 - The Whitworthian]</small></a></dd>
                    <dd><a target="_blank" href="http://www.adtmag.com/article.aspx?id=18109">SOA vendors partner with LogicLibrary to create integrated governance platform <br /><small style="margin-left:10px;">[March 14 - ADT]</small></a></dd>
                    <dd><a target="_blank" href="http://www.wallstreetandtech.com/showArticle.jhtml?articleID=181502379">UBS Sponsors TopCoder Open <br /><small style="margin-left:10px;">[March 13 - Wall Street &amp; Technology]</small></a></dd>
                    <dd><a target="_blank" href="http://www.dnaindia.com/report.asp?NewsID=1017289&CatID=2">Code jockey contest returns to IT hub <br /><small style="margin-left:10px;">[March 13 - DNA India]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_031006">Exclusive: Interview with Pat Conley, VP VeriSign O&amp;I and TopCoder Member <br /><small style="margin-left:10px;">[March 10]</small></a></dd>
                    <dd><a target="_blank" href="http://thepost.baker.ohiou.edu/show_news.php?article=N3&date=030806">Gurus compete in coding competition <br /><small style="margin-left:10px;">[March 8 - The Post Online]</small></a></dd>
                    <dd><a target="_blank" href="http://www.thespartandaily.com/media/paper852/news/2006/02/16/News/Sjsu-Codes.A.Win-1616451.shtml?norewrite&sourcedomain=www.thespartandaily.com">SJSU codes a win <br /><small style="margin-left:10px;">[February 16 - Spartan Daily]</small></a></dd>
                    <dd><a target="_blank" href="http://webreprints.djreprints.com/1404341094425.html">Programming Contest Pits World's Top Geeks In Battles Over Coding <br /><small style="margin-left:10px;">[February 8 - Wall Street Journal]</small></a></dd>
                    <dd><a target="_blank" href="http://www.javaposse.com/media/dickwall/JavaPosse026.mp3">Java Posse - Bill Goggin interview <br /><small style="margin-left:10px;">[PODCAST] [January 20 - Java Posse]</small></a></dd>
                    <dd><a target="_blank" href="http://www.businessweek.com/magazine/content/06_04/b3968007.htm">The NSA: Security in Numbers <br /><small style="margin-left:10px;">[January 13 - BusinessWeek]</small></a></dd>
                    <dd><a target="_blank" href="http://dnaindia.com/report.asp?NewsID=1007225&CatID=2">Contest a coded message for job seekers <br /><small style="margin-left:10px;">[January 12 - DNA India]</small></a></dd>
                    <dd><a target="_blank" href="http://www.inc.com/magazine/20060101/handson-global.html">Put a hacker to work <br /><small style="margin-left:10px;">[January 2006 - Inc. Magazine]</small></a></dd>
                    </dl>
                </div>

                <p class="pr_backtop"><a href="#pr_top">Back to Top</a></p>
                <div class="pr_clear"></div>

            </div></div></div>
            <%-- Yearly Container end --%>


            <%-- Yearly Sub Content Container --%>
            <div class="pr_subheader">
                <h2><span>2005</span></h2>
            </div>

            <%-- pr_border creation --%>
            <div class="pr_box"><div class="pr_box2"><div class="pr_boxcontent">

                <div class="pr_newsarchive">
                    <dl>
                    <dt>&nbsp;</dt>
                    <dd><a target="_blank" href="http://www.forbes.com/home/work/2005/12/09/silicon-valley-hiring-cx_rr_1212hire.html">Help Wanted In Silicon Valley <br /><small style="margin-left:10px;">[December 12 - Forbes]</small></a></dd>
                    <dd><a target="_blank" href="http://www.businessweek.com/magazine/content/05_50/b3963021.htm">Rise Of A Powerhouse <br /><small style="margin-left:10px;">[December 2 - BusinessWeek]</small></a></dd>
                    <dd><a target="_blank" href="/pdfs/press_room/usatoday_113005.pdf">TopCoder Survey in USA Today <br /><small style="margin-left:10px;">[PDF] [November 30 - USA Today]</small></a></dd>
                    <dd><a target="_blank" href="http://www.infoworld.com/article/05/11/22/HNgooglecompetition_1.html">Google to hold programming competition in China <br /><small style="margin-left:10px;">[November 22 - InfoWorld]</small></a></dd>
                    <dd><a target="_blank" href="http://www.ftponline.com/weblogger/forum.aspx?ID=13&DATE=11/01/2005&blog=#449">Spirited Reusable Component Development <br /><small style="margin-left:10px;">[November 1 - FTP Online]</small></a></dd>
                    <dd><a target="_blank" href="http://www.informationweek.com/showArticle.jhtml?articleID=172901456">Winning Design Ways <br /><small style="margin-left:10px;">[October 31 - Information Week]</small></a></dd>
                    <dd><a target="_blank" href="http://www.masshightech.com/displayarticledetail.asp?Art_ID=69982">Sorrowful state of software <br /><small style="margin-left:10px;">[October 17 - MHT]</small></a></dd>
                    <dd><a target="_blank" href="http://www.carynews.com/enterprise/story/2805639p-9249369c.html">Ready, again, for TopCoder battle <br /><small style="margin-left:10px;">[September 28 - CN]</small></a></dd>
                    <dd><a target="_blank" href="/pdfs/press_room/dndj_082005.pdf">Engineering + Reuse = Savings <br /><small style="margin-left:10px;">[August - DNDJ]</small></a></dd>
                    <dd>Poland Takes the Lead [September 12 - PCWK] <br /><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_091205">English translation</a>&#160;|&#160;<a target="_blank" href="http://www.pcworld.pl/news/82941.html">original article</a></dd>
                    <dd><a target="_blank" href="http://www.adtmag.com/article.asp?id=11752">Components for SOAs and Other App Dev Projects <br /><small style="margin-left:10px;">[September 7 - ADT]</small></a></dd>
                    <dd><a target="_blank" href="http://timesofindia.indiatimes.com/articleshow/1212895.cms">Wanna codejam? May the best techie win <br /><small style="margin-left:10px;">[August 28 - Times of India]</small></a></dd>
                    <dd><a target="_blank" href="/pdfs/press_room/cnn_072105.pdf">On your marks, get set, code! <br /><small style="margin-left:10px;">[July 21]</small></a></dd>
                    <dd><a target="_blank" href="http://www.roanoke.com/business%5C24837.html">Geeks for Charity holds code to help New River charities <br /><small style="margin-left:10px;">[June 4 - Roanoke.com]</small></a></dd>
                    <dd><a target="_blank" href="http://www.sourcingmag.com/home/home.aspx?i=18_6/3/2005_cn_507_2_00_00">How To Hire Best-of-Breed Programmers for Your Project <br /><small style="margin-left:10px;">[June 2 - Sourcing Mag]</small></a></dd>
                    <dd><a target="_blank" href="http://www.queensjournal.ca/articlephp/point-vol133/issue1/news/story1">Computer programmer wins big <br /><small style="margin-left:10px;">[May 24 - QU The Journal]</small></a></dd>
                    <dd><a target="_blank" href="http://www.boilerstation.com/planet/stories/200505160purdue_planet1116219600.shtml">Purdue computer programmer making his mark in competitions <br /><small style="margin-left:10px;">[May 16 - Boiler Station]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_051205">Interview with Jack Hughes <br /><small style="margin-left:10px;">[April 22 - The Wall Street Transcript]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_042205">How Google Searches - For Talent <br /><small style="margin-left:10px;">[April 22 - BusinessWeek]</small></a></dd>
                    <dd><a target="_blank" href="http://www.sys-con.com/story/?storyid=49134">LogicLibrary Checks Out TopCoder to Enable SOA <br /><small style="margin-left:10px;">[April 9 - .NET Developer's Journal]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_040805">Code Warriors <br /><small style="margin-left:10px;">[April 8 - Chronicle of Higher Education]</small></a></dd>
                    <dd><a target="_blank" href="/i/pressroom/040105.pdf">University computer whiz wins big at tech tourney <br /><small style="margin-left:10px;">[April 1 - Barrhaven Independent]</small></a></dd>
                    <dd><a target="_blank" href="http://www.computeruser.com/articles/2404,1,1,1,0401,05.html">Do you have what it takes? <br /><small style="margin-left:10px;">[April - ComputerUser]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_021305">Program for life <br /><small style="margin-left:10px;">[February 13 - NewsWeek Poland]</small></a></dd>
                    <dd><a target="_blank" href="http://www.wired.com/news/medtech/0,1286,66458,00.html?tw=wn_tophead_1">Software Taming Gene Data Pool <br /><small style="margin-left:10px;">[February 2 - Wired]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_020105">DE-CODER: The kings of coding <br /><small style="margin-left:10px;">[February 1 - ADT]</small></a></dd>
                    <dd><a target="_blank" href="http://www.computerworld.com/industrytopics/financial/story/0,10801,98834,00.html">Code Reuse Pays Off for ING <br /><small style="margin-left:10px;">[January 10 - Computerworld]</small></a></dd>
                    </dl>
                </div>

                <p class="pr_backtop"><a href="#pr_top">Back to Top</a></p>
                <div class="pr_clear"></div>

            </div></div></div>
            <%-- Yearly Container end --%>


            <%-- Yearly Sub Content Container --%>
            <div class="pr_subheader">
                <h2><span>2004</span></h2>
            </div>

            <%-- pr_border creation --%>
            <div class="pr_box"><div class="pr_box2"><div class="pr_boxcontent">

                <div class="pr_newsarchive">
                    <dl>
                    <dt>&nbsp;</dt>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_120304">Top coders seek bigger prize than cash <br /><small style="margin-left:10px;">[December 3 - SCMP]</small></a></dd>
                    <dd><a target="_blank" href="/i/pressroom/cnn_110404.pdf">Brain teasers help Google recruit workers <br /><small style="margin-left:10px;">[November 4 - CNN]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_102504">Google's creative search for elite programmers <br /><small style="margin-left:10px;">[October 25 - Miami Herald]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_101904">Google holds coding contest <br /><small style="margin-left:10px;">[October 19 - SJ Mercury]</small></a></dd>
                    <dd><a target="_blank" href="/i/pressroom/tendances_tomek.pdf">Dream Job and Juicy Premiums for Young, Crackshot Programmers <br /><small style="margin-left:10px;">[Translation] [October]</small></a></dd>
                    <dd><a target="_blank" href="http://www.newsforge.com/article.pl?sid=04/09/30/187225">Coders win, winners code <br /><small style="margin-left:10px;">[October 5 - NewsForge]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_100304">Triple Threat <br /><small style="margin-left:10px;">[October - Software Development Magazine]</small></a></dd>
                    <dd><a target="_blank" href="http://www.brainerddispatch.com/stories/100204/bus_1002040018.shtml">Hometown hero <br /><small style="margin-left:10px;">[October 2 - Brainerd Dispatch]</small></a></dd>
                    <dd><a target="_blank" href="http://searchcio.techtarget.com/originalContent/0,289142,sid19_gci1006375,00.html">Outsourcing trend touches independents, too <br /><small style="margin-left:10px;">[September 15 - Search CIO]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_081004">Better than You: King of code <br /><small style="margin-left:10px;">[August 10 - Red Herring]</small></a></dd>
                    <dd><a target="_blank" href="http://www.devx.com/Java/Article/21602">The Smart Choice for Smart Clients: J2EE or .NET? <br /><small style="margin-left:10px;">[July 27 - devX]</small></a></dd>
                    <dd><a target="_blank" href="http://www.computerworld.com/managementtopics/outsourcing/story/0,10801,94452,00.html">BearingPoint Move Raises China's Profile <br /><small style="margin-left:10px;">[July 12 - Computerworld]</small></a></dd>
                    <dd><a target="_blank" href="http://builder.com.com/5100-6370_14-5260946.html">CNET engineer wins JavaOne Coding Challenge <br /><small style="margin-left:10px;">[July 9 - Builder.com]</small></a></dd>
                    <dd><a target="_blank" href="http://java.sun.com/javaone/top_coder.html">JavaOne Coding Challenge: Meet the Best <br /><small style="margin-left:10px;">[July 1 - Sun]</small></a></dd>
                    <dd><a target="_blank" href="/i/pressroom/FastCompany0704.pdf">"There are good people everywhere" <br /><small style="margin-left:10px;">[July - Fast Company]</small></a></dd>
                    <dd><a target="_blank" href="http://www.masshightech.com/displayarticledetail.asp?art_id=65934">Focus on software talent <br /><small style="margin-left:10px;">[June 21 - Mass High Tech]</small></a></dd>
                    <dd><a target="_blank" href="http://java.sun.com/developer/technicalArticles/Programming/TopCoder2004/">Who's the Best Coder? <br /><small style="margin-left:10px;">[June - Sun]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_060104">Cracking the Hiring Code <br /><small style="margin-left:10px;">[June 1 - Workforce Management]</small></a></dd>
                    <dd><a target="_blank" href="http://online.wsj.com/article_email/0,,SB108605863196125506-IVjeoNllaV3nJunZXSGcaaBm4,00.html">Win in a Corporate Competition, Land on Square That Offers a Job <br /><small style="margin-left:10px;">[June 1 - WSJ]</small></a></dd>
                    <dd><a target="_blank" href="http://www.upi.com/view.cfm?StoryID=20040525-104135-2776r">The Web: Search engine wars flare online <br /><small style="margin-left:10px;">[May 26 - UPI]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_042904">And The Champion Coders Are... <br /><small style="margin-left:10px;">[April 29 - BusinessWeek]</small></a></dd>
                    <dd><a target="_blank" href="http://biz.yahoo.com/prnews/040422/dcth080_1.html">ASA Honors Po-Shen Loh <br /><small style="margin-left:10px;">[April 22 - Yahoo!]</small></a></dd>
                    <dd><a target="_blank" href="http://www.tmcnet.com/usubmit/2004/Apr/1033792.htm">Java Technology Spreads Like Wildfire at JavaOne <br /><small style="margin-left:10px;">[April 21 - TMCNET]</small></a></dd>
                    <dd><a target="_blank" href="http://www.businessweek.com/technology/content/apr2004/tc20040413_3592_tc146.htm">Hiring Techies Is as Tricky as Ever <br /><small style="margin-left:10px;">[April 13 - BusinessWeek]</small></a></dd>
                    <dd><a target="_blank" href="http://www.fortune.com/fortune/print/0,15935,594536,00.html">Geek Gods <br /><small style="margin-left:10px;">[March 5 - Fortune]</small></a></dd>
                    <dd><a target="_blank" href="http://www.masshightech.com/displayarticledetail.asp?art_id=64966&cat_id=3">Regional programmers take the TopCoder challenge <br /><small style="margin-left:10px;">[March 1 - Mass High Tech]</small></a></dd>
                    <dd><a target="_blank" href="http://www.computerworld.com/developmenttopics/development/story/0,10801,89274,00.html?SKC=development-89274">Standards penetrate telecom industry <br /><small style="margin-left:10px;">[January 26 - Computerworld]</small></a></dd>
                    <dd><a target="_blank" href="http://www.digitaljournal.com/news/?articleID=3913">World's Top Coder Takes Home $50,000 in Computing Contest <br /><small style="margin-left:10px;">[January 9 - Digital Journal.com]</small></a></dd>
                    <dd><a target="_blank" href="http://gazette.gmu.edu/articles/index.php?id=5180">George Mason Student Wins Third Place in International Coding Competition <br /><small style="margin-left:10px;">[January 9 - Mason Gazette]</small></a></dd>
                    </dl>
                </div>

                <p class="pr_backtop"><a href="#pr_top">Back to Top</a></p>
                <div class="pr_clear"></div>

            </div></div></div>
            <%-- Yearly Container end --%>


            <%-- Yearly Sub Content Container --%>
            <div class="pr_subheader">
                <h2><span>2003</span></h2>
            </div>

            <%-- pr_border creation --%>
            <div class="pr_box"><div class="pr_box2"><div class="pr_boxcontent">

                <div class="pr_newsarchive">
                    <dl>
                    <dt>&nbsp;</dt>
                    <dd><a target="_blank" href="http://newsobserver.com/business/technology/story/3118862p-2824913c.html">Cary coder wins contest's top prize <br /><small style="margin-left:10px;">[December 10 - News &amp; Observer]</small></a></dd>
                    <dd><a target="_blank" href="http://archives.seattletimes.nwsource.com/cgi-bin/texis.cgi/web/vortex/display?c=1&slug=btdownload08&date=20031208&query=geek+olympics">'Geek Olympics' features 2 locals <br /><small style="margin-left:10px;">[December 8 - Seattle Times]</small></a></dd>
                    <dd><a target="_blank" href="http://www.theage.com.au/articles/2003/12/08/1070732124037.html">NT programmer wins developer's coding competition <br /><small style="margin-left:10px;">[December 8 - The Age]</small></a></dd>
                    <dd><a target="_blank" href="http://www.intelligententerprise.com/031210/619celko1_1.shtml">Code Confessions <br /><small style="margin-left:10px;">[December 8 - Intelligent Enterprise]</small></a></dd>
                    <dd><a target="_blank" href="http://www.bayarea.com/mld/mercurynews/business/7269666.htm">Google puts coders to the test <br /><small style="margin-left:10px;">[November 15 - SJM]</small></a></dd>
                    <dd><a target="_blank" href="http://www.masshightech.com/displayarticledetail.asp?Art_ID=63819">A Call for Leadership <br /><small style="margin-left:10px;">[October 20 - MHT]</small></a></dd>
                    <dd><a target="_blank" href="http://www.cio.com/archive/101503/tl_winner.html">Winner's Circle for Sale <br /><small style="margin-left:10px;">[October 15 - CIO]</small></a></dd>
                    <dd><a target="_blank" href="http://msn-cnet.com.com/2100-1032_3-5078400.html">Google seeking a few good code jockeys <br /><small style="margin-left:10px;">[September 17 - CNET News.com]</small></a></dd>
                    <dd><a target="_blank" href="http://www.cio.com/archive/091503/staffsurvey.html">What They're Saying About You <br /><small style="margin-left:10px;">[September 15 - CIO]</small></a></dd>
                    <dd><a target="_blank" href="http://www.sdtimes.com/cols/industrywatch_078.htm">Battle royal for jobs <br /><small style="margin-left:10px;">[May 15 - SD Times]</small></a></dd>
                    <dd><a target="_blank" href="http://www.devx.com/Java/Article/12009">International Collegiate Programming Champion talks shop <br /><small style="margin-left:10px;">[April 23 - DevX]</small></a></dd>
                    <dd><a target="_blank" href="http://developer.java.sun.com/developer/technicalArticles/Programming/TopCoder/">TopCoders Vie For College Crown <br /><small style="margin-left:10px;">[April 17 - java.sun.com]</small></a></dd>
                    <dd><a target="_blank" href="http://www.princeton.edu/~seasweb/eqnews/spring03/feature8.html">Newlyweds earn nest egg <br /><small style="margin-left:10px;">[April 13 - Princeton EQuad News]</small></a></dd>
                    <dd><a target="_blank" href="http://archives.seattletimes.nwsource.com/cgi-bin/texis.cgi/web/vortex/display?slug=smart010&date=20030201&query=PLU+Grad">Ex-slacker, PLU Grad is world's smartest guy <br /><small style="margin-left:10px;">[February 2 - Seattle Times]</small></a></dd>
                    </dl>
                </div>

                <p class="pr_backtop"><a href="#pr_top">Back to Top</a></p>
                <div class="pr_clear"></div>

            </div></div></div>
            <%-- Yearly Container end --%>


            <%-- Yearly Sub Content Container --%>
            <div class="pr_subheader">
                <h2><span>2002</span></h2>
            </div>

            <%-- pr_border creation --%>
            <div class="pr_box"><div class="pr_box2"><div class="pr_boxcontent">

                <div class="pr_newsarchive">
                    <dl>
                    <dt>&nbsp;</dt>
                    <dd><a target="_blank" href="http://www.computerworld.com/careertopics/careers/story/0,10801,76488,00.html">Need Coders? <br /><small style="margin-left:10px;">[December 9 - Computerworld]</small></a></dd>
                    <dd><a target="_blank" href="http://www.computerworld.com/careertopics/careers/story/0,10801,76427,00.html">And the Winner Is... <br /><small style="margin-left:10px;">[December 9 - Computerworld]</small></a></dd>
                    <dd><a target="_blank" href="http://www.mndaily.com/article.php?id=4148">U computer programmers take first place in contest <br /><small style="margin-left:10px;">[November 18 - The Minnesota Daily]</small></a></dd>
                    <dd><a target="_blank" href="http://builder.com.com/article.jhtml?id=u00220021106adm01.htm&rcode=&page=1">You'll find more than competitions at TopCoder these days <br /><small style="margin-left:10px;">[November 13 - Builder.com]</small></a></dd>
                    <dd><a target="_blank" href="http://www.informationweek.com/story/IWK20021018S0027">FBI Tries E-Recruiting <br /><small style="margin-left:10px;">[October 21 - InformationWeek]</small></a></dd>
                    <dd><a target="_blank" href="http://www.informationweek.com/story/IWK20021014S0002">A Chance To Win A Contest And A Job <br /><small style="margin-left:10px;">[October 14 - InformationWeek]</small></a></dd>
                    <dd><a target="_blank" href="http://www.business2.com/articles/mag/0,1640,42225,00.html">Show Me the C++ <br /><small style="margin-left:10px;">[August 7 - Business2.0]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_050102">And the winner is&#8230; <br /><small style="margin-left:10px;">[May 1 - Dr. Dobb's]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_041002">Computer wiz takes on high on-line stakes <br /><small style="margin-left:10px;">[April 10 - Contra Costa Times]</small></a></dd>
                    <dd><a target="_blank" href="http://www.stanforddaily.com/tempo?page=content&id=7865&repository=0001_article">Students advance to TopCoders finals <br /><small style="margin-left:10px;">[April 8 - The Stanford Daily]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_040602">Georgia Tech computer science major to compete in TopCoder... <br /><small style="margin-left:10px;">[April 6 - Marietta Daily Journal]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_040502">Coder wins big in contests <br /><small style="margin-left:10px;">[April 5 - Denver Business Journal]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_040102">Digital Playground <br /><small style="margin-left:10px;">[April 1 - The Plain Dealer]</small></a></dd>
                    <dd><a target="_blank" href="http://www.informationweek.com/story/IWK20020228S0016">Software Jocks Vie For The Prize <br /><small style="margin-left:10px;">[March 4 - InformationWeek]</small></a></dd>
                    <dd><a target="_blank" href="http://www.informationweek.com/story/IWK20020227S0002">Cultivating Next-Generation IT Talent <br /><small style="margin-left:10px;">[February 27 - InformationWeek]</small></a></dd>
                    <dd><a target="_blank" href="http://www.stanforddaily.com/tempo?page=content&id=7592&repository=0001_article">Annual coding competition features student entrants <br /><small style="margin-left:10px;">[February 22 - The Stanford Daily]</small></a></dd>
                    </dl>
                </div>

                <p class="pr_backtop"><a href="#pr_top">Back to Top</a></p>
                <div class="pr_clear"></div>

            </div></div></div>
            <%-- Yearly Container end --%>


            <%-- Yearly Sub Content Container --%>
            <div class="pr_subheader">
                <h2><span>2001</span></h2>
            </div>

            <%-- pr_border creation --%>
            <div class="pr_box"><div class="pr_box2"><div class="pr_boxcontent">

                <div class="pr_newsarchive">
                    <dl>
                    <dt>&nbsp;</dt>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_122001">Whiz cracks contest code <br /><small style="margin-left:10px;">[December 20 - Rocky Mountain News]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_121801">Sun Sponsors Collegiate Developer Tournament <br /><small style="margin-left:10px;">[December 18 - Web Services Report]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_121701">Sun Microsystems Launches New Way to Reach Java Community... <br /><small style="margin-left:10px;">[December 17 - Java Boutique]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_121001">Students to compete in Java, C++ <br /><small style="margin-left:10px;">[December 10 - CNET]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_121001b">Sun Microsystems Named Exclusive Sponsor of Computer Challenge <br /><small style="margin-left:10px;">[December 10 - BrandWeek]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_121001c">Five Thoughts about Hiring IT Professionals <br /><small style="margin-left:10px;">[December 10 - Darwin]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_112601">College student outpaces rivals to win contest <br /><small style="margin-left:10px;">[November 26 - Houston Chronicle]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_111201">Chips &amp; Drivers: It's a digital shootout at Java corral&#8230; <br /><small style="margin-left:10px;">[November 12 - Mass High Tech]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_111201b">Wright second in TopCoder event <br /><small style="margin-left:10px;">[November 12 - Lafayette News]</small></a></dd>
                    <dd><a target="_blank" href="http://www.informationweek.com/story/IWK20011111S0004">Programmer Wows 'Em <br /><small style="margin-left:10px;">[November 12 - InformationWeek]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_110901">Tech student makes TopCoder semifinals <br /><small style="margin-left:10px;">[November 9 - Technique]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_110901b">In Depth: High tech survivors <br /><small style="margin-left:10px;">[November 9 - The Business Journal]</small></a></dd>
                    <dd><a target="_blank" href="http://www.informationweek.com/story/IWK20011108S0013">College Junior Wins Programming Contest--And $100K <br /><small style="margin-left:10px;">[November 8 - InformationWeek]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_110701">TopCoders return rich, triumphant <br /><small style="margin-left:10px;">[November 7 - Stanford Daily]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_110601">Grad Student Emerges at TopCoder '01 <br /><small style="margin-left:10px;">[November 6 - Cornell Daily Sun]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_110401">'TopCoder' Outwits His Rivals <br /><small style="margin-left:10px;">[November 4 - Hartford Courant]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_110101">Performance Metrics - Code for Cash <br /><small style="margin-left:10px;">[November 1 - CIO]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_103101">Computer Wizard a Finalist for $100,000 Prize <br /><small style="margin-left:10px;">[October 31 - University of Central Florida]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_102601">Colorado native among nation's top programmers <br /><small style="margin-left:10px;">[October 26 - The Denver Business Journal]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_102401">TopCoders battle for top prize <br /><small style="margin-left:10px;">[October 24 - Stanford Daily]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_101801">Oberlin College Student Competes in TopCoder Tournament <br /><small style="margin-left:10px;">[October 18 - Oberlin Online]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_101201">Geekletes descend upon programming contest <br /><small style="margin-left:10px;">[October 12 - San Francisco Business Times]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_092601">Students compute, compete for dollars on Web site <br /><small style="margin-left:10px;">[September 26 - Daily Nebraskan]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_091201">'Not a typical computer nerd' <br /><small style="margin-left:10px;">[September 12 - The Wenatchee World]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_091001">The new rules <br /><small style="margin-left:10px;">[September 10 - The Boston Globe]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_090401">TopCoder Inc. offers challenge to top programmers <br /><small style="margin-left:10px;">[September 4 - Mass High Tech]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_090101">If You Build It, They Will Come&#8230; <br /><small style="margin-left:10px;">[September 1 - Software Development]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_083001">Coding competition for cash <br /><small style="margin-left:10px;">[August 30 - Geek.com]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_082401">Programmers Compete For Cash and Recognition <br /><small style="margin-left:10px;">[August 24 - Idea Marketers]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_072701">EECS students excel in computing competitions <br /><small style="margin-left:10px;">[July 27 - Michigan Engineering]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_071601">Virginia Tech student places 5th in national computer programming&#8230; <br /><small style="margin-left:10px;">[July 16 - Virginia Tech]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_071201">Marut Competes in Top Coder Contest <br /><small style="margin-left:10px;">[July 12 - WPI]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_070201">Gladiator geeks&#8230; <br /><small style="margin-left:10px;">[July 2 - Avid ProNet]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_062601">Test your mettle at TopCoder.com <br /><small style="margin-left:10px;">[June 26 - TechRepublic]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_062501">EECS Students Winners in TopCoder Collegiate Challenge <br /><small style="margin-left:10px;">[June 25 - University of Michigan]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_061801">Code warrior hits big time <br /><small style="margin-left:10px;">[June 18 - Mass High Tech]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_060801">Erin native wins $100,000 in contest <br /><small style="margin-left:10px;">[June 8 - Star-Gazette]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_052901">You Are the Fastest Coder <br /><small style="margin-left:10px;">[May 2 - PC Magazine]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_042401">A Game Of Their Own <br /><small style="margin-left:10px;">[April 24 - Hartfore Courant]</small></a></dd>
                    </dl>
                </div>

                <p class="pr_backtop"><a href="#pr_top">Back to Top</a></p>
                <div class="pr_clear"></div>

            </div></div></div>
            <%-- Yearly Container end --%>


        </div>
        <%-- pr_content end --%>

    </div></div></div>
    <%-- pr_frame_inner pr_frame --%>

</div>
<%-- pr_wrapper end --%>

<%-------------------------%>
            </div>
        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
    </tbody>
</table>

<jsp:include page="../foot.jsp" />
</body>
</html>