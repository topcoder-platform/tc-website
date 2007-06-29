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
                    <jsp:param name="tabLev1" value="component"/>
                    <jsp:param name="tabLev2" value="development"/>
                    <jsp:param name="tabLev3" value="summary"/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">

                        <h1><span>Component Development Summary</span></h1>
                        <div style="float:right;">
                            <A HREF="http://forums.topcoder.com/?module=ThreadList&amp;forumID=516333">Discuss this</A><br>
                        </div>

<p>Thursday, June 28, 2007<br />
by <span><b>the Development Review Board</b></span><br />
<span><i>TopCoder Members</i></span></p>

<p>Here's an overview of the components the Development finalists have been battling over:</p>


<%-- Round 2 --%>
<p>Wednesday, June 28, 2007<br />
<span style="font-size:14px; font-weight:bold;">AJAX Customizable Page Layout</span><br />
by <tc-webtag:handle coderId="7584235" context="development" />
</p>

<p>The AJAX Customizable Page Layout component provides an AJAX-based mechanism for use with web applications to give the ability for a web application user to customize the layout of a page by dragging and dropping content sections. The component consists of custom controls that implement the movable sections, and server-side objects that handle AJAX-based notifications of customization actions by recording them in a persistent store for use during subsequent page views.</p>
<p>The movement of sections is supported by the client-side JavaScript classes. Yes! C# developers had to write JavaScript code here.</p>
<p>Actually this part could be identical in Java and C# versions but designers used different ways of interacting with the underlying TopCoder JavaScript Drag and Drop component.</p>
<p>In the C# version, the designer suggested developers explicitly control the absolute coordinates of the movable sections. In this case when any action occurs we need to manually rearrange elements. It includes calculation of parent's absolute coordinates and relative position of each section within the parent. But JavaScript functions have different behavior depends of the browser (we need to support IE and FireFox) and page mode (quirks or strict) and it is not easy to make all these things workable. The other common challenge came from the fact that developers have to recalculate positions not only after the layout change but after other events (load, resize) also.</p>
<p>In the Java version developers didn't work with coordinates at all but instead swapped elements in the DOM. It is much easier and requires less effort to make the component workable.</p>
<p>Compared with JavaScript, the implementation of the custom controls and server side objects was straightforward and relatively easy.</p>
<table cellspacing="0" cellpadding="0" class="stat" style="width: 100%"> <thead>
    <tr class="sidebarTitle" nowrap="nowrap"> <td class="header">Competitor</td> <td class="header">Reviewer: <tc-webtag:handle coderId="347569" context="development"/></td><td class="header">Reviewer: <tc-webtag:handle coderId="7584235" context="development"/></td><td class="header">Reviewer: <tc-webtag:handle coderId="297731" context="development"/></td><td class="header">Average</td></tr></thead>
<tbody>

<tr class="light"><td class="value"><tc-webtag:handle coderId="9998760" context="development"/></td><td class="value">88.59</td><td class="value">95.32</td><td class="value">98.69</td><td class="value">94.20</td></tr> <tr class="dark"><td class="value"><tc-webtag:handle coderId="7210680" context="development"/></td><td class="value">88.88</td><td class="value">86.21</td><td class="value">99.25</td><td class="value">91.45</td></tr> <tr class="light"><td class="value"><tc-webtag:handle coderId="15214882" context="development"/></td><td class="value">82.41</td><td class="value">87.41</td><td class="value">97.19</td><td class="value">89.00</td></tr> <tr class="dark"><td class="value"><tc-webtag:handle coderId="20092786" context="development"/></td><td class="value">72.16</td><td class="value">80.02</td><td class="value">89.06</td><td class="value">80.41</td></tr> <tr class="light"><td class="value"><tc-webtag:handle coderId="7359397" context="development"/></td><td class="value">64.25</td><td class="value">79.1</td><td class="value">90.94</td><td class="value">78.10</td></tr> <tr class="dark"><td class="value"><tc-webtag:handle coderId="15763373" context="development"/></td><td class="value">56.12</td><td class="value">62.04</td><td class="value">82.89</td><td class="value">67.02</td></tr> </tbody> </table>

<br /><br />




<%-- Round 1 --%>
<p>Wednesday, June 27, 2007<br />
<span style="font-size:14px; font-weight:bold;">Dynamic Web Page Data</span><br />
by <tc-webtag:handle coderId="297731" />
</p>

<p>
This component, by offering to uniformize the handling of the data within a web application, has the potential to save its users many development hours.
</p>
<p>
Even though simple in appearance, its developers needed to pay special attention to minute details. And the opportunities were many to create a difference with the other submissions. One of the most exciting things about one of the submissions was the way it avoided the traps presented by the multithreading aspects and managed to add some efficiency to the designer's algorithms by finding workarounds to reflection's pitfalls.
</p>
<p>
It should be interesting to see what usage this component is put to in the following weeks.
</p>
<p>And here is the final scoreboard for this component:</p>
<table cellspacing="0" cellpadding="0" class="stat" style="width: 100%"> <thead>
    <tr class="sidebarTitle" nowrap="nowrap"> <td class="header">Competitor</td><td class="header">Reviewer: <tc-webtag:handle coderId="347569" context="development"/></td><td class="header">Reviewer: <tc-webtag:handle coderId="297731" context="development"/></td><td class="header">Reviewer: <tc-webtag:handle coderId="7584235" context="development"/></td><td class="header">Average</td>
    </tr>
</thead>
<tbody>
<tr class="light"><td class="value"><tc-webtag:handle coderId="15214882" context="development"/></td><td class="value">91.25</td><td class="value">96.91</td><td class="value">94.56</td><td class="value">94.24</td></tr> <tr class="dark"><td class="value"><tc-webtag:handle coderId="7210680" context="development"/></td><td class="value">89.34</td><td class="value">97.16</td><td class="value">93.13</td><td class="value">93.21</td></tr> <tr class="light"><td class="value"><tc-webtag:handle coderId="9998760" context="development"/></td><td class="value">88.84</td><td class="value">91.34</td><td class="value">95.46</td><td class="value">91.88</td></tr> <tr class="dark"><td class="value"><tc-webtag:handle coderId="15763373" context="development"/></td><td class="value">81.19</td><td class="value">86.14</td><td class="value">90.41</td><td class="value">85.91</td></tr> <tr class="light"><td class="value"><tc-webtag:handle coderId="20092786" context="development"/></td><td class="value">76.81</td><td class="value">86.72</td><td class="value">83.9</td><td class="value">82.48</td></tr> </tbody> </table>

<br /><br />
                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="../footer.jsp" />
    </div>
</div>

</body>

</html>
