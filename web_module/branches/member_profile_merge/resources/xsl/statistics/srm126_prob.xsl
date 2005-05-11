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
  <xsl:with-param name="title">&#160;Last Match Editorials</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<!--body contextual links-->
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="100%">
 	<TR>
        <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR> 
	<TR><TD COLSPAN="2" BGCOLOR="#43515E" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD></TR>
	<TR>
		<TD VALIGN="top" BGCOLOR="#43515E" CLASS="moduleTitle">&#160; &#160;</TD>
		<TD BGCOLOR="#43515E" VALIGN="top" CLASS="moduleTitle">MATCH EDITORIAL LINKS:</TD>
	</TR>                    
	<TR>
    	<TD COLSPAN="2" VALIGN="top" BGCOLOR="#43515E">
		<TABLE BORDER="0" WIDTH="100%" CELLSPACING="1" CELLPADDING="" BGCOLOR="#FFFFFF">
		<TR>
			<!-- <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC" HEIGHT="15"><A HREF="/?t=statistics&amp;c=srm104_prob" CLASS="bodyGeneric">&#160;Problem&#160;Set&#160;</A></TD>
			<TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><A HREF="/?t=statistics&amp;c=srm103_rookie" CLASS="bodyGeneric">&#160;Rookie&#160;Review&#160;</A></TD> -->
			<TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><A HREF="/index?t=statistics&amp;c=editorial_archive" CLASS="bodyGeneric">&#160;Archive&#160;</A></TD>
		    <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">&#160;Comments/Ideas?&#160;</A></TD>
		</TR>    		
		</TABLE>
		</TD>
	</TR>               
</TABLE>
<!--end contextual links-->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"/><BR/>
<!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">-->
<B>Single Round Match 126</B><BR/>
Monday, December 23, 2002
<P><B>Problem Set Analysis &amp; Opinion</B></P>

<a name="Battle"></a><font size="+2"><b>Battle</b></font><br/><font size="-1">
Used as: Division-II, Level 1
            :<blockquote><table cellspacing="2">
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Value</b></td>
<td CLASS="bodyText" style="background: #eee;">250</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Submission Rate</b></td>
<td CLASS="bodyText" style="background: #eee;">134
    /
    158
    (84.81%)
</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Success Rate</b></td>
<td CLASS="bodyText" style="background: #eee;">95
    /
    134
    (70.9%)
</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>High Score</b></td>
<td CLASS="bodyText" style="background: #eee;">
<b>MisterZimbu</b> for
                    231.24 points
                </td>
</tr>
</table> </blockquote>
<b>Reference implementation</b>: <a href="#ref.Battle" class="bodyText">see below</a>
</font>
<h4>Implementation</h4>
<p>
This problem could be approached either as a straight-forward simulation or analytically.
                I will describe the analytical approach.  Simply by looking at each warrior's stats, we can
                compute how much time it will take for one to defeat the other.  First, we compute how much
                damage each warrior can inflict upon the other each round (which will remain constant throughout
                the fight).  This is the maximum of either the warrior's offense minus the opponent's defense or zero.
                If the damage inflicted is zero, then that warrior will never be able to defeat the opponent.
                Since we're given an upper bound on time of <tt>1000</tt>, simply choose some greater value (e.g.
                        <tt>1001</tt>) to represent infinity.
                If the damage inflicted is not zero, then the number of rounds it will take to defeat the opponent
                will be: <tt>(health + damage - 1) / damage</tt> (using integral division).
            </p>
<p>
Once we know the number of rounds it will take for each warrior to defeat its opponent, we can compare
                to determine what the output should be.  If the number of rounds is the same for each warrior, then
                we will output <tt>&quot;NONE&quot;</tt>.  The number we output with it will depend upon whether the number of
                rounds is equal to our value representing infinity or not.  If so, we output <tt>&quot;NONE 1000&quot;</tt>, otherwise
                we output <tt>&quot;NONE &quot;</tt> with the number of rounds appended to it.
            </p>
<p>
If the number of rounds is not the same for each warrior, then we output the name of the warrior with the
                greater number of rounds followed by the number of rounds for its opponent.
            </p>
<p>&#160;</p>
<a name="RandomNumberGenerator"></a><font size="+2"><b>RandomNumberGenerator</b></font><br/><font size="-1">
Used as: Division-II, Level 2
            :<blockquote><table cellspacing="2">
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Value</b></td>
<td CLASS="bodyText" style="background: #eee;">500</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Submission Rate</b></td>
<td CLASS="bodyText" style="background: #eee;">66
    /
    158
    (41.77%)
</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Success Rate</b></td>
<td CLASS="bodyText" style="background: #eee;">31
    /
    66
    (46.97%)
</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>High Score</b></td>
<td CLASS="bodyText" style="background: #eee;">
<b>AyelilTr</b> for
                    406.88 points
                </td>
</tr>
</table></blockquote></font><font size="-1">
Used as: Division-I, Level 1
            :<blockquote><table cellspacing="2">
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Value</b></td>
<td CLASS="bodyText" style="background: #eee;">250</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Submission Rate</b></td>
<td CLASS="bodyText" style="background: #eee;">81
    /
    87
    (93.1%)
</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Success Rate</b></td>
<td CLASS="bodyText" style="background: #eee;">61
    /
    81
    (75.31%)
</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>High Score</b></td>
<td CLASS="bodyText" style="background: #eee;">
<b>b0b0b0b</b> for
                    242.72 points
                </td>
</tr>
</table></blockquote>
<b>Reference implementation</b>: <a href="#ref.RandomNumberGenerator" class="bodyText">see below</a>
</font><h4>Implementation</h4>
<p>
This problem can be solved in a very straight-forward manner.  Iterate through every possible seed
                (there will be <tt>radix - 1</tt> of these).  For each seed, generate random numbers until you repeat
                one.  If the number of unique random numbers generated is equal to <tt>radix - 1</tt>, increment a counter.
                After doing this for every seed, return this counter.
            </p>
<p>
For each seed there can be at most <tt>radix - 1</tt> unique random numbers generated.  Therefore the
                upper bound on runtime for this method is <tt>O(radix<sup>2</sup>)</tt>.  With an upper bound of <tt>1000</tt>
