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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm93_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" CLASS="bodyText">Editorial Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm93_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Comments? Ideas?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm93_prob" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
       <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm93_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
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
<P><B>Single Round Match 93</B><BR/>
May 30, 2002</P>
<P><B>Problem Set Analysis &amp; Opinion</B></P>

<p>
        For the most part, the problems for this match were easier than usually.
        Many consisted of simply iterating through possible combinations of fixed size, returning
        the best one or the total count.  The exception was the Division 1 Level 3 problem,
        <a href="#Shared" class="bodyGeneric">Shared</a>, which only four people solved.
        This was the only problem written by <b>Soli</b>, while all the other
        problems were written by <b>Perlaze</b>.
        </p>
<b>Statistics</b>
<table border="1" cellspacing="0" cellpadding="1">
  <tr>
    <td align="center" class="bodyText"><B>Division</B></td>
    <td align="center" class="bodyText"><B>Level</B></td>
    <td align="center" class="bodyText"><B>Name</B></td>
    <td align="center" class="bodyText"><B>Value</B></td>
    <td align="center" class="bodyText"><B>Submission Rate</B></td>
    <td align="center" class="bodyText"><B>Success Rate</B></td>
    <td align="center" class="bodyText"><B>High Score</B></td>
  </tr>
  <tr>
    <td rowspan="3" class="bodyText">
      <b>Div-I</b>
    </td>
    <td align="center" class="bodyText">Level 1</td>
    <td align="center" class="bodyText">
      <a href="#Super3" class="bodyGeneric">Super3</a>
    </td>
    <td align="center" class="bodyText">300</td>
    <td align="center" class="bodyText">252
    /
    261
    (96.55%)
</td>
    <td align="center" class="bodyText">177
    /
    252
    (70.24%)
</td>
    <td align="center" class="bodyText">289.85 by
        <b>radeye</b>
        in Room 4
            
        (96.62% efficiency)
    </td>
  </tr>
  <tr>
    <td align="center" class="bodyText">Level 2</td>
    <td align="center" class="bodyText">
      <a href="#Big2" class="bodyGeneric">Big2</a>
    </td>
    <td align="center" class="bodyText">500</td>
    <td align="center" class="bodyText">168
    /
    261
    (64.37%)
</td>
    <td align="center" class="bodyText">107
    /
    168
    (63.69%)
</td>
    <td align="center" class="bodyText">437.76 by
        <b>SnapDragon</b>
        in Room 1
            
        (87.55% efficiency)
    </td>
  </tr>
  <tr>
    <td align="center" class="bodyText">Level 3</td>
    <td align="center" class="bodyText">
      <a href="#Shared" class="bodyGeneric">Shared</a>
    </td>
    <td align="center" class="bodyText">1100</td>
    <td align="center" class="bodyText">10
    /
    261
    (3.83%)
</td>
    <td align="center" class="bodyText">4
    /
    10
    (40%)
</td>
    <td align="center" class="bodyText">521.33 by
        <b>ZorbaTHut</b>
        in Room 1
            
        (47.39% efficiency)
    </td>
  </tr>
  <tr>
    <td rowspan="3" class="bodyText">
      <b>Div-II</b>
    </td>
    <td align="center" class="bodyText">Level 1</td>
    <td align="center" class="bodyText">
      <a href="#Median" class="bodyGeneric">Median</a>
    </td>
    <td align="center" class="bodyText">250</td>
    <td align="center" class="bodyText">375
    /
    392
    (95.66%)
</td>
    <td align="center" class="bodyText">177
    /
    375
    (47.2%)
</td>
    <td align="center" class="bodyText">248.33 by
        <b>leelin</b>
        in Room 33
            
        (99.33% efficiency)
    </td>
  </tr>
  <tr>
    <td align="center" class="bodyText">Level 2</td>
    <td align="center" class="bodyText">
      <a href="#Hiring" class="bodyGeneric">Hiring</a>
    </td>
    <td align="center" class="bodyText">500</td>
    <td align="center" class="bodyText">263
    /
    392
    (67.09%)
