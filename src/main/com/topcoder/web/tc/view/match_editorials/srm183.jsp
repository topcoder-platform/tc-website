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

<div style="float: right;" align="right"><A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="505632" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 183</span><br>Wednesday, February 11, 2004
<br><br>

<span class="bigTitle">Match summary</span>

<p> 
Division 1 had a pretty hard set last night, with a slightly harder easy problem, and a tricky medium geometry problem that stumped most coders.  Only 24 of them where able to successfully pass the medium, though many tried.  The hard involved dynamic programming/memoization, and though it had a higher success rate, many fewer people submitted it.  mathijs had the highest score from the coding phase, and 2 successful challenges secured a win for him.  SnapDragon and John Dethridge were not far behind in second and third, respectively.  In division 2, coders had a much easier time and boets narrowly edged out gigz and xmux for the win.
</p> 
  
<p>
<H1> 
The Problems 
</H1> 
</p> 

<font size="+2"> 
<b>CountGame</b> 
</font> 
<A href="Javascript:openProblemRating(2337)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505632" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      350 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      163 / 235 (69.36%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      104 / 163 (63.80%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Bilroy</b> for 339.81 points (4 mins 56 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      249.61 (for 104 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
You were asked to find an ideal strategy for a counting game, where two players take turns counting off up to maxAdd numbers.  The first person to hit a certain goal number wins.  Luckily, the winning strategy was outlined in the problem statement and all we had to do was implement it.  No matter how many numbers our opponent counts off, we can always count off enough so that maxAdd+1 numbers were counted off.  Thus, if we can end on goal-(maxAdd+1), then we can force a win.  In fact, by induction, if we can end on goal-n*(maxAdd+1), for some n, we can force a win.  Since the goal is relatively small, we could simply start counting backwards maxAdd+1 at a time:
<pre>
   for(int i = goal; i&gt;=next; i-=(maxAdd+1)){
      if(i-next+1&lt;=maxAdd)return i-next+1;
   }
   return -1;
</pre>
Alternatively, we could use a bit of modular arithmetic to come up with the following:
<pre>
   int ret = (goal-next+1)%(maxAdd+1);
   return ret==0?-1:ret;
</pre>
</p> 

<font size="+2"> 
<b>BridgeSort</b> 
</font> 
<A href="Javascript:openProblemRating(2336)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A> 
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505632" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      550 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      153 / 235 (65.11%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      118 / 153 (77.12%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>boets</b> for 512.33 points (7 mins 49 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      352.97 (for 118 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
Sorting problems are pretty common, and everyone has there own favorite way of doing them.  One way or another, you need two things: a way to compare two elements, and a sorting algorithm.  Usually, when I solve these problems, I end up writing a slow, but simple bubble sort, which always looks more or less like this:
<pre>
   for(int i = 0; i&lt;n; i++){
      for(int j = 0; j&lt;i; j++){
         if(element[i] &lt; element[j])
            swap(i,j);
      }
   }
</pre>
To compare then, we first compare the suit, and if that is not equal, we know right away which one comes earlier.  If the suits are the same, then we have to compare the values.  Rather than actually break the cards up in to their own array, and then sort that, and then put them back into a string, I did the whole thing in a single char array, comparing pairs of character, which I think ends up making your code a little shorter.  Note that using the indexOf method in a String is a good, robust way of imposing an order on characters, be they cards, or hex digits, or whatever.
<pre>
   String cards = "CDHS23456789TJQKA";
   for(int i=0; i&lt;hand.length; i+=2){
      for(int j = 0; j&lt;i; j+=2){
         if(suits.indexOf(hand[i]) &lt; suits.indexOf(hand[j]) ||
            suits.indexOf(hand[i]) == suits.indexOf(hand[j]) &amp;&amp;
            suits.indexOf(hand[i+1]) &lt; suits.indexOf(hand[j+1])){
            char c = hand[i];
            hand[i] = hand[j];
            hand[j] = c;
            c = hand[i+1];
            hand[i+1] = hand[j+1];
            hand[j+1] = c;
         }
      }
   }
</pre>
</p> 

<font size="+2"> 
<b>TVAntenna</b> 
</font> 
<A href="Javascript:openProblemRating(2357)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505632" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      750 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      98 / 235 (41.70%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      55 / 98 (56.12%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>boets</b> for 711.58 points (6 mins 40 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      573.54 (for 55 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
This is a substantially easier version of the division 1 medium, where we only allow towers at integral coordinates, and there are only 160,801 such integral coordinates to consider.  Basically, we can just iterate over all pairs of coordinates, and for each pair calculate the distance to each town using the pythagorean formula.  The radius required for a tower at a given location is the maximum distance from that location to a town.  Once we've calculated the radii from each location, we just return the minimum:
<pre>
      double ret = 100000;
      for(int i = -200; i&lt;=200; i++){
         for(int j = -200; j&lt;=200; j++){
            double rad = 0;
            for(int k = 0; k&lt;x.length; k++){
               double dx = x[k]-i, dy = y[k]-j;;
               rad = max(rad,sqrt(dx*dx+dy*dy));
            }
            ret = min(ret,rad);
         }
      }
      return ret;
</pre>
</p> 

<font size="+2"> 
<b>TennisSet</b> 
</font> 
<A href="Javascript:openProblemRating(2339)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505632" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      185 / 186 (99.46%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      144 / 185 (77.84%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>antimatter</b> for 245.60 points (3 mins 48 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      205.34 (for 144 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
To solve this, the first thing we need is a variable that tells us who is serving, <i>turn</i>, and a way to keep score.  I think that the best way to keep score is to have both the score in the curent game, and the score in the set in two-element arrays, <i>game</i> and <i>set</i>.  Then, the <i>turn</i> flips between 0 and 1, and is really an index into the <i>game</i> and <i>set</i> variables.  With this initialization, we start iterating over all the points scored.  If we see an 'S', we note that <i>winner</i> = <i>turn</i>, and other wise it is 1-<i>turn</i>.  Then, we simply increment <i>game[winner]</i> and check to see if that point ended the current game. The current game has ended if <i>game[winner]</i> &gt;= 4 and <i>game[winner]-game[1-winner]</i> &gt;=2.  If the game is over, we reset the game score, increment <i>set[winner]</i>, and check to see if the set has just been won:
<pre>
   int set[] = new int[2], game[] = new int[2], turn = 0;
   for(int i = 0; i&lt;points.length; i++){
      for(int j = 0; j&lt;points[i].length(); j++){
         int winner = points[i].charAt(j)=='S'?turn:1-turn;
         game[winner]++;
         if(game[winner] - game[1-winner] &gt;= 2 &amp;&amp; game[winner] &gt;= 4){
            game = new int[2];
            set[winner]++;
            if(set[winner] - set[1-winner] &gt;= 2 &amp;&amp; set[winner] &gt;= 6)return set[0]+"-"+set[1];
            turn = 1-turn;
         }
         
      }
   }
   return set[0]+"-"+set[1];
</pre>
</p> 

<font size="+2"> 
<b>TVTower</b> 
</font> 
<A href="Javascript:openProblemRating(2260)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505632" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      675 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      98 / 186 (52.69%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      24 / 98 (24.49%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Ruberik</b> for 643.58 points (6 mins 20 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      435.11 (for 24 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
Geometry problems are always a bit daunting, but if you know the right tricks, they are usually fairly simple.  In this problem, the trick was to find the center of a circle that is defined by three points that are on it.  To see how this helps, consider some circle enclosing all of the towns in the input.  Unless there are two points directly opposite each other on the circle, or three points actually on the circle, then we can shrink the circle a little bit, and still enclose everything.  Thus, we want to consider all circles that either have two points directly opposite each other (these ones are easy) and all circles that have three points on their edge.  Now, to find the center of a circle, given three points, we first draw a line between each pair of points.  Now, take the perpendicular bisector of that line, and you'll see that is passes through the center of the circle.  Thus, to find the center, we simply need to intersect the perpendicular bisectors.  The easiest way to do this is to consider lines to be defined by A, B and C, where <tt>Ax+By=C</tt>.  This formula doesn't require any special cases for vertical lines (as the y=mx+b form does) and typically makes things easier.  So, the first step is to find formulas for two of the perpendicular bisectors.  If we were finding the formula for the line between two points (x1,y1) and (x2,y2), we would take A=y2-y1, B=x1-x2 and C=Ax1+By1.  One can easily verify by substitution that the resulting A, B and C also gives C=Ax2+By2.  So, we can find the line between two points, but we want the line that is perpendicular to that.  Let's call the A and B values for the line between the two points A' and B'.  Then all lines perpendicular to it can be defined by formulas of the above form using A=B' and B=-A'.  In other words, our perpendicular bisector will have A=x2-x1 and B=y2-y1.  To find C, we simply substitue the one (x,y) pair that we know lies along the line into the formula, the point halfway between (x1,y1) and (x2,y2): C=A(x1+x2)/2+B(y1+y2)/2.  Now, once we two sets of (A,B,C) triples for two of the perpendicular bisectors, we have too intersect them.  This can be done in a number of ways, the simplest of which involves a bit of linear algebra.  I won't go into the details, but basically you are just solving two simulaneous equations with two unknowns.  There will be some cases when there is no solution, in which case the perpendicular bisectors are parrallel and we can just ignore these cases.  The code below shows one way to do the last step, finding the values of x and y from the (A,B,C) triples.  Note that d==0 indictes there is no solution.
<pre>
   double[] center(int x1, int y1, int x2, int y2, int x3, int y3){
      double A1 = x1-x2;
      double A2 = x2-x3;
      double B1 = y1-y2;
      double B2 = y2-y3;
      double C1 = (A1*(x1+x2) + B1*(y1+y2))/2;
      double C2 = (A2*(x2+x3) + B2*(y2+y3))/2;
      double d = A1*B2-A2*B1;
      if(d==0)return new double[]{0,0};
      double y = (A1*C2-A2*C1)/d;
      double x = -(B1*C2-B2*C1)/d;
      return new double[]{x,y};
   }
</pre>
</p> 

<font size="+2"> 
<b>Ambigram</b> 
</font> 
<A href="Javascript:openProblemRating(2277)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A> 
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505632" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
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
      23 / 186 (12.37%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      11 / 23 (47.83%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>po</b> for 500.40 points (31 mins 14 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      445.87 (for 11 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
Dynamic programming or memoization, take your pick.  Either way, to solve this problem you reuse your computations in order to make your code run fast enough.  I'll go into the memoization solution, since I think its a bit easier to understand.  The first step to writing any memoized solution is to write a recursive function that solves the problem, ignoring runtime speed issues.  In this case, our recursive function has two parameters: a word to turn into an ambigram, and a boolean that tells us if we need to return an ambigram with at least one letter, of if the empty string will do when that is cheapest.  Our base case is when the length of the word to be made into an ambigram is 0 or 1.  If it is 0, then we return "", with a cost of 0.  If it is 1, then we check to see if its ok to return the empty string.  If it is, then we return either the empty string, or a one character ambigram, whichever is cheaper.  If it is not ok to return the empty string, then we just return the cheapest one character ambigram.  Now, the recursive step is to either remove a character from the left, remove a character from the right, or else make the left and right most characters so that rotating one yields the other.  I'd recommend writing a separate method for the last part, to determine which pair of letters is cheapest.  So, we recursively call our method, trimming the left, right, or both characters from the current word.  Each recursive call returns a word, and a cost to us, and we do a few elementary calculations to determine which of the three resulting words to use, by comparing cost, length, and finally lexicographically.  The one things to note about the recursive call is that if we remove a letter, the status of the empty string boolean remains unchanged, but if we make two letters look the same after rotation, then it becomes ok for the recursive call to return the empty string, since we already have 2 characters.  So, lets put this all into pseudocode, assuming that we have methods to find the cheapest pair of letters, and to determine which of two strings are best:
<pre>
   (string,int) recurse (string word, boolean emptyOK){
      int N = word.length();
      if(N==0)return ("",0);
      if(N==1){
         find best (word,cost) pair where word has a single character
         if(emptyOK{
            consider returning ("",cost)
         }
         return best (word,cost) pair found
      }
      pos1 = recurse(word[2..N],emptyOK)
      pos1.cost += costToRemove(word[1])
      pos2 = recurse(word[1..N-1],emptyOK)
      pos2.cost += costToRemove(word[N])
      pos3 = recurse(word[2..N-1],true)
      pos3.cost += costToMakeRotations(word[1],word[N])
      pos3.word = adjustEndCharacters(word[1],pos3.word,word[N])
      return bestOf(pos1,pos2,pos3)
   }
</pre>
Thats pretty much it.  The last thing we have to do is get it to run fast enough, which requires us to add memoization, and cache results.  There are different ways to do this, but each way involves a key, based on the parameters to the function, and a cached result that is matched to that key.  In this case, we would add something like this to the beginning of the function:
<pre>
   if(cache.containsKey(word,emptyOK))return cache.get(word,emptyOK);
</pre>
And we would make this change at the end:
<pre>
   ret = bestOf(pos1,pos2,pos3)
   cache.put((word,emptyOK),ret)
   return ret
</pre>
As you can see, the memoization part of it is really quite trivial, and the hardest part is writing the recursive function, not making it fast enough.
</p> 

<p>
<img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="159052" context="algorithm"/><br />
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

