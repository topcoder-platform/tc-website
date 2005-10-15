<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="component"/>
<jsp:param name="tabLev2" value="design"/>
<jsp:param name="tabLev3" value="summary"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
   <tr valign=top>
      <td valign=top align=center>
      <div class="bodySpacer">
            
<span class="bigTitle">Component Design Finals Summary</span>
<br><br>
<div class="leadPhoto">
<span class="bodyText" align="center"><p align="center"><a href="/tc?module=Static&d1=tournaments&d2=tco05&d3=photos">See more photos!</a></p></span>
<img src="/i/tournament/tco05/onsite_photos/shot_design.jpg" alt="" class="photoFrameBig" /><br/>
</div>
<img src="/i/m/ivern_mug.gif" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/>
<p>by <tc-webtag:handle coderId="156859" context="algorithm"/><br/>
<em>TopCoder Staff</em><br />
Friday, October 14, 2005<br/>
<br/><br/>
The 2005 TopCoder Open started with the component competition finals on Wednesday morning.  While the algorithm competitors were enjoying a long game of poker in the Game Room, the component competitors were hard at work on the stage.  Unlike the short algorithm competitions that start and finish within a couple hours, the component competition kept the finalists hard at work for seven grueling hours, with a short 30-minute lunch break.
<br><br>
The component competition was split into two categories: design and development.  The design competition this year was based around the Distributed Protocol Factory component and the development competition was based around the File Statistics component.  Both of these categories required the finalists to tweak their existing deliverables to support one of three proposed enhancements that extend the functionality of each component.
<br><br>
The Distributed Protocol Factory component used in the design portion of the competition allows an application to send messages with guaranteed delivery over a distributed network. The three enhancement options for this component were the following:
<ul>
<li>Support for pluggable compression strategies to compress the data going over the network.</li>
<li>Support for bridging separate node groups into a more complex network.</li>
<li>Support for authentication to allow the nodes to verify that messages come from an approved peer.</li>
</ul>
After the finalists completed their work, the members on the review board were responsible for examining and evaluating the submissions.
<br><br>
Once the review scorecards were completed, the finalists were given an opportunity to review and appeal the decisions of the review board.  Only after those appeals were answered did the scores become final.
<br><br>
Congratulations to <tc-webtag:handle coderId="293874" context="design"/> for winning the 2005 TopCoder Open Component Design Competition!
        </div>
      </td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../public_right.jsp">
            <jsp:param name="level1" value="tco05"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />

</body>

</html>
