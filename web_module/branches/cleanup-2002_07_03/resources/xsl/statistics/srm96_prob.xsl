<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>  
  <xsl:import href="../includes/stats/public_stats_left.xsl"/> 
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
        <xsl:call-template name="public_stats_left"/>
  <!-- Global Seconday Nav Ends -->      
<!-- Left Column Include Ends -->              
      </TD>
  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
    <TD CLASS="bodyText" WIDTH="100%" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="240" height="1" VSPACE="5" BORDER="0"/><BR/>
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
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm96_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/index?t=statistics&amp;c=editorial_archive" CLASS="bodyText">Editorial Archive</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm96_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Comments? Ideas?</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm96_prob" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
		</TR>
	    <!-- <TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm96_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
			<TD VALIGN="top" CLASS="bodyText">&#160;</TD>
		</TR> -->
		<TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>    		
		</TABLE>
		</TD>
	</TR>
 	<TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>
<!--end contextual links-->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="48" BORDER="0"/><BR/>
<!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">-->
<P><B>Single Round Match 96</B><BR/>
June 11, 2002</P>
<P><B>Problem Set Analysis &amp; Opinion</B></P>
<b>The Problems</b> <a name="Transform"></a>
<font size="2"><b>Transform</b></font>
<BR/>
<font size="2">Author:
        <a href="http://www.topcoder.com/stat?c=member_profile&amp;cr=157578">Radgast</a>
</font>
<BR/>
<font size="2">
    Used as: Division 2, Level 1:
    <blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;">
          <b>Value</b>
        </td>
        <td style="background: #eee;">300</td>
      </tr>
      <tr>
        <td style="background: #eee;">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;">344
    /
    411
    (83.7%)
</td>
      </tr>
      <tr>
        <td style="background: #eee;">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;">280
    /
    344
    (81.4%)
</td>
      </tr>
      <tr>
        <td style="background: #eee;">
          <b>High Score</b>
        </td>
        <td style="background: #eee;">
          <B>sql</B> for
            298.58 points
        </td>
      </tr>
    </table>
  </blockquote>
</font>
<font size="2">Reference implementation:
    <B>InsaneParadox</B>
</font>
<BR/>
<font size="2">Reference implementation:
    <B>Sleeve</B>
</font>
<BR/>
<b>Implementation</b>
<p>
                This problem consists of decomposing integers into their decimal digits and composing
                integers from decimal digits.  In general there are two approaches.  The first uses
                the division and modulus operators to extract the digits one at a time, and then uses
                multiplication and addition to rebuild the new integer.  The second approach converts
                an integer to its string representation so that string operations can be used, and then converts
                the resulting string back to an integer.
            </p>
<p>
                For the first approach, one can
                remove the ones digit from an input number and append it to an output number.  The
                ones digit is obtained by computing the input number modulo 10 (using the <tt>%</tt>
                operator), after which the input number is shifted to the right in base 10 by one
                (by dividing by 10 using integral division).  A digit is appended to the output
                number by shifting the output number to the left in base 10 (by multiplying by 10)
                and adding the digit.  A good example of this approach is
                <B>InsaneParadox</B>'s implementation.
            </p>
<p>
                For the second approach, simply convert the integer to a decimal string representation using whatever facility
                one's language provides.  In Java, this would be <tt>String buf = new StringBuffer(x)</tt>.  In
                C++, this would be <tt>char buf[16]; sprintf(buf, "%d", x);</tt>.  Then perform a reverse
                operation on the string (provided by the string representation in each language) and convert
                it back to an integer.  In Java this is <tt>Integer.parseInt(buf.toString())</tt> and in C++
                this is <tt>atoi(buf)</tt>.  A good example of this approach is <B>Sleeve</B>'s implementation.
            </p>
<p>&#160;</p>
<a name="Whiners"></a>
<font size="2">
  <b>Whiners</b>
</font>
<BR/>
<font size="2">Author:
        <a href="http://www.topcoder.com/stat?c=member_profile&amp;cr=251335">Echo</a>