imposed on <tt>radix</tt>, there is no problem using this simple method to solve this problem.
            </p>
<p>&#160;</p>
<a name="Antidote"></a><font size="+2"><b>Antidote</b></font><br/><font size="-1">
Used as: Division-II, Level 3
            :<blockquote><table cellspacing="2">
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Value</b></td>
<td CLASS="bodyText" style="background: #eee;">1000</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Submission Rate</b></td>
<td CLASS="bodyText" style="background: #eee;">27
    /
    158
    (17.09%)
</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Success Rate</b></td>
<td CLASS="bodyText" style="background: #eee;">9
    /
    27
    (33.33%)
</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>High Score</b></td>
<td CLASS="bodyText" style="background: #eee;">
<b>MisterZimbu</b> for
                    673.57 points
                </td>
</tr>
</table></blockquote>
<b>Reference implementation</b>: <a href="#ref.Antidote" class="bodyText">see below</a>
</font><h4>Implementation</h4>
<p>
To solve this problem, we will iterate through every combination of choices we can make for all of
                the drinks.  As usual, we will represent a combination as an integer, where its bits specify the
                value for each element in the set.  In this case, a <tt>1</tt> bit indicates a <tt>DRINK</tt> action,
                while a <tt>0</tt> bit indicates a <tt>PASS</tt> action.
            </p>
<p>
If we order the bits so that the most-significant bit represents the action to take for the first drink
                in the list, then the natural ordering of integers yields the ordering we desire for combinations.
                Thus all we have to do is iterate through the values from <tt>2<sup>n</sup> - 1</tt> down to <tt>0</tt>,
                inclusive, and return the first combination we find that yields no sickness.
            </p>
<p>
To determine whether a combination yields sickness is easy.  Before we begin, we process the <tt>rules</tt>
parameter.  This consists of some simple string parsing.  Each rule gives us either one drink or an ordered
                pair of drinks.  If the former, we add this drink to a set of bad drinks.  If the latter, we add this
                ordered pair to a set of bad sequences of drinks.
            </p>
<p>
For each combination, we iterate through the bits (from most-significant to least-significant).  Whenever
                we encounter a bit of value <tt>1</tt>, we check to see if it causes sickness.  If the drink it represents
                is in the list of bad drinks, it causes sickness.  If the previous bit was also <tt>1</tt>, and the ordered
                pair formed by the drink represented by the previous bit and the drink represented by the current bit
                is in the set of bad sequences of drinks, it causes sickness.  Otherwise we continue.  If we iterate through
                all of the bits in this fashion without causing sickness, then we have found the combination our answer is
                based on.
            </p>
<p>
Once we find this combination, we simply iterate through the combination's bits again in the same order as before.
                For bits of value <tt>1</tt> we add <tt>&quot;DRINK&quot;</tt> to the output list, otherwise we add <tt>&quot;PASS&quot;</tt>.
            </p>
<p>&#160;</p>
<a name="UnitConverter"></a><font size="+2"><b>UnitConverter</b></font><br/><font size="-1">
Used as: Division-I, Level 2
            :<blockquote><table cellspacing="2">
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Value</b></td>
<td CLASS="bodyText" style="background: #eee;">550</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Submission Rate</b></td>
<td CLASS="bodyText" style="background: #eee;">29
    /
    87
    (33.33%)
</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Success Rate</b></td>
<td CLASS="bodyText" style="background: #eee;">10
    /
    29
    (34.48%)
</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>High Score</b></td>
<td CLASS="bodyText" style="background: #eee;">
<b>kv</b> for
                    387.15 points
                </td>
</tr>
</table></blockquote>
<b>Reference implementation</b>: <a href="#ref.UnitConverter" class="bodyText">see below</a>
</font><h4>Implementation</h4>
<p>
This problem can be broken down into three separate, relatively easy problems:
            </p>
<ul>
<li>Parsing (conversion specifiers and amounts)</li>
<li>Rational arithmetic</li>
<li>Transitive closure</li>
</ul>
<p>
I'll address these one at a time.
            </p>
<ul>
<li>
<p>
The parsing problem is rather easy as far as parsing problems go.  You are given a grammar
                        in Backus-Naur form (BNF).  BNF basically specifies rules in the form of
                    </p>
<blockquote>
<i>non-terminal</i><code> ::= </code><i>terminals and non-terminals</i>
</blockquote>
<p>
There are many ways to approach this, but my favorite tends
                        to be <i>recursive-descent</i>.  A recursive-descent parser generally defines a function
                        for each non-terminal in the grammar.  The definition of each function follows directly
                        from the rule for the non-terminal that it parses.  The occurrence of a non-terminal
                        in a rule corresponds to a (possibly recursive) call to the function that represents
                        that non-terminal.
                    </p>
<p>
Fortunately the grammar for this problem is very simple.  See my solution for how I parsed it.
                    </p>
</li>
<li>
<p>
Rational arithmetic is a problem that comes up again and again on TopCoder.  For this reason you
                        should probably already have it coded, archived, and ready for quick reuse.  For this problem you
                        only need to be able to support the multiplication and division operations on rationals.  Divison
                        is just multiplication by a reciprocal of a rational, and multiplication is quite simple:
                        product of the numerators divided by the product of the denominators.  Thanks to the problem specification
                        we don't have to deal with special values like <tt>0</tt> or negative values.  Since we may get very
                        large values for either the numerator or denominator, each should be represented by a 64-bit integer data
                        type.
                    </p>
<p>
You will also need to be able to convert any rational value into simplified form.  This simply consists
                        of computing the greatest common divisor of the numerator and denominator, and then dividing each by
                        that value.  It is generally good practice to simplify any intermediate value, to help avoid overflow.
                    </p>
</li>
<li>
<p>
The conversion rules that you are given specify the edges of a directed graph.  In this graph,
                        vertices represent units and edges between vertices represent conversions from one unit to another.
                        Each edge has a weight associated with it.  This weight gives the conversion factor; if there exists
                        an edge between units <i>X</i> and <i>Y</i>, then to convert a value expressed in <i>X</i> to <i>Y</i>
