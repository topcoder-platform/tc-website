<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../top.xsl"/>
    <xsl:import href="../script.xsl"/>
    <xsl:import href="../includes/body_top.xsl"/>
    <xsl:import href="../foot.xsl"/>
    <xsl:import href="../includes/modules/srm_results.xsl"/>
    <xsl:import href="../includes/modules/white_last_srm.xsl"/>
    <xsl:import href="../includes/modules/quick_stats_pulldown.xsl"/>
    <xsl:import href="../includes/modules/coder_week2.xsl"/>
    <xsl:import href="../includes/modules/practice_room.xsl"/>
    <xsl:import href="../includes/modules/calendar.xsl"/>
    <xsl:import href="../includes/modules/top_room_wins.xsl"/>
    <xsl:import href="../includes/global_left.xsl"/>
    <xsl:import href="../includes/public_right_col.xsl"/>
    <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
    <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>

<title>Single Round Match 154 Statistics at TopCoder</title>

<xsl:call-template name="CSS"/>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170" bgcolor="#CCCCCC">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">statisticsw</xsl:with-param>
                <xsl:with-param name="title">Last Match Editorials</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="10" cellpadding="0" width="100%">
            <tr valign="top">
                    <td class="bodyText" width="100%">

<!--body contextual links-->
                        <table width="100%" border="0" cellspacing="0" cellpadding="3">
                            <tr valign="middle">
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 153</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">Wednesday, June 9, 2003</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->

                        <h2>Match summary</h2>

                        <P><b>Snapdragon</b> crushed the competition in Division One with an authoritative performance, winning the division by over 200 points.  
                        <b>tomek</b> remains absolutely perfect, tying <b>Yarin</b> for the longest perfection streak ever (seven matches).  However all seven of 
                        Yarin's matches were in Division One.  tomek has only competed in Division One six times to-date. <strong>Veloso</strong>, back in Division One after a brief slump in Division 
                        Two has turned up the heat again with a room win and the seventh highest score overall.<br /><br />
                        Division Two only saw four correct level three submissions.  The fastest of those was from <b>P.S</b> who submitted in just under 40 minutes.  
                        Although P.S was rewarded with a 274 point rating jump, both <b>fbird</b>'s and <b>ozzie</b>'s performances on the level one and two problems 
                        were enough to make up for the deficit on the level three and P.S ended up in third place overall. </P>
                        
<H1>The Problems</H1><A name="MarginCalculator"></A><FONT 
size="+2"><B>MarginCalculator</B></FONT><BR /><FONT size="-1">Used as: Division-II, 
Level 1 :
<BLOCKQUOTE>
  <TABLE cellSpacing="2">
    <TBODY>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Value</B></td>
      <td style="BACKGROUND: #eee" class="bodyText">300</td></TR>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Submission Rate</B></td>
      <td style="BACKGROUND: #eee" class="bodyText">197 / 214 (92.06%) </td></TR>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Success Rate</B></td>
      <td style="BACKGROUND: #eee" class="bodyText">183 / 197 (92.89%) </td></TR>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>High Score</B></td>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Gladiator</B> for 292.54 points 
    </td></TR></TBODY></TABLE></BLOCKQUOTE></FONT>
<H4>Implementation</H4>
<p>To begin, we parse the values provided by each entry of the input array. We 
can do this with a simple tokenizer (such as a <CODE>stringstream</CODE> in 
C++), retrieving two floating point values from each string. As we do this, we 
maintain two running totals for the total cost and the total price. </p>
<p>Once we have the totals, we take the difference of the total cost from the 
total price. We then take this difference (which should be a floating point 
value) and divide it by the total price. We then multiply this percentage by 
<CODE>100</CODE> and truncate it (by casting it to an <CODE>int</CODE>) and 
return it. </p>
<A name="SuperRot"></A><FONT size="+2"><B>SuperRot</B></FONT><br /><FONT 
size="-1">Used as: Division-II, Level 2 :
<BLOCKQUOTE>
  <TABLE cellSpacing="2">
    <TBODY>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Value</B></td>
      <td style="BACKGROUND: #eee" class="bodyText">450</td></TR>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Submission Rate</B></td>
      <td style="BACKGROUND: #eee" class="bodyText">189 / 214 (88.32%) </td></TR>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Success Rate</B></td>
      <td style="BACKGROUND: #eee" class="bodyText">179 / 189 (94.71%) </td></TR>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>High Score</B></td>
      <td style="BACKGROUND: #eee" class="bodyText"><B>liu</B> for 438.84 points 
  </td></TR></TBODY></TABLE></BLOCKQUOTE></FONT>
<H4>Implementation</H4>
<p>This problem is a simple string transformation that can be done in-place. We 
iterate through each character of the string. We then apply one of the following 
transformations to it: </p>
<TABLE>
  <TBODY>
  <TR>
    <TH>Condition</TH>
    <TH>Transformation</TH></TR>
  <TR>
    <td align="middle"><CODE>'A'</CODE> &lt;= <I>c</I> &lt;= <CODE>'M'</CODE> 
