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
            <jsp:include page="../includes/global_left.jsp">
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
        <li id="pr_menuactive"><a href="/tc?module=Static&d1=pressroom&d2=pr_archive" title="Press Release Archive"><span>Press Release Archive</span></a></li>
        <li><a href="/tc?module=Static&d1=pressroom&d2=mediaResources" title="Media Resources"><span>Media</span></a></li>
        <li><a href="/tc?module=Static&d1=pressroom&d2=mediaRequestForm" title="Media Request Form"><span>Media Request Form</span></a></li>
        <li><a href="/tc?module=Static&d1=pressroom&d2=art_archive" title="Articles Archive"><span>Articles Archive</span></a></li>
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
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_100107">TopCoder Open to Feature World's Elite Software Developers in Competitive Programming's Top Tournament <br /><small style="margin-left:10px;">[October 1]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_092407">TopCoder to Join Walt Mossberg and Bill Taylor Speaking at BIF-3 Collaborative Innovation Summit <br /><small style="margin-left:10px;">[September 24]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_082707">TopCoder Named to Inc. Magazine's 500 Fastest-Growing Private Companies in America <br /><small style="margin-left:10px;">[August 27]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_082407">Lilly &amp; Deutsche Bank Announced as New Sponsors &amp; NSA Returns as Patron of 2007 TopCoder Collegiate Challenge <br /><small style="margin-left:10px;">[August 24]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_071807">TopCoder Announces New Collaboration Initiatives for Working with Clients and Community <br /><small style="margin-left:10px;">[July 18]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_062507">Live Coverage of 2007 TopCoder Open to Feature Broadcast Team, Interviews and Behind-the-Scenes Action <br /><small style="margin-left:10px;">[June 25]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_061307">TopCoder Community Helps Research Led by Harvard Business School Professor <br /><small style="margin-left:10px;">[June 13]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_060507">AOL to Webcast TopCoder Open 2007 Finals Live on June 29 <br /><small style="margin-left:10px;">[June 7]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_060607">TopCoder Announces Enhanced Focus on Financial Services Industry <br /><small style="margin-left:10px;">[June 6]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_052207">Yodlee to Sponsor TopCoder Single Round Match Series <br /><small style="margin-left:10px;">[May 23]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_052307">Russian and Croatian High School Programmers Win TopCoder Championship at Purdue University <br /><small style="margin-left:10px;">[May 21]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_040907">TopCoder Appoints Russ Malz Vice President of Sales <br /><small style="margin-left:10px;">[April 9]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_040307">TopCoder Appoints Jiazhi Wu VP of Technology for China <br /><small style="margin-left:10px;">[April 3]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_022207">TopCoder Announces TopCoder Open 2007 Sponsored by AOL <br /><small style="margin-left:10px;">[February 22]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_021307">Registration Opens for First TopCoder High School Global Programming Tournament <br /><small style="margin-left:10px;">[February 13]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_021207">Connected Services Sandbox Launches <br /><small style="margin-left:10px;">[February 12]</small></a></dd>
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
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_113006">AOL and TopCoder Announce Web AIM Mashup Competition <br /><small style="margin-left:10px;">[November 30]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_112906">TopCoder to Present Keynote Address: Future of Virtual Communities as Business; at Gartner CIO Summit 2006 <br /><small style="margin-left:10px;">[November 29]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_112106">Russia's nicka81 and Petr, China's PE Triumph at TopCoder Collegiate Challenge in San Diego <br /><small style="margin-left:10px;">[November 21]</small></a></dd>
                    <dd><a target="_blank" href="http://www.prnewswire.com/mnr/topcoder/26099/">Meet the AOL TCCC Webcast Team <br /><small style="margin-left:10px;">[November 13]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_102506">TopCoder Launches Operations in China with New Beijing Appointment <br /><small style="margin-left:10px;">[October 25]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_102306">Semifinalists Announced for 2006 TopCoder Collegiate Challenge Sponsored by AOL <br /><small style="margin-left:10px;">[October 23]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_101106">AOL to Webcast TopCoder World Championship of Computer Programming Live on November 17 <br /><small style="margin-left:10px;">[October 11]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_101006">TopCoder Identified As Business Leader and Innovator In New Book "Mavericks at Work" <br /><small style="margin-left:10px;">[October 10]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_082906">NSA Continues TopCoder Patronage with Support of 2006 TopCoder Collegiate Challenge in San Diego <br /><small style="margin-left:10px;">[August 29]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_071206">UBS Extends Premier Sponsorship of TopCoder Events <br /><small style="margin-left:10px;">[July 12]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_062606">TopCoder Announces Bloomberg L.P. As Premier Sponsor of TCCC06 <br /><small style="margin-left:10px;">[June 26]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_061906">AOL Named Title Sponsor of 2006 TopCoder Collegiate Challenge <br /><small style="margin-left:10px;">[June 19]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_060706">Science Museum of Minnesota Partners with TopCoder High School Competitions <br /><small style="margin-left:10px;">[June 7]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_060606">AOL, Bloomberg, UBS and NSA Announced as Sponsors/Patrons of 2006 TopCoder Collegiate Challenge <br /><small style="margin-left:10px;">[June 6]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_050806">Russian, US and Indonesian Programmers Win $150,000 TopCoder Open Sponsored By AMD in Las Vegas <br /><small style="margin-left:10px;">[May 8]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_031606">TopCoder Announces AMD as Title Sponsor of 2006 TopCoder Open in Las Vegas <br /><small style="margin-left:10px;">[March 16]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_030306">TopCoder Names UBS as Premier Sponsor of 2006 TopCoder Open <br /><small style="margin-left:10px;">[March 3]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_020806">TopCoder High School Launches Global Programming Tournament in June <br /><small style="margin-left:10px;">[February 8]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_012606">TopCoder Software Component Libraries Selected as Finalist for the 16th Annual Jolt Awards <br /><small style="margin-left:10px;">[January 26]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_012306">TopCoder Names Intel Corporation as First Sponsor of New Marathon Match Series <br /><small style="margin-left:10px;">[January 23]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_010906">TopCoder Announces NSA Participation in 2006 TopCoder Open in Las Vegas <br /><small style="margin-left:10px;">[January 9]</small></a></dd>
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
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_121905">TopCoder Welcomes VeriSign as Return Sponsor of 2006 TopCoder Open in Las Vegas <br /><small style="margin-left:10px;">[December 19]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_112105">TopCoder Payouts to Winners of Design and Development Competitions Surpass $1 Million <br /><small style="margin-left:10px;">[November 21]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_102105">TopCoder Selects Aladdin Resort in Las Vegas for TopCoder Open 2006 <br /><small style="margin-left:10px;">[October 21]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_101705">Champions Announced In 2005 TopCoder&#174; Open Sponsored by Sun Microsystems <br /><small style="margin-left:10px;">[October 17]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_092805">Onsite Finalists Announced In 2005 TopCoder Open Sponsored by Sun Microsystems <br /><small style="margin-left:10px;">[September 28]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_090205">TopCoder&#174; Announces First Software Developer Conference at 2005 TopCoder Open <br /><small style="margin-left:10px;">[September 2]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_082405">TopCoder&#174; Announces 16 Finalists in Component Tournament of 2005 TopCoder Open <br /><small style="margin-left:10px;">[August 24]</small></a></dd>
                    <dd><a target="_blank" href="http://www.google.com/intl/en/press/pressrel/codejam3.html">Registration Opens for Google Code Jam 2005 <br /><small style="margin-left:10px;">[July 25]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_071105">TopCoder&#174; Announces Return of Premier Sponsor to 2005 TopCoder Open <br /><small style="margin-left:10px;">[July 11]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_070705">VeriSign Sponsors 2005 TopCoder Open <br /><small style="margin-left:10px;">[July 7]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_062705">TopCoder Announces Sun Microsystems as Title Sponsor for 2005 TopCoder Open <br /><small style="margin-left:10px;">[June 27]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_062005">TopCoder&#174; Announces Return of Cash Prizes to Weekly Online Programming Contests <br /><small style="margin-left:10px;">[June 20]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_061305">TopCoder Announces Registration for 2005 TopCoder Open Programming Tournament <br /><small style="margin-left:10px;">[June 13]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_060705">Caliper Hires TopCoder Software&#153; to Enhance Organizational Development Platform &amp; Services <br /><small style="margin-left:10px;">[June 7]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_050205">TopCoder&#174;-Powered Coding Challenge to Feature at Sun's 2005 JavaOne<sup>SM</sup> Conference <br /><small style="margin-left:10px;">[May 2]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_031405a">Champions Announced In 2005 TCCC Sponsored by Yahoo!&#174; <br /><small style="margin-left:10px;">[March 14]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_031405b">LogicLibrary Teams with TopCoder to Accelerate SOA Deployments <br /><small style="margin-left:10px;">[March 14]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_022205">Semifinalists Announced for 2005 TCCC Sponsored by Yahoo!&#174; <br /><small style="margin-left:10px;">[February 22]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_021605">NVIDIA Corporation Returns as Premier Sponsor of 2005 TopCoder&#174; Collegiate Challenge <br /><small style="margin-left:10px;">[February 16]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_021505">TopCoder Software(TM) Opens Access to Reusable Java(TM) and .NET(TM) Component Catalogs <br /><small style="margin-left:10px;">[February 15]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_020905">Google Code Jam Comes to India <br /><small style="margin-left:10px;">[February 9]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_020705">TC Community Surpasses 50,000 Worldwide Nears 10,000 Rated Member Mark <br /><small style="margin-left:10px;">[February 7]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_012505">TCS Delivers for International Consortium of Spinal Cord Injury Researchers <br /><small style="margin-left:10px;">[January 25]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_011805">TopCoder&#174; Announces Motorola as Premier Sponsor of 2005 TopCoder Collegiate Challenge <br /><small style="margin-left:10px;">[January 18]</small></a></dd>
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
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_122004">TopCoder&#174; Announces Yahoo! as Title Sponsor for 2005 TopCoder Collegiate Challenge <br /><small style="margin-left:10px;">[December 20]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_111504">Champions Announced In 2004 TopCoder&#174; Open Sponsored by Microsoft&#174; <br /><small style="margin-left:10px;">[November 15]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_110104">TopCoder&#174; Announces Finalists for 2004 TopCoder Open Sponsored by Microsoft&#174; <br /><small style="margin-left:10px;">[November 1]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_100504">Google announces 50 Google Code Jam Finalists <br /><small style="margin-left:10px;">[October 5]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_092704">TopCoder Developing Web- Based Application for CRPF Spinal Cord Injury Research Group <br /><small style="margin-left:10px;">[September 27]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_090704">TopCoder Software Industry Expert Michael Morris to Speak at 2004 SD Best Practices Conference <br /><small style="margin-left:10px;">[September 7]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_090204">Yahoo! Signs On as Premier Sponsor of 2004 TopCoder Open <br /><small style="margin-left:10px;">[September 2]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_081804">Intel Corporation Sponsors 2004 TopCoder Open Tournament <br /><small style="margin-left:10px;">[August 18]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_081004">TopCoder Software Wins New Customer Contracts <br /><small style="margin-left:10px;">[August 10]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_080404">NVIDIA Named Premier Level Sponsor of 2004 TopCoder Open Tournament <br /><small style="margin-left:10px;">[August 4]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_072804">TopCoder Announces Microsoft as Title Sponsor for 2004 TopCoder Open Tournament <br /><small style="margin-left:10px;">[July 28]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_051204">TopCoder Announces the Ultimate Software Development Contest <br /><small style="margin-left:10px;">[May 12]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_050304">JavaOne Coding Challenge Powered by TopCoder <br /><small style="margin-left:10px;">[May 3]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_0419b04">Champions Announced In 2004 TCCC Sponsored by Yahoo!&#174; <br /><small style="margin-left:10px;">[April 19]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_041904">Custom Web Application Enables Online Gift Card Service <br /><small style="margin-left:10px;">[April 19]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_040604">TopCoder&#174; Announces 32 Semifinalists for 2004 TCCC Sponsored by Yahoo!&#174; <br /><small style="margin-left:10px;">[April 6]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_030804">NVIDIA Sponsors 2004 TopCoder Collegiate Challenge <br /><small style="margin-left:10px;">[March 8]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_030104">Columbia University Student Wins DCCC '04 <br /><small style="margin-left:10px;">[March 1]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_021604">TopCoder Announces Yahoo! as Title Sponsor for TCCC04 <br /><small style="margin-left:10px;">[February 16]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_020204">TopCoder Announces DoubleClick 2004 Coding Challenge <br /><small style="margin-left:10px;">[February 2]</small></a></dd>
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
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_120803">Winners Announced in 2003 TopCoder Open sponsored by Intel&#174; <br /><small style="margin-left:10px;">[December 8]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_120103">TopCoder and AT&T Announce Winners of Charity Programming Tournament <br /><small style="margin-left:10px;">[December 1]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_111203">TopCoder Announces Finalists in International Programming Tournament <br /><small style="margin-left:10px;">[November 12]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_110603">AT&amp;T Foundation to Sponsor TopCoder Charity Tournament <br /><small style="margin-left:10px;">[November 6]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_110303">TopCoder Teams with Telecom Leaders in OSS through Java(TM) Initiative <br /><small style="margin-left:10px;">[November 3]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_101403">Talbots Licenses Component Catalog From TopCoder Software <br /><small style="margin-left:10px;">[October 14]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_100103">Artifact and Northface to sponsor TopCoder Open <br /><small style="margin-left:10px;">[October 1]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_092903">Intel is the Title Sponsor for TopCoder Open <br /><small style="margin-left:10px;">[September 29]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_092203">NVIDIA Signs On To Sponsor 2003 TopCoder Open <br /><small style="margin-left:10px;">[September 22]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_081303">TopCoder Charity Challenge <br /><small style="margin-left:10px;">[August 13]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_081103">High quality software applications at a low cost <br /><small style="margin-left:10px;">[August 11]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_072303">TopCoder has a Revelation <br /><small style="margin-left:10px;">[July 23]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_072203">I want my VB.NET <br /><small style="margin-left:10px;">[July 21]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_061703">Sweden Added to TopCoder Developer Community <br /><small style="margin-left:10px;">[June 16]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_061603">Come In, We're Open <br /><small style="margin-left:10px;">[June 16]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_052103_javaone">JavaOne Coding Challenge is Powered by TopCoder <br /><small style="margin-left:10px;">[May 21]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_052103">Amity clinches High School Challenge <br /><small style="margin-left:10px;">[May 21]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_051403">TopCoder Challenges High School Students <br /><small style="margin-left:10px;">[May 14]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_040703">David Arthur takes home the Collegiate Challenge crown <br /><small style="margin-left:10px;">[April 7]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_031303">2003 Sun Microsystems TopCoder Collegiate Challenge <br /><small style="margin-left:10px;">[March 13]</small></a></dd>
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
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_111102">Sixteen Finalists Announced in 2002 TopCoder Invitational <br /><small style="margin-left:10px;">[November 11]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_103002">TopCoder Competitions Expand to High Schools <br /><small style="margin-left:10px;">[October 30]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_102802">Finalists Announced for 2002 TopCoder Invitational <br /><small style="margin-left:10px;">[October 28]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_102202">TopCoder Expands to Include Employment Services <br /><small style="margin-left:10px;">[October 22]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_081302">Sun Microsystems<sup>TM</sup> and TopCoder Host SunNetwork<sup>SM</sup> Coding Challenge <br /><small style="margin-left:10px;">[August 13]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_052802">China, New Zealand and Ireland Added to TopCoder Developer Community <br /><small style="margin-left:10px;">[May 28]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_032502">Sixteen Finalists Announced for $150,000 Collegiate Challenge <br /><small style="margin-left:10px;">[March 25]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_030502">TopCoder Reaches 10,000 Member Milestone <br /><small style="margin-left:10px;">[March 5]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_021902">Field Announced for 2002 Sun Microsystems and TopCoder Collegiate Challenge <br /><small style="margin-left:10px;">[February 19]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_012802">United Kingdom Added to TopCoder Developer Community <br /><small style="margin-left:10px;">[January 28]</small></a></dd>
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
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_121001">Sun<sup>TM</sup> Sponsoring 2002 Collegiate Challenge <br /><small style="margin-left:10px;">[December 10]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_110601">Houston Native Jon McAlister Wins $250,000 TopCoder Invitational <br /><small style="margin-left:10px;">[November 6]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_101501">TopCoder Announces Sixteen Finalists For $250,000 Invitational Tournament <br /><small style="margin-left:10px;">[October 15]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_092401">Foxwoods to Host $250,000 TopCoder Invitational Tournament <br /><small style="margin-left:10px;">[September 24]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_060701">Jason Woolever Wins 2001 TopCoder Collegiate Challenge <br /><small style="margin-left:10px;">[June 7]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_052901">TopCoder Addresses Demand for Elite Programmers with Coding Competitions <br /><small style="margin-left:10px;">[May 29]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_052201">Sixteen Collegiate Programmers to Compete for Coveted "TopCoder" Title <br /><small style="margin-left:10px;">[May 22]</small></a></dd>
                    <dd><a href="/tc?module=Static&d1=pressroom&d2=pr_042401">TopCoder Names Jack Hughes Chairman of the Board <br /><small style="margin-left:10px;">[April 24]</small></a></dd>
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

            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                    <jsp:include page="../page_title.jsp" >
                        <jsp:param name="image" value="press_room"/>
                        <jsp:param name="title" value="&#160;"/>
                    </jsp:include>

            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr><td class="bodyText"><div align="right"><A href="/tc?module=Static&d1=pressroom&d2=index">Current News</A>&#160;&#160;|&#160;&#160;<strong>Press Releases Archive</strong>&#160;&#160;|&#160;&#160;<A href="/tc?module=Static&d1=pressroom&d2=art_archive">Articles Archive</A></div></td></tr>
            </table>

            <table width="100%" border="0" cellpadding="4" cellspacing="0">