you would multiply that value by the weight of the edge from <i>X</i> to <i>Y</i>.  Furthermore, if
                        there is a <i>path</i> from <i>X</i> to <i>Y</i> (consisting of one or more edges), then the conversion
                        factor from <i>X</i> to <i>Y</i> is simply the product of the weights of all the edges in this path.
                    </p>
<p>
Each rule corresponds to two edges, each between the same pair of vertices.  One edge is from the unit
                        on the left side of the <tt>=</tt> to that on the right side, and its weight is the value on the
                        left side divided by the value on the right side.  The second edge is in the opposite direction, and its
                        weight is the reciprocal of the first edge's weight.
                    </p>
<p>
The transitive closure of this graph can then give us direct access to the conversion factors between
                        any pair of units for which a conversion is defined.  The transitive closure basically represents
                        the set of all acyclic paths in a directed graph.  When generating the transitive closure it is easy
                        to compute the product of the weights of the edges for each path.  See my solution for the implementation.
                    </p>
</li>
</ul>
<p>
Once these three problems are solved, the solution is trivial.  We parse the input to build our graph, then
                compute the transitive closure of that graph to build a map representing all the defined conversion factors.
                We then parse the input value, find the conversion factor to convert it from its unit to the input unit, multiply
                the input value by that factor, and output the result.
            </p>
<p>&#160;</p>
<a name="WeatherCommunications"></a><font size="+2"><b>WeatherCommunications</b></font><br/><font size="-1">
Used as: Division-I, Level 3
            :<blockquote><table cellspacing="2">
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Value</b></td>
<td CLASS="bodyText" style="background: #eee;">1000</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Submission Rate</b></td>
<td CLASS="bodyText" style="background: #eee;">15
    /
    87
    (17.24%)
</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Success Rate</b></td>
<td CLASS="bodyText" style="background: #eee;">6
    /
    15
    (40%)
</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>High Score</b></td>
<td CLASS="bodyText" style="background: #eee;">
<b>Yarin</b> for

                    680.59 points
                </td>
</tr>
</table></blockquote>
<b>Reference implementation</b>: <a href="#ref.WeatherCommunications" class="bodyText">see below</a>
</font><h4>Implementation</h4>
<p>
There is no clever trick that is needed to solve this problem.  The input is small enough that it is possible
                to iterate through every combination of edges, determine if each combination yields security, and measure the
                cost of each combination.  This one sentence basically summarizes the entire solution.
            </p>
<p>
If there are <tt>n</tt> points, then there are <tt>n * (n - 1) / 2</tt> unique edges (remember that edges
                are not directed).  Let <tt>t = n * (n - 1) / 2</tt>.  Then there are <tt>2<sup>t</sup></tt> edge combinations.
                We can iterate through these combinations in the same manner as usual (see <a href="#Antidote" class="bodyText">Antidote</a>).
                We can skip the empty combination (no edges), as it will always be invalid.
            </p>
<p>
For each combination, we must determine if it is secure.  It is secure if, for each vertex that we remove, there
                exists at least one path between any pair of remaining vertices.  So, we iterate through all unique pairs of
                vertices.  For each such pair, we perform a depth-first search starting at the first vertex, visiting every
                vertex we can reach without visiting the second vertex.  After the depth-first search, if we have visited
                every vertex but one, we know that this combination is secure.
            </p>
<p>
If we determine that a combination is secure, we simply iterate through the edges that are in that combination
                to measure the cost of that combination.  For each edge, we check to see if it is in the defined set of edges
                that already exist.  If not, we add the distance between the two vertices that the edge connects to the running
                sum of the total cost.
            </p>
<p>
As we iterate through all the edge combinations as described above, we keep track of the minimum cost over all
                secure combinations.  We can initialize this minimum to be the sum of the cost of all edges, as that represents
                a combination that will always be valid.
            </p>
<p>&#160;</p>
<h1>Reference Implementations</h1>

<a name="ref.Battle"></a>
<h2>Battle</h2>

<div style="background: black; color: white;">
<pre>
<font color="#8080ff"><b>#include </b></font><font color="#ff40ff"><b>&lt;string&gt;</b></font>
<font color="#8080ff"><b>#include </b></font><font color="#ff40ff"><b>&lt;sstream&gt;</b></font>

<font color="#ffff00"><b>using</b></font> <font color="#00ff00"><b>namespace</b></font> std;

<font color="#00ff00"><b>class</b></font> Battle
{
<font color="#ffff00"><b>public</b></font>:
    string firstDefeated(string warrior1, string warrior2);
};

<font color="#00ff00"><b>void</b></font> parse_warrior(string warrior, string &amp;name, <font color="#00ff00"><b>int</b></font> &amp;health, <font color="#00ff00"><b>int</b></font> &amp;def, <font color="#00ff00"><b>int</b></font> &amp;off)
{
    stringstream ss(warrior);

    ss &gt;&gt; name &gt;&gt; health &gt;&gt; def &gt;&gt; off;
}

string Battle::firstDefeated(string warrior1, string warrior2)
{
    string n1, n2;
    <font color="#00ff00"><b>int</b></font> h1, h2;
    <font color="#00ff00"><b>int</b></font> d1, d2;
    <font color="#00ff00"><b>int</b></font> o1, o2;
    <font color="#00ff00"><b>int</b></font> dmg1, dmg2;
    <font color="#00ff00"><b>int</b></font> t1, t2;

    parse_warrior(warrior1, n1, h1, d1, o1);
    parse_warrior(warrior2, n2, h2, d2, o2);
    dmg1 = (o1 - d2) &gt;? <font color="#ff40ff"><b>0</b></font>;
    dmg2 = (o2 - d1) &gt;? <font color="#ff40ff"><b>0</b></font>;

    t1 = dmg1 ? (h2 + dmg1 - <font color="#ff40ff"><b>1</b></font>) / dmg1 : <font color="#ff40ff"><b>1001</b></font>;
    t2 = dmg2 ? (h1 + dmg2 - <font color="#ff40ff"><b>1</b></font>) / dmg2 : <font color="#ff40ff"><b>1001</b></font>;
    t1 &lt;?= <font color="#ff40ff"><b>1001</b></font>;
    t2 &lt;?= <font color="#ff40ff"><b>1001</b></font>;

    stringstream out;

    <font color="#ffff00"><b>if</b></font>(t1 == t2) {
        t1 &lt;?= <font color="#ff40ff"><b>1000</b></font>;
        out &lt;&lt; <font color="#ff40ff"><b>&quot;NONE &quot;</b></font> &lt;&lt; t1;
    } <font color="#ffff00"><b>else</b></font> <font color="#ffff00"><b>if</b></font>(t1 &lt; t2) {
        out &lt;&lt; n2 &lt;&lt; <font color="#ff40ff"><b>' '</b></font> &lt;&lt; t1;
    } <font color="#ffff00"><b>else</b></font> {
        out &lt;&lt; n1 &lt;&lt; <font color="#ff40ff"><b>' '</b></font> &lt;&lt; t2;
    }
    <font color="#ffff00"><b>return</b></font> out.str();
}

