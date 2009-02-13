<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
</head>


<body>

<div id="onTop">
<jsp:include page="../../top.jsp" >
  <jsp:param name="level1" value=""/>
</jsp:include>
</div>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<!-- Left Column Begins-->
   <td width="180" id="onLeft">
      <jsp:include page="../../includes/global_left.jsp">
         <jsp:param name="node" value="hs_match_editorials"/>
      </jsp:include>
   </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../../page_title.jsp" >
<jsp:param name="image" value="high_school"/>
<jsp:param name="title" value="Match Editorials"/>
</jsp:include>

<div class="linkBox">
    <A href="tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>

<tc-webtag:forumLink forumID="506027" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 5</span><br>Wednesday, July 5, 2006
<br><br>

<span class="bigTitle">Match summary</span>




<p> 
This match continued the streak of Burunduks. 
With the best overall score and with 3 successful submissions, <tc-webtag:handle coderId="21468741" context="algorithm"/> took first place, <tc-webtag:handle coderId="21111148" context="algorithm"/> took second place, despite losing his 250 and getting no challenges he lost by less than 50 points. Impressive!  
Rounding out 3rd place was <tc-webtag:handle coderId="22375930" context="algorithm"/>.

</p> 


<H1> 

The Problems 

</H1>

</p> 
 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6486&amp;rd=10057" name="6486">TVSize</a></b> 

</font> 

