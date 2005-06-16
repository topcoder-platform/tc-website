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
                <jsp:param name="level2" value="pr"/> 
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
                        
                        <h2 class="corpHead">Tournaments - Public Relations</h2>

                        <p>Public relations is a key component of all tournament marketing. TopCoder has received a significant amount 
                        of media coverage surrounding each of the tournaments held to date.  In addition to numerous press releases, media 
                        from around the country, including television stations, have run editorials on TopCoder, the membership, 
                        semifinalists and champions, and the business model in general.

                        <p>See our complete list of press releases and articles to date. 

                        <p>The success of a tournament affects not only sponsors, but also TopCoder. Media coverage of a tournament is a 
                        critical component and one that continues to be built upon and revisited for every tournament to ensure awareness, 
                        understanding, impact, and entertainment.</p>

                        <p>However, given the obvious desire for success on the sponsors' part, it is as much a responsibility of the 
                        sponsors to promote a tournament as it is TopCoder's. Promoting sponsorship of a tournament through established 
                        communications such as internal email newsletters and company websites demonstrate both support for the 
                        developer community and an interest in the success of the tournament.</p>

                        <p>TopCoder's growth and marketing is largely based on word of mouth. This is based on the fact that every week 
                        20% of Students and 15% of Professional members indicate "Member Referral" as how they learned of TopCoder.</p>

                        <p>The following media programs are conducted with all tournament marketing:</p>

                        <p><span class="bodySubtitle">Campus Posters</span><br>
                        TopCoder maintains a presence at over 400 schools nationwide. Posters are displayed in multiple places on campus 
                        and are placed by either a postering company or by a Student Representative</p>
                        
                        <p><span class="bodySubtitle">Video News Release</span><br>
                        In past tournaments, footage from the tournament semifinals and finals was run in 6 different markets, TopCoder 
                        continues with this in an effort to build recognition for members and sponsors</p>
                        
                        <p><span class="bodySubtitle">Campus Newspaper</span><br>
                        In the weeks before tournament elimination rounds begin, ads are run at 50 schools across the country</p>
                        
                        <p><span class="bodySubtitle">Local Efforts</span><br>
                        We research the geographic for the most relevant venues to promote the tournament</p>
                        
                        <p><span class="bodySubtitle">Public Relations</span><br>
                        Outreach for every tournament begins immediately following the signing of sponsors.</p>
                                                
                        <p><a href="?module=Static&d1=corp&d2=spon_prog&d3=srm_index">What is the SRM Program?</a></p>

                        <p><br/></p>
                    </td>

<!-- Gutter Begins -->
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column begins -->
                    <jsp:include page="../../right.jsp">
                        <jsp:param name="level1" value="tourny"/>
                        <jsp:param name="level2" value="pr"/> 
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