</pre>
</div>

<a name="ref.RandomNumberGenerator"></a>
<h2>RandomNumberGenerator</h2>

<div style="background: black; color: white;">
<pre>
<font color="#8080ff"><b>#include </b></font><font color="#ff40ff"><b>&lt;set&gt;</b></font>

<font color="#ffff00"><b>using</b></font> <font color="#00ff00"><b>namespace</b></font> std;

<font color="#00ff00"><b>class</b></font> RandomNumberGenerator
{
<font color="#ffff00"><b>public</b></font>:
    <font color="#00ff00"><b>int</b></font> howManyGoodSeeds(<font color="#00ff00"><b>int</b></font> Base, <font color="#00ff00"><b>int</b></font> radix);
};

<font color="#00ff00"><b>int</b></font> modpow(<font color="#00ff00"><b>int</b></font> base, <font color="#00ff00"><b>int</b></font> pow, <font color="#00ff00"><b>int</b></font> mod)
{
    <font color="#ffff00"><b>return</b></font> pow ? (base * modpow(base, pow - <font color="#ff40ff"><b>1</b></font>, mod)) % mod : <font color="#ff40ff"><b>1</b></font>;
}

<font color="#00ff00"><b>int</b></font> RandomNumberGenerator::howManyGoodSeeds(<font color="#00ff00"><b>int</b></font> base, <font color="#00ff00"><b>int</b></font> radix)
{
    <font color="#00ff00"><b>int</b></font> result = <font color="#ff40ff"><b>0</b></font>;

    <font color="#ffff00"><b>for</b></font>(<font color="#00ff00"><b>int</b></font> i = <font color="#ff40ff"><b>1</b></font>; i &lt; radix; i++) {
        <font color="#00ff00"><b>int</b></font> gen = modpow(base, i, radix);
        <font color="#00ff00"><b>int</b></font> prev = gen;
        set&lt;<font color="#00ff00"><b>int</b></font>&gt; history;

        <font color="#ffff00"><b>while</b></font>(history.find(prev) == history.end()) {
            history.insert(prev);
            prev = (gen * prev) % radix;
        }
        <font color="#ffff00"><b>if</b></font>((<font color="#00ff00"><b>int</b></font>) history.size() == radix - <font color="#ff40ff"><b>1</b></font>) {
            result++;
        }
    }
    <font color="#ffff00"><b>return</b></font> result;
}

</pre>
</div>

<a name="ref.Antidote"></a>
<h2>Antidote</h2>

<div style="background: black; color: white;">
<pre>
<font color="#8080ff"><b>#include </b></font><font color="#ff40ff"><b>&lt;string&gt;</b></font>
<font color="#8080ff"><b>#include </b></font><font color="#ff40ff"><b>&lt;vector&gt;</b></font>
<font color="#8080ff"><b>#include </b></font><font color="#ff40ff"><b>&lt;sstream&gt;</b></font><br/>
<font color="#8080ff"><b>#include </b></font><font color="#ff40ff"><b>&lt;set&gt;</b></font>
<font color="#8080ff"><b>#include </b></font><font color="#ff40ff"><b>&lt;map&gt;</b></font>

<font color="#ffff00"><b>using</b></font> <font color="#00ff00"><b>namespace</b></font> std;

<font color="#00ff00"><b>class</b></font> Antidote
{
<font color="#ffff00"><b>public</b></font>:
    vector&lt;string&gt; safeDrinks(vector&lt;string&gt; a, vector&lt;string&gt; b);
};

