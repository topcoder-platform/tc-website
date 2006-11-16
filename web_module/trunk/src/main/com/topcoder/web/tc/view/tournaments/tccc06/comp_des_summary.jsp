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
<jsp:param name="tabLev2" value="design"/>
<jsp:param name="tabLev3" value="summary"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
<span class="bigTitle">Component Design Finals Summary</span>
<br><br>

            
<%--
<div style="float: right;">
<p align="center"><span class="bodyText" align="center"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=photos">See more photos!</a></span></p>
<img src="/i/tournament/tccc06/onsitePhotos/shot_design.jpg" alt="" class="photoFrameBig" /><br>
</div>
--%>

by <strong>the Design Review Board</strong><br />
<em>TopCoder Members</em><br />
Wednesday, November 15, 2006
<br /><br />
<b>Round 1: AutoComplete Text Box</b>
by <tc-webtag:handle coderId="10348862" context="design"/>
<br /><br />
The AutoComplete TextBox component provides a HTML text box tag, which, with the help of JavaScript, will automatically display a list of auto complete options that can be selected by the user. The JavaScript code must communicate with a Servlet using AJAX and, preferably, JSON for the messages’ format. The component must provide a concrete implementation of the Servlet, using a database. Performance is also a requirement, as the auto complete options must be shown in real time.
<br /><br />
Isolated, each task mentioned above is simple. However, the toughest part is to make them work properly together, as there are many languages and technologies used and each aspect that is changed in one layer can affect the other layers. The main goal for this version is to make it work properly and efficiently, as there could be many enhancements: better look and feel for the auto complete popup, different formats for the messages displayed, caching, and different persistent storage for the server side Servlet.
<br /><br />
It was nice to find in the submissions the arrow-keys enabled for use with the AutoComplete popup. Another nice aspect would be caching, which can be made on the server side, on the client side, or -- even better -- both sides. There are, however, situations when caching on the server side might not be that useful (when the options are influenced by the context data), but in general it is a nice feature.

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
