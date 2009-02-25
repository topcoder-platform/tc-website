<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
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
                        <jsp:param name="title" value="Press Release"/>
                    </jsp:include>
                    
<div align="right"><tc-webtag:forumLink forumID="522682" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">Truveo Developer Challenge Showcases 93 New Ways To View Video Online</span><br />
<span class="bodySubTitle"><em>Contest Yields 93 Innovative New Video Search Applications Based on Truveo API</em></span></p>
</div>
      
<p>
<strong>GLASTONBURY, CT. August 4, 2008 &#151;</strong>TopCoder&reg;, Inc. the leader in online programming competition, skills assessment and competitive software development, today announced the winners of the Truveo Developer Challenge. Competing for a prize pool of $100,000, developers were set loose to build custom applications that use Truveo's open API, <a target="_blank" href="<tc-webtag:linkTracking link='http://developer.truveo.com' refer='pr_080408' />">http://developer.truveo.com</a>, to build the next great video search application. Competitors leveraged Truveo, the world's leading video search engine with a continuously-updated index of more than 200 million Web videos, to create 93 powerful new applications in just over two months of competition.
</p>

<p>
Unleashing their creativity, developers introduced new applications ranging from a 3D elliptical orbit display for finding and sharing online videos, to a free new tool for creating animated .GIF images from online videos. All 93 applications are immediately available to the public through the main competition website, where the full gallery of free applications can be viewed and downloaded: <a href="<tc-webtag:linkTracking link='/truveo/' refer='pr_080408' />">http://www.topcoder.com/truveo</a>. Competitors also posted their new widgets, gadgets, mashups and web applications to social media sites like Facebook and MySpace for real-world use and evaluation. The judging criteria included five equally weighted categories: Download and usage statistics; innovation; best use of the Truveo API and functionality; Truveo favorites; and popularity in peer review judging by the global TopCoder community.
</p>

<p>
"Developers around the world are using AOL's open services and APIs to add value to their own applications and products," said Kevin Conroy, Executive Vice President of AOL.  "We're thrilled that so many top-notch developers have found creative and innovative ways to utilize the Truveo API during this TopCoder Challenge and are impressed by the breadth and depth of the applications that have emerged from the competition."
</p>

<p>
"From simply incorporating video search results into a Website to advanced and complex new video search applications, we've been impressed by how well TopCoder developers have chosen to implement the Truveo API," said Pete Kocks, President of Truveo and Vice President of AOL. "We expect that these new applications and developers will help continue to spread the word and we're delighted to see such an outpouring of creativity from this contest.  Congratulations to all the winners."
</p>

<p>
Applying the skills of TopCoder's global community of top-ranked software designers and developers, the resulting applications delivered upon the challenge to extend the rich functionality of Truveo's open APIs by creating powerful solutions that turn websites and social networks into dynamic destinations for online video. Developers were also encouraged to use the Truveo API with different AOL open APIs to create new applications, such as Open AIM, for which the TopCoder community built 53 new applications in a successful Open AIM Developer Challenge, <a href="<tc-webtag:linkTracking link='/openaim/' refer='pr_080408' />">http://www.topcoder.com/openaim</a>, earlier this year.
</p>

<p>
"By harnessing the collective talent and creativity of the world's top developers, and putting the cutting-edge technology and rich content of Truveo at their disposal, the TopCoder members over-delivered with such a surplus of great new applications that we never could have selected the best without the help of the peer review process," said Denis Horgan, Vice President of Community Development for TopCoder. "We're excited to watch how the new apps are adopted and used across the Web and social networks as well, in effect letting the general public continue the judging process in their own use."
</p>

<p>
Truveo is the leading video search engine on the Web, and powers many of the Web's most popular video destinations, from AOL, Microsoft Corporation, CNET's Search.com, to hundreds of other websites and applications worldwide. Across the network of websites it powers, Truveo reaches an audience of over 75 million users every month.
</p>

