<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="csf.tld" prefix="csf" %>
<%@ taglib uri="/WEB-INF/tc-webtags.tld" prefix="tc-webtag" %>
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="csf"/>
    </jsp:include>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CSF</title>
</head>

<body>

<div align="center">
    <div id="content">

        <jsp:include page="top.jsp"/>

        <jsp:include page="primaryNav.jsp">
            <jsp:param name="selectedTab" value="schedule"/>
        </jsp:include>

        <div id="main">
            <div class="pageHeader">
                <span class="pageName">Schedule</span>
            </div>

            <table cellpadding="0" cellspacing="0" class="stat" width="100%">
            <tbody>
                <tr>
                    <td class="title" width="50%">
                        <h2 align="center">Creative: Mashup design</h2>
                    </td>
                    <td class="title" width="50%">
                        <h2 align="center">Assembly: Building prototypes</h2>
                    </td>
                </tr>
                <tr>
                    <td class="header" colspan="2">
                        Current competitions
                    </td>
                </tr>
                <tr>
                    <td class="value" style="vertical-align: top;">
                        <div style="margin:10px;">
                            <h3>No active competitions at this time.<br />Please check again soon.</h3>
                        </div>
                    </td>
                    <td class="value" style="vertical-align: top;">
                        <div style="margin:10px;">
                            <h3>British Telecom Workspace</h3>
                                - <strong>Submission Start Date:</strong> August 28, 2007
                                <br />- <strong>Submission End Date:</strong> September 12, 2007
                                <br />- <strong>Review Start Date:</strong> September 12, 2007
                                <br />- <strong>Review End Date:</strong> September 26, 2007
                                <br />- <strong>Winner:</strong> September 27
                            <br /><br /><a href="/?module=Static&d1=assembly&d2=btWiCitiesDetails">details</a>
                        </div>
<%--
                            <h3>No active competitions at this time.<br />Please check again soon.</h3>
--%>
                    </td>
                </tr>
                <tr>
                    <td class="header" colspan="2">
                        Coming soon
                    </td>
                </tr>
                <tr>
                    <td class="value" style="vertical-align: top;">
                        <div style="margin:10px;">
                            More competitions are coming soon.<br />Check back soon for details.
                        </div>
                    </td>
                    <td class="value" style="vertical-align: top;">
                        <div style="margin:10px;">
                            <h3>Microsoft Resource Description Framework Tool</h3>
                            Details coming soon!
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="header" colspan="2">
                        Successful competitions
                    </td>
                </tr>
                <tr>
                    <td class="value" style="vertical-align: top;">
                        <div style="margin:10px;">
                            <h3>British Telecom Business</h3>
                                - <strong>Submission Start Date:</strong> March 6, 2007
                                <br />- <strong>Submission End Date:</strong> March 18, 2007
                                <br />- <strong>Review Start Date:</strong> March 22, 2007
                                <br />- <strong>Review End Date:</strong> March 30, 2007
                                <br />- <strong>Winner:</strong> <a href="/?module=ViewPastContests">View the results!</a>
                            <br /><br /><a href="/?module=ViewContestDetails&ct=1004">details</a>
                        </div>
                        <div style="margin:10px;">
                            <h3>British Telecom Wireless Cities</h3>
                                - <strong>Submission Start Date:</strong> June 7, 2007
                                <br />- <strong>Submission End Date:</strong> June 21, 2007
                                <br />- <strong>Review Start Date:</strong> June 22, 2007
                                <br />- <strong>Review End Date:</strong> July 6, 2007
                                <br />- <strong>Winner:</strong> <a href="/?module=ViewPastContests">View the results!</a>
                            <br /><br /><a href="/?module=ViewContestDetails&ct=1006">details</a>
                        </div>
                        <div style="margin:10px;">
                            <h3>British Telecom Workspace</h3>
                                - <strong>Submission Start Date:</strong> July 19, 2007
                                <br />- <strong>Submission End Date:</strong> August 2, 2007
                                <br />- <strong>Review Start Date:</strong> August 2, 2007
                                <br />- <strong>Review End Date:</strong> August 17, 2007
                                <br />- <strong>Winner:</strong> <a href="/?module=ViewPastContests">View the results!</a>
                            <br /><br /><a href="/?module=ViewContestDetails&ct=1007">details</a>
                        </div>
                    </td>
                    <td class="value" style="vertical-align: top;">
                        <div style="margin:10px;">
                            <h3>British Telecom Business</h3>
                                - <strong>Submission Start Date:</strong> April 10, 2007
                                <br />- <strong>Submission End Date:</strong> April 23, 2007
                                <br />- <strong>Review Start Date:</strong> April 27, 2007
                                <br />- <strong>Review End Date:</strong> May 15, 2007
                                <br />- <strong>Winner:</strong> <a href="/?module=Static&d1=assembly&d2=pastContests">View the results!</a>
                            <br /><br /><a href="/?module=Static&d1=assembly&d2=btBusinessDetails">details</a>
                        </div>
                        <div style="margin:10px;">
                            <h3>Microsoft Session Manifest Tool</h3>
                                - <strong>Submission Start Date:</strong> May 22, 2007
                                <br />- <strong>Submission End Date:</strong> June 8, 2007
                                <br />- <strong>Review Start Date:</strong> June 8, 2007
                                <br />- <strong>Review End Date:</strong> June 18, 2007
                                <br />- <strong>Winner:</strong> <a href="/?module=Static&d1=assembly&d2=pastContests">View the results!</a>
                            <br /><br /><a href="/?module=Static&d1=assembly&d2=msSessionManifestDetails ">details</a>
                        </div>
                       <div style="margin:10px;">
                            <h3>British Telecom Wireless Cities</h3>
                                - <strong>Submission Start Date:</strong> August 17, 2007
                                <br />- <strong>Submission End Date:</strong> August 31, 2007
                                <br />- <strong>Review Start Date:</strong> August 31, 2007
                                <br />- <strong>Review End Date:</strong> September 17, 2007
                                <br />- <strong>Winner:</strong> September 18
                            <br /><br /><a href="/?module=Static&d1=assembly&d2=btWiCitiesDetails">details</a>
                        </div>
             </td>
                </tr>
            </tbody>
            </table>



            <p><strong>Other competitions will be added to the schedule soon, so check back often!</strong></p>


        </div>

        <jsp:include page="foot.jsp"/>
    </div>
</div>

</body>
</html>