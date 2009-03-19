<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>

<head>
    <title>TopCoder :: Submit a Photo</title>
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

            <h3>How to process your photo before sending it</h3>

            <p>
                To keep the look of our member photos consistent, we've prepared a set of guidelines and styles for you to follow.  It's easy and only takes a few minutes:
            </p>

            <ul>
                <li>Download <a href="/i/my_home/backdrop.jpg">backdrop.jpg</a>.</li>
                <li>Cut yourself out of any photo that meets TopCoder's guidelines (see below) and paste it on the backdrop</li>
                <li>Resize and move your picture (but not the backdrop) until it meets the TopCoder standards (centered, includes full head and upper torso)</li>
            </ul>

            <p>
                In the end, your processed photo should look something like this:
            </p>

            <div align="center">
                <img src="/i/my_home/mFinalGood.jpg" alt="" class="myStatsPhoto" />
            </div>

            <p align="center" class="small">
                (except of course your photo will be of you,<br />not this random male model guy)
            </p>
            
            
            <p>
                Photos that look like these will not be accepted:
            </p>
            
            <div align="center">
                <img src="/i/mpbad1.jpg" width="86" alt="" height="128" border="0" />
                <img src="/i/mpbad2.jpg" width="86" alt="" height="128" border="0" />
            </div>
            
            <p align="center" class="small">
                (not acceptable pictures)
            </p>

            <h3>Timeframe for Photo Processing</h3>
            <p>
                Once we receive a batch of processed photos, it takes a little time to screen and activate them.  On average, they get processed every other week. Please note that these dates may change as a result of holidays or other major TopCoder events.
            </p>            

            <h3>Guidelines for Photo Content</h3>

            <p>
            Our guidelines for publishing member photos are similar to a passport photo.  The photo should display your shoulders and 
            your face.  Please note that TopCoder will not publish inappropriate photos (ie. sticking out your tongue, making faces, etc.).
            <br /><br />
            TopCoder  appreciates your interest in submitting photos for our website but we also reserve the right to not publish a member's 
            submitted photo if it does not fit our requirements.  Photos may be rejected for any of the following reasons:</p>
            <ul>
            <li>unfit resolution or clarity - do not manipulate the size of <a href="/i/my_home/backdrop.jpg">backdrop.jpg</a></li>
            <li>black and white photo - only color photos are accepted</li>
            <li>the use of sunglasses or other objects obscuring your face</li>
            <li>contains inappropriate content</li>
            <li>obviously not a recent photo of a member (no aliens, teddy bears, baby photos, etc.)</li>
            <li>copyrighted to another party</li>
            </ul>

            <div align="center" style="margin: 20px;">
                <a href="mailto:memberphotos@topcoder.com?subject=${user.activationCode}%20|%20[%20${user.handle}%20]%20|%20${user.id}%20<c:if test="${user.coder.memberPhoto!=null}">RE</c:if>SUBMIT%20IMAGE:%20PLEASE%20DO%20NOT%20CHANGE%20SUBJECT" class="button" style="width: 120px;">Submit a photo</a>
            </div>

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