<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Collegiate Challenge - Computer Programming Tournament - Overview</title>

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
   <jsp:param name="tabLev2" value="details"/>
   <jsp:param name="tabLev3" value=""/>
</jsp:include>

            <h2>The 2004 TopCoder Collegiate Challenge</h2>

            <p><span class="bodySubtitle">What is the TCCC?</span><br/>
            TopCoder is bringing the frontline of competitive programming to a campus near you. Over the next couple months, The 2004 TopCoder Collegiate Challenge will have college students all over the world competing for a chance to go to the onsite finals in Boston, MA this April.  Students have their choice of playing field, either the Algorithm Competition or the Component Design and Development Competition, or both should you be that skilled.  The stage is set and the competition is fierce.  Let the games begin.
            </p>
            
            <p><span class="bodySubtitle">What's new?</span><br/>
            For starters, this tournament is bigger than ever.  24 Algorithm finalists and 8 Component finalists will be invited to compete live at the onsite finals in Boston.  There may be more finalists now, but only three of them will be crowned champion.  Will you be part of the elite?
            <br/><br/>
            The TCCC04 marks the first TopCoder tournament to have coaches.  Coaches will provide competitors in the Design Competition with technical guidance and support during the contest.  Not in college, but love to design components?  Be a coach.  Got the skills to design, but need a little guidance in the tournament?  <A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_comp_coachesreq">Request</a> a coach.
            </p>
            
            
            <p><span class="bodySubtitle">The details:</span><br/>

            <ul>
                <li><strong>Elimination Starts</strong><br />
                    January 2004 - Component<br />
                    February 2004 - Algorithm<br /></li>
                <li><strong>Onsite Finals</strong><br />
                    April 2004 in Boston, MA</li>
                <li><strong>Free Competition</strong></li>
                <li><strong>Open to all college students</strong></li>
            </ul>

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
