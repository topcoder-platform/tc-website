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
<B>Single Round Match 129</B><BR/>
Tuesday, January 14, 2003
<P><B>Problem Set Analysis &amp; Opinion</B></P>


<font size="+2"><b>Revenue</b></font><BR/>
Used as: Division-II, Level 1:

<blockquote>
<table cellspacing="2">
<tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">250</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">75 / 175  (42.86%) </td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">58 / 75  (77.33%)</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>Yi Zhang</b> for 244.56 points</td></tr>
</table>
</blockquote>

<P>Reference implementation: <i>see below</i></P>

<h4>Implementation</h4>

<p>The hardest part of the problem is maybe to understand the formulas. We want to maximize the product <i>p</i> * <i>q</i>, where <i>p</i> = <i>a</i> - <i>b</i> * <i>q</i> and <i>p</i> and <i>q</i> must both be non-negative integers. As usual with Div-II level 1 problems, it's enough to test all valid values of <i>p</i> and <i>q</i>, calculate the product, and check if it's better than the previous best known result. It's more natural to have <i>q</i> as the loop index, as for every integer <i>q</i> we get an integer <i>p</i> from the given formula. We must also not forget the tiebreaker - if we find that <i>p</i> * <i>q</i> is the same as some previous best result, we should select the highest <i>p</i>.</p>

<font size="+2"><b>Circles</b></font><BR/>
Used as: Division-II, Level 2:

<blockquote>
<table cellspacing="2">
<tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">550</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">69 / 175  (39.43%) </td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">37 / 69  (53.62%)</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>Karshikinpa</b> for 502.96 points</td></tr>
</table>
</blockquote>

<P>Reference implementation: <i>see below</i></P>

<h4>Implementation</h4>

<p>The easiest way to <i>not</i> screw this one up is to avoid using the less-than and greater-than operators when comparing the points. The only essential check we need is to determine whether two points are equal (i.e. the angles are the same). This is the case if, and only if, the difference between the two angles is a multiple of 360. That is, if the difference modulo 360 is 0.</p>

<p>Having realized that, all we have to do is walk around the circle, increasing the current position with 1 until we've reached the end. After every increase, loop through all points and check if we stand at any of them using the equality check mentioned above. If we find out that we stand at a point, append the name of the point to a list of visited points (an initially empty string). We never have to worry about including the same point several times since we will never walk around the circle more than one revolution.</p>

<p>Most of the failed submissions seems to be related to people adjusting the angles so they are between 0 and 359 inclusive, but then failing the wrap-around during the actual walk. Another pitfall is that doing a simple <i>x</i> % 360 will not work because if <i>x</i> is negative, <i>x</i> % 360 is also negative (or 0). This can be worked around by doing something like ((<i>x</i> % 360) + 360) % 360, but that's a bit ugly...</p>

<font size="+2"><b>Multiplier</b></font><BR/>
Used as: Division-II, Level 3:

<blockquote>
<table cellspacing="2">
<tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">1050</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">46 / 175  (26.29%) </td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">24 / 46  (52.17%)</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>Yi Zhang</b> for 963.20 points</td></tr>
</table>
</blockquote>

Used as: Division-I, Level 1:

<blockquote>
<table cellspacing="2">
<tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">300</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">75 / 100  (75.00%) </td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">73 / 75  (97.33%)</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>ZorbaTHut</b> for 293.33 points</td></tr>
</table>
</blockquote>

<P>Reference implementation: <i>see below</i></P>

<h4>Implementation</h4>

<p>Given an amount, and in what sector the amount is spent, we should determine the total amount of money that is spent again. This is a recursive process, so it's natural to think of a recursive solution. We are assured that the recursion will terminate because not all money are "recycled". The number of recursive calls will not be too many, because for every call at least some money will not be reused, so the complexity is O(N).</p>

<p>If not for the fact that the initial amount should <i>not</i> be counted, the actual implementation could have been a recursive solution in one line, something rarely seen.</p>

<font size="+2"><b>LeanTo</b></font><BR/>
Used as: Division-I, Level 2:

<blockquote>
<table cellspacing="2">
<tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">600</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">37 / 100  (37.00%) </td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">15 / 37  (40.54%)</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>Yarin</b> for 569.87 points</td></tr>
</table>
</blockquote>

<P>Reference implementation: <i>see below</i></P>

<h4>Implementation</h4>