<A href="Javascript:openProblemRating(6486)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506027" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Level One: <blockquote><table cellspacing="2"> 

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

      73 / 80 (91.25%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      22 / 73 (30.14%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>sharpobject</b> for 246.41 points (3 mins 26 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      203.43 (for 22 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
This problem appeared to be really tricky for most of the coders. 
The main source of the troubles was the classical floating point imprecision 
(misof's <a href="http://www.topcoder.com/tc?module=Static&d1=tutorials&d2=integersReals">article</a> 
on this topic is going to become a classic among TopCoder members).
</p>
<p>
The simplest way of solving this problem is to directly follow the instructions
<pre>
 double h = sqrt(sqr((double)diagonal) / (sqr(((double)width) / height) + 1));
 double w = sqrt(sqr((double)diagonal) / (sqr(((double)height) / width) + 1));
 vector<int> ans(2);
 ans[0] = h; 
 ans[1] = w;
 return ans;
</pre>
and round both h and w down to the nearest integer. Unfortunately for lots of our coders, this approach is wrong. 
Even a small imprecision can be fatal for your solution - value of h equal, for example, to 2.99999 instead of 3 will be rounded down to 2 and cause your solution to fail.
</p>
<p>
Fortunately, this problem can be solved without using any floating point numbers at all.
The problem asks us to find the biggest integer number h such that 
<pre>
 h <= (diagonal * height / hypoth), where hypoth = sqrt(height<sup>2</sup> + width<sup>2</sup>).
</pre>
Squaring this formula we can get the following one:
<pre>
 h * h <= (diagonal * height)<sup>2</sup> / (height<sup>2</sup> + width<sup>2</sup>),
</pre>
or, in other words,
<pre>
 (height<sup>2</sup> + width<sup>2</sup>) * h * h <= (diagonal * height)<sup>2</sup>,
</pre>

Having this formula, we can easily find h (don't forget to use long variables to avoid integer overflow):

<pre>
 for (long i = 0; ; i++) 
         if ((height * height + width * width) * i * i > (diagonal * height * diagonal * height) 
         return i - 1;
</pre>
</p>
 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6568&amp;rd=10057" name="6568">SuperSort</a></b> 

</font> 

<A href="Javascript:openProblemRating(6568)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506027" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Level Two: <blockquote><table cellspacing="2"> 

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

      58 / 80 (72.50%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      40 / 58 (68.97%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Weiqi</b> for 484.66 points (5 mins 5 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      385.99 (for 40 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

 This problem was fairly simple.  Given a string of words, spaces and punctuation, sort the
words while preserving the spaces and punctuation.  In pseudocode, all one needs to do is locate
each word, extract it and replace it with a place holder.  Store each word in a container and sort
it; both C++ and Java provide mechanisms for sorting so you shouldn't have to write your own sort
algorithm.  With this sorted list of words, iterate across the original string (with the place
holders) and build a new string.  If the current position of the original string has a place holder
add the next sorted word, otherwise, add the current character to the return string.  My solution is
show below.

<pre>
public String wordSort(String sentence)
{
    int           characterIndex = 0;
    int           wordIndex      = 0;
    List <String> words          = new ArrayList <String>();
    String        parsedSentence = "";
    String        returnCode     = "";
    String        word           = "";


    for (characterIndex = 0; characterIndex < sentence.length();
        characterIndex++)
    {
        if ((sentence.charAt(characterIndex) >= 'a' &&
            sentence.charAt(characterIndex) <= 'z') ||
            (sentence.charAt(characterIndex) >= 'A' &&
            sentence.charAt(characterIndex) <= 'Z'))
        {
            if (word.length() <= 0)
            {
                parsedSentence += 'P';
            }
            word += sentence.charAt(characterIndex);
        }
        else
        {
            if (word.length() > 0)
            {
                words.add(word);
                word = "";
            }
            parsedSentence += sentence.charAt(characterIndex);
        }
    }

    if (word.length() > 0)
    {
        words.add(word);
        word = "";
    }

    Collections.sort(words);

    for (characterIndex = 0; characterIndex < parsedSentence.length();
        characterIndex++)
    {
        if (parsedSentence.charAt(characterIndex) == 'P')
        {
            returnCode += words.get(wordIndex++);
        }
        else
        {
            returnCode += parsedSentence.charAt(characterIndex);
        }
    }


    return returnCode;
}
</pre>

</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6571&amp;rd=10057" name="6571">TextEditorNavigation</a></b> 

</font> 

<A href="Javascript:openProblemRating(6571)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506027" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Level Three: <blockquote><table cellspacing="2"> 

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

      25 / 80 (31.25%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      8 / 25 (32.00%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Burunduk2</b> for 883.10 points (10 mins 37 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      582.13 (for 8 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

The problem asked for the fewest keystrokes required to navigate from the starting position in the given source to the ending position.  
This is a classical example of a Breadth First Search (BFS).  
I solved this problem using a 50 by 50 array of int with each position holding the minimal keystrokes 
possible to get to that point. 
As a detail of implementation, we can make all strings of the text to be of the same length. This makes coding and checking for boundaries a bit easier.
To start the BFS, we need to initialize our time array. 
We set the time for the starting position to 0 (because we can get it in 0 steps) and all other positions to an impossibly high value like 1000000.
Also, we add the starting position to a queue. 
The program continues working until the queue is empty trying each of the possible 10 moves at the current position, 
adding new positions when performing the move causes the table to be updated with a new minimum.  
Finally, one returns the entry in the table indexed by the ending position.  
Java implementation follows:

<pre>
    Queue<Integer> q;
    int N;
    int[][] memo;
    // If time t is the best time for position 
    // (n1, n2) - add position (n1, n2) to the queue
    void add(int n1, int n2, int t) { 
        if (n1 < 0 || n2 < 0 || n1 >= N || n2 >= 51 || memo[n1][n2] <= t) 
            return; // position is out of the text or time t isn't the best time.
        memo[n1][n2] = t;
        q.offer(n1); 
        q.offer(n2);
    }
    public int keystrokes(String[] source, int[] start, int[] finish) {
        q = new LinkedList();
        N = source.length;
        // element (i, j) stores the best time we 
        // need to get to position (i, j) from the start
        memo = new int[N][51]; 
        for (int i = 0; i < N; i++) 
            while (source[i].length() < 51) 
                source[i] += " "; // make all strings of the same length
        for (int i = 0; i < N; i++) 
            Arrays.fill(memo[i], 10000000); 
        add(start[0], start[1], 0);
        while (q.size() > 0) {
            int r = q.poll(); 
            int c = q.poll();
            int t = memo[r][c] + 1;
            add(r - 1, c, t); // up
            add(r + 1, c, t); // down
            add(r, c - 1, t); // left
            add(r, c + 1, t); // right
            add(r, 0, t); // home
            add(r, source[r].length() - 1, t); // end
            add(0, c, t); // top
            add(N - 1, c, t); // bottom
            for (int i = c; i < 50; i++)
                if (!Character.isLetter(source[r].charAt(i)) &&
                     Character.isLetter(source[r].charAt(i + 1))) {
                       add(r, i + 1, t); // word right
                       break;
                }
            for (int i = c - 2; i >= 0; i--) 
                if (!Character.isLetter(source[r].charAt(i)) && 
                     Character.isLetter(source[r].charAt(i + 1))) {
                    add(r, i + 1, t); // word left
                    break;
                }
        }
        return memo[finish[0]][finish[1]];
    }
</pre>

Despite the efforts of the problem statement, it wasn't clear to some people that one could view the columns as expanding from 0 (the leftmost column) to infinity (the rightmost column); although 50 columns was all you needed.  Also, some people had a difficult time interpreting word left and word right.

</p>


<%--<div class="authorPhoto">
    <img src="/i/m/brett1479_big.jpg" alt="Author" />--%>
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="343655" context="algorithm"/><br />    <em>TopCoder Member</em>
</div>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../../public_right.jsp">
   <jsp:param name="level1" value="tchs"/>
  </jsp:include>
   </td>
<!-- Right Column Ends -->

<!-- Gutter -->
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../../foot.jsp" />
</div>


</body>

</html>
