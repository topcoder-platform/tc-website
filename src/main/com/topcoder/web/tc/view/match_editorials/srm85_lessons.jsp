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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm85_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm85_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505503" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm85" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm85_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 85</span><br>May 1, 2002
<br /><br />

<span class="bigTitle">Lessons Learned the Hard Way</span>

<P>This is the first of what hopefully will develop into a regular review of division 2.  The focus will be on "what went wrong". 
We hope to provide a statistical breakdown in the future, but this has not been finalised yet.</P>

<P>SRM 85 had 660 entrants. In the end, there were enough coders to create some 43 rooms in Division 2.  As a landmark, it was the first
match to allow submission in C#.</P>

<P>The first 2 problems on the division 2 problem slate were straightforward: if you could do the problem, there was a very high
likelihood that it was correct.  My room had only 2 challenges, some others had none.  The top 2 rooms of the division each had only 1
solution fail.  The third problem was trickier, but the problem complexity seems to have stopped submission of weak solutions.</P>

<P><B>Level One - 250:</B><BR/>
This problem involved doing a parity check on the bits of an array of ints.  The return value was a String with the character '0' representing 
odd parity and '1' representing even parity.  Bear in mind that failures  were quite rare.<BR/><BR/>

Issues:<BR/>
1.  Failure to extract a bit!<BR/>
2.  Adding the wrong character!  (Mea culpa)<BR/>
3.  Returning the string in reverse order...<BR/>
</P>

<P><B>Level Two - 500:</B><BR/>
This problem was based on error correction, where each character of message was sent 3 times to increase reliability.  The problem was to then extract
the original message.  A '*' represented a garbled input character. The rules within a block of 3 characters were (a, b and c each represent 
one of block[i], block[i+!] and block[i+2] at random:<BR/><BR/>
1. a == b == c: return a;<BR/>
2. a == b &amp;&amp; a == '*': return c;<BR/>
3. a == b &amp;&amp; a != '*': return a;<BR/>
4. a != b &amp;&amp; a != c &amp;&amp; b != c: return '*';<BR/>
</P>

<P>The solution was simple: search each block of 3 in each position. A variant on this was to keep a "starcount" of the number of '*' characters,
to help in identifying cases.  A third variant counted the number of pairs of equal characters.</P>

<P>It was noticeable that the solutions which failed were distinctly "uglier" than average.  The counting methods were fairly unreliable.<BR/><BR/>
Issues:<BR/>
1. Not checking all combinations of rules 2 &amp; 3 correctly.  This tended to arise from long conditionals.<BR/>
2. In problems which kept a "starcount", failure to deal with the case where only one star is found.<BR/>
3. Correct checks, but in the wrong order...</P>

<P><B>Level Two - 100:</B><BR/>
The 1000 problem doubled as the 450 in division 1.  The problem was to score a multiplayer, roshambo-like game with a bunch of random rules.
Valid choices were 0-5, with i+1%6 beating i+2%6. Among these were bonuses for choosing the lowest entry.  Another rule said that the cumulative score 
for each player at the end of each round reset to 0 if it was negative.</P>

<P>It's hard to analyse where a lot of these problems went wrong, because of the complexity of the rules.  Probably, only getting out a debugger.<BR/><BR/>
Issues:<BR/>Many of the issues involved either failing to deal with the negative reset, or resetting the round score rather than the cumulative score.</P>

<p>
<img src="/i/m/slowjoe_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="271917" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>
 
<P><B>Member Comments</B></P>

<P>In the article on Div2 there is a case in the Rules for level two that fails.  '*aa" would drop out of the ifs.  I can't figure out if these 4 rules are meant to be complete, but at the least it is confusing, and probably not the most readable way of doing the problem.</P>
 
<P>The two variants I would choose would be</P>
 
<P>
1. a == '*' &amp;&amp; b == '*'; return c;<BR/>
2. a == '*' &amp;&amp; c == '*'; return b;<BR/>
3. b == '*' &amp;&amp; c == '*'; return a;<BR/>
4. a == b; return a;<BR/>
5. a == c; return a;<BR/>
6. b == c; return b;<BR/>
return '*';<BR/>
</P>
 
<P>this separates the two aspects of the problem hence increasing readability or</P>
 
<P>
1. a != '*' &amp;&amp; (a==b || a==c || (b == '*' &amp;&amp; c == '*')); return a;<BR/>
2. b != '*' &amp;&amp; (b==c || (a == '*' &amp;&amp; c == '*')); return b;<BR/>
3. b == '*' &amp;&amp; a == '*'; return c;<BR/>
4. return '*';<BR/>
</P>
 
<P>this gives a fall through on what will produce each result.  As a more instructive way of solving the problem I would make:</P> 
<P>3. c != '*' &amp;&amp; (b == '*' &amp;&amp; a == '*'); return c;</P>
 
<P>as this shows a trend of the equalities decreasing, and improves coder's ability to see patterns and analyse problems.</P>
 
<P>Other than that an excellent article that should be continued.</P>
 
<P><A HREF="/tc?module=MemberProfile&amp;cr=280735" CLASS="bodyGeneric">Shammah</A></P>
 
 <HR/>
 
<P>
He also forgot to mention the approach to sort each triple first (I've
also put this into practice room 109):
</P>

<P>
  string handle ( string t ) {<BR/>
    string r;<BR/>
    for( int i=0; i&#60;t.size(); i&#43;=3 ){<BR/>
      sort( &amp;t[i], &amp;t[i]&#43;3 );<BR/>
      if( t[i&#43;1]=='*' ) r &#43;= t[i&#43;2];<BR/>
      else if( t[i&#43;1]==t[i] || t[i&#43;1]==t[i&#43;2] ) r &#43;= t[i&#43;1];<BR/>
      else r &#43;= '*';<BR/>
    }<BR/>
    return r;<BR/>
  }<BR/>
</P>

<P>
Problem Set Analysis &amp; Opinion
</P>


<P>
Div. 2 - Easy: Evil
</P>

<P>
Would be nice to also mention these two variants to count the number of bits:
</P>


<P>
int bitCount ( int n ) {<BR/>
  return (n&#62;0) ? 1&#43;bitCount( n&amp;(n-1) ) : 0;<BR/>
}<BR/>
</P>

<P>
int bitCount ( int n ) {<BR/>
  return (n&#62;0) ? (n&amp;1) &#43; bitCount( n/2 ) : 0;<BR/>
}<BR/>
</P>

<P>
I got the first variant from the book "The C Programming Language" by
Brian Kernighan and Dennis Ritchie.
</P>

<A HREF="/tc?module=MemberProfile&amp;cr=269889" CLASS="bodyGeneric">Stefan</A>          
         
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


