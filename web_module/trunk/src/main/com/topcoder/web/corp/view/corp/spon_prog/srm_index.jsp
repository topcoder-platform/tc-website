<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet"
         %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Sponsor a TopCoder Single Round Match</title>

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
                <jsp:param name="level1" value="srm"/>
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
                        
                        <h2 class="corpHead">Single Round Matches</h2>

                        <p>Single Round Matches (SRMs) are the key component for TopCoder's membership. Each week a match is hosted and 
                        coders take part in an online competition that will either build up or bring down their rating. The outcome of this rating 
                        change is the potential change in seeding for the next scheduled tournament. Ultimately, a match becomes the developer's 
                        equivalent of a major league sporting event where a "win or loss" affects standings &#40;in this case ratings&#41; 
                        and a possible playoff seed.</p>
                    
                        <p><span class="bodySubtitle">An Integrated Approach</span><br>
                        TopCoder reaches members through three distinct media. Each of the media venues is a unique opportunity for a 
                        sponsor to present its support of the event and promote brand awareness amongst the demographic. In 
                        addition to the individual media, a survey question &#40;to members&#41; is made exclusive to a sponsor.</p>
                    
                        <p><span class="bodySubtitle"><a href="?module=Static&d1=corp&d2=spon_prog&d3=srm_web">TopCoder Web Site</a></span><br>
                        The TopCoder web site is the primary vehicle for the competitions. In addition to providing the content, statistics, and features 
                        applicable to a match, the Web site is the primary point of entry for any match.</p>
                            
                        <p><span class="bodySubtitle"><a href="?module=Static&d1=corp&d2=spon_prog&d3=srm_applet">Arena Applet</a></span><br>
                        The Arena Applet is where all of the excitement takes place. <strong>Competitors spend an average 2.5 hours online</strong> 
                        before, during and after a match! During the three phases (Coding, Challenge, and System Test) coders go 
                        head-to-head vying for points, ratings, and ultimately the cash prize.</p>
                            
                        <p><span class="bodySubtitle"><a href="?module=Static&d1=corp&d2=spon_prog&d3=srm_email">Opt-In Email</a></span><br>
                        Approximately 70&#37; of the membership opts-in for match notification. The email program is designed to inform 
                        members of the match sponsors, their key points, and the appropriate URL references.</p>
                        
                        <p><div align="center"><img src="/i/corp/srm_time.gif" alt="" width="396" height="108" border="0"/></div></p>
                        
                        <p>&#42;TopCoder does not guarantee the number of impressions per Single Round Match</p>
                        
                        <p><br/></p>
                    </td>

<!-- Gutter -->
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column begins -->
                    <jsp:include page="../../right.jsp">
                        <jsp:param name="level1" value="srm"/>
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
