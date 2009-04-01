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
                    
<div align="right"><a href="/truveo/forums">Discuss this press release</a></div>
                        
<p align="center"><b>Truveo Developer 
Challenge Offers $100,000 in Prizes for New Video Search Applications</b> <br>
</p>
<p align="center"><b><i>World's 
Top Developers Compete to Build Innovative New Video Search Applications </i></b> <br>
</p>
<p><b>Glastonbury, Conn. 
- May 19, 2008</b> - TopCoder®, Inc., the leader in online programming 
competition, skills assessment and competitive software development, 
today announced the Truveo Developer Challenge. With a prize pool of 
$100,000, developers will compete to build customized applications that 
use Truveo's open API for video search available at <a href="http://developer.truveo.com/" target="_blank"><u>developer.truveo.com</u></a>. Truveo is the world's leading video 
search engine with an index containing over 170 million videos that 
is continuously updated, cleaned and expanded to include the latest 
videos from the most popular video destinations on the Web.  Competition 
details are available at <a href="http://www.topcoder.com/truveo" target="_blank"><u>www.topcoder.com/truveo</u></a> and Truveo can be accessed at <a href="http://www.truveo.com/" target="_blank"><u>www.truveo.com</u></a>. <br></p>
<p>Building off the success of 
AOL's Open AIM Developer Challenge, which introduced more than 50 
exciting new plug-in applications for AIM (see today's <a href="http://www.topcoder.com/tc?module=Static&amp;d1=pressroom&amp;d2=index" target="_blank"><u>press release</u></a> announcing winners or visit the contest 
homepage at: <a href="http://www.topcoder.com/openaim" target="_blank">http://www.topcoder.com/openaim</a>), TopCoder will apply the 
skills of its global community of top ranked software designers and 
developers to extend the rich functionality of Truveo's open APIs, 
competing to build the most exciting new video search applications. 
Developers can turn any website or social network, into the ultimate 
destination for online video with new and creative solutions that showcase 
millions of videos. Contestants can also enhance an existing website 
with an application placing relevant video clips alongside other content 
for a more engaging experience. Participants are being encouraged to 
build widgets, gadgets or applications for social network sites, AIM, 
Web portals or operating systems such as Microsoft Vista or Apple OSX.  
Developers are also being encouraged to use the Truveo API with different 
AOL open APIs to create new applications. <br></p>
<p>"TopCoder competitions attract 
the world's top developers so we are very excited to give them a chance 
to unleash their creativity and work with a product as cutting edge, 
fun and exciting as Truveo," said Denis Horgan, Vice President 
of Community Development for TopCoder.<br></p>
<p>"By working with TopCoder 
on the Truveo Developer's Challenge, we've set the top developers 
in the world loose to see what creative video-based search applications 
they can build with Truveo's open APIs," said Kevin Conroy, Executive 
Vice President of AOL. "We're excited to see what new innovations 
arise from the creativity of the TopCoder community." <br>
</p>
<p>Truveo is the leading video 
search engine on the Web, and powers many of the Web's most popular 
video destinations, from AOL, Microsoft Corporation, CNET's Search.com, 
to hundreds of other web sites and applications worldwide. Across the 
network of websites it powers, Truveo reaches an audience of over 70 
million users every month.  <br></p>
<p><b>Join the Competition</b></p>
<p>AOL has teamed 
up with TopCoder to put the Truveo Open APIs in the hands of the best 
developers in the world. Now it's your chance to show us what you've 
got for a piece of $100,000 in prize money. We will award nine (9) $10,000 
prizes and twenty (20) $500 prizes for the most creative, successful 
and ingenious submissions.  <br></p>
<p>To enter, view 
all contest rules and details online at <a href="http://www.topcoder.com/truveo" target="_blank"><u>www.topcoder.com/truveo</u></a>.  Showcase your application on your own site or blog, or 
any one of the social network sites such as Facebook, MySpace, Friendster, 
Bebo, Cyworld, Skyblog, Hi5, Orkut, or Live Journal. 
Passing submissions will be showcased on the <a href="http://dev.aol.com/" target="_blank"><u>AOL Developer Network</u></a> and <a href="http://www.topcoder.com/" target="_blank"><u>TopCoder</u></a> as well.  <br></p>
<p>Submissions 
must be received by July 21, 2008 and winners will be judged on innovation, 
actual usage statistics, best use of the Truveo search functionality 
and popularity as voted upon by both Truveo and the TopCoder member 
community. Winners will be announced in a joint press release by Truveo 
and TopCoder on July 31, 2008. <br></p>
<p>The Truveo Video Search APIs 
come in four flavors: XML, AJAX, Flash and Ruby. The XML API allows 
users to submit REST-style queries and receive XML-formatted results 
to standard HTTP GET requests. The AJAX API runs in the browser and 
lets client applications access video search results directly from JavaScript. 
The Flash API runs in Macromedia Flash and allows Flash applications 
to access video search results. The Ruby API is a mapping of the XML 
API for use in Ruby programs. <br></p>
<p><b>About Truveo</b></p>
<p>Truveo is the search engine 
for video, making it possible for consumers to search and browse through 
over 100 million videos from thousands of sources across the Web. Truveo 
was founded by some of the industry's leading experts in video search 
technology and has built one of the largest and most up-to-date indexes 
of high-quality video on the Web. As a result, Truveo enables users 
to find video that cannot be found in any other search engine. Truveo 
first launched its industry-leading search engine in 2005 and today, 
the Truveo search engine powers video search on some of the most popular 
destinations on the Web, including AOL Video, AOL Search, Brightcove, 
CBS RADIO's sites, Clevver, CSTV, Excite, Flock, Infospace, Kosmix, 
Microsoft Corporation, Pageflakes, PureVideo, Qwest, CNET's Search.com, 
Sportingo, Widgetbox and YourMinis, reaching an audience of over 70 
million users a month. Truveo's critically-acclaimed flagship destination, <a href="http://www.truveo.com/" target="_blank"><u>www.truveo.com</u></a>, has received widespread praise, establishing 
itself as the leader in the fast-growing video search market. <br>
</p>
<p><b>About TopCoder, Inc.</b></p>
<p>TopCoder is the world's largest 
competitive software development community with over 150,000 developers 
representing over 200 countries.  TopCoder hosts the largest and most 
comprehensive developer ratings and performance metrics available.   The 
TopCoder community builds software for a wide-ranging client base through 
a competitive, rigorous, standards based methodology.   This methodology 
results in a highly consistent set of software components allowing a 
software-as-parts approach to application development.  TopCoder makes 
this large library of software components built through competition 
available to all of our clients.  Utilizing a world-wide member base 
and this library, TopCoder seeks to lower the cost of software development 
while increasing both the speed at which applications can be developed 
and the quality of the ultimate application. For more information about 
sponsoring TopCoder events, recruiting TopCoder members and utilizing 
TopCoder's software services, visit <a href="http://www.topcoder.com/" target="_blank"><u>http://www.topcoder.com</u></a>. <br></p>
<p align="center"><b><i>TopCoder 
is a registered trademark of TopCoder, Inc. in the United States and 
other countries. All other product and company names herein may be trademarks 
of their respective owners.</i></b></p>

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