<!-- 2007 -->
                            <tr><td class="statTextBig" bgcolor="#858B91"><font size="3">2007</font></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_100107">TopCoder Open to Feature World's Elite Software Developers in Competitive Programming's Top Tournament</A> [October 1]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_092407">TopCoder to Join Walt Mossberg and Bill Taylor Speaking at BIF-3 Collaborative Innovation Summit</A> [September 24]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_082707">TopCoder Named to Inc. Magazine's 500 Fastest-Growing Private Companies in America</A> [August 27]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_082407">Lilly and Deutsche Bank Announced as New Sponsors &amp; NSA Returns as Patron of 2007 TopCoder Collegiate Challenge</A> [August 24]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_071807">TopCoder Announces New Collaboration Initiatives for Working with Clients and Community</A> [July 18]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_062507">Live Coverage of 2007 TopCoder Open to Feature Broadcast Team, Interviews and Behind-the-Scenes Action</A> [June 25]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_061307">TopCoder Community Helps Research Led by Harvard Business School Professor</A> [June 13]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_060507">AOL to Webcast TopCoder Open 2007 Finals Live on June 29</A> [June 7]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_060607">TopCoder Announces Enhanced Focus on Financial Services Industry</A> [June 6]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_052207">Yodlee to Sponsor TopCoder Single Round Match Series</A> [May 23]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_052307">Russian and Croatian High School Programmers Win TopCoder Championship at Purdue University</A> [May 21]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_040907">TopCoder Appoints Russ Malz Vice President of Sales</A> [April 9]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_040307">TopCoder Appoints Jiazhi Wu VP of Technology for China</A> [April 3]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_022207">TopCoder Announces TopCoder Open 2007 Sponsored by AOL</A> [February 22]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_021307">Registration Opens for First TopCoder High School Global Programming Tournament</A> [February 13]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_021207">Connected Services Sandbox Launches</A> [February 12]<br/><br/></td></tr>