</td>
    <td align="center" class="bodyText">143
    /
    263
    (54.37%)
</td>
    <td align="center" class="bodyText">440.39 by
        <b>Jeffa</b>
        in Room 29
            
        (88.08% efficiency)
    </td>
  </tr>
  <tr>
    <td align="center" class="bodyText">Level 3</td>
    <td align="center" class="bodyText">
      <a href="#Big2" class="bodyGeneric">Big2</a>
    </td>
    <td align="center" class="bodyText">1050</td>
    <td align="center" class="bodyText">59
    /
    392
    (15.05%)
</td>
    <td align="center" class="bodyText">21
    /
    59
    (35.59%)
</td>
    <td align="center" class="bodyText">651.60 by
        <b>b0b0b0b</b>
        in Room 31
            
        (62.06% efficiency)
    </td>
  </tr>
</table>

<P>
<a name="Median"></a><b>The Problems Median</b>
</P>

<div style="background: #eee; text: black; display: table;">
  <font size="-1">Author:
        <b>Perlaze</b>
  </font>
  <br/>
  <font size="-1">Used as: Division
    2, Level
    1</font>
  <br/>
  <font size="-1">Reference implementation:
    <b>leelin</b>
    in Room 33</font>
  <br/>
</div>
<P>
<b>Implementation</b>
</P>

<p>
            This is the sort of problem that many Division 2 coders would probably classify as a "typing exercise."
            The description basically gives the solution away: sort the input, then
            </p>
<ul>
                <li>return the middle value if the size of the input is odd</li>
                <li>else return the rounded mean of the two middle values</li>
            </ul>
<p>
            With some careful thought, one can generalize this so that it doesn't matter if the size of the input
            is even or odd.  If one defines the middle two elements of a list of length <code>n</code> as
            <code>n / 2</code> and <code>(n - 1) / 2</code>, using integer division, then one will get
            the same number twice for odd-length lists and the middle two values for even-length elements.
            If two values are the same, then the mean of the two is also the same, and so the same logic
            conveniently works for all cases.
            </p>
<b>Mistakes</b>
<p>
            The most common mistake by far was incorrect calculation of the mean.
            Many coders computed the mean between the two numbers immediately above the median, rather
            than the numbers immediately below and above the median (e.g.,
            indices of <code>n / 2</code> and <code>n / 2 + 1</code> instead of
            <code>n / 2</code> and <code>(n - 1) / 2</code> which works for both odd- and even-length inputs).
            </p>
<a name="Hiring"></a><p><b>Hiring</b></p>

<div style="background: #eee; text: black; display: table;">
  <font size="-1">Author:
        <b>Perlaze</b>
  </font>
  <br/>
  <font size="-1">Used as: Division
    2, Level
    2</font>
  <br/>
  <font size="-1">Reference implementation:
    <b>Jeffa</b>
    in Room 29</font>
  <br/>
</div>
<P>
<b>Summary</b>
</P>

<p>
            The solution to this problem is to iterate through each unique, possible triple, and
            select the one that is best under the ordering on triples defined by the problem.
            </p>
<b>Algorithm</b>
<p>
            The number of unique triples formed from
            a set of <code>n</code> applicants is <code>C(n, 3) = n * (n - 1) * (n - 2) = O(n<sup>3</sup>)</code>.
            Since the maximum value of <code>n</code> specified by the problem is <code>50</code>,
            brute-force iteration of all the triples is sufficient.
            </p>
<b>Implementation</b>
<p>
            The key to solving problems of this nature is having code ready for iterating through combinations
            of elements in a set.  Since we are generating only combinations of size 3, we can actually do this
            with a simple <code>for</code> loop:
            </p>