</font>
<BR/>
<font size="2">
    Used as: Division 1, Level 1:
    <blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;">
          <b>Value</b>
        </td>
        <td style="background: #eee;">275</td>
      </tr>
      <tr>
        <td style="background: #eee;">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;">222
    /
    237
    (93.67%)
</td>
      </tr>
      <tr>
        <td style="background: #eee;">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;">201
    /
    222
    (90.54%)
</td>
      </tr>
      <tr>
        <td style="background: #eee;">
          <b>High Score</b>
        </td>
        <td style="background: #eee;">
          <B>kv</B> for
            270.43 points
        </td>
      </tr>
    </table>
  </blockquote>
</font>
<font size="2">
    Used as: Division 2, Level 2:
    <blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;">
          <b>Value</b>
        </td>
        <td style="background: #eee;">650</td>
      </tr>
      <tr>
        <td style="background: #eee;">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;">228
    /
    411
    (55.47%)
</td>
      </tr>
      <tr>
        <td style="background: #eee;">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;">158
    /
    228
    (69.3%)
</td>
      </tr>
      <tr>
        <td style="background: #eee;">
          <b>High Score</b>
        </td>
        <td style="background: #eee;">
          <B>theoddone33</B> for
            597.83 points
        </td>
      </tr>
    </table>
  </blockquote>
</font>
<font size="2">Reference implementation:
    <B>kv</B>
</font>
<BR/>
<B>Implementation</B>
<p>
                The first step is to sort all the referenced times chronologically.
                This could be done by putting them all in some sort of array and sorting it,
                or constructing a boolean array of length 1001 that represents which times
                were referenced in the input.
            </p>
<p>
                Next, initialize a counter to zero and iterate through the referenced times.
                For each time, increment the counter and then <em>skip</em> any of the times
                following it that are within 15 minutes (inclusive) of that time.  Once all
                referenced times have been processed in this fashion, the counter will hold
                the appropriate value to return.
            </p>
<p>&#160;</p>
<a name="Tournament"></a>
<font size="2">
  <b>Tournament</b>
</font>
<BR/>
<font size="2">Author:
        <a href="http://www.topcoder.com/stat?c=member_profile&amp;cr=157578">Radgast</a>
</font>
<BR/>
<font size="2">
    Used as: Division 2, Level 3:
    <blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;">
          <b>Value</b>
        </td>
        <td style="background: #eee;">900</td>
      </tr>
      <tr>
        <td style="background: #eee;">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;">181
    /
    411
    (44.04%)
</td>
      </tr>
      <tr>
        <td style="background: #eee;">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;">158
    /
    181
    (87.29%)
</td>
      </tr>
      <tr>
        <td style="background: #eee;">
          <b>High Score</b>
        </td>
        <td style="background: #eee;">
          <B>Ishi</B> for
            759.37 points
        </td>
      </tr>
    </table>
  </blockquote>
</font>
<font size="2">Reference implementation:
    <B>maikuru</B>
</font>
<BR/>
<B>Summary</B>
<p>
                This is a neat little problem that initially requires some thinking.  However, a little thought
                eventually leads to a very trivial and compact solution.
            </p>
<B>Implementation</B>
<p>
                The solution to this problem consists of two parts.  The first is computing the smallest power of two
                that is greater than or equal to the number of coders (which we will call <i>n</i>).  This part is
                easy.  We initialize a counter to <tt>1</tt> and left-shift it by <tt>1</tt> (using the <tt>&lt;&lt;</tt> operator)
                while it is less than <i>n</i> (the left-shift is equivalent to multiplication by <tt>2</tt>).  Let us call this
                number <i>z</i>, giving twice the number of coders we will have in the next round.
            </p>
<p>
                The second part is a little trickier.  Basically, we want to find the values <i>x</i> and <i>y</i>, such that the following hold:
            </p>
<a name="eq1"></a>
<div style="float: right; width: 20px;">
        (1)
    </div>
<table align="center">
  <tr valign="center">
    <td>x + y = n</td>
  </tr>