<!-- 2006 -->
                            <tr><td class="statTextBig" bgcolor="#858B91"><font size="3">2006</font></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_113006">AOL and TopCoder Announce Web AIM Mashup Competition</A> [November 30]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_112906">TopCoder to Present Keynote Address: Future of Virtual Communities as Business; at Gartner CIO Summit 2006</A> [November 29]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_112106">Russia's nicka81 and Petr, China's PE Triumph at TopCoder Collegiate Challenge in San Diego</A> [November 21]<br/></td></tr>
<tr><td class="prHead"><A href="http://www.prnewswire.com/mnr/topcoder/26099/">Meet the AOL TCCC Webcast Team</A> [November 13]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_102506">TopCoder Launches Operations in China with New Beijing Appointment</A> [October 25]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_102306">Semifinalists Announced for 2006 TopCoder Collegiate Challenge Sponsored by AOL</A> [October 23]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_101106">AOL to Webcast TopCoder World Championship of Computer Programming Live on November 17</A> [October 11]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_101006">TopCoder Identified As Business Leader and Innovator In New Book "Mavericks at Work"</A> [October 10]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_082906">NSA Continues TopCoder Patronage with Support of 2006 TopCoder Collegiate Challenge in San Diego</A> [August 29]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_071206">UBS Extends Premier Sponsorship of TopCoder Events</A> [July 12]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_062606">TopCoder Announces Bloomberg L.P. As Premier Sponsor of TCCC06</A> [June 26]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_061906">AOL Named Title Sponsor of 2006 TopCoder Collegiate Challenge</A> [June 19]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_060706">Science Museum of Minnesota Partners with TopCoder High School Competitions</A> [June 7]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_060606">AOL, Bloomberg, UBS and NSA Announced as Sponsors/Patrons of 2006 TopCoder Collegiate Challenge</A> [June 6]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_050806">Russian, US and Indonesian Programmers Win $150,000 TopCoder Open Sponsored By AMD in Las Vegas</A> [May 8]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_031606">TopCoder Announces AMD as Title Sponsor of 2006 TopCoder Open in Las Vegas</A> [March 16]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_030306">TopCoder Names UBS as Premier Sponsor of 2006 TopCoder Open</A> [March 3]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_020806">TopCoder High School Launches Global Programming Tournament in June</A> [February 8]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_012606">TopCoder Software Component Libraries Selected as Finalist for the 16th Annual Jolt Awards</A> [January 26]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_012306">TopCoder Names Intel Corporation as First Sponsor of New Marathon Match Series</A> [January 23]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_010906">TopCoder Announces NSA Participation in 2006 TopCoder Open in Las Vegas</A> [January 9]<br/><br/></td></tr>