</td>
    <td align="middle"><I>c</I> <CODE>+= 13</CODE> </td></TR>
  <TR>
    <td align="middle"><CODE>'N'</CODE> &lt;= <I>c</I> &lt;= <CODE>'Z'</CODE> 
</td>
    <td align="middle"><I>c</I> <CODE>-= 13</CODE> </td></TR>
  <TR>
    <td align="middle"><CODE>'a'</CODE> &lt;= <I>c</I> &lt;= <CODE>'m'</CODE> 
</td>
    <td align="middle"><I>c</I> <CODE>+= 13</CODE> </td></TR>
  <TR>
    <td align="middle"><CODE>'n'</CODE> &lt;= <I>c</I> &lt;= <CODE>'z'</CODE> 
</td>
    <td align="middle"><I>c</I> <CODE>-= 13</CODE> </td></TR>
  <TR>
    <td align="middle"><CODE>'0'</CODE> &lt;= <I>c</I> &lt;= <CODE>'4'</CODE> 
</td>
    <td align="middle"><I>c</I> <CODE>+= 5</CODE> </td></TR>
  <TR>
    <td align="middle"><CODE>'5'</CODE> &lt;= <I>c</I> &lt;= <CODE>'9'</CODE> 
</td>
    <td align="middle"><I>c</I> <CODE>-= 5</CODE> </td></TR></TBODY></TABLE>
<p>In languages where strings are immutable (such as Java), we would have to 
construct a new string or do our work in a mutable string buffer, but the 
concept is the same. </p>
<A name="ContestScore"></A><FONT size="+2"><B>ContestScore</B></FONT><br /><FONT size="-1">Used as: Division-II, Level 3 :
<BLOCKQUOTE>
  <TABLE cellSpacing="2">
    <TBODY>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Value</B></td>
      <td style="BACKGROUND: #eee" class="bodyText">1000</td></TR>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Submission Rate</B></td>
      <td style="BACKGROUND: #eee" class="bodyText">31 / 214 (14.49%) </td></TR>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Success Rate</B></td>
      <td style="BACKGROUND: #eee" class="bodyText">4 / 31 (12.9%) </td></TR>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>High Score</B></td>
      <td style="BACKGROUND: #eee" class="bodyText"><B>P.S</B> for 483.44 points 
  </td></TR></TBODY></TABLE></BLOCKQUOTE></FONT><FONT size="-1">Used as: Division-I, 
Level 2 :
<BLOCKQUOTE>
  <TABLE cellSpacing="2">
    <TBODY>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Value</B></td>
      <td style="BACKGROUND: #eee" class="bodyText">500</td></TR>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Submission Rate</B></td>
      <td style="BACKGROUND: #eee" class="bodyText">79 / 137 (57.66%) </td></TR>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Success Rate</B></td>
      <td style="BACKGROUND: #eee" class="bodyText">34 / 79 (43.04%) </td></TR>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>High Score</B></td>
      <td style="BACKGROUND: #eee" class="bodyText"><B>ZorbaTHut</B> for 442.90 points 
    </td></TR></TBODY></TABLE></BLOCKQUOTE></FONT>
<H4>Implementation</H4>
<p>This problem is all about sorting. First we iterate through each of the three 
categories (columns). For each category, we sort the entries in descending order 
of their score in that category. We then assign their ranks for this category by 
iterating through this sorted list. The first entry in the list will be ranked 
1st, of course. For each following entry, if its score is the same as the 
preceding entry, then it gets the same rank as the preceding entry. Otherwise, 
its rank is its (1-based) index in the sorted list. E.g. </p>
<p><PRE><CODE>rank[cat][i] = score[cat][i] == score[cat][i - 1] ? rank[cat][i - 1] : i + 1</CODE></PRE>
</p>
<p>Once we have done this for all three categories, we can easily determine the 
sum of the rankings for each entry. We then sort the entries again, in ascending 
order of rank, with descending order of score as the tiebreaker (and 
lexicographical ordering of the names as a further tiebreaker). </p>
<p>The most difficult aspect of this problem is maintaining the data with all 
the repeated sorts. The easiest thing to do is probably to build objects, each 
of which hold the name, three scores, three rankings, and total ranking (or a 
method for computing that on the fly). These objects can then be rearranged by 
whatever sort routines one uses as much as one wants. Then all is left is 
properly defining the comparison function for each of the two types of sorting 
involved. </p>
<A name="CheatCode"></A><FONT 
size="+2"><B>CheatCode</B></FONT><br /><FONT size="-1">Used as: Division-I, Level 1 :
<BLOCKQUOTE>
  <TABLE cellSpacing="2">
    <TBODY>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Value</B></td>
      <td style="BACKGROUND: #eee" class="bodyText">350</td></TR>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Submission Rate</B></td>
      <td style="BACKGROUND: #eee" class="bodyText">114 / 137 (83.21%) </td></TR>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Success Rate</B></td>
      <td style="BACKGROUND: #eee" class="bodyText">73 / 114 (64.04%) </td></TR>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>High Score</B></td>
      <td style="BACKGROUND: #eee" class="bodyText"><B>malpt</B> for 327.38 points 
    </td></TR></TBODY></TABLE></BLOCKQUOTE></FONT>
