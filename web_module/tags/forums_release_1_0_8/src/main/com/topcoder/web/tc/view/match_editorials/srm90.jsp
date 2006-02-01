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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm90_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm90_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505508" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm90" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
      <!--<TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm91_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>-->
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 90</span><br>May 21, 2002
<br /><br />

<H1> The Problems </H1> 

<P>
The Level One was simply to write the algorithm they described - not hard at all. One could 
keep a "current index" for the roaster and move it forward, or simply calculate it at each point 
with a modulus. Probably the hardest part was the formatting for the output. 
<A HREF="/tc?module=MemberProfile&amp;cr=152347" CLASS="bodyGeneric">ZorbaTHut's</A> 
solution used the C++ sprintf() function, while 
<A HREF="/tc?module=MemberProfile&amp;cr=270505" CLASS="bodyGeneric">John Dethridge</A> did the conversion by hand. 
For Java, <A HREF="/tc?module=MemberProfile&amp;cr=154754" CLASS="bodyGeneric">kv's</A> solution 
demonstrates a clever solution - adding 256 to it, thereby forcing 
a 0 in the second place if it's less than 16, converting it to hex, and chopping the first 
character off. <B>kv's</B> solution was also the fastest.
</P>

<P>
The Level Two, on the other hand, was a simple simulation - follow the instructions, code the 
program. Keep an array of everyone's score, keep track of the current "3-man", current player, 
and current place in the pickValues, and just do it. You could code it slightly faster if you 
realized that "add one to everyone's score" didn't actually need to be done - since all you 
care about is the lowest score, obviously writing that isn't going to change anything. 
<A HREF="/tc?module=MemberProfile&amp;cr=269554" CLASS="bodyGeneric">Yarin's</A>
 solution, the fastest, is also quite easy to read.
</P>

<P>
As for the Level Three, only two solutions survived - <B>John Dethridge's</B> and
<B>ZorbaTHut's</B> - and both of them are basically unreadable, though I believe
John's is slightly better than mine. I don't know what his solution involves - however, 
I'll try to explain mine a little bit. I've got it set up to organize the components by 
name, not by adding ID numbers or anything, and the pin identifiers I used are, in fact, 
the same ones used in the input. (I was slightly worried about speed, but I didn't think 
it would be an issue - it wasn't.)
</P>

<P>
First I simplified the wiring into what I termed "melanges" - a pretty lousy term overall, 
but it serves its purpose. If A is connected to B, and B is connected to C, then logically 
speaking, A is connected to C also. Therefore, I don't care about the internal setup; I only 
care what's contained in the "networks" that are connected to each other. So I went through 
and found what all the connections were in each group - start with the "first" wire in the 
group, then add more things if they're directly connected until you've passed through the 
entire remaining wires once without having to add anything. Repeat until all the wires are 
in one group or another. The random_shuffle is simply to get rid of a potential worst-case 
scenario - it may have been unnecessary, but I didn't feel it worth the risk.
</P>

<P>
After that, I went through and parsed all the components, connecting each pin to a melange. 
I'd already defined "melange 0" as "nothing connected", and therefore undefined - the real 
melanges started at #1. This meant I could use C++'s std::map to default to 0, since that's 
the behavior if you access something that doesn't yet exist.
</P>

<P>
Once all the pins were connected, I simply started at the output component (which I'd 
stored when parsing the components) and recursively descended down. Calculating a melange, 
I started with the first output pin it was connected to and set the overall melange to that. 
Then I went through the rest of the output pins, and if any conflicted with its current value, 
I set it to UNDEFINED. An output pin was obviously a recursive call of its own - AND gates and 
OR gates were calculated according to the given rules, using their own melanges as input. 
Through all this I cached the results to avoid speed problems. I did INPUTs simply as 
precached results, with no logic behind them to recalculate them otherwise.
</P>

<P>
And then it was just a matter of translating from the constant values I'd come up with 
to the output strings, and that was the solution.
</P>


<p>
<img src="/i/m/ZorbaTHut_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="152347" context="algorithm"/><br />
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
      
 