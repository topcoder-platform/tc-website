<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO06style.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="sponsors"/>
<jsp:param name="tabLev3" value="amd"/>
</jsp:include>


<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
   <tr valign=top>
      <td valign=top align=center>
      <div class="bodySpacer">
            
<div align="center"><img src="/i/tournament/tco06/amd_logo.gif" alt="AMD" border="0" /></div>
<br><br>
<a href="/?t=sponsor&c=link&link=http://developer.amd.com/">Join AMD Developer Central</a>
<br><br>
AMD Developer Central, AMD's growing developer program, is proud to sponsor the 2006 TopCoder Open and be part of the amazing creativity and genius shown by the participants.
<br><br>
Software development is in the midst of a key juncture in time with 64-bit processing and multi-core breaking their way into the mainstream.  In this ever changing technology it's a challenge to stay ahead of the game.  AMD Developer Central is here to offer the resources and tools you need to succeed.  
<br><br>
Key benefits include:
<ul>
<li>Technical Documentation</li>
<li>Discount Hardware Program</li>
<li>Developer ToyBox</li>
<li>Developer Central Spotlight</li>
<li>Online Forums</li>
<li>AMD Software Development Tools</li>
<li>Access to marketing opportunities through AMD's Software Partner Program</li>
</ul>

One of the most popular developer resources we offer for free is CodeAnalyst&#153;.  CodeAnalyst&#153; Performance Analyzer is a suite of powerful tools that analyzes software performance on AMD microprocessors. These tools are designed to support Microsoft&reg; Windows&reg; 2000 or Microsoft Windows XP&reg; distributions on x86 and AMD64 architectures as well as both 32-bit and 64-bit Linux distributions based around the 2.4 or 2.6 kernel series on x86 based architecture. Although most users will choose the Graphical User Interface, the profiler is also offered as a command line utility to facilitate the use in batch files.
<br><br>
AMD also provides a Core Math Library called ACML.  The AMD Core Math Library (ACML) incorporates BLAS, LAPACK and FFT routines, as well as vector math libraries, which are designed to be used by a wide range of software developers to obtain excellent performance from their applications running on AMD platforms. The highly optimized library contains numeric functions for mathematical, engineering, scientific and financial applications. ACML is available both as a 32-bit library, for compatibility with legacy x86 applications, and as a 64-bit library that is designed to fully exploit the large memory space and improved performance offered by the latest AMD64 architectures. ACML is supported on both Linux and Microsoft&reg; Windows&reg; operating systems.
<br><br>
Learn more about optimization, 64-bit porting & Multi-Core on AMD Developer Central: <a href="/?t=sponsor&c=link&link=http://developer.amd.com/">JOIN NOW!</a>
<br><br>
        </div>
      </td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="amd"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />
</body>

</html>
