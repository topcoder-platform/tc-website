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

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="250" ALIGN="right">
    <TR>
        <TD ROWSPAN="5" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
        <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR> 
   <TR><TD COLSPAN="2" BGCOLOR="#999999" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD></TR>
   <TR>
      <TD VALIGN="top" BGCOLOR="#999999" CLASS="moduleTitle">&#160; &#160;</TD>
      <TD BGCOLOR="#999999" VALIGN="top" CLASS="moduleTitle">MATCH EDITORIAL LINKS:</TD>
   </TR>                    
   <TR>
       <TD COLSPAN="4" VALIGN="top" BGCOLOR="#999999">
      <TABLE BORDER="0" WIDTH="100%" CELLSPACING="0" CELLPADDING="2" BGCOLOR="#CCCCCC">
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm91_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm91_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505509" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm91" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm91_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 91</span><br>May 22, 2002
<br /><br />

<span class="bigTitle">Rookie Review</span>

<P>
There was relatively low rookie turnout tonight, resulting in only four rookie 
rooms. 
</P>

<P>At the end of the Coding Phase, the rookie high scorers were: 
<UL>
   <LI><B>Room 64</B></LI> 
<UL>
   <LI>JuanitoBandito - 1046.95</LI> 
   <LI>rumil - 1031.70</LI> 
   <LI>Fuzz - 1024.82</LI>
</UL>
   <LI><B>Room 65</B></LI> 
<UL>
   <LI>lolbrish - 1032.28</LI> 
   <LI>ttilling - 1030.89</LI> 
</UL>
   <LI><B>Room 66</B></LI> 
<UL>
   <LI>jinling - 1068.25</LI> 
   <LI>Partorg - 1049.35</LI>
</UL>
   <LI><B>Room 67</B></LI> 
<UL>
   <LI>StevoD - 1255.72</LI> 
   <LI>manaswini - 1160.82</LI>
</UL>
</UL>
</P>

 
<P>
<B>Challenge Phase</B>
</P>

<P>
In Room 64, <A HREF="/tc?module=MemberProfile&amp;cr=284062" CLASS="bodyGeneric">JuanitoBandito</A>
 had submitted an empty class for the Level 3 problem. 
Within a minute this was found by <A HREF="/tc?module=MemberProfile&amp;cr=106370" CLASS="bodyGeneric">rumil</A>
, who successfully challenged it. <B>JuanitoBandito</B> 
then attempted to challenge <A HREF="/tc?module=MemberProfile&amp;cr=284101" CLASS="bodyGeneric">Fuzz's</A>
 Level 2 submission, but failed, losing an additional 50 
points. <B>Fuzz</B> then retaliated by successfully challenging <B>JuanitoBandito's</B> Level 2 submission.
 <B>JuanitoBandito</B> made the simple mistake of assuming the scores were sorted, thus leading to 
 incorrect output for unsorted inputs. 
</P>

<P>
The only successful challenge in Room 65 was by <A HREF="/tc?module=MemberProfile&amp;cr=282137" CLASS="bodyGeneric">ttilling</A>
, who successfully challenged 
<A HREF="/tc?module=MemberProfile&amp;cr=279388" CLASS="bodyGeneric">limer619's</A>
 Level 1 submission, a solution that was so incorrect that it never could have 
passed the sample test cases. There were also two unsuccessful challenges, one of which 
were by <A HREF="/tc?module=MemberProfile&amp;cr=285601" CLASS="bodyGeneric">lolbrish</A>
, giving <B>ttilling</B> the lead in Room 65. 
</P>

<P>
In Room 66, <A HREF="/tc?module=MemberProfile&amp;cr=285577" CLASS="bodyGeneric">Partorg</A>
 unsuccessfully challenged gmud's Level 2 submission. <B>Partorg's</B> 
Level 3 submission was later annihilated by <A HREF="/tc?module=MemberProfile&amp;cr=285308" CLASS="bodyGeneric">SushiK</A>
 (who I presume is a Neal Stephenson fan). 
</P>

