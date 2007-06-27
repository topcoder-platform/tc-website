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

<p>Wednesday, June 27, 2007<br />
by <span><b>the Development Review Board</b></span><br />
<span><i>TopCoder Members</i></span></p>

<p>Here's an overview of the components the Design finalists have been battling over:</p>


<p>Wednesday, June 27, 2007<br />
<span style="font-size:14px; font-weight:bold;">DynamicWebPageData</span><br />
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
