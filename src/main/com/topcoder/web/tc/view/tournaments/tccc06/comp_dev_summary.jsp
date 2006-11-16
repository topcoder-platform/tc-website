<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="component"/>
<jsp:param name="tabLev2" value="development"/>
<jsp:param name="tabLev3" value="summary"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
<span class="bigTitle">Component Development Finals Summary</span>
<br><br>

<%--
<div style="float: right;">
<p align="center"><span class="bodyText" align="center"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=photos">See more photos!</a></span></p>
<img src="/i/tournament/tccc06/onsitePhotos/shot_development.jpg" alt="" class="photoFrameBig" /><br>
</div>
--%>

by <strong>the Development Review Board</strong><br />
<em>TopCoder Members</em>
<br /><br>

<strong>Thursday, November 16, 2006</strong><br />
<strong>Round 2: XMI Reader</strong><br> 
by <tc-webtag:handle coderId="20076717" context="development"/>
<br /><br />
TopCoder is building its own UML tool that -- like Poseidon -- is based on <a href="http://en.wikipedia.org/wiki/XMI" target="_blank">XMI standards</a>. The XMIReader component is used to read and parse XMI files. This component only reads the file and parses it as a standard XML file, while providing a framework for handling each element type. To reduce the memory usage, the component uses SAX instead of DOM.
<br /><br />
Compared with the other UML components, this one is much easier. It registers handlers for element types and uses them to parse the corresponding XMI elements. However, the handlers are not in the scope of this component, there are only two classes to implement and the logic is straightforward, so it should be relatively easy. 
<br /><br />
One note, though: Of the two versions, the .NET version includes one potential trap. The .NET version of the component must process an empty element as if it were the end of an element. If not, the component will encounter an infinite loop. To ensure that this works, the developers should test their submissions against a real XMI file (like the one in the docs directory). 
<br /><br />

<strong>Wednesday, November 15, 2006</strong><br />
<strong>Round 1: Rename Package Ant Task / Rename Namespace NAnt Task</strong><br>
by <tc-webtag:handle coderId="297731" context="development"/>
<br /><br />
The Rename package Ant task and Rename namespace NAnt task components were about building functionality to enable source code to be modified automatically while still remaining consistent with the original intent. 
<br /><br />
Their design called for the utilization of regular expressions; this presented a challenge to the developers as they tried to improve upon the specified algorithms. Additionally, concurrency issues in the file manipulation operations contributed to making the development a non-trivial affair.
<br /><br />
Interesting testing scenarios were used by the developers as they tried to bridge the packages being extended (Ant / NAnt) and the code they wrote.
<br /><br />
As usual, the performance of the end product was an important consideration and the approach used by some of the developers added to their submissions having an edge over the others.
<br /><br />

        </div>
      </td>
        
         
<!-- Right Column-->
        <td width="170" align="right">
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />

</body>

</html>