<H4>Implementation</H4>
<p>This problem can be modeled as a nondeterministic finite automaton (NFA). 
That is, we iterate through each sequence of keystrokes. At each keystroke, we 
are in some set of states (which for this problem is a set of positions in the 
target cheat code). For each keystroke, we iterate through each state and, for 
each state, find as many states that can be reached from that state using that 
keystroke as possible. These become part of the new set of states. </p>
<p>For instance, initially our set of states consists of only one state: the 
beginning of the cheat code. When we read a keystroke, we see if it matches the 
next character in the cheat code. If it does, then we know that advancing the 
position by one gives one possible next state. If that character is the same as 
the previous keystroke entered, then we can also ignore it, which means the 
current state is also a possible next state. And, we can also always go back to 
the beginning of the cheat code as the next state. </p>
<p>We can represent the set of current states as a simple bitmask (e.g., an 
array of boolean values), where the <I>i</I>th value of the bitmask specifies 
whether or not position <I>i</I> in the cheat code is reachable at this point. 
Initially, <CODE>bitmask[0] = true</CODE> while the rest is <CODE>false</CODE>. 
We then proceed through the keystrokes and generate a new bitmask. After we 
process the keystroke, we replace the previous bitmask with the new one. If the 
<I>n</I>th bit of the bitmask is ever true, where <I>n</I> is the length of the 
cheat code, then we have a valid entry of the cheat code. </p>
<p>The trick to this problem is understanding the model (that is, how to map it 
to an NFA, and what an NFA is). The implementation is actually rather easy. </p>
<A name="PossibleOrders"></A><FONT 
size="+2"><B>PossibleOrders</B></FONT><br /><FONT size="-1">Used as: Division-I, Level 
3 :
<BLOCKQUOTE>
  <TABLE cellSpacing="2">
    <TBODY>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Value</B></td>
      <td style="BACKGROUND: #eee" class="bodyText">1000</td></TR>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Submission Rate</B></td>
      <td style="BACKGROUND: #eee" class="bodyText">18 / 137 (13.14%) </td></TR>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Success Rate</B></td>
      <td style="BACKGROUND: #eee" class="bodyText">14 / 18 (77.78%) </td></TR>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>High Score</B></td>
      <td style="BACKGROUND: #eee" class="bodyText"><B>vorthys</B> for 893.76 points 
    </td></TR></TBODY></TABLE></BLOCKQUOTE></FONT>
<H4>Implementation</H4>
<p>To begin, we use the information provided to build a graph. Initially, we 
have a graph with no edges and a vertex for each of the <I>num</I> objects. 
Then, for each equivalence given, we construct an edge between the two objects. 
Once we have constructed this graph, we then identify how many connected 
components there are. </p>
<p>The number of connected components tells us the maximum number of equivalence 
classes we can have. That is, if there are 3 connected components, then there 
are <I>at most</I> 3 distinct values among our objects. However, there may be 
fewer distinct objects, because there may be equivalences that <I>weren't</I> 
given to us. That means, if there are <I>n</I> connected components, then there 
are at least 1 and at most <I>n</I> equivalence classes. Thus we must sum up the 
total number of orderings of objects for each possible number of equivalence 
classes. </p>
<p>For any given number of equivalence classes, the number of orderings is a <A 
href="http://planetmath.org/encyclopedia/StirlingNumbersSecondKind.html">Stirling 
number of the second kind</A>. The preceding link gives an overview of this 
concept, but it essentially boils down to the following recurrence relation (for 
<I>k</I> equivalence classes among <I>n</I> total objects): </p>
<BLOCKQUOTE><CODE>S(n, k) = k * S(n - 1, k) + S(n - 1, k - 
  1)</CODE><br /><CODE>S(n, n) = S(n, 1) = 1</CODE> </BLOCKQUOTE>
<p>This is a simple recurrence relation to implement (using basic memoization 
techniques). So, if we have <I>n</I> connected components, then the solution to 
this problem is: </p>
<BLOCKQUOTE><PRE>sum = 0;
for(int i = 1; i &lt;= n; i++)
    sum += S(n, i);
                </PRE></BLOCKQUOTE>
                
                

                        <p><img src="/i/m/Logan_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" /><br />
                        By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=112902"><strong>Logan</strong></a><br/>
                        <span class="smallText"><em>TopCoder Member</em></span><br clear="all" /></p>

                    </td>
                </tr>
            </table>
            
            <p><br /></p>
            
        </td>                

<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170">
            <img src="/i/clear.gif" width="170" height="1" border="0"/><br />
            <xsl:call-template name="public_right_col"/>
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

    </tr>
</table>

<xsl:call-template name="Foot"/>

</body>

</html>

    </xsl:template>
</xsl:stylesheet>
