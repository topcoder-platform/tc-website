<%@  page language="java"  %>
  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>

<head>

<title>Member Photo Info</title>

<jsp:include page="../script.jsp" />

</head>

<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1"></td>
<!-- Gutter Ends -->

<!-- Center Column Begins --> 
<td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br>
        <jsp:include page="../body_top.jsp" >
           <jsp:param name="image" value="member_photos"/>  
           <jsp:param name="image1" value="white"/>  
        </jsp:include>
<table border="0" cellspacing="0" cellpadding="0" width="100%">
      <tr>
         <td><img src="/i/clear.gif" width="240" height="1" border="0"><br>
            <p class="bodyText">
            TopCoder is excited to offer all our members the opportunity to post photos of themselves on our website.  We feel that photos give
            a personal touch to each member's profile as well as an opportunity for other members to see who the rest of the TopCoder
            community is.
            </p>
            <p><span class="bodySubtitle">Guidelines for Photo Content</span></p>
            <p class="bodyText">
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
            <p class="bodyText">
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
            <p class="bodyText">
            We process photos every Friday, and publish them the following Monday.  You can expect to see your photos on the first Monday 
            following the week you submitted your photo.  Please note that these dates may change as a result of holidays or other major 
            TopCoder events.
            </p>            
         </td>
      </tr>
</table>            
<!-- Center Column Ends -->

<!-- Gutter -->
      <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

</body>

</html>
