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

                        <h1><span>Component Design Summary</span></h1>
                        <div style="float:right;">
                            <A HREF="http://forums.topcoder.com/?module=ThreadList&amp;forumID=516333">Discuss this</A><br>
                        </div>

<p>Wednesday, June 27, 2007<br />
by <span><b>the Design Review Board</b></span><br />
<span><i>TopCoder Members</i></span></p>

<p>Here's an overview of the components the Design finalists have been battling over:</p>


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

<p>And here is the final scoreboard for this component:</p>
<table cellspacing="0" cellpadding="0" class="stat" style="width: 100%"> <thead>
    <tr class="sidebarTitle" nowrap="nowrap"> <td class="header">Competitor</td><td class="header">Reviewer: <tc-webtag:handle coderId="10526732" context="design"/></td><td class="header">Reviewer: <tc-webtag:handle coderId="278342" context="design"/></td><td class="header">Reviewer: <tc-webtag:handle coderId="10348862" context="design"/></td><td class="header">Average</td>
    </tr>
</thead>
<tbody>
<tr class="light"><td class="value"><tc-webtag:handle coderId="152342" context="design"/></td><td class="value">94.97</td><td class="value">89.25</td><td class="value">86.78</td><td class="value">90.33</td></tr>    
<tr class="dark"><td class="value"><tc-webtag:handle coderId="10028010" context="design"/></td><td class="value">97.31</td><td class="value">85.78</td><td class="value">84.97</td><td class="value">89.35</td></tr>    
<tr class="light"><td class="value"><tc-webtag:handle coderId="275640" context="design"/></td><td class="value">93.44</td><td class="value">86.91</td><td class="value">84.78</td><td class="value">88.38</td></tr> <tr class="dark"><td class="value"><tc-webtag:handle coderId="252022" context="design"/></td><td class="value">62.75</td><td class="value">61.28</td><td class="value">67.53</td><td class="value">63.85</td></tr> <tr class="light"><td class="value"><tc-webtag:handle coderId="22651514" context="design"/></td><td class="value">66.75</td><td class="value">55.84</td><td class="value">58.25</td><td class="value">60.28</td></tr> <tr class="dark"><td class="value"><tc-webtag:handle coderId="20256177" context="design"/></td><td class="value">59.97</td><td class="value">45.06</td><td class="value">54.53</td><td class="value">53.19</td></tr> </tbody> </table>

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