<pre>
for(int i = 0; i &lt; len - 2; i++)
    for(int j = i + 1; j &lt; len - 1; j++)
        for(int k = j + 1; k &lt; len; k++)
            </pre>
<p>
            In general, one could also implement a recursive implementation that can find combinations of any size.
            However this is implemented, for each combination it is easy to pick the combination that yields the
            highest average exam score without exceeding the salary cap.
            </p>
<a name="Super3"></a><p><b>Super3</b></p>

<div style="background: #eee; text: black; display: table;">
  <font size="-1">Author:
        <b>Perlaze</b>
  </font>
  <br/>
  <font size="-1">Used as: Division
    1, Level
    1</font>
  <br/>
  <font size="-1">Reference implementation:
    <b>malpt</b>
    in Room 1</font>
  <br/>
</div>
<P>
<b>Summary Algorithm</b>
</P>

<p>
            The algorithm consists of computing <code>round(1000 * odds)</code>, where <code>odds</code> is your odds of
            winning.  Rather than bothering with floating point arithmetic, however, we will decompose <code>odds</code>
            into a numerator and a denominator.  The numerator is the number of possible drawings that result in a win
            for the person, and the denominator is the number of possible drawings.  The result can then be computed
            by <code>(10000 * numWays / possibleDrawings + 5) / 10</code> without any loss of precision.  What we are
            doing with this operation is employing fixed point arithmetic, shifting our value to the left by one decimal
            digit so that we can emulate rounding with integers.
            </p>
<b>Implementation</b>
<p>
            The trick to computing <code>possibleDrawings</code> is to maintain a boolean array <code>used[position][digit]</code>,
            which indicates whether <code>digit</code> has been used in <code>position</code>.  Then, for each value of <code>position</code>,
            we compute the sum of digits that have not been used in that position.  We then take the product of these three sums to get
            <code>possibleDrawings</code>
            </p>
<p>
            We then need to compute <code>numWays</code>.  The method for this is to iterate through all the purchased numbers,
            being careful to skip any that we have already processed.  We can then check each of its digits and see if any have been used
            by querying our <code>used</code> array.  If none of its digits have been used in their respective positions, then that
            particular purchase represents one possible way to win.
            </p>
<b>Mistakes</b>
<p>
            The most common error was incorrectly handling duplicate purchases, even though there was a sample test case
            that would have made such a mistake glaringly obvious to those that tested with it.  Obviously quite a few
            people rushed through the problem without testing or reading it thoroughly.
            </p>
<a name="Big2"></a><p><b>Big2</b></p>

<div style="background: #eee; text: black; display: table;">
  <font size="-1">Author:
        <b>Perlaze</b>
  </font>
  <br/>
  <font size="-1">Used as: Division
    1, Level
    2</font>
  <br/>
  <font size="-1">Used as: Division
    2, Level
    3</font>
  <br/>
  <font size="-1">Reference implementation:
    <b>reid</b>
    in Room 1</font>
  <br/>
</div>
<P>
<b>Summary</b>
</P>

<p>
            This was also a combinatorical problem, in the sense that the problem consisted of counting combinations that
            meet certain criteria.
            </p>
<b>Algorithm</b>
<p>
            Due to the nature of the input, a brute force solution is all that is needed.  We iterate through each possible
            subset of the hand that is of size 5, and count how many of these subsets constitute "poker hands."
            The number of possible subsets of size 5 is <tt>C(13, 5) = 13! / (5!8!) = 1287</tt>, which is within reach
            of even an incredibly slow implementation.
            </p>
<b>Implementation</b>
<p>
            There are two tasks that the program must do.  The first is constructing subsets of size five from the input,
            without repeating any subsets (and recall that subset equality is independent of element order).  This is a common
            operation in any contest, and every coder should have code readily available either on their computer or in their
            head to perform this operation.  As with the <a href="#Super3" class="bodyGeneric">Super3</a> problem, it is reasonable
            to build a nested structure of five <code>for</code> loops, e.g.:
            </p>
