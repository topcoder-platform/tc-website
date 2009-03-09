<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="features"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="tutorBody">

        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="features"/>
            <jsp:param name="title" value="Archive"/>
        </jsp:include>

         <table width="100%" border="0" cellspacing="0" cellpadding="3">
            <tr valign="top">
               <td class="bodyText"><b>Author</b></td>
               <td class="bodyText"><b>Title</b></td>
               <td class="bodyText"><b>Date</b></td>
            </tr>
            <tr valign="top">
              <td class="bodyText"><tc-webtag:handle coderId="287614" context="algorithm" /> and <tc-webtag:handle coderId="252022" context="algorithm" /></td>
              <td class="bodyText" nowrap=nowrap><a href="tc?module=Static&d1=features&d2=021109">Spotlight Sessions: Component Chat Transcript</a></td>
              <td class="bodyText" nowrap=nowrap>Feb 11, 2009</td>
            </tr>
            <tr valign="top">
              <td class="bodyText"><tc-webtag:handle coderId="20437508" context="algorithm" /></td>
              <td class="bodyText" nowrap=nowrap><a href="tc?module=Static&d1=features&d2=020909">How to Compete Well in Conceptualization and Specification Contests</a></td>
              <td class="bodyText" nowrap=nowrap>Feb 9, 2009</td>
            </tr>
            <tr valign="top">
              <td class="bodyText"><tc-webtag:handle coderId="151743" context="algorithm" /></td>
              <td class="bodyText" nowrap=nowrap><a href="tc?module=Static&d1=features&d2=020509">Spotlight Sessions: Architecture Chat Transcript</a></td>
              <td class="bodyText" nowrap=nowrap>Feb 5, 2009</td>
            </tr>
            <tr valign="top">
              <td class="bodyText"><tc-webtag:handle coderId="7442703" context="algorithm" /></td>
              <td class="bodyText" nowrap=nowrap><a href="tc?module=Static&d1=features&d2=012909">Spotlight Sessions: Specification Chat Transcript</a></td>
              <td class="bodyText" nowrap=nowrap>Jan 29, 2009</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="16096823" /></td>
               <td class="bodyText" nowrap=nowrap><A href="/tc?module=Static&amp;d1=features&amp;d2=061906"><strong>How to prepare for an Assembly Competition</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Jun 19, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="151743" /></td>
               <td class="bodyText" nowrap=nowrap><A href="/tc?module=Static&amp;d1=features&amp;d2=061206"><strong>Creating Use Case and Sequence Diagrams</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Jun 12, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="251074" /></td>
               <td class="bodyText" nowrap=nowrap><A href="/tc?module=Static&amp;d1=features&amp;d2=022006"><strong>GCC Hacks: Abusing C++ Extensions for Fun and Profit</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Feb 20, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="251317" /></td>
               <td class="bodyText" nowrap=nowrap><A href="/tc?module=Static&amp;d1=features&amp;d2=091405"><strong>Competing tomek-style</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Sep 14, 2005</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="7371063" /></td>
               <td class="bodyText" nowrap=nowrap><A href="/tc?module=Static&amp;d1=features&amp;d2=070805"><strong>The Story of Petr Mitrichev - Target in Six Steps</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Jul 8, 2005</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="269886" /></td>
               <td class="bodyText" nowrap=nowrap><A href="/tc?module=Static&amp;d1=features&amp;d2=030205"><strong>Performance and Optimization in the "Real World"</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Mar 2, 2005</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="10407399" /></td>
               <td class="bodyText" nowrap=nowrap><A href="/tc?module=Static&amp;d1=features&amp;d2=120704"><strong>More on Encryption and Security</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Dec 7, 2004</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="10407399" /></td>
               <td class="bodyText" nowrap=nowrap><A href="/tc?module=Static&amp;d1=features&amp;d2=110204"><strong>Encryption Algorithms</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Nov 2, 2004</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="10135324" /></td>
               <td class="bodyText"><A href="/tc?module=Static&amp;d1=features&amp;d2=100404"><strong>Peer 2 Fear: Solutions for developers for designing secure P2P applications</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Oct 4, 2004</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="282560" /></td>
               <td class="bodyText" nowrap=nowrap><A href="/tc?module=Static&amp;d1=features&amp;d2=090104"><strong>On Sentinels</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Sep 1, 2004</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="156859" /></td>
               <td class="bodyText" nowrap=nowrap><A href="/tc?module=Static&amp;d1=features&amp;d2=080304"><strong>Reviewing Software for Fun and Profit</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Aug 3, 2004</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="276230" /></td>
               <td class="bodyText" nowrap=nowrap><A href="/tc?module=Static&amp;d1=features&amp;d2=070704"><strong>Healthy Computing</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Jul 7, 2004</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="251184" /></td>
               <td class="bodyText" nowrap=nowrap><A href="/tc?module=Static&amp;d1=features&amp;d2=060204"><strong>Java for C++ coders, and vice versa</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Jun 2, 2004</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="251184" /></td>
               <td class="bodyText"><A href="/tc?module=Static&amp;d1=features&amp;d2=042904"><strong>All I really need to know about Software Development I learned from TopCoder</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Apr 29, 2004</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="299177" /></td>
               <td class="bodyText" nowrap=nowrap><A href="/tc?module=Static&amp;d1=features&amp;d2=040104"><strong>Dynamic Programming</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Apr 1, 2004</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="290395" /></td>
               <td class="bodyText" nowrap=nowrap><A href="/tc?module=Static&amp;d1=features&amp;d2=030104"><strong>The Educational Component of TopCoding</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Mar 1, 2004</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="119676" /></td>
               <td class="bodyText" nowrap=nowrap><A href="/tc?module=Static&amp;d1=features&amp;d2=021004"><strong>The 5 Most Common Design Mistakes</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Feb 10, 2004</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="251184" /></td>
               <td class="bodyText" nowrap=nowrap><A href="/tc?module=Static&amp;d1=features&amp;d2=011404"><strong>An Enterprise Java Overview</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Jan 14, 2004</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="273434" /></td>
               <td class="bodyText" nowrap=nowrap><A href="/tc?module=Static&amp;d1=features&amp;d2=122203"><strong>Not Round, Not a Table</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Dec 22, 2003</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="299709" /></td>
               <td class="bodyText" nowrap=nowrap><A href="/tc?module=Static&amp;d1=features&amp;d2=102403"><strong>Challenging 101</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Oct 24, 2003</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="271144" /></td>
               <td class="bodyText" nowrap=nowrap><A href="/tc?module=Static&amp;d1=features&amp;d2=091703"><strong>A Crash Course in the Java Collections Framework</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Sep 17, 2003</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="269554" /></td>
               <td class="bodyText" nowrap=nowrap><A href="/tc?module=Static&amp;d1=features&amp;d2=082803"><strong>A Crash Course in the C++ STL</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Aug 28, 2003</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="119676" /></td>
               <td class="bodyText" nowrap=nowrap><A href="/tc?module=Static&amp;d1=features&amp;d2=072903"><strong>The TopCoder Design Contest #2</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Jul 29, 2003</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="299177" /></td>
               <td class="bodyText" nowrap=nowrap><A href="/tc?module=Static&amp;d1=features&amp;d2=071003"><strong>Immutable Objects</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Jul 10, 2003</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="271917" /></td>
               <td class="bodyText" nowrap=nowrap><A href="/tc?module=Static&amp;d1=features&amp;d2=062603"><strong>Simple Performance Improvement</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Jun 26, 2003</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="273217" /></td>
               <td class="bodyText" nowrap=nowrap><A href="/tc?module=Static&amp;d1=features&amp;d2=052703"><strong>Threads and Atomicity</strong></A></td>
               <td class="bodyText" nowrap=nowrap>May 27, 2003</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="303718" /></td>
               <td class="bodyText" nowrap=nowrap><A href="/tc?module=Static&amp;d1=features&amp;d2=040803"><strong>TopCoder Competitions vs. The Real World</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Apr 8, 2003</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="296145" /></td>
               <td class="bodyText" nowrap=nowrap><A href="/tc?module=Static&amp;d1=features&amp;d2=031703"><strong>Component-Based Development: TopCoder Style</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Mar 17, 2003</td>
            </tr>
            <tr valign="top">
               <td class="bodyText">David Tanacea</td>
               <td class="bodyText"><A href="/tc?module=Static&amp;d1=features&amp;d2=022003"><strong>Component-Based Development: Why Hasn't the Vision Met Reality?</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Feb 20, 2003</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="292607" /></td>
               <td class="bodyText" nowrap=nowrap><A href="/tc?module=Static&amp;d1=features&amp;d2=012203"><strong>Who needs another UI framework?</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Jan 22, 2003</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="277659" /></td>
               <td class="bodyText" nowrap=nowrap><A href="/tc?module=Static&amp;d1=features&amp;d2=010803"><strong>Functional Programming</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Jan 8, 2003</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="264761" /></td>
               <td class="bodyText" nowrap=nowrap><A href="/tc?module=Static&amp;d1=features&amp;d2=122002"><strong>The Big Rerun</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Dec 20, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="264761" /></td>
               <td class="bodyText" nowrap=nowrap><A href="/tc?module=Static&amp;d1=features&amp;d2=120902"><strong>It's Sink or Swim During the Challenge Phase</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Dec 9, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="282560" /></td>
               <td class="bodyText" nowrap=nowrap><A href="/tc?module=Static&amp;d1=features&amp;d2=112002"><strong>The eight seconds of death: Tips on preventing timeout</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Nov 20, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="295939" /></td>
               <td class="bodyText"><A href="/tc?module=Static&amp;d1=features&amp;d2=111302"><strong>King of the Silicon Hill: Today's High-End Microprocessors</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Nov 13, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="150527" /></td>
               <td class="bodyText"><A href="/tc?module=Static&amp;d1=features&amp;d2=100902"><strong>Graphics Programming for Motion Capture</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Oct 9, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="274323" /></td>
               <td class="bodyText"><A href="/tc?module=Static&amp;d1=features&amp;d2=100202"><strong>Finding a Job is a Job</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Oct 2, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="264761" /></td>
               <td class="bodyText"><A href="/tc?module=Static&amp;d1=features&amp;d2=091102"><strong>...A Problem is Born</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Sep 11, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="153650" /></td>
               <td class="bodyText"><A href="/tc?module=Static&amp;d1=features&amp;d2=082102"><strong>Wireless Woes and Winners</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Aug 21, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="264761" /></td>
               <td class="bodyText"><A href="/tc?module=Static&amp;d1=features&amp;d2=080702"><strong>Match Strategy</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Aug 7, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="153650" /></td>
               <td class="bodyText"><A href="/tc?module=Static&amp;d1=features&amp;d2=072402"><strong>Attack of the Moans: Building Applications for Users</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Jul 24, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText">bitbucket43</td>
               <td class="bodyText"><A href="/tc?module=Static&amp;d1=features&amp;d2=071002"><strong>From the Field - Avoid Overloading!</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Jul 10, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="277956" /></td>
               <td class="bodyText"><A href="/tc?module=Static&amp;d1=features&amp;d2=062602"><strong>From the Field</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Jun 26, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="153650" /></td>
               <td class="bodyText"><A href="/tc?module=Static&amp;d1=features&amp;d2=061202"><strong>To in-house or to out-source, that is the question</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Jun 12, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText">TopCoder Staff</td>
               <td class="bodyText"><A href="/tc?module=Static&amp;d1=features&amp;d2=060502"><strong>Where Has The Time Gone?</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Jun 5, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText">TopCoder Staff</td>
               <td class="bodyText"><A href="/tc?module=Static&amp;d1=features&amp;d2=052902"><strong>The Outsiders</strong></A></td>
               <td class="bodyText" nowrap=nowrap>May 29, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="264761"/></td>
               <td class="bodyText"><A href="/tc?module=Static&amp;d1=features&amp;d2=052202"><strong>Obfu-What?</strong></A></td>
               <td class="bodyText" nowrap=nowrap>May 22, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText">TopCoder Staff</td>
               <td class="bodyText"><A href="/tc?module=Static&amp;d1=features&amp;d2=051502"><strong>First Time Phenomenal</strong></A></td>
               <td class="bodyText" nowrap=nowrap>May 15, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText">TopCoder Staff</td>
               <td class="bodyText"><A href="/tc?module=Static&amp;d1=features&amp;d2=050802"><strong>Working Their Way Up</strong></A></td>
               <td class="bodyText" nowrap=nowrap>May 8, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText">TopCoder Staff</td>
               <td class="bodyText"><A href="/tc?module=Static&amp;d1=features&amp;d2=050102"><strong>The Women of TopCoder</strong></A></td>
               <td class="bodyText" nowrap=nowrap>May 1, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText">TopCoder Staff</td>
               <td class="bodyText"><A href="/tc?module=Static&amp;d1=features&amp;d2=042402"><strong>A Matter of Time</strong></A></td>
               <td class="bodyText" nowrap=nowrap>Apr 24, 2002</td>
            </tr>
         </table>
        </div>
        <p><br></p>
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
