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
<STYLE TYPE="text/css">
.smallHandle
{
font-size: 10px;
}
</STYLE>
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

<span class="bigTitle">Member Blogs</span>
<br><br>

<table cellpadding="2" cellspacing="0" width="500" class="bodyText">
   <tr>
      <td align="center">
      <img src="/i/m/omgrace_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="21518515" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=omgrace_10">"What a week it was!"</span></A><br>
      [May 5 - 10:00 PM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/omgrace_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="21518515" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=omgrace_9">"And the winners are..."</span></A><br>
      [May 5 - 9:00 PM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/Kawigi_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="8416646" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=Kawigi_9">"Petr takes the lead"</span></A><br>
      [May 5 - 9:00 PM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/dplass_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="251184" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=dplass_13">"Final results for all the 'Finals,' finally!"</span></A><br>
      [May 5 - 9:00 PM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/davidyang_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="21471147" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=davidyang_7">"Down to the wire"</span></A><br>
      [May 5 - 7:00 PM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/dplass_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="251184" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=dplass_12">"AJAX, my boy, AJAX."</span></A><br>
      [May 5 - 7:00 PM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/omgrace_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="21518515" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=omgrace_8">"Hearts, Stars, and Fanny Packs"</span></A><br>
      [May 5 - 6:00 PM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/Kawigi_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="8416646" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=Kawigi_7">"Solved mysteries (and another opportunity to embarrass SnapDragon)"</span></A><br>
      [May 5 - 4:30 PM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/Kawigi_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="8416646" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=Kawigi_8">"Expensive water and free beer"</span></A><br>
      [May 5 - 4:00 PM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/omgrace_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="21518515" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=omgrace_7">"A night of fun and games"</span></A><br>
      [May 5 - 4:00 PM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/dplass_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="251184" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=dplass_11">"ResultSetAssociatedDataAndColumnAddedDecoratedCollection. Nuff said."</span></A><br>
      [May 5 - 3:30 PM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/davidyang_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="21471147" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=davidyang_6">"Highlights from the UBS Presentation"</span></A><br>
      [May 5 - 3:00 PM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/Kawigi_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="8416646" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=Kawigi_6">"Who's that?"</span></A><br>
      [May 5 - 2:00 PM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/Kawigi_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="8416646" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=Kawigi_5">"The WildCard <em>seemed</em> easy... at first"</span></A><br>
      [May 5 - 2:00 AM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/dplass_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="251184" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=dplass_10">"Customer Round Table"</span></A><br>
      [May 5 - 2:00 AM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/davidyang_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="21471147" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=davidyang_5">"Ready, FIGHT!"</span></A><br>
      [May 4 - 9:40 PM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/omgrace_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="21518515" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=omgrace_6">"An afternoon excursion..."</span></A><br>
      [May 4 - 9:35 PM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/davidyang_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="21471147" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=davidyang_4">"Poker whizzes and polymaths"</span></A><br>
      [May 4 - 9:35 PM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/dplass_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="251184" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=dplass_9">"CDDC 2 - What the reviewers saw"</span></A><br>
      [May 4 - 7:25 PM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/dplass_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="251184" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=dplass_8">"Secondhand Shopping: Efficient Component Reuse"</span></A><br>
      [May 4 - 3:20 PM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/dplass_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="251184" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=dplass_7">"Still in 'Gee-whiz' phase"</span></A><br>
      [May 4 - 3:15 PM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/dplass_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="251184" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=dplass_6">"Art imitates life"</span></A><br>
      [May 4 - 3:15 PM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/omgrace_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="21518515" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=omgrace_5">"Everyone’s a winner here"</span></A><br>
      [May 4 - 3:15 PM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/Kawigi_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="8416646" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=Kawigi_4">"Kawigi's writing an editor.  What else is new?"</span></A><br>
      [May 4 - 3:10 PM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/omgrace_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="21518515" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=omgrace_4">"The End of Day 1"</span></A><br>
      [May 4 - 2:00 AM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/davidyang_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="21471147" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=davidyang_3">"davidyang.blog(Math.Floor(Action));"</span></A><br>
      [May 3 - 10:30 PM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/Kawigi_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="8416646" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=Kawigi_3">"I'm blogging this."</span></A><br>
      [May 3 - 10:00 PM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/dplass_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="251184" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=dplass_5">"Components in the 'Real World'"</span></A><br>
      [May 3 - 9:50 PM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/omgrace_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="21518515" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=omgrace_3">"Nothing in this world has prepared you for this"</span></A><br>
      [May 3 - 7:50 PM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/dplass_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="251184" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=dplass_4">"Finally, dplass talks about Design and Development"</span></A><br>
      [May 3 - 7:30 PM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/davidyang_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="21471147" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=davidyang_2">"Your mission, if you choose to accept it"</span></A><br>
      [May 3 - 5:40 PM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/dplass_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="251184" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=dplass_3">"The one where dplass takes a walk"</span></A><br>
      [May 3 - 3:30 PM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/Kawigi_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="8416646" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=Kawigi_2">"Algrorithm Semifinal 1: Dropping like flies"</span></A><br>
      [May 3 - 2:40 PM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/omgrace_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="21518515" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=omgrace_2">"Exploring the Strip"</span></A><br>
      [May 3 - 2:20 PM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/dplass_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="251184" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=dplass_2">"Episode II: Attack of the... oh, never mind"</span></A><br>
      [May 3 - 1:55 PM]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/omgrace_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="21518515" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=omgrace_1">"From Champaign to Vegas"</span></A><br>
      [May 2]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/davidyang_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="21471147" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=davidyang_1">"TopCoder's May Madness"</span></A><br>
      [May 2]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/Kawigi_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="8416646" darkBG="true" /></span>
      </td>
      <td><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=Kawigi_1">"This morning was like Christmas"</span></A><br>
      [May 2]</td>
   </tr>
   <tr>
      <td align="center">
      <img src="/i/m/dplass_big.jpg" alt="" width="27" height="30" border="0" hspace="6" vspace="1" class="myStatsPhoto"/><br />
      <span class="smallHandle"><tc-webtag:handle coderId="251184" darkBG="true" /></span>
      </td>
      <td width="100%"><span class="bodySubtitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=dplass_1">"Episode I: The Phantom Menace"</span></A><br>
      [May 2]</td>
   </tr>
</table>

<br><br>
        </div>
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