<p>
<span class="bodySubtitle">Truveo Developer Challenge Winners</span><br />
The $100,000 in prize money was broken out to award $10,000 each to the nine top winning applications. An additional 20 secondary winners were also awarded $500 each. Full details on all the creative, successful and ingenious winning applications, as well as the members who built them, are showcased online at <a href="<tc-webtag:linkTracking link='/truveo/' refer='pr_080408' />">http://www.topcoder.com/truveo</a>, and are also featured on the AOL Developer Network website at <a target="_blank" href="<tc-webtag:linkTracking link='http://dev.aol.com' refer='pr_080408' />">http://dev.aol.com</a>. A podcast featuring interviews with a number of contestants is also available on the AOL Developer Network site. The top nine winning applications, available for direct online use and download, are:<br />
<ul>
    <li><strong>MapOfVideo</strong>:  A map-based Truveo search that links video search results to specific locations.<br />
    <a target="_blank" href="<tc-webtag:linkTracking link='http://mapofvideo.com/' refer='pr_080408' />">http://mapofvideo.com/</a></li>
    <li><strong>SVid</strong>:  A revolutionary new web user experience for searching, seeing and sharing videos online with 3D elliptical orbit display and much more.<br />
    <a target="_blank" href="<tc-webtag:linkTracking link='http://cyb3r.in/svid' refer='pr_080408' />">http://cyb3r.in/svid</a></li>
    <li><strong>3Styler for Facebook</strong>:  Find and share favorite movies directly in Facebook with Truveo search and video player plugin.<br />
    <a target="_blank" href="<tc-webtag:linkTracking link='http://www.facebook.com/apps/application.php?id=14558787347' refer='pr_080408' />">http://www.facebook.com/apps/application.php?id=14558787347</a></li>
    <li><strong>TechVideoBytes</strong>:  A dynamic new web portal highlighting the latest technology videos streamed from around the world.<br />
    <a target="_blank" href="<tc-webtag:linkTracking link='http://www.developersnippets.com/techvideobytes/' refer='pr_080408' />">http://www.developersnippets.com/techvideobytes/</a></li>
    <li><strong>GIF Creator</strong>:  A desktop application for creating animated .GIF images and adding new effects to frames captured from Truveo video search results.<br />
    <a target="_blank" href="<tc-webtag:linkTracking link='http://www.windowsultra.com/gif' refer='pr_080408' />">http://www.windowsultra.com/gif</a></li>
    <li><strong>VideoWall</strong>:  An engaging interactive 3D wall screensaver incorporating videos powered by Truveo search.<br />
    <a target="_blank" href="<tc-webtag:linkTracking link='http://vinaymenon.50webs.com/videowall.html' refer='pr_080408' />">http://vinaymenon.50webs.com/videowall.html</a></li>
    <li><strong>ejeboo</strong>:  A visual search engine powered by Truveo for finding online videos, including tracking and notification of new videos by email, Twitter and RSS feeds.<br />
    <a target="_blank" href="<tc-webtag:linkTracking link='http://ejeboo.com/' refer='pr_080408' />">http://ejeboo.com/</a></li>
    <li><strong>Sporty</strong>:  A totally visual interface for exploring the latest sports videos, featuring baseball, basketball, American football and the 28 Olympic disciplines.<br />
    <a target="_blank" href="<tc-webtag:linkTracking link='http://sporty.somethingisaid.com/' refer='pr_080408' />">http://sporty.somethingisaid.com/</a></li>
    <li><strong>VeoSearch</strong>:  A Firefox extension allowing direct video search from any text highlighted within the browser.<br />
    <a target="_blank" href="<tc-webtag:linkTracking link='http://www.assembla.com/spaces/veosearch' refer='pr_080408' />">http://www.assembla.com/spaces/veosearch</a></li>
</ul>
</p>

<p>
<span class="bodySubtitle">About Truveo</span><br />
Truveo is the search engine for video, making it possible for consumers to search and browse through over 200 million videos from thousands of sources across the Web. Truveo was founded by some of the industry's leading experts in video search technology and has built one of the largest and most up-to-date indexes of high-quality video on the Web. As a result, Truveo enables users to find video that cannot be found in any other search engine. Truveo first launched its industry-leading search engine in 2005 and today, the Truveo search engine powers video search on some of the most popular destinations on the Web, including AOL Video, AOL Search, Brightcove, CBS RADIO's sites, Clevver, CSTV, Excite, Flock, Infospace, Kosmix, Microsoft Corporation, Pageflakes, PureVideo, Qwest, CNET's Search.com, Sportingo, Widgetbox and YourMinis, reaching an audience of over 75 million users a month. Truveo's critically-acclaimed flagship destination, <a target="_blank" href="<tc-webtag:linkTracking link='http://www.truveo.com' refer='pr_080408' />">www.truveo.com</a>, has received widespread praise, establishing itself as the leader in the fast-growing video search market.
</p>

<p>
<span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the world's largest competitive software development community with over 160,000 developers representing over 200 countries.  TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available.  The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology.   This methodology results in a highly consistent set of software components allowing a software-as-parts approach to application development.  TopCoder makes this large library of software components built through competition available to all of our clients.  Utilizing a world-wide member base and this library, TopCoder seeks to lower the cost of software development while increasing both the speed at which applications can be developed and the quality of the ultimate application. For more information about sponsoring TopCoder events, recruiting TopCoder members and utilizing TopCoder's software services, visit <a href="/">http://www.topcoder.com/</a>.
</p>

<p>
<strong>TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.</strong>
</p>
                        <p>###</p>
                        <p><br /></p>
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
