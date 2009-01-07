<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<jsp:include page="../script.jsp" />
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
</head>
<body>
<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180" id="onLeft">	<jsp:include page="/includes/global_left.jsp">
		<jsp:param name="node" value="algo_match_editorials"/>
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

<div class="linkBox">
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
<tc-webtag:forumLink forumID="505641" message="Discuss this match" /></div>
<span class="bodySubtitle">2004 TopCoder Collegiate Challenge <br> Online Round 2</span><BR/>Wednesday, March 3, 2004
<br><br>

<span class="bigTitle">Summary</span>

<p>
While the easy problem last night was a bit on the tricky side, nearly exhaustive examples assured that almost everyone got it correct in the end.  The medium problem, however, was a whole different story.  The algorithm wasn't overly tricky, and a lot of people submitted solutions that were nearly correct.  But a few coders noticed a subtle precision issue, and their challenge cases killed many submissions that would have otherwise passed.  The hard problem, while more difficult from an algorithmic point of view, ended up with more correct submissions as a result.<br/><br/>
To everyone's great surprise, tomek ended up with the highest score, more than a challenge ahead of vetern ZorbaTHut, in second.  mathijs took third, less than 0.2 points behind Zorb, and haha came in fourth.  Also of note, Wernie was the highest rated member not to advance, an event that had a probability of only 5.62%, and a few top competitors failed to make it (though reid did show up this time), most notably WishingBone.  At the other end of the rating scale, connect4 came into the match with a rating of only 1264 and advanced on a strong showing.  The only other member to advance and remain blue was spike, whose 150 points in the challenge phase made the difference.  Good luck to everyone in the next round (especially Jasko, who jms137 claims has only a 1.35% chance of advancing).
</p>

