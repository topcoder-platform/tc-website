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

                        <h1><span>Hefeng is the new Component Development Champion</span></h1>
                        <div style="float:right;">
                            <A HREF="http://forums.topcoder.com/?module=ThreadList&amp;forumID=516333">Discuss this</A><br>
                        </div>

<p>Friday, June 29, 2007<br />
by <span><b>the Development Review Board</b></span><br />
<span><i>TopCoder Members</i></span></p>

<p>After three days of on-site finals, <tc-webtag:handle coderId="15214882" context="development"/> emerged as the winner of the 2007 TopCoder Open Component Development competition, taking home the top prize of $15,000. <tc-webtag:handle coderId="9998760" context="development"/> came in second, and <tc-webtag:handle coderId="7210680" context="development"/> took home the third.</p>


<%-- Round 1 --%>
<p>Wednesday, June 27, 2007<br />
<span style="font-size:14px; font-weight:bold;">Dynamic Web Page Data</span><br />
by <tc-webtag:handle coderId="297731" context="development"/>
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

<br /><br />


<%-- Round 2 --%>
<p>Thursday, June 28, 2007<br />
<span style="font-size:14px; font-weight:bold;">AJAX Customizable Page Layout</span><br />
by <tc-webtag:handle coderId="7584235" context="development" />
</p>

<p>The AJAX Customizable Page Layout component provides an AJAX-based mechanism for use with web applications to give the ability for a web application user to customize the layout of a page by dragging and dropping content sections. The component consists of custom controls that implement the movable sections, and server-side objects that handle AJAX-based notifications of customization actions by recording them in a persistent store for use during subsequent page views.</p>
<p>The movement of sections is supported by the client-side JavaScript classes. Yes! C# developers had to write JavaScript code here.</p>
<p>Actually this part could be identical in Java and C# versions but designers used different ways of interacting with the underlying TopCoder JavaScript Drag and Drop component.</p>
<p>In the C# version, the designer suggested developers explicitly control the absolute coordinates of the movable sections. In this case when any action occurs we need to manually rearrange elements. It includes calculation of parent's absolute coordinates and relative position of each section within the parent. But JavaScript functions have different behavior depends of the browser (we need to support IE and FireFox) and page mode (quirks or strict) and it is not easy to make all these things workable. The other common challenge came from the fact that developers have to recalculate positions not only after the layout change but after other events (load, resize) also.</p>
<p>In the Java version developers didn't work with coordinates at all but instead swapped elements in the DOM. It is much easier and requires less effort to make the component workable.</p>
<p>Compared with JavaScript, the implementation of the custom controls and server side objects was straightforward and relatively easy.</p>

<br /><br />


<%-- Round 3 --%>
<p>Friday, June 29, 2007<br />
<span style="font-size:14px; font-weight:bold;">Stress Test</span><br />
by <tc-webtag:handle coderId="347569" context="development"/>
</p>

<p>The Stress Test component provides a framework for defining and executing stress tests. The tests can be running on multiple threads with flexible scheduling options.</p>
<p>Both designs (Java version and .NET version) are very clear and the implementation notes for most methods and algorithms are detailed. Developers should pay attention to thread safety, since most submissions had thread safety issues.</p>
<p>In the test runner class of the .NET version, the original design uses the .NET framework API, which cannot handle more than 64 threads. One submission made improvements on this, and can use more than 64 threads to run the tests.</p>

<br /><br />

