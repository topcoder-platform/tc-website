<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/tccc03_links.xsl"/>
  <xsl:import href="../includes/modules/tccc03summary_links.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
<html>
<head>

<xsl:call-template name="Preload"/>

<title>TopCoder | Tournaments</title>

<!-- Include external CSS files -->
<xsl:call-template name="CSS"/>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

<script language="JavaScript">
  function changeImage(image, newImage) {
    document[image].src=newImage;
    return;
  }
</script>
     
</head>

<body>

<!-- Top begins -->
<xsl:call-template name="Top"/>
<!-- Top ends -->

<a name="top_page"></a>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170" bgcolor="#CCCCCC">
              <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">steelgray</xsl:with-param>
                <xsl:with-param name="image">tournaments_gray</xsl:with-param>
                <xsl:with-param name="title">Room 4: Problems &amp; Play-by-play</xsl:with-param>
            </xsl:call-template>

            <xsl:call-template name="tccc03_links">
                <xsl:with-param name="selectedTab">summary</xsl:with-param>
            </xsl:call-template>

            <xsl:call-template name="summary_links"/>
    
            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr><td height="1"><img src="/i/clear.gif" alt="" width="10" height="3" border="0"/></td></tr>
                <tr><td class="tourney_subnav"><strong>Semifinal Room 4 Problem Analysis &amp; Opinion</strong></td></tr>
                <tr valign="top">
                    <td width="10%" class="bodyText">
                        <p>Friday, April 4, 2002</p>
                        
                        <h2>RoadTrip<br />
                        <font size="-1">Used as: Level 1</font></h2>

                        <h4>Implementation</h4>
                        
                        <p>This problem is strongly reminiscent of the programming language <a href="http://www.catseye.mb.ca/esoteric/befunge/" target="_blank">BeFunge</a>.
                        In a sense, this problem calls for the implementation of an evaluator for a very simplified version
                        of the language.  The program is the two-dimensional character array given as input, and the commands
                        are either no-ops (the dots) or turns (left, right, or 180 degrees).  Input to the program would be
                        a starting location and a direction, and the output would be the number of locations visited at least once.
                        The problem then just calls for evaluating the input program for all possible
                        inputs, and returning the maximal output.  You must also detect infinite loops, and terminate any program
                        that enters one.</p>

                        <p>The easiest method for handling motion and turns is by specifying an array of position offsets to
                        represent movement in each direction.  For example:</p>

<pre>
    int[][] dxy = {
        { 0, 1 },   // east
        { -1, 0 },  // north
        { 0, -1 },  // west
        { 1, 0 },   // south
    }
