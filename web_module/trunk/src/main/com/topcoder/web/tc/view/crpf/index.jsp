<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Charity Challenge</title>

<jsp:include page="../script.jsp" />

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="review_board"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="events"/>
                <jsp:param name="level2" value="charity"/> 
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins --> 
         <td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br>
               <jsp:include page="../body_top.jsp" >
                  <jsp:param name="image" value="events"/>  
                  <jsp:param name="image1" value="white"/>  
                  <jsp:param name="title" value="TopCoder Charity Challenge"/>  
               </jsp:include>

<!--CRPF Header-->
               <table align="center">
                  <tr>
                     <td><img src="/i/tournament/crpf03/crpf_banner.gif" width="505" height="152" border="0"  vspace="15"/></td>
                  </tr>
               </table>
               
               <blockquote>
               <table>
               <tr>
               <td class="bodyText" width="100%">
               <p>TopCoder is excited to announce the first ever TopCoder Charity
               Challenge.  The Charity Challenge will benefit the Christopher Reeve
               Paralysis Foundation ("CRPF").  This tournament is an unprecedented
               collaboration of fund raising and competition, one we think our
               members will enjoy.</p>

               <p><b>So how will it work?</b></p>
               <p>TopCoder members will be sponsored by friends, family, and colleagues who 
               make donations to CRPF through the members' involvement in this tournament.  
               All donations go to CRPF, and TopCoder will match all the
               donations up to $50,000!  Members must raise a minimum of $25 to
               compete.  A total of 10 members will win the grand prize - an expenses
               paid trip to attend <i>A Magical Evening</i>, the annual star-studded gala
               ball benefiting CRPF, held in New York City.</p>

               <p><b>How do you win?</b><p>
               <p>Be one of the:
               <ul>
	         <li>4 highest scorers in Round 3</li>
	         <li>4 highest fund-raisers (minimum donations raised of $500)</li>
	         <li>2 lucky members who are chosen randomly.  Members will receive 
	         1 entry for every $100 raised (minimum of 1 entry to be included in the
               drawing)</li>
               </ul>
               </p>

               <p><A href="/tc?&module=Static&d1=crpf&d2=crpf_overview">Click here</A> for more information on the tournament, how to donate, and
               who the top fund raisers are.
               </p>
               </td>
               <td valign="top" align="right" width="208"><img src="/i/tournament/crpf03/indexlinks.gif" width="208" height="240" border="0" usemap="#indexlinks">
               <map name="indexlinks">
               <area shape="rect" coords="113,4,201,38" href="/tc?module=Static&d1=crpf&d2=crpf_donate" />
               <area shape="rect" coords="60,57,201,100" href="/tc?module=Static&d1=crpf&d2=crpf_overview" />
               <area shape="rect" coords="32,124,202,167" href="/tc?&module=CRPFReport" />
               <area shape="rect" coords="2,188,198,235" href= "/reg/index.jsp" />
               </map>
            </td>                       
               </tr>
               </table>

               </blockquote>
            
            <p><br /></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="crfp_right.jsp" />
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
