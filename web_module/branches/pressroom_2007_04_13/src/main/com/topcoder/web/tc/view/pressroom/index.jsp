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
            <li id="pr_menuactive"><a href="/tc?module=Static&d1=pressroom&d2=index" title="Current News"><span>Current News</span></a></li>
            <li><a href="/tc?module=Static&d1=pressroom&d2=pr_archive" title="Press Release Archive"><span>Press Release Archive</span></a></li>
            <li><a href="/tc?module=Static&d1=pressroom&d2=mediaResources" title="Media Resources"><span>Media Resources</span></a></li>
            <%--
            <li><a href="/tc?module=Static&d1=pressroom&d2=mediaRequestForm" title="Media Request Form"><span>Media Request Form</span></a></li>
            --%>
            <li><a href="/tc?module=Static&d1=pressroom&d2=art_archive" title="Articles Archive"><span>Articles Archive</span></a></li>
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
                    <span style="padding-left:90px;"><a href="<tc-webtag:linkTracking link='/tc?module=Static&d1=tournaments&d2=tccc07&d3=about' refer='pressroom_index' />"><img src="/i/home/tccc07.png" alt="TCCC07" /></a></span>
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
            
            <div class="pr_subheader">
                <h2><span>2007</span></h2>
            </div>
            
            <%-- pr_border creation --%>
            <div class="pr_box"><div class="pr_box2"><div class="pr_boxcontent">
                
                <%-- TopCoder Announces 2008 TopCoder Open begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&d1=pressroom&d2=pr_100107"><img src="/i/pressroom/tco08_logo.png" alt="TopCoder Open 2008" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&d1=pressroom&d2=pr_100107">TopCoder Open to Feature World's Elite Software Developers in Competitive Programming's Top Tournament</a></h3>
                        <p>Las Vegas to Host New Software Symposium as TopCoder's Annual Computing Contest Expands;  120 to Compete for Top Honors and Share of $260,000 in Prize Money May 11-15, 2008.  <small><a href="/tc?module=Static&d1=pressroom&d2=pr_100107">[October 1]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TopCoder Announces 2008 TopCoder Open end --%>
                
                <%-- TopCoder to Join Walt Mossberg and Bill Taylor Speaking at BIF-3 Collaborative Innovation Summit begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&d1=pressroom&d2=pr_092407"><img src="/i/pressroom/topcoder_logo.png" alt="TopCoder" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&d1=pressroom&d2=pr_092407">TopCoder to Join Walt Mossberg and Bill Taylor Speaking at BIF-3 Collaborative Innovation Summit</a></h3>
                        <p>TopCoder Chairman and Founder Jack Hughes will speak at the prestigious Business Innovation Factory's third Collaborative Innovation Summit (BIF-3), an intense, energetic, story-based conversation between America's most engaging public and private sector innovators.  <small><a href="/tc?module=Static&d1=pressroom&d2=pr_092407">[September 24]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TopCoder to Join Walt Mossberg and Bill Taylor Speaking at BIF-3 Collaborative Innovation Summit end --%>
                
                <%-- TopCoder Named to Inc. Magazine's 500 Fastest-Growing Private Companies in America begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&d1=pressroom&d2=pr_082707"><img src="/i/pressroom/topcoder_logo.png" alt="TopCoder" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&d1=pressroom&d2=pr_082707">TopCoder Named to Inc. Magazine's 500 Fastest-Growing Private Companies in America</a></h3>
                        <p>Inc. Magazine's "Inc. 500" ranks the fastest-growing privately held companies in the United States based on year-over-year sales growth. TopCoder is ranked 45 on this year's list, thanks to sales growth of more than 2,000 percent from 2003 to 2006.  <small><a href="/tc?module=Static&d1=pressroom&d2=pr_082707">[August 27]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TopCoder Named to Inc. Magazine's 500 Fastest-Growing Private Companies in America end --%>
                
                <%-- Lilly & Deutsche Bank Announced as New Sponsors & NSA Returns as Patron of TCCC07 begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&d1=pressroom&d2=pr_082407"><img src="/i/pressroom/tccc07_logo.png" alt="2007 TopCoder Collegiate Challenge" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&d1=pressroom&d2=pr_082407">Lilly &amp; Deutsche Bank Announced as New Sponsors &amp; NSA Returns as Patron of TCCC07</a></h3>
                        <p>Lilly and Deutsche Bank Onboard with Leading Collegiate Programming Contest National Security Agency Continues Patronage of Fifth Major Event  <small><a href="/tc?module=Static&d1=pressroom&d2=pr_082407">[August 24]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Lilly & Deutsche Bank Announced as New Sponsors & NSA Returns as Patron of TCCC07 end --%>
                
                <%-- 6 State companies among fastest growing begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="<tc-webtag:linkTracking link='http://www.publicbroadcasting.net/wnpr/news.newsmain?action=article&ARTICLE_ID=1139736' refer='/pressroom_index' />"><img src="/i/pressroom/topcoder_logo.png" alt="TopCoder" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a target="_blank" href="<tc-webtag:linkTracking link='http://www.publicbroadcasting.net/wnpr/news.newsmain?action=article&ARTICLE_ID=1139736' refer='/pressroom_index' />">6 State companies among fastest growing</a></h3>
                        <p>HARTFORD, CT - Six Connecticut companies have made the annual list of the 500 fastest growing companies in America, compiled by Inc. Magazine.  <small><a target="_blank" href="<tc-webtag:linkTracking link='http://www.publicbroadcasting.net/wnpr/news.newsmain?action=article&ARTICLE_ID=1139736' refer='/pressroom_index' />">[August 23]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- 6 State companies among fastest growing end --%>
                
                <%-- Fox TV: "Top Computer Programmers Compete" begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&d1=pressroom&d2=art_080207"><img src="/i/pressroom/topcoder_logo.png" alt="TopCoder" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&d1=pressroom&d2=art_080207">Fox TV: "Top Computer Programmers Compete"</a></h3>
                        <p>The Chicago Fox TV affiliate recently ran a story on TopCoder featuring an interview with <tc-webtag:handle coderId="144400" context="algorithm"/>.  <small><a href="/tc?module=Static&d1=pressroom&d2=art_080207">[August 2]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Fox TV: "Top Computer Programmers Compete" end --%>
                
                <%-- TopCoder Announces New Collaboration Initiatives begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&d1=pressroom&d2=pr_071807"><img src="/i/pressroom/topcoder_logo.png" alt="TopCoder" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&d1=pressroom&d2=pr_071807">TopCoder Announces New Collaboration Initiatives</a></h3>
                        <p>TopCoder today announced a series of collaboration initiatives to further enhance its ability to work with its clients and community.  These plans will move forward under the direction of Ira Heffan, who was recently named General Counsel.  <small><a href="/tc?module=Static&d1=pressroom&d2=pr_071807">[July 18]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TopCoder Announces New Collaboration Initiatives end --%>
                
                <%-- Computerworld: Programming's Crack Competitor begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="<tc-webtag:linkTracking link='/pdfs/press_room/computerworld_20070709.pdf' refer='pressroom_index' />"><img src="/i/pressroom/computerworld.gif" alt="ComputerWorld logo" border="0" /></a>
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
                        <a href="/tc?module=Static&d1=pressroom&d2=pr_062507"><img src="/i/pressroom/tco07_logo.png" alt="TCO07" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&d1=pressroom&d2=pr_062507">Live Coverage of 2007 TopCoder Open to Feature Broadcast Team, Interviews and Behind-the-Scenes Action</a></h3>
                        <p>The TopCoder Open, which will be presented live by at <a target="_blank" href="<tc-webtag:linkTracking link='http://dev.aol.com' refer='pr_062507' />">http://dev.aol.com</a> on June 29, will be hosted by sportscasting celebrity Jeremy Schaap, Google's John Dethridge, a former TopCoder champion and five time onsite finalist, and Ken Vogel, a 2002 quarter finalist and currently a director in equities IT with UBS. The webcast will also include live views of the arena, entertaining profiles and interviews.  <small><a href="/tc?module=Static&d1=pressroom&d2=pr_062507">[June 25]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TCO07 Live Coverage end --%>
                
                <%-- Computerworld: Outsourcing the eBay way begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a target="_blank" href="<tc-webtag:linkTracking link='http://www.computerworld.com.au/index.php/id;1241090047;fp;2;fpid;1' refer='pressroom_index' />"><img src="/i/pressroom/computerworld.gif" alt="ComputerWorld logo" border="0" /></a>
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
                        <a href="/tc?module=Static&d1=pressroom&d2=pr_061307"><img src="/i/pressroom/topcoder_logo.png" alt="TopCoder" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&d1=pressroom&d2=pr_061307">TopCoder Community Helps Research Led by Harvard Business School Professor</a></h3>
                        <p>TopCoder announced that its global community of members will help Professor Karim Lakhani of the Harvard Business School with his research agenda by providing access to their skills in innovative software development.  <small><a href="/tc?module=Static&d1=pressroom&d2=pr_061307">[June 13]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TopCoder Community Helps Research Led by Harvard Business School Professor end --%>
                
                <%-- AOL to Webcast TopCoder Open 2007 Finals Live on June 29 begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&d1=pressroom&d2=pr_060507"><img src="/i/pressroom/tco07_logo.png" alt="TCO07" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&d1=pressroom&d2=pr_060507">AOL to Webcast TopCoder Open 2007 Finals Live on June 29</a></h3>
                        <p>TopCoder and AOL today announced that the 2007 TopCoder&#174; Open will be webcast live at the AOL&#174; Developer site (<a target="_blank" href="<tc-webtag:linkTracking link='http://dev.aol.com' refer='pr_060507' />">http://dev.aol.com</a>) on Friday, June 29. Coverage of the TCO07 finals from the Mirage Resort in Las Vegas begins at 21:00 GMT.  <small><a href="/tc?module=Static&d1=pressroom&d2=pr_060507">[June 7]</a></small> - <a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=movieStream&clip=trailer&title=Trailer">Watch the trailer!</a></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- AOL to Webcast TopCoder Open 2007 Finals Live on June 29 end --%>
                
                <%-- TopCoder Announces Enhanced Focus on Financial Services Industry begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&d1=pressroom&d2=pr_060607"><img src="/i/pressroom/topcoder_logo.png" alt="TopCoder" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&d1=pressroom&d2=pr_060607">TopCoder Announces Enhanced Focus on Financial Services Industry</a></h3>
                        <p>TopCoder announced a strategic move to provide an enhanced response to the specific needs of the financial services industry. The company today detailed its plans to increase focus on financial services applications and software solutions through a series of initiatives under the guidance of industry veteran Dan Houlihan.  <small><a href="/tc?module=Static&d1=pressroom&d2=pr_060607">[June 6]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TopCoder Announces Enhanced Focus on Financial Services Industry end --%>
                
                <%-- Yodlee to Sponsor TopCoder Single Round Match Series begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&d1=pressroom&d2=pr_052207"><img src="/i/pressroom/yodlee_logo.png" alt="Yodlee" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&d1=pressroom&d2=pr_052207">Yodlee to Sponsor TopCoder Single Round Match Series</a></h3>
                        <p>TopCoder today announced that Yodlee, a leader in online banking solutions, will sponsor a series of three SRMs beginning on May 29th and continuing on June 14th and July 12th. Each match will offer prize purses of $5,000 for a total of $15,000 in cash payouts over the three part series.  <small><a href="/tc?module=Static&d1=pressroom&d2=pr_052207">[May 23]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Yodlee to Sponsor TopCoder Single Round Match Series end --%>
                
                <%-- Russian and Croatian High School Programmers Win TopCoder Championship at Purdue University begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&d1=pressroom&d2=pr_052307"><img src="/i/pressroom/tchs07.png" alt="TCHS07" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&d1=pressroom&d2=pr_052307">Russian and Croatian High School Programmers Win TopCoder Championship at Purdue University</a></h3>
                        <p>First World Championship for TopCoder High School Members Sees Eastern Europe Prevail in Individual and Team Tournaments  <small><a href="/tc?module=Static&d1=pressroom&d2=pr_052307">[May 21]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- Russian and Croatian High School Programmers Win TopCoder Championship at Purdue University end --%>
                
                <%-- TopCoder Appoints Russ Malz Vice President of Sales begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&d1=pressroom&d2=pr_040907"><img src="/i/pressroom/topcoder_logo.png" alt="TopCoder" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&d1=pressroom&d2=pr_040907">TopCoder Appoints Russ Malz Vice President of Sales</a></h3>
                        <p>TopCoder announced the appointment of Russ Malz as Vice President of Sales. In this role, Malz will be responsible for aligning TopCoder's capabilities with the growing corporate demand for high quality application development, and shaping the TopCoder competitive methodology platform to the enterprise market.  <small><a href="/tc?module=Static&d1=pressroom&d2=pr_040907">[April 9]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TopCoder Appoints Russ Malz Vice President of Sales end --%>
                
                <%-- TopCoder Appoints Jiazhi Wu VP of Technology for China begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&d1=pressroom&d2=pr_040307"><img src="/i/pressroom/china_20061027.gif" alt="TopCoder &amp; China" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&d1=pressroom&d2=pr_040307">TopCoder Appoints Jiazhi Wu VP of Technology for China</a></h3>
                        <p>TopCoder announced it has hired Jiazhi Wu as Vice President of Technology for the company's operations in China. Wu, known by his handle "WishingBone", will oversee the development of systems and application development for all competitions and technologies and be responsible for introducing and training new members in China to the TopCoder software process.  <small><a href="/tc?module=Static&d1=pressroom&d2=pr_040307">[April 3]</a></small></p>
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
                        <a href="/tc?module=Static&d1=pressroom&d2=pr_022207"><img src="/i/pressroom/tco07_logo.png" alt="TCO07" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&d1=pressroom&d2=pr_022207">TopCoder Announces TopCoder Open 2007 Sponsored by AOL</a></h3>
                        <p>Top 80 Programmers from Around the World to Compete for $260,000 in Prizes June 27th through 29th at The Mirage, Las Vegas.  <small><a href="/tc?module=Static&d1=pressroom&d2=pr_022207">[February 22]</a></small></p>
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
                        <a href="/tc?module=Static&d1=pressroom&d2=pr_021307"><img src="/i/pressroom/tchs07.png" alt="TCHS07" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&d1=pressroom&d2=pr_021307">Registration Opens for First TopCoder High School Global Programming Tournament</a></h3>
                        <p>The TopCoder High School Tournament follows in the full tradition of the company's flagship TopCoder Open and TopCoder Collegiate Challenge professional and collegiate events by providing a world class platform for high school students.  <small><a href="/tc?module=Static&d1=pressroom&d2=pr_021307">[February 13]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- TCHS07 end --%>
                
                <%-- MS CSF begin --%>
                <div class="pr_newsitem">
                    <div class="pr_img">
                        <a href="/tc?module=Static&d1=pressroom&d2=pr_021207"><img src="/i/pressroom/csflogo.png" alt="Microsoft CSF Logo" border="0" /></a>
                    </div>
                    <div class="pr_headlines">
                        <h3><a href="/tc?module=Static&d1=pressroom&d2=pr_021207">Connected Services Sandbox Launches</a></h3>
                        <p>TopCoder has announced the launch of the Connected Services Sandbox competition series for Microsoft and BT. TopCoder will manage the competitions to help promote the development of innovative customer solutions that merge traditional telecommunications offerings.  <small><a href="/tc?module=Static&d1=pressroom&d2=pr_021207">[February 12]</a></small></p>
                    </div>
                    <div class="pr_clear"></div>
                </div>
                <%-- MS CSF end --%>
                
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