<p>This is a geometry problem that can be solved algebraically; however that will include solving some tricky equations requiring more math knowledge than I possess. But the problem statement kindly stated the intended approach: binary search.
A lower limit of the height is, of course, 0, and an upper limit is storageRoof.
By iteratively selecting the midpoint between the lower and upper limit, finding out  whether it's too high or too low, we adjust the endpoints accordingly. We should repeat this process until the precision becomes good enough. A small trick here is to just repeat the process a fixed number of times, say 1000. After that, the range, which was originally at most 30000, is 30000*2<sup>-1000</sup>, a <i>very</i> small number.</p>

<p>To determine whether the height is too low or too high, we use Pythagoras formula and the formula for similar triangles:</p>

<pre>
                         /|  -|
                        / |   |
    storageRoof        /  |   |
               \      /   |   |
                \/\  /    |   |
                /   /|    |   |-----extHt
               /   / |-x  |   |
                \ /__|____|  -|

                  |__||___|
                   |   |
                   y  livingWidth
</pre>

<p>x is the height that we binary search. In the figure above, the following two formulas are valid:</p>

<pre>
(1) y = sqrt(storageRoof*storageRoof-x*x)
(2) x/y = extHt/(y+livingWidth)
</pre>

<p>If x is less than the correct height (there is only one unique answer), the left hand side of (2) will be less than the right hand side. If so, we set the lower limit for the binary search to x, otherwise we change the upper limit.</p>

<p>The answer should then be rounded appropriately. As a C++ coder, this is no problem as sprintf automatically rounds correctly. The only thing you have to watch out for is that if the answer is less than 1, the output should start with the decimal point and not a zero.</p>

<font size="+2"><b>StripMine</b></font><BR/>
Used as: Division-I, Level 3:

<blockquote>
<table cellspacing="2">
<tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">950</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">17 / 100  (17.00%) </td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">7 / 17  (41.18%)</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>Yarin</b> for 750.72 points</td></tr>
</table>
</blockquote>

<P>Reference implementation: <i>see below</i></P>

<h4>Implementation</h4>

<p>The trick here is to realize that to decide the optimal digging depth at a certain column, we are only dependent on three parameters: the current column, the depth we dug at the last column (this sets a valid range for the current column) and how many more squares we may excavate. It's not necessary to know the depth of even more previous columns.</p>

<p>We can define a recursive function based on this, all according to the style explained by <b>radeye</b> in his excellent feature article about functional programming, and then evaluate the function using dynamic programming (caching the results) so it doesn't grow exponential. Given the three parameters, the function should return the maximum amount we can earn by digging this column and the remaining columns under the given constraints.</p>

<p>To evaluate the function, we test all valid digging depths for the current column (and make sure we can excavate this many more squares!) based on the previous column. On the first column and last column, the only valid digging depths is 0 to 3, inclusive, otherwise we loop from the last columns depth - 3 to the last columns depth + 3 (inclusive). For each of these heights, we sum up the earnings of this column (can be precalced for every column) and add with the result of the recursive call that takes care of the remaining columns.</p>

<p>Personally I think it's easiest (fastest!) to implement a recursive solution with caching, which is what I did in the actual contest, but afterwards I often change it to an iterative solution. The only difference is that the iterative solution evaluates the recursive function in the correct order, starting at the "bottom" and going up. An iterative solution is usually both faster and cleaner. The reference implementation below is an iterative solution; for a recursive solution, see my submission in the actual contest.</p>


<h1>Reference Implementations</h1>

<font size="+2"><b>Revenue</b></font><BR/>
<pre>
<b>class</b> Revenue {
    <b>public</b>:
    <b>int</b> bestPrice(<b>int</b> a, <b>int</b> b) {
        <b>int</b> best=0,bestp=0;
        <b>for</b>(<b>int</b> q=0;q&lt;=a;q++) {
            <b>int</b> p=a-b*q;
            <b>if</b> (p&lt;=0) <b>continue</b>;
            <b>if</b> (p*q&gt;best || (p*q==best &amp;&amp; p&gt;bestp)) {
                best=p*q;
                bestp=p;
            }
        }
        <b>return</b> bestp;
    }
};
</pre>

<font size="+2"><b>Circles</b></font><BR/>

<pre>
<b>#include</b> &lt;string&gt;
<b>#include</b> &lt;vector&gt;

<b>using</b> <b>namespace</b> std;

<b>class</b> Circles {
    <b>public</b>:
    string visit(<b>int</b> start, <b>int</b> finish, vector &lt;<b>int</b>&gt; points) {
        string visited="";
        <b>while</b> ((start-finish)%360) {
            <b>for</b>(<b>int</b> i=0;i&lt;points.size();i++)
                <b>if</b> (!((points[i]-start)%360))
                    visited+=<b>char</b>('A'+i);
            start++;
        }
        <b>return</b> visited;
    }
};
</pre>