vector&lt;string&gt; Antidote::safeDrinks(vector&lt;string&gt; rules, vector&lt;string&gt; drinks)
{
    set&lt;pair&lt;string, string&gt; &gt; bad_seqs;
    set&lt;string&gt; bad_drinks;

    <font color="#ffff00"><b>for</b></font>(vector&lt;string&gt;::const_iterator i = rules.begin(); i != rules.end(); i++) {
        string s = i-&gt;substr(<font color="#ff40ff"><b>4</b></font>);
        <font color="#00ff00"><b>unsigned</b></font> x = s.find(<font color="#ff40ff"><b>'+'</b></font>);

        <font color="#ffff00"><b>if</b></font>(x == s.npos) {
            bad_drinks.insert(s);
        } <font color="#ffff00"><b>else</b></font> {
            string a = s.substr(<font color="#ff40ff"><b>0</b></font>, x);
            string b = s.substr(x + <font color="#ff40ff"><b>1</b></font>);

            bad_seqs.insert(pair&lt;string, string&gt;(a, b));
        }
    }

    vector&lt;string&gt; result;
    <font color="#00ff00"><b>unsigned</b></font> c = <font color="#ff40ff"><b>1</b></font> &lt;&lt; drinks.size();

    <font color="#ffff00"><b>while</b></font>(c-- &gt; <font color="#ff40ff"><b>0</b></font>) {
        string prev;
        <font color="#00ff00"><b>unsigned</b></font> i;

        <font color="#ffff00"><b>for</b></font>(i = <font color="#ff40ff"><b>0</b></font>; i &lt; drinks.size(); i++) {
            <font color="#ffff00"><b>if</b></font>(c &amp; (<font color="#ff40ff"><b>1</b></font> &lt;&lt; (drinks.size() - i - <font color="#ff40ff"><b>1</b></font>))) {
                <font color="#ffff00"><b>if</b></font>(prev.size() &gt; <font color="#ff40ff"><b>0</b></font> &amp;&amp; bad_seqs.find(pair&lt;string, string&gt;(prev, drinks[i]))<br/> != bad_seqs.end()) {
                    <font color="#ffff00"><b>break</b></font>;
                }
                <font color="#ffff00"><b>if</b></font>(bad_drinks.find(drinks[i]) != bad_drinks.end()) {
                    <font color="#ffff00"><b>break</b></font>;
                }
                prev = drinks[i];
            } <font color="#ffff00"><b>else</b></font> {
                prev = <font color="#ff40ff"><b>&quot;&quot;</b></font>;
            }
        }
        <font color="#ffff00"><b>if</b></font>(i == drinks.size()) {
            <font color="#ffff00"><b>break</b></font>;
        }
    }

    <font color="#ffff00"><b>for</b></font>(<font color="#00ff00"><b>unsigned</b></font> i = <font color="#ff40ff"><b>0</b></font>; i &lt; drinks.size(); i++) {
        result.push_back((c &amp; (<font color="#ff40ff"><b>1</b></font> &lt;&lt; (drinks.size() - i - <font color="#ff40ff"><b>1</b></font>))) ? <font color="#ff40ff"><b>&quot;DRINK&quot;</b></font> : <font color="#ff40ff"><b>&quot;PASS&quot;</b></font>);
    }
    <font color="#ffff00"><b>return</b></font> result;
}

</pre>
</div>

<a name="ref.UnitConverter"></a>
<h2>UnitConverter</h2>

<div style="background: black; color: white;">
<pre>
<font color="#8080ff"><b>#include </b></font><font color="#ff40ff"><b>&lt;string&gt;</b></font>
<font color="#8080ff"><b>#include </b></font><font color="#ff40ff"><b>&lt;vector&gt;</b></font>
<font color="#8080ff"><b>#include </b></font><font color="#ff40ff"><b>&lt;sstream&gt;</b></font><br/>
<font color="#8080ff"><b>#include </b></font><font color="#ff40ff"><b>&lt;set&gt;</b></font>
<font color="#8080ff"><b>#include </b></font><font color="#ff40ff"><b>&lt;map&gt;</b></font>

<font color="#ffff00"><b>using</b></font> <font color="#00ff00"><b>namespace</b></font> std;

<font color="#00ff00"><b>class</b></font> UnitConverter
{
<font color="#ffff00"><b>public</b></font>:
    string convertQuantity(vector&lt;string&gt; a, string b, string c);
};

<font color="#00ff00"><b>long</b></font> <font color="#00ff00"><b>long</b></font> gcd(<font color="#00ff00"><b>long</b></font> <font color="#00ff00"><b>long</b></font> m, <font color="#00ff00"><b>long</b></font> <font color="#00ff00"><b>long</b></font> n)
{
    <font color="#ffff00"><b>return</b></font> n ? gcd(n, m % n) : m;
}

<font color="#00ffff"><b>// Represents a rational number</b></font>
<font color="#00ff00"><b>struct</b></font> R : <font color="#ffff00"><b>public</b></font> pair&lt;<font color="#00ff00"><b>long</b></font> <font color="#00ff00"><b>long</b></font>, <font color="#00ff00"><b>long</b></font> <font color="#00ff00"><b>long</b></font>&gt;
{
    R(<font color="#00ff00"><b>long</b></font> <font color="#00ff00"><b>long</b></font> n = <font color="#ff40ff"><b>0</b></font>, <font color="#00ff00"><b>long</b></font> <font color="#00ff00"><b>long</b></font> d = <font color="#ff40ff"><b>1</b></font>) : pair&lt;<font color="#00ff00"><b>long</b></font> <font color="#00ff00"><b>long</b></font>, <font color="#00ff00"><b>long</b></font> <font color="#00ff00"><b>long</b></font>&gt;(n, n ? d : <font color="#ff40ff"><b>1</b></font>)
    {
        simplify();
    }

    R(<font color="#00ff00"><b>const</b></font> R &amp;r) : pair&lt;<font color="#00ff00"><b>long</b></font> <font color="#00ff00"><b>long</b></font>, <font color="#00ff00"><b>long</b></font> <font color="#00ff00"><b>long</b></font>&gt;(r.first, r.second)
    {
        simplify();
    }

    <font color="#00ff00"><b>bool</b></font> <font color="#ffff00"><b>operator</b></font>!(<font color="#00ff00"><b>void</b></font>) <font color="#00ff00"><b>const</b></font>
{
        <font color="#ffff00"><b>return</b></font> !first;
    }

    <font color="#00ff00"><b>void</b></font> <font color="#ffff00"><b>operator</b></font>*=(<font color="#00ff00"><b>const</b></font> R &amp;r)
    {
        first *= r.first;
        second *= r.second;
        simplify();
    }

    R <font color="#ffff00"><b>operator</b></font>~(<font color="#00ff00"><b>void</b></font>) <font color="#00ff00"><b>const</b></font>
{
        <font color="#ffff00"><b>return</b></font> R(second, first);
    }

    R <font color="#ffff00"><b>operator</b></font>*(<font color="#00ff00"><b>const</b></font> R &amp;r) <font color="#00ff00"><b>const</b></font>
{
        <font color="#ffff00"><b>return</b></font> R(first * r.first, second * r.second);
    }

    R <font color="#ffff00"><b>operator</b></font>/(<font color="#00ff00"><b>const</b></font> R &amp;r) <font color="#00ff00"><b>const</b></font>
{
        <font color="#ffff00"><b>return</b></font> *<font color="#ffff00"><b>this</b></font> * ~r;
    }

    <font color="#00ff00"><b>void</b></font> simplify(<font color="#00ff00"><b>void</b></font>)
    {
        <font color="#00ff00"><b>long</b></font> <font color="#00ff00"><b>long</b></font> g = gcd(first, second);

        first /= g;
        second /= g;
    }
};


