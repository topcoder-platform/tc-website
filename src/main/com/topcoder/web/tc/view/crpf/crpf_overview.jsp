<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Charity Challenge</title>

<jsp:include page="../script.jsp" />

<SCRIPT type="text/javascript">
if ( window.navigator.userAgent.indexOf("Linux")>-1 ) {
  // Linux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/style_linux.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/coders_linux.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/crpfStyle_linux.css"/>');
} else {
  // NonLinux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/style.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/coders.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/crpfStyle.css"/>');
}
</SCRIPT>

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
                     <td><A href="/tc?&module=Static&d1=crpf&d2=index"><img src="/i/tournament/crpf03/crpf_banner.gif" width="505" height="152" border="0"  vspace="15"/></A></td>
                  </tr>
               </table>

               
<!-- Tab bar links-->
<jsp:include page="crpfLinks.jsp" >
   <jsp:param name="selectedTab" value="overview"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="crpfSublinks.jsp" >
   <jsp:param name="selectedList" value=""/> 
   <jsp:param name="selectedTab" value=""/>
</jsp:include>

               <blockquote>
               
                <h2>Overview of the Tournament</h2>
            
               <p><img src="/i/tournament/crpf03/crpf_magical_evening_toast.jpg" alt="Last year's Magical Evening toast" width="332" height="265" border="0" align="right">
               <font size="3"><strong>Win a trip to <em>A Magical Evening,</em> the annual star-studded gala ball benefiting the Christopher Reeve Paralysis Foundation!</strong></font><br>
                Last year's <em>Magical Birthday Bash</em> was the largest fundraising event for the CRPF. Hosted by Kim Cattrall, with a special performance 
                by Robin Williams, the <em>Birthday Bash</em> celebrated the birthdays of Christopher Reeve and his friends Barbara Walters, Michael Douglas, 
                Catherine Zeta-Jones, and Ron Meyer. <a href="http://www.christopherreeve.org/News/News.cfm?ID=368&c=30" target="_blank">See more pictures</a> of last year's event.</p>
               
                <ul>
                    <li><strong>Dates: </strong><br>
                    - Online Rounds on November 11th, 13th, and 17th</li>
                    <li><strong>Qualification: </strong><br>
                    - Must be 18 years of age or older<br>
                    - Must raise a minimum of $25 USD for CRPF</li>
                    <li><strong>Prizes:</strong><br>
                    - T-shirt for all members who raise $50 USD or more<br>
                    - 10 Grand Prize winners<br>
                        <strong>Grand Prize:</strong> A trip to <em>A Magical Evening</em>, the annual star studded gala ball benefiting 
                        CRPF.  The ball will be held at the Marriott Marquis in New York City on November 24th.  Tickets to this event are valued at 
                        $1,000 USD each. <br>
                        The grand prize will be awarded to:<br>
                    - The four top scorers in the final round <br>
                    - The four members who raise the most money for CRPF ($500 minimum donation)<br>
                    - Two lucky members who will be randomly chosen ($100 minimum donation).</li>
                    <li><strong>Philanthropy: </strong><br />
                     TopCoder will match every dollar raised, up to $50,000 USD</li>
                </ul>
               
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
