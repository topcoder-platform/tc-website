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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm92_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm92_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505510" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm92" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
      <!-- <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm93_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>-->
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 92</span><br>May 29, 2002
<br /><br />

<H1> 
The Problems 
</H1> 

<P><B>LEVEL ONE</B></P>
<P>
The Level One problem was a very annoying math-intensive problem (yes, I'm mostly saying this because I failed it due to a dumb bug.) The trick was to 
recognize that wheelsize/spokes was a fraction, and give both fractions a common denominator. Then it was the Least Common Multiple of them - multiply 
them both together and divide by the GCD - take that, and multiply it by 2 (24 frames in a second, but 12 inches in a foot.) And if it was an even 
division, subtract 1, the easiest way being to subtract 1 before doing the division. I can only imagine what strange bugs other people had. My problem 
was only checking to see if it was even before multiplying by 2. If the multiply-by-two made it an even division, mine would fail, and this is what 
<A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=1" CLASS="bodyGeneric">dmwright</A> (successfully) challenged me on. 
<A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=1" CLASS="bodyGeneric">SnapDragon's</A> solution is quite clean, 
though a little puzzling. <B>dmwright's</B> solution is good also, though it's very verbose, using BigInteger all over the place. I find 
<A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=1" CLASS="bodyGeneric">venco's</A> solution to be the easiest to read of all the working Room One solutions.</P>

<P><B>LEVEL TWO</B></P>
<P>The Level Two problem required a little bit of thought. The easiest way to approach it was to choose a word to be the "pivot", or the downward-hanging 
word (in my visualization, at least - I know of at least one other person who visualized the pivot as being horizontal.) From here you simply tried all 
the possible arrangements of the other two words. They couldn't start on the same vertical position, and they also couldn't start next to each other 
unless they were completely contained on different sides on the pivot. All that's left is to make sure that their start position actually has matching 
letters - take the best value you get from this. It's worth noting that if you choose the first word as the pivot, every example will work, but your 
solution will not - while the positions of the other two words don't matter, you must test every word as a potential pivot. I chose to do this with 
next_permutation - I did twice as many calculations as necessary (due to it also swapping the two words that weren't the pivot) but runtime wasn't an 
issue with this problem. <B>SnapDragon</B> did the same as I did, right down to next_permutation, only his works :) I believe my bug was with the "width" 
calculations. Other solutions were to make a function to process three words, then hardcode in three possibilities (one pivot word for each), and
this is what <A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=1" CLASS="bodyGeneric">reid</A> did.</P>

<P><B>LEVEL THREE</B></P>
<P>
As for the Level Three, the easiest way to explain it algorithmically is to dive into graph theory. Imagine each "open area" as a node, and each 
potential mineshaft as an edge (weighted appropriately). We'll also want a node for the "outside". Now what we want to create is something known as a 
"minimal spanning tree" - the tree connecting all the points with the smallest total weight. Do a search on Google and you'll find a lot of very 
complex descriptions of what is actually a very simple algorithm. The algorithm is: Find the lowest-weight edge from a node you've already 
connected to to a node you haven't. Connect them. Repeat until all nodes are connected. That's all. In my case I didn't bother constructing the graph, I 
just did the work on the data itself (copied out of the Topcoder input data, and with a row of empty space on the top for the "open air", just for ease 
of coding). I'd find the shortest path from a section I'd been to to a section I hadn't, then fill in the new section as "a place I've been". And 
repeated until I ran out of closed areas. I recommend my solution (<A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=1" CLASS="bodyGeneric">ZorbaTHut's</A>) 
for readability, as I ended up with several nicely-named functions, though <B>SnapDragon's</B> is impressive due to sheer brevity of code.
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

