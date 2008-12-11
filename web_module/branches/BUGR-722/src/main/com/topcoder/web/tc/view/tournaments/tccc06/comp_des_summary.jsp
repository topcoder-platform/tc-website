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
            
<div style="float: right;">
<p align="center"><span class="bodyText" align="center"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=photos">See more photos!</a></span></p>
<img src="/i/tournament/tccc06/onsitePhotos/shotDesign.jpg" alt="" class="photoFrameBig" /><br>
</div>

<span class="bigTitle">nicka81 is the new Component Design Champion</span>
<br><br>

            
by <strong>the Design Review Board</strong><br>
<em>TopCoder Members</em>
<br><br>

After three days of on-site finals, <tc-webtag:handle coderId="293874" context="design"/> emerged as the winner of the 2006 TopCoder Collegiate Challenge Component Design competition, taking home the top prize of $25,000. <tc-webtag:handle coderId="10425804" context="design"/> scored well enough for second place, and <tc-webtag:handle coderId="275640" context="design"/> took third. Congratulations to all the finalists, and especially <tc-webtag:handle coderId="293874" context="design"/>!
<br><br>

<strong>Friday, November 17, 2006</strong><br>
<strong>Round 3: Configuration API</strong><br>
by <tc-webtag:handle coderId="10348862" context="design"/>
<br><br>
The Configuration API component is an attempt to change the current configuration paradigm used in the Configuration Manager component, which has proven to be hard to use in applications with dozens of components involved. The new configuration paradigm organizes the configurations for the components used in an application in a nested tree structure according to the dependencies between components. The application itself will be configured in the root configuration object and the components used directly as children configuration objects nested inside the root. The dependencies of those components are stored in a similar manner using nesting.
<br><br>
From a design point of view it was a rather easy component because it was essentially a tree data structure. The simplest solution would involve a tree structure where each node would represent a configuration object. Each configuration object would also have a key to values mapping for the properties. However, there was a requirement to support access to nested information using paths formed by wildcards and nested children keys, which made it more difficult for the designers.
<br><br>
The best submissions implemented the data structure cleanly, and followed the structure suggested by the requirements. The wildcard support made use of regular expressions. Some submissions did a very good job in integrating the paths and wildcards into the API by supporting them wherever a normal property key was supported, thus allowing useful capabilities such as bulk operations on many descendants at the same time.
<br><br>

<strong>Thursday, November 16, 2006</strong><br>
<strong>Round 2: Logger</strong><br>
by <tc-webtag:handle coderId="286907" context="design"/>
<br><br>
Logger is a high performance logging framework that provides the TopCoder parallel to libraries such as log4j or log4net.  The competitors are expected to implement a set of requirements and also keep issues such as thread safety and efficiency in mind.  The initial features include a class registration mechanism and multi-level filtering strategy.
<br><br>
Being a huge undertaking in itself, with all aspects to be evaluated, it also tends to make competitors aim high because logging is so common and everyone just sees too much of the great libraries. It’s usually a harder task for a designer to pick what to do than how to do it.  I think for this very first rollout of the component the focus should be put on usability and extensibility, as those things are not likely to improve once fixed.
<br><br>
Many of the designs do not lack for features, but several went for extra functionality before the basics were properly pulled together. One or two of the submissions that I particularly liked provided a clean API and pieced things together -- as well as adding some features that naturally arose from design decisions -- rather than simply adding new methods and requiring developers to do extra work.
<br><br>

<strong>Wednesday, November 15, 2006</strong><br>
<strong>Round 1: AutoComplete Text Box</strong><br>
by <tc-webtag:handle coderId="10348862" context="design"/>
<br><br>
The AutoComplete TextBox component provides a HTML text box tag, which, with the help of JavaScript, will automatically display a list of auto complete options that can be selected by the user. The JavaScript code must communicate with a Servlet using AJAX and, preferably, JSON for the messages’ format. The component must provide a concrete implementation of the Servlet, using a database. Performance is also a requirement, as the auto complete options must be shown in real time.
<br><br>
Isolated, each task mentioned above is simple. However, the toughest part is to make them work properly together, as there are many languages and technologies used and each aspect that is changed in one layer can affect the other layers. The main goal for this version is to make it work properly and efficiently, as there could be many enhancements: better look and feel for the auto complete popup, different formats for the messages displayed, caching, and different persistent storage for the server side Servlet.
<br><br>
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
