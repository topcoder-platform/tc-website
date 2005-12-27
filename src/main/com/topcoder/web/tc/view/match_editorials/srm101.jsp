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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm101_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm101_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505518" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm101" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm101_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 101</span><br>June 26, 2002
<br />

<H1> 
The Problems 
</H1> 

<a name="Automorphic"></a>

  <b>Automorphic</b>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505518" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />


    Used as: Division-II, Level 1<br/>

Reference implementation:
    <b>BanjoBill</b>

<br/>
Reference implementation:
    <b>Pops</b>

<br/>
<b>Implementation</b>
<p>
                The solution to this problem consists of converting the input number and its square to
                strings and returning the length of the longest common suffix (or, instead of converting
                to strings, one can simply obtain the digits from the right using division and modulo by <tt>10</tt>).
                Simply increment a counter <tt>i</tt> (starting from <tt>0</tt>) until either the counter is equal to
                the length of the shorter string or the <tt>i</tt>th characters from the end of each string do not match,
                then return the length of the shorter string minus <tt>i</tt>.
                To get the <tt>i</tt>th character from the end of a string, get the character
                at the index that is the length of the string minus <tt>i</tt> minus <tt>1</tt> (so that <tt>i = 0</tt>
                corresponds to the last character of the string).  Alternatively (and this is probably easier),
                one could simply reverse the two strings, so that counting is done instead from the beginning of the strings.
            </p>
<p>&#160;</p>
<a name="SRM"></a>

  <b>SRM</b>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505518" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-I, Level 1<br/>


    Used as: Division-II, Level 2<br/>

Reference implementation:
    <b>radeye</b>

<br/>
<b>Implementation</b>
<p>
                This problem consists of finding the optimum <a href="http://planetmath.org/encyclopedia/Subset.html" target="_blank" class="bodyText">subset</a>
                of problems.  For a set of <tt>n</tt> elements,
                there are <tt>2<sup>n</sup>
  </tt> possible subsets, including the <a href="http://planetmath.org/encyclopedia/EmptySet.html" target="_blank" class="bodyText">empty set</a>.
                This set of subsets is known as the <a href="http://planetmath.org/encyclopedia/PowerSet.html" target="_blank" class="bodyText">power set</a>.
            </p>
<p>
                Since one can construct a subset by either choosing to include or exclude each element from a set of <tt>n</tt> elements, it follows that there
                are <tt>2<sup>n</sup>
  </tt> subsets, and that we can simply iterate a counter from <tt>0</tt> to <tt>2<sup>n</sup>-1</tt>,
                using the binary representation of the counter to determine whether or not each element of the set is a member of the subset
                represented by the counter.  A true bit corresponds to membership, while a false bit corresponds to exclusion.  Thus for this
                problem we iterate from <tt>0</tt> to <tt>7</tt> inclusive.  We assign the <tt>0</tt>th bit to the <tt>0</tt>th problem,
                the <tt>1</tt>st bit to the <tt>1</tt>st problem, and the <tt>2</tt>nd bit to the <tt>2</tt>nd problem.  If a problem's
                corresponding bit is true, it is selected.  If the sum of times of all selected problems is less than or equal to <tt>75</tt>
                and the sum of scores of all selected problems is greater than the best sum seen so far, we store its sum as the new best sum.
            </p>
<p>
                Note that the first argument to the method was completely unnecessary.  Perhaps it was there to throw people off, or to make
                challenges more difficult (due to the need to satisfy an arbitrary set of constraints).  I'm sure this caused at least a few coders
                to take a few seconds to scratch their heads and wonder if there was some trick hidden somewhere.
            </p>
<p>&#160;</p>
<a name="Speeding"></a>

  <b>Speeding</b>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505518" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />


    Used as: Division-II, Level 3<br/>

Reference implementation:
    <b>eaglej</b>

<br/>
<b>Implementation</b>
<p>
                The solution to this problem is basically a simulation under the given rules.  One just had to avoid a couple of tricks that
                were fairly obvious in the problem.
            </p>
<p>
                Since the dates are given in chronological order, a lot of the work is done for you.  Though it is tempting to convert each date
                to a single number (e.g. days since January 1, 1974), this is not necessary, as the only comparison we need to make is to see
                if two adjacent dates are within a year of each other.
            </p>
<p>
                We iterate through each element of the input array, basically applying the points system as we go along and terminating
                if we ever go beyond the current date.  For each element,
                we see how many years passed between that element and the preceding element (if any).  This is determined by taking the difference
                between the year values (avoiding the Y2K bug, of course).  If the month of the current date is less than the month of the preceding
                date, subtract one year.  If the month of the current date is the same as that of the preceding date, but the day is less than <i>or equal</i>
                to that of the preceding date, also subtract one year.  Then subtract three times the resulting number of years from the point counter,
                bringing it back up to <tt>0</tt> if it is negative.  Then we add the points corresponding to the date.
                At the end we perform the same difference with the current date and the final element of the input array (except we do not add points to
                the point counter).
            </p>
<p>&#160;</p>
<a name="Aliquot"></a>

  <b>Aliquot</b>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505518" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />


    Used as: Division-I, Level 2<br/>

Reference implementation:
    <b>SnapDragon</b>

