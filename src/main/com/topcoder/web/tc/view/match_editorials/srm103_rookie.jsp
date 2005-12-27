
<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="match_editorials"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div style="float: right;" align="right"><A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="505520" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 103</span><br>Wednesday, July 10, 2002
<br><br>


<span class="bigTitle">Rookie Review</span>


<P>
SRM 103 has only 30 new members: (
<B>dragonrider</B>, 
<B>debaser</B>, 
<B>theboredguy</B>, 
<B>michimaro</B>, 
<B>hmsimha</B>, 
<B>gettext</B>, 
<B>ermol</B>, 
<B>dpletcha</B>, 
<B>cuyan</B>, 
<B>malcom</B>, 
<B>ns1001</B>, 
<B>mpach</B>, 
<B>jcardena</B>, 
<B>CagedRat</B>, 
<B>thermant</B>, 
<B>mvs57</B>, 
<B>etard</B>, 
<B>masseyis</B>,  
<B>Sandgrain</B>, 
<B>weck</B>, 
<B>Ssmoimo</B>, 
<B>foa</B>, 
<B>j-dub</B>, 
<B>taxi</B>, 
<B>Lint</B>, 
<B>HadesDev</B>, 
<B>Mr. Sketch</B>, 
<B>thebeings</B>, 
<B>!nSt!gator</B>, 
<B>udcp</B>). 
</P>

<P>
<B>Mr. Sketch</B> scored an impressive 1323.46 points by solving all Div-II problems and winning his room. His score was number 4 overall in Division-II. This score gave <B>Mr. Sketch</B> 1622 rating points, yellow color and placed him in Division-I.
</P>

<P>
Besides <B>Mr. Sketch</B> two other rookie coders managed to get into Division-I on their first try: <B>foa</B> (2 problems 919.01 points) and <B>HadesDev</B> (1 problem 727.13 points)
</P>

<P>
There were 25 rookie coders who have submitted any problem but only 12 of them end up with positive points in SRM103:
</P>

<P>
<B>Mr. Sketch</B> - 1323.46<BR/>
<B>foa</B> - 919.01<BR/>
<B>HadesDev</B> - 727.13<BR/>
<B>taxi</B> - 446.7<BR/>
<B>weck</B> - 365.19<BR/>
<B>malcom</B> - 342.28<BR/>
<B>CagedRat</B> - 326.61<BR/>
<B>debaser</B> - 274.1<BR/>
<B>udcp</B> - 171.65<BR/>
<B>jcardena</B> - 127.27<BR/>
<B>michimaro</B> - 116.8<BR/>
<B>hmsimha</B> - 100<BR/>
</P>


<p>
<img src="/i/m/slavik_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="160082" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
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

