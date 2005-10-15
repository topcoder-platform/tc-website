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
<jsp:param name="tabLev2" value="development"/>
<jsp:param name="tabLev3" value="summary"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
   <tr valign=top>
      <td valign=top align=center>
      <div class="bodySpacer">
            
<span class="bigTitle">Component Development Finals Summary</span>
<br><br>
<div class="leadPhoto">
<span class="bodyText" align="center"><p align="center"><a href="/tc?module=Static&d1=tournaments&d2=tco05&d3=photos">See more photos!</a></p></span>
<img src="/i/tournament/tco05/onsite_photos/shot_design.jpg" alt="" class="photoFrameBig" /><br/>
</div>
<img src="/i/m/FogleBird_mug.gif" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/>
<p>by <tc-webtag:handle coderId="160049" context="algorithm"/><br/>
<em>TopCoder Staff</em><br />
Friday, October 14, 2005<br/>
<br><br>
The 2005 TopCoder Open started with the component competition finals on Wednesday morning.  While the algorithm competitors were enjoying a long game of poker in the Game Room, the component competitors were hard at work on the stage.  Unlike the short algorithm competitions that start and finish within a couple hours, the component competition kept the finalists hard at work for seven grueling hours, with a short 30-minute lunch break.
<br><br>
The component competition was split into two categories: design and development.  The development portion this year was based around the File Statistics component.  The finalists were required to tweak their existing deliverables to support one of three proposed enhancements that extend the functionality of the component.
<br><br>
The File Statistics component scans one or more files, performs some analysis on the file data, and generates a report that documents the calculated statistics.  An example usage of this component would be to scan a set of source files and generate a report documenting the number of lines of code in each file.  The component can be executed as a command-line tool or driven programmatically through a public API.  The three enhancement options for this component were the following:
<ul>
<li>Support for non-numeric statistics: enabling the component to calculate statistics such as letter frequencies and most frequently occurring word.  This was likely the most difficult enhancement, and as a result most competitors chose one of the other two.</li>
<li>Support for zip file expansion: enabling the component to "drill-down" into zip files to scan each entry individually rather than treating the archive as a single binary file.</li>
<li>Support for pluggable command-line arguments: since most portions of the component are pluggable, this enhancement provides a simple way for the plug-ins to specify what custom command-line arguments they accept.  Validation of arguments is automated so that the plug-in code is kept clean.</li>
</ul>
After the finalists completed their work, the members on the review board were responsible for examining and evaluating the submissions.  Score cards were used to evaluate various metrics for each submission.  The next morning, each finalist was allowed to browse over the score cards and submit any appeals where they felt the scoring was unfair.  The results for the competition were finalized only after all of these appeals were acknowledged and appropriately handled.
<br><br>
Congratulations to <tc-webtag:handle coderId="299979" context="development"/> for winning the 2005 TopCoder Open Component Development Competition! 
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