<br/>
Reference implementation:
    <b>RobertYu</b>

<br/>
<b>Implementation</b>
<p>
                This problem could have easily qualified for a Level 1 problem.  Obviously one needs a reasonably efficient implementation for
                computing <tt>s(n)</tt>, or factorizing <tt>n</tt>.  Simply iterating from <tt>2</tt> to <tt>floor(sqrt(n))</tt> inclusive
                and checking each value to see if it divides into <tt>n</tt> is sufficient.  Care needs to be taken not to add any factor twice
                (which will happen if the factor is the square root of <tt>n</tt>), and one must handle the cases of <tt>0</tt> and <tt>1</tt> specially
                (<tt>s(0) = s(1) = 0</tt>).  Many alternate ways of factorizing <tt>n</tt> exist, most of which are faster, but this simple
                method is sufficient for this problem.  See some of the reference implementations for variations.
            </p>
<p>
                The rest consists of computing up to 35 successive values of the aliquot series, with an input value as the initial value.
                For each new value computed, do a linear search of the preceding values of the series to see if any match.  If so, return the
                index of the first occurrence and its value.  Alternatively, one could store each found value with its index in a hash map.
                If 35 numbers are generated without any repeats, <tt>{-1, -1}</tt> should be returned.
            </p>
<p>
                Technically this handles the special case of <tt>0</tt> terminating the series, but there was ambiguity regarding what should
                be returned if the 36th number in the series is <tt>0</tt>.  It is obvious that the 37th number will also be <tt>0</tt>, so
                implementations that handled occurrences of <tt>0</tt> specially would return <tt>{35, 0}</tt>, while submissions that simply
                checked for duplicates would return <tt>{-1, -1}</tt>.  The only input value where this occurred was <tt>318</tt>, and, due
                to the lack of consensus regarding which approach was correct, all challenges and test cases with this value were discarded.
            </p>
<b>Mistakes</b>
<p>
                Note that all intermediate values needed to be 64 bits in width to avoid overflow.  The hint for C++ users informing them
                of <tt>long long</tt> essentially gave this away.  The case that had the longest runtime by far was <tt>840</tt>, which was
                a sample case.  Thus anyone that tested with all the sample cases was pretty much guaranteed to get the problem correct.
            </p>
<p>
                The most common mistake was probably not storing all intermediate results, <i>including</i> each value of the aliquot series,
                as 64-bit integers.
            </p>
<p>&#160;</p>
<a name="Quadrilateral"></a>

  <b>Quadrilateral</b>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505518" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />


    Used as: Division-I, Level 3<br/>

Reference implementation:
    <b>SnapDragon</b>

<br/>
<b>Implementation</b>
<p>
                The first task is to run a convex hull algorithm on the four points.  If the resulting hull only has three
                vertices, then the result is a triangle.  Otherwise additional processing has to be done to determine what
                sort of quadrilateral the points constitute.  <a href="http://www.cse.unsw.edu.au/~lambert/java/3d/hull.html" target="_blank" class="bodyText">Various algorithms</a>
                for computing the convex hull of a set of points exist.  However, since we're dealing with a constant four points, brute force would
                be easy enough to implement.
            </p>
<p>
                After we compute the convex hull, we obtain the vertices in counter-clockwise order (this is the result of some algorithms anyway).
                We can then reason about the four points using some basic geometry.  First, we obtain vectors that represent each side of
                the quadrilateral.  Each point is basically a vector from the origin; the difference of these vectors describes the orientation and
                length of the line between them.  Thus we obtain vectors representing the four sides of the quadrilateral by taking the differences between
                successive points.
            </p>
<p>
                To check for a rectangle or square, we determine if all four internal angles are perpendicular.  This consists of
                taking each adjacent pair of lines and determining if their
                <a href="http://planetmath.org/encyclopedia/DotProduct.html" target="_blank" class="bodyText">dot product</a> is zero.
                If so, then the two lines describe an internal right
                angle.  If all four angles are right angles, then the result is either a square or a rectangle.  Comparing the lengths of two
                adjacent sides will decide whether it is a square or a rectangle.
            </p>
<p>
                Next on the list is checking if it is a parallelogram.  We check this directly by determining if the first and third lines are parallel
                and the second and fourth lines are parallel.  We can determine if two lines are parallel by taking their
                <a href="http://planetmath.org/encyclopedia/CrossProduct.html" target="_blank" class="bodyText">cross product</a>, which for two vectors of non-zero length is
                only zero if they are parallel.  In two dimensional space, the cross product is the product of the first vector's <tt>x</tt>-component
                and the second vector's <tt>y</tt>-component minus the product of the first vector's <tt>y</tt>-component and
                the second vector's <tt>x</tt>-component.  If both pairs of lines are parallel, then the quadrilateral is a parallelogram and possibly
                a rhombus.  Again we check side lengths to determine which is the case.
            </p>
<p>
                Finally we check to see if the quadrilateral is a trapezoid, which is true if either of the two pairs of lines are parallel.
                If not, then the quadrilateral is simply a quadrilateral.
            </p>
<P><BR/></P>

<p>
<img src="/i/m/Logan_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="112902" context="algorithm"/><br />
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

