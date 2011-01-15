<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Charity Challenge</title>

<jsp:include page="../script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="crpf"/>
</jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="review_board"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="charity_tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br />

<!--CRPF Header-->
               <table align="center">
                  <tr>
                     <td>
                     <A href="/tc?module=CRPFStatic&d1=crpf&d2=crpf_photos"><img src="/i/events/crpf03/crfp_banner.jpg" width="510" height="160" border="0" alt="TopCoder Charity Challenge benefiting the CRPF;T"></A><br/>
                     <img src="/i/clear.gif" width="10" height="15" border="0"/></td>
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

               <p class="terciary">
                <a href="/tc?amp;module=CRPFStatic&amp;d1=crpf&amp;d2=crpf_photos">Photos</a>&nbsp;&nbsp;|&nbsp;&nbsp;Details
            </p>

                <blockquote>

                <div align="center"><font size="3"><strong>Win a trip to <em>A Magical Evening,</em> the annual star-studded gala ball<br/>
                benefiting the Christopher Reeve Paralysis Foundation!</strong></font></div>

                <p><img src="/i/tournament/crpf03/crpf_magical_evening_toast.jpg" alt="Last year's Magical Evening toast" width="332" height="265" border="0" align="right">
                Last year's <em>Magical Birthday Bash</em> was the largest fundraising event for the CRPF. Hosted by Kim Cattrall, with a special performance
                by Robin Williams, the <em>Birthday Bash</em> celebrated the birthdays of Christopher Reeve and his friends Barbara Walters, Michael Douglas,
                Catherine Zeta-Jones, and Ron Meyer. <a href="http://www.christopherreeve.org/News/News.cfm?ID=368&c=30" target="_blank">See more pictures</a> of last year's event.</p>

                <div align="center"><A href="/tc?module=CRPFStatic&d1=crpf&d2=crpf_donate" target="_top"><img src="/i/events/crpf03/button_donate_now.gif" alt="Donate Now" width="159" height="49" border="0"></A></div><br />

                <p><strong>Coding for a cause</strong><br/>
                TopCoder is always looking for ways to give something back to the community. Help us raise money for the Christopher Reeve Paralysis
                Foundation by putting your coding skills to the test. Get your friends, relatives and co-workers to donate money on your behalf. Donate
                by credit card on the <A href="http://www.crpf.org/contribute/contribute.cfm?orgid=TopCoderWebsite2003" target="_blank">CRPF site,</A>
                or download our <A href="/i/tournament/crpf03/donation_form.pdf" target="_blank">donation form</A> to pay by check. Then compete in
                the online tournament on November 11th, 13th, and 17th. All competitors who raise at least $50 will receive a commemorative TopCoder
                Charity Challenge t-shirt. You could also be one of ten lucky winners to mingle with the stars at <em>A Magical Evening!</em></p>

                <p><strong>Experience the <em>Magic</em></strong><br/>
                This year's star-studded gala ball will be held at the Marriott Marquis in New York City on November 24th.
                Tickets to this event are valued at $1000 each! There are several ways to win the grand prize:</p>

                <ul>
                    <li>Be one of the four top scorers in the final round ($25 minimum donation)</li>
                    <li>Be one of the four top fundraisers ($500 minimum donation)</li>
                    <li>Be one of the two randomly-chosen members ($100 minimum donation)</li>
                </ul>

                <p><strong>Serious money to solve a serious problem</strong><br />
                TopCoder will match every dollar our members raise up to $50,000!</p>

                <p>Please read the <A href="/tc?module=Static&d1=crpf&d2=crpf_rules_overview" target="_top">Rules</A> to get all the details about this exciting new event.</p>

               </blockquote>

            <p><br /></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <img src="/i/clear.gif" width="170" height="1" border="0"><br/>
            <jsp:include page="crpf_right.jsp" />
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
