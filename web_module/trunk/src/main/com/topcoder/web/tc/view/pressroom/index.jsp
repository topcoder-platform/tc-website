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
        <h1><a onfocus="this.blur();" href="/tc?module=Static&amp;d1=pressroom&amp;d2=index" name="pr_top">Press Room</a></h1>
    </div>
    <%-- pr_header end --%>
    
    <%-- pr_menu begin --%>
    <div id="pr_menu">
        <ul>
            <li id="pr_menuactive"><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=index" title="Current News"><span>Current News</span></a></li>
            <li><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_archive" title="Press Release Archive"><span>Press Release Archive</span></a></li>
            <li><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=mediaResources" title="Media Resources"><span>Media</span></a></li>
            <li><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=mediaRequestForm" title="Media Request Form"><span>Media Request Form</span></a></li>
            <li><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_archive" title="Articles Archive"><span>Articles Archive</span></a></li>
        </ul>
    </div>
    <%-- pr_menu end --%>
    <div class="pr_clear"></div>
    
    
    <%-- content rounded frame wrapper --%>
    <div id="pr_frame"><div id="pr_frame2"><div id="pr_frame3">
        
        <div id="pr_content" align="left">
        
            <%-- .pr_featured begin --%>
            <div class="pr_featured">
                <div class="pr_featured_main">
                    <%-- old version
                    <span style="padding-left:125px;"><a href="#linktonews"><img src="/i/pressroom/featured_tco07.png" width="440" height="136" ></a></span>
                    --%>
                    <div style="padding-left:90px;">
                        <%-- UML Tool 
                        <a href="<tc-webtag:linkTracking link='/wiki/display/tc/TopCoder+UML+Tool' refer='pr_index' />"><img src="/i/home/umltool20080226.jpg" alt="UML Tool Release" /></a>
                        --%>
                        <%-- OpenAIM 
                        <a href="<tc-webtag:linkTracking link='/openaim/' refer='pr_index' />"><img src="/i/home/openaim.png" alt="Open AIM Developer Challenge Powered by TopCoder" /></a>
                        --%>
                        <%-- TCO08 --%>
                        <map name="tco08">
                        <area shape="rect" alt="" coords="12,6,455,114" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=about" />
                        <area shape="rect" alt="" coords="0,136,85,150" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=algorithm&amp;d4=bracket" />
                        <area shape="rect" alt="" coords="103,136,164,150" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=component&amp;d4=desBracket" />
                        <area shape="rect" alt="" coords="181,136,295,150" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=component&amp;d4=devBracket" />
                        <area shape="rect" alt="" coords="310,136,397,150" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=marathon&amp;d4=bracket" />
                        <area shape="rect" alt="" coords="413,136,474,150" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=studio&amp;d4=bracket" />
                        </map>
                        <img src="/i/home/tco08bracket.png" alt="TCO08" usemap="#tco08" style="display: block;" />
                    </div>
                </div>
                <%--
                <div class="pr_featured_sub">
                    <div class="pr_subscribe_form">
                        <h3>Newsletter Sign Up</h3>
                        <form>
                        <input type="text" name="email" size="15" class="pr_email_text">&nbsp;<a href="#"><img src="/i/pressroom/btn_go.png" height="20" align="absmiddle"></a><br>
                        <input type="radio" name="subs_type" value="articles" id="pr_cek_articles">&nbsp;<label for="pr_cek_articles">Articles</label>&nbsp;<input type="radio" name="subs_type" value="press" id="pr_cek_press">&nbsp;<label for="pr_cek_press">Press Release</label>
                        </form>
                    </div>
                </div>
                --%>
                <div class="pr_clear"></div>
            </div>
            <%-- .pr_featured end --%>
            
            <%-- Yearly Sub Content Container --%>
            <div class="pr_subheader">
                <h2><span>2008</span></h2>
            </div>
            
            <%-- pr_border creation --%>
            <div class="pr_box"><div class="pr_box2"><div class="pr_boxcontent">
                
                <%-- Lilly Partners with TopCoder, to Find Drug Discovery IT Solutions begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_051308"><img src="/i/pressroom/topcoder_logo.png" alt="TopCoder logo" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_051308">Lilly Partners with TopCoder, to Find Drug Discovery IT Solutions</a></h3>
                        <p>TopCoder Collaboration allows Lilly to Tap into World's Top Software Developers for Solutions to Complex Technology Processes Associated With Drug Discovery  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_051308">[May 13]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Lilly Partners with TopCoder, to Find Drug Discovery IT Solutions end --%>
                
                <%-- InfoWorld - TopCoder: developer productivity and code quality through competition begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="<tc-webtag:linkTracking link='http://weblog.infoworld.com/stratdev/archives/2008/05/topcoder_develo.html' refer='pr_index' />"><img src="/i/pressroom/infoworld_logo.gif" alt="InfoWorld" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="<tc-webtag:linkTracking link='http://weblog.infoworld.com/stratdev/archives/2008/05/topcoder_develo.html' refer='pr_index' />">TopCoder: developer productivity and code quality through competition</a></h3>
                        <p>The TopCoder business model isn't outsourcing: it's built on global competition, and controlled by metrics and peer review. It's also market-driven.  <small><a target="_blank" href="<tc-webtag:linkTracking link='http://weblog.infoworld.com/stratdev/archives/2008/05/topcoder_develo.html' refer='pr_index' />">[May 9]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- InfoWorld - TopCoder: developer productivity and code quality through competition end --%>
                
                <%-- Betfair Joins 2008 TopCoder Open Sponsors begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_050608"><img src="/i/pressroom/tco08_logo.png" alt="TopCoder Open 2008" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_050608">Betfair Joins 2008 TopCoder Open Sponsors</a></h3>
                        <p>Las Vegas Event is Premier Showcase for Computing Skills and Talent  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_050608">[May 6]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Betfair Joins 2008 TopCoder Open Sponsors end --%>
                
                <%-- Dr. Dobb's - There Must be Contest begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="<tc-webtag:linkTracking link='http://www.ddj.com/architect/207404123' refer='pr_index' />"><img src="/i/pressroom/drDobbs_logo.png" alt="Dr. Dobb's logo" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="<tc-webtag:linkTracking link='http://www.ddj.com/architect/207404123' refer='pr_index' />">There Must be Contest</a></h3>
                        <p>Programming contests used to be fun. Now they're a commercial software development business - and they're still fun!  <small><a target="_blank" href="<tc-webtag:linkTracking link='http://www.ddj.com/architect/207404123' refer='pr_index' />">[May 1]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Dr. Dobb's - There Must be Contest end --%>
                
                <%-- Financial Times - Working in IT: The tournament approach to finding talent begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="<tc-webtag:linkTracking link='http://www.ft.com/cms/s/0/2290a6b0-14c6-11dd-a741-0000779fd2ac.html?nclick_check=1' refer='pr_index' />"><img src="/i/pressroom/ft_logo.png" alt="Financial Times logo" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="<tc-webtag:linkTracking link='http://www.ft.com/cms/s/0/2290a6b0-14c6-11dd-a741-0000779fd2ac.html?nclick_check=1' refer='pr_index' />">Working in IT: The tournament approach to finding talent</a></h3>
                        <p>TopCoder is both a company and a concept: it is a novel approach to identifying and grading the best software developers that exploits the egotism and innate competitiveness of many computer programmers.  <small><a target="_blank" href="<tc-webtag:linkTracking link='http://www.ft.com/cms/s/0/2290a6b0-14c6-11dd-a741-0000779fd2ac.html?nclick_check=1' refer='pr_index' />">[April 30]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Financial Times - Working in IT: The tournament approach to finding talent end --%>
                
                <%-- 2theadvocate.com - Top programmer, 15, says talent same as sports aptitude begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="<tc-webtag:linkTracking link='http://www.2theadvocate.com/features/18320734.html' refer='pr_index' />"><img src="/i/pressroom/tchs08_logo.png" alt="TCHS08 logo" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="<tc-webtag:linkTracking link='http://www.2theadvocate.com/features/18320734.html' refer='pr_index' />">Top programmer, 15, says talent same as sports aptitude</a></h3>
                        <p>Wu, a Baton Rouge Magnet High School sophomore, placed second in an elite international competition of top high school-age software developers. Wu is the son of Mei Wu and Guorong Zhang.  <small><a target="_blank" href="<tc-webtag:linkTracking link='http://www.2theadvocate.com/features/18320734.html' refer='pr_index' />">[April 27]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- 2theadvocate.com - Top programmer, 15, says talent same as sports aptitude end --%>
                
                <%-- Courant.com - Glastonbury Firm's Online Software Contests Attract High-Rolling Sponsors begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="<tc-webtag:linkTracking link='http://www.courant.com/business/hc-cornershop0416.artapr16,0,6766513.story' refer='pr_index' />"><img src="/i/pressroom/courant_logo.png" alt="courant.com logo" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="<tc-webtag:linkTracking link='http://www.courant.com/business/hc-cornershop0416.artapr16,0,6766513.story' refer='pr_index' />">Glastonbury Firm's Online Software Contests Attract High-Rolling Sponsors</a></h3>
                        <p>TopCoder is a nontraditional workplace, staging online competitions for software design, many sponsored by Fortune 1000 companies.  <small><a target="_blank" href="<tc-webtag:linkTracking link='http://www.courant.com/business/hc-cornershop0416.artapr16,0,6766513.story' refer='pr_index' />">[April 16]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Courant.com - Glastonbury Firm's Online Software Contests Attract High-Rolling Sponsors end --%>
                
                <%-- Finalists Announced for 2008 TopCoder Open May 12-15 in Las Vegas begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_041508"><img src="/i/pressroom/tco08_logo.png" alt="TopCoder Open 2008" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_041508">Finalists Announced for 2008 TopCoder Open May 12-15 in Las Vegas</a></h3>
                        <p>TopCoder Members Representing 30 Countries to Compete for Recognition, Honors and Share of $260,000 in Prize Money  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_041508">[April 15]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Finalists Announced for 2008 TopCoder Open May 12-15 in Las Vegas end --%>
                
                <%-- PricewaterhouseCoopers - TopCoder's network drives innovation begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="<tc-webtag:linkTracking link='/i/pressroom/pdfs/pwc_20080415.pdf' refer='pr_index' />"><img src="/i/pressroom/pwc_logo.png" alt="PricewaterhouseCoopers logo" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="<tc-webtag:linkTracking link='http://www.globalbestpractices.com/Home/Document.aspx?Q=273,4383,205,3FB60597-A4BD-47AA-9F61-3E96E6E3E10D' refer='pr_index' />">TopCoder's network drives innovation</a></h3>
                        <p>Innovation requires a sophisticated awareness of myriad resources that can influence new product and service development.  <small><a target="_blank" href="<tc-webtag:linkTracking link='http://www.globalbestpractices.com/Home/Document.aspx?Q=273,4383,205,3FB60597-A4BD-47AA-9F61-3E96E6E3E10D' refer='pr_index' />">[April 15]</a> | <a target="_blank" href="/i/pressroom/pdfs/pwc_20080415.pdf">PDF</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- PricewaterhouseCoopers - TopCoder's network drives innovation end --%>
                
                <%-- BT Joins Sponsors of 2008 TopCoder Open begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_040208"><img src="/i/pressroom/tco08_logo.png" alt="TopCoder Open 2008" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_040208">BT Joins Sponsors of 2008 TopCoder Open</a></h3>
                        <p>Leading Provider of Communications Solutions Teams Up with AOL, Lilly, NSA and VeriSign in Support of Computer Programming Championship  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_040208">[April 2]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- BT Joins Sponsors of 2008 TopCoder Open end --%>
                
                <%-- ZDNet - TopCoder: breaking the development cost rules begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="<tc-webtag:linkTracking link='http://blogs.zdnet.com/enterprisealley/?p=124' refer='pr_index' />"><img src="/i/pressroom/zdNet_logo.png" alt="ZDNet logo" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="<tc-webtag:linkTracking link='http://blogs.zdnet.com/enterprisealley/?p=124' refer='pr_index' />">TopCoder: breaking the development cost rules</a></h3>
                        <p>The company takes the idea of community, applies a heavy dose of competition for skills and then applies that formula to the business of development.  <small><a target="_blank" href="<tc-webtag:linkTracking link='http://blogs.zdnet.com/enterprisealley/?p=124' refer='pr_index' />">[March 25]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- ZDNet - TopCoder: breaking the development cost rules end --%>
                
                <%-- Redmond Developer News - Open Counsel begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="<tc-webtag:linkTracking link='http://reddevnews.com/qandas/article.aspx?editorialsid=123' refer='pr_index' />"><img src="/i/pressroom/rdn_logo.png" alt="Redmond Developer News" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="<tc-webtag:linkTracking link='http://reddevnews.com/qandas/article.aspx?editorialsid=123' refer='pr_index' />">Open Counsel</a></h3>
                        <p>TopCoder's Ira Heffan is the featured Q&amp;A in the current edition of <em>Redmond Developer News</em>. Heffan discusses Microsoft's announcement to make its technology more open.  <small><a target="_blank" href="<tc-webtag:linkTracking link='http://reddevnews.com/qandas/article.aspx?editorialsid=123' refer='pr_index' />">[March 24]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Redmond Developer News - Open Counsel end --%>
                
                <%-- Multicore boom needs new developer skills begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_032408"><img src="/i/pressroom/washingtonPostDOTcom_logo.png" alt="washingtonpost.com logo" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_032408">Multicore boom needs new developer skills</a></h3>
                        <p>Microsoft exec warns of "a worldwide shortage of people experienced in parallel computing experience."  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_032408">[March 24]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Multicore boom needs new developer skills end --%>
                
                <%-- Network World - China, US and Poland take high-school coding prizes begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="<tc-webtag:linkTracking link='http://www.networkworld.com/news/2008/031708-china-us-and-poland-take.html' refer='pr_index' />"><img src="/i/pressroom/networkWorld_logo.png" alt="Network World logo" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="<tc-webtag:linkTracking link='http://www.networkworld.com/news/2008/031708-china-us-and-poland-take.html' refer='pr_index' />">China, US and Poland take high-school coding prizes</a></h3>
                        <p>A Chinese student has won top honors in the TopCoder online programming competition hosted by Purdue University in Indiana, beating 48 other elite competitors from the U.S., China, Russia, Poland, India and other nations.  <small><a target="_blank" href="<tc-webtag:linkTracking link='http://www.networkworld.com/news/2008/031708-china-us-and-poland-take.html' refer='pr_index' />">[March 17]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Network World - China, US and Poland take high-school coding prizes end --%>
                
                <%-- China, US and Poland Take Honors in TopCoder High School Tournament at Purdue University begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_031708"><img src="/i/pressroom/tchs08_logo.png" alt="TCHS08 logo" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_031708">China, US and Poland Take Honors in TopCoder High School Tournament at Purdue University</a></h3>
                        <p>Annual World Championship for TopCoder High School Members Sees Chinese Student Win $15,000 in Algorithm Programming Competition  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_031708">[March 17]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- China, US and Poland Take Honors in TopCoder High School Tournament at Purdue University end --%>
                
                <%-- Not Your Father's Outsourcing begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="<tc-webtag:linkTracking link='http://www.sdtimes.com/content/article.aspx?ArticleID=31779' refer='pr_index' />"><img src="/i/pressroom/sd_times_logo.gif" alt="SD Times logo" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="<tc-webtag:linkTracking link='http://www.sdtimes.com/content/article.aspx?ArticleID=31779' refer='pr_index' />">Not Your Father's Outsourcing</a></h3>
                        <p>"It's 2008, and this is not your father's definition of outsourcing. Two companies with updated views about software development engagements are showing that many of the pitfalls of sending work away to be done can be overcome."  <small><a target="_blank" href="<tc-webtag:linkTracking link='http://www.sdtimes.com/content/article.aspx?ArticleID=31779' refer='pr_index' />">[March 10]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Not Your Father's Outsourcing end --%>
                
                <%-- AMD and TopCoder Host a Series of Competitions to Advance Multi-Threaded Software Development begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_031008"><img src="/i/pressroom/amd_logo.gif" alt="TopCoder Open 2008" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_031008">AMD and TopCoder Host a Series of Competitions to Advance Multi-Threaded Software Development</a></h3>
                        <p>Beginning March 12, "Multicore Threadfest" Offers $20,000 Prize Purse and Recognition through Innovation  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_031008">[March 10]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- AMD and TopCoder Host a Series of Competitions to Advance Multi-Threaded Software Development end --%>
                
                <%-- AOL, Lilly and VeriSign Return as Sponsors &amp; NSA Returns as Patron of 2008 TopCoder Open begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_030508"><img src="/i/pressroom/tco08_logo.png" alt="TopCoder Open 2008" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_030508">AOL, Lilly and VeriSign Return as Sponsors &amp; NSA Returns as Patron of 2008 TopCoder Open</a></h3>
                        <p>Competitive Programming's Top Tournament Underway with Continued Support of AOL, Lilly, NSA and VeriSign; Expanded Field of 120 Finalists to Compete for $260,000 Prize Money in Las Vegas  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_030508">[March 5]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- AOL, Lilly and VeriSign Return as Sponsors &amp; NSA Returns as Patron of 2008 TopCoder Open end --%>
                
                <%-- AOL Selects TopCoder Enterprise Software Development Platform begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_030408"><img src="/i/pressroom/aol_logo.jpg" alt="AOL logo" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_030408">AOL Selects TopCoder Enterprise Software Development Platform</a></h3>
                        <p>AOL to Leverage TopCoder "Software Factory" Delivery Platform for Reusable Components, Tools &amp; Processes and Global Development Community  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_030408">[March 4]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- AOL Selects TopCoder Enterprise Software Development Platform end --%>
                
                <%-- World's Elite High School Programmers to Compete in Live TopCoder High School Tournament begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_022808"><img src="/i/pressroom/tchs08_logo.png" alt="TCHS08 logo" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_022808">World's Elite High School Programmers to Compete in Live TopCoder High School Tournament</a></h3>
                        <p>49 Students Earn Tournament Berth after Months of Online Competition - Finalists to be Flown to Purdue University for Live Finals March 15  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_022808">[February 28]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- World's Elite High School Programmers to Compete in Live TopCoder High School Tournament end --%>
                
                <%-- TopCoder UML Design Tool Free to Developers begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_022608"><img src="/i/pressroom/topcoder_logo.png" alt="TopCoder logo" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_022608">TopCoder UML Design Tool Free to Developers</a></h3>
                        <p>Community Built and Tested Unified Modeling Language Tool Provides Custom Flexibility &amp; Interoperability for Global Community of Programmers  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_022608">[February 26]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TopCoder UML Design Tool Free to Developers end --%>
                
                <%-- TopCoder Software Component Catalog Surpasses 1,000 Reusable Java and .NET Components begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_021808"><img src="/i/pressroom/topcoder_logo.png" alt="TopCoder logo" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_021808">TopCoder Software Component Catalog Surpasses 1,000 Reusable Java and .NET Components</a></h3>
                        <p>Customers Leverage TopCoder Components to Increase Pre-Built Software an Average 50 Percent for New Applications-Yielding Substantially Shorter Development Timelines and Decreased Costs  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_021808">[February 18]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TopCoder Software Component Catalog Surpasses 1,000 Reusable Java and .NET Components end --%>
                
                <%-- Computerworld: Rock star coders begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="<tc-webtag:linkTracking link='http://www.computerworld.com/action/article.do?command=viewArticleBasic&articleId=9057899&source=NLT_AM&nlid=1' refer='pr_index' />"><img src="/i/pressroom/computerworld.gif" alt="Computerworld logo" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="<tc-webtag:linkTracking link='http://www.computerworld.com/action/article.do?command=viewArticleBasic&articleId=9057899&source=NLT_AM&nlid=1' refer='pr_index' />">Rock star coders</a></h3>
                        <p>For rock star programmers, it's not only just about brains but how you use them and get along with others  <small><a target="_blank" href="<tc-webtag:linkTracking link='http://www.computerworld.com/action/article.do?command=viewArticleBasic&articleId=9057899&source=NLT_AM&nlid=1' refer='pr_index' />">[January 22]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Computerworld: Rock star coders end --%>
                
                <%-- TopCoder to Speak on Collaboration at Mid-Atlantic CIO Forum begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_010708"><img src="/i/pressroom/topcoder_logo.png" alt="TopCoder logo" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_010708">TopCoder to Speak on Collaboration at Mid-Atlantic CIO Forum</a></h3>
                        <p>Jack Hughes, TopCoder Chairman and Founder, to Share Insight on Using Online Professional Communities to Accomplish Work  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_010708">[January 7]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TopCoder to Speak on Collaboration at Mid-Atlantic CIO Forum end --%>
                
                <%-- CFO.com: Gaming the System begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="<tc-webtag:linkTracking link='http://www.cfo.com/article.cfm/10345535/c_10346944?f=magazine_alsoinside' refer='pr_index' />"><img src="/i/pressroom/cfo_logo.png" alt="CFO.com logo" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="<tc-webtag:linkTracking link='http://www.cfo.com/article.cfm/10345535/c_10346944?f=magazine_alsoinside' refer='pr_index' />">Gaming the System</a></h3>
                        <p>How a small outsourcing firm uses competition to unite its global community.  <small><a target="_blank" href="<tc-webtag:linkTracking link='http://www.cfo.com/article.cfm/10345535/c_10346944?f=magazine_alsoinside' refer='pr_index' />">[January 3]</a> | <a target="_blank" href="/i/pressroom/pdfs/cfo_20080103_v2.pdf">PDF</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- CFO.com: Gaming the System end --%>
                
                <%-- TopCoder Expands With New Headquarters in Connecticut begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_010208"><img src="/i/pressroom/topcoder_logo.png" alt="TopCoder" border="0" /></a></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_010208">TopCoder Expands With New Headquarters in Connecticut</a></h3>
                        <p>Global Leader in Programming Contests and Software Methodology Stays Centered in Glastonbury  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_010208">[January 2]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TopCoder Expands With New Headquarters in Connecticut end --%>
                
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
                
                <%-- Network World begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="<tc-webtag:linkTracking link='http://www.networkworld.com/podcasts/panorama/2007/122007pan-topcoder.html' refer='pr_index' />"><img src="/i/pressroom/networkWorld_logo.png" alt="Network World logo" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="<tc-webtag:linkTracking link='http://www.networkworld.com/podcasts/panorama/2007/122007pan-topcoder.html' refer='pr_index' />">Coder contests drive app development [PODCAST]</a></h3>
                        <p>Network World's Jason Meserve looks at a different spin on outsourcing application development with TopCoder's Mike Morris, senior vice president of software development.  This podcast discusses hosting application development tournaments as a means to find talent and create robust code.  <small><a target="_blank" href="<tc-webtag:linkTracking link='http://www.networkworld.com/podcasts/panorama/2007/122007pan-topcoder.html' refer='pr_index' />">[December 21]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Network World end --%>
                
                <%-- The McKinsey Quarterly: Eight business technology trends to watch begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="<tc-webtag:linkTracking link='http://www.mckinseyquarterly.com/article_abstract_visitor.aspx?ar=2080&l2=13&l3=11' refer='pr_index' />"><img src="/i/pressroom/theMcKinseyQuarterly_logo.png" alt="The McKinsey Quarterly logo" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="<tc-webtag:linkTracking link='http://www.mckinseyquarterly.com/article_abstract_visitor.aspx?ar=2080&l2=13&l3=11' refer='pr_index' />">Eight business technology trends to watch</a></h3>
                        <p>Companies will have to build capabilities to engage talent globally or contract with talent aggregators that specialize in providing such services. TopCoder gives organizations that want to have software developed for them access to its talent pool.  <small><a target="_blank" href="<tc-webtag:linkTracking link='http://www.mckinseyquarterly.com/article_abstract_visitor.aspx?ar=2080&l2=13&l3=11' refer='pr_index' />">[December 12]</a> | <a target="_blank" href="/i/pressroom/pdfs/mckinsey_20071212.pdf">PDF</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- The McKinsey Quarterly: Eight business technology trends to watch end --%>
                
                <%-- Computerworld: Should your company 'crowdsource' its next project? begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="<tc-webtag:linkTracking link='http://www.computerworld.com/action/article.do?command=viewArticleBasic&articleId=9050920&pageNumber=1' refer='pr_index' />"><img src="/i/pressroom/computerworld.gif" alt="Computerworld logo" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="<tc-webtag:linkTracking link='http://www.computerworld.com/action/article.do?command=viewArticleBasic&articleId=9050920&pageNumber=1' refer='pr_index' />">Should your company 'crowdsource' its next project?</a></h3>
                        <p>Whether it's to increase loyalty among customers speed up development time or cast outward for innovative ideas, companies are trying on many styles of 'crowdsourcing'  <small><a target="_blank" href="<tc-webtag:linkTracking link='http://www.computerworld.com/action/article.do?command=viewArticleBasic&articleId=9050920&pageNumber=1' refer='pr_index' />">[December 6]</a> | <a target="_blank" href="/i/pressroom/pdfs/computerworld_20071206.pdf">PDF</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Computerworld: Should your company 'crowdsource' its next project? end --%>
                
                <%-- Redmond Developer News begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="<tc-webtag:linkTracking link='http://reddevnews.com/features/article.aspx?editorialsid=2387' refer='pr_index' />"><img src="/i/pressroom/rdn_logo.png" alt="Redmond Developer News" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="<tc-webtag:linkTracking link='http://reddevnews.com/features/article.aspx?editorialsid=2387' refer='pr_index' />">Contested Code</a></h3>
                        <p>How TopCoder uses a contest format to build high-quality software for clients.  <small><a target="_blank" href="<tc-webtag:linkTracking link='http://reddevnews.com/features/article.aspx?editorialsid=2387' refer='pr_index' />">[December 4]</a> | <a target="_blank" href="/i/pressroom/pdfs/rdn_20071204.pdf">PDF</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Redmond Developer News end --%>
                
                <%-- Russia Today begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="<tc-webtag:linkTracking link='http://www.russiatoday.ru/news/news/16968' refer='pr_index' />"><img src="/i/pressroom/russiaToday_logo.png" alt="Russia Today" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="<tc-webtag:linkTracking link='http://www.russiatoday.ru/news/news/16968' refer='pr_index' />">Russian computer whiz crowned world's best</a></h3>
                        <p>A Russian student, Pyotr Mitrichev (<tc-webtag:handle coderId="10574855" context="algorithm"/>), has won the world programming championships, taking place in the U.S. Over 3,000 young and talented student programmers took part. Video included after the jump.  <small><a target="_blank" href="<tc-webtag:linkTracking link='http://www.russiatoday.ru/news/news/16968' refer='pr_index' />">[November 15]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Russia Today end --%>
                
                <%-- The Daily | University of Washington begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="<tc-webtag:linkTracking link='http://thedaily.washington.edu/article/2007/11/9/uwSeniorWinsNationalCodingCompetition' refer='pr_index' />"><img src="/i/pressroom/theDaily_logo.png" alt="The Daily" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="<tc-webtag:linkTracking link='http://thedaily.washington.edu/article/2007/11/9/uwSeniorWinsNationalCodingCompetition' refer='pr_index' />">UW senior wins national coding competition</a></h3>
                        <p>Computer Science senior Michael Skinner (<tc-webtag:handle coderId="7454301" context="marathon_match" />) placed first in his division of the national TopCoder Collegiate Competition in Orlando, Fla., Nov. 2.  <small><a target="_blank" href="<tc-webtag:linkTracking link='http://thedaily.washington.edu/article/2007/11/9/uwSeniorWinsNationalCodingCompetition' refer='pr_index' />">[November 9]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- The Daily | University of Washington end --%>
                
                <%-- CNews begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_110807"><img src="/i/pressroom/cnews_logo.png" alt="CNews" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_110807">Russian programmer twice the best worldwide</a></h3>
                        <p>Having won, Peter Mitrichev (<tc-webtag:handle coderId="10574855" context="algorithm"/>) is now the first in the TopCoder world rating.  <small><a target="_blank" href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_110807">[November 8]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- CNews end --%>
                
                <%-- The Seattle Times begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="<tc-webtag:linkTracking link='http://seattletimes.nwsource.com/html/localnews/2003991315_coder03m.html' refer='pr_index' />"><img src="/i/pressroom/seattleTimes_logo.png" alt="The Seattle Times" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="<tc-webtag:linkTracking link='http://seattletimes.nwsource.com/html/localnews/2003991315_coder03m.html' refer='pr_index' />">Skilled at code, he wins a load</a></h3>
                        <p>University of Washington computer whiz Michael Skinner (<tc-webtag:handle coderId="7454301" context="marathon_match" />) scored an upset victory Friday by winning his division of an international contest aimed at finding out who can write the most effective computer programs.  <small><a target="_blank" href="<tc-webtag:linkTracking link='http://seattletimes.nwsource.com/html/localnews/2003991315_coder03m.html' refer='pr_index' />">[November 6]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- The Seattle Times end --%>
                
                <%-- Students from Russian Federation, China, Indonesia and United States Win 2007 TopCoder Collegiate Challenge begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_110507"><img src="/i/pressroom/tccc07_logo.png" alt="2007 TopCoder Collegiate Challenge" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_110507">Students from Russian Federation, China, Indonesia and United States Win 2007 TopCoder Collegiate Challenge</a></h3>
                        <p>Top Ranked Winners Bring Home International Honors and $260,000 Prize Money from Global Software Development Competition at Disney World  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_110507">[November 5]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Students from Russian Federation, China, Indonesia and United States Win 2007 TopCoder Collegiate Challenge end --%>
                
                <%-- Orlando Sentinel begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="<tc-webtag:linkTracking link='http://www.orlandosentinel.com/community/news/lakebuenavista/orl-topcoder0207nov02,0,4540773.story' refer='pr_index' />"><img src="/i/pressroom/orlandoSentinel_logo.png" alt="Orlando Sentinel" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="<tc-webtag:linkTracking link='http://www.orlandosentinel.com/community/news/lakebuenavista/orl-topcoder0207nov02,0,4540773.story' refer='pr_index' />">Computer coders vie for $260,000 in prize money (with video)</a></h3>
                        <p>Having left the obscurity of their bedrooms, some of the world's top college computer coders are vying today for a combined $260,000 in prize money and worldwide bragging rights.  <small><a target="_blank" href="<tc-webtag:linkTracking link='http://www.orlandosentinel.com/community/news/lakebuenavista/orl-topcoder0207nov02,0,4540773.story' refer='pr_index' />">[November 2]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Orlando Sentinel end --%>
                
                <%-- Orlando Sentinel begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="<tc-webtag:linkTracking link='http://www.orlandosentinel.com/business/orl-bk-topcoder110107,0,3810238.story?coll=orl_tab01_layout' refer='pr_index' />"><img src="/i/pressroom/orlandoSentinel_logo.png" alt="Orlando Sentinel" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="<tc-webtag:linkTracking link='http://www.orlandosentinel.com/business/orl-bk-topcoder110107,0,3810238.story?coll=orl_tab01_layout' refer='pr_index' />">Local eliminated, but TopCoder Collegiate Challenge continues</a></h3>
                        <p>Inside the Contemporary Hotel at Walt Disney World this week, 48 competitors are vying for $25,000 in the algorithm competition of the TopCoder Collegiate Challenge.  <small><a target="_blank" href="<tc-webtag:linkTracking link='http://www.orlandosentinel.com/business/orl-bk-topcoder110107,0,3810238.story?coll=orl_tab01_layout' refer='pr_index' />">[November 1]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Orlando Sentinel end --%>
                
                <%-- The New York Times begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="<tc-webtag:linkTracking link='http://www.nytimes.com/idg/IDG_002570DE00740E1800257384005A2F1F.html?ref=technology' refer='pr_index' />"><img src="/i/pressroom/nytimes_logo.png" alt="The New York Times" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="<tc-webtag:linkTracking link='http://www.nytimes.com/idg/IDG_002570DE00740E1800257384005A2F1F.html?ref=technology' refer='pr_index' />">College Coders Vie for Cash in Contest</a></h3>
                        <p>It would go nicely with the $60000 in cash he won in other TopCoder events. But the soft-spoken Mitrichev (<tc-webtag:handle coderId="10574855" context="algorithm" />), 22, said he didn't come to the event purely for ...  <small><a target="_blank" href="<tc-webtag:linkTracking link='http://www.nytimes.com/idg/IDG_002570DE00740E1800257384005A2F1F.html?ref=technology' refer='pr_index' />">[November 1]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- The New York Times end --%>
                
                <%-- Investor's Business Daily begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="<tc-webtag:linkTracking link='/i/pressroom/pdfs/ibd_20071031.pdf' refer='pr_index' />"><img src="/i/pressroom/investorsBusinessDaily_logo.png" alt="Investor's Business Daily" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="<tc-webtag:linkTracking link='http://www.thefreelibrary.com/TopCoder+Finds+Tech+Top+Guns-a01610910252' refer='pr_index' />">TopCoder Finds Tech Top Guns</a></h3>
                        <p>When 120 student software programmers descend on Walt Disney World in Florida on Tuesday, they won't meet Mickey Mouse.  <small><a target="_blank" href="<tc-webtag:linkTracking link='http://www.thefreelibrary.com/TopCoder+Finds+Tech+Top+Guns-a01610910252' refer='pr_index' />">[October 31]</a> | <a target="_blank" href="<tc-webtag:linkTracking link='http://www.investors.com/editorial/IBDArticles.asp?artsec=17&artnum=1&issue=20071026' refer='pr_index' />">original article</a> | <a target="_blank" href="<tc-webtag:linkTracking link='/i/pressroom/pdfs/ibd_20071031.pdf' refer='pr_index' />">PDF</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Investor's Business Daily end --%>
                
                <%-- The Seattle Times begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="<tc-webtag:linkTracking link='http://archives.seattletimes.nwsource.com/cgi-bin/texis.cgi/web/vortex/display?slug=coder31m&date=20071031&query=michael+skinner' refer='pr_index' />"><img src="/i/pressroom/seattleTimes_logo.png" alt="The Seattle Times" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="<tc-webtag:linkTracking link='http://archives.seattletimes.nwsource.com/cgi-bin/texis.cgi/web/vortex/display?slug=coder31m&date=20071031&query=michael+skinner' refer='pr_index' />">Whose mouse is mightiest? UW code whiz hopes it's his</a></h3>
                        <p>Michael Skinner (<tc-webtag:handle coderId="7454301" context="marathon_match" />), a UW senior, is one of just two U.S. students among the 120 finalists in the 2007 TopCoder Collegiate Challenge.  <small><a target="_blank" href="<tc-webtag:linkTracking link='http://archives.seattletimes.nwsource.com/cgi-bin/texis.cgi/web/vortex/display?slug=coder31m&date=20071031&query=michael+skinner' refer='pr_index' />">[October 31]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- The Seattle Times end --%>
                
                <%-- TopCoder Announces 2008 TopCoder Open begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_100107"><img src="/i/pressroom/tco08_logo.png" alt="TopCoder Open 2008" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_100107">TopCoder Open to Feature World's Elite Software Developers in Competitive Programming's Top Tournament</a></h3>
                        <p>Las Vegas to Host New Software Symposium as TopCoder's Annual Computing Contest Expands;  120 to Compete for Top Honors and Share of $260,000 in Prize Money May 11-15, 2008.  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_100107">[October 1]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TopCoder Announces 2008 TopCoder Open end --%>
                
                <%-- TopCoder to Join Walt Mossberg and Bill Taylor Speaking at BIF-3 Collaborative Innovation Summit begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_092407"><img src="/i/pressroom/topcoder_logo.png" alt="TopCoder" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_092407">TopCoder to Join Walt Mossberg and Bill Taylor Speaking at BIF-3 Collaborative Innovation Summit</a></h3>
                        <p>TopCoder Chairman and Founder Jack Hughes will speak at the prestigious Business Innovation Factory's third Collaborative Innovation Summit (BIF-3), an intense, energetic, story-based conversation between America's most engaging public and private sector innovators.  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_092407">[September 24]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TopCoder to Join Walt Mossberg and Bill Taylor Speaking at BIF-3 Collaborative Innovation Summit end --%>
                
                <%-- TopCoder Named to Inc. Magazine's 500 Fastest-Growing Private Companies in America begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="/i/pressroom/pdfs/inc500_20070827.pdf"><img src="/i/pressroom/inc500_logo.png" alt="Inc. 500 logo" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_082707">TopCoder Named to Inc. Magazine's 500 Fastest-Growing Private Companies in America</a></h3>
                        <p>Inc. Magazine's "Inc. 500" ranks the fastest-growing privately held companies in the United States based on year-over-year sales growth. TopCoder is ranked 45 on this year's list, thanks to sales growth of more than 2,000 percent from 2003 to 2006.  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_082707">[August 27]</a> | <a target="_blank" href="/i/pressroom/pdfs/inc500_20070827.pdf">PDF</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TopCoder Named to Inc. Magazine's 500 Fastest-Growing Private Companies in America end --%>
                
                <%-- Lilly & Deutsche Bank Announced as New Sponsors & NSA Returns as Patron of TCCC07 begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_082407"><img src="/i/pressroom/tccc07_logo.png" alt="2007 TopCoder Collegiate Challenge" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_082407">Lilly &amp; Deutsche Bank Announced as New Sponsors &amp; NSA Returns as Patron of TCCC07</a></h3>
                        <p>Lilly and Deutsche Bank Onboard with Leading Collegiate Programming Contest National Security Agency Continues Patronage of Fifth Major Event  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_082407">[August 24]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Lilly & Deutsche Bank Announced as New Sponsors & NSA Returns as Patron of TCCC07 end --%>
                
                <%-- WNPR: Connecticut 6 State companies among fastest growing begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="<tc-webtag:linkTracking link='http://www.publicbroadcasting.net/wnpr/news.newsmain?action=article&ARTICLE_ID=1139736' refer='/pressroom_index' />"><img src="/i/pressroom/wnpr_logo.gif" alt="WNPR logo" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="<tc-webtag:linkTracking link='http://www.publicbroadcasting.net/wnpr/news.newsmain?action=article&ARTICLE_ID=1139736' refer='/pressroom_index' />">6 State companies among fastest growing</a></h3>
                        <p>HARTFORD, CT - Six Connecticut companies have made the annual list of the 500 fastest growing companies in America, compiled by Inc. Magazine.  <small><a target="_blank" href="<tc-webtag:linkTracking link='http://www.publicbroadcasting.net/wnpr/news.newsmain?action=article&ARTICLE_ID=1139736' refer='/pressroom_index' />">[August 23]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- WNPR Connecticut: 6 State companies among fastest growing end --%>
                
                <%-- Fox TV: "Top Computer Programmers Compete" begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_080207"><img src="/i/pressroom/foxTVchicago_logo.png" alt="Fox TV Chicago logo" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_080207">Fox TV: "Top Computer Programmers Compete"</a></h3>
                        <p>The Chicago Fox TV affiliate recently ran a story on TopCoder featuring an interview with <tc-webtag:handle coderId="144400" context="algorithm"/>.  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_080207">[August 2]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Fox TV: "Top Computer Programmers Compete" end --%>
                
                <%-- TopCoder Announces New Collaboration Initiatives begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_071807"><img src="/i/pressroom/topcoder_logo.png" alt="TopCoder" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_071807">TopCoder Announces New Collaboration Initiatives</a></h3>
                        <p>TopCoder today announced a series of collaboration initiatives to further enhance its ability to work with its clients and community.  These plans will move forward under the direction of Ira Heffan, who was recently named General Counsel.  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_071807">[July 18]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TopCoder Announces New Collaboration Initiatives end --%>
                
                <%-- Computerworld: Programming's Crack Competitor begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="<tc-webtag:linkTracking link='/pdfs/press_room/computerworld_20070709.pdf' refer='pressroom_index' />"><img src="/i/pressroom/computerworld.gif" alt="Computerworld logo" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="<tc-webtag:linkTracking link='/pdfs/press_room/computerworld_20070709.pdf' refer='pressroom_index' />">Programming's Crack Competitor</a> [PDF]</h3>
                        <p>What kind of trophies do they give to programming champions? Jiazhi Wu would know. As an undergrad at Zhejiang University in China, Wu won a record 39 out of 45 programming contests held by TopCoder.  <small><a target="_blank" href="<tc-webtag:linkTracking link='/pdfs/press_room/computerworld_20070709.pdf' refer='pressroom_index' />">[July 11]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Computerworld: Programming's Crack Competitor end --%>
                
                <%-- Bill Taylor on big ideas begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="<tc-webtag:linkTracking link='http://technology.guardian.co.uk/opinion/story/0,,2120402,00.html' refer='pressroom_index' />"><img src="/i/pressroom/guardian_logo.png" alt="Guardian Unlimited logo" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="<tc-webtag:linkTracking link='http://technology.guardian.co.uk/opinion/story/0,,2120402,00.html' refer='pressroom_index' />">Programming's Crack Competitor</a></h3>
                        <p>In his latest column for <em>The Guardian</em>, Mavericks at Work author Bill Taylor asked "a big question facing all of us who are serious about our work and career: <em>Just how good am I, really?</em>," citing TopCoder as the type of competition today's professionals can use to prove themselves.  <small><a target="_blank" href="<tc-webtag:linkTracking link='http://technology.guardian.co.uk/opinion/story/0,,2120402,00.html' refer='pressroom_index' />">[July 10]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Bill Taylor on big ideas end --%>
                
                <%-- TCO07 Live Coverage begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_062507"><img src="/i/pressroom/tco07_logo.png" alt="TCO07" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_062507">Live Coverage of 2007 TopCoder Open to Feature Broadcast Team, Interviews and Behind-the-Scenes Action</a></h3>
                        <p>The TopCoder Open, which will be presented live by at <a target="_blank" href="<tc-webtag:linkTracking link='http://dev.aol.com' refer='pr_062507' />">http://dev.aol.com</a> on June 29, will be hosted by sportscasting celebrity Jeremy Schaap, Google's John Dethridge, a former TopCoder champion and five time onsite finalist, and Ken Vogel, a 2002 quarter finalist and currently a director in equities IT with UBS. The webcast will also include live views of the arena, entertaining profiles and interviews.  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_062507">[June 25]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TCO07 Live Coverage end --%>
                
                <%-- Computerworld: Outsourcing the eBay way begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="<tc-webtag:linkTracking link='http://www.computerworld.com.au/index.php/id;1241090047;fp;2;fpid;1' refer='pressroom_index' />"><img src="/i/pressroom/computerworld.gif" alt="Computerworld logo" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="<tc-webtag:linkTracking link='http://www.computerworld.com.au/index.php/id;1241090047;fp;2;fpid;1' refer='pressroom_index' />">Outsourcing the eBay way</a></h3>
                        <p>TopCoder uses another approach to connect employers to overseas tech workers. Users of TopCoder's Web site submit development projects that are used as the basis of coding competitions between developers.  <small><a target="_blank" href="<tc-webtag:linkTracking link='http://www.computerworld.com.au/index.php/id;1241090047;fp;2;fpid;1' refer='pressroom_index' />">[June 15]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Computerworld: Outsourcing the eBay way end --%>
                
                <%-- TopCoder Community Helps Research Led by Harvard Business School Professor begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_061307"><img src="/i/pressroom/topcoder_logo.png" alt="TopCoder" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_061307">TopCoder Community Helps Research Led by Harvard Business School Professor</a></h3>
                        <p>TopCoder announced that its global community of members will help Professor Karim Lakhani of the Harvard Business School with his research agenda by providing access to their skills in innovative software development.  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_061307">[June 13]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TopCoder Community Helps Research Led by Harvard Business School Professor end --%>
                
                <%-- AOL to Webcast TopCoder Open 2007 Finals Live on June 29 begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_060507"><img src="/i/pressroom/tco07_logo.png" alt="TCO07" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_060507">AOL to Webcast TopCoder Open 2007 Finals Live on June 29</a></h3>
                        <p>TopCoder and AOL today announced that the 2007 TopCoder&#174; Open will be webcast live at the AOL&#174; Developer site (<a target="_blank" href="<tc-webtag:linkTracking link='http://dev.aol.com' refer='pr_060507' />">http://dev.aol.com</a>) on Friday, June 29. Coverage of the TCO07 finals from the Mirage Resort in Las Vegas begins at 21:00 GMT.  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_060507">[June 7]</a> - <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&d3=movieStream&clip=trailer&title=Trailer">Watch the trailer!</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- AOL to Webcast TopCoder Open 2007 Finals Live on June 29 end --%>
                
                <%-- TopCoder Announces Enhanced Focus on Financial Services Industry begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_060607"><img src="/i/pressroom/topcoder_logo.png" alt="TopCoder" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_060607">TopCoder Announces Enhanced Focus on Financial Services Industry</a></h3>
                        <p>TopCoder announced a strategic move to provide an enhanced response to the specific needs of the financial services industry. The company today detailed its plans to increase focus on financial services applications and software solutions through a series of initiatives under the guidance of industry veteran Dan Houlihan.  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_060607">[June 6]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TopCoder Announces Enhanced Focus on Financial Services Industry end --%>
                
                <%-- Yodlee to Sponsor TopCoder Single Round Match Series begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_052207"><img src="/i/pressroom/yodlee_logo.png" alt="Yodlee" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_052207">Yodlee to Sponsor TopCoder Single Round Match Series</a></h3>
                        <p>TopCoder today announced that Yodlee, a leader in online banking solutions, will sponsor a series of three SRMs beginning on May 29th and continuing on June 14th and July 12th. Each match will offer prize purses of $5,000 for a total of $15,000 in cash payouts over the three part series.  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_052207">[May 23]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Yodlee to Sponsor TopCoder Single Round Match Series end --%>
                
                <%-- Russian and Croatian High School Programmers Win TopCoder Championship at Purdue University begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_052307"><img src="/i/pressroom/tchs07.png" alt="TCHS07" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_052307">Russian and Croatian High School Programmers Win TopCoder Championship at Purdue University</a></h3>
                        <p>First World Championship for TopCoder High School Members Sees Eastern Europe Prevail in Individual and Team Tournaments  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_052307">[May 21]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Russian and Croatian High School Programmers Win TopCoder Championship at Purdue University end --%>
                
                <%-- TopCoder Appoints Russ Malz Vice President of Sales begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_040907"><img src="/i/pressroom/topcoder_logo.png" alt="TopCoder" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_040907">TopCoder Appoints Russ Malz Vice President of Sales</a></h3>
                        <p>TopCoder announced the appointment of Russ Malz as Vice President of Sales. In this role, Malz will be responsible for aligning TopCoder's capabilities with the growing corporate demand for high quality application development, and shaping the TopCoder competitive methodology platform to the enterprise market.  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_040907">[April 9]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TopCoder Appoints Russ Malz Vice President of Sales end --%>
                
                <%-- TopCoder Appoints Jiazhi Wu VP of Technology for China begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_040307"><img src="/i/pressroom/china_20061027.gif" alt="TopCoder &amp; China" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_040307">TopCoder Appoints Jiazhi Wu VP of Technology for China</a></h3>
                        <p>TopCoder announced it has hired Jiazhi Wu as Vice President of Technology for the company's operations in China. Wu, known by his handle "WishingBone", will oversee the development of systems and application development for all competitions and technologies and be responsible for introducing and training new members in China to the TopCoder software process.  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_040307">[April 3]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TopCoder Appoints Jiazhi Wu VP of Technology for China end --%>
                
                <%-- USA Today: Why Google put a research lab in Poland begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="<tc-webtag:linkTracking link='http://www.usatoday.com/tech/techinvestor/industry/2007-03-13-google-poland_N.htm' refer='pressroom_index' />"><img src="/i/pressroom/usatoday_logo.gif" alt="USA Today" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="<tc-webtag:linkTracking link='http://www.usatoday.com/tech/techinvestor/industry/2007-03-13-google-poland_N.htm' refer='pressroom_index' />">Why Google put a research lab in Poland</a></h3>
                        <p>"Last year's TopCoder Collegiate Challenge drew 21000 registrants from around the world, but half of the 48 finalists were from former Soviet bloc nations, including the winner, Petr Mitrichev of Russia, who also won last year's Global Code Jam."  <small><a target="_blank" href="<tc-webtag:linkTracking link='http://www.usatoday.com/tech/techinvestor/industry/2007-03-13-google-poland_N.htm' refer='pressroom_index' />">[March 13]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- USA Today: Why Google put a research lab in Poland end --%>
                
                <%-- TopCoder Announces TopCoder Open 2007 Sponsored by AOL begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_022207"><img src="/i/pressroom/tco07_logo.png" alt="TCO07" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_022207">TopCoder Announces TopCoder Open 2007 Sponsored by AOL</a></h3>
                        <p>Top 80 Programmers from Around the World to Compete for $260,000 in Prizes June 27th through 29th at The Mirage, Las Vegas.  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_022207">[February 22]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TopCoder Announces TopCoder Open 2007 Sponsored by AOL end --%>
                
                <%-- BusinessWeek: Ideagora, a Marketplace for Minds begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="<tc-webtag:linkTracking link='http://www.businessweek.com/print/innovate/content/feb2007/id20070215_251519.htm' refer='pressroom_index' />"><img src="/i/pressroom/businessweek_logo.gif" alt="BusinessWeek" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="<tc-webtag:linkTracking link='http://www.businessweek.com/print/innovate/content/feb2007/id20070215_251519.htm' refer='pressroom_index' />">Ideagora, a Marketplace for Minds</a></h3>
                        <p>Companies seeking solutions to seemingly insoluble problems can tap the insights of hundreds of thousands of enterprising scientists without having to employ everybody full-time. This shift is rippling through Corporate America and changing the way companies invent and develop products and services.  <small><a target="_blank" href="<tc-webtag:linkTracking link='http://www.businessweek.com/print/innovate/content/feb2007/id20070215_251519.htm' refer='pressroom_index' />">[February 15]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- BusinessWeek: Ideagora, a Marketplace for Minds end --%>
                
                <%-- Computerworld: Microsoft launches 'mashup' competition for developers begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="<tc-webtag:linkTracking link='http://www.computerworld.com/action/article.do?command=viewArticleBasic&taxonomyId=11&articleId=9011098&intsrc=hm_topic' refer='pressroom_index' />"><img src="/i/pressroom/computerworld.gif" alt="Computerworld logo" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="<tc-webtag:linkTracking link='http://www.computerworld.com/action/article.do?command=viewArticleBasic&taxonomyId=11&articleId=9011098&intsrc=hm_topic' refer='pressroom_index' />">Microsoft launches 'mashup' competition for developers</a></h3>
                        <p>Microsoft Corp. and BT Group PLC launched a competition to encourage developers to create "network mashups" that merge telecommunications features such as voice and text messaging with Web 2.0 applications like mapping and search... TopCoder Inc., which runs several competitions for programmers, will manage the Microsoft/BT event.  <small><a target="_blank" href="<tc-webtag:linkTracking link='http://www.computerworld.com/action/article.do?command=viewArticleBasic&taxonomyId=11&articleId=9011098&intsrc=hm_topic' refer='pressroom_index' />">[February 14]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Computerworld: Microsoft launches 'mashup' competition for developers end --%>
                
                <%-- TCHS07 begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_021307"><img src="/i/pressroom/tchs07.png" alt="TCHS07" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_021307">Registration Opens for First TopCoder High School Global Programming Tournament</a></h3>
                        <p>The TopCoder High School Tournament follows in the full tradition of the company's flagship TopCoder Open and TopCoder Collegiate Challenge professional and collegiate events by providing a world class platform for high school students.  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_021307">[February 13]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TCHS07 end --%>
                
                <%-- MS CSF begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_021207"><img src="/i/pressroom/csflogo.png" alt="Microsoft CSF Logo" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_021207">Connected Services Sandbox Launches</a></h3>
                        <p>TopCoder has announced the launch of the Connected Services Sandbox competition series for Microsoft and BT. TopCoder will manage the competitions to help promote the development of innovative customer solutions that merge traditional telecommunications offerings.  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_021207">[February 12]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- MS CSF end --%>
                
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

                <%-- TCO06 VeriSign begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_121905"><img src="/i/pressroom/verisign_logo.gif" alt="VeriSign" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_121905">TopCoder Welcomes VeriSign as Return Sponsor of 2006 TopCoder Open in Las Vegas</a></h3>
                        <p>"We are proud to be a returning sponsor of the 2006 TopCoder Open, which provides companies like VeriSign a pool of talented professional and academic minds to choose the next-generation of employees that will develop advanced services and technologies."  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_121905">[December 19]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TCO06 VeriSign end --%>

                <%-- Forbes begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="http://www.forbes.com/home/work/2005/12/09/silicon-valley-hiring-cx_rr_1212hire.html"><img src="/i/pressroom/forbes_logo.gif" alt="Forbes" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="http://www.forbes.com/home/work/2005/12/09/silicon-valley-hiring-cx_rr_1212hire.html">Help Wanted In Silicon Valley</a></h3>
                        <p>For programmers, happy days are here again. But for their employers, fear is setting in.  <small><a target="_blank" href="http://www.forbes.com/home/work/2005/12/09/silicon-valley-hiring-cx_rr_1212hire.html">[December 12]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Forbes end --%>

                <%-- BusinessWeek begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="http://www.businessweek.com/magazine/content/05_50/b3963021.htm"><img src="/i/pressroom/businessweekCover120205.jpg" alt="BusinessWeek" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="http://www.businessweek.com/magazine/content/05_50/b3963021.htm">Rise Of A Powerhouse</a></h3>
                        <p>How the young knowledge workers of Central Europe are pushing the region to a new level.<br />They came from around the world, young men with handles like SnapDragon and Bladerunner attacking computing problems so complex that even experienced coders could only stare at the screen in bewilderment. Only one mastered the final algorithm problem: Eryk Kopczynski, a.k.a. Eryx, a reticent Warsaw University student who wears his long hair in a ponytail and says his life's ambition is to "discover some interesting notion."  <small><a target="_blank" href="http://www.businessweek.com/magazine/content/05_50/b3963021.htm">[December 2]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- BusinessWeek end --%>

                <%-- USA Today begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="/pdfs/press_room/usatoday_113005.pdf"><img src="/i/pressroom/usatoday_logo.gif" alt="USA Today" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="/pdfs/press_room/usatoday_113005.pdf">TopCoder Survey in USA Today</a> [PDF]</h3>
                        <p>A TopCoder survey on where members would prefer to work (given equal pay) is running as a Snapshot in today's Money section of USA Today (bottom left).  <small><a target="_blank" href="/pdfs/press_room/usatoday_113005.pdf">[November 30]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- USA Today end --%>

                <%-- Google Code Jam China begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="http://www.infoworld.com/article/05/11/22/HNgooglecompetition_1.html"><img src="/i/pressroom/infoworld_logo.gif" alt="InfoWorld" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="http://www.infoworld.com/article/05/11/22/HNgooglecompetition_1.html">Google to hold programming competition in China</a></h3>
                        <p>Hoping to attract talented Chinese programmers to Google's (Profile, Products, Articles) planned research and development (R&D) center in Beijing, the company will host a programming competition, called the Google China Code Jam.  <small><a target="_blank" href="http://www.infoworld.com/article/05/11/22/HNgooglecompetition_1.html">[November 22]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Google Code Jam China end --%>

                <%-- DES/DEV $1 million begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_112105"><img src="/i/pressroom/milestone_million.gif" alt="Milestone: $1 Million" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_112105">TopCoder Payouts to Winners of Design and Development Competitions Surpass $1 Million</a></h3>
                        <p>"The strength of TopCoder, simply put, is the TopCoder community - that's what makes us unique and successful," said Jack Hughes, Chairman and Founder of TopCoder, Inc.  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_112105">[November 21]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- DES/DEV $1 million end --%>

                <%-- FTP ONLINE begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="http://www.ftponline.com/weblogger/forum.aspx?ID=13&DATE=11/01/2005&blog=#449"><img src="/i/pressroom/ftponline_logo.gif" alt="FTP Online" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="http://www.ftponline.com/weblogger/forum.aspx?ID=13&DATE=11/01/2005&blog=#449">Spirited Reusable Component Development</a></h3>
                        <p>The key to TopCoder's approach is the building of reusable components that can be adopted by customers to not only help these organizations save money on software development, but to employ a rigorous engineering methodology that lays out the metrics for the application project deliverables.  <small><a target="_blank" href="http://www.ftponline.com/weblogger/forum.aspx?ID=13&DATE=11/01/2005&blog=#449">[November 1]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- FTP ONLINE end --%>

                <%-- Info Week begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="http://www.informationweek.com/showArticle.jhtml?articleID=172901456"><img src="/i/pressroom/info_week_logo.gif" alt="Information Week" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="http://www.informationweek.com/showArticle.jhtml?articleID=172901456">Winning Design Ways</a></h3>
                        <p>Tim "Pops" Roberts is an independent IT consultant who makes a pretty good living doing contract project-management work. But it's his side job that gets his creative juices flowing: competing in software-design contests, in which the winning creations are used as building blocks for real business.  <small><a target="_blank" href="http://www.informationweek.com/showArticle.jhtml?articleID=172901456">[October 31]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Info Week end --%>

                <%-- TCO06 begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_102105"><img src="/i/pressroom/lasvegas_logo.gif" alt="Las Vegas" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_102105">TopCoder Selects Aladdin Resort in Las Vegas for TopCoder Open 2006</a></h3>
                        <p>TopCoder today announced that the world famous Aladdin Resort and Casino in Las Vegas, Nevada will host its 2006 flagship event, the TopCoder Open, May 3rd through 5th, 2006.  <small><a target="_blank" href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_102105">[October 21]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TCO06 end --%>

                <%-- TCO05 Winners begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_101705"><img src="/i/pressroom/tco05_logo.gif" alt="TCO05" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_101705">Champions Announced In 2005 TopCoder&#174; Open Sponsored by Sun Microsystems</a></h3>
                        <p>Eryk Kopczy&#241;ski of Poland, Nikolay Archak of the Russian Federation, and Qi Liu of China have won the Algorithm, Design and Development Component tournaments of the 2005 TopCoder Open sponsored by Sun, held at the Santa Clara Marriott in Santa Clara, CA on October 14th.  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_101705">[October 17]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TCO05 Winners end --%>

                <%-- Mass High Tech begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="http://www.masshightech.com/displayarticledetail.asp?Art_ID=69982"><img src="/i/pressroom/mass_high_tech.gif" alt="Mass High Tech" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="http://www.masshightech.com/displayarticledetail.asp?Art_ID=69982">Sorrowful state of software</a></h3>
                        <p>"I think it's critical to improve the level of quality," [Jack Hughes] said. Hughes has immersed himself in the development world for more than 15 years.  <small><a target="_blank" href="http://www.masshightech.com/displayarticledetail.asp?Art_ID=69982">[October 17]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Mass High Tech end --%>

                <%-- Cary News begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="http://www.carynews.com/enterprise/story/2805639p-9249369c.html"><img src="/i/pressroom/carynews_logo.gif" alt="Cary News" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="http://www.carynews.com/enterprise/story/2805639p-9249369c.html">Ready, again, for TopCoder battle</a></h3>
                        <p>"Now working with computers with a financial industry consulting firm, Roberts relocated to Cary two and half years ago. He has been a regular on the TopCoder site since its start at the beginning of the decade - for the fun, and for the money."  <small><a href="http://www.carynews.com/enterprise/story/2805639p-9249369c.html">[September 28]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Cary News end --%>

                <%-- TCO05 Alg Finalists begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_092805"><img src="/i/pressroom/tco05_logo.gif" alt="TCO05" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_092805">Onsite Finalists Announced In 2005 TopCoder Open Sponsored by Sun Microsystems</a></h3>
                        <p>The 61 TopCoder onsite finalists represent 19 countries including China, Poland, the Russian Federation, South Africa, Japan, Australia and Argentina as well as the US.  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_092805">[September 28]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TCO05 Alg Finalists end --%>

                <%-- GCJ 05 winners begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="http://www.irishdev.com/NewsArticle.aspx?id=1046"><img src="/i/pressroom/irishdev_logo.gif" alt="Irish Dev" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="http://www.irishdev.com/NewsArticle.aspx?id=1046">Google announces Winner of 2005 Code Jam</a></h3>
                        <p>Google Inc. have announced Marek Cygan, a student at Warsaw University, as the grand prize winner of the 2005 Google Code Jam, Google's annual computer programming competition..."It's an honor to host the most talented computer programmers in the world," said Alan Eustace, vice president, Engineering and Research, Google Inc. "With more than twice as many participants in the Google Code Jam this year, competition was fierce. Congratulations to Marek and all of our finalists."  <small><a target="_blank" href="http://www.irishdev.com/NewsArticle.aspx?id=1046">[September 26]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- GCJ 05 winners end --%>

                <%-- PCWK begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_091205"><img src="/i/pressroom/pcwk_logo.gif" alt="PCWK" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_091205">Poland Takes the Lead</a> [Translation]</h3>
                        <p>Poland has just left the US behind and taken first place in TopCoder's country ranking. Warsaw University occupies the first place in university ranking (University of Wroclaw is 13th, Jagiellonian University is 14th).  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_091205">[September 12]</a> - <a target="_blank" href="http://www.pcworld.pl/news/82941.html">original article</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- PCWK end --%>

                <%-- ADT begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="http://www.adtmag.com/article.asp?id=11752"><img src="/i/pressroom/adt_logo.gif" alt="ADT" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="http://www.adtmag.com/article.asp?id=11752">Components for SOAs and Other App Dev Projects</a></h3>
                        <p>The result of the partnership between LogicLibrary and TopCoder reached earlier this year is that TopCoder's components for Java and .NET are now stored in Logidex, LogicLibrary's collaborative SDA management solution.  <small><a target="_blank" href="http://www.adtmag.com/article.asp?id=11752">[September 6]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- ADT end --%>

                <%-- TCO05 Component Finalists begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_090205"><img src="/i/pressroom/tco05_logo.gif" alt="TCO05" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_090205">TopCoder&#174; Announces First Software Developer Conference at 2005 TopCoder Open</a></h3>
                        <p>Attendees will be invited to participate in an open forum with lead technologists from TopCoder, clients and TopCoder Open finalists discussing real world examples.  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_090205">[September 2]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TCO05 Component Finalists end --%>

                <%-- Times of India begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="http://timesofindia.indiatimes.com/articleshow/1212895.cms"><img src="/i/pressroom/toi_logo.gif" alt="Times of India" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="http://timesofindia.indiatimes.com/articleshow/1212895.cms">Wanna codejam? May the best techie win</a></h3>
                        <p>It's the grand slam of programming or, as the tourney organiser calls it, 'the X-games of software development'. It's gruelling and needs speed, accuracy and skill. Sounds like a sports contest?  <small><a target="_blank" href="http://timesofindia.indiatimes.com/articleshow/1212895.cms">[August 28]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Times of India end --%>

                <%-- TCO05 Component Finalists begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_082405"><img src="/i/pressroom/tco05_logo.gif" alt="TCO05" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_082405">TopCoder&#174; Announces 16 Finalists in Component Tournament of 2005 TopCoder Open</a></h3>
                        <p>"We've seen a dramatic growth in the component division - more than twice the number of participants registered this year compared to last year and that really shows it's the hottest area of interest in TopCoder competitions," said Rob Hughes, President and COO of TopCoder.  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_082405">[August 24]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TCO05 Component Finalists end --%>

                <%-- DNDJ begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="/pdfs/press_room/dndj_082005.pdf"><img src="/i/pressroom/dndj_logo.gif" alt="DNDJ" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="/pdfs/press_room/dndj_082005.pdf">Engineering + Reuse = Savings</a> [PDF]</h3>
                        <p>Why are contract outsourcing and offshore development failing to deliver the expected benefit of lower costs and increased end-user satisfaction to enterprise software development users?  <small><a target="_blank" href="/pdfs/press_room/dndj_082005.pdf">[August 2005]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- DNDJ end --%>

                <%-- GCJ05 begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="http://www.google.com/intl/en/press/pressrel/codejam3.html"><img src="/i/pressroom/gcj05.gif" alt="GCJ 2005" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="http://www.google.com/intl/en/press/pressrel/codejam3.html">Registration Opens for Google Code Jam 2005</a></h3>
                        <p>Google's annual online coding competition consisting of a series of problem-solving challenges that invite participants to select a programming language and use their programming skills to code solutions to the problems.  <small><a href="http://www.google.com/intl/en/press/pressrel/codejam3.html">[July 25]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- GCJ05 end --%>

                <%-- CNN begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="/pdfs/press_room/cnn_072105.pdf"><img src="/i/pressroom/cnn_logo.gif" alt="CNN" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="/pdfs/press_room/cnn_072105.pdf">On your marks, get set, code!</a></h3>
                        <p>TopCoder chief operating officer Rob Hughes told CNN that the competitions were growing in popularity among software engineers, as well as among technology companies who use them to scout for future employees.  <small><a target="_blank" href="/pdfs/press_room/cnn_072105.pdf">[July 21]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- CNN end --%>

                <%-- TCO05 Yahoo! begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_071105"><img src="/i/pressroom/yahoo_logo.gif" alt="Yahoo!" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_071105">TopCoder&#174; Announces Return of Premier Sponsor to 2005 TopCoder Open</a></h3>
                        <p>"Yahoo! truly sees that we are at the dawn of a new era in recruiting in terms of world-class talent and world-wide distribution of that talent," said Rob Hughes, President and COO of TopCoder. "Yahoo!'s return as a longtime sponsor of TopCoder events shows the quality and reach of our member base."  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_071105">[July 11]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TCO05 Yahoo! end --%>

                <%-- TCO05 VeriSign begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_070705"><img src="/i/pressroom/verisign_logo.gif" alt="VeriSign" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_070705">VeriSign Sponsors 2005 TopCoder Open</a></h3>
                        <p>"With rapid advances in technology occurring everyday, companies are looking for the next generation of leaders to author the code that will provide the backbone for advanced applications."  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_070705">[July 7]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TCO05 VeriSign end --%>

                <%-- TCO05 Sun begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_062705"><img src="/i/pressroom/tco05_logo.gif" alt="TCO05 Sponsored by Sun" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_062705">TopCoder Announces Sun Microsystems as Title Sponsor for 2005 TopCoder Open</a></h3>
                        <p>"Sun is excited that this year's TopCoder Open Component Competition will introduce a Java-centric theme," said Dan Roberts, Group Manager Development Tools Marketing at Sun Microsystems.  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_062705">[June 27]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TCO05 Sun end --%>

                <%-- SRM Prizes begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_062005"><img src="/i/pressroom/tc_srm_prizes.gif" alt="TC SRM Prizes" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_062005">TopCoder&#174; Announces Return of Cash Prizes to Weekly Online Programming Contests</a></h3>
                        <p>$5,000 Purse at Stake During Select Matches as TopCoder Opens Sponsorship of Highly Popular Single Round Series.  <small><a target="_blank" href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_062005">[June 20]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- SRM Prizes end --%>

                <%-- Caliper begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_060705"><img src="/i/pressroom/caliper_logo.gif" alt="Caliper" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_060705">Caliper Hires TopCoder Software&#153; to Enhance Organizational Development Platform &amp; Services</a></h3>
                        <p>Leading Personality Assessment Firm Employs TopCoder's Reusable Component-Based Methodology to Support IT Functions Across the Enterprise.  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_060705">[June 7]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Caliper end --%>

                <%-- Roanoke.com begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="http://www.roanoke.com/business%5C24837.html"><img src="/i/pressroom/roanoke_logo.gif" alt="Roanoke.com" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="http://www.roanoke.com/business%5C24837.html">Geeks for Charity holds code to help New River charities</a></h3>
                        <p>If Brett Malone's plan works, some New River Valley organizations could benefit from a different kind of technology boom.  <small><a target="_blank" href="http://www.roanoke.com/business%5C24837.html">[June 4]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Roanoke.com end --%>

                <%-- Sourcing Mag begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="http://www.sourcingmag.com/home/home.aspx?i=18_6/3/2005_cn_507_2_00_00"><img src="/i/pressroom/sourcingmag_logo.gif" alt="Sourcing Mag" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="http://www.sourcingmag.com/home/home.aspx?i=18_6/3/2005_cn_507_2_00_00">How To Hire Best-of-Breed Programmers for Your Project</a></h3>
                        <p>TopCoder Software literally calls on the services of thousands of programmers all around the world for its development work -- and only the best results end up getting used in the code they provide to their clients. They believe their approach saves clients money and time. How do they pull it off?  <small><a target="_blank" href="http://www.sourcingmag.com/home/home.aspx?i=18_6/3/2005_cn_507_2_00_00">[June 2]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Sourcing Mag end --%>

                <%-- Queen's University TJ begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="http://www.queensjournal.ca/articlephp/point-vol133/issue1/news/story1"><img src="/i/pressroom/qutj_logo.gif" alt="Queen's University TJ" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="http://www.queensjournal.ca/articlephp/point-vol133/issue1/news/story1">Computer programmer wins big</a></h3>
                        <p>It's not often a student is awarded $13,000 U.S. for seven hours of work. Gary Linscott, ArtSci '05, took home the cash as the top prize winner in the 2005 TopCoder Collegiate Challenge.  <small><a target="_blank" href="http://www.queensjournal.ca/articlephp/point-vol133/issue1/news/story1">[May 24]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Queen's University TJ end --%>

                <%-- Boiler Station begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="http://www.boilerstation.com/planet/stories/200505160purdue_planet1116219600.shtml"><img src="/i/pressroom/boilerstation_logo.gif" alt="Boiler Station" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="http://www.boilerstation.com/planet/stories/200505160purdue_planet1116219600.shtml">Purdue computer programmer making his mark in competitions</a></h3>
                        <p>Tomasz Czajka, 23-year-old Purdue doctoral candidate, has already improved software for Microsoft and performed research for IBM. This summer he's headed to California to intern with a smaller company named Google.  <small><a target="_blank" href="http://www.boilerstation.com/planet/stories/200505160purdue_planet1116219600.shtml">[May 16]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Boiler Station end --%>

                <%-- TWST begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_051205"><img src="/i/pressroom/twst_logo.gif" alt="The Wall Street Transcript" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_051205">Interview with Jack Hughes</a></h3>
                        <p>The following is an interview The Wall Street Transcript had with Jack Hughes.  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_051205">[April 22]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TWST end --%>

                <%-- JavaOne begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_050205"><img src="/i/pressroom/javaone_event.gif" alt="JavaOne" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_050205">TopCoder&#174;-Powered Coding Challenge to Feature at Sun's 2005 JavaOne<sup>SM</sup> Conference</a></h3>
                        <p>TopCoder today announced that they are again teaming up with Sun Microsystems, Inc. (Nasdaq: SUNW) to host the JavaOne Coding Challenge at the tenth annual 2005 JavaOne conference, scheduled for June 27 - 30th at Moscone Center in San Francisco.  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_050205">[May 2]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- JavaOne end --%>

                <%-- CHE begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_040805"><img src="/i/pressroom/topcoder_logo.png" alt="TopCoder" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_040805">Code Warriors</a></h3>
                        <p>Young computer programmers battle for fame, money, and the love of algorithms  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_040805">[April 8]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- CHE end --%>

                <%-- BusinessWeek begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_042205"><img src="/i/pressroom/businessweek_logo.gif" alt="BusinessWeek" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_042205">How Google Searches - For Talent</a></h3>
                        <p>"It's a dog-eat-dog world," says Robert Hughes, president of TopCoder Inc., the Glastonbury (Conn.) testing company that runs the Code Jams. "Wherever the best talent is, Google wants them."  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_042205">[April 20]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- BusinessWeek end --%>

                <%-- SDT begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="/i/pressroom/SDT_041305.jpg"><img src="/i/pressroom/sd_times_logo.gif" alt="SDT" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="/i/pressroom/SDT_041305.jpg">LogicLibrary, TopCoder Business Brief</a></h3>
                        <p>Through a joint agreement, LogicLibrary will make TopCoder Software's component catalog available to the users of the Logidex asset management system.  <small><a target="_blank" href="/i/pressroom/SDT_041305.jpg">[April 13]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- SDT end --%>

                <%-- .NET Developer's Journal begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="http://www.sys-con.com/story/?storyid=49134"><img src="/i/pressroom/dndj_logo.gif" alt=".NET Developer's Journal" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="http://www.sys-con.com/story/?storyid=49134">LogicLibrary Checks Out TopCoder to Enable SOA</a></h3>
                        <p>This strategic partnership is intended to bolster the collection of "out-of-the box" content preinstalled with Logidex.  <small><a target="_blank" href="http://www.sys-con.com/story/?storyid=49134">[April 9]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- .NET Developer's Journal end --%>

                <%-- Barrhaven begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="/i/pressroom/040105.pdf"><img src="/i/pressroom/barrhaven_logo.gif" alt="Barrhaven Independent" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="/i/pressroom/040105.pdf">University computer whiz wins big at tech tourney</a></h3>
                        <p>A nice piece on the TCCC05 Component Development Competition Champion, Gary Linscott, aka gladius.  <small><a target="_blank" href="/i/pressroom/040105.pdf">[April 1]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Barrhaven end --%>

                <%-- Computer User Article begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="http://www.computeruser.com/articles/2404,1,1,1,0401,05.html"><img src="/i/pressroom/comp_user_logo.gif" alt="Computer User Article" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="http://www.computeruser.com/articles/2404,1,1,1,0401,05.html">Do you have what it takes?</a></h3>
                        <p>CIOs and other H.R. decision-makers have some specific ideas about what they want from IT job applicants. Setting yourself apart from the pack has never been more crucial, but how does one go about doing that?  <small><a target="_blank" href="http://www.computeruser.com/articles/2404,1,1,1,0401,05.html">[April 2005]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Computer User Article end --%>

                <%-- TCCC05 begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_031405a"><img src="/i/pressroom/tccc05_logo.gif" alt="TCCC05" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_031405a">Champions Announced In 2005 TCCC Sponsored by Yahoo!&#174;</a></h3>
                        <p>TopCoder today announced that Mathijs Vogelzang of the University of Groningen, The Netherlands, Adrian Nicolae Carcu of  the Babes-Bolyai Computer Science University, Romania, and Gary Linscott of Queens University, Canada have won the Algorithm, Design and Development Component tournaments of the 2005 TopCoder Collegiate Challenge sponsored by Yahoo!  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_031405a">[March 14]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TCCC05 end --%>

                <%-- Logic Library begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_031405b"><img src="/i/pressroom/logiclib_logo.gif" alt="Logic Library" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_031405b">LogicLibrary Teams with TopCoder to Accelerate SOA Deployments</a></h3>
                        <p>"As developers turn to SOA, reusable components are becoming the building blocks of applications because of their ability to reduce costs, streamline projects and improve productivity."  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_031405b">[March 14]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Logic Library end --%>

                <%-- TCCC05 begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_022205"><img src="/i/pressroom/tccc05_logo.gif" alt="TCCC05" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_022205">Semifinalists Announced for 2005 TCCC Sponsored by Yahoo!&#174;</a></h3>
                        <p>TopCoder today announced the 31 International onsite semifinalists who have advanced to the Championship rounds of the 2005 TopCoder Collegiate Challenge sponsored by Yahoo!  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_022205">[February 22]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TCCC05 end --%>

                <%-- NVIDIA TCCC begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_021605"><img src="/i/pressroom/nvidia_badge.gif" alt="NVIDIA" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_021605">NVIDIA Corporation Returns as Premier Sponsor of 2005 TopCoder&#174; Collegiate Challenge</a></h3>
                        <p>TopCoder announced NVIDIA Corporation (Nasdaq: NVDA), a worldwide leader in graphics and digital media processors, as Premier sponsor of its 2005 TopCoder Collegiate Challenge (TCCC 05).  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_021605">[February 16]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- NVIDIA TCCC end --%>

                <%-- Devloper Subscriptions begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_021505"><img src="/i/pressroom/tcs_logo.gif" alt="TCS" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_021505">TopCoder Software&#153; Opens Access to Reusable Java&#153; and .NET&#153; Component Catalogs</a></h3>
                        <p>TopCoder Software today announced TopCoder Software is providing individual member developers free subscriptions to its full catalog of software components.  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_021505">[February 15]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Devloper Subscriptions end --%>

                <%-- Newsweek Polska begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_021305"><img src="/i/pressroom/nw_polska_logo.gif" alt="Newsweek Poland" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_021305">Program for life</a></h3>
                        <p>They get their Ph.D.'s at the age of twenty. At thirty they become professors in America. Warsaw University graduates are some of the best computer scientists in the world.  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_021305">[February 13]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Newsweek Polska end --%>

                <%-- GICJ05 begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_020905"><img src="/i/pressroom/gicj05_logo.gif" alt="GICJ05" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_020905">Google Code Jam Comes to India</a></h3>
                        <p>The Google India Code Jam is an extension of Google's annual Code Jam competition and celebrates the art of computer science, demonstrating to software professionals everywhere the value Google places on excellent coding.  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_020905">[February 9]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- GICJ05 end --%>

                <%-- 50,000 begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_020705"><img src="/i/pressroom/50k_promo.gif" alt="50,000" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_020705">TC Community Surpasses 50,000 Worldwide Nears 10,000 Rated Member Mark</a></h3>
                        <p>In less than four years since the organization's inception, TopCoder programming tournaments have awarded more than $2 million in prize money to some of the best collegiate and professional programmers from 187 countries around the globe.  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_020705">[February 7]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- 50,000 end --%>

                <%-- Wired Article begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="http://www.wired.com/news/medtech/0,1286,66458,00.html?tw=wn_tophead_1"><img src="/i/pressroom/wired_logo.gif" alt="Wired" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="http://www.wired.com/news/medtech/0,1286,66458,00.html?tw=wn_tophead_1">Software Taming Gene Data Pool</a></h3>
                        <p>Software engineers are finally getting together with biologists to translate the pile of letters and numbers into scientific discoveries.  <small><a target="_blank" href="http://www.wired.com/news/medtech/0,1286,66458,00.html?tw=wn_tophead_1">[February 2]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Wired Article end --%>

                <%-- ADT begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_020105"><img src="/i/pressroom/adt_logo.gif" alt="ADT" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_020105">DE-CODER: The kings of coding</a></h3>
                        <p>"Tomek" and "Pops" may be unfamiliar names to you, but in the world of coding competitions, they're as big as rock stars.  Now they're at the top of the stack, according to their peers who participate in online programming contests at TopCoder.com, a mecca for those willing to publicly test their programming chops.  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_020105">[February 1]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- ADT end --%>

                <%-- CRPF begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_012505"><img src="/i/pressroom/crpf_logo.gif" alt="CRPF" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_012505">TCS Delivers for International Consortium of Spinal Cord Injury Researchers</a></h3>
                        <p>TopCoder today announced it has successfully deployed a high-quality, web-based application to disseminate critical microarray data between the Christopher Reeve Paralysis Foundation's (CRPF) Research Consortium on Spinal Cord Injury and the general scientific community.  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_012505">[January 25]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- CRPF end --%>

                <%-- TCCC05 MOTOROLA begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_011805"><img src="/i/pressroom/motorola_logo.gif" alt="Motorola" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_011805">TopCoder&#174; Announces Motorola as Premier Sponsor of 2005 TopCoder Collegiate Challenge</a></h3>
                        <p>TopCoder today announced Motorola, Inc., (NYSE: MOT), a global leader in wireless, broadband and automotive communications technologies, as a premier sponsor for its 2005 TopCoder Collegiate Challenge (TCCC 05).  <small><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_011805">[January 18]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TCCC05 MOTOROLA end --%>

                <%-- Computerworld article begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="http://www.computerworld.com/industrytopics/financial/story/0,10801,98834,00.html"><img src="/i/pressroom/compworld_logo.gif" alt="Computerworld" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="http://www.computerworld.com/industrytopics/financial/story/0,10801,98834,00.html">Code Reuse Pays Off for ING</a></h3>
                        <p>ING Americas last month finished work on a quality-management application built using an innovative development process that the company estimated saved it $300,000 and 1,200 man-hours.  <small><a target="_blank" href="http://www.computerworld.com/industrytopics/financial/story/0,10801,98834,00.html">[January 10]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Computerworld article end --%>

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