<p style="font-size:14px; font-weight:bold;">Component Development: Scores &amp; Wagers</p>
<table cellspacing="0" cellpadding="0" class="stat" style="width: 100%">
    <%-- Round 1 --%>
    <thead>
        <tr class="sidebarTitle" nowrap="nowrap">
            <td class="headerC" colspan="1">&nbsp;</td>
            <td class="headerC" colspan="5">Dynamic Web Page Data<br />
                <A href="https://software.topcoder.com/catalog/c_component.jsp?comp=26778367&ver=1"><img src="/i/interface/java.gif" alt="Java" border="0" /></A>
                <A href="https://software.topcoder.com/catalog/c_component.jsp?comp=26778513&ver=1"><img src="/i/interface/dotnet.gif" alt=".NET" border="0" /></A></td>
            <td class="headerC" colspan="2">&nbsp;</td>
        </tr>
        <tr class="sidebarTitle" nowrap="nowrap">
            <td class="headerC" colspan="1">&nbsp;</td>
            <td class="headerC" colspan="5">Round 1</td>
            <td class="headerC" colspan="2">&nbsp;</td>
        </tr>
        <tr class="sidebarTitle" nowrap="nowrap">
            <td class="header">Competitor</td>
            <td class="headerC">initial score</td>
            <td class="headerC">final score</td>
            <td class="headerC">place</td>
            <td class="headerC">wager</td>
            <td class="headerC">points</td>
            <td class="headerC">link</td>
            <td class="headerC">rd1 total</td>
        </tr>
    </thead> 
    <%-- hefeng --%>
    <tbody>
        <tr class="light">
            <td class="value"><tc-webtag:handle coderId="15214882" context="development"/></td>
            <td class="valueC">90.8</td>
            <td class="valueC">94.24</td>
            <td class="valueC">1</td>
            <td class="valueC">25</td>
            <td class="valueC">25</td>
            <td class="valueC"><a href="https://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=50842"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
            <td class="headerC">25</td>
        </tr>
    </tbody>
    <%-- PE --%>
    <tbody>
        <tr class="dark">
            <td class="value"><tc-webtag:handle coderId="9998760" context="development"/></td>
            <td class="valueC">89.98</td>
            <td class="valueC">91.88</td>
            <td class="valueC">3</td>
            <td class="valueC">18</td>
            <td class="valueC">6</td>
            <td class="valueC"><a href="https://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=50740"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
            <td class="headerC">6</td>
        </tr>
    </tbody>
    <%-- cnettel --%>
    <tbody>
        <tr class="light">
            <td class="value"><tc-webtag:handle coderId="7210680" context="development"/></td>
            <td class="valueC">89.19</td>
            <td class="valueC">93.21</td>
            <td class="valueC">2</td>
            <td class="valueC">24</td>
            <td class="valueC">12</td>
            <td class="valueC"><a href="https://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=50830"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
            <td class="headerC">12</td>
        </tr>
    </tbody>
    <%-- wolve --%>
    <tbody>
        <tr class="dark">
            <td class="value"><tc-webtag:handle coderId="7359397" context="development"/></td>
            <td class="valueC">n/a</td>
            <td class="valueC">n/a</td>
            <td class="valueC">6</td>
            <td class="valueC">10</td>
            <td class="valueC">1</td>
            <td class="valueC">n/a</td>
            <td class="headerC">1</td>
        </tr>
    </tbody>
    <%-- tyrian --%>
    <tbody>
        <tr class="light">
            <td class="value"><tc-webtag:handle coderId="15763373" context="development"/></td>
            <td class="valueC">83.51</td>
            <td class="valueC">85.91</td>
            <td class="valueC">4</td>
            <td class="valueC">30</td>
            <td class="valueC">7</td>
            <td class="valueC"><a href="https://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=50826"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
            <td class="headerC">7</td>
        </tr>
    </tbody>
    <%-- enefem21 --%>
    <tbody>
        <tr class="dark">
            <td class="value"><tc-webtag:handle coderId="20092786" context="development"/></td>
            <td class="valueC">82.48</td>
            <td class="valueC">82.48</td>
            <td class="valueC">5</td>
            <td class="valueC">33</td>
            <td class="valueC">6</td>
            <td class="valueC"><a href="https://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=50773"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
            <td class="headerC">6</td>
        </tr>
        <tr><td colspan="8">&nbsp;</td></tr>
    </tbody>
    
    <%-- Round 2 --%>
    <thead>
        <tr class="sidebarTitle" nowrap="nowrap">
            <td class="headerC" colspan="1">&nbsp;</td>
            <td class="headerC" colspan="5">AJAX Customizable Page Layout<br />
                <A href="https://software.topcoder.com/catalog/c_component.jsp?comp=26783227&ver=1"><img src="/i/interface/java.gif" alt="Java" border="0" /></A>
                <A href="https://software.topcoder.com/catalog/c_component.jsp?comp=26783401&ver=1"><img src="/i/interface/dotnet.gif" alt=".NET" border="0" /></A></td>
            <td class="headerC" colspan="2">&nbsp;</td>
        </tr>
        <tr class="sidebarTitle" nowrap="nowrap">
            <td class="headerC" colspan="1">&nbsp;</td>
            <td class="headerC" colspan="5">Round 2</td>
            <td class="headerC" colspan="2">&nbsp;</td>
        </tr>
        <tr class="sidebarTitle" nowrap="nowrap">
            <td class="header">Competitor</td>
            <td class="headerC">initial score</td>
            <td class="headerC">final score</td>
            <td class="headerC">place</td>
            <td class="headerC">wager</td>
            <td class="headerC">points</td>
            <td class="headerC">link</td>
            <td class="headerC">rd2 total</td>
        </tr>
    </thead> 
    <%-- hefeng --%>
    <tbody>
        <tr class="light">
            <td class="value"><tc-webtag:handle coderId="15214882" context="development"/></td>
            <td class="valueC">86.92</td>
            <td class="valueC">89</td>
            <td class="valueC">3</td>
            <td class="valueC">20</td>
            <td class="valueC">6</td>
            <td class="valueC"><a href="https://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=52711"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
            <td class="headerC">31</td>
        </tr>
    </tbody>
    <%-- PE --%>
    <tbody>
        <tr class="dark">
            <td class="value"><tc-webtag:handle coderId="9998760" context="development"/></td>
            <td class="valueC">92.31</td>
            <td class="valueC">94.2</td>
            <td class="valueC">1</td>
            <td class="valueC">60</td>
            <td class="valueC">60</td>
            <td class="valueC"><a href="https://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=52561"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
            <td class="headerC">66</td>
        </tr>
    </tbody>
    <%-- cnettel --%>
    <tbody>
        <tr class="light">
            <td class="value"><tc-webtag:handle coderId="7210680" context="development"/></td>
            <td class="valueC">86.07</td>
            <td class="valueC">91.45</td>
            <td class="valueC">2</td>
            <td class="valueC">19</td>
            <td class="valueC">9</td>
            <td class="valueC"><a href="https://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=52714"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
            <td class="headerC">21</td>
        </tr>
    </tbody>
    <%-- wolve --%>
    <tbody>
        <tr class="dark">
            <td class="value"><tc-webtag:handle coderId="7359397" context="development"/></td>
            <td class="valueC">77.72</td>
            <td class="valueC">78.1</td>
            <td class="valueC">5</td>
            <td class="valueC">30</td>
            <td class="valueC">6</td>
            <td class="valueC"><a href="https://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=52724"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
            <td class="headerC">7</td>
        </tr>
    </tbody>
    <%-- tyrian --%>
    <tbody>
        <tr class="light">
            <td class="value"><tc-webtag:handle coderId="15763373" context="development"/></td>
            <td class="valueC">67.02</td>
            <td class="valueC">67.02</td>
            <td class="valueC">6</td>
            <td class="valueC">10</td>
            <td class="valueC">1</td>
            <td class="valueC"><a href="https://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=52730"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
            <td class="headerC">8</td>
        </tr>
    </tbody>
    <%-- enefem21 --%>
    <tbody>
        <tr class="dark">
            <td class="value"><tc-webtag:handle coderId="20092786" context="development"/></td>
            <td class="valueC">80.41</td>
            <td class="valueC">80.41</td>
            <td class="valueC">4</td>
            <td class="valueC">33</td>
            <td class="valueC">8</td>
            <td class="valueC"><a href="https://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=52738"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
            <td class="headerC">14</td>
        </tr>
        <tr><td colspan="8">&nbsp;</td></tr>
    </tbody>
    
    <%-- Round 3 --%>
    <thead>
        <tr class="sidebarTitle" nowrap="nowrap">
            <td class="headerC" colspan="1">&nbsp;</td>
            <td class="headerC" colspan="5">Stress Test<br />
                <A href="https://software.topcoder.com/catalog/c_component.jsp?comp=4311900&ver=1"><img src="/i/interface/java.gif" alt="Java" border="0" /></A>
                <A href="https://software.topcoder.com/catalog/c_component.jsp?comp=26767279&ver=1"><img src="/i/interface/dotnet.gif" alt=".NET" border="0" /></A></td>
            <td class="headerC" colspan="2">&nbsp;</td>
        </tr>
        <tr class="sidebarTitle" nowrap="nowrap">
            <td class="headerC" colspan="1">&nbsp;</td>
            <td class="headerC" colspan="5">Round 3</td>
            <td class="headerC" colspan="2">&nbsp;</td>
        </tr>
        <tr class="sidebarTitle" nowrap="nowrap">
            <td class="header">Competitor</td>
            <td class="headerC">initial score</td>
            <td class="headerC">final score</td>
            <td class="headerC">place</td>
            <td class="headerC">wager</td>
            <td class="headerC">points</td>
            <td class="headerC">link</td>
            <td class="headerC">rd3 total</td>
        </tr>
    </thead> 
    <%-- hefeng --%>
    <tbody>
        <tr class="light">
            <td class="value"><tc-webtag:handle coderId="15214882" context="development"/></td>
            <td class="valueC">91.61</td>
            <td class="valueC">96.42</td>
            <td class="valueC">1</td>
            <td class="valueC">55</td>
            <td class="valueC">55</td>
            <td class="valueC"><a href="https://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=53981"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
            <td class="headerC">86</td>
        </tr>
    </tbody>
    <%-- PE --%>
    <tbody>
        <tr class="dark">
            <td class="value"><tc-webtag:handle coderId="9998760" context="development"/></td>
            <td class="valueC">90.25</td>
            <td class="valueC">95.85</td>
            <td class="valueC">2</td>
            <td class="valueC">22</td>
            <td class="valueC">11</td>
            <td class="valueC"><a href="https://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=53886"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
            <td class="headerC">77</td>
        </tr>
    </tbody>
    <%-- cnettel --%>
    <tbody>
        <tr class="light">
            <td class="value"><tc-webtag:handle coderId="7210680" context="development"/></td>
            <td class="valueC">91.11</td>
            <td class="valueC">95.22</td>
            <td class="valueC">3</td>
            <td class="valueC">57</td>
            <td class="valueC">19</td>
            <td class="valueC"><a href="https://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=53971"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
            <td class="headerC">40</td>
        </tr>
    </tbody>
    <%-- wolve --%>
    <tbody>
        <tr class="dark">
            <td class="value"><tc-webtag:handle coderId="7359397" context="development"/></td>
            <td class="valueC">85.67</td>
            <td class="valueC">90.01</td>
            <td class="valueC">4</td>
            <td class="valueC">60</td>
            <td class="valueC">15</td>
            <td class="valueC"><a href="https://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=53912"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
            <td class="headerC">22</td>
        </tr>
    </tbody>
    <%-- tyrian --%>
    <tbody>
        <tr class="light">
            <td class="value"><tc-webtag:handle coderId="15763373" context="development"/></td>
            <td class="valueC">80.47</td>
            <td class="valueC">83.09</td>
            <td class="valueC">5</td>
            <td class="valueC">60</td>
            <td class="valueC">12</td>
            <td class="valueC"><a href="https://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=53969"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
            <td class="headerC">20</td>
        </tr>
    </tbody>
    <%-- enefem21 --%>
    <tbody>
        <tr class="dark">
            <td class="value"><tc-webtag:handle coderId="20092786" context="development"/></td>
            <td class="valueC">n/a</td>
            <td class="valueC">n/a</td>
            <td class="valueC">6</td>
            <td class="valueC">34</td>
            <td class="valueC">5</td>
            <td class="valueC">n/a</td>
            <td class="headerC">19</td>
        </tr>
        <tr><td colspan="8">&nbsp;</td></tr>
    </tbody>
</table>
<p>&nbsp;</p>


                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="../footer.jsp" />
    </div>
</div>

</body>

</html>
