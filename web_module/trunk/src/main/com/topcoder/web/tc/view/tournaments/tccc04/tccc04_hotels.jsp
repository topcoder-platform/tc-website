<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Collegiate Challenge - Computer Programming Tournament - Hotels</title>

<jsp:include page="../../script.jsp" />

<link type="text/css" rel="stylesheet" href="/css/TCCC04style.css"/>
    
</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
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

<jsp:include page="tccc04Head.jsp" />

<!-- Tab bar links-->
<jsp:include page="tccc04links.jsp" >
   <jsp:param name="tabLev1" value="overview"/>
   <jsp:param name="tabLev2" value="join_us"/>
   <jsp:param name="tabLev3" value="hotels"/>
</jsp:include>

            <h2>Nearby Hotels</h2>
            
            <p><strong><A href="http://www.bostonparkplaza.com/default.asp?sID=home" target="_blank">The Boston Park Plaza Hotel & Towers</a> </strong><br/>
            Surrounded by Boston's Back Bay neighborhood, this 950-room historic hotel is just one block from the Theater District and the swan boats in the 
            Public Garden and two blocks from upscale Newbury Street shopping. Two nights accomodations at the Boston Park Plaza Hotel & Towers are included in the <A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=spectator_package">TCCC Spectator Package.</A><br/>
            64 Arlington Street - Boston<br/>
            617.426.2000</p>
            
            <p>Several other hotels are located only a short drive away from the Boston Park Plaza Hotel & Towers. We have included a representative sampling for your convenience:</p>
            
            <p><strong><a href="http://www.hilton.com/en/hi/hotels/index.jhtml?ctyhocn=BOSBHHH" target="_blank">Hilton Boston Back Bay</a></strong><br/>
            40 Dalton Street - Boston<br/>
            617.236.1100<br/></p>

            <p><strong><a href="http://www.the.hojo.com/boston00838" target="_blank">Howard Johnson Fenway</a></strong><br/>
            1271 Boylston Street - Boston<br/>
            617.267.8300<br/></p>

            <p><strong><a href="http://www.the.ramada.com/boston13366/hotelhome/" target="_blank">Ramada Hotel Boston</a></strong><br/>
            800 Morrissey Blvd. - Boston<br/>
            617.287.9100<br/></p>

            <p><strong><a href="http://www.starwood.com/sheraton/search/hotel_detail.html?propertyID=430" target="_blank">Sheraton Boston Hotel</a></strong><br/>
            39 Dalton Street<br/>
            617.236.2000<br/></p>
            
            <p>Browse other <a href="http://boston.hotelguide.net/" target="_blank">hotels in Boston.</A></p>

         <p><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
