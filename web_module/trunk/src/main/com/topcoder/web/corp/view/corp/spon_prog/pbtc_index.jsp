<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet"
         %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder can conduct online and onsite programming competitions using the TopCoder Arena Applet for designated developers</title>

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
                <jsp:param name="level1" value="pbtc"/>
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
                        
                        <h2 class="corpHead">Powered by TopCoder&#8482;</h2>

                        <p>TopCoder can conduct online and onsite programming competitions using the TopCoder Arena Applet for 
                        designated developers (employees, conference attendees, etc.). This service includes the use of the competition 
                        process, problem sets, scoring engine, administration and match reporting.</p>
                        
                        <p><font size="2"><strong>Create Your Own Developer Event</strong></font><br>
                        Managing and conducting a programming competition can be extremely difficult. By the time 
                        a company designs, constructs, and receives legal approval, it will cost you valuable resources and great expense. 
                        TopCoder has created a competition platform that allows companies to conduct developer contests at their 
                        conferences, product events, through their developer portals, and in-house throughout the calendar year as 
                        an incentive, and a way to motivate their developer community. These competitions provide an opportunity 
                        to conduct a competition style programming event that draws programmers together for a consolidated period 
                        of time and capture the interest of the participating developers to gain the recognition from their peers and 
                        management.</p>

                        <p>These competitions also create an opportunity for interaction with developers, identify top developers, 
                        and create tie-ins to today's technologies.  They also represent chances to improve corporate morale, build 
                        excitement within the developer community in a credible manner, and differentiate your company in the 
                        mindset of your developers through this hands-on experience.</p>

                        <p>TopCoder's developer competition platform has captured the attention and  credibility of the developer 
                        community worldwide.</p>
                        
                        <p><br></p>
                    </td>

<!-- Gutter -->
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column begins -->
                    <jsp:include page="../../right.jsp">
                        <jsp:param name="level1" value="pbtc"/>
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