<H1>The Problems</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2290&amp;rd=5007">Solid</a></b>
</font>
<A href="Javascript:openProblemRating(2290)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505641" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      173 / 178 (97.19%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      171 / 173 (98.84%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>ZorbaTHut</b> for 295.94 points (3 mins 20 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      255.26 (for 171 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
We can think of this problem in 2 parts: the horizontal surfaces, and the vertical surfaces.  The horizontal surfaces are easiest, and we can easily calculate that there are 2 of these for each non-zero entry in the input.  The vertical surfaces are a bit trickier because there are vertical surfaces on the edge of the input, as well as in the interior.  One way to handle this, so that we can treat all of the vertical edges the same, is to pad the input with '0's on all 4 sides.  Alternatively, we can just treat the edges as a special case, but we have to watch out for inputs like the last example, where the base of the solid is only 1x1.
<br/><br/>
Padding is probably a bit less error-prone, so I'll use that solution as a reference.  The first thing we do is copy the input into a new array, with two more elements in it - one before the input, and one after.  Then we add '0's to the beginning and end of each element from the input, and add a bunch of '0's to the first and last rows.  Finally, to find the number of vertical 1x1 squares, we simply iterate over all squares except the last row and column.  At each square, we look both right and down, and calculate the difference between the two heights.  This gives us the vertical surface area and we just add the horizontal surface area, and we're done.
<pre>
String[] copy = new String[solid.length + 2];
for(int i = 0; i &lt; solid.length; i++) copy[i + 1] = solid[i];
copy[0] = copy[copy.length - 1] = "00000000000000000000000000000000000000000000000000";
for(int i = 0; i &lt; copy.length; i++)
        copy[i] = "0" + copy[i] + "0";
    int ret = 0;
    for(int i = 0; i + 1 &lt; copy.length; i++)
        for(int j = 0; j + 1 &lt; copy[1].length(); j++){
            if(copy[i].charAt(j) != '0')ret += 2;
            ret += Math.abs(copy[i].charAt(j) - copy[i + 1].charAt(j));
            ret += Math.abs(copy[i].charAt(j) - copy[i].charAt(j+1));
        }
}
    return ret;
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=1249&amp;rd=5007">UniqueTriangles</a></b>
</font>
<A href="Javascript:openProblemRating(1249)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505641" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Two: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      450
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      114 / 178 (64.04%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      40 / 114 (35.09%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>haha</b> for 423.49 points (7 mins 11 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      307.38 (for 40 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
If you try to solve this problems using doubles and the actual lengths of the sides, you are likely to get quagmired in a world of epsilon pain.  In fact, doing anything in this problem with doubles (previously unbeknownst to the writer and testers) will likely lead to failure.  Making the ratio comparisons using == will never work using the square roots because small errors will creep in.  Instead, note that if <tt>a<sub>1</sub>/a<sub>2</sub> = b<sub>1</sub>/b<sub>2</sub> = c<sub>1</sub>/c<sub>2</sub></tt>, then <tt>a<sub>1</sub><sup>2</sup>/a<sub>2</sub><sup>2</sup> = b<sub>1</sub><sup>2</sup>/b<sub>2</sub><sup>2</sup> = c<sub>1</sub><sup>2</sup>/c<sub>2</sub><sup>2</sup></tt>.  Using this tidbit we start by iterating over all triples of points.  If a triple is colinear, then we simply skip it and move on.  A lot of people (myself included) failed because their colinear test didn't quite work.  They tried to check if a+b==c, which is of course correct assuming ideal accuracy.  But, in this problem, the accuracy was not sufficient for this test to work.  There were cases where a+b really does equal c, but some small errors may require you to use an epsilon, and other cases where a+b does not really equal c, but it is really, really close (within about 1e-13).  So, in order to get this to work, we need to use the <a href="http://mathworld.wolfram.com/CrossProduct.html" target="_blank">cross product</a>.  (More on the precision issues after we finish up the algorithm).<br/><br/>
Once we are satisfied that our triple is not colinear, we calculate the squares of the side lengths, a<sup>2</sup>, b<sup>2</sup>, and c<sup>2</sup>.  Since these are all integers, we can eliminate common factors by dividing all 3 by gcd(a<sup>2</sup>, b<sup>2</sup>, c<sup>2</sup>).  This ensures that if we later come across a similar triangle, and divide all of the squares of its side lengths by their GCD, we will get the same 3 numbers.  Hence, once you factor out the GCD, all you need to do is sort them, and put them in some sort of a set data structure.  I turned my triples into Strings by simply doing a+" "+b+" "+c in Java, and then put them in a HashSet, but any similar method will work.  You want to be careful at this step that you don't time out, since there could be as many as 50 choose 3 = 19600 triangles, and doing any O(N^2) method for finding duplicates might be trouble.
<pre>
    import java.util.*;
    public class UniqueTriangles{
    public int howMany(int[] x, int[] y){
        HashSet hs = new HashSet();
        for(int i = 0; i&lt;x.length; i++){
            for(int j = 0; j&lt;i; j++){
                for(int k = 0; k&lt;j; k++){
                    int dx1 = x[i]-x[j];
                    int dy1 = y[i]-y[j];
                    int dx2 = x[i]-x[k];
                    int dy2 = y[i]-y[k];
                    int dx3 = x[j]-x[k];
                    int dy3 = y[j]-y[k];
                    int d1 = dx1*dx1+dy1*dy1;
                    int d2 = dx2*dx2+dy2*dy2;
                    int d3 = dx3*dx3+dy3*dy3;
                    int g = gcd(gcd(d1,d2),d3);
                    int[] a = new int[]{d1/g,d2/g,d3/g};
                    Arrays.sort(a);
                    if(dx1*dy2==dx2*dy1)continue;
                    hs.add(a[0]+" "+a[1]+" "+a[2]);
                }
            }
        }
        return hs.size();
    }
    int gcd(int a, int b){return b==0?a:gcd(b,a%b);}
</pre>
Precision issues are notoriously tricky, and knowing when it is OK to use an epsilon and when it isn't often requires a lot of soul-searching.  In this problem we encounter what is known as <i>catastrophic cancellation</i>.  This occurs most often when we have two relatively large numbers that are very close to equal, but are not.  Hence, when we subtract one from the other, all of the significant, and hence most accurate digits cancel, and we are left only with the less significant, and less accurate digits.  A relevent example comes from subtracting two square roots, say sqrt(1000000) and sqrt(1000001).  Say we can calculate both of these numbers to some degree of accuracy, and get all of the first 7 digits correctly to get 1000.000 and 1000.000.  Once we subtract one from the other, we get 0.0, instead of the correct result, 0.0005 because all the significant digits canelled.  Using doubles, we get 52 bits of precision, or about 16 digits. Therefore, if we can find a case where the relative difference between a+b and c is more than 1e16, we are in trouble.  We can come up with a theoretical limit on the relative difference by first noting that if we have points at (0,0) and (x,y), then the slope of the line is <tt>y/x</tt>.  Therefore, every unit we move to the right, we move <tt>y/x</tt> units up, and the closest that an integral point will ever be to the line without being on it (in the y direction) is <tt>1/x</tt>.  So, in the worst case, we have <tt>c = sqrt(x<sup>2</sup>+y<sup>2</sup>)</tt>, <tt>a = sqrt(i<sup>2</sup>+(i*y/x+1/x)<sup>2</sup>)</tt> and <tt>b = sqrt((x-i)<sup>2</sup>+(x-i*y/x-1/x)<sup>2</sup>)</tt>, for some i.  It turns out that the worst case is when <tt>i = x/2</tt>, and if we plug in the numbers and work it out, we find a theoretical limit of 8.8e-14 when <tt>x = y = 20,000</tt>, which happens to be almost exactly <tt>1/sqrt(2)/20000<sup>3</sup></tt>.  This means that the relative difference between c and a+b is <tt>20,000*sqrt(2)/8.8e-14 = 2*20,000<sup>4</sup> = 3.2e17</tt>, which requires about 58 bits of precision, more than doubles give you.  But, you ask, that is just the theoretical limit, how bad does it really get? ploh came up with a challenge case that gave an absolute difference of <tt>2.3e-13</tt>: <tt>(-10000,-10000)</tt>, <tt>(946,-3235)</tt>, and <tt>(7711,946)</tt>.  radeye came up with one along similar lines that gave an absolute difference of <tt>3.5e-13</tt>: <tt>(-10000,-9999)</tt>, <tt>(10000,9999)</tt>, and <tt>(-1,-1)</tt>.  ploh's is off by <tt>1/x</tt>, while radeye's is off by <tt>2/x</tt>, but ends up with about the same relative difference because it is closer to the center and has a larger x.  Can anyone do better than these?
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2296&amp;rd=5007">AWordGame</a></b>
</font>
<A href="Javascript:openProblemRating(2296)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505641" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      53 / 178 (29.78%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      47 / 53 (88.68%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>tomek</b> for 834.64 points (13 mins 11 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      589.59 (for 47 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem can be solved, in broad terms, by using the standard minimax algorithm, which comes up pretty often when dealing with two player games.  The basic outline of the algorithm is:
<pre>
    int minimax(int player, state s)
        if (s is a game over state)
            return player 1's advantage over player 2, in s
        end if
        int best
        if(player == 1)
            best = -Infinity
        else
            best = Infinity
        end if
        for each possible move that player can make in state s
            let s' = s with that move made
            if(player == 1)
                best = max(best,minimax(2,s'))
            else
                best = min(best,minimax(1,s')
            end if
        end for
        return best
    end function
</pre>
The basic idea of this is to try every possible sequence of moves.  When we get to the end of the game, we return the advantage of player 1 over player 2. Hence, at each step along the way, if it is player 1's turn, he will make the move that maximizes his final advantage, while player 2 will make the move that minimizes player 1's final advantage.  In this problem we need to know a little bit more than what the final score is, so we need to modify the above method to return a string instead of an int. We then use that string to determine which move to make, but the general idea is the same.  In fact, this problem is a little bit simpler, in some respects, because each player is trying to achieve the same thing on his turn - an even number of characters in the rest of the game.  So, here our minimax function will take a string, soFar, which tells us which characters have been said so far.  From that, we try adding each possible character that is next in some word, being careful not to branch on the same character twice.
Our function will return the characters that end up getting said after soFar.  Hence, if we find that we have already completed a word, we return "".  Otherwise, we figure out what the best move is, and return the string of characters that are said after soFar, corresponding to that move.  The best move is the one that gives the shortest even length string, or if there is no even length string, then the longest odd length string.  If we sort the words before we start, we won't have to worry about take the picking the earliest character alphabetically when all other things are equal, as we will get to that character first.
<pre>
import java.util.*;
public class AWordGame{
    ArrayList words = new ArrayList();
    String minimax(String soFar){
        String ret = null;
        boolean branched[] = new boolean[256];
        for(int i = 0; i&lt;words.size(); i++){
            String w = words.get(i).toString();
            if(w.equals(soFar)){
                return "";
            }else if(w.startsWith(soFar)){
                char ch = w.charAt(soFar.length());
                if(branched[ch])continue;
                branched[ch] = true;
                String s = ch + minimax(w.substring(0,soFar.length()+1));
                if(s.length()%2==0){
                    if(ret==null || ret.length()%2 == 1 || s.length() &lt; ret.length()){
                        ret = s;
                    }
                }else if(ret == null || ret.length()%2 == 1 &amp;&amp; s.length() &gt; ret.length()){
                        ret = s;
                }
            }
        }
        return ret;
    }
    public String outcome(String[] wordList){
        for(int i = 0; i&lt;wordList.length; i++){
            String[] sp = wordList[i].split(" ");
            for(int j = 0; j&lt;sp.length; j++){
                words.add(sp[j]);
            }
        }
        Collections.sort(words);
        return minimax("");
    }
}
</pre>
It is important that we keep track of which characters we branch on at each step, so that we won't end up doing the same thing twice.  If we didn't do this, then for an input like {"aaaaaa","aaaaaaa"}, we would branch twice on the character 'a' at each step, and our runtime would become exponential.  By assuring that we only branch once per character, we assure that we never call minimax more than once with any give string, soFar.  Hence, the total number of calls to minimax is bounded by the total number of substrings of the words in the input, which is ar most 2500.  Furthermore, at each step, we loop over all possible words.  Assuming there are no duplicates, there are at most about 800 words.  If there are this many words, they are all pretty short, so the call to startsWith has essentially constant run time, and our over all runtime ends up being roughly quadratic in the input size (as the words get longer, there are less of them, but callings startsWith is slower, so it works out about the same).  With all the string manipulation, this might be a bit alarming to some.  However, it turns out that, while the runtime is O(N^2), it has a relatively low constant and runtime isn't much of an issue, so long as you use the right algorithm.<br/><br/>
If we want to get fancy, we can build a tree out of the input so that we won't have to do a linear search of all the words each time.  If done properly, this can reduce the runtime from O(N^2) to O(N).
</p>

<div class="authorPhoto">
    <img src="/i/m/lbackstrom_mug.gif" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="159052" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
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

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>

