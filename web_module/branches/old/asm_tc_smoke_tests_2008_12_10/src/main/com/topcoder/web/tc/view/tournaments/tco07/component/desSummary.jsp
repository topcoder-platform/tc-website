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
                    <jsp:param name="tabLev2" value="design"/>
                    <jsp:param name="tabLev3" value="summary"/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">

                        <h1><span>kyky is the new Component Design Champion</span></h1>
                        <div style="float:right;">
                            <A HREF="http://forums.topcoder.com/?module=ThreadList&amp;forumID=516333">Discuss this</A><br>
                        </div>

<p>Friday, June 29, 2007<br />
by <span><b>the Design Review Board</b></span><br />
<span><i>TopCoder Members</i></span></p>

<img style="float:right; width:200px; 350px; padding-left:10px;" src="/i/tournament/tco07/compDes.jpg">
<br><br>
<p>After three days of on-site finals, <tc-webtag:handle coderId="152342" context="design"/> emerged as the winner of the 2007 TopCoder Open Component Design competition, taking home the top prize of $25,000. <tc-webtag:handle coderId="22651514" context="design"/> took second place, and <tc-webtag:handle coderId="10028010" context="design"/> took home the third.</p>

<%-- Round 1 --%>
<p>Wednesday, June 27, 2007<br />
<span style="font-size:14px; font-weight:bold;">Round 1: File Delivery</span><br />
by <tc-webtag:handle coderId="278342" />
</p>

<p>
We've all had problems with sending files as attachments through email. Either the attachment is too big or the email server has some crazy antivirus system that will not let your attachment through. The File Delivery component (or better said, application) comes to address this problem. It is basically a Web base file storage solution. You can go to a site where the application is installed, upload the file you want to send, and then specify the email address(es) you want it to be sent to. The recipients will receive an automatic email with the URL of the file. There are also nice features such as receiving notifications when the recipients actually download the file and you can also say when the file will expire.
</p>
<p>
From a design point of view this application is not hard but there are a lot of things that need to be done. There are servlets for upload and download, there is an email notification system and there is also database persistence because the application needs to keep track of expired files.
</p>
<p>
The best submission managed to address all the requirements properly and also took into consideration performance issues (handling huge uploaded files efficiently). Some added additional functionality, such as the ability to view a history of the uploaded files, and support for authentication in the future.
</p>
<br /><br />


<%-- Round 2 --%>
<p>Thursday, June 28, 2007<br />
<span style="font-size:14px; font-weight:bold;">Generic Application Service Processor</span><br />
by <tc-webtag:handle coderId="10348862" context="design" />
</p>

<p>The Generic Application Service Processor (GASP) component provides a service framework for applications, which allows the decoupling between the presentation and business tiers of an application. The customer of a service will use a concrete Event in order to invoke the service. He can pass the custom arguments using the Payload property of the Event. The user will interact only with a service processor delegate, which has the ability to look up the service processor (similar to how the Context is looked up in Java).</p>
<p>The GASP will look up the concrete service implementation based on the ID and version of the Event and will invoke the service. The invocation can be performed inside a transaction and this component will provide at least one implementation of a transaction management mechanism. The result of the service invocation will be returned to the user inside a ServiceResponse, in the Payload property. The user will also have the possibility to simulate a session between multiple invocations of different services by reusing the same EventContext for subsequent service invocations.</p>
<p>Implementing the design for this component was quite straightforward, as the notions needed for the framework were identified and well specified in the requirements. One place where the designers had to be creative in order to achieve the requirements was in the transactions area.</p>
<p>For the Java version, there are multiple technologies that could be supported: EJB, Spring, and so forth. For the .NET version, the usage of TransactionScope was quite straightforward. The designers also had a challenge in choosing the way to look up the service processor and the way to invoke the services. These could have been done locally (using direct method calls) or remotely. There was one interesting approach which uses MSMQs in order to look-up the service processor remotely.</p>
<p>This approach has the advantage of working remotely, but it has the drawback of a possible overhead introduced by the queues. Another interesting aspect inside a submission was the possibility to map the service to normal methods, similar to how web services / web methods work.</p>
<br /><br />


<%-- Round 3 --%>
<p>Friday, June 29, 2007<br />
<span style="font-size:14px; font-weight:bold;">DB Converter</span><br />
by <tc-webtag:handle coderId="10526732" context="design"/>
</p>