<pre>
for(int i = 0; i &lt; 9; i++)
    for(int j = i + 1; j &lt; 10; j++)
        for(int k = j + 1; k &lt; 11; k++)
            for(int l = k + 1; l &lt; 12; l++)
                for(int m = l + 1; m &lt; 13; m++) {
                    ...
                }
            </pre>
<p>
            Or, one can use recursion in conjunction with a boolean array (similar to a depth-first search), which is
            more useful in the general case.
            </p>
<p>
            The second task is determining whether a particular subset constitutes a poker hand.
            The problem statement attempts to mislead you by bringing up the subject of straight flushes, but
            since a straight flush is defined as a hand that meets two criteria that each individually would 
            qualify a hand as a poker hand, we can completely ignore it.
            It's easiest to take the remaining types of poker hands one at a time.
            </p>
<ol>
                <li>
    <b>Flush</b> - This is the easiest.  Compare the suit of each of the last four elements to the suit of the first
                    element.  If any do not match, the hand is not a flush.</li>
                <li>
    <b>Four of a kind</b> - Generate an array of length 13, each index of which represents a unique card value
                    (e.g. 0 for 2, 8 for T, 12 for A).  If the maximum value in this array is 4, then the hand has four of a kind.</li>
                <li>
    <b>Full House</b> - Using the same array as before, determine if there is a value of 3.  If so, determine that there
                    is also a value of 2, or, alternatively, that there are no values of 1.  If both tests pass, then the hand is a full house.</li>
                <li>
    <p>
                    <b>Straight</b> - There are two ways of checking for a straight.  One can either sort the subset (and note that by sorting
                    the original hand one can generate subsets such that they are already sorted), or one can use the same array as for
                    checking for four of a kind and full house.
                    </p>
                    <p>
                    If using the former method, one has to deal with the special case of an ace if it is in the subset.
                    If the ace is mapped to the highest integer value, check the last element of the subset.  If it
                    is an ace, and the first element of the subset is a 2, shift the subset to the right by one and place the ace at the beginning.
                    The logic is similar if one is mapping an ace to the lowest value instead.  Then check the last four cards in the subset
                    and verify that the rank of each is the successor of the card before it in the subset.  If all of these cards pass that test,
                    then the subset represents a straight.
                    </p>
                    <p>
                    If the latter method is used, one must iterate through each value of 1 in the array.  For each such value, determine
                    if each of the next four values is also one (wrapping around using <code>% 13</code> on the index).  If such a sequence
                    is found, then the subset is a straight.
                    </p>
                </li>
            </ol>
<p>
            If a subset matches any one of these types of poker hands, we can increment our count of poker hands and immediately
            move on to the next subset.
            </p>
<b>Mistakes</b>
<p>
            The arbitrary nature of poker hands made it easy for people to make minor, non-obvious mistakes.
            Fence-post errors are easy to make in this situation, and the dual nature of aces caused a lot of
            people to write incorrect code for checking for straights.
            </p>
<a name="Shared"></a><p><b>Shared</b></p>

<div style="background: #eee; text: black; display: table;">
  <font size="-1">Author:
        <b>Soli</b>
  </font>
  <br/>
  <font size="-1">Used as: Division
    1, Level
    3</font>
  <br/>
  <font size="-1">Reference implementation:
    <b>ZorbaTHut</b>
    in Room 1</font>
  <br/>
</div>
<P>
<b>Implementation</b>
</P>

<p>
            This monstrosity by <b>Soli</b> defeated most programmers in Division 1.
            Of 261 contestants, only 10 were even able to submit it, and only four of these submissions
            were actually correct.
            </p>
