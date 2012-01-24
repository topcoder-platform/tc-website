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
<span class="bigTitle">Ready, FIGHT!</span><br>
05.04.06 9:40 PM
<br><br>
<img src="/i/m/davidyang_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="21471147" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
Here’s a quick summary of the WildCard Room highlights in a graphical format to which I’m sure we’re all accustomed.  Check <tc-webtag:handle coderId="251184" darkBG="true" /> and <tc-webtag:handle coderId="8416646" darkBG="true" />’s blogs for more in-depth information!
<br/><br/>
<tc-webtag:handle coderId="7462740" darkBG="true" /> and <tc-webtag:handle coderId="113178" darkBG="true" /> are head-to-head!! Who to root for?  
<br/><br/>
<div align="center"><img src="/i/tournament/tco06/blogs/davidyang-05-01.jpg" /></div>
<br/><br/>
<tc-webtag:handle coderId="7462740" darkBG="true" /> kicked some major butt in the Challenge round, quickly earning 100 points by knocking down two 500 point problems.  Here’s <tc-webtag:handle coderId="7462740" darkBG="true" /> knocking out <tc-webtag:handle coderId="260835" darkBG="true" />’s 2nd question and possible trifecta.
<br/><br/>
<div align="center"><img src="/i/tournament/tco06/blogs/davidyang-05-02.jpg" /></div>
<br/><br/>
And of course, the coolest part at the end of the Wildcard is that now we know our final eight competitors!
<br/><br/>
<div align="center"><img src="/i/tournament/tco06/blogs/davidyang-05-03.jpg" /></div>
<br/><br/>
Does <tc-webtag:handle coderId="270505" darkBG="true" />’s <a href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=davidyang_4">victory in the Poker tournament</a> last night forebode events in tomorrow’s final?  Only time will tell -- so stay tuned!
<br/><br/>
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
