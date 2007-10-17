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
        <h1><a href="/tc?module=Static&d1=pressroom&d2=index" name="pr_top">Press Room</a></h1>
    </div>
    <%-- pr_header end --%>
    
    <%-- pr_menu begin --%>
    <div id="pr_menu">
        <ul>
        <li><a href="/tc?module=Static&d1=pressroom&d2=index" title="Current News"><span>Current News</span></a></li>
        <li><a href="/tc?module=Static&d1=pressroom&d2=pr_archive" title="Press Release Archive"><span>Press Release Archive</span></a></li>
        <li><a href="/tc?module=Static&d1=pressroom&d2=mediaResources" title="Media Resources"><span>Media Resources</span></a></li>
        <%--
        <li><a href="/tc?module=Static&d1=pressroom&d2=mediaRequestForm" title="Media Request Form"><span>Media Request Form</span></a></li>
        --%>
        <li id="pr_menuactive"><a href="/tc?module=Static&d1=pressroom&d2=art_archive" title="Articles Archive"><span>Articles Archive</span></a></li>
        </ul>
    </div>
    <%-- pr_menu end --%>
    <div class="pr_clear"></div>
    
    
    <%-- content rounded frame wrapper --%>
    <div id="pr_frame"><div id="pr_frame2"><div id="pr_frame3">
        
        <div id="pr_content" align="left">
        
            <%-- Yearly Sub Content Container --%>
            <div class="pr_subheader">
                <h2><span>2007</span></h2>
            </div>
            
            <%-- pr_border creation --%>
            <div class="pr_box"><div class="pr_box2"><div class="pr_boxcontent">
                
                <div class="pr_newsarchive">
                    <dl>
                    <dt>&nbsp;</dt>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='http://www.publicbroadcasting.net/wnpr/news.newsmain?action=article&ARTICLE_ID=1139736' refer='/art_archive' />">6 State companies among fastest growing <br /><small>[August 23 - WNPR]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=art_080207">Fox TV: "Top Computer Programmers Compete" <br /><small>[August 2 - Fox TV Chicago]</small></a></dd>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='/pdfs/press_room/computerworld_20070709.pdf' refer='art_archive' />">Programming's Crack Competitor <br /><small>[PDF] [July 11 - Computerworld]</small></a></dd>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='http://technology.guardian.co.uk/opinion/story/0,,2120402,00.html' refer='art_archive' />">Bill Taylor on big ideas <br /><small>[July 10 - Guardian Unlimited]</small></a></dd>
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='http://www.computerworld.com.au/index.php/id;1241090047;fp;2;fpid;1' refer='art_archive' />">Outsourcing the eBay way <br /><small>[June 15 - Computerworld]</small></a></dd>
                    <dd><a target="_blank" href="http://www.usatoday.com/tech/techinvestor/industry/2007-03-13-google-poland_N.htm">Why Google put a research lab in Poland <br /><small>[March 13 - USA Today]</small></a></dd>
                    <dd><a target="_blank" href="http://www.businessweek.com/print/innovate/content/feb2007/id20070215_251519.htm">Ideagora, a Marketplace for Minds <br /><small>[February 15 - BusinessWeek]</small></a></dd>
                    <dd><a target="_blank" href="http://www.computerworld.com/action/article.do?command=viewArticleBasic&taxonomyId=11&articleId=9011098&intsrc=hm_topic">Microsoft launches 'mashup' competition for developers <br /><small>[February 14 - Computerworld]</small></a></dd>
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
                    <dd><a target="_blank" href="<tc-webtag:linkTracking link='/pdfs/press_room/hre_article_20061213.pdf' refer='art_archive' />">And the Winner Is&#8230; <br /><small>[PDF] [December 13 - Human Resource Executive Magazine]</small></a></dd>
                    <dd><a target="_blank" href="http://www.chinadaily.com.cn/china/2006-12/08/content_754200.htm">Undergraduate VP of multinational company <br /><small>[December 8 - China Daily]</small></a></dd>
                    <dd><a target="_blank" href="/pdfs/press_room/ieeeSoftware_20061206.pdf">Programming Contests Show Impressive Growth <br /><small>[PDF] [December 6 - IEEE Software]</small></a></dd>
                    <dd><a target="_blank" href="/pdfs/press_room/success200612.pdf">Maverick Rules for Success <br /><small>[PDF] [November - Success]</small></a></dd>
                    <dd><a target="_blank" href="http://www.internetnews.com/dev-news/article.php/3644456">Who is the Top Coder? <br /><small>[November 17 - internetnews.com]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=art_110206">A Growing Cadre Of Code Warriors <br /><small>[November 2 - BusinessWeek]</small></a></dd>
                    <dd><a target="_blank" href="http://www.csmonitor.com/2006/1101/p01s04-usec.htm">How to build software? Henry Ford, meet eBay. <br /><small>[November 1 - Christian Science Monitor]</small></a></dd>
                    <dd><a target="_blank" href="http://gigaom.com/2006/10/23/the-new-american-idol-the-coder/">The New American Idol&#8230; The Coder <br /><small>[October 24 - gigaOm]</small></a></dd>
                    <dd><a target="_blank" href="http://www.wallstreetandtech.com/showArticle.jhtml;jsessionid=0U21ZF2KMDLJYQSNDLPCKHSCJUNN2JVN?articleID=193400878"><em>Wall Street &amp; Technology</em> on TopCoder and UBS <br /><small>[October 23 - Wall Street &amp; Technology]</small></a></dd>
                    <dd>TopCoder helps "free" AOL &#160; [October 10 - Information Week] <br /><a target="_blank" href="/i/pressroom/infoweek_excerpt.gif">excerpt</a>&#160;|&#160;<a target="_blank" href="http://www.informationweek.com/internet/showArticle.jhtml?articleID=193104723">full story</a></dd>
                    <dd>TopCoder featured on public radio's "Open Source" [PODCAST] &#160; [October 4 - Open Source] <br /><a target="_blank" href="/audio/open_source_060928_24kb.mp3">lo 6.8mb</a> &#160;|&#160;<a target="_blank" href="/audio/open_source_060928_48kb.mp3">hi 13.8mb</a> &#160;|&#160;<a target="_blank" href="/i/downloads/mavericks_at_work.pdf">Mavericks at Work excerpt</a> [PDF]</dd>
                    <dd><em>Mass High Tech</em> features TopCoder staff &#160; [July 12 - Mass High Tech] <br /><a target="_blank" href="http://masshightech.bizjournals.com/masshightech/stories/2006/07/10/focus1.html">Code Commanders</a>&#160;|&#160;<a target="_blank" href="http://masshightech.bizjournals.com/masshightech/stories/2006/07/10/focus6.html">TheFaxman Codeth</a>&#160;|&#160;<a target="_blank" href="http://masshightech.bizjournals.com/masshightech/stories/2006/07/10/focus8.html">Identifying Best Developers</a></dd>
                    <dd><a target="_blank" href="http://media32b.libsyn.com/aHeceJl2a3eTdmd2bHOcq5qkZnaZ/podcasts/dickwall/JavaPosse065.mp3">Java Posse - Interviews from TopCoder and Java One <br /><small>[PODCAST] [July 5 - Java Posse]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=art_051606">Gartner cites TopCoder as model for "Web 2.0" community <br /><small>[May 16 - Gartner]</small></a></dd>
                    <dd><a target="_blank" href="http://garyflood.itweek.co.uk/2006/05/idol_or_idle_wh.html">Idol or idle: which one are you? <br /><small>[May 15 - IT Week]</small></a></dd>
                    <dd><a target="_blank" href="/movies/press/cnbc_051506.mov">CNBC's Jane's Addiction and Squawk Box at the TCO06 <br /><small>[MOVIE] [May 15 - CNBC TV]</small></a></dd>
                    <dd><a target="_blank" href="http://media31b.libsyn.com/bXdveMh1nHzGfGd1mHluo2%2BlkXWb/podcasts/dickwall/JavaPosse053.mp3">Java Posse - Listener Feedback and TopCoder Interviews <br /><small>[PODCAST] [May 15 - Java Posse]</small></a></dd>
                    <dd><a target="_blank" href="http://www.themoscowtimes.com/stories/2006/05/11/042.html">Russian Talents Shine in IT Contests <br /><small>[May 11 - The Moscow Times]</small></a></dd>
                    <dd><a target="_blank" href="http://media32b.libsyn.com/a3edeJR1nnyUeGx8bXttpWytZHKZ/podcasts/dickwall/JavaPosse054.mp3">Java Posse - Live at the TopCoder Open <br /><small>[PODCAST] [May 11 - Java Posse]</small></a></dd>
                    <dd><a target="_blank" href="http://www.computerworld.com/action/article.do?command=viewArticleBasic&articleId=9000323">Programming contest garners enterprise interest <br /><small>[May 10 - Computerworld]</small></a></dd>
                    <dd><a target="_blank" href="/?t=sponsor&c=link&link=http://webreprints.djreprints.com/1466111183234.html">Cause for Concern? Americans Are Scarce In Top Tech Contest <br /><small>[May 10 - Wall Street Journal]</small></a></dd>
                    <dd><a target="_blank" href="http://media41b.libsyn.com/mHdxeJp1cXvHfZd5anptq26sZXGb/podcasts/dickwall/JavaPosse052.mp3">Java Posse - Jack Hughes interview from the TCO06 <br /><small>[PODCAST] [May 4 - Java Posse]</small></a></dd>
                    <dd><a target="_blank" href="http://news.com.com/Coding+for+fame%2C+and+dollars/2100-1007_3-6067549.html?tag=nefd.lede">Coding for fame, and dollars <br /><small>[May 2 - CNET]</small></a></dd>
                    <dd><a target="_blank" href="http://www.cs.uga.edu/~acm/topcoder.html">TopCoder College Tour: Report from University of Georgia <br /><small>[April 5 - UGA - ACM]</small></a></dd>
                    <dd><a target="_blank" href="http://www.whitworth.edu/Students/Whitworthian/V96/I14/Students-compete-in-online-competition.html">Students compete in online competition <br /><small>[March 30 - The Whitworthian]</small></a></dd>
                    <dd><a target="_blank" href="http://www.adtmag.com/article.aspx?id=18109">SOA vendors partner with LogicLibrary to create integrated governance platform <br /><small>[March 14 - ADT]</small></a></dd>
                    <dd><a target="_blank" href="http://www.wallstreetandtech.com/showArticle.jhtml?articleID=181502379">UBS Sponsors TopCoder Open <br /><small>[March 13 - Wall Street &amp; Technology]</small></a></dd>
                    <dd><a target="_blank" href="http://www.dnaindia.com/report.asp?NewsID=1017289&CatID=2">Code jockey contest returns to IT hub <br /><small>[March 13 - DNA India]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=art_031006">Exclusive: Interview with Pat Conley, VP VeriSign O&amp;I and TopCoder Member <br /><small>[March 10]</small></a></dd>
                    <dd><a target="_blank" href="http://thepost.baker.ohiou.edu/show_news.php?article=N3&date=030806">Gurus compete in coding competition <br /><small>[March 8 - The Post Online]</small></a></dd>
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
                    <dd><a href="#">TopCoder Announced TopCoder Open 2007 Sponsored by AOL. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Registration Opens for First TopCoder High School Global Programming Tournament. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
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
                    <dd><a href="#">TopCoder Announced TopCoder Open 2007 Sponsored by AOL. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Registration Opens for First TopCoder High School Global Programming Tournament. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
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
                    <dd><a href="#">TopCoder Announced TopCoder Open 2007 Sponsored by AOL. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Registration Opens for First TopCoder High School Global Programming Tournament. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
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
                    <dd><a href="#">TopCoder Announced TopCoder Open 2007 Sponsored by AOL. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Registration Opens for First TopCoder High School Global Programming Tournament. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
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
                    <dd><a href="#">TopCoder Announced TopCoder Open 2007 Sponsored by AOL. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Registration Opens for First TopCoder High School Global Programming Tournament. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 22]</small></a></dd>
                    <dd><a href="#">Lorem ipsum dolor sit amet, consectetur adispicing ut labore dolore magna aliqua. <br /><small>[February 20]</small></a></dd>
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