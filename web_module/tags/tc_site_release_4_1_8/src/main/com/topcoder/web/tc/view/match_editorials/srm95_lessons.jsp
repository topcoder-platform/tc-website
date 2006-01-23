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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm95_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm95_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505513" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm95" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm95_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 95</span><br>June 5, 2002
<br /><br />

<span class="bigTitle">Lessons Learned the Hard Way</span>
<br/>
June 7, 2002
</P>

<P>
Single Round match 95 was a Wednesday night contest.  For the cognoscenti,
it was the first match with the spiffing new arena, complete with shiny
new lobbies and list sorting.  In the more mundane, real world, it was the
day before Intel announced a profit warning, and their stock tanked.
</P>

<P>
The problem slate for Div2 was generally easier than in recent
contests.  Both the level 2 and 3 problems were based on "pointer
arithmetic".  Perhaps it would be useful for writers to check for
variety in a problem slate?
</P>

<P>
<B>300 (PhoneNum):</B>
</P>

<P>
This problem took a string of numbers and digits representing a phone 
number, and required that the number be correctly formatted as either
a long distance number eg (800)345-5555 or local number eg 345-5555.
The letters Q and Z represented 0, and the other letters were split
into groups of 3 to represent 2-9.  A decoded number less than 7 digits
long was invalid, and greater than 9 digits was long distance.  Excess
digits were to be discarded.
</P>

<P>
My solution involved two passes: one to translate the digits, and get 
rid of meaningless characters, and a second to correctly format the 
number.  On the night, I came up with something like:
<pre>
StringBuffer sb = new StringBuffer();
for (i=0; i &lt; input.length() ; i++) {   
   c = input.charAt(i);
   if (Character.isLetter(c)) {
      if (c == 'Q' || c == 'Z') {
         sb.append(0);   
      } else {
         if (c &gt; 'Q') c--;
         int digit = c / 3 + 2;
         sb.append(digit);   
      }   
   }
   if (Character.isDigit(c)) sb.append(c);   
}
</pre>
</P>

<P>
I wasn't particularly sharp, and the whole solution took 3 or 4 debugging iterations.
The code above was changed on the first iteration, and I didn't trust it afterwards,
although the bugs were elsewhere.
</P>

<P>
It preys on my mind that this took me too long.  Another solution was to have a heap
of "if" statements:
</P>

<P>
<pre>
for (i=0; i &lt; input.length() ; i++) {   
   c = input.charAt(c);
   if (c >= 'A' &amp;&amp; c &lt;= 'C')
      sb.append(2);      
   if (c ....
}
</pre>
</P>

<P>
And the third solution was to initialise an array:
</P>

<P>
<pre>
String[] digitClass = { "ABC","DEF","GHI","JKL","MNO"....};
for (i=0; i &lt; input.length() ; i++) {   
   char c = input.charAt(i);
   for (j=0; j &lt; digitClass.length ; j++) {   
      if (digitClass[j].indexOf(c) != -1)
         sb.append(j+2);
   }   
   if ("QZ".indexOf(c) != -1) sb.append(0);
   if (Character.isDigit(c)) sb.append(c);
}   
</pre>
</P>

<P>
This strikes me as a classic problem contest trade-off.  What do I want
from the solution?
<OL>
   <LI> Fast coding time.</LI>
   <LI> Reliability (ie works first time, and I trust it.)</LI>
   <LI> (A very poor third) Elegance.</LI>
</OL>
</P>

<P>
I'm still not sure what the best solution here is under those criteria, but
I lean towards cutting and pasting the Strings.  Note that this is probably 
the worst solution in a real program because of the memory cost.
</P>

<P>
Anyway, back to the errors.
</P>

<P>
Problems:
<OL>
   <LI> Mistyping the characters that were checked (eg "if (c =='Q' || c == 'Q')")</LI>
   <LI> In the "formatting phase", making indexing errors taking substrings.</LI>
   <LI> In the formatting phase, using ">7" instead of ">=7" when checking for 
       numbers which are too short.</LI>
   <LI> Range checking: "if ('A'&lt;=ch &amp;&amp; ch&lt;='Z') {"</LI>
   <LI> Misreading the problem regarding range checking, so that the solution doesn't
        deal with anything other than 7 or 10 digits.</LI>
   <LI> Indexing from 1 instead of 0 in an sprintf statement.</LI>
</OL>
</P>

<P>
A pretty good performance on challenge: 50 out of 94 buggy submissions were caught
with challenges.
</P>

<P>
<B>600 (Shellsort):</B>
</P>

<P>
This problem took an array of ints, an offset and an increment, and
required the extraction of a sub-array,
</P>

<P>
As problems go, this is one of the easier level 2 problems we've seen.
The only catch is to get the indexing right.
</P>

<P>
With hindsight, I'd suggest using an ArrayList or Vector, then converting
that to an int[].  This would avoid the risk of indexing errors:
<pre>
Vector vec = new Vector();
for (i=0; i &lt; input.length ; i++) {   
   if (i % K == segNum) {
      vec.add(new Integer(input[i]));
   }
}   
int ret[] = new int[vec.size];
for (i=0; i &lt; ret.length ; i++) {   
   ret[i] = ((Integer)vec.elementAt(i)).intValue();
}   
</pre>
(Of course, you should use ArrayList because Vector is dead slow, but my
fingers know the Vector api better...)
Is this better?  More than 80% of solutions to this problem passed, and most
of the solutions I've looked at used arithmetic to do the indexing...
</P>

<P>
Problems:
<OL>
   <LI> Indexing errors resulting in exceptions.</LI>
   <LI> Logic which incremented the index into the returned array, based on
       code like the following</LI>
    <pre>
       lastseg = seg;
            seg = (seq + 1) % K;
            if (seq &lt; lastseq) index++;
    </pre>
        This fails if K == 1;
   <LI> Although I didn't spot this, allocating too long an array was another
        possible error.</LI>
</OL>
</P>


<P>
On challenge phase, 13 of 40 buggy solutions were caught.
</P>

<P>
<B>1000 (Funnel):</B>
</P>

<P>
Construct an upside-down triangle by taking 1,3,5...etc characters from
the end of a string, padding the last line where necessary.  The method
is passed 2 parameters which define which line of the triangle, and which
character of that line should be returned.
</P>

<P>
One neat trick to use for this problem is that 1 + 3 + 5 +...+ 2n-1 =
n^2.  Still, the problem is one of String manipulation and index
arithmetic.  The same problem was used as the level 2 in div1 also,
and almost a third of submissions there failed also, compared 52% in Div2.
</P>

<P>
Problems: 
<OL>
   <LI> Indexing errors resulting in exceptions.</LI>
   <LI> Failing to pad correctly.</LI>
</OL>
</P>

<P>
On challenge phase, 32 of 91 buggy solutions were caught.
</P>


<p>
<img src="/i/m/slowjoe_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="271917" context="algorithm"/><br />
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