</table>
<div style="clear: both">&#160;</div>
<a name="eq2"></a>
<div style="float: right; width: 20px;">
        (2)
    </div>
<table align="center">
  <tr valign="center">
    <td>x/2 + y = z/2</td>
  </tr>
</table>
<div style="clear: both">&#160;</div>
<p>
                The value <i>x</i> represents the number of coders that compete in the first round, and the value <i>y</i>
                represents the number of coders that are given byes.  We get 
    (<a href="#eq1">1</a>)
 from the constraint that
                <i>n</i> coders must be decomposed into <i>x</i> competitors and <i>y</i> bystanders in the first round.
                We get 
    (<a href="#eq2">2</a>)
 from the constraint that <i>x</i>
  <tt>/2</tt> and <i>y</i> coders will remain in the second
                round, and our target number of coders in the second round is <i>z</i>
  <tt>/2</tt>.  By subtracting 
    (<a href="#eq2">2</a>)

                from 
    (<a href="#eq1">1</a>)
, we get
            </p>
<a name="eq3"></a>
<div style="float: right; width: 20px;">
        (3)
    </div>
<table align="center">
  <tr valign="center">
    <td>x = 2n - z</td>
  </tr>
</table>
<div style="clear: both">&#160;</div>
<p>
                We can now use 
    (<a href="#eq1">1</a>)
 to solve for <i>y</i>:
            </p>
<a name="eq4"></a>
<div style="float: right; width: 20px;">
        (4)
    </div>
<table align="center">
  <tr valign="center">
    <td>y = n - x = z - n</td>
  </tr>
</table>
<div style="clear: both">&#160;</div>
<p>
                We know <i>z</i> and <i>n</i>, and we can now see that finding <i>y</i> is absolutely trivial.  It is now just a matter
                of using a <a href="http://planetmath.org/encyclopedia/StableSortingAlgorithm.html" class="bodyGeneric" target="_blank">stable sorting algorithm</a>
                to sort the coders and return the handles of the first <i>y</i>.  If <i>y</i>
  <tt> = 0</tt>, we return the fact that no
                byes are needed.
            </p>
<p>&#160;</p>
<a name="Stoich"></a>
<font size="2">
  <b>Stoich</b>
</font>
<BR/>
<font size="2">Author:
        <a href="http://www.topcoder.com/stat?c=member_profile&amp;cr=251335">Echo</a>
</font>
<BR/>
<font size="2">
    Used as: Division 1, Level 1:
    <blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;">
          <b>Value</b>
        </td>
        <td style="background: #eee;">550</td>
      </tr>
      <tr>
        <td style="background: #eee;">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;">120
    /
    237
    (50.63%)
</td>
      </tr>
      <tr>
        <td style="background: #eee;">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;">57
    /
    120
    (47.5%)
</td>
      </tr>
      <tr>
        <td style="background: #eee;">
          <b>High Score</b>
        </td>
        <td style="background: #eee;">
          <B>ZorbaTHut</B> for
            396.86 points
        </td>
      </tr>
    </table>
  </blockquote>
</font>
<font size="2">Reference implementation:
    <B>ZorbaTHut</B>
</font>
<BR/>
<font size="2">Reference implementation:
    <B>SnapDragon</B>
</font>
<BR/>
<B>Algorithm</B>
<p>
                The key to understanding this problem is to frame it as a linear algebra problem.
                Each molecule can be represented as a vector by arbitrarily assigning rows uniquely
                to each of the elements.  We are given vectors <b>x</b>, <b>y</b>, and <b>z</b>,
                and we are asked to determine whether a unique set of constants <i>a</i>, <i>b</i>, and <i>c</i>
                exists that satisfies the equation <i>a</i>
  <b>x</b> + <i>b</i>
  <b>y</b> = <i>c</i>
  <b>z</b>.
                (I will always designate vectors in <b>boldface</b> and scalars in <i>italics</i>).
            </p>
