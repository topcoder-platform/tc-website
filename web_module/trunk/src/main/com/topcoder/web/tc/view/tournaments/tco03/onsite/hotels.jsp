<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2003 TopCoder Open sponsored by Intel&#174;  - Computer Programming Tournament - Rules</title>

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
   <jsp:param name="selectedTab" value="hotels"/>
</jsp:include>

            <h2>Hotels Near Mohegan Sun</h2>
            
            <p><strong>Hotel at Mohegan Sun</strong><br/>
            There is a 34-story luxury hotel at Mohegan Sun. You can make a <a href="http://www.mohegansun.com/hotel_spa/hotel_reservations.jsp" target="_blank">reservation</a> 
            on the Mohegan Sun web site.</p>
            
            <p>Several other hotels are located only a short drive away from Mohegan Sun. We have included a representative sampling for your convenience:</p>
            
            <p><strong>Microtel Uncasville-Montville</strong><br/>
            1954 Norwich-New London Turnpike (Rte. 32)<br/>
            Uncasville, CT 06382<br/>
            860.367-0880<br/>
            <a href="http://www.microtelinn.com/reservations/locationdetail.asp?facid=577" target="_blank">www.microtelinn.com</a></p>

            <p><strong>Courtyard Norwich</strong><br/>
            181 West Town Street<br/>
            Norwich, CT 06360<br/>
            860.886.2600<br/>
            <a href="http://marriott.com/dpp/PropertyPage.asp?MarshaCode=GONCY&EPCEC=InProcess&EPNAVCEC=InProcess" target="_blank">www.marriott.com</a></p>

            <p><strong>Comfort Suites Norwich</strong><br/>
            275 Otrobando Avenue<br/>
            Norwich, CT 06360<br/>
            860.892.9292<br/>
            <a href="http://www1.choicehotels.com/ires/en-US/html/HotelInfo?sid=g7wR.2bANHJdyxi.1&hotel=CT006" target="_blank">www.comfortsuites.com</a></p>

            <p><strong>Hilton Mystic</strong><br/>
            20 Coogan Blvd.<br/>
            Mystic, CT 06355<br/>
            860.572.0731<br/>
            <a href="http://www.hilton.com/en/hi/hotels/index.jhtml;jsessionid=HKTRRGY13YHNUCSGBIWMVCQKIYFC5UUC?ctyhocn=MYSMHHF" target="_blank">www.hilton.com</a></p>

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