</pre>
                        <p>Each row in this array represents movement in a particular direction, and the rows are ordered
                        such that the row following represents a left turn and the row preceding represents a right turn.
                        The first column is the row offset, and the second column is the column offset.  Thus <tt>{0, 1}</tt>
                        represents no change in row and a positive change in column, which corresponds to eastward movement.
                        To turn left, then, one just adds <tt>1</tt> to the current direction and then takes that value
                        mod <tt>4</tt> (so, a left turn when the direction is <tt>3</tt> yields <tt>0</tt>).  A right turn
                        consists of subtracting <tt>1</tt>, but the modulus operator doesn't work the same way for negative
                        numbers.  It is easier to add <tt>3</tt> instead (since <tt>3</tt> and <tt>-1</tt> are congruent modulo <tt>4</tt>).
                        This method is useful for many, many grid traversal problems.</p>

                        <p>Now all that is left is detection of infinite loops.  An infinite loop will only occur if you
                        revisit a previously visited location and leave it in the same direction that you have left it before.
                        Thus, maintain a three-dimensional boolean array, where the indices represent row, column, and direction.
                        When you leave a location, check the appropriate element in the array.  If it is true, you have entered
                        an infinite loop, and might as well terminate the program, as no new locations will ever be visited.
                        Otherwise, set the appropriate element in the array to true and continue evaluation.</p>

                        <p>Simply evaluate the program for all possible locations and directions, and count how many locations are
                        visited.  Then just return the maximum.</p>

                        <p>&#160;</p>
                        
                        <a name="GraphPaths"></a><h2>GraphPaths<br />
                        <font size="-1">Used as: Level 2</font></h2>
    
                        <h4>Implementation</h4>
    
                        <p>It's clear from the examples that simply iterating paths is not the answer, as there
                        can be up to 2<sup>63</sup> paths that one must count.  Instead we must count the paths
                        without iterating them.  In fact, a dynamic programming solution is called for.</p>

                        <p>Suppose that we know the number of paths of length <tt>a</tt> between all pairs of vertices,
                        as well as the number of paths of length <tt>b</tt>.
                        Can we use this information to compute the number of paths of length <tt>a + b</tt> for all pairs?
                        We can, and it's actually quite easy.  If there exist <tt>m</tt> paths of length <tt>a</tt> from
                        vertex <tt>i</tt> to vertex <tt>j</tt>, and there exist <tt>n</tt> paths of length <tt>b</tt>
                        from vertex <tt>j</tt> to vertex <tt>k</tt>, then there must be <tt>m * n</tt> paths of length
                        <tt>a + b</tt> from vertex <tt>i</tt> to vertex <tt>k</tt>.  Thus with three nested <tt>for</tt>
                        loops, one can easily generate a matrix giving number of paths of a particular length from similar
                        matrices for smaller lengths.</p>

                        <p>Now we can see how to solve this problem in time that is proportional to the logarithm of
                        the given length.  Simply look at the binary representation of the length.  The binary representation
                        is a way of decomposing a value into a sum of powers of <tt>2</tt>.  So, all we have to do is
                        compute the number of paths between all pairs of vertices for all lengths that are powers of <tt>2</tt>
                        (up to a certain point).</p>
                        
                        <p>For this, we again use the method described above.  If we know the number of paths of length <tt>a</tt>,
                        we can compute the number of paths of length <tt>a + a</tt>.  So, we build a three-dimensional array,
                        <tt>paths</tt>, where <tt>paths[x][i][j]</tt> gives the number of paths of length <tt>2<sup>x</sup></tt> from vertex
                        <tt>i</tt> to vertex <tt>j</tt>.  The range of the first index needs to be <tt>0..30</tt> (since
                        the base-2 logarithm of the maximum length we will be given is less than 31).  We initialize <tt>paths[0]</tt>
                        to be all zeros, except where an edge exists from <tt>i</tt> to <tt>j</tt>.  If there is an edge from
                        <tt>i</tt> to <tt>j</tt>, then <tt>paths[0][i][j] = 1</tt>.</p>

                        <p>We then successively build <tt>paths[1]</tt> through <tt>paths[30]</tt>.  Since we're going to have
                        to repeat this process later on to obtain the answer for our given length, it is a good idea to
                        develop this process as a function, which takes two two-dimensional matrices (representing the number of
                        paths between all pairs for two different lengths) and returns a two-dimensional matrix (representing
                        the number of paths between all pairs for the sum of the two input lengths).  Then, to build
                        <tt>paths[n]</tt>, we simply pass two references to <tt>paths[n - 1]</tt> to this function.
                        The function also has to handle overflow detection.  Basically, before increasing any value, verify that
                        the amount it is going to be increased by is less than the difference between the maximum value and its
                        current value.  If so, replace it with <tt>-1</tt>.</p>
    
                        <p>Once we build <tt>paths</tt>, we are ready to compute the answer.  We initialize a two-dimensional
                        <tt>sum</tt> to all zeros, and then set <tt>sum[i][i] = 1</tt> for all vertices <tt>i</tt>.  This
                        represents the number of paths of length 0.  We then iterate through the bits of <tt>length</tt>.
                        If bit <tt>i</tt> is <tt>1</tt>, then we pass <tt>sum</tt> and <tt>paths[i]</tt> to the function
                        we implemented above and replace <tt>sum</tt> with its return value.  After we've done this for all
                        the bits of <tt>length</tt>, we have our answer for all pairs of vertices.  We simply look up the
                        value at the location specified by the input parameters and return it.</p>
                        
                        <p>&#160;</p>
                        
                        <a name="HigherMaze"></a><h2>HigherMaze<br />
                        <font size="-1">Used as: Level 3</font></h2>
    
                        <h4>Implementation</h4>
                        
                        <p>This is just a suped up version of a typical breadth-first-search problem, something which should pose
                        little challenge to competitors that have made it to the semi-finals.  The most interesting aspect of
                        this problem is the input, part of which specifies parameters to a pseudo-random number generator which
                        is used to populate the graph before the search is performed.  This might make testing and challenging
                        more difficult, but the problem statement explicitly specifies how to code the generator, so it should
                        not pose much difficulty as far as coding goes.</p>

                        <p>There are at most <tt>20<sup>5</sup> = 3200000</tt> locations in the graph.  There's no problem with storing
                        information for all of these in memory.  The general process of a breadth-first search is then as follows.</p>

                        <p>The primary data structure for a breadth-first search is a priority queue.  The values that are stored in
                        the priority queue are tuples.  Each such tuple represents a location and a cost for reaching that location.
                        Thus the priority queue is initially populated with the starting location with a cost of zero.</p>

                        <p>Each value that we pull from the queue represents a location we can reach (and the minimal cost of reaching
                        that location).  For each location we reach, we generate the locations of all its neighbors (which may include
                        neighbors reached directly through wormholes) and compute the costs
                        for reaching each of these locations by passing through the current location.  That is, we compute the cost
                        of travelling from the current location to a neighbor, and add that cost to the cost of reaching the current
                        location.  We then construct a tuple for associating each of the neighboring locations with the computed cost
                        for each, and add them to the priority queue.</p>

                        <p>Usually, for efficiency, we would not not add a tuple to the
                        queue if there has already been added to the queue a tuple for the same location with a lower cost.
                        However, we are dealing with a graph where edges may have negative weights, so this practice would be
                        erroneous.</p>

                        <p>This is all standard fare, and all of the contestants have probably solved this problem for two, three, or even
                        four dimensions (I recall an ACM ICPC problem a few years ago that was four-dimensional).  This is just
                        a generalization of the same problem.  Generalizing the solution is trivial, except for the matter of iterating
                        neighbors.  Writing code to generate neighbors of an arbitrary location in <i>n</i> dimensions is trivial if
                        <i>n</i> is constant for your program, but it's slightly harder to generalize for any <i>n</i>.  This consists
                        of generating all <i>n</i>-element arrays where the values of each element can be either <tt>-1</tt>, <tt>0</tt>,
                        or <tt>1</tt>, and this could easily be done in a simple recursive function.  Generating locations of asteroids
                        in the manner prescribed should probably be done in the same manner.</p>


                        <img src="/i/m/Logan_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left"/>
                        By <a href="/stat?c=member_profile&amp;cr=112902" class="bodyText"><strong>Logan</strong></a><br/>
                        <div class="smallText"><em>TopCoder Member</em></div><br />
                        <br clear="all" />
                        
                        <p><br/></p>
          
                    </td>
                </tr>                  

                <tr><td height="1"><img src="/i/clear.gif" alt="" width="10" height="3" border="0"/></td></tr>
                <tr><td class="tourney_subnav"><strong>Semifinal Room 4 Play-by-play</strong></td></tr>
                <tr>
                    <td valign="top" class="bodyText">
                        <p><strong>CODING PHASE</strong><br/>
                        8:00:02 AM - malpt opens the Level One problem<br/>
                        8:00:04 AM - ambrose opens the Level One problem<br/>
                        8:00:05 AM - SnapDragon opens the Level One problem<br/>
                        8:00:07 AM - kyky opens the Level One problem<br/>
                        8:10:02 AM - SnapDragon submits the Level One problem for 268.59 points (final submission)<br/>
                        9:15:36 AM - SnapDragon submits the Level Three problem for 521.09 points (final submission)</p>

                        <p><strong>CHALLENGE PHASE</strong><br/>
                        9:38:16 AM - SnapDragon challenges ambrose on the Level Two problem successfully</p>
                    </td>
                </tr>            
            </table>

            <p><br/></p>
        
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170" valign="top"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
            <xsl:call-template name="public_right_col"/>       
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>
<!-- Body Ends -->

<!-- Foot begins -->
<xsl:call-template name="Foot"/>
<!-- Foot ends -->

</body>
</html>

  </xsl:template>
</xsl:stylesheet>


