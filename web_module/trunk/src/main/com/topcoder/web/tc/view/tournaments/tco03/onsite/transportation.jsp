<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2003 TopCoder Open sponsored by Intel&#174;  - Transportation to Onsite Finals</title>

<jsp:include page="../../../script.jsp" />

</head>

<body onLoad="timer(1);">

<jsp:include page="../../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../../includes/global_left.jsp">
                <jsp:param name="level1" value="events"/>
                <jsp:param name="level2" value="tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" WIDTH="100%">

<jsp:include page="../tco03Head.jsp" />

<!-- Tab bar links-->
<jsp:include page="../tco03Links.jsp" >
   <jsp:param name="selectedContest" value="coding"/>
   <jsp:param name="selectedTab" value="coding_onsite"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="../tco03Sublinks.jsp" >
   <jsp:param name="selectedList" value="onsite"/>
   <jsp:param name="selectedTab" value="transportation"/>
</jsp:include>

            <h2>Transportation to Mohegan Sun</h2>
            
            <p><strong>By Car</strong><br/>
            View the <a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=onsite&d4=directions">driving directions</a></p>
            
            <p><strong>By Plane</strong><br/>
            Go to the <a href="http://www.bradleyairport.com/" target="_blank">Bradley International Airport</a> in Windsor Locks (Hartford), CT</p>
            
            <p><strong>By Bus</strong><br/>
            View the Mohegan Sun <a href="http://www.mohegansun.com/common_content/transit_schedule.jsp" target="_blank">Bus Schedule</a></p>

            <p><strong>By Rail</strong><br/>
            Go to the <a href="http://www.amtrak.com/" target="_blank">Amtrak</a> web site (to get to Mystic, CT)<br/>
            Go to the <a href="http://as0.mta.info/mnr/schedules/sched_form.cfm" target="_blank">MetroNorth</a> web site (to get to New Haven, CT)</p>

            <p><strong>By Ferry</strong> (from Long Island)<br/>
            View the Mohegan Sun <a href="http://www.mohegansun.com/plan_visit/orient_ferry_schedule.htm" target="_blank">Ferry Schedule</a></p>
            
            <p>See more <a href="http://www.mohegansun.com/plan_visit/faq_transportation.jsp" target="_blank">transportation info</a> on the Mohegan Sun web site.</p>

         <p><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../../foot.jsp" />

</body>

</html>
