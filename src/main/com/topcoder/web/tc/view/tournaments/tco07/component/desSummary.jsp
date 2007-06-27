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
