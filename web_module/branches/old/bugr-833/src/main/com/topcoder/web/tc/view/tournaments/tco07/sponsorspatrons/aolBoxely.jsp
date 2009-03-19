<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="content">

        <jsp:include page="../header.jsp" />

        <table cellpadding="0" cellspacing="0" id="spacer">
        <tbody>
            <tr>
                <td id="navSpacer">

                    <jsp:include page="../nav.jsp" >
                    <jsp:param name="tabLev1" value="overview"/>
                    <jsp:param name="tabLev2" value="sponsors"/>
                    <jsp:param name="tabLev3" value="aol"/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">
                        <div style="float: right;"><tc-webtag:forumLink forumID="506075" message="Discuss this" /></div>
                        <div style="margin-bottom: 20px;"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=aol" /><img src="/i/tournament/tco07/aol_logo.png" alt="AOL" border="0" /></a>
                        </div>

<span class="bigTitle">Introducing Boxely</span>
<br />
<br />
<%--
<div class="authorPhoto">
    <img src="/i/m/Nickolas_big.jpg" alt="Author" />
</div>
--%>
<div class="authorText">
  By&#160;<%--<tc-webtag:handle coderId="15635590" context="algorithm"/>--%> AOL's Boxely Team<br />
      <em>Guest Sponsor Writers</em>
</div>
<br clear="all">

<p>Before SRM 345, representatives from AOL will join TopCoder members in the Arena to discuss Boxely&#8482;. What is Boxely, anyway? Here's some information from AOL:</p>
<p><div class="indent">
"A fairly radical change is sweeping through the world of application development, driven in great part by the increasingly sophisticated ways that XML is being used. The idea is simple--just as you can put together a web page by using a number of HTML tags to describe the 'bones' or structure of the page, so too can you describe the visual pieces, the GUI, of an application using an XML application description language."<br>
Kurt Cagle, <i><a target="_blank" href="<tc-webtag:linkTracking link='http://dev.aol.com/thinking-inside-the-boxely' refer='feature_041707' />">Thinking Inside the Boxely</a></i><br>
</div>
</p>

<p><a target="_blank" href="<tc-webtag:linkTracking link='http://dev.aol.com/boxely/index.html' refer='feature_041707' />">Boxely</a> is a next-generation, standards-based development platform for creating rich desktop applications. Combining the benefits of a box-based layout scheme with an advanced rendering engine, Boxely is designed to enable the creation of rich desktop applications with the same ease, flexibility, and extensibility as authoring internet applications today.</p>

<p>Starting with the simplest level, the XML file describing a Boxely application comprises a hierarchy of boxes that represent rectangles on the screen. In addition to the application window, boxes represent interactive controls, images, and text. Boxes can be arranged and styled in a wide variety of ways as well as programmed to respond to user interaction and timeline animation.</p>

<p>A Boxely application is made up of XML and JavaScript files that describe a user interface and the logic behind it:
<ul>
<li><i>.box files</i> - XML documents that describe and present the user interface of your application.</li>
<li><i>.js files</i> - JavaScript files containing functions that control the application logic.</li>
</ul>
</p>

<p>With built-in support for layering, compositing, animation, data-binding, accessibility, and more, Boxely enables developers and designers to create interactive applications with the same ease, flexibility, and extensibility as creating internet applications.</p>

<p>At the core of Boxely is the Open Client Platform (OCP). The OCP enables Boxely to extend its functionality through the use of modular libraries called services. Services provide functionality previously unavailable in Javascript, making it possible to build real applications using only a scripting language. Available OCP Services include:</p>

<ul>
    <li>http - Provides HTTP connectivity to web servers, enabling web tranactions.</li>
    <li>maxiXML - Provides the ability to manipulate XML using a DOM model. Also enables the use of XML-HTTP requests.</li>
    <li>basics - Provides useful data structures and utilities including containers, streams, timers, 64-bit integers, and sorting.</li>
    <li>localStorage - Provides an SQL-based database storage on the client machine.</li>
    <li>urlData - Provides the ability to asynchronously load data that is referenced by an URL.</li>
    <li>urlDispatcher - Provides a mechanism where URLs can be dispatched to the operating system for handling.</li>
</ul>

<p>Boxely is the UI technology for several current AOL products, including <a target="_blank" href="<tc-webtag:linkTracking link='http://www.aim.com/' refer='feature_041707' />">AIM 6.0</a>, <a target="_blank" href="<tc-webtag:linkTracking link='http://x.aim.com/laim/' refer='feature_041707' />">AIM Lite</a>, and the <a target="_blank" href="<tc-webtag:linkTracking link='http://beta.aol.com/projects.php?project=openride' refer='feature_041707' />">OpenRide</a> client. </p>

<p>Boxely currently runs as a Windows desktop application, though AOL is working on Boxely plugins for Firefox and Internet Explorer that will enable Boxely to run within the browser. AOL is also working on Boxely Builder, an application generation toolkit, and is considering developing Boxely for OSX and Linux.</p>

<p><strong>Learn more:</strong></p>

<ul>
    <li><a target="_blank" href="<tc-webtag:linkTracking link='http://www.boxely.com' refer='feature_041707' />">www.boxely.com</a></li>
    <li>Boxely <a target="_blank" href="<tc-webtag:linkTracking link='http://dev.aol.com/boxely/documentation.html' refer='feature_041707' />">Documentation</a></li>
    <li>Boxely Developer <a target="_blank" href="<tc-webtag:linkTracking link='http://messageboards.aol.com/aol/en_us/boards.php?boardId=565122&func=2&channel=Boxely+Developer+Forums&refresh=true' refer='feature_041707' />">Forums</a></li>
    <li><a target="_blank" href="<tc-webtag:linkTracking link='http://dev.aol.com/boxely/downloads.html' refer='feature_041707' />">Download</a> Boxely</li>
    <li>The Font of Wisdom: A Basic Boxely App - <a target="_blank" href="<tc-webtag:linkTracking link='http://dev.aol.com/article/2007/03/basic-boxely-app-part1' refer='feature_041707' />">Part 1</a>, <a target="_blank" href="<tc-webtag:linkTracking link='http://dev.aol.com/article/2007/04/basic-boxely-app-part2' refer='feature_041707' />">Part 2</a></li>
</ul>


                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="../footer.jsp" />
    </div>
</div>

</body>

</html>
