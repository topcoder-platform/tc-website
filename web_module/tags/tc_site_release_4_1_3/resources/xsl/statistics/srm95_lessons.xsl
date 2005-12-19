<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Statistics</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <xsl:call-template name="Top"/>

<!-- Body Begins -->
<TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
  <TR>
    <!-- Left Column Begins -->
    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
<!-- Left Column Include Begins -->  
    <!-- Global Seconday Nav Begins -->        
        <xsl:call-template name="global_left"/>
  <!-- Global Seconday Nav Ends -->      
<!-- Left Column Include Ends -->              
      </TD>
  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="4" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/table_top_fill.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
    <TD CLASS="bodyText" WIDTH="100%" bgcolor="#FFFFFF" valign="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">statisticsw</xsl:with-param>
  <xsl:with-param name="title">&#160;Match Editorials</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<!--body contextual links-->
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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm95_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" CLASS="bodyText">Editorial Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm95_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Comments? Ideas?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm95_prob" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
       <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm95_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
         <TD VALIGN="top" CLASS="bodyText">&#160;</TD>
      </TR>
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>
<!--end contextual links-->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="48" BORDER="0"/><BR/>
<!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">-->
<P><B>Lessons Learned the Hard Way</B><BR/>
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

<IMG SRC="/i/m/slowjoe_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;slowjoe<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=271917" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
          <P><BR/></P>
               </TD>
               <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
            </TR>
            <TR>
               <TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
            </TR>      
            <TR>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
               <TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>   
            <TR>
               <TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>
         </TABLE>
      </TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->

  <!-- Gutter -->
    <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  <!-- Right Column Begins -->
    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- <center><A href="Javascript:sponsorLinkWindow('/?&amp;t=sponsor&amp;c=link&amp;link=/contest/citrix/index.html&amp;refer=srm91_rookie','Citrix','1','1','680','489')"><img src="/i/citrix_sidebar.jpg" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A></center><BR/>
<A HREF="/index?t=schedule&amp;c=tourny_sched"><IMG SRC="/i/tournament/sun_small_banner2.gif" ALT="" WIDTH="170" HEIGHT="84" BORDER="0"/></A> -->
<!-- Right Column Include Begins -->        
        <xsl:call-template name="public_right_col"/>        
<!-- Right Column Include Ends -->        
        </TD>
  <!-- Right Column Ends -->
  <!-- Gutter -->
    <TD WIDTH="25" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  </TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>


