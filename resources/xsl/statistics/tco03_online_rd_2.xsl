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

<title>2003 TopCoder Open sponsored by Intel&#174; - Online Round 2 Summary</title>

<xsl:call-template name="CSS"/>

<script>
function openWin(url, name, w, h) {
    win = window.open(url, 'biowin', "scrollbars=yes,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
    win.location.href = url;
    win.focus();
}
</script>

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
                                <td class="statTextLarge" bgcolor="#999999" width="50%" nowrap="nowrap"><font size="3">TCO - Online Round 2 Summary</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">Wednesday, October 22, 2003</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->
<h2>Match summary</h2> 

<p> 
Tensions and caffeine levels were high as the coding phase of Round 2 of the TopCoder Open started.  With competitors whose average rating was 1968, it was a surprise to no one that most coders flew through a simple easy problem that required little more than algebra.  However, as coders began to work on the medium problem, it became clear that, while the easy problem was no challenge, this was Round 2, and the problems were getting harder.  At the half hour mark, only a handful of coders had finished two problems, with tomek in the lead (out of coders who didn't skip the medium).  After about a half hour, the 500 submissions were flowing in pretty well, but a dismal success rate destined most of them to failure.  At the end of the coding phase, it was tomek in the lead, closely followed by SnapDragon.  During the challenge phase, SnapDragon was able to gain another 50 points, pushing him into the lead over tomek.  In room 6, Yarin managed to find two challenges and the 100 points propelled him into third place.  System tests turned out to be brutal for the medium problem, and almost 80% of the submissions failed, though the top 3 competitors emerged unscathed.  The next round, with an average competitor rating of 2207 promises to be at least as exciting, so tune in next time when we find out if SnapDragon really has a 100% chance of advancing to round 4, whether or not snewman can continue his streak in the face of ever increasing difficulty, and whether dplass, having learned about dynamic programming in the round tables, can beat the odds yet again and advance.
</p> 
  
<p>
<H1> 
The Problems 
</H1> 
</p> 

<font size="+2"> 
<b>Carbon14</b> 
</font> 
<A href="Javascript:openProblemRating(1916)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

Used as: Division One - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      250 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      196 / 197 (99.49%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      195 / 196 (99.49%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>hamster</b> for 247.83 points (2 mins 40 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      227.81 (for 195 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
Radioactive dating is an important technique used by scientists to determine the age of all sorts of things from ten thousand year old artifacts to billion year old rocks.  Because the half-life of Carbon-14 is relatively short, it is well suited for measuring the ages of artifacts from early civilization.  For older items, other techniques are required, since there is not enough Carbon-14 left to get an accurate date.  However, this is all pretty much irrelevant to actually solving the problem.

At first glance, one might expect a problem like this as the easy in round 2 of the TopCoder Open to require some sort of more advanced method, like a binary search.  And, if you're algebra was really rusty, a binary search, or a simpler linear search on the age of the artifact would have worked.  In fact, since the oldest the artifact could be (when the concentration is 1/10000) is only 76141 years, you could easily implement the following pseudocode, and it would run in plenty of time:
<pre>
    smaller = (concentration - error)/10000
    bigger = (concentration + error)/10000
    year = 1
    ret[0] = -1
    while (true)
        testConcentration = e ^ (-year/8267)
        if(testConcentration &lt; bigger and ret[0] = -1)
            ret[0] = year - 1
        end if
        if(testConcentration &lt; smaller)
            ret[1] = year
            return ret
        end if
        year = year + 1
    end while
</pre>
Doing it this way wasn't too hard, but any sort of search technique is bound to be more complex than finding an explicit formula for the answer, especially in this case.  We are told that:
<br/><tt>&#160;&#160;&#160;&#160;final concentration = initial concentration * (e ^ (- t / k))</tt><br/>
We are given the ratio <tt>(final concentration / initial concentration)</tt> and must take into account the error in this value.  So, we calculate an upper and a lower bound on the ratio by simply adding and subtracting the error, as alluded to in the problem statement.  Now, we want to manipulate the formula given to us so that we end up with t in terms of the ratio.  The first step is to divide both sides of the equation by <tt>initial concentration</tt> and apply the hint given to us in the notes.  This gives us:
<br/><tt>&#160;&#160;&#160;&#160;ln(final concentration / initial concentration) = - t / k</tt><br/>
Now we can apply some simply algebra to get:
<br/><tt>&#160;&#160;&#160;&#160;t = -ln(final concentration / initial concentration) * k</tt><br/>
So, applying this equation to the upper and lower bounds for the concentration ration, we can solve the following problem almost trivially:
<pre>
        vector&lt;int&gt; ret(2);
        ret[0] = (int)(-log((concentration+error)/10000.0)*8267);
        ret[1] = (int)(-log((concentration-error)/10000.0)*8267+1);
        return ret;
</pre>
To my knowledge, pretty much every coder was able to come up with something that looked like the above solution.
</p> 

<font size="+2"> 
<b>SameGame</b> 
</font> 
<A href="Javascript:openProblemRating(515)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      121 / 197 (61.42%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      25 / 121 (20.66%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>tomek</b> for 360.09 points (19 mins 21 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      240.39 (for 25 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 

While the easy problem from round 2 wasn't really any harder than the easy problems from round 1 or the qualification rounds, the medium problem was clearly a lot harder than other medium problems.  Although you weren't required to apply any particularly complicated algorithms (think dynamic programming or Djikstras), there were still some tricky aspects to this problem.  Furthermore, even if you have a correct algorithm, there were some large test cases that required your code to be relatively fast.<br/><br/>

The first thing that you'll probably want in this problem is a method that, given the coordinates of a block, <b>b</b>, tells you how many blocks of the same color are connected to <b>b</b>.  This method should run a pretty standard depth first flood fill, which first sets the status of <b>b</b> to <tt>visited</tt>, and then recursively calls itself with all of the adjacent, unvisited blocks of the same color as parameters.  It then returns the sum of these recursive calls, plus 1.  This is easier to see in pseudocode:
<pre>
    int floodFill(block b){
    <font color="blue">//A good way to implement this in real code is "int floodFill(int xCoord, int yCoord)"</font>
        int ret = 1;
        visited[b] = true;
        foreach block b' that is adjacent to b{
            if(b.color == b'.color &amp;&amp; !visited[b']){
                ret = ret + floodFill(b');
            }
        }
        return ret;
    }
</pre>


Once we have our flood fill method written, its not too hard to pick out which group to remove.  The tie breaker rule is designed such that if we order are loops correctly, we really only have to worry about color and group size.  (Veteran TopCoders will tell you that the tie breaker rules are often designed like this, so it usually pays off to spend a minute or two coming up with a way to order things so you don't need to worry about ties.)  Anyhow, the next step is to figure out how to pick and remove a group from the board.  For clarity, I'm going to break this out into a couple of separate methods, called find, which returns the coordinates of a block in the group to be removed, and remove, which takes the coordinates and removes the appropriate blocks.  The find method will loop through all of the blocks in the board and, if they haven't been visited yet (if they had been visited, it would mean they were in a group that had already been found), we will call our floodfill method.  So, the pseudocode for the find method contains two nested loops, and keeps track of the location of the <i>best</i> group found so far:
<pre>
    int[] find(){
        int bestColorIndex = 1000;
        int smallest = 10000;
        int r = -1, c = -1;
        for(int i = 0; i&lt;rows; i++){
            for (int j = 0; j&lt;cols; j++){
                int index = order.indexOf(block(i,j).color);
                if(index &lt; bestColorIndex){
                    bestColorIndex = index;
                    smallest = 10000;
                }else if(index &gt; bestColorIndex){
                    continue;
                }
                if(!visited[block(i,j)]){
                    int size = floodFill(block(i,j))
                    if(size &lt; smallest){
                        smallest = size;
                        r = i;
                        c = j;
                    }
                }
            }
        }
        return (r,c);
    }
</pre>
Now, the easy part is all done, here comes the tricky part.  Once we've found a group, how do we remove it?  Well, the first thing we want to do is mark all of the blocks in the group as removed.  We can do this using our flood fill routine, without modifying it.  First, we reset all of the blocks to unvisited.  Then, we call our floodFill routine with one of the blocks in the group to be removed.  Doing this leaves all of the blocks in the group marked, and we can now simply remove the blocks marked visited.  Now, once the blocks are removed, we have to drop and shift, and we want to do it efficiently.  Its not too hard to code something simple that first looks at every column, and shifts them when empty ones are found, and then repeatedly drops each block if there is an empty space under it, one row at a time.  If you do this starting from the bottom column, and the rest of your code is relatively fast, you'll probably pass.  However, this is a little bit slower than you might want to risk.  It turns out that you can do it all in one pass over the data, though its not easy to see how.  Basically, you iterate over the columns, and first drop and shift all of the blocks in the column.  If the column that you just dropped is empty, then you increment the number of columns to shift.  While you are dropping each column, you keep a tally of how many spaces to drop each block, so that you don't have to drop the blocks one at a time.  This gives you two tallies, one for how many columns to shift, and another for how many rows to drop, which allows you to move a piece to its final location as soon as you see it.  Here is the code, in Java, where '-' represents empty space.
<pre>
        int skipCols = 0;
<font color="blue">//skipCols represents the total number of empty columns seen so far.</font>
        for(int j = 0; j&lt;board[0].length; j++){
<font color="blue">//we start in the left most column, and work our way towards the right.</font>
            int skipRows = 0;
<font color="blue">//skipRows represents the total number of empty rows seen so far in the current column.</font>
            for(int i = board.length - 1; i&gt;=0; i--){
<font color="blue">//here, we start in the bottom row, and work up</font>
                if(board[i][j] == '-'){
<font color="blue">//if there is an empty square in this row, we increment skipRows</font>
                    skipRows++;
                }else{
<font color="blue">//otherwise, we move the current block down skipRows, and left skipCols</font>
                    board[i+skipRows][j-skipCols] = board[i][j];
                    if(skipRows&gt;0 || skipCols&gt;0){
<font color="blue">//if we moved the block somewhere else, we mark this spot as empty.</font>
                        board[i][j] = '-';
                    }
                }
            }
            if(board[board.length-1][j-skipCols] == '-'){
<font color="blue">//finally, if the whole column is empty we increment skipCols</font>
                skipCols++;
            }
        }
</pre>
Those are the three major components of a solution, and its not too hard to put them all together, and keep track of the score as groups are removed.</p> 

<font size="+2"> 
<b>Calculate</b> 
</font> 
<A href="Javascript:openProblemRating(1019)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1000 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      56 / 197 (28.43%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      38 / 56 (67.86%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>SnapDragon</b> for 860.56 points (11 mins 50 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      617.45 (for 38 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
This was a relatively standard parsing problem, too standard for the tastes of some coders.  After the contest it was argued that this was an easier problem than the medium, despite the fact that, in my opinion it was more algorithmically complex.
SnapDragon's solution to this problem is about as clean as they come, so I'm going to describe the approach he took.<br/><br/>  The first thing that we are going to want to do is write a recursive method to determine the value of an expression.  Initially we will call this method with the value of the entire expression, and then as we break the expression in half at operators, we will recursively call this method to evaluate each half.  Because the operators are evaluated from left to right, it turns out that we want to look at the expression from right to left so that when we break it in half, the order of operators is done correctly.  A simple example should illustrate why it is easier to look at the expression from right to left:
<br/><br/>
Say we have <tt>"4/2*5"</tt>.  We want to break this expression into two parts, and solve both parts independently, and then evaluate the entire expression based on those two parts.  If we split up the string at the left most operator, we end up evaluating "4" and "2*5", and there really isn't any way to get the correct answer (10) from doing it this way.  However, if we split at the right most operator, we evaluate "4/2" and "5", and then its easy to just multiply those together to get the correct answer.  Another way to say this is that, since the deeper recursive calls are evaluated first, we want to take the lowest priority, rightmost operator, and split the string around it.<br/><br/>
The next step is to deal with the different operators, and the parentheses.  Since we want to split the expression based on lower priority operators first, lets start by looking at how to split around '+' and '-' operators.  We should write a for loop that counts backward from the end of the expression.  Each time we see a ')', we should increment a counter (that we initialize to 0), and each time we see a '(' we should decrement that counter.  Then, if we see a '+' or a '-', and our counter is at 0, we know we have found the right most '+' or '-' that is not within any parentheses, and we should use that operator to split the expression.  In code, based heavily on SnapDragon's submission:
<pre>
    int evaluate(string expression){
        int parens = 0;
        for(int i = expression.size()-1; i&gt;=0; i--){
            if(expression[i] == ')'){
                parens++;
            }else if(expression[i] == '('){
                parens--;
            }else if(expression[i] == '+' &amp;&amp; parens == 0){
                return evaluate(expression.substr(0,i)) + evaluate(expression.substr(i+1));
            }else if(expression[i] == '-' &amp;&amp; parens == 0){
                return evaluate(expression.substr(0,i)) - evaluate(expression.substr(i+1));
            }
        }
        ...
    }
</pre>
If we don't find any '+'s or '-'s outside of parentheses to split on, then we do pretty much the same thing with '*' and '/'.  If there aren't any of those operators either, then we move on to exponentiation, which also works pretty much the same way.  However, taking powers can be a little bit tricky, and you may not want to trust the library pow function since it works with doubles and we are working with ints.  Writing your own pow function is pretty simple, but you have to make sure you handle 3 special cases properly: -1, 0 and 1.  0^x is always 0 (in this problem), 1^x is always 1, and -1^x is either -1 or +1, depending on whether x is odd or even.  A few coders missed these cases and because they only had a loop to calculate powers, and they timed out on inputs like 1^999999999.  Anyhow, after we do exponentiation, we are done with all of the operators that aren't nested within parentheses.  If we get to this point, there are only two cases: the expression is either a single number or variables, or else the first character is a '(' and the last character is a ')'.  Both cases are easy to handle.  In the first, we just parse the number or look up the variable and return that.  For the second, we simply call our recursive function with the first and last characters removed, and return the result.  If you want to see a full implementation of this, I recommend you look at SnapDragon's code, which implements the evaluate method I've described in only 40 lines.
</p> 


                        <p>
                        <img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" /><br />
                        By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=159052"><strong>lbackstrom</strong></a><br />
                        <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
                        </p>
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