<P>
<A HREF="/tc?module=MemberProfile&amp;cr=285479" CLASS="bodyGeneric">StevoD</A>
 racked up two successful challenges in Room 67, defeating 
 <A HREF="/tc?module=MemberProfile&amp;cr=281252" CLASS="bodyGeneric">dilipdalton</A>
 and <A HREF="/tc?module=MemberProfile&amp;cr=260618" CLASS="bodyGeneric">jake's</A>
Level 3 submissions, both with the same test case. <B>jake's</B> solution exhibited the dubious 
practice of using reference equality for string comparisons in Java (e.g., str == "abc", 
as opposed to the safer and more likely to be correct str.equals("abc")), though I'm not 
certain this was what caused his problem to fail. <B>dilipdalton's</B> solution, on the other 
hand, generated a runtime exception for the same case. 
</P>

<P>
At the end of the Challenge Phase, the scores were: 
<UL>
   <LI><B>Room 64</B></LI>
      <UL>
          <LI>rumil - 1081.70</LI> 
          <LI>Fuzz - 1074.82</LI> 
          <LI>JuanitoBandito - 157.55</LI>
      </UL>
   <LI><B>Room 65</B></LI> 
      <UL>
          <LI>ttilling - 1080.89</LI> 
          <LI>lolbrish - 982.28</LI> 
      </UL>
   <LI><B>Room 66</B></LI> 
      <UL>
          <LI>jinling - 1068.25</LI> 
          <LI>Partorg - 534.13</LI>
      </UL>
   <LI><B>Room 67</B></LI> 
      <UL>
          <LI>manaswini - 1110.82</LI> 
          <LI>StevoD - 765.12</LI>
     </UL>
</UL>
</P>

<P>
<B>System Test Phase</B>
</P>

<P>
Very few rookies came through the system tests unscathed. While <B>Fuzz's</B> Level 3 
submission failed, both of <B>rumil's</B> Level 2 and Level 3 submissions failed as well, 
giving <B>Fuzz</B> a strong lead in Room 64. In Room 65, <B>lolbrish</B> also lost his Level 2 and 
Level 3 submissions. <B>ttilling</B> performed exceptionally well, being one of the two rookies 
to get all three problems correct. The Level 3 submission of 
<A HREF="/tc?module=MemberProfile&amp;cr=285611" CLASS="bodyGeneric">jinling</A>
 failed in Room 66, but 
due to <B>Partorg's</B> lack of success during the challenge phase, <B>jinling</B> was able to hold on to 
a slim lead of 52 points. <A HREF="/tc?module=MemberProfile&amp;cr=277563" CLASS="bodyGeneric">manaswini</A>
 in Room 67 was the only other rookie to get all three problems correct. 
</P>

<P>
The final results showed <B>manaswini</B> and <B>ttilling</B> to have commanding leads over the rest of 
the rookies, with the third highest rookie score being <B>Fuzz's</B> 656.51 points. Despite <B>ttilling's</B> 
successful challenge and <B>manaswini's</B> failed challenge in the Challenge Phase, <B>manaswini</B> still 
earned enough points in the Coding Phase to maintain a very slight 30 point lead over <B>ttilling</B> 
at the end of the contest. 
</P>

<P>
The final scores were: 
<UL>
   <LI><B>Room 64</B></LI> 
       <UL>
          <LI>Fuzz - 656.51</LI> 
          <LI>sgiribabu - 529.97</LI>
       </UL>
   <LI><B>Room 65</B></LI> 
       <UL>
          <LI>ttilling - 1080.89</LI> 
          <LI>lolbrish - 178.36</LI> 
       </UL>
   <LI><B>Room 66</B></LI> 
       <UL>
          <LI>jinling - 586.35</LI> 
          <LI>Partorg - 534.13</LI>
       </UL> 
   <LI><B>Room 67</B></LI> 
       <UL>
          <LI>manaswini - 1110.82</LI> 
          <LI>pv - 600.3</LI>
       </UL>
</UL>
</P>


<p>
<img src="/i/m/Logan_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="112902" context="algorithm"/><br />
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
