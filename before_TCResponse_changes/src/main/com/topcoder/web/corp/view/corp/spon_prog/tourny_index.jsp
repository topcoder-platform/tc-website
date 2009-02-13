<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet"
         %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Sponsor a TopCoder Computer Programming Tournament</title>

<jsp:include page="../includes/css.jsp" />

<script language="JavaScript" type="text/javascript" src="/js/script.js"></script>

</head>

<body>

<!-- Top begins -->
<jsp:include page="../includes/top.jsp" >
    <jsp:param name="level1" value="sponsorship"/>
</jsp:include>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170">
            <jsp:include page="../includes/left.jsp">
                <jsp:param name="level1" value="tourny"/>
                <jsp:param name="level2" value="index"/> 
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
        <td valign="top" width="7"><img src="/i/corp/title_brackets.gif" width="7" height="47" alt="[ ]" border="0"></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top"><td id="corpTitle" width="100%" colspan="3"><img src="/i/corp/header_event_sponsorship.gif" alt="" width="546" height="41" border="0"></td></tr>
                
                <tr valign="top">
                    <td class="bodyText" width="99%">
                        <img src="/i/corp/clear.gif" width="1" height="10" alt="" border="0"><br>
                        
                        <h2 class="corpHead">Tournaments</h2>

                        <p>Annually, TopCoder conducts two major tournaments. These two events draw both competitors and spectators over a 
                        two-month period and culminate with the championship and a $50,000 grand prize.</p>

                        <p><strong>The next tournament is the TopCoder Open (TCO). Online qualification rounds start October 7. Onsite rounds will be 
                        held on December 4-5, 2003 at Mohegan Sun Casino in Uncasville, CT.</strong></p>

                        <p>The TCO tournament rounds are comprised of:

                        <ul>
                            <li>Two (2) Qualification Rounds - conducted online</li>
                            <li>Four (4) Elimination Rounds - conducted online</li>
                            <li>Semifinal Round - conducted onsite</li>
                            <li>Championship Round - conducted onsite</li>
                        </ul>

                        <p>The TCO sponsorship program includes the following components:

                        <p><span class="bodySubtitle"><a href="?module=Static&d1=corp&d2=spon_prog&d3=tourny_web">TopCoder Web Site</a></span><br>
                        TopCoder's Home Page is the most frequented place by our members and visitors.  It highlights all of our recent features, 
                        news, events, and sponsors. Members visit often to view updated statistics, editorial reviews and match write-ups. We 
                        receive over 625,000 hits from over 55,000 unique visitors every month.  This is where our members and visitors 
                        start to assimilate information and begin any sign-in or registration to become members.</p>

                        <p><span class="bodySubtitle"><a href="?module=Static&d1=corp&d2=spon_prog&d3=tourny_applet">Arena Applet</a></span><br>
                        The TopCoder Arena Applet is the most critical element in the sponsorship program.  This is where the attention of our 
                        members is captured for an average of over 2-1/2 hours during the weekly competitions.  In the applet are lobbies where 
                        our members converse with each other before and after the competition.  During the competition, virtual rooms are where 
                        our members code, compile, and test their submissions. There is also a Challenge Round to allow competitors the 
                        opportunity to view and try to break each other's code.  Sponsors have the ability to interact directly with a qualified 
                        demographic before, during and after the competitions. </p>

                        <p><span class="bodySubtitle"><a href="?module=Static&d1=corp&d2=spon_prog&d3=tourny_email">Opt-in Email</a></span><br>
                        Over 70% of both professional and student TopCoder members choose to receive emails regarding upcoming matches, 
                        match results, tournament events, etc.  Using the various email communications, our sponsors are provided the 
                        opportunity to direct market to a qualified demographic.  This is an important element in our sponsors' marketing 
                        campaigns, but is just one of the many components in TopCoder's integrated tournament sponsorship program.</p>

                        <p><span class="bodySubtitle"><a href="?module=Static&d1=corp&d2=spon_prog&d3=tourny_onsite">Onsite Branding</a></span><br>
                        Onsite branding is another valuable element in our integrated sponsorship program.  TopCoder sponsors are given the 
                        opportunity to directly reach some of best programmers in the world.  The onsite tournament provides a platform for 
                        sponsors to conduct technical sessions, speaking opportunities, video promotions, and personally communicate with a 
                        highly sought-after developer demographic.  This opportunity is the key-branding component that many marketing 
                        executives desire in their awareness campaigns.</p>

                        <p><span class="bodySubtitle"><a href="?module=Static&d1=corp&d2=spon_prog&d3=tourny_pr">Public Relations</a></span><br>
                        Many companies rely on new product releases, "client win" announcements, and general company news in order to 
                        secure positive press.  TopCoder has enjoyed significant press coverage in mainstream media due to the human-interest 
                        aspect of our tournaments.  Our major tournaments have created stories in national syndicates like CNN, Computerworld, 
                        The Boston Globe, and The San Jose Mercury News. By sponsoring TopCoder, you will receive the recognition of being a 
                        supporter of the event and the positive publicity generated by these stories.  TopCoder strives to create follow-on media 
                        interviews for our premier sponsors. </p>

                        <p><span class="bodySubtitle"><a href="?module=Static&d1=corp&d2=spon_prog&d3=tourny_review">Post-Tournament Review</a></span><br>
                        Most marketing professionals use metrics to decide the success of their campaign.  TopCoder provides the marketing 
                        professional with a complete wrap-up of their sponsorship.  We provide detailed demographics of our members who 
                        received any marketing/branding of your event.  We also provide a complete summary of PR activity, press coverage, 
                        feedback from onsite members, and the opportunity for follow-up campaigns.  No print or TV campaign can provide 
                        this kind of invaluable marketing opportunity.</p>

                        <p><strong>TopCoder Open Sponsorship Programs tailored to individual clients range from $5,000 to $50,000.</strong></p>

                        <p>TopCoder extends across all professional and collegiate levels and is the only venue that draws thousands of software professionals 
                        together for hours at a time to write software and investigate technology.</p>

                        <p>For more information on sponsoring the TCO, please contact Paul Moriarty at
                        <A HREF="mailto:sponsor@topcoder.com" CLASS="bodyText">sponsor@topcoder.com</A> or 860-633-5540.</p>
                        
                        <p><br/></p>
                    </td>

<!-- Gutter -->
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column begins -->
                    <jsp:include page="../../right.jsp">
                        <jsp:param name="level1" value="tourny"/>
                        <jsp:param name="level2" value="index"/> 
                    </jsp:include>
<!-- Right Column ends -->

                </tr>
            </table>
        </td>
<!-- Center Column ends -->
    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="../../foot.jsp"/>
<!-- Footer ends -->

</body>
</html>