<p>
            The problem in itself is not all that difficult.  The problem statement lays out a set of rules
            governing how a simulation of the execution of four concurrent processes occurs.  The problem
            is to find the ordering of precedences for the four processes that gives the best turnaround time,
            and return the turnaround time.  Since there are exactly four processes, the general form of the
            solution is to iterate through each of the <code>4! = 24</code> orderings of the processes,
            simulating the lifetime of all the processes for each iteration.
            </p>
<p>
            The hard part is implementing the simulation.  As with any simulation, the key is to organize one's thoughts
            and code in such a manner that it reflects the simplest interpretation of the rules in a correct manner.
            In this case, the simulation should iterate through each time slice.  For each time slice, process the processes
            that are still executing in the following manner:
            </p>
<ol>
                <li>Process all terminating processes</li>
                <li>Process all processes that are releasing a lock this time slice</li>
                <li>Process all processes that are requesting a lock this time slice</li>
                <li>Increment the instruction counter of any non-terminated processes that
                    are not stuck waiting on a lock</li>
            </ol>
<p>
            We will represent the set of locks held by a process as a mapping between the address of the lock and the value
            of what the instruction counter was when the process obtained the lock.  We use separate maps for the read and
            write locks.
            </p>
<p>
            For each of the above tasks:
            </p>
<ol>
                <li>
    <p>
                    <b>Process all terminating processes</b> - We don't really have to do anything, just mark the process
                    as terminated.
                    </p>
                </li>
                <li>
    <b>Process lock releases</b> - Here we just remove the mappings from the appropriate maps for each releasing process.</li>
                <li>
    <p>
                    <b>Process lock requests</b> - This is the complicated part.  We iterate through each process that is making a request
                    in order of precedence, from highest to lowest.  For each such process, we first have to determine if any process of higher
                    priority currently holds a lock that excludes this process from obtaining the lock it is requesting.  If the request is for
                    a read lock, this consists of finding any process of higher priority that holds a write lock on the same address.
                    If the request is a write lock, this consists of finding any process of higher priority that holds either a read lock or
                    a write lock on the same address.
                    </p>
                    <p>
                    We then look for processes of lower precedence that are holding locks that would exclude this process from obtaining the lock.
                    For each such lock, we remove it, "rolling back" the process that held it when we do so.  If our process is requesting
                    a read lock, we roll back any process of lower precedence that is holding a write lock on the same address back to the point
                    where it obtained that lock.  This rolling back process consists of setting the process's instruction counter to that associated
                    with the lock that it just lost, and then removing all locks it holds with an instruction counter higher than that.
                    If our process is requesting a write lock, we roll back any process of lower precedence that is holding a read or write lock on the
                    same address.  If such a process holds both read and write locks, we roll back to the lock that occurred earlier (has the lower
                    precedence counter).
                    </p>
                </li>
                <li>
    <p>
                    <b>Incrementing instruction counters</b> - We incremnt a process's instruction counter if one of the following holds
                    for this time slice:
                    </p>
                    <ul>
                        <li>The process's current instruction is <code>NOOP</code>
      </li>
                        <li>The process's current instruction is a lock release</li>
                        <li>The process's current instruction is a lock request that succeeds</li>
                    </ul>
                </li>
            </ol>
<p>
            And so we repeat this until every process has terminated.  The number of time steps it takes to reach this point is
            the turnaround time for this particular permutation of precedences.  By doing this for all 24 precedences, we can
            obtain the minimum turnaround time.
            </p>

<IMG SRC="/i/m/Logan_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;Logan<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=112902" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
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
<A href="Javascript:sponsorLinkWindow('/?&amp;t=sponsor&amp;c=link&amp;link=/contest/citrix/index.html&amp;refer=srm91_room1','Citrix','1','1','680','489')"><img src="/i/citrix_sidebar.jpg" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A>
<BR/>
<!-- <A HREF="/?&amp;t=sponsor&amp;c=link&amp;link=http://idenphones.motorola.com/iden/developer/developer_home.jsp&amp;refer=srm92"><IMG SRC="/i/motorola_sidebar.gif" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A>
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