<!-- 2005 -->
                            <tr><td class="statTextBig" bgcolor="#858B91"><font size="3">2005</font></td></tr>

<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_121905">TopCoder Welcomes VeriSign as Return Sponsor of 2006 TopCoder Open in Las Vegas</A> [December 19]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_112105">TopCoder Payouts to Winners of Design and Development Competitions Surpass $1 Million</A> [November 21]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_102105">TopCoder Selects Aladdin Resort in Las Vegas for TopCoder Open 2006</A> [October 21]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_101705">Champions Announced In 2005 TopCoder&#174; Open Sponsored by Sun Microsystems</A> [October 17]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_092805">Onsite Finalists Announced In 2005 TopCoder Open Sponsored by Sun Microsystems</A> [September 28]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_090205">TopCoder&#174; Announces First Software Developer Conference at 2005 TopCoder Open</A> [September 2]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_082405">TopCoder&#174; Announces 16 Finalists in Component Tournament of 2005 TopCoder Open</A> [August 24]<br/></td></tr>
<tr><td class="prHead"><A href="http://www.google.com/intl/en/press/pressrel/codejam3.html" target="_blank">Registration Opens for Google Code Jam 2005</A> [July 25 - Google]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_071105">TopCoder&#174; Announces Return of Premier Sponsor to 2005 TopCoder Open</A> [July 11]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_070705">VeriSign Sponsors 2005 TopCoder Open</A> [July 7]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_062705">TopCoder Announces Sun Microsystems as Title Sponsor for 2005 TopCoder Open</A> [June 27]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_062005">TopCoder&#174; Announces Return of Cash Prizes to Weekly Online Programming Contests</A> [June 20]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_061305">TopCoder Announces Registration for 2005 TopCoder Open Programming Tournament</A> [June 13]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_060705">Caliper Hires TopCoder Software&#153; to Enhance Organizational Development Platform & Services</A> [June 7]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_050205">TopCoder&#174;-Powered Coding Challenge to Feature at Sun's 2005 JavaOne<sup>SM</sup> Conference</A> [May 2]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_031405a">Champions Announced In 2005 TCCC Sponsored by Yahoo!&#174;</A> [March 14]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_031405b">LogicLibrary Teams with TopCoder to Accelerate SOA Deployments</A> [March 14]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_022205">Semifinalists Announced for 2005 TCCC Sponsored by Yahoo!&#174;</A> [February 22]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_021605">NVIDIA Corporation Returns as Premier Sponsor of 2005 TopCoder&#174; Collegiate Challenge</A> [February 16]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_021505">TopCoder Software(TM) Opens Access to Reusable Java(TM) and .NET(TM) Component Catalogs</A> [February 15]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_020905">Google Code Jam Comes to India</A> [February 9]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_020705">TC Community Surpasses 50,000 Worldwide Nears 10,000 Rated Member Mark</A> [February 7]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_012505">TCS Delivers for International Consortium of Spinal Cord Injury Researchers</A> [January 25]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_011805">TopCoder&#174; Announces Motorola as Premier Sponsor of 2005 TopCoder Collegiate Challenge</A> [January 18]<br/><br/></td></tr>
<!-- 2004 -->
<tr><td class="statTextBig" bgcolor="#858B91"><font size="3">2004</font></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_122004">TopCoder&#174; Announces Yahoo! as Title Sponsor for 2005 TopCoder Collegiate Challenge</A> [December 20]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_111504">Champions Announced In 2004 TopCoder&#174; Open Sponsored by Microsoft&#174;</A> [November 15]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_110104">TopCoder&#174; Announces Finalists for 2004 TopCoder Open Sponsored by Microsoft&#174;</A> [November 1]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_100504">Google announces 50 Google Code Jam Finalists</A> [October 5]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_092704">TopCoder Developing Web- Based Application for CRPF Spinal Cord Injury Research Group</A> [September 27]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_090704">TopCoder Software Industry Expert Michael Morris to Speak at 2004 SD Best Practices Conference</A> [September 7]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_090204">Yahoo! Signs On as Premier Sponsor of 2004 TopCoder Open</A> [September 2]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_081804">Intel Corporation Sponsors 2004 TopCoder Open Tournament</A> [August 18]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_081004">TopCoder Software Wins New Customer Contracts</A> [August 10]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_080404">NVIDIA Named Premier Level Sponsor of 2004 TopCoder Open Tournament</A> [August 4]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_072804">TopCoder Announces Microsoft as Title Sponsor for 2004 TopCoder Open Tournament</A> [July 28]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_051204">TopCoder Announces the Ultimate Software Development Contest</A> [May 12]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_050304">JavaOne Coding Challenge Powered by TopCoder</A> [May 03]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_0419b04">Champions Announced In 2004 TCCC Sponsored by Yahoo!&#174;</A> [April 19]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_041904">Custom Web Application Enables Online Gift Card Service</A> [April 19]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_040604">TopCoder&#174; Announces 32 Semifinalists for 2004 TCCC Sponsored by Yahoo!&#174;</A> [April 6]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_030804">NVIDIA Sponsors 2004 TopCoder Collegiate Challenge</A> [March 8]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_030104">Columbia University Student Wins DCCC '04</A> [March 1]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_021604">TopCoder Announces Yahoo! as Title Sponsor for TCCC04</A> [February 16]<br/></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_020204">TopCoder Announces DoubleClick 2004 Coding Challenge</A> [February 2]<br/><br/></td></tr>
<!-- 2003 -->
<tr><td class="statTextBig" bgcolor="#858B91"><font size="3">2003</font></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_120803">Winners Announced in 2003 TopCoder Open sponsored by Intel&#174;</A> [December 8]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_120103">TopCoder and AT&T Announce Winners of Charity Programming Tournament</A> [December 1]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_111203">TopCoder Announces Finalists in International Programming Tournament</A> [November 12]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_110603">AT&T Foundation to Sponsor TopCoder Charity Tournament</A> [November 6]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_110303">TopCoder Teams with Telecom Leaders in OSS through Java(TM) Initiative</A> [November 3]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_101403">Talbots Licenses Component Catalog From TopCoder Software</A> [October 14]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_100103">Artifact and Northface to sponsor TopCoder Open</A> [October 1]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_092903">Intel is the Title Sponsor for TopCoder Open</A> [September 29]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_092203">NVIDIA Signs On To Sponsor 2003 TopCoder Open</A> [September 22]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_081303">TopCoder Charity Challenge</A> [August 13]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_081103">High quality software applications at a low cost</A> [August 11]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_072303">TopCoder has a Revelation</A> [July 23]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_072203">I want my VB.NET</A> [July 21]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_061703">Sweden Added to TopCoder Developer Community</A> [June 16]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_061603">Come In, We're Open</A> [June 16]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_052103_javaone">JavaOne Coding Challenge is Powered by TopCoder</A> [May 21]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_052103">Amity clinches High School Challenge</A> [May 21]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_051403">TopCoder Challenges High School Students</A> [May 14]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_040703">David Arthur takes home the Collegiate Challenge crown</A> [April 7]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_031303">2003 Sun Microsystems TopCoder Collegiate Challenge</A> [March 13]</td></tr>
<tr><td><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>
<!-- 2002 -->
<tr><td class="statTextBig" bgcolor="#858B91"><font size="3">2002</font></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_111102">Sixteen Finalists Announced in 2002 TopCoder Invitational</A> [November 11]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_103002">TopCoder Competitions Expand to High Schools</A> [October 30]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_102802">Finalists Announced for 2002 TopCoder Invitational</A> [October 28]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_102202">TopCoder Expands to Include Employment Services</A> [October 22]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_081302">Sun Microsystems<span class="super">TM</span> and TopCoder Host SunNetwork<span class="super">SM</span> Coding Challenge</A> [August 13]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_052802">China, New Zealand and Ireland Added to TopCoder Developer Community</A> [May 28]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_032502">Sixteen Finalists Announced for $150,000 Collegiate Challenge</A> [March 25]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_030502">TopCoder Reaches 10,000 Member Milestone</A> [March 5]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_021902">Field Announced for 2002 Sun Microsystems and TopCoder Collegiate Challenge</A> [February 19]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_012802">United Kingdom Added to TopCoder Developer Community</A> [January 28]</td></tr>
<tr><td><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>
<!-- 2001 -->
<tr><td class="statTextBig" bgcolor="#858B91"><font size="3">2001</font></td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_121001">Sun<span class="super">TM</span> Sponsoring 2002 Collegiate Challenge</A> [December 10]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_110601">Houston Native Jon McAlister Wins $250,000 TopCoder Invitational</A> [November 6]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_101501">TopCoder Announces Sixteen Finalists For $250,000 Invitational Tournament</A> [October 15]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_092401">Foxwoods to Host $250,000 TopCoder Invitational Tournament</A> [September 24]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_060701">Jason Woolever Wins 2001 TopCoder Collegiate Challenge</A> [June 7]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_052901">TopCoder Addresses Demand for Elite Programmers with Coding Competitions</A> [May 29]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_052201">Sixteen Collegiate Programmers to Compete for Coveted "TopCoder" Title</A> [May 22]</td></tr>
<tr><td class="prHead"><A href="/tc?module=Static&d1=pressroom&d2=pr_042401">TopCoder Names Jack Hughes Chairman of the Board</A> [April 24]</td></tr>
            </table>
            </td>
         </tr>
      </table>
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