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
<B>Single Round Match 121</B><BR/>
Tuesday, November 26, 2002
<P><B>Problem Set Analysis &amp; Opinion</B></P>


<font size="+2">
  <b>ConvertBase</b>
</font>
<BR/>

    Used as: Division-II, Level 1:<blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">250 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">148 / 198 (74.75%)
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">72 / 148 (45.68%)
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>goongas</b> for 244.10 points
                </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Average Points</b>
        </td>
        <td style="background: #eee;" class="bodyText">175.94</td>
      </tr>      
    </table>
  </blockquote>
  
<P>
This one's actually a bit tricky if you don't know how to do it. While C++
has functions for turning a base-N string into an int, it doesn't have one
for the other way around. I don't know about the other languages, but I
presume they're much the same. The trick to this one is that it's much
easier to generate the string backwards than it is to generate it forwards.
You want to take the number and extract the smallest digit (using modulus),
adding that digit to your string. Then divide the number by the radix,
basically pushing the smallest digit off the bottom, and repeat until it
reaches 0. Reverse the string and return it. There's a pair of special cases
you need to look out for - if the number is negative, you'll need to add a -
on the beginning (or the end, before you reverse it.) Also, if the number is
0, you'll have to do that manually. A function for doing base 2 through 10
would look like
</P>

<PRE>
string convert( int x, int radix ) {
 if( x == 0 )
  return "0";
 bool isnegative;
 if( x &lt; 0 ) {
  isnegative = true;
 } else {
  isnegative = false;
 }
 string accumulator;
 while( x != 0 ) {
  accumulator += ( x % radix ) + '0';
  x = x / radix;
 }
 if( isnegative )
  accumulator += '-';
 reverse( accumulator );
 return accumulator;
};
</PRE>

<P>
or something similar. Obviously this won't handle 11 and up, but that's a
matter of doing something just a little more complex than ( x % radix ) +
'0'; - personally I'd make a small function to return the character
representation of a specific digit.
</P>

<p>&#160;</p>

<font size="+2">
  <b>TicTacToe3D</b>