<font size="+2"><b>Multiplier</b></font><BR/>

<pre>
<b>#include</b> &lt;vector&gt;

<b>using</b> <b>namespace</b> std;

<b>class</b> Multiplier {
    <b>public</b>:

    <i>// a&gt;0: this is amount spent on goods</i><BR/>
    <i>// a&lt;0: this is amount spent on services (negated)</i><BR/>
    <b>int</b> doit(<b>int</b> a, vector &lt;<b>int</b>&gt; &amp;p)
    {
        <b>return</b> a&gt;0?
            a+doit(a*p[0]/100,p)+doit(-a*p[1]/100,p):
            a&lt;0?-a+doit(-a*p[2]/100,p)+doit(a*p[3]/100,p):
            0;
    }

    <b>int</b> spending(<b>int</b> amount, vector &lt;<b>int</b>&gt; percent)
    {
        <b>return</b> doit(amount,percent)-amount;
    }
};
</pre>

<font size="+2"><b>LeanTo</b></font><BR/>

<pre>

<b>#include</b> &lt;cmath&gt;
<b>#include</b> &lt;string&gt;

<b>using</b> <b>namespace</b> std;

<b>class</b> LeanTo {
    <b>public</b>:
    string height(<b>int</b> extHt, <b>int</b> livingWidth, <b>int</b> storageRoof) {
        <b>double</b> lo=0.0,hi=storageRoof,c,x;
        <b>for</b>(<b>int</b> i=0;i&lt;1000;i++) {
            x=(lo+hi)/2.0;
            c=sqrt(storageRoof*storageRoof-x*x);
            (x/c&lt;extHt/(c+livingWidth)?lo:hi)=x;
        }
        <b>char</b> s[10];
        spr<b>int</b>f(s,"%0.4lf",x);
        <b>return</b> s+(s[0]=='0');
    }
};
</pre>

<font size="+2"><b>StripMine</b></font><BR/>

<pre>
<b>#include</b> &lt;string&gt;
<b>#include</b> &lt;vector&gt;

<b>using</b> <b>namespace</b> std;

<b>class</b> StripMine {
    <b>public</b>:
    <b>int</b> maxProfit(<b>int</b> limit, vector &lt;string&gt; report) {
        <b>int</b> depth=report.size(),width=report[0].size();

        <i>// First calculate the profit of digging a</i><BR/>
        <i>// certain depth at a certain column</i><BR/>
        <b>int</b> dig[depth+1][width];
        <b>for</b>(<b>int</b> i=0;i&lt;width;i++) {
            dig[0][i]=0;
            <b>for</b>(<b>int</b> j=0;j&lt;depth;j++)
                dig[j+1][i]=dig[j][i]+<b>int</b>(report[j][i]-'A')-3;
        }

        <i>// Then calculate the max profit using induction over the remaining</i><BR/>
        <i>// columns, the height of the next column and the number of more</i><BR/>
        <i>// squares we can excavate</i>
        <b>int</b> tbl[width+1][depth+1][limit+1];

        <b>for</b>(<b>int</b> i=width;i&gt;=0;i--)
            <b>for</b>(<b>int</b> j=0;j&lt;=depth;j++)
                <b>for</b>(<b>int</b> k=0;k&lt;=limit;k++) {
                    <i>// Last column (i-1) was at depth j and</i><BR/>
                    <i>// we have k more squares to excavate</i><BR/>
                    <b>if</b> (i==width) {
                        tbl[i][j][k]=j&gt;3?-1000000:0;
                        <b>continue</b>;
                    }
                    <b>int</b> best=-1000000;                    
                    <b>for</b>(<b>int</b> h=0;h&lt;=depth;h++) {
                        <i>// Dig at height h in this column</i>
                        <b>if</b> (h&gt;k) <b>break</b>; <i><BR/>// Can't dig this much</i><BR/>
                        <b>if</b> (abs(h-j)&gt;3) <b>continue</b>; <i>// Too steep</i><BR/>
                        <b>int</b> v=tbl[i+1][h][k-h]+dig[h][i];
                        best&gt;?=v;
                    }
                    tbl[i][j][k]=best;
                }
        <b>return</b> tbl[0][0][limit];
    }
};
</pre>

<IMG SRC="/i/m/Yarin_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;Yarin<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/stat?c=member_profile&amp;cr=269554" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
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
		<TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><br/>
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


