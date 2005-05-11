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
                <xsl:with-param name="title">Room 2: Problems</xsl:with-param>
            </xsl:call-template>

            <xsl:call-template name="tccc03_links">
                <xsl:with-param name="selectedTab">summary</xsl:with-param>
            </xsl:call-template>

            <xsl:call-template name="summary_links"/>
    
            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr><td height="1"><img src="/i/clear.gif" alt="" width="10" height="3" border="0"/></td></tr>
                <tr><td class="tourney_subnav"><strong>Semifinal Room 2 Problem Analysis &amp; Opinion</strong></td></tr>
                <tr valign="top">
                    <td width="10%" class="bodyText">
            <p>Friday, April 4, 2002</p>
            <p><b>Problem Summary</b></p>
            <p>
            These were easy problems, by semifinal standards.  The easy problem, a 
            Reverse-Polish-Notation calculator, is really just a measure of typing speed.  The medium, a sort of Tic-Tac-Toe 
            &quot;AI&quot;, was relatively easy for a medium problem as well.  The hard problem was nice and hard, however,
            with a brief and elegant solution that is only apparent after some thinking.
       		</p>
			<font size="+2"><b>RPN</b></font><br />
   			 Used as: Level 1:
   			<blockquote>
   			<table cellspacing="2" cellpadding="2">
			<tr>
			<td style="background: #eee;" class="bodyText"><b>Value</b></td>
			<td style="background: #eee;" class="bodyText">200</td>
			</tr>
			<tr>
			<td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
			<td style="background: #eee;" class="bodyText">4/4 (100%)</td>
			</tr>
			<tr>
			<td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
			<td style="background: #eee;" class="bodyText">4/4 (100%)</td>
			</tr>
			<tr>
			<td style="background: #eee;" class="bodyText"><b>High Score</b></td>
			<td style="background: #eee;" class="bodyText"><b>niteneb</b> for 183.76 points</td>
			</tr>
			</table>
			</blockquote>
			<p>
           	This is a very easy problem for a semifinal round. All one needs is a working implementation of a stack, which any 
          	language would come with. Or one could go without an explicit stack altogether, solving the problem recursively.
            </p>
			<p>
         	The process of evaluating an expression is fairly well described in the problem statement. We read the next token 
           	(separated conveniently by spaces).  If it is a digit, we push that value onto the stack.  Otherwise, it is an 
          	operation that we must apply to the top one or two elements of the stack.
            </p>
			<p>
    		Application of an operator is a simple <tt>switch</tt> statement (or something similar).
          	Not all of the operators are commutative (order is important for the <tt>-</tt> operator),
 			so it is important to make sure that operator is applied to the operands in the proper order.
			When subtracting, the top of the stack is subtracted <i>from</i> the value just below it.
            </p>
			<p>
			All that is left at this point is error checking. It is easy enough to ensure that the stack is empty at the end of 
			evaluation.  It is marginally more difficult to make sure that the stack is non-empty every time a value is popped.  
			The whole evaluation process could simply be surrounded by an exception handler, or one can just be careful about 
			performing error checking at each point in the code where values from the stack are popped.
            </p>
			<font size="+2"><b>TicSolver</b></font><br />
			Used as: Level 2:
			<blockquote>
			<table cellspacing="2" cellpadding="2">
			<tr>
			<td style="background: #eee;" class="bodyText"><b>Value</b></td>
			<td style="background: #eee;" class="bodyText">500</td>
			</tr>
			<tr>
			<td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
			<td style="background: #eee;" class="bodyText">4/4 (100%)</td>
			</tr>
			<tr>
			<td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
			<td style="background: #eee;" class="bodyText">4/4 (100%)</td>
			</tr>
			<tr>
			<td style="background: #eee;" class="bodyText"><b>High Score</b></td>
			<td style="background: #eee;" class="bodyText"><b>dmwright</b> for 364.04 points</td>
			</tr>
			</table>
			</blockquote>
			<p>
			This simplest form of Tic-Tac-Toe is generally liked by programmers, because it is such a small	game.  
			There are only 3<sup>9</sup> = 19683 possible ways to draw a Tic-Tac-Toe board, and only a subset of those 
			possibilities represent valid game states.  Because of this, it is easy to generate every possible outcome 
			from a given starting state.
            </p>
			<p>
			The first piece of code we need is a function that determines whether a particular player has won. The crudest method 
			is hard-coding expressions that determine if every position in each winning triple of locations is occupied by the same player.  
			There are only eight of these triples. Once we have this function, we can work on board validity, as well as generating 
			possible outcomes.
            </p>
			<p>
			There are two ways to determine board validity.  The first consists of simply generating all possible states from the initial, 
			empty board, by following the rules of the game. If the input configuration isn't in this set of possible states, then 
			it must be invalid.
            </p>
			<p>
			The other method is more analytical and easier to make a mistake with. First, count the number of Xs and the number of Os.  
			Since in this problem O goes first, the difference between the number of Os and the number of Xs must be either 0 or 1. Any 
			other difference indicates an invalid board.  There are also a few other invalid conditions that involve a player having 
			already won.  If the number of Os exceeds the number of Xs, but X has won the game, we have an invalid state.  
			If the number of Os equals the number of Xs, but O has won the game, we have an invalid state.  If both players have won, 
			we also have an invalid state.
            </p>
			<p>
          	We are now ready to generate all the possible outcomes.  These will be generated within a directed acyclic graph (DAG) structure.
 			Each particular state branches off into a number of possible new states, except for wins or draws which 
 			form the vertices with no outgoing edges. For each state, we will need to know whose turn is next and whether or not they have won.
            </p>
			<p>
                Once we have this DAG (or the means of generating it as we go along), we can implement a recursive function
                that determines which player can force a win (if any) by walking the DAG.
                The base case is when the next player can win on the next move or when all the locations are filled.
                This corresponds to a vertex in the DAG with no outgoing edges.
                Otherwise we look at every possible move for the current player.  Our recursive function will tell us for
                each move whether a win is forced or not.  If there exists a move that forces a win for the current player,
                then we know that the current state also means a forced win for the current player.  Otherwise, the current
                player has to hope for a way to force a draw.  If a move exists that forces a draw, then the current state
                also forces a draw.  Otherwise, the other player can force a win from this particular state.
            </p>
			<p>
                The DAG generation and the walk of the DAG can be implemented either separately and explicitly,
                or together and implicitly.  Implemented implicitly, the solution looks like standard memoization.
                It helps to be able to generate a unique identifier for each state (e.g., a 9-digit number in base-3),
                so that one can look up the result for a particular state in the memoization table.  The return value
                for our public method can then just involve a lookup of the input state in that table, after a check
                for validity first.
            </p>
			<font size="+2"><b>TelephoneGame</b></font><br />
			Used as: Level 3:
			<blockquote>
			<table cellspacing="2" callpadding="2">
			<tr>
			<td style="background: #eee;" class="bodyText"><b>Value</b></td>
			<td style="background: #eee;" class="bodyText">1050</td>
			</tr>
			<tr>
			<td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
			<td style="background: #eee;" class="bodyText">2/4 (50%)	</td>
			</tr>
			<tr>
			<td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
			<td style="background: #eee;" class="bodyText">0/2 (0%)</td>
			</tr>
			</table>
			</blockquote>
			<p>
                This is the sort of problem where the solution is difficult to derive, but once it is discovered, it
                is very easy to implement.  What makes this problem tractable is the fact that a circle of irremovable
                connections is given.  We know right off that a connection will have to be routed either within this circle or without.
            </p>
			<p>
                For each pair of removable connections, we first determine whether they can exist on the same side of the
                circle without crossing.  Given two points along a circle, any third point on that circle will be between
                those two points.  If we arbitrarily pick one of the two given points, the third point will be located
                in an interval that is either the clockwise or counterclockwise relative to the chosen point.  This gives
                us a simple means of labelling the two intervals.
            </p>
			<p>
                To apply this model to this problem, let the two given points be the endpoints of one connection.
                Then take a second connection.  If and only if both endpoints of the
                second connection are located in the same interval, then the connections do not cross.
            </p>
			<p>
                For each pair of connections that cross, we know they must be routed on opposite sides of the circle.  Suppose we
                build a graph, where each vertex represents a connection, and an edge between two connections indicates that the
                two connections cannot exist on the same side of the circle.  Then it becomes evident that what we want to find the
                largest subset of edges that make this a bipartite graph, meaning that the vertices can be grouped into two sets
                consisting of vertices that have no edges to each other.
            </p>
			<p>
                So all we have to do is build this graph, iterate through all subsets of edges in this graph, and choose the
                subset with the most edges that gives a bipartite graph.  To iterate through subsets of a set of
                <i>n</i> elements, just count from
                0 to 2<sup><i>n</i></sup> - 1.  The binary representation of our counter will describe each subset.
            </p>
			<p>
                For each subset, we have to determine whether it describes a bipartite graph.  An alternate definition of
                a bipartite graph is that it contains no cycles of odd length.  Or, put another way, it means that we can
                color all the edges using only two colors without having any two adjacent edges be the same color.
                Whichever definition you choose to work with, it is fairly easy to implement a function that walks the graph
                consisting of any given subset of edges and finds all the minimum-length cycles.  If none exist that are of
                odd length, we have a bipartite graph.
            </p>


			<IMG SRC="/i/m/Logan_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
			By&#160;Logan<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/stat?c=member_profile&amp;cr=112902" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
                        
                        
                        
           	<p><br/></p>
          
                    </td>
                </tr>                  

                <tr><td height="1"><img src="/i/clear.gif" alt="" width="10" height="3" border="0"/></td></tr>
                   
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


