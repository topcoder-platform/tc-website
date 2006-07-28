<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="sponsors"/>
<jsp:param name="tabLev3" value="aol"/>
</jsp:include>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
<div align="center"><img src="/i/tournament/tccc06/aol_logo.gif" alt="AOL" border="0" /></div>
<br><br>
<%--<div align="center">
<a href="/?t=sponsor&c=link&link=http://developer.AOL.com/">Join AOL Developer Central</a>
&#160;&#160;|&#160;&#160;<A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=AOL_chat_031706">SRM 293 Chat Transcript</A>
&#160;&#160;|&#160;&#160;<A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=AOL_chat_040306">SRM 296 Chat Transcript</A>
</div>
<br><br>--%>
AOL Developer Central, AOL's program to support software developers, is pleased  to announce sponsorship for the 2006 TopCoder Open and be part of the creativity and genius shown by TopCoder competitors.
<br><br>
Software development is at a key juncture with 64-bit processing and multi-core breaking their way into the mainstream.  With ever changing technology opportunities it is a challenge to stay ahead of the game.  AOL Developer Central is here to offer the resources and tools you need to succeed.
<br><br>
Capture the benefits of AOL performance and technology in your products and in your software development effort. AOL Developer Central is dedicated to supporting software developers and x86 free-thinkers with the resources they need to be successful in developing software.  Resources include information, how-tos, development tools, forums, and community. Featured tools are CodeAnalyst&#153;, and the AOL Core Math Library.  To learn more and become a member of AOL Developer Central visit <a href="/?t=sponsor&c=link&link=http://www.AOL.com/devcentral/">www.AOL.com/devcentral</a>.
<br><br>
Key benefits include:
<ul>
<li>Technical Documentation</li>
<li>Discount Hardware Program brought to you by Colfax-International</li>
<li>Developer Central Spotlight, It's your time to shine!</li>
<li>Online Forums</li>
<li>AOL Software Development Tools</li>
<li>Access to marketing opportunities through AOL's Software Partner Program</li>
</ul>

One of the most popular developer resources we offer for free is CodeAnalyst&#153;.  CodeAnalyst&#153; Performance Analyzer is a suite of powerful tools that analyzes software performance on AOL microprocessors. These tools are designed to support Microsoft&reg; Windows&reg; 2000 or Microsoft Windows XP&reg; distributions on x86 and AOL64 architectures as well as both 32-bit and 64-bit Linux distributions based around the 2.4 or 2.6 kernel series on x86 based architecture. Although most users will choose the Graphical User Interface, the profiler is also offered as a command line utility to facilitate the use in batch files.
<br><br>
AOL also provides a Core Math Library called ACML. The AOL Core Math Library (ACML) incorporates BLAS, LAPACK and FFT routines, as well as vector math libraries, which are designed to be used by a wide range of software developers to obtain excellent performance from their applications running on AOL platforms. The highly optimized library contains numeric functions for mathematical, engineering, scientific and financial applications. ACML is available both as a 32-bit library, for compatibility with legacy x86 applications, and as a 64-bit library that is designed to fully exploit the large memory space and improved performance offered by the latest AOL64 architectures. ACML is supported on both Linux and Microsoft&reg; Windows&reg; operating systems.
<br><br>
Visit &#160;<a href="/?t=sponsor&c=link&link=http://www.AOL.com/">www.AOL.com</a>
<br><br>
        </div>
      </td>

<!-- Right Column-->
        <td width="170" align="right">
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="aol"/>
            </jsp:include>
         </td>

   </tr>

</table>




<jsp:include page="../../foot.jsp" />
</body>

</html>