<p>
                There are multiple ways we can solve this problem.  The first is by
                <a href="http://planetmath.org/encyclopedia/GaussianElimination.html" class="bodyGeneric" target="_blank">Gaussian elimination</a>.
                The problem is equivalent to solving for
            </p>
<a name="eq5"></a>
<div style="float: right; width: 20px;">
        (5)
    </div>
<table align="center">
  <tr valign="center">
    <td>
                </td>
    <td>
      <table cellspacing="0" cellpadding="0" border="0">
        <tr>
          <td>
            <div style="&#10;                                width: 5px;&#10;                                border-top: 2px solid;&#10;                                border-bottom: 2px solid;&#10;                                border-left: 2px solid;&#10;                            ">&#160;</div>
          </td>
          <td align="center">&#160;<b>x</b>&#160;</td>
          <td align="center">&#160;<b>y</b>&#160;</td>
          <td align="center">&#160;<b>z</b>&#160;</td>
          <td>
            <div style="&#10;                                width: 5px;&#10;                                border-top: 2px solid;&#10;                                border-bottom: 2px solid;&#10;                                border-right: 2px solid;&#10;                            ">&#160;</div>
          </td>
        </tr>
      </table>
    </td>
    <td>
                </td>
    <td>
      <table cellspacing="0" cellpadding="0" border="0">
        <tr>
          <td>
            <div style="&#10;                                width: 5px;&#10;                                border-top: 2px solid;&#10;                                border-left: 2px solid;&#10;                            ">&#160;</div>
          </td>
          <td align="center">&#160;<i>a</i>&#160;</td>
          <td>
            <div style="&#10;                                width: 5px;&#10;                                border-top: 2px solid;&#10;                                border-right: 2px solid;&#10;                            ">&#160;</div>
          </td>
        </tr>
        <tr>
          <td>
            <div style="&#10;                                border-left: 2px solid;&#10;                            ">&#160;</div>
          </td>
          <td align="center">&#160;<i>b</i>&#160;</td>
          <td>
            <div style="&#10;                                border-right: 2px solid;&#10;                            ">&#160;</div>
          </td>
        </tr>
        <tr>
          <td>
            <div style="&#10;                                width: 5px;&#10;                                border-bottom: 2px solid;&#10;                                border-left: 2px solid;&#10;                            ">&#160;</div>
          </td>
          <td align="center">&#160;-<i>c</i>&#160;</td>
          <td>
            <div style="&#10;                                width: 5px;&#10;                                border-bottom: 2px solid;&#10;                                border-right: 2px solid;&#10;                            ">&#160;</div>
          </td>
        </tr>
      </table>
    </td>
    <td>
                = 0
            </td>
  </tr>
</table>
<div style="clear: both">&#160;</div>
<p>
                A good example of a solution using Gaussian elimination is <B>ZorbaTHut</B>'s solution in Room 1.
                However, this method is tricky to implement correctly (unless one has the code already lying around).
            </p>
<p>
                Another option is to take advantage of all the constraints we are given.
                First, we are only interested in solutions that yield positive integral values for
                <i>a</i>, <i>b</i>, and <i>c</i>.  Furthermore, the input constraint that prevents the number of atoms
                of a particular element from occurring more than 9 times provides a reasonably low upper bound for
                sensible values that any of these scalars may take.  Thus the simpler solution is to iterate through
                each sensible value for <i>a</i> and <i>b</i> (the value for <i>c</i>, if any, will depend on the values of the other
                two scalars).
            </p>
<B>Implementation</B>
<p>
                Due to time constraints, I will not cover the solution using Gaussian elimination, but instead will only cover
                the simpler solution that takes advantage of all the constraints.  It is not difficult to implement, provided
                one can manage to convert the input string into the three vectors.
            </p>
