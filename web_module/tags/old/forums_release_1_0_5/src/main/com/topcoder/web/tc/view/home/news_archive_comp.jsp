<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder News Archive</title>

<jsp:include page="../script.jsp" />

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
            <jsp:param name="level1" value=""/>
            <jsp:param name="level2" value=""/>
         </jsp:include>
      </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="myTCBody">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="news_archive"/>
            <jsp:param name="title" value="Component Competitions"/>
        </jsp:include>

<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr class="bodyText"><td nowrap="nowrap">08.26.05 3:00 PM - </td><td width="100%">Software Royalties updated in Member Profiles</td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.17.05 8:00 PM - </td><td width="100%">New Statistics: Component Contest Details</td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.12.05 3:50 PM - </td><td width="100%"><A href="http://software.topcoder.com/index.jsp">software.topcoder.com</A> will be down for maintenance on 7/18</td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.27.05 5:45 PM - </td><td width="100%"><A href="/tc?module=Static&d1=dev&d2=support&d3=desReviewSample">New Sample Design Review Scorecard now available</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.23.05 11:20 AM - </td><td width="100%"><A href="/i/development/downloads/topcoder_global.build">Global NAnt properties file now available</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.17.05 11:55 AM - </td><td width="100%"><A href="http://software.topcoder.com/catalog/c_component.jsp?comp=14836181">oldbig scores a perfect 100 in a Component Development Contest</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.06.05 1:05 PM - </td><td width="100%"><A href="/rtables/viewThread.jsp?forum=205768&thread=495791&mc=1">Reviewer minimum requirements updated</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.29.05 3:25 PM - </td><td width="100%">TCS to post Design and Development projects on Wednesdays</td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.30.05 11:15 AM - </td><td width="100%"><A href="http://software.topcoder.com/index.jsp">"Top 10 Most Downloaded Components" added to TCS homepage</A></td></tr>
</table>

        </div>
        <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
