<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>

<jsp:include page="../script.jsp" />
<jsp:include page="../style.jsp">
    <jsp:param name="key" value="tc_pressroom"/>
</jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<!-- Left Column ends -->

<!-- Center Column begins -->
        <td width="100%" align="center">
            
            <div id="pressContainer">
                <!-- Press Room Banner -->
                <div id="pressRoom">
                    <img src="/i/pressroom/press_banner.png" alt="Press Room Banner" />
                </div>
                
                <div id="pressContainer2">
                    <!-- Navigation Tabs -->
                    <div id="tabHeader">
                        <ul>
                            <li><a href="/tc?module=Static&d1=pressroom&d2=index">Current News</a></li>
                            <li><a href="/tc?module=Static&d1=pressroom&d2=pr_archive">Press Releases Archive</a></li>
                            <li><a href="/tc?module=Static&d1=pressroom&d2=media_resources">Media Resources</a></li>
                            <li id="tabCurrent"><a href="/tc?module=Static&d1=pressroom&d2=media_request_form">Media Request Form</a></li>
                            <li><a href="/tc?module=Static&d1=pressroom&d2=art_archive">Media Articles Archive</a></li>
                        </ul>
                    </div>
                    
                    <!-- Media Request Form -->
                    <div>
                        <table>
                            <tr>
                                <td>Please use the following form to request information from our Public Relations department.</td>
                            </tr>
                            <tr>
                                <td>First Name</td><td>>></td><td> </td>
                            </tr>
                            <tr>
                                <td>Last Name</td><td>>></td><td> </td>
                            </tr>
                            <tr>
                                <td>Email address</td><td>>></td><td> </td>
                            </tr>
                            <tr>
                                <td>Phone number</td><td>>></td><td> </td>
                            </tr>
                            <tr>
                                <td>Phone number</td><td>>></td><td> </td>
                            </tr>
                            <tr>
                                <td>Fax</td><td>>></td><td> </td>
                            </tr>
                            <tr>
                                <td>Type of Media</td><td>>></td><td> </td>
                            </tr>
                            <tr>
                                <td>Media Outlet</td><td>>></td><td> </td>
                            </tr>
                            <tr>
                                <td>Your Title</td><td>>></td><td> </td>
                            </tr>
                            <tr>
                                <td>Are you on assignment?</td><td>>></td><td> </td>
                            </tr>
                            <tr>
                                <td>Comments or Questions:</td><td>>></td><td> </td>
                            </tr>
                            <tr>
                                <td> </td><td> </td><td><a href=""><img src="/i/pressroom/submit_button.png" alt="Submit Button" /></a></td>
                            </tr>
                        </table>
                        <div>
                            <img src="/i/pressroom/year_footer.png" alt="Year footer" />
                            <div>
                                <a href=""><img src="/i/pressroom/top_button.png" alt="Back to Top" /></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </td>
<!-- Center Column ends -->

<!-- Right Column begins -->
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
        </td>
<!-- Right Column ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>