</font>
<BR/>

    Used as: Division-II, Level 2 &amp; Division-I, Level 1:<blockquote>
    <table cellspacing="2">
	<tr>
        <td style="background: #eee;" class="bodyText" colspan="2">
          <b>Div-II stats</b>
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">500 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">106 / 198 (53.56%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">83 / 106 (78.30%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>Anguissette</b> for 499.04 points
                </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Average Points</b>
        </td>
        <td style="background: #eee;" class="bodyText">363.37</td>
      </tr>      
    </table>
	<BR/>
	 <table cellspacing="2">
	<tr>
        <td style="background: #eee;" class="bodyText" colspan="2">
          <b>Div-I stats</b>
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">250 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">76 / 90 (84.44%)
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">74 / 76 (97.37%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>ZorbaTHut</b> for 249.23 points
                </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Average Points</b>
        </td>
        <td style="background: #eee;" class="bodyText">207.33</td>
      </tr>       
    </table>
  </blockquote>
<P>
Yeah. Just look at those high scores. I did one of them and I still don't
believe it.
</P>

<P>
Visualize a cube. It's N units wide on each side. We have N Xs to use, and
we need to span the entire cube. Obviously we're going to be barely reaching
from one side to the other on every single one.
</P>

<P>
Now, first we've got the pure straight lines, reaching from one face to the
opposing face. There are 6 faces on a cube, but we ignore half of them,
because any line is going to be touching two. On each face we can start at
N^2 locations (since the face is, after all, square). So that's n * n * 3.
</P>

<P>
Then we've got diagonal lines, reaching from one edge to the opposing edge.
A cube has 12 edges (four on the top, four on the bottom, four in the
middle) and once again, we're going to be using two of them for each line.
Each edge has N locations we can start at. n * 6.
</P>

<P>
Last, there are the really-diagonal lines (for lack of a better term),
reaching from one corner to the opposing corner. A cube has eight corners
(four on the top, four on the bottom) and again, each line touches two of
them. Let's just add 4 here.
</P>

<P>
We end up with the equation 4 + n * 6 + n * n * 3, which works in every
situation but the one where it's a 1x1x1 cube. That one's a special case, so
just test for it and return 1.
</P>

<P>
And that's the entire solution. I solved it quickly because I'd been
thinking about it from the 2001 invitational - it was an efficiency deal in
that case, not a calculation - and I happened to remember it. I'd be
surprised if Anguissette didn't do the same thing, and rather impressed,
actually.
</P>



  <font size="+2">
  <b>NumCombine</b>
</font>
<BR/>

    Used as: Division-II, Level 3 &amp; Division-I, Level 2:<blockquote>
    <table cellspacing="2">
	<tr>
        <td style="background: #eee;" class="bodyText" colspan="2">
          <b>Div-II stats</b>
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">250 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">28 / 198 (14.14%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">8 / 28 (28.57%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>ishan_ritchie</b> for 651.57 points
                </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Average Points</b>
        </td>
        <td style="background: #eee;" class="bodyText">548.15</td>
      </tr>      
    </table>
	<BR/>
	 <table cellspacing="2">
	<tr>
        <td style="background: #eee;" class="bodyText" colspan="2">
          <b>Div-I stats</b>
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">500 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">49 / 90 (54.44%)
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">31 / 49 (63.27%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>Yarin</b> for 468.28 points
                </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Average Points</b>
        </td>
        <td style="background: #eee;" class="bodyText">334.08</td>
      </tr>       
    </table>
  </blockquote>
<P>
This problem was one of those that's very easy to overcomplicate, as well as
being quite easy to undercomplicate. You can easily generate every possible
string and then parse it out and calculate it - unfortunately you'll time
out on the parsing, unless you do it extremely efficiently. The best
solution (I believe) is to write a recursive function with four parameters -
the digit you're currently looking at, an accumulator for the running total,
another accumulator for the current number you're creating, and a sign
multiplier, used for making the next operation positive or negative. The
base case for your recursive function is when it's finished with all the
digits. It should add the current-number times the sign multiplier to the
running total, compare it to the target, and increment your global counter
if the test works. Otherwise, you've got three cases - "continue with this
number", "add this number and start the next one positive", and "add this
number and start the next one negative". Take a look at Yarin's solution for
a good example of this, or mine if you ignore the minor logic problem (the
test is &lt;=, not &lt;, and the examples didn't catch it. Not my finest moment.)
</P>

<P>
The only other thing to watch out for is to make sure you have 64-bit
integers in the important places, since the Big Number can be up to 15
digits long, and a 32-bit number can overflow at 10.
</P>

<P>
Some people might think that the "sign" variable in the recursive function
isn't necessary, since you can just choose positive-or-negative when you add
it to the accumulator. However, if you don't keep track of the sign, you
have the new (and slightly harder) problem of making sure you don't
accidentally subtract the first number instead of adding it - you're not
given a choice on this one.
</P>


  <font size="+2">
  <b>LinAlg</b>
</font>
<BR/>

    Used as: Division-I Level 3:<blockquote>
    <table cellspacing="2">
	<tr>
        <td style="background: #eee;" class="bodyText" colspan="2">
          <b>Div-II stats</b>
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">1000 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">19 / 90 (21.11%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">1 / 19 (5.26%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>Yarin</b> for 675.25 points
                </td>
      </tr>     
    </table>
</blockquote>
<P>
It probably says something when the only person who solves a problem is
someone who had the code prewritten, and they *still* only got about
two-thirds of the maximum value. On the other hand, a lot of the carnage on
this problem was caused by a problem description that only stated
"whitespace". Most of the time the problems only specify the space
character, and in fact, getting any other whitespace character into the
testing window takes a little doing. However, this is exactly what lars did,
providing a testcase that included a tab character, and probably accounting
for a good half of the submission failures.
</P>

<P>
Anyone who's taken linear algebra will recognize this, and probably know how
to do it. As I did horribly at linear algebra, I'm probably not the right
one to be explaining this. But here goes anyway.
</P>

<P>
Your first step should be to get the equations into a standard format - 2x +
3y + -4z = 9, where all the variables are on one side and the constant is on
the other side. While annoying, this isn't hard - split the equation at the
= point, parse them both into some handy data structure, and basically
subtract one from the other, then invert the constant. (Actually, for the
purposes of this problem you really don't have to invert the constant, but
I'm explaining this in terms of actually solving the problem.)
</P>

<P>
At this point you'd want to turn it into a matrix. Use one column for each
variable, as well as one for the constant, and one row for each equation.
From here you want to choose a single row with a value in the first column,
swap it with whatever's in the top row, and subtract it from all the other
rows below it however many times is necessary to zero out their first
column. Repeat this with the second column and a new row (moving it to the
second-to-top row) and so on, for all except the last column (the "constant"
column). This is an oversimplification, unfortunately, there's a lot of
subtlety that you could use for picking which rows. Plus you might find that
you don't have any remaining rows with a value in that column - but in that
case, you can just return 10, since that means an infinite number of
results.
</P>

<P>
Once you've done all those processes, you also want to look through the rest
of the rows. Each row will have all its variables 0, but if there's a
nonzero constant (representing something on the order of "0 = 15") obviously
there are no solutions, and return 0.
</P>

<P>
If you've gotten past both of these tests, there's only one solution. Return
1.
</P>

<P>
As for a proof for why this works, that's beyond me - that's linear algebra,
and I don't feel like reproving matrix math ;) There are plenty of websites
around, and if you're interested - it's a large subject, and has a lot of
ramifications in geometry also - take a class in it. But I'm not going to
say much more about it.
</P>

<P>
The only thing I *am* going to say is that I've been cheerfully mentioning a
"matrix". I haven't really talked about what data type it should be. It's
probably telling that Yarin used a fraction class with long longs. I suspect
you could pull it off with long double and appropriate epsilon constants,
but I'm not sure. This is the sort of thing that could easily destabilize
and blow your integers completely out of bounds, and only the low factors
(-10 to 10) made it possible with long longs.
</P>

<P>
This is why I have a prebuilt fraction class, and why I'm going to write a
bigint class one of these days. Those of you who actually *have* bigint
classes in your language libraries . . . learn to use them!
</P>


  
<IMG SRC="/i/m/ZorbaTHut_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;ZorbaTHut<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=152347" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
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