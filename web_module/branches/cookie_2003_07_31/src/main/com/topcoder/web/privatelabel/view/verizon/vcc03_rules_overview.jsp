<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder | Private Label Registration</title>

<jsp:include page="../script.jsp" />

</head>

<body>

<!-- TCO Header -->
<a name="top_page"></a>
<!--
            <object 
            type="application/x-shockwave-flash"
            data="/i/tournament/vcc03/vcc03_still.swf"
            width="100%"
            height="125"
            border="0">           
            <param name="movie" value="/i/tournament/vcc03/vcc03_still.swf" />
            <param name="quality" value="high" />
            <param name="salign" value="t">
            </object>
-->
        <img src="/i/tournament/vcc03/vcc03.jpg" width="750" height="120" border="0"/>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1"></td>
<!-- Gutter Ends -->

<!-- Left Column Begins-->
         <td>
         <p><img src="/i/clear.gif" width="180" height="10" border="0"/><br />
         <img src="/i/tournament/vcc03/vcc03_right.gif" width="180" height="400" border="0"/><br />
         <img src="/i/clear.gif" width="180" height="40" border="0"/>
         </p>
         </td>         
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->  
        <td class="bodyText" width="100%">

<!-- Tab bar links-->
<jsp:include page="verizonLinks.jsp" >
   <jsp:param name="selectedTab" value="rules"/>
</jsp:include>
<!-- Tab bar sub links-->
<jsp:include page="verizonSublinks.jsp" >
   <jsp:param name="selectedList" value="rules"/>
   <jsp:param name="selectedTab" value="overview"/>
</jsp:include>

            <blockquote>
            <h2>Official Rules and Regulations</h2>
            
            <h3><font color="#CC0000">No purchase necessary to enter or win</font></h3>

            <p>The 2003 Verizon Coding Challenge is being offered by Verizon Communications ("Verizon") and TopCoder, Inc. ("TopCoder").  Verizon is 
            using the results of the Coding Challenge to identify possible employees for their Chennai VDSI center.  The Coding Challenge will take place between 
            Monday, August 4 and Friday, August 29, 2003.  It begins with a 2-week online registration, after which up to 500 eligible individuals will be 
            invited to compete in the programming tournament.  The tournament consists of two (2) online elimination rounds and one (1) onsite final round.  
            All participants who compete in Round #1 will receive a Verizon Coding Challenge t-shirt.  In addition, Verizon will award $1,900 USD in cash prizes 
            to the top 4 finalists in the tournament.</p>
            </blockquote>

            <p><br/></p>
            
        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
<!-- Right Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

    </tr>
</table>

<!-- Footer Begins -->
<jsp:include page="verizon_foot.jsp" />
<!-- Footer Ends -->

</body>
</html>

