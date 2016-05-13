<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO06style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="../links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="onsite_events"/>
<jsp:param name="tabLev3" value="blogs"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
   <tr valign=top>
      <td valign=top align=center>
      <div class="bodySpacer">

<div style="float:right;">
<tc-webtag:forumLink forumID="505975" message="discuss this" />
</div>

<%-- anchor link from bloggers page --%>
<a name="001"></a>
<span class="bigTitle">Highlights from the UBS Presentation</span><br>
05.05.06 3:00 PM
<br><br>
<img src="/i/m/davidyang_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="21471147" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
UBS is a new sponsor of the TopCoder Open. and perhaps many of you might be thinking -- as I was -- “Why would an investment bank invest in a programming competition?”  What was most amazing to me during the UBS presentation is just how much advanced computer science work is happening there.  According to the presenter (a technologist with many accomplishments including having software running on the <a target=”_blank” href=”/?t=sponsor&c=link&link= http://nmp.nasa.gov/ds1/“>Deep Space One</a> probe), “Nothing matches Wall Street for complexity required in terms of technology.”
<br><br>
The technical challenges faced by UBS mostly revolve around the sheer volume of critical transactions that occur any given day.  For example, a trade request might come into UBS, go through an algorithm for determining whether or not UBS would like to execute this trade, and have a response sent -- all within microseconds.  Traders also need to have ultra-real-time pricing information updated to their monitors from relational data structures.  Traditional relational databases can’t withstand the information load and often UBS will have to go in and develop customized solutions to solve these kinds of problems.
<br><br>
Another thing I found fascinating about UBS’ presentation is their focus on agile methodologies around development.  Many of us probably think of IT in financial institutions as large-scale enterprises but UBS presenters really emphasized their “Google-like” approach to project team sizes, project scopes and allowing developers to run with ideas quickly.  This flexibility allows them to react to changing business environments with new code releases as often as multiple times a day (I wonder what kind of penalty they get for code resubmission?)
<br><br>
Ken Vogel (a former TopCoder) was also on hand to answer questions about being a TopCoder at UBS.
<br><br>
        </div>
      </td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="/foot.jsp" />

</body>

</html>
