<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>

<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="my_topcoder"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="maxWidthBody" align="left">

                <jsp:include page="../page_title.jsp" >
                    <jsp:param name="image" value="my_tc"/>
                    <jsp:param name="title" value="Submit a photo"/>
                </jsp:include>


            <p>
            TopCoder is excited to offer all our members the opportunity to post photos of themselves on our website.  We feel that photos give
            a personal touch to each member's profile as well as an opportunity for other members to see who the rest of the TopCoder
            community is.
            </p>
            <h3>Guidelines for Photo Content</h3>
            <p>
            Our guidelines for publishing member photos are similar to a driver's lices photo.  The photo should display your shoulders and 
            your face.  Please note that TopCoder will not publish inappropriate photos (ie. sticking our your tongue, making faces, etc.).
            <br /><br />
            TopCoder  appreciates your interest in submitting photos for our website but we also reserve the right to not publish a member's 
            submitted photo if it does not fit our requirements.  Photos may be rejected for any of the following reasons:</p>
            <ul class="bodyText">
            <li>unfit resolution or clarity</li>
            <li>contains inappropriate content</li>
            <li>obviously not a recent photo of a member (no aliens,teddy bears, baby photos, etc.)</li>
            <li>copyrighted to another party</li>
            </ul>
            <p>
            Here are two examples of acceptable and unacceptable photos:
            </p>
            <p align="center">
            <img src="/i/mpgood1.jpg" width="86" height="128" border="0">
            <img src="/i/mpgood2.jpg" width="86" height="128" border="0">
            <img src="/i/clear.gif" width="50" height="128" border="0">
            <img src="/i/mpbad1.jpg" width="86" height="128" border="0">
            <img src="/i/mpbad2.jpg" width="86" height="128" border="0">
            </p>
            <p><span class="bodySubtitle">Timeframe for Photo Processing</span></p>
            <p>
            Since the photos are processed manually, it's unpredictable how soon your profile will be updated. On average, they get processed every other week. Please note that these dates may change as a result of holidays or other major TopCoder events.
            </p>            

            </div>
        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
</tbody>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>