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
        <h1><a onFocus="this.blur();" href="/tc?module=Static&amp;d1=pressroom&amp;d2=index" name="pr_top">Press Room</a></h1>
    </div>
    <%-- pr_header end --%>
    
    <%-- pr_menu begin --%>
    <div id="pr_menu">
        <ul>
        <li><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=index" title="Current News"><span>Current News</span></a></li>
        <li id="pr_menuactive"><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_archive" title="Press Release Archive"><span>Press Release Archive</span></a></li>
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
        <div class="pr_subheader">
                <h2><span>2009</span></h2>
            </div>
        
        
        
            <%-- pr_border creation --%>
            <div class="pr_box"><div class="pr_box2"><div class="pr_boxcontent">
            
                <div class="pr_newsarchive">
                    <dl>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_112509">TopCoder Names Nicholas M. Donofrio to Company's Board of Directors<br /><small style="margin-left:10px;">[November 25th]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_110209">TopCoder Inc. Wins Deloitte Fast 500 and Connecticut Technology Council Tech Top 40 Awards<br /><small style="margin-left:10px;">[November 2nd]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_102109">TopCoder Announces Experimental Crowdsourcing Competition to Benefit Human Space Flight<br /><small style="margin-left:10px;">[October 21st]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_072209">Chinese Search Engine Youdao Uses TopCoder Competition Platform to Find Technical Talent<br /><small style="margin-left:10px;">[July 22nd]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_040409">IEEE-USA Becomes Sponsor of 2009 TopCoder Open<br /><small style="margin-left:10px;">[April 9th]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_032509">TopCoder Named 2009 "Cool Vendor" for Application Development by Leading Analyst Firm<br /><small style="margin-left:10px;">[March 25th]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_031709">Julian Birkinshaw of London Business School Interview with TopCoder<br /><small style="margin-left:10px;">[March 17th]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_031309">Crowdsourcing Guru Jeff Howe Interview with TopCoder<br /><small style="margin-left:10px;">[March 13th]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_020209">China, Belarus &amp; Croatia Win Top Honors in the 2009 TopCoder High School Tournament<br /><small style="margin-left:10px;">[February 2nd]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_010709">TopCoder to Keynote MLab Conference on Innovation in the Workplace at London Business School<br /><small style="margin-left:10px;">[January 7th]</small></a></dd>
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
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_111708">Ribbit's Killer App Challenge Launches at Adobe Max <br /><small style="margin-left:10px;">[November 17]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_110708">TopCoder Recognized As One of Fastest Growing Connecticut Companies By Connecticut Technology Council <br /><small style="margin-left:10px;">[November 7]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_103008">TopCoder Direct Platform Opens Access to 170,000 Member Community of Software Designers, Developers and Creative Artists <br /><small style="margin-left:10px;">[October 30]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_102308">TopCoder Ranked Number 11 in Deloitte's Technology Fast 50 Program for New York, New Jersey and Connecticut <br /><small style="margin-left:10px;">[October 23]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_100608">TopCoder Joins Lineups for SD Best Practices and Software Business 2008 Conferences October 28-31 <br /><small style="margin-left:10px;">[October 6]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_090308">TopCoder Featured in New Book "Crowdsourcing: Why the Power of the Crowd is Driving the Future of Business" <br /><small style="margin-left:10px;">[September 3]</small></a></dd>
                    <dd>TopCoder One of Inc. Magazine's 500 Fastest-Growing Private Companies in America for Second Consecutive Year [August 21]<br /><small style="margin-left:10px;"><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_082108">original press release</a> | <a target="_blank" href="/i/pressroom/pdfs/inc500_20080821.pdf">PDF</a></small></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_080408b">TopCoder &amp; Think Services Announce Dr. Dobb's Architecture &amp; Design World 2008 Software Design Contest Winner <br /><small style="margin-left:10px;">[August 4]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_080408">Truveo Developer Challenge Showcases 93 New Ways To View Video Online <br /><small style="margin-left:10px;">[August 4]</small></a></dd>                    
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_070108">Dr. Dobb's Architecture &amp; Design World 2008 to Feature Software Design Contest Powered by TopCoder <br /><small style="margin-left:10px;">[July 1]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_051908_b">Truveo Developer Challenge Offers $100,000 in Prizes for New Video Search Applications <br /><small style="margin-left:10px;">[May 19]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_051908">TopCoder Awards $100,000 in Prize Money to Winners of AOL's Open AIM Developer Challenge during TopCoder Open in Las Vegas <br /><small style="margin-left:10px;">[May 19]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_051308">Lilly Partners with TopCoder, to Find Drug Discovery IT Solutions <br /><small style="margin-left:10px;">[May 13]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_050608">Betfair Joins 2008 TopCoder Open Sponsors <br /><small style="margin-left:10px;">[May 6]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_041508">Finalists Announced for 2008 TopCoder Open May 12-15 in Las Vegas <br /><small style="margin-left:10px;">[April 15]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_040208">BT Joins Sponsors of 2008 TopCoder Open <br /><small style="margin-left:10px;">[April 2]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_031708">China, US and Poland Take Honors in TopCoder High School Tournament at Purdue University <br /><small style="margin-left:10px;">[March 17]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_031008">AMD and TopCoder Host a Series of Competitions to Advance Multi-Threaded Software Development <br /><small style="margin-left:10px;">[March 10]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_030508">AOL, Lilly and VeriSign Return as Sponsors &amp; NSA Returns as Patron of 2008 TopCoder Open <br /><small style="margin-left:10px;">[March 5]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_030408">AOL Selects TopCoder Enterprise Software Development Platform <br /><small style="margin-left:10px;">[March 4]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_022808">World's Elite High School Programmers to Compete in Live TopCoder High School Tournament <br /><small style="margin-left:10px;">[February 28]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_022608">TopCoder UML Design Tool Free to Developers <br /><small style="margin-left:10px;">[February 26]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_021808">TopCoder Software Component Catalog Surpasses 1,000 Reusable Java and .NET Components <br /><small style="margin-left:10px;">[February 18]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_010708">TopCoder to Speak on Collaboration at Mid-Atlantic CIO Forum <br /><small style="margin-left:10px;">[January 7]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_010208">TopCoder Expands With New Headquarters in Connecticut <br /><small style="margin-left:10px;">[January 2]</small></a></dd>
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
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_110507">Students from Russian Federation, China, Indonesia and United States Win 2007 TopCoder Collegiate Challenge <br /><small style="margin-left:10px;">[November 5]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_100107">TopCoder Open to Feature World's Elite Software Developers in Competitive Programming's Top Tournament <br /><small style="margin-left:10px;">[October 1]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_092407">TopCoder to Join Walt Mossberg and Bill Taylor Speaking at BIF-3 Collaborative Innovation Summit <br /><small style="margin-left:10px;">[September 24]</small></a></dd>
                    <dd><a href=""> <br /><small style="margin-left:10px;">[August 27]</small></a></dd>
                    <dd>TopCoder Named to Inc. Magazine's 500 Fastest-Growing Private Companies in America [August 27]<br /><small style="margin-left:10px;"><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_082707">original press release</a> | <a target="_blank" href="/i/pressroom/pdfs/inc500_20070827.pdf">PDF</a></small></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_082407">Lilly &amp; Deutsche Bank Announced as New Sponsors &amp; NSA Returns as Patron of 2007 TopCoder Collegiate Challenge <br /><small style="margin-left:10px;">[August 24]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_071807">TopCoder Announces New Collaboration Initiatives for Working with Clients and Community <br /><small style="margin-left:10px;">[July 18]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_062507">Live Coverage of 2007 TopCoder Open to Feature Broadcast Team, Interviews and Behind-the-Scenes Action <br /><small style="margin-left:10px;">[June 25]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_061307">TopCoder Community Helps Research Led by Harvard Business School Professor <br /><small style="margin-left:10px;">[June 13]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_060507">AOL to Webcast TopCoder Open 2007 Finals Live on June 29 <br /><small style="margin-left:10px;">[June 7]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_060607">TopCoder Announces Enhanced Focus on Financial Services Industry <br /><small style="margin-left:10px;">[June 6]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_052207">Yodlee to Sponsor TopCoder Single Round Match Series <br /><small style="margin-left:10px;">[May 23]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_052307">Russian and Croatian High School Programmers Win TopCoder Championship at Purdue University <br /><small style="margin-left:10px;">[May 21]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_040907">TopCoder Appoints Russ Malz Vice President of Sales <br /><small style="margin-left:10px;">[April 9]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_040307">TopCoder Appoints Jiazhi Wu VP of Technology for China <br /><small style="margin-left:10px;">[April 3]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_022207">TopCoder Announces TopCoder Open 2007 Sponsored by AOL <br /><small style="margin-left:10px;">[February 22]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_021307">Registration Opens for First TopCoder High School Global Programming Tournament <br /><small style="margin-left:10px;">[February 13]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_021207">Connected Services Sandbox Launches <br /><small style="margin-left:10px;">[February 12]</small></a></dd>
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
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_113006">AOL and TopCoder Announce Web AIM Mashup Competition <br /><small style="margin-left:10px;">[November 30]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_112906">TopCoder to Present Keynote Address: Future of Virtual Communities as Business; at Gartner CIO Summit 2006 <br /><small style="margin-left:10px;">[November 29]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_112106">Russia's nicka81 and Petr, China's PE Triumph at TopCoder Collegiate Challenge in San Diego <br /><small style="margin-left:10px;">[November 21]</small></a></dd>
                    <dd><a target="_blank" href="http://www.prnewswire.com/mnr/topcoder/26099/">Meet the AOL TCCC Webcast Team <br /><small style="margin-left:10px;">[November 13]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_102506">TopCoder Launches Operations in China with New Beijing Appointment <br /><small style="margin-left:10px;">[October 25]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_102306">Semifinalists Announced for 2006 TopCoder Collegiate Challenge Sponsored by AOL <br /><small style="margin-left:10px;">[October 23]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_101106">AOL to Webcast TopCoder World Championship of Computer Programming Live on November 17 <br /><small style="margin-left:10px;">[October 11]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_101006">TopCoder Identified As Business Leader and Innovator In New Book "Mavericks at Work" <br /><small style="margin-left:10px;">[October 10]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_082906">NSA Continues TopCoder Patronage with Support of 2006 TopCoder Collegiate Challenge in San Diego <br /><small style="margin-left:10px;">[August 29]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_071206">UBS Extends Premier Sponsorship of TopCoder Events <br /><small style="margin-left:10px;">[July 12]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_062606">TopCoder Announces Bloomberg L.P. As Premier Sponsor of TCCC06 <br /><small style="margin-left:10px;">[June 26]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_061906">AOL Named Title Sponsor of 2006 TopCoder Collegiate Challenge <br /><small style="margin-left:10px;">[June 19]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_060706">Science Museum of Minnesota Partners with TopCoder High School Competitions <br /><small style="margin-left:10px;">[June 7]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_060606">AOL, Bloomberg, UBS and NSA Announced as Sponsors/Patrons of 2006 TopCoder Collegiate Challenge <br /><small style="margin-left:10px;">[June 6]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_050806">Russian, US and Indonesian Programmers Win $150,000 TopCoder Open Sponsored By AMD in Las Vegas <br /><small style="margin-left:10px;">[May 8]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_031606">TopCoder Announces AMD as Title Sponsor of 2006 TopCoder Open in Las Vegas <br /><small style="margin-left:10px;">[March 16]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_030306">TopCoder Names UBS as Premier Sponsor of 2006 TopCoder Open <br /><small style="margin-left:10px;">[March 3]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_020806">TopCoder High School Launches Global Programming Tournament in June <br /><small style="margin-left:10px;">[February 8]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_012606">TopCoder Software Component Libraries Selected as Finalist for the 16th Annual Jolt Awards <br /><small style="margin-left:10px;">[January 26]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_012306">TopCoder Names Intel Corporation as First Sponsor of New Marathon Match Series <br /><small style="margin-left:10px;">[January 23]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_010906">TopCoder Announces NSA Participation in 2006 TopCoder Open in Las Vegas <br /><small style="margin-left:10px;">[January 9]</small></a></dd>
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
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_121905">TopCoder Welcomes VeriSign as Return Sponsor of 2006 TopCoder Open in Las Vegas <br /><small style="margin-left:10px;">[December 19]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_112105">TopCoder Payouts to Winners of Design and Development Competitions Surpass $1 Million <br /><small style="margin-left:10px;">[November 21]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_102105">TopCoder Selects Aladdin Resort in Las Vegas for TopCoder Open 2006 <br /><small style="margin-left:10px;">[October 21]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_101705">Champions Announced In 2005 TopCoder&#174; Open Sponsored by Sun Microsystems <br /><small style="margin-left:10px;">[October 17]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_092805">Onsite Finalists Announced In 2005 TopCoder Open Sponsored by Sun Microsystems <br /><small style="margin-left:10px;">[September 28]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_090205">TopCoder&#174; Announces First Software Developer Conference at 2005 TopCoder Open <br /><small style="margin-left:10px;">[September 2]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_082405">TopCoder&#174; Announces 16 Finalists in Component Tournament of 2005 TopCoder Open <br /><small style="margin-left:10px;">[August 24]</small></a></dd>
                    <dd><a target="_blank" href="http://www.google.com/intl/en/press/pressrel/codejam3.html">Registration Opens for Google Code Jam 2005 <br /><small style="margin-left:10px;">[July 25]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_071105">TopCoder&#174; Announces Return of Premier Sponsor to 2005 TopCoder Open <br /><small style="margin-left:10px;">[July 11]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_070705">VeriSign Sponsors 2005 TopCoder Open <br /><small style="margin-left:10px;">[July 7]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_062705">TopCoder Announces Sun Microsystems as Title Sponsor for 2005 TopCoder Open <br /><small style="margin-left:10px;">[June 27]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_062005">TopCoder&#174; Announces Return of Cash Prizes to Weekly Online Programming Contests <br /><small style="margin-left:10px;">[June 20]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_061305">TopCoder Announces Registration for 2005 TopCoder Open Programming Tournament <br /><small style="margin-left:10px;">[June 13]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_060705">Caliper Hires TopCoder Software&#153; to Enhance Organizational Development Platform &amp; Services <br /><small style="margin-left:10px;">[June 7]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_050205">TopCoder&#174;-Powered Coding Challenge to Feature at Sun's 2005 JavaOne<sup>SM</sup> Conference <br /><small style="margin-left:10px;">[May 2]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_031405a">Champions Announced In 2005 TCCC Sponsored by Yahoo!&#174; <br /><small style="margin-left:10px;">[March 14]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_031405b">LogicLibrary Teams with TopCoder to Accelerate SOA Deployments <br /><small style="margin-left:10px;">[March 14]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_022205">Semifinalists Announced for 2005 TCCC Sponsored by Yahoo!&#174; <br /><small style="margin-left:10px;">[February 22]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_021605">NVIDIA Corporation Returns as Premier Sponsor of 2005 TopCoder&#174; Collegiate Challenge <br /><small style="margin-left:10px;">[February 16]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_021505">TopCoder Software(TM) Opens Access to Reusable Java(TM) and .NET(TM) Component Catalogs <br /><small style="margin-left:10px;">[February 15]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_020905">Google Code Jam Comes to India <br /><small style="margin-left:10px;">[February 9]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_020705">TC Community Surpasses 50,000 Worldwide Nears 10,000 Rated Member Mark <br /><small style="margin-left:10px;">[February 7]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_012505">TCS Delivers for International Consortium of Spinal Cord Injury Researchers <br /><small style="margin-left:10px;">[January 25]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_011805">TopCoder&#174; Announces Motorola as Premier Sponsor of 2005 TopCoder Collegiate Challenge <br /><small style="margin-left:10px;">[January 18]</small></a></dd>
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
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_122004">TopCoder&#174; Announces Yahoo! as Title Sponsor for 2005 TopCoder Collegiate Challenge <br /><small style="margin-left:10px;">[December 20]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_111504">Champions Announced In 2004 TopCoder&#174; Open Sponsored by Microsoft&#174; <br /><small style="margin-left:10px;">[November 15]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_110104">TopCoder&#174; Announces Finalists for 2004 TopCoder Open Sponsored by Microsoft&#174; <br /><small style="margin-left:10px;">[November 1]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_100504">Google announces 50 Google Code Jam Finalists <br /><small style="margin-left:10px;">[October 5]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_092704">TopCoder Developing Web- Based Application for CRPF Spinal Cord Injury Research Group <br /><small style="margin-left:10px;">[September 27]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_090704">TopCoder Software Industry Expert Michael Morris to Speak at 2004 SD Best Practices Conference <br /><small style="margin-left:10px;">[September 7]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_090204">Yahoo! Signs On as Premier Sponsor of 2004 TopCoder Open <br /><small style="margin-left:10px;">[September 2]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_081804">Intel Corporation Sponsors 2004 TopCoder Open Tournament <br /><small style="margin-left:10px;">[August 18]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_081004">TopCoder Software Wins New Customer Contracts <br /><small style="margin-left:10px;">[August 10]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_080404">NVIDIA Named Premier Level Sponsor of 2004 TopCoder Open Tournament <br /><small style="margin-left:10px;">[August 4]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_072804">TopCoder Announces Microsoft as Title Sponsor for 2004 TopCoder Open Tournament <br /><small style="margin-left:10px;">[July 28]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_051204">TopCoder Announces the Ultimate Software Development Contest <br /><small style="margin-left:10px;">[May 12]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_050304">JavaOne Coding Challenge Powered by TopCoder <br /><small style="margin-left:10px;">[May 3]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_0419b04">Champions Announced In 2004 TCCC Sponsored by Yahoo!&#174; <br /><small style="margin-left:10px;">[April 19]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_041904">Custom Web Application Enables Online Gift Card Service <br /><small style="margin-left:10px;">[April 19]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_040604">TopCoder&#174; Announces 32 Semifinalists for 2004 TCCC Sponsored by Yahoo!&#174; <br /><small style="margin-left:10px;">[April 6]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_030804">NVIDIA Sponsors 2004 TopCoder Collegiate Challenge <br /><small style="margin-left:10px;">[March 8]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_030104">Columbia University Student Wins DCCC '04 <br /><small style="margin-left:10px;">[March 1]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_021604">TopCoder Announces Yahoo! as Title Sponsor for TCCC04 <br /><small style="margin-left:10px;">[February 16]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_020204">TopCoder Announces DoubleClick 2004 Coding Challenge <br /><small style="margin-left:10px;">[February 2]</small></a></dd>
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
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_120803">Winners Announced in 2003 TopCoder Open sponsored by Intel&#174; <br /><small style="margin-left:10px;">[December 8]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_120103">TopCoder and AT&T Announce Winners of Charity Programming Tournament <br /><small style="margin-left:10px;">[December 1]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_111203">TopCoder Announces Finalists in International Programming Tournament <br /><small style="margin-left:10px;">[November 12]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_110603">AT&amp;T Foundation to Sponsor TopCoder Charity Tournament <br /><small style="margin-left:10px;">[November 6]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_110303">TopCoder Teams with Telecom Leaders in OSS through Java(TM) Initiative <br /><small style="margin-left:10px;">[November 3]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_101403">Talbots Licenses Component Catalog From TopCoder Software <br /><small style="margin-left:10px;">[October 14]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_100103">Artifact and Northface to sponsor TopCoder Open <br /><small style="margin-left:10px;">[October 1]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_092903">Intel is the Title Sponsor for TopCoder Open <br /><small style="margin-left:10px;">[September 29]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_092203">NVIDIA Signs On To Sponsor 2003 TopCoder Open <br /><small style="margin-left:10px;">[September 22]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_081303">TopCoder Charity Challenge <br /><small style="margin-left:10px;">[August 13]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_081103">High quality software applications at a low cost <br /><small style="margin-left:10px;">[August 11]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_072303">TopCoder has a Revelation <br /><small style="margin-left:10px;">[July 23]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_072203">I want my VB.NET <br /><small style="margin-left:10px;">[July 21]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_061703">Sweden Added to TopCoder Developer Community <br /><small style="margin-left:10px;">[June 16]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_061603">Come In, We're Open <br /><small style="margin-left:10px;">[June 16]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_052103_javaone">JavaOne Coding Challenge is Powered by TopCoder <br /><small style="margin-left:10px;">[May 21]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_052103">Amity clinches High School Challenge <br /><small style="margin-left:10px;">[May 21]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_051403">TopCoder Challenges High School Students <br /><small style="margin-left:10px;">[May 14]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_040703">David Arthur takes home the Collegiate Challenge crown <br /><small style="margin-left:10px;">[April 7]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_031303">2003 Sun Microsystems TopCoder Collegiate Challenge <br /><small style="margin-left:10px;">[March 13]</small></a></dd>
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
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_111102">Sixteen Finalists Announced in 2002 TopCoder Invitational <br /><small style="margin-left:10px;">[November 11]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_103002">TopCoder Competitions Expand to High Schools <br /><small style="margin-left:10px;">[October 30]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_102802">Finalists Announced for 2002 TopCoder Invitational <br /><small style="margin-left:10px;">[October 28]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_102202">TopCoder Expands to Include Employment Services <br /><small style="margin-left:10px;">[October 22]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_081302">Sun Microsystems<sup>TM</sup> and TopCoder Host SunNetwork<sup>SM</sup> Coding Challenge <br /><small style="margin-left:10px;">[August 13]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_052802">China, New Zealand and Ireland Added to TopCoder Developer Community <br /><small style="margin-left:10px;">[May 28]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_032502">Sixteen Finalists Announced for $150,000 Collegiate Challenge <br /><small style="margin-left:10px;">[March 25]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_030502">TopCoder Reaches 10,000 Member Milestone <br /><small style="margin-left:10px;">[March 5]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_021902">Field Announced for 2002 Sun Microsystems and TopCoder Collegiate Challenge <br /><small style="margin-left:10px;">[February 19]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_012802">United Kingdom Added to TopCoder Developer Community <br /><small style="margin-left:10px;">[January 28]</small></a></dd>
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
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_121001">Sun<sup>TM</sup> Sponsoring 2002 Collegiate Challenge <br /><small style="margin-left:10px;">[December 10]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_110601">Houston Native Jon McAlister Wins $250,000 TopCoder Invitational <br /><small style="margin-left:10px;">[November 6]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_101501">TopCoder Announces Sixteen Finalists For $250,000 Invitational Tournament <br /><small style="margin-left:10px;">[October 15]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_092401">Foxwoods to Host $250,000 TopCoder Invitational Tournament <br /><small style="margin-left:10px;">[September 24]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_060701">Jason Woolever Wins 2001 TopCoder Collegiate Challenge <br /><small style="margin-left:10px;">[June 7]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_052901">TopCoder Addresses Demand for Elite Programmers with Coding Competitions <br /><small style="margin-left:10px;">[May 29]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_052201">Sixteen Collegiate Programmers to Compete for Coveted "TopCoder" Title <br /><small style="margin-left:10px;">[May 22]</small></a></dd>
                    <dd><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_042401">TopCoder Names Jack Hughes Chairman of the Board <br /><small style="margin-left:10px;">[April 24]</small></a></dd>
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