<p>DB Converter is a command line tool which provides the functionality to convert a database structure from one database to another. Since the concrete design of different database systems vary a great deal, the component will only cover the configured / pre-defined parts of the database structure, and log all the things not successfully converted into a file. The initial version supports database objects including Table, Column, Keys and Index.</p>
<p>The very first thing to consider before starting the design is to define a set of metadata to store the database structure, then two main procedures should be designed, one is to pull out the structure / objects of a database and convert it to the metadata form defined before, the other procedure is to convert the metadata information into DDL which can establish the structure in the destination database.</p>
<p>The basic requirement is not hard to fulfill, but making the whole design clean and easy to understand is not a trivial job. More specifically, how to define the metadata and the configuration format is important for flexibility and extensibility consideration. Some of the competitors deal with this problem elegantly and provide clean design which is easy to extend and can accommodate further requirements.</p>
<br /><br />

<p style="font-size:14px; font-weight:bold;">Component Design: Scores &amp; Wagers</p>
<table cellspacing="0" cellpadding="0" class="stat" style="width: 100%">
    <%-- Round 1 --%>
    <thead>
        <tr class="sidebarTitle" nowrap="nowrap">
            <td class="headerC" colspan="1">&nbsp;</td>
            <td class="headerC" colspan="5">File Delivery<br />
                <A href="https://software.topcoder.com/catalog/c_component.jsp?comp=26806052&ver=1"><img src="/i/interface/java.gif" alt="Java" border="0" /></A>
                <A href="https://software.topcoder.com/catalog/c_component.jsp?comp=26806061&ver=1"><img src="/i/interface/dotnet.gif" alt=".NET" border="0" /></A></td>
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
    <%-- kyky --%>
    <tbody>
        <tr class="light">
            <td class="value"><tc-webtag:handle coderId="152342" context="design"/></td>
            <td class="valueC">87.89</td>
            <td class="valueC">90.33</td>
            <td class="valueC">1</td>
            <td class="valueC">30</td>
            <td class="valueC">30</td>
            <td class="valueC"><a href="https://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=50841"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
            <td class="headerC">30</td>
        </tr>
    </tbody>
    <%-- bendlund --%>
    <tbody>
        <tr class="dark">
            <td class="value"><tc-webtag:handle coderId="22651514" context="design"/></td>
            <td class="valueC">57.17</td>
            <td class="valueC">60.28</td>
            <td class="valueC">5</td>
            <td class="valueC">10</td>
            <td class="valueC">2</td>
            <td class="valueC"><a href="https://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=50794"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
            <td class="headerC">2</td>
        </tr>
    </tbody>
    <%-- oldbam --%>
    <tbody>
        <tr class="light">
            <td class="value"><tc-webtag:handle coderId="10028010" context="design"/></td>
            <td class="valueC">88.79</td>
            <td class="valueC">89.35</td>
            <td class="valueC">2</td>
            <td class="valueC">45</td>
            <td class="valueC">22</td>
            <td class="valueC"><a href="https://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=50836"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
            <td class="headerC">22</td>
        </tr>
    </tbody>
    <%-- sql_lall --%>
    <tbody>
        <tr class="dark">
            <td class="value"><tc-webtag:handle coderId="275640" context="design"/></td>
            <td class="valueC">87.63</td>
            <td class="valueC">88.38</td>
            <td class="valueC">3</td>
            <td class="valueC">30</td>
            <td class="valueC">10</td>
            <td class="valueC"><a href="https://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=50839"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
            <td class="headerC">10</td>
        </tr>
    </tbody>
    <%-- argolite --%>
    <tbody>
        <tr class="light">
            <td class="value"><tc-webtag:handle coderId="287614" context="design"/></td>
            <td class="valueC">n/a</td>
            <td class="valueC">n/a</td>
            <td class="valueC">7</td>
            <td class="valueC">10</td>
            <td class="valueC">1</td>
            <td class="valueC">n/a</td>
            <td class="headerC">1</td>
        </tr>
    </tbody>
    <%-- AleaActaEst --%>
    <tbody>
        <tr class="dark">
            <td class="value"><tc-webtag:handle coderId="252022" context="design"/></td>
            <td class="valueC">54.48</td>
            <td class="valueC">63.85</td>
            <td class="valueC">4</td>
            <td class="valueC">10</td>
            <td class="valueC">2</td>
            <td class="valueC"><a href="https://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=50838"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
            <td class="headerC">2</td>
        </tr>
    </tbody>
    <%-- kakarotto --%>
    <tbody>
        <tr class="light">
            <td class="value"><tc-webtag:handle coderId="20256177" context="design"/></td>
            <td class="valueC">52.29</td>
            <td class="valueC">53.19</td>
            <td class="valueC">6</td>
            <td class="valueC">20</td>
            <td class="valueC">3</td>
            <td class="valueC"><a href="https://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=50832"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
            <td class="headerC">3</td>
        </tr>
        <tr><td colspan="8">&nbsp;</td></tr>
    </tbody>
    
    <%-- Round 2 --%>
    <thead>
        <tr class="sidebarTitle" nowrap="nowrap">
            <td class="headerC" colspan="1">&nbsp;</td>
            <td class="headerC" colspan="5">Generic Application Service Processor<br />
                <A href="https://software.topcoder.com/catalog/c_component.jsp?comp=26814640&ver=1"><img src="/i/interface/java.gif" alt="Java" border="0" /></A>
                <A href="https://software.topcoder.com/catalog/c_component.jsp?comp=26814570&ver=1"><img src="/i/interface/dotnet.gif" alt=".NET" border="0" /></A></td>
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
    <%-- kyky --%>
    <tbody>
        <tr class="light">
            <td class="value"><tc-webtag:handle coderId="152342" context="design"/></td>
            <td class="valueC">85.05</td>
            <td class="valueC">94.17</td>
            <td class="valueC">1</td>
            <td class="valueC">48</td>
            <td class="valueC">48</td>
            <td class="valueC"><a href="https://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=53093"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
            <td class="headerC">78</td>
        </tr>
    </tbody>
    <%-- bendlund --%>
    <tbody>
        <tr class="dark">
            <td class="value"><tc-webtag:handle coderId="22651514" context="design"/></td>
            <td class="valueC">89.13</td>
            <td class="valueC">93.27</td>
            <td class="valueC">2</td>
            <td class="valueC">60</td>
            <td class="valueC">30</td>
            <td class="valueC"><a href="https://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=53090"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
            <td class="headerC">32</td>
        </tr>
    </tbody>
    <%-- oldbam --%>
    <tbody>
        <tr class="light">
            <td class="value"><tc-webtag:handle coderId="10028010" context="design"/></td>
            <td class="valueC">85.43</td>
            <td class="valueC">87.26</td>
            <td class="valueC">4</td>
            <td class="valueC">45</td>
            <td class="valueC">11</td>
            <td class="valueC"><a href="https://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=53029"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
            <td class="headerC">33</td>
        </tr>
    </tbody>
    <%-- sql_lall --%>
    <tbody>
        <tr class="dark">
            <td class="value"><tc-webtag:handle coderId="275640" context="design"/></td>
            <td class="valueC">n/a</td>
            <td class="valueC">n/a</td>
            <td class="valueC">6</td>
            <td class="valueC">10</td>
            <td class="valueC">1</td>
            <td class="valueC">n/a</td>
            <td class="headerC">11</td>
        </tr>
    </tbody>
    <%-- argolite --%>
    <tbody>
        <tr class="light">
            <td class="value"><tc-webtag:handle coderId="287614" context="design"/></td>
            <td class="valueC">89.5</td>
            <td class="valueC">92.69</td>
            <td class="valueC">3</td>
            <td class="valueC">60</td>
            <td class="valueC">20</td>
            <td class="valueC"><a href="https://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=53095"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
            <td class="headerC">21</td>
        </tr>
    </tbody>
    <%-- AleaActaEst --%>
    <tbody>
        <tr class="dark">
            <td class="value"><tc-webtag:handle coderId="252022" context="design"/></td>
            <td class="valueC">64.11</td>
            <td class="valueC">70.48</td>
            <td class="valueC">5</td>
            <td class="valueC">60</td>
            <td class="valueC">12</td>
            <td class="valueC"><a href="https://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=53094"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
            <td class="headerC">14</td>
        </tr>
    </tbody>
    <%-- kakarotto --%>
    <tbody>
        <tr class="light">
            <td class="value"><tc-webtag:handle coderId="20256177" context="design"/></td>
            <td class="valueC">n/a</td>
            <td class="valueC">n/a</td>
            <td class="valueC">6</td>
            <td class="valueC">30</td>
            <td class="valueC">5</td>
            <td class="valueC">n/a</td>
            <td class="headerC">8</td>
        </tr>
        <tr><td colspan="8">&nbsp;</td></tr>
    </tbody>
    
    <%-- Round 3 --%>
    <thead>
        <tr class="sidebarTitle" nowrap="nowrap">
            <td class="headerC" colspan="1">&nbsp;</td>
            <td class="headerC" colspan="5">DB Converter<br />
                <A href="https://software.topcoder.com/catalog/c_component.jsp?comp=26823745&ver=1"><img src="/i/interface/java.gif" alt="Java" border="0" /></A>
                <A href="https://software.topcoder.com/catalog/c_component.jsp?comp=26823759&ver=1"><img src="/i/interface/dotnet.gif" alt=".NET" border="0" /></A></td>
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
    <%-- kyky --%>
    <tbody>
        <tr class="light">
            <td class="value"><tc-webtag:handle coderId="152342" context="design"/></td>
            <td class="valueC">84.63</td>
            <td class="valueC">86.57</td>
            <td class="valueC">1</td>
            <td class="valueC">22</td>
            <td class="valueC">22</td>
            <td class="valueC"><a href="https://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=53972"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
            <td class="headerC">100</td>
        </tr>
    </tbody>
    <%-- bendlund --%>
    <tbody>
        <tr class="dark">
            <td class="value"><tc-webtag:handle coderId="22651514" context="design"/></td>
            <td class="valueC">81.4</td>
            <td class="valueC">85.68</td>
            <td class="valueC">2</td>
            <td class="valueC">30</td>
            <td class="valueC">15</td>
            <td class="valueC"><a href="https://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=53975"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
            <td class="headerC">47</td>
        </tr>
    </tbody>
    <%-- oldbam --%>
    <tbody>
        <tr class="light">
            <td class="value"><tc-webtag:handle coderId="10028010" context="design"/></td>
            <td class="valueC">n/a</td>
            <td class="valueC">n/a</td>
            <td class="valueC">6</td>
            <td class="valueC">10</td>
            <td class="valueC">1</td>
            <td class="valueC">n/a</td>
            <td class="headerC">34</td>
        </tr>
    </tbody>
    <%-- sql_lall --%>
    <tbody>
        <tr class="dark">
            <td class="value"><tc-webtag:handle coderId="275640" context="design"/></td>
            <td class="valueC">84.14</td>
            <td class="valueC">85.62</td>
            <td class="valueC">3</td>
            <td class="valueC">60</td>
            <td class="valueC">20</td>
            <td class="valueC"><a href="https://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=53934"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
            <td class="headerC">31</td>
        </tr>
    </tbody>
    <%-- argolite --%>
    <tbody>
        <tr class="light">
            <td class="value"><tc-webtag:handle coderId="287614" context="design"/></td>
            <td class="valueC">n/a</td>
            <td class="valueC">n/a</td>
            <td class="valueC">6</td>
            <td class="valueC">30</td>
            <td class="valueC">5</td>
            <td class="valueC">n/a</td>
            <td class="headerC">31</td>
        </tr>
    </tbody>
    <%-- AleaActaEst --%>
    <tbody>
        <tr class="dark">
            <td class="value"><tc-webtag:handle coderId="252022" context="design"/></td>
            <td class="valueC">52.61</td>
            <td class="valueC">56.46</td>
            <td class="valueC">4</td>
            <td class="valueC">30</td>
            <td class="valueC">7</td>
            <td class="valueC"><a href="https://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=53973"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
            <td class="headerC">21</td>
        </tr>
    </tbody>
    <%-- kakarotto --%>
    <tbody>
        <tr class="light">
            <td class="value"><tc-webtag:handle coderId="20256177" context="design"/></td>
            <td class="valueC">34.77</td>
            <td class="valueC">34.77</td>
            <td class="valueC">5</td>
            <td class="valueC">50</td>
            <td class="valueC">10</td>
            <td class="valueC"><a href="https://software.topcoder.com/review/actions/DownloadSubmission.do?method=downloadSubmission&uid=53911"><img src="/i/interface/download.gif" alt="download" border="0" /></a></td>
            <td class="headerC">18</td>
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
