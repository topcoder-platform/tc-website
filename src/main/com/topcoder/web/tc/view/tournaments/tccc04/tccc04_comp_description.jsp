<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Collegiate Challenge - Computer Programming Tournament - Description</title>

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
   <jsp:param name="tabLev1" value="component"/>
   <jsp:param name="tabLev2" value="details"/>
   <jsp:param name="tabLev3" value="description"/>
</jsp:include> 

            <h2>Description of the Component Competition</h2>

            <p>
            The 2004 Collegiate Challenge is bigger and better than ever! 8 Component finalists will be invited to compete live at the onsite finals in Boston.
            <br/><br/>
            The 2004 TCCC marks the first TopCoder tournament to have coaches.  Coaches will provide competitors in the Component Design Competition with technical guidance and support during the contest.  Not in college, but love to design components?  Sign up to <a href="mailto:service@topcoder.com">be a coach</a>.  Looking for a little guidance in the tournament?  <A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_comp_coachesreq">Request a coach</a>.
            </p>
            <ul>
                <li><strong>Competition Starts</strong><br />
                    January 27, 2004<br />
                <li><strong>Onsite Finals</strong><br />
                    April 15 & 16, 2004 at the Boston Park Plaza Hotel & Towers in Boston, MA, USA</li>
                <li><strong>Free Competition</strong></li>
                <li><strong>Open to all eligible college students</strong></li>
            </ul>
            
            <p>See the official rules and regulations for more details.</p>

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