ostream &amp;<font color="#ffff00"><b>operator</b></font>&lt;&lt;(ostream &amp;o, <font color="#00ff00"><b>const</b></font> R &amp;r)
{
    <font color="#ffff00"><b>if</b></font>(r.second == <font color="#ff40ff"><b>1</b></font>) {
        o &lt;&lt; r.first;
    } <font color="#ffff00"><b>else</b></font> <font color="#ffff00"><b>if</b></font>(r.first &gt; r.second) {
        o &lt;&lt; r.first / r.second;
        <font color="#ffff00"><b>if</b></font>(r.first % r.second) {
            o &lt;&lt; <font color="#ff40ff"><b>' '</b></font> &lt;&lt; r.first % r.second &lt;&lt; <font color="#ff40ff"><b>'/'</b></font> &lt;&lt; r.second;
        }
    } <font color="#ffff00"><b>else</b></font> {
        o &lt;&lt; r.first &lt;&lt; <font color="#ff40ff"><b>'/'</b></font> &lt;&lt; r.second;
    }
    <font color="#ffff00"><b>return</b></font> o;
}

<font color="#00ffff"><b>// Represents an amount (rational + unit)</b></font>
<font color="#00ff00"><b>struct</b></font> A : <font color="#ffff00"><b>public</b></font> pair&lt;R, string&gt;
{
    A(<font color="#00ff00"><b>const</b></font> R &amp;r, <font color="#00ff00"><b>const</b></font> string &amp;s) : pair&lt;R, string&gt;(r, s) { }
    A(<font color="#00ff00"><b>const</b></font> A &amp;a) : pair&lt;R, string&gt;(a.first, a.second) { }
};

ostream &amp;<font color="#ffff00"><b>operator</b></font>&lt;&lt;(ostream &amp;o, <font color="#00ff00"><b>const</b></font> A &amp;a)
{
    o &lt;&lt; a.first &lt;&lt; <font color="#ff40ff"><b>' '</b></font> &lt;&lt; a.second;
    <font color="#ffff00"><b>return</b></font> o;
}

<font color="#00ffff"><b>// Represents a conversion (A &lt;-&gt; A)</b></font>
<font color="#00ff00"><b>struct</b></font> C : <font color="#ffff00"><b>public</b></font> pair&lt;A, A&gt;
{
    C(<font color="#00ff00"><b>const</b></font> A &amp;a, <font color="#00ff00"><b>const</b></font> A &amp;b) : pair&lt;A, A&gt;(a, b) { }
    C(<font color="#00ff00"><b>const</b></font> C &amp;c) : pair&lt;A, A&gt;(c.first, c.second) { }
};

ostream &amp;<font color="#ffff00"><b>operator</b></font>&lt;&lt;(ostream &amp;o, <font color="#00ff00"><b>const</b></font> C &amp;c)
{
    o &lt;&lt; c.first &lt;&lt; <font color="#ff40ff"><b>'='</b></font> &lt;&lt; c.second;
    <font color="#ffff00"><b>return</b></font> o;
}

R parse_rational(<font color="#00ff00"><b>const</b></font> string &amp;s)
{
    <font color="#00ff00"><b>unsigned</b></font> x = s.find(<font color="#ff40ff"><b>'/'</b></font>);
    <font color="#00ff00"><b>unsigned</b></font> y = s.find(<font color="#ff40ff"><b>' '</b></font>);

    <font color="#ffff00"><b>if</b></font>(x == s.npos) {
        stringstream ss(s);
        <font color="#00ff00"><b>long</b></font> <font color="#00ff00"><b>long</b></font> a;

        ss &gt;&gt; a;
        <font color="#ffff00"><b>return</b></font> R(a);
    }
    <font color="#ffff00"><b>if</b></font>(y != s.npos) {
        stringstream ss(s.substr(<font color="#ff40ff"><b>0</b></font>, x));
        <font color="#00ff00"><b>long</b></font> <font color="#00ff00"><b>long</b></font> a, b, c;

        ss &gt;&gt; a &gt;&gt; b;

        stringstream ss2(s.substr(x + <font color="#ff40ff"><b>1</b></font>));

        ss2 &gt;&gt; c;
        <font color="#ffff00"><b>return</b></font> R(a * c + b, c);
    } <font color="#ffff00"><b>else</b></font> {
        stringstream ss(s.substr(<font color="#ff40ff"><b>0</b></font>, x));
        <font color="#00ff00"><b>long</b></font> <font color="#00ff00"><b>long</b></font> a, b;

        ss &gt;&gt; a;

        stringstream ss2(s.substr(x + <font color="#ff40ff"><b>1</b></font>));

        ss2 &gt;&gt; b;
        <font color="#ffff00"><b>return</b></font> R(a, b);
    }
}

A parse_amount(<font color="#00ff00"><b>const</b></font> string &amp;s)
{
    <font color="#00ff00"><b>unsigned</b></font> x = s.find_last_of(<font color="#ff40ff"><b>' '</b></font>);

    <font color="#ffff00"><b>return</b></font> A(parse_rational(s.substr(<font color="#ff40ff"><b>0</b></font>, x)), s.substr(x + <font color="#ff40ff"><b>1</b></font>));
}

C parse_conversion(<font color="#00ff00"><b>const</b></font> string &amp;s)
{
    <font color="#00ff00"><b>unsigned</b></font> x = s.find(<font color="#ff40ff"><b>'='</b></font>);

    <font color="#ffff00"><b>return</b></font> C(parse_amount(s.substr(<font color="#ff40ff"><b>0</b></font>, x)), parse_amount(s.substr(x + <font color="#ff40ff"><b>1</b></font>)));
}