<p>
                The first issue is determining an appropriate upper bound for sensible values for each scalar.
                An upper bound that is too high might cause the program to run too slow, but an upper bound that is too low
                will cause the program to be incorrect.  The upper bound turns out to be 81, but <a href="http://www.topcoder.com/stat?c=member_profile&amp;cr=251335">Echo</a>'s proof
                of this is still forthcoming (if I get a chance I'll try to prove it myself).
                
            </p>
<p>
                Since the upper bound is so low, we could easily nest three <code>for</code> loops to iterate through each
                possible sensible combination of values for the three scalars.  Or, if we want to get fancy, we could iterate
                through combinations of just two of the scalars, deriving the value of the third from the first two.
                In either case, we then check for consistency.  That is, we plug the values for our scalars into 
    (<a href="#eq5">5</a>)
 and see
                if it holds.  If so, then we have found <em>a</em> solution.  We must continue checking all combinations, returning
                the fact that multiple solutions exist if we find a second solution, but otherwise continuing until we exhaust all combinations.
                If we find no solutions, then the system is unsolvable, else we plug the values of the scalars in our solution into the
                original input string in the appropriate manner and return it.
            </p>
<p>&#160;</p>
<a name="Tetronimo"></a>
<font size="2">
  <b>Tetronimo</b>
</font>
<BR/>
<font size="2">Author:
        <a href="http://www.topcoder.com/stat?c=member_profile&amp;cr=251335">Echo</a>
</font>
<BR/>
<font size="2">
    Used as: Division 1, Level 3:
    <blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;">
          <b>Value</b>
        </td>
        <td style="background: #eee;">950</td>
      </tr>
      <tr>
        <td style="background: #eee;">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;">21
    /
    237
    (8.86%)
</td>
      </tr>
      <tr>
        <td style="background: #eee;">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;">13
    /
    21
    (61.9%)
</td>
      </tr>
      <tr>
        <td style="background: #eee;">
          <b>High Score</b>
        </td>
        <td style="background: #eee;">
          <B>John Dethridge</B> for
            583.53 points
        </td>
      </tr>
    </table>
  </blockquote>
</font>
<font size="2">Reference implementation:
    <B>henchq</B>
</font>
<BR/>
<B>Summary</B>
<p>
                There aren't really any known algorithms for computing the number of ways it is possible
                to pack a set of tetronimoes in an arbitrary space.  Fortunately, the problem is designed
                with brute force in mind.
            </p>
<B>Implementation</B>
<p>
                A high-level description of the problem makes it seem easy.  For each piece that has not been used,
                attempt to find a location and orientation where it fits.  If one is found, remove the <tt>X</tt>s
                covered by the piece and continue with the remaining pieces.  Then unmark the same <tt>X</tt>s and
                try to find another location and orientation.  After all locations and orientations have been tried,
                try the next piece.  If all the pieces have been examined and all the <tt>X</tt>s are covered, then
                a packing has been found.
            </p>
<p>
                The only tricky part is representing the pieces in a useful manner.  Not only does the relative positions
                covered by a piece about its origin need to be represented, but an easy way to transform these positions
                by rotations has to exist as well.  One can either represent each piece as relative row-coordinate pairs
                and specify which rotations are valid for that piece, or one can represent each rotation as a unique piece.
                The former requires more logic, the latter requires more typing.  If the former method is used, keep in
                mind that piece A is only valid for rotations of either 0 or 180 degrees and either 90 or 270 degrees.
                The same applies for pieces D and E.  Piece F is only valid for one rotation.
            </p>
<p>
                The rest is implementing the permutation logic in an efficient manner, exhausting the possible packings
                without exhausting the time limit.
            </p>
<p>&#160;</p>



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
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>	
				<TR>
					<TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
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
<!-- <A href="Javascript:sponsorLinkWindow('/?&amp;t=sponsor&amp;c=link&amp;link=/contest/citrix/index.html&amp;refer=srm91_room1','Citrix','1','1','680','489')"><img src="/i/citrix_sidebar.jpg" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A><BR/>
<A HREF="/?&amp;t=sponsor&amp;c=link&amp;link=http://idenphones.motorola.com/iden/developer/developer_home.jsp&amp;refer=srm92"><IMG SRC="/i/motorola_sidebar.gif" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A>
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


