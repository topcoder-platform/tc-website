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

<title>Single Round Match 200 Statistics at TopCoder</title>

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
     <td width="170" bgcolor="#FFFFFF">
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
                             <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 200</font></td>
                             <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                         </tr>

                         <tr valign="middle">
                             <td class="bodyText">Monday, June 21, 2004</td>
                             <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                         </tr>
                     </table>
<!--end contextual links-->

<h2>Match summary</h2>

<p>
The turnout for SRM 200 was high as competitors all hoped to get lucky and win some TopCoder Gear.  Of the 78 members who competed is SRM 1, jonmac was the only one (that I noticed) who was on hand for the 200<sup>th</sup> SRM.  Thanks to all the TC staff and all the members for making TopCoder such a fun place to learn and compete for the past 3 years.  I know that I, for one, have learned a lot from my experiences at TopCoder.<br/><br/>
The problems in div 2 were pretty typical in terms of difficulty and a veteran TopCoder, hustler, took first with the help of 2 successful challenges.  Division 1 had things a little harder, and few people where able to solve the medium problem, let alone the hard, though this was perhaps exacerbated a little by system issues.  At the end of the night, SnapDragon pulled out the miracle upset, and won his umteen<sup>th</sup> SRM.  Eryx was the only other coder to complete the hard problem successfully, but his medium failed, and so he ended up a distance second.  tomek took third, leading some coders to wonder if his newfound wealth was leading him down a path of indulgence and vice, away from good wholesome TopCoding (he hasn't won an SRM since winning the TCCC).
</p>
 
<p>
<H1>
The Problems
</H1>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2868&amp;rd=5075">NoOrderOfOperations</a></b>
</font>
<A href="Javascript:openProblemRating(2868)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      187 / 217 (86.18%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      174 / 187 (93.05%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>CSAddict</b> for 246.92 points (3 mins 11 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      204.99 (for 174 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Most people were able to solve this problem without much trouble.  Since we aren't worrying about order of operations, we can just iterate over the numbers in the string.  This is particularly easy because all of the numbers contain only a single digit, and hence occur every two characters.
So, we'll start by initializing our return value to the integer value of the first character in the string.  Then, we look at two characters at a time, performing the operation requested on the return value and the single digit, storing the result back in the return value.  One thing to note is that the best way to convert a single character to an integer is to subtract '0' from it.  
See CSAddict's solution for a nice clean implementation of this.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2417&amp;rd=5075">GravityBomb</a></b>
</font>
<A href="Javascript:openProblemRating(2417)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      145 / 217 (66.82%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      90 / 145 (62.07%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Shavlugin</b> for 463.62 points (8 mins 5 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      330.31 (for 90 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem was clearly inspired by Tetrinet, a multiplayer Tetris game that contains a number of special items, including a gravity block.  If you're a Tetris fan and have never played, I suggest you find a friend to play with and download it.  Anyhow, there are a couple of approaches to solving this problem.  <br/>
The first approach is to drop all of the blocks, on square at a time, until you can drop no more.  While the order of your loops may vary, all of these solutions follow the same basic structure:
<pre>
updated = true
while(updated)
    updated = false
    search for a block over a space
    if(found)
        drop the block
        updated = true
    end
end
</pre>
If you wanted to be more efficient (which wasn't necessary), another approach was to continue to drop each block until it would drop no further.  You could also be sure to start with blocks closer to the bottom so that you never had to drop a block more than once.  A solution along these lines might look something like this:
<pre>
foreach (i = 0 to columns-1)
    foreach (j = rows-1 to 0)
        if(board<sub>j,i</sub> == 'X')
            k = j+1
            while(k &lt; rows &amp;&amp; board<sub>k,i</sub> == '.')
<font color="blue">//As long as the character in row k is a '.', 
//move the 'X' from column k-1 down one row.
//Then increment k so that board<sub>k-1,i</sub> is always an 'X'</font>
                board<sub>k-1,i</sub> = '.'
                board<sub>k,i</sub> = 'X'
                k = k+1
            end
        end
    end
end
</pre>
With both of the above solutions, you have to clear the complete lines at the end, which can be done in the same way, regardless of how you decide to drop the blocks:
<pre>
while(board<sub>rows-1</sub> is all 'X's)
    for(i = rows-1 to 1)
        board<sub>i</sub> = board<sub>i-1</sub>
    end
    set board<sub>0</sub> to all '.'s
end
</pre>
Yet another approach, and the best one in my opinion, requires that we start by counting the number of 'X's are in each column.  Once we have this information, we can easily compute the number of complete rows that will be formed as the minimum number of 'X's in a column.  Thus, the number of remaining 'X's in each column will be equal to the number of 'X's that were originally in the column minus that minimum.
If we know the total number of 'X's in each column, it's pretty straightforward to fill in the return with the appropriate 'X's and '.'s.  Shavlugin used this approach to get the high score on the problem.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2415&amp;rd=5075">WindowManager</a></b>
</font>
<A href="Javascript:openProblemRating(2415)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      900
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      53 / 217 (24.42%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      28 / 53 (52.83%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Javaholic</b> for 622.20 points (21 mins 4 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      462.91 (for 28 correct submissions)
    </td>
  </tr>
</table></blockquote>

Used as: Division One - Level One: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      300
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      193 / 204 (94.61%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      147 / 193 (76.17%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Eryx</b> for 282.86 points (7 mins 4 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      200.35 (for 147 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
It has been a long time since a div 1 easy was also a div 2 hard.  In the past, this has usually been bad for one of the divisions, as the difficulty never seemed to quite work out.  However, while this one was a bit on the hard side for a div 1 easy, it seemed to work out OK, as about 3/4 of div 1 coders submitted it successfully, and it was still hard enough for a div 2 hard.<br/><br/>
A quick glance at the constraints should tip you off to the fact that iterating over every pixel in every window will time out.  Though the display is at most 100x100, the windows are potentially huge, and doing anything that loops over tlv and tlh is bound to timeout.  One way around this is to treat boxes which extend outside the display region as if they just barely extend outside the display region.  In other words, if a window extends all the way to -1,000,000, we might as well treat it as if it extended only to -1.<br/><br/>
Once we've done this, it's just a matter of looping over every pixel in each window and drawing them.  legakis' solution uses this approach and is pretty easy to follow.  schveiguy does something similar, and even has comments in his code.  One neat trick that is used in both of these solutions to make the logic a little simpler is to fill in the '+' after the '-' and '|'.  This makes our border test a little simpler, since we don't have to worry about the '+' as much.  We simply write the '+' last and overwrite any '|' or '-' that we placed there before.<br/><br/>
Another approach to this problem is to think about it not in terms of drawing boxes, but in terms of determining what color each pixel is.  Hence, we iterate over every pixel in our 2-D array, and then iterate over the windows, in order and color the pixel appropriately.  So, for example, you look at the pixel at (0,0) and then iterate over each window.  If (0,0) falls within that window (which you can check by comparing (0,0) to the upper left and lower right coordinates of the window) then you color it appropriately.  In the end, both approaches wind up looking pretty similar - the difference is mostly conceptual.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2416&amp;rd=5075">NCMultiplication</a></b>
</font>
<A href="Javascript:openProblemRating(2416)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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
      66 / 204 (32.35%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      34 / 66 (51.52%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>SnapDragon</b> for 419.70 points (12 mins 56 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      262.44 (for 34 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Factoring is generally a hard problem to solve for large numbers. Many encryption algorithms rely on this fact.  However, a simple brute force algorithm can easily run in O(sqrt(N)), where N is the number being factored.  In this problem, the constraints limit N to 10<sup>14</sup>, which makes sqrt(N) only 10<sup>7</sup>, plenty small for a brute force solution.<br/><br/>
The first step to factoring a the number given to you is to convert it into a regular 64 bit integer, which we'll call N.  This is much simpler than you might first think.  If there is a 30 in the ones place (the last element of digits), that means that we would normally write down a 0 and carry the 3.  But, why bother doing the carrying ourselves?  Instead, just add 30 to your running total, and your CPU will take care of the carrying for you.  Then, move on to the tens digit, and add 10 times its value to the running total, and so on.  In this way, you can construct the value of the input with a single for loop.<br/><br/>
Once you've done this, you should take the square root of the N, and write a loop that goes up to this square root.  If our loop variable is i, then we have found a factor when N/i is an integer, or when N%i == 0.  Once we've found a pair of factors, we simply reconstruct the no-carry product, and check that they match.  The simplest way to do this is to multiply pairs of digits, just like we would on paper, and add up the result.  To extract the j<sup>th</sup> digit (indexed from 0) from the right of a number, K, you can do <tt>K/10<sup>j</sup>%10</tt> (assuming integer division).  See SnapDragon's solution to see exactly how to do this.<br/><br/>
Since we are sort of pushing the limits of the 8 second runtime, it is worth a bit of analysis.  In the worst case, we might imagine that every one of the 10<sup>7</sup> numbers was a factor of N, and each one requires O(|digits|<sup>2</sup>) iterations.  This puts us up on the order of 200,000,000 iterations, which is pretty likely to timeout.  Luckily, however, most of the numbers we iterate over are not factors.  In fact, we never find more than about 6000 factors, so the majority of our execution time is spent finding the factors, not checking them once they're found.<br/><br/>
It is interesting to note that this problem was made considerably easier during development.  Originally, the limit was as high as a 64 bit int would hold, and the brute force solution described here would stand no chance of passing.  Jan_Kupiers' solution was the first one I saw that used an approach which would have worked with larger inputs.  The basic idea is to use recursion with backtracking.  You assign digits either from left to right or right to left (left to right seems to be faster), and check that things add up as you go.  There are a number of optimizations you can make to break out of recursion early once you've assigned some digits which make finding a solution impossible.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2852&amp;rd=5075">Graduation</a></b>
</font>
<A href="Javascript:openProblemRating(2852)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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
      6 / 204 (2.94%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      2 / 6 (33.33%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>SnapDragon</b> for 705.30 points (20 mins 13 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      593.69 (for 2 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Bipartite matching and max flow problems are always hard for people, and this problem was no exception.  However, if you are familiar with bipartite matching, it is relatively straightforward, and the lexicographic requirement doesn't really add much complexity.  If you aren't so familiar with bipartite matching, the next paragraph should provide a brief introduction.<br/><br/>
Bipartite matching is a problem that comes up relatively often in some fields.  In its simplest incarnation, you are given two sets, A and B, and a set of pairs E in (A x B).  The task is then to find the largest subset of E such that no two pairs in the subset contain the same element.  Another way to think about this is as a graph problem.  You are given a bipartite graph and want to find the largest subset of edges such that no two edges share an endpoint.<br/><br/>
The problem is closely related to the maximum flow problem, and there are many different ways to solve it.  In this discussion I'll only go into the simplest of these methods, but if you are interested, a search on max flow or bipartite matching should yield many alternative, faster algorithms.<br/><br/>
The basic idea behind this algorithm is to iterate over each element of set A and try to match it to some element in set B.  A problem arises when we want to match an element of A, a<sub>1</sub>, to an element of B, b<sub>1</sub>, which is already matched to some other element of A, a<sub>2</sub>.  In this case, we would like to unmatch b<sub>1</sub> and a<sub>2</sub> and match a<sub>2</sub> to something else so that we can match a<sub>1</sub> to b<sub>1</sub>.  It is important that we find something else to match a<sub>2</sub> to, otherwise we end up going around in circles.<br/><br/>
Now, as you can imagine, we might want to match a<sub>2</sub> to some b<sub>2</sub>, but find that b<sub>2</sub> is already matched to a<sub>3</sub> and so on.  Hence, we must use either recursion, or a queue to explore a number of possibilities where we break some number of previous matches and then add new ones.  The trick to making this run fast enough is to notice that, if we couldn't find something else to match a<sub>3</sub> to in order to match a<sub>2</sub> to b<sub>2</sub>, then we also won't be able to match a<sub>3</sub> to something else in order to match a<sub>1</sub> to b<sub>2</sub>.  In other words, if breaking a matching doesn't work out once, it never will.<br/><br/>
So, here is some matching pseudocode implementing this algorithm:
<pre>
    main(){
        foreach (a in A){
            set visited(b) = false for all b in B
            foreach (b in B){
                if((a,b) is in E){
                    if(recurse(b)){
<font color="blue">//If recurse(b) returns true, it means that b was either
//free to begin with or else b was matched but has been
//successfully unmatched.  So, we can add (a,b) to the 
//matching and move on to the next a</font>
                        add (a,b) to matching
                        break
                    }
                }
            }
        }
    }

<font color="blue">//recurse returns true if b is either already unmatched or has been
//successfully unmatched from whatever it was previously matched to</font>            

    recurse(b){
<font color="blue">//If visited(b) is true, it means that we've already 
//check if b is free and it was already matched to 
//something and we couldn't figure out a way to unmatch it</font>
        if(visited(b))return false
        visited(b) = true
        if((x,b) is in matching for some x){
<font color="blue">//b is matched to x</font>            
            foreach(b' in B){
                if(b!=b' &amp;&amp; (x,b') is in E){
<font color="blue">//let's try to match x to b' instead</font>            
                    if(recurse(b')){
<font color="blue">//If we get here, b' is free and we can match x to it</font>            
                        remove (x,b) from matching
                        add (x,b') to matching
                        return true
                    }
                }
            }
            return false
        }else{
<font color="blue">//b was unmatched</font>            
            return true
        }
    }
</pre>
That was an admittedly brief introduction to a topic which is often covered in whole chapters of textbooks.  If you are still unclear about how the matching algorithm works, or if you want a proof, there are a lot of good resources to be found with a simple search.  But, back to the task at hand - how does matching apply to Graduations?<br/><br/>
To start with, we are going to translate our graduation requirements into the set B in the matching problem.  For each element of requirements, we are going to make a number of nodes equal to the value of the leading integer in that element of requirements.  Next we are going to transform our classes into the set A in the matching problem.  For each class, we are going to add an element to set A. Finally, we'll create E.  For each pair (a,b) in A x B, if a is present in the element of requirements corresponding to b, then we add (a,b) to E.<br/><br/>
Now, the goal is to find a matching such that every element of B is matched to some element of A.  In other words, every requirement is fulfilled by some class.  The nature of the matching problem ensures that no class may fulfill more than one requirement.  Therefore, if we can find a matching whose size (the size of a matching is the number of (a,b) pairs in it) is equal to the size of B, we'll have satisfied every requirement.<br/><br/>
We start by trying to match each of the classes we've already taken (characters in classesTaken) to some requirement.  Once we have matched as many of the classes that have been taken as possible, we move on to match classes not yet taken.  In order to ensure the lexicographic requirement on the return, we try to match classes to requirements in lexicographic order by class, starting with the lowest.  If we find a match for a class, we add that class to our return value, otherwise we don't.  Since the matching algorithm only lets us assign one class to a requirement, we can be sure that we are not taking any extra classes.<br/><br/>
In the end, we need to check and make sure that we have indeed fulfilled all of the requirements (matched every element of B).  If so, we simply return the classes we took as a string.  Both of the successful submissions use the general approach described here.  The biggest difference is that they both used a queue instead of recursion (which amounts to doing a BFS to find an augmenting path, instead of a DFS, for those of you who know about augmenting paths), and Eryx modified his matching a little bit so that he only made a single element for each requirement (it is the same conceptually, but it runs faster if you do it that way).<br/><br/>
The runtime for all this the way I've described it is O(|requirements|*100*|classes|<sup>2</sup>) if you implement it well, though I'll leave the proof as an exercise.
</p> 


                     <p>
                     <img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                     By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=159052"><strong>lbackstrom</strong></a><br />
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
