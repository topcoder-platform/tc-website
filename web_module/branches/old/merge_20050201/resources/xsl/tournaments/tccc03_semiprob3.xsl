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
        <td width="180">
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
                <xsl:with-param name="title">Room 3: Problems</xsl:with-param>
            </xsl:call-template>

            <xsl:call-template name="tccc03_links">
                <xsl:with-param name="selectedTab">summary</xsl:with-param>
            </xsl:call-template>

            <xsl:call-template name="summary_links"/>
    
            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr><td height="1"><img src="/i/clear.gif" alt="" width="10" height="3" border="0"/></td></tr>
                <tr><td class="tourney_subnav"><strong>Semifinal Room 3 Problem Analysis &amp; Opinion</strong></td></tr>
                <tr valign="top">
                    <td width="10%" class="bodyText">
                        <p>Friday, April 4, 2002</p>
                        
                        <p><b>Problem Summary</b></p>
            <p>
            This was a fun problem set. It had dynamic programming and memoization, with a small amount of graph theory 
            thrown in. The easy problem was straightforward dynamic programming, the medium involved determining 
            whether two small graphs were isomorphic, while the hard involved exploiting memoization to reduce 
            the amount of time required to simulate all the possibilities. 
       		</p>
			<font size="+2"><b>ZigZag</b></font><br />
   			 Used as: Level 1:
   			<blockquote>
   			<table cellspacing="2" cellpadding="2">
			<tr>
			<td style="background: #eee;" class="bodyText"><b>Value</b></td>
			<td style="background: #eee;" class="bodyText">300</td>
			</tr>
			<tr>
			<td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
			<td style="background: #eee;" class="bodyText">4/4 (100%)</td>
			</tr>
			<tr>
			<td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
			<td style="background: #eee;" class="bodyText">3/4 (75%)</td>
			</tr>
			<tr>
			<td style="background: #eee;" class="bodyText"><b>High Score</b></td>
			<td style="background: #eee;" class="bodyText"><b>sjelkjd</b> for 281.30 points</td>
			</tr>
			</table>
			</blockquote>
			<p>
			The solution to this problem is a somewhat obvious application of dynamic programming. Suppose for each 
			position in the sequence, we know the length of the longest subsequence of the sequence that starts at 
			that position where the first difference is positive, as well as the length of the same where the first 
			difference is negative. Then it is easy to insert a value at the beginning of the sequence and solve the 
			same problem for a sequence starting with this new value, using the information we already know.</p>
			<p>Initially, we know the solution for the last pair of values in the sequence. The length of the longest 
			subsequence where the difference is either positive or negative will be 2 (while for the other sign it 
			will be 0). We then work backwards from the third to last value in the sequence.</p>
			<p>For each value, we determine the maximum subsequence length we'd get if we skip the values between the 
			current value and each following value. Depending on whether the difference between the current value and 
			the value we're skipping to is positive or negative, we look at the appropriate maximum length for 
			subsequences starting at the value we're skipping to and add 1. Once we try skipping to all values 
			following our current value, we can take the maximum for each sign.</p> 
			<p>Once we work all the way to the beginning of the sequence, we then look over all signs for all values, 
			pick the maximum value and return it.</p> 
			
			<font size="+2"><b>Criminal</b></font><br />
   			 Used as: Level 2:
   			<blockquote>
   			<table cellspacing="2" cellpadding="2">
			<tr>
			<td style="background: #eee;" class="bodyText"><b>Value</b></td>
			<td style="background: #eee;" class="bodyText">550</td>
			</tr>
			<tr>
			<td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
			<td style="background: #eee;" class="bodyText">3/4 (75%)</td>
			</tr>
			<tr>
			<td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
			<td style="background: #eee;" class="bodyText">3/3 (100%)</td>
			</tr>
			<tr>
			<td style="background: #eee;" class="bodyText"><b>High Score</b></td>
			<td style="background: #eee;" class="bodyText"><b>bstanescu</b> for 423.90 points</td>
			</tr>
			</table>
			</blockquote>
			<p>This problem is basically a graph isomorphism problem. We begin by building two graphs, one for the 
			database and one for the field data. This is straight forward, as each element in these input arrays 
			describes an edge in the resulting graph. We then have to determine whether or not these graphs are 
			isomorphic, and, if so, determine the maximum possible number of aliases.</p>
			<p>Since we're limited to 8 vertices in each graph, we can use a crude approach. First, of course, 
			we should verify that the two graphs have the same number of vertices (else they cannot be isomorphic). 
			Then, we fix the ordering of the vertices of one graph and permute through each possible ordering of 
			vertices of the second graph. For each possible ordering, we can compare respective vertices from both 
			graphs and see if they both have the same number of edges all going to the same vertices. If so, then 
			we have found one way in which the two graphs can be said to be isomorphic.</p>
			<p>Since it's possible that multiple orderings of the vertices of the second graph could yield the same 
			configuration as the first graph, we must iterate through them all. For each one that yields the same 
			configuration, we must count the number of aliases. This is just a count of the number of respective 
			vertices that have different labels. We store the maximum number of aliases and return it when we have 
			iterated through all orderings.</p> 
			
			<font size="+2"><b>TimeSlicing</b></font><br />
   			 Used as: Level 3:
   			<blockquote>
   			<table cellspacing="2" cellpadding="2">
			<tr>
			<td style="background: #eee;" class="bodyText"><b>Value</b></td>
			<td style="background: #eee;" class="bodyText">1000</td>
			</tr>
			<tr>
			<td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
			<td style="background: #eee;" class="bodyText">3/4 (75%)</td>
			</tr>
			<tr>
			<td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
			<td style="background: #eee;" class="bodyText">3/3 (100%)</td>
			</tr>
			<tr>
			<td style="background: #eee;" class="bodyText"><b>High Score</b></td>
			<td style="background: #eee;" class="bodyText"><b>sjelkjd</b> for 874.63 points</td>
			</tr>
			</table>
			</blockquote>
			<p>If you visualize all the possible ways to schedule two processes, you'll see that each schedule is a 
			path through a directed acyclic graph (DAG). Each vertex of this graph represents a state, consisting 
			of how long each process has waited in combination with how much time each process has accrued.</p> 
			<p>Much like the TicTacToe problem from last round, this is a memoization problem. We walk the graph as 
			we generate it, keeping track of vertices we have visited. Anytime we revisit a vertex, we already 
			know the number of successful paths we will obtain through this vertex, and so we will never simulate 
			duplicate suffixes of schedules. </p>
			<p>The description of a state has 4 parts, so we will have a 4-dimensional array. The indices into this 
			array will be the components of the state: current wait time for process A; current wait time for process 
			B; time accrued by process A; and time accrued by process B. Since A gets the first slice, our initial 
			state is (0, 1, 1, 0). We call our recursive function with these parameters, and it will give us the answer.</p>
			<p>The first thing this recursive function does is check the memoization table, to see if an answer for the 
			given input parameters has already been computed. If so, it returns it. Otherwise it will have to compute 
			it. To compute it, we first determine if the state is valid or not. It is invalid if any of the components 
			of the state exceed their maximum values (too much time waiting or too much time accrued). If this is the 
			case, the function returns 0. Next, we determine if the state is a final, successful state or not. This is 
			any valid state where the accrued time for both processes is the number of time slices needed by each. If 
			this is the case, we return 1.</p>
			<p>Otherwise, we must traverse all the edges from this current state. There can be at most two, one 
			representing A being scheduled next, the other representing B being scheduled next. We recursively 
			call the function on the two possible states derived from the current state, and return the sum of 
			the return values. </p>



                        

                        <img src="/i/m/Logan_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left"/>
                        By <a href="/stat?c=member_profile&amp;cr=112902" class="bodyText"><strong>Logan</strong></a><br/>
                        <div class="smallText"><em>TopCoder Member</em></div><br />
                        <br clear="all" />
                        
                        <p><br/></p>
          
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