string UnitConverter::convertQuantity(vector&lt;string&gt; conversions, string quantity, string unit)
{
    set&lt;string&gt; units;
    map&lt;string, map&lt;string, R&gt; &gt; graph;

    <font color="#00ffff"><b>// Populate conversion graph</b></font>
<font color="#ffff00"><b>for</b></font>(vector&lt;string&gt;::const_iterator i = conversions.begin(); i <br/>!= conversions.end(); i++) {
        C c = parse_conversion(*i);

        graph[c.first.second][c.second.second] = c.second.first / c.first.first;
        graph[c.second.second][c.first.second] = c.first.first / c.second.first;
        units.insert(c.first.second);
        units.insert(c.second.second);
    }

    <font color="#00ffff"><b>// Transitive closure</b></font>
<font color="#ffff00"><b>for</b></font>(set&lt;string&gt;::const_iterator k = units.begin(); k != units.end(); k++) {
        <font color="#ffff00"><b>for</b></font>(set&lt;string&gt;::const_iterator i = units.begin(); i != units.end(); i++) {
            <font color="#ffff00"><b>for</b></font>(set&lt;string&gt;::const_iterator j = units.begin(); j != units.end(); j++) {
                <font color="#ffff00"><b>if</b></font>(!graph[*i][*j]) {
                    graph[*i][*j] = graph[*i][*k] * graph[*k][*j];
                }
            }
        }
    }
    <font color="#00ffff"><b>// graph[x][y] now gives the conversion factor from x to y</b></font>

A a = parse_amount(quantity);
    R scalar = graph[a.second][unit];
    A b(a.first * scalar, unit);

    stringstream result;

    result &lt;&lt; b;
    <font color="#ffff00"><b>return</b></font> result.str();
}
</pre>
</div>

<a name="ref.WeatherCommunications"></a>
<h2>WeatherCommunications</h2>

<div style="background: black; color: white;">
<pre>
<font color="#8080ff"><b>#include </b></font><font color="#ff40ff"><b>&lt;math.h&gt;</b></font>
<font color="#8080ff"><b>#include </b></font><font color="#ff40ff"><b>&lt;string&gt;</b></font>
<font color="#8080ff"><b>#include </b></font><font color="#ff40ff"><b>&lt;vector&gt;</b></font><br/>
<font color="#8080ff"><b>#include </b></font><font color="#ff40ff"><b>&lt;sstream&gt;</b></font>
<font color="#8080ff"><b>#include </b></font><font color="#ff40ff"><b>&lt;set&gt;</b></font>
<font color="#8080ff"><b>#include </b></font><font color="#ff40ff"><b>&lt;map&gt;</b></font><br/>

<font color="#ffff00"><b>using</b></font> <font color="#00ff00"><b>namespace</b></font> std;

<font color="#00ff00"><b>class</b></font> WeatherCommunications
{
<font color="#ffff00"><b>public</b></font>:
    <font color="#00ff00"><b>int</b></font> lowestCostToSecure(vector &lt;<font color="#00ff00"><b>int</b></font>&gt; a, vector &lt;<font color="#00ff00"><b>int</b></font>&gt; b, vector &lt;string&gt; c);
};

<font color="#00ff00"><b>typedef</b></font> pair&lt;<font color="#00ff00"><b>int</b></font>, <font color="#00ff00"><b>int</b></font>&gt; Pt;

<font color="#00ff00"><b>struct</b></font> Edge : <font color="#ffff00"><b>public</b></font> pair&lt;<font color="#00ff00"><b>int</b></font>, <font color="#00ff00"><b>int</b></font>&gt;
{
    Edge(<font color="#00ff00"><b>int</b></font> a, <font color="#00ff00"><b>int</b></font> b) : pair&lt;<font color="#00ff00"><b>int</b></font>, <font color="#00ff00"><b>int</b></font>&gt;(a &lt;? b, a &gt;? b) { }
    Edge(<font color="#00ff00"><b>const</b></font> Edge &amp;e) : pair&lt;<font color="#00ff00"><b>int</b></font>, <font color="#00ff00"><b>int</b></font>&gt;(e.first, e.second) { }
};

vector&lt;Pt&gt; pts; <font color="#00ffff"><b>// the list of input points</b></font>
vector&lt;Edge&gt; edges; <font color="#00ffff"><b>// the list of all possible edges</b></font>
set&lt;Edge&gt; existing; <font color="#00ffff"><b>// the set of edges that already exist</b></font>
map&lt;<font color="#00ff00"><b>int</b></font>, map&lt;<font color="#00ff00"><b>int</b></font>, <font color="#00ff00"><b>double</b></font>&gt; &gt; costs;  <font color="#00ffff"><b>// a mapping of location -&gt; location -&gt; distance</b></font>
<font color="#00ff00"><b>unsigned</b></font><br/> n, ne; <font color="#00ffff"><b>// number of points, number of possible edges</b></font><br/>

<font color="#00ffff"><b>// Measures the cost of a particular combination of edges</b></font>
<font color="#00ff00"><b>double</b></font> measure(<font color="#00ff00"><b>unsigned</b></font> combo)
{
    <font color="#00ff00"><b>double</b></font> cost = <font color="#ff40ff"><b>0</b></font>;

    <font color="#ffff00"><b>for</b></font>(<font color="#00ff00"><b>unsigned</b></font> i = <font color="#ff40ff"><b>0</b></font>; i &lt; ne; i++) {
        <font color="#ffff00"><b>if</b></font>(combo &amp; (<font color="#ff40ff"><b>1</b></font> &lt;&lt; i)) {
            <font color="#ffff00"><b>if</b></font>(existing.find(edges[i]) == existing.end()) {
                cost += costs[edges[i].first][edges[i].second];
            }
        }
    }
    <font color="#ffff00"><b>return</b></font> cost;
}

<font color="#00ffff"><b>// Perform a depth-first search, starting from x, avoiding y,</b></font><br/>
<font color="#00ffff"><b>// using edges in eset, storing visited vertices in vis</b></font><br/>
<font color="#00ff00"><b>void</b></font> dfs(<font color="#00ff00"><b>unsigned</b></font> x, <font color="#00ff00"><b>unsigned</b></font> y, set&lt;Edge&gt; &amp;eset, set&lt;<font color="#00ff00"><b>int</b></font>&gt; &amp;vis)
{
    vis.insert(x);
    <font color="#ffff00"><b>for</b></font>(<font color="#00ff00"><b>unsigned</b></font> i = <font color="#ff40ff"><b>0</b></font>; i &lt; n; i++) {
        <font color="#ffff00"><b>if</b></font>(i != y &amp;&amp; vis.find(i) == vis.end() &amp;&amp; eset.find(Edge(x, i)) != eset.end()) {
            dfs(i, y, eset, vis);
        }
    }
}

<font color="#00ffff"><b>// Determine if a particular combination is secure</b></font>
<font color="#00ff00"><b>bool</b></font> valid(<font color="#00ff00"><b>unsigned</b></font> combo)
{
    set&lt;Edge&gt; eset;

    <font color="#00ffff"><b>// Build the set of edges defined by this combination</b></font>
<font color="#ffff00"><b>for</b></font>(<font color="#00ff00"><b>unsigned</b></font> i = <font color="#ff40ff"><b>0</b></font>; i &lt; ne; i++) {
        <font color="#ffff00"><b>if</b></font>(combo &amp; (<font color="#ff40ff"><b>1</b></font> &lt;&lt; i)) {
            eset.insert(edges[i]);
        }
    }
    <font color="#ffff00"><b>for</b></font>(<font color="#00ff00"><b>unsigned</b></font> i = <font color="#ff40ff"><b>0</b></font>; i &lt; n; i++) {   <font color="#00ffff"><b>// i is starting vertex</b></font><br/>
<font color="#ffff00"><b>for</b></font>(<font color="#00ff00"><b>unsigned</b></font> j = <font color="#ff40ff"><b>0</b></font>; j &lt; n; j++) { <font color="#00ffff"><b>// j is removed vertex</b></font>
<font color="#ffff00"><b>if</b></font>(j != i) {
                set&lt;<font color="#00ff00"><b>int</b></font>&gt; vis;

                dfs(i, j, eset, vis);
                <font color="#ffff00"><b>if</b></font>(vis.size() != n - <font color="#ff40ff"><b>1</b></font>) {
                    <font color="#ffff00"><b>return</b></font> <font color="#ff40ff"><b>false</b></font>;
                }
            }
        }
    }
    <font color="#ffff00"><b>return</b></font> <font color="#ff40ff"><b>true</b></font>;
}

<font color="#00ff00"><b>double</b></font> dist(<font color="#00ff00"><b>const</b></font> Pt &amp;a, <font color="#00ff00"><b>const</b></font> Pt &amp;b)
{
    <font color="#00ff00"><b>double</b></font> dx = a.first - b.first;
    <font color="#00ff00"><b>double</b></font> dy = a.second - b.second;

    <font color="#ffff00"><b>return</b></font> sqrt(dx * dx + dy * dy);
}

<font color="#00ff00"><b>int</b></font> WeatherCommunications::lowestCostToSecure(vector&lt;<font color="#00ff00"><b>int</b></font>&gt; xs, vector&lt;<font color="#00ff00"><b>int</b></font>&gt; ys, vector&lt;string&gt; already)
{
    n = xs.size();
    ne = n * (n - <font color="#ff40ff"><b>1</b></font>) / <font color="#ff40ff"><b>2</b></font>;

    <font color="#ffff00"><b>for</b></font>(<font color="#00ff00"><b>unsigned</b></font> i = <font color="#ff40ff"><b>0</b></font>; i &lt; n; i++) {
        Pt pt(xs[i], ys[i]);

        pts.push_back(pt);
    }

    <font color="#00ff00"><b>double</b></font> best = <font color="#ff40ff"><b>0</b></font>;

    <font color="#ffff00"><b>for</b></font>(<font color="#00ff00"><b>unsigned</b></font> i = <font color="#ff40ff"><b>0</b></font>; i &lt; n; i++) {
        <font color="#ffff00"><b>for</b></font>(<font color="#00ff00"><b>unsigned</b></font> j = i + <font color="#ff40ff"><b>1</b></font>; j &lt; n; j++) {
            edges.push_back(Edge(i, j));
            costs[i][j] = dist(pts[i], pts[j]);
            best += costs[i][j];
        }
    }

    <font color="#ffff00"><b>for</b></font>(vector&lt;string&gt;::const_iterator i = already.begin(); i != already.end(); i++) {
        stringstream ss(*i);
        <font color="#00ff00"><b>int</b></font> a, b;

        ss &gt;&gt; a &gt;&gt; b;

        existing.insert(Edge(a, b));
    }

    <font color="#ffff00"><b>for</b></font>(<font color="#00ff00"><b>int</b></font> i = <font color="#ff40ff"><b>1</b></font>; i &lt; (<font color="#ff40ff"><b>1</b></font> &lt;&lt; ne); i++) {
        <font color="#ffff00"><b>if</b></font>(valid(i)) {
            best &lt;?= measure(i);
        }
    }

    <font color="#ffff00"><b>return</b></font> (<font color="#00ff00"><b>int</b></font>) best;
}

</pre>
</div>
         
<IMG SRC="/i/m/Logan_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;Logan<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/stat?c=member_profile&amp;cr=112902" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
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
    <TD WIDTH="4" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  <!-- Right Column Begins -->
    <TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- <A HREF="/?&amp;t=sponsor&amp;c=link&amp;link=http://idenphones.motorola.com/iden/developer/developer_home.jsp&amp;refer=srm98"><IMG SRC="/i/motorola_sidebar1.gif" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A>
<A href="Javascript:sponsorLinkWindow('/?&amp;t=sponsor&amp;c=link&amp;link=/contest/citrix/index.html&amp;refer=srm91_room1','Citrix','1','1','680','489')"><img src="/i/citrix_sidebar.jpg" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A><BR/>
<A HREF="/index?t=schedule&amp;c=tourny_sched"><IMG SRC="/i/tournament/sun_small_banner2.gif" ALT="" WIDTH="170" HEIGHT="84" BORDER="0"/></A> -->
<!-- Right Column Include Begins -->        
        <xsl:call-template name="public_right_col"/>        
<!-- Right Column Include Ends -->        
        </TD>
  <!-- Right Column Ends -->
  <!-- Gutter -->
    <TD WIDTH="10" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  </TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>
