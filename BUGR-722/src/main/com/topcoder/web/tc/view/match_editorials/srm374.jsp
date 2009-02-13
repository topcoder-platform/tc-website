<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
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
   <td width="180" id="onLeft">
      <jsp:include page="/includes/global_left.jsp">
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
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&er=5&rd=10793">Match Overview</A><br />
    <tc-webtag:forumLink forumID="516071" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 374</span><br />Tuesday, November 6, 2007
<br /><br />



<h2>Match summary</h2>

 

<p>
The first match after the TCCC was composed of a straightforward Easy, a very easy Medium and an easy but extremely tricky Hard problem, which lead to an eventful challenge phase. Many contestants had to resubmit the Hard problem after discovering an issue with overflows or commercials split over two different days. At the end, <tc-webtag:handle coderId="22652597" context="algorithm"/> won the match with three problems and 125 points in challenges, the second place went to <tc-webtag:handle coderId="10597114" context="algorithm"/> with the Easy and the Medium and 12 successful challenges and the third place went to <tc-webtag:handle coderId="20315020" context="algorithm"/> with three problems and on successful challenges. Congratulations to them.
</p>

<p>
In Division 2, the problemset was composed of a geometrical Easy and the Easy and Medium from Division 1 as Medium and Hard respectively. At the end of the contest <tc-webtag:handle coderId="22659060" context="algorithm"/> won the match, followed by <tc-webtag:handle coderId="22698588" context="algorithm"/> and <tc-webtag:handle coderId="22688987" context="algorithm"/>, all with three successful problems. Congratulations to them too.
</p>

<H1>

The Problems

</H1>

</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8224&amp;rd=10793" name="8224">HockeyFault</a></b>

</font>

<A href="Javascript:openProblemRating(8224)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516071" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

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

      571 / 694 (82.28%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      495 / 571 (86.69%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>mythic_bat</b> for 249.65 points (1 mins 4 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      183.47 (for 495 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
This problem asked to count how many players are inside the hockey rink, where the hockey rink is defined as the union of a rectangle and two circles. Because the <b>height</b> is even, there is no need to use floating-point arithmetic, so we can implement the solution using integer arithmetic only. The first step is make functions to check if a point is inside a rectangle or inside a circle:
</p>

<pre style="color: #9c0000;">
<font color="darkgreen">// (cx, cy) is the circle's center, r is the circle's radius and</font>
<font color="darkgreen">// (px, py) is the point to test</font>
<font color="navy">bool</font> insideCircle(<font color="navy">int</font> cx, <font color="navy">int</font> cy, <font color="navy">int</font> r, <font color="navy">int</font> px, <font color="navy">int</font> py) {
  <font color="navy">const int</font> dx = px - cx;
  <font color="navy">const int</font> dy = py - cy;
  <font color="navy">const int</font> r2 = r * r;
  <font color="navy">return</font> dx * dx + dy * dy &lt;= r2;
}

<font color="darkgreen">// (x1, y1) is the rectangle's lower-left corner, (x2, y2) is the</font>
<font color="darkgreen">// rectangle's upper-right corner and (px, py) is the point to test</font>
<font color="navy">bool</font> insideRect(<font color="navy">int</font> x1, <font color="navy">int</font> y1, <font color="navy">int</font> x2, <font color="navy">int</font> y2, <font color="navy">int</font> px, <font color="navy">int</font> py) {
  <font color="navy">return</font> (x1 &lt;= px && px &lt;= x2) && (y1 &lt;= py && py &lt;= y2);
}
</pre>

<p>Then, just loop through all players and check which ones are inside the field:</p>

<pre style="color: #9c0000;">
<font color="darkgreen">// check if the point (px, py) is inside any of the three parts</font>
<font color="darkgreen">// that compose the field</font>
<font color="navy">bool</font> isInside(<font color="navy">int</font> W, <font color="navy">int</font> H, <font color="navy">int</font> x, <font color="navy">int</font> y, <font color="navy">int</font> px, <font color="navy">int</font> py) {
  <font color="navy">int</font> R = H / 2;
  <font color="navy">return</font> insideCircle(x, y + R, R, px, py)) ||
         insideCircle(x + W, y + R, R, px, py) ||
         insideRect(x, y, x + W, y + H, px, py);
}

<font color="navy">int</font> numPlayers(<font color="navy">int</font> width, <font color="navy">int</font> height, <font color="navy">int</font> x, <font color="navy">int</font> y,
               vector&lt;<font color="navy">int</font>&gt; px, vector&lt;<font color="navy">int</font>&gt; py) {
  <font color="navy">int</font> count = <font color="red">0</font>;
  <font color="navy">for</font> (<font color="navy">int</font> k = <font color="red">0</font>; k &lt; (<font color="navy">int</font>)px.size(); ++k)
    <font color="navy">if</font> (isInside(width, height, x, y, px[k], py[k]))
      ++count;
  <font color="navy">return</font> count;
}
</pre>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8374&amp;rd=10793" name="8374">SyllableSorting</a></b>

</font>

<A href="Javascript:openProblemRating(8374)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516071" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

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

      305 / 694 (43.95%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      75 / 305 (24.59%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>narri</b> for 465.84 points (7 mins 48 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      273.67 (for 75 correct submissions)

    </td>

  </tr>

</table></blockquote>

 

Used as: Division One - Level One: <blockquote><table cellspacing="2">

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Value</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      275

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Submission Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      532 / 554 (96.03%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      264 / 532 (49.62%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>bmerry</b> for 268.19 points (4 mins 33 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      207.16 (for 264 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
This problem asked to sort an array of <b>words</b>, using its syllablic decompossion. The first step to make a solution is to create a function that split a word in syllables, which can be easily implemented by realizing that the limit between a syllable and the next is when a consonant follows a vowel, so we could just search those points and split the word:
</p>

<pre style="color: #9c0000;">
<font color="darkgreen">// check if letter c is a vowel</font>
<font color="navy">bool</font> isVowel(<font color="navy">char</font> c) {
  <font color="navy">const</font> string VOWELS = <font color="red">"aeiou"</font>;
  <font color="navy">return</font> VOWELS.find(c) != string::npos;
}

<font color="darkgreen">// split word in syllables</font>
vector&lt;string&gt; splitWord(string word) {
  <font color="darkgreen">// initialize the syllable with the first character (it is always a consonant)</font>
  vector&lt;string&gt; syllables;
  string actual = word.substr(<font color="red">0</font>, <font color="red">1</font>);
  for (<font color="navy">int</font> k = <font color="red">1</font>; k &lt; (<font color="navy">int</font>)word.size(); ++k) {
    <font color="darkgreen">// get the letter and check if belongs to the next syllable</font>
    <font color="navy">char</font> c = word[c];
    if (isVowel(actual[actual.size() - <font color="red">1</font>]) && !isVowel(c)) {
      syllables.push_back(actual);
      actual.clear();
    }
    actual.push_back(c);
  }
  <font color="darkgreen">// push the last syllable (there is always one because each word</font>
  <font color="darkgreen">// ends with a vowel) and return</font>
  syllables.push_back(actual);
  <font color="navy">return</font> syllables;
}
</pre>

<p>
Now, we have to sort the words. To keep things simple, we could create a class to hold a word with its syllablic decomposition both sorted and unsorted:
</p>

<pre style="color: #9c0000;">
<font color="navy">struct</font> Word {
  <font color="darkgreen">// the constructor stores the word, split it in syllables and store</font>
  <font color="darkgreen">// the sequence both sorted and unsorted</font>
  Word(string str) : word(str) {
    syllables = sortedSyl = splitWord(str);
    sort(sortedSyl.begin(), sortedSyl.end());
  }
  string word;               <font color="darkgreen">// original word</font>
  vector&lt;string&gt; syllables;  <font color="darkgreen">// unsorted syllables</font>
  vector&lt;string&gt; sortedSyl;  <font color="darkgreen">// sorted syllables</font>
};
</pre>

<p>
To sort the words, the easiest way is to create a functor that determines if a word goes before another word, it should compare using the sorted syllables if those arrays are different or using the unsorted ones in the other case:
</p>

<pre style="color: #9c0000;">
<font color="navy">struct</font> WordFunctor {
  <font color="navy">bool</font> operator ()(<font color="navy">const</font> Word& w1, <font color="navy">const</font> Word& w2) <font color="navy">const</font> {
    <font color="darkgreen">// first compare using the sorted syllables, then using the unsorted ones</font>
    if (w1.sortedSyl != w2.sortedSyl)
      return w1.sortedSyl &lt; w2.sortedSyl;
    return w1.syllables &lt; w2.syllables;
  }
};
</pre>

<p>
Finally, we just have to assemble those parts in a complete solution:
</p>

<pre style="color: #9c0000;">
vector&lt;string&gt; sortWords(vector&lt;string&gt; words) {
  <font color="darkgreen">// split the words in syllables</font>
  vector&lt;Word&gt; V;
  <font color="navy">for</font> (<font color="navy">int</font> k = <font color="red">0</font>; k &lt; (<font color="navy">int</font>)words.size(); ++k)
    V.push_back(Word(words[k]));

  <font color="darkgreen">// sort the words, assemble them and return</font>
  sort(V.begin(), V.end());
  <font color="navy">for</font> (<font color="navy">int</font> k = <font color="red">0</font>; k &lt; (<font color="navy">int</font>)words.size(); ++k)
    words[k] = V[k].word;
  return words;
}
</pre>

<p>
One of the most common mistakes found on this problem was comparing the string directly as a tiebreaker instead of comparing the sequence of unsorted syllables. Thas approach fails when comparing <tt>"baaba"</tt> with <tt>"babba"</tt>, because after splitting both words into syllables we get the sequences <tt>{"baa", "ba"}</tt> and <tt>{"ba", "baa"}</tt> respectively, and if we compare them lexicographically we can see that <tt>"babba"</tt> comes before <tt>"baaba"</tt>.
</p>
 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8225&amp;rd=10793" name="8225">PlayerExtraction</a></b>

</font>

<A href="Javascript:openProblemRating(8225)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516071" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

Used as: Division Two - Level Three: <blockquote><table cellspacing="2">

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

      46 / 694 (6.63%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      34 / 46 (73.91%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>narri</b> for 797.39 points (15 mins 8 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      532.14 (for 34 correct submissions)

    </td>

  </tr>

</table></blockquote>

 

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

      432 / 554 (77.98%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      397 / 432 (91.90%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Petr</b> for 462.37 points (8 mins 14 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      314.58 (for 397 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
This problem can be be solved easily using Breadth-First Search over the grid to search connected components colored with the <b>k</b>-th digit. For each connected component we calculate its area and bounding box, and return only those with area greater or equal than <b>threshold</b>.
</p>

<p>
Let's create a class to hold a player's information (area and bounding box's center) and a function to extract a player that contains the pixel in the position (x, y):
</p>

<pre style="color: #9c0000;">
<font color="darkgreen">// structure to hold a player's information</font>
<font color="navy">struct</font> Player {
  Player(<font color="navy">int</font> x_, <font color="navy">int</font> y_, <font color="navy">int</font> area_)
    : x(x_), y(y_), area(area_) {}
  <font color="navy">int</font> x, y, area;
};

<font color="darkgreen">// extract the player that contains the (x, y) pixel</font>
<font color="navy">Player</font> extractPlayer(vector&lt;string&gt;& photo, <font color="navy">int</font> x, <font color="navy">int</font> y, <font color="navy">int</font> k) {
  <font color="darkgreen">// initialize the bounding box and the area with the (x, y) pixel</font>
  <font color="navy">const int</font> M = (<font color="navy">int</font>)photo.size(), N = (<font color="navy">int</font>)photo[<font color="red">0</font>].size();
  <font color="navy">int</font> x1 = <font color="red">2</font> * x, y1 = <font color="red">2</font> * y, x2 = x1 + <font color="red">2</font>, y2 = y1 + <font color="red">2</font>, area = <font color="red">4</font>;

  <font color="darkgreen">// erase the (x, y) pixel and insert it in the queue</font>
  queue&lt;pair&lt;<font color="navy">int</font>, <font color="navy">int</font>&gt; &gt; cqueue;
  cqueue.push(make_pair(x, y));
  photo[y][x] = <font color="red">'.'</font>;

  <font color="darkgreen">// process all pixels that enter the queue</font>
  <font color="navy">while</font> (!cqueue.empty()) {
    <font color="darkgreen">// get the pixel and remove it from the queue</font>
    <font color="navy">int</font> x = cqueue.front().first, y = cqueue.front().second;
    cqueue.pop();
    
    <font color="darkgreen">// put in the queue all adjacent pixels to the actual that have the color k</font>
    <font color="navy">const int</font> dx[<font color="red">4</font>] = {<font color="red">-1</font>, <font color="red">+1</font>, <font color="red">0</font>, <font color="red">0</font>};
    <font color="navy">const int</font> dy[<font color="red">4</font>] = {<font color="red">0</font>, <font color="red">0</font>, <font color="red">-1</font>, <font color="red">+1</font>};
    <font color="navy">for</font> (<font color="navy">int</font> i = <font color="red">0</font>; i &lt; <font color="red">4</font>; ++i) {
      <font color="darkgreen">// check if the new position is outside or isn't colored with k</font>
      <font color="navy">const int</font> nx = x + dx[k], ny = y + dy[k];
      <font color="navy">if</font> (nx &lt; <font color="red">0</font> || nx &gt;= N || ny &lt; <font color="red">0</font> || ny &gt;= M || photo[ny][nx] != k + <font color="red">'0'</font>)
        <font color="navy">continue</font>;
      
      <font color="darkgreen">// update the bounding box and the area with the new pixel</font>
      x1 = min(x1, nx * <font color="red">2</font>);
      y1 = min(y1, ny * <font color="red">2</font>);
      x2 = max(x2, (nx + <font color="red">1</font>) * <font color="red">2</font>);
      y2 = max(y2, (ny + <font color="red">1</font>) * <font color="red">2</font>);
      area += <font color="red">4</font>;
      
      <font color="darkgreen">// erase the pixel from the photo and insert it in the queue</font>
      photo[ny][nx] = <font color="red">'.'</font>;
      cqueue.push(make_pair(nx, ny));
    }
  }
  
  <font color="darkgreen">// calculate the player's center and return it</font>
  <font color="navy">const int</font> cx = (x1 + x2) / <font color="red">2</font>, cy = (y1 + y2) / <font color="red">2</font>;
  <font color="navy">return</font> Player(cx, cy, area);
}
</pre>

<p>
We also need a functor to sort the players in the final result:
</p>

<pre style="color: #9c0000;">
<font color="navy">struct</font> PlayerFunctor {
  <font color="navy">bool</font> operator ()(<font color="navy">const</font> Player& p1, <font color="navy">const</font> Player& p2) {
    <font color="darkgreen">// sort first by x-axis, then by y-axis</font>
    <font color="navy">if</font> (p1.x != p2.x) <font color="navy">return</font> p1.x &lt; p2.x;
    <font color="navy">return</font> p1.y &lt; p2.y;
  }
};
</pre>

<p>
Finally, we only need to search each pixel with the color from the required team, extract the players, filter them using the area and <b>threshold</b> and finally format the output:
</p>

<pre style="color: #9c0000;">
vector&lt;string&gt; extractPlayers(vector&lt;string&gt; photo, <font color="navy">int</font> k, <font>int</font> threshold) {
  <font color="darkgreen">// process all the image and extract each player using flood fill</font>
  <font color="navy">const int</font> M = (<font color="navy">int</font>)photo.length, N = (<font color="navy">int</font>)photo[<font color="red">0</font>].size();
  <font color="navy">typedef</font> multiset&lt;Player, PlayerFunctor&gt; PlayerSet;
  PlayerSet players;
  <font color="navy">for</font> (<font color="navy">int</font> i = <font color="red">0</font>; i &lt; M; ++i) <font color="navy">for</font> (<font color="navy">int</font> j = <font color="red">0</font>; j &lt; N; ++j) {
    <font color="navy">if</font> (image[i][j] == k + <font color="red">'0'</font>) {
      <font color="darkgreen">// extract the player and add it only if it have enough area</font>
      <font color="navy">const</font> Player nextPlayer = extractPlayer(photo, j, i, k);
      <font color="navy">if</font> (nextPlayer.area >= threshold)
        players.insert(nextPlayer);
    }
  }

  <font color="darkgreen">// format each player and return</font>
  vector&lt;string&gt; result;
  <font color="navy">for</font> (PlayerSet::iterator it = players.begin(); it != players.end(); ++it) {
    ostringstream oss;
    oss &lt;&lt; it->x &lt;&lt; <font color="red">" "</font> &lt;&lt; it->y;
    result.push_back(oss.str());
  }
  <font color="navy">return</font> result;
}
</pre>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8284&amp;rd=10793" name="8284">CommercialPlanner</a></b>

</font>

<A href="Javascript:openProblemRating(8284)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516071" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

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

      205 / 554 (37.00%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      16 / 205 (7.80%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Orange_Cloud</b> for 605.62 points (26 mins 56 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      426.90 (for 16 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
This problem was seemingly easy but had a lot of tricky parts and border cases inside it that made many coders resubmit their codes and brought many opportunities during the challenge phase. An interesting property about a commercial is that it will be played at:
</p>

<p>
<tt>start_k = start + k * T</tt>
</p>

<p>
where start is the second at which the commercial starts, k is an integer and T is <b>secondsPerDay</b>. Using this property, we can transform the input so:
</p>

<ul>
<li><b>Detecting if our commercial overlaps with another can be done in an easy way:</b> First, it is easier to work with time intervals of the form [start, end) to check if a pair of them intersects. Second, the last commercial might be split in two days. Splitting it in two separate commercials can difficult the task of calculating how many seconds a commercial will be remembered, an easier solution is repeat the last scheduled commercial one day before (using k = -1).</li>

<li><b>Calculating how many second will be remembered our commercial can be done in an easy way:</b> To calculate this value is as "simple" as finding the <b>n</b>-th commercial that will play after ours and subtract its start time from our start time. However, that <b>n</b>-th commercial can be on the next day, so we could repeat the first <b>n</b> scheduled commercials one day after (using k = +1). Finally, care must be taken when people can remember all scheduled commercials, in that case we should just return <b>secondsPerDay</b>.</li>

<li><b>Operations don't overflow</b>: All input values (except <b>n</b>) should be converted to 64-bits integers before doing anything, because when both <b>starts</b>[i] and <b>durations</b>[i] are <tt>1999999999</tt> an overflow will occur when trying to calculate in which second ends the i-th commercial.</li>
</ul>

<p>
After applying this transformations, we could code a function to calculate how many time will be remembered our commercial if scheduled at a certain second (and return <tt>-1</tt> if it impossible to schedule it at that position):
</p>

<pre style="color: #9c0000;">
<font color="darkgreen">// type definition to not copy long long over all the code</font>
<font color="navy">typedef long long</font> i64;

<font color="darkgreen">// V is the array of sorted commercials and start and end are the</font>
<font color="darkgreen">// interval of the commercial to check</font>
<font color="navy">bool</font> IsPossible(<font color="navy">const</font> vector&lt;pair&lt;i64, i64&lt; &lt;& V, i64 start, i64 end) {
  <font color="darkgreen">// check each commercial and check if it overlaps</font>
  <font color="navy">for</font> (<font color="navy">int</font> k = <font color="red">0</font>; k &lt; (<font color="navy">int</font>)V.size(); ++k) {
    <font color="navy">if</font> (start &gt;= V[k].first && start &lt; V[k].second) <font color="navy">return false</font>;
    <font color="navy">if</font> (V[k].first &gt;= start && V[k].first &lt; end) <font color="navy">return false</font>;
  }
  <font color="navy">return true</font>;
}

<font color="darkgreen">// V is the array of sorted commercials, start is the position where we will</font>
<font color="darkgreen">// schedule our commercial, duration is our commercial's duration, N is the</font>
<font color="darkgreen">// number of commercials remembered by people, M is the number of scheduled</font>
<font color="darkgreen">// commercials per day and T is the number of seconds per day</font>
i64 GetTime(<font color="navy">const</font> vector&lt;pair&lt;i64, i64&gt; &gt;& V, i64 start, i64 duration,
            <font color="navy">int</font> N, <font color="navy">int</font> M, i64 T) {
  <font color="darkgreen">// check if it doesn't overlap with other commercial and if</font>
  <font color="darkgreen">// it is remembered through all day</font>
  <font color="navy">if</font> (!IsPossible(V, start, start + duration)) <font color="navy">return</font> <font color="red">-1</font>;
  <font color="navy">if</font> (N > M) <font color="navy">return</font> T;

  <font color="darkgreen">// find the first commercial that if after ours and calculate</font>
  <font color="darkgreen">// the time elapsed until the start of the N commercial</font>
  <font color="navy">for</font> (<font color="navy">int</font> k = <font color="red">0</font>; k &lt; (<font color="navy">int</font>)V.size(); ++k) {
    <font color="navy">if</font> (V[k].first > start)
      <font color="navy">return</font> V[k + N - <font color="navy">1</font>].first - start;
  }

  <font color="darkgreen">// the function should never end here</font>
  <font color="navy">return</font> <font color="red">-1</font>;
}
</pre>

<p>
However, we can't test our commercial at every position possible because there can be up to <tt>2000000000</tt> seconds per day in the worst case. The solution is to try to schedule our commercial only at certain points:
</p>

<ul>
<li>Exactly after another commercial. Why? Suposse we schedule our commercial at the <tt>T</tt>-th and it will be remembered for <tt>X</tt> seconds and the <tt>T-1</tt>-th second is free. We could schedule our commercial at the <tt>T-1</tt>-th and make our commercial be remembered for <tt>X+1</tt> seconds, because the next <b>n</b>-th commercial after ours will be the same. Therefore, the schedule at the <tt>T</tt>-th second is not maximal.</li>

<li>At second <tt>0</tt>. Why? In the case where people remember all commercials, we only have to search the earliest second where we can schedule our commercial. Suposse we schedule our commercial at the <tt>T</tt>-th with <tt>T &gt; 0</tt>. If the <tt>T-1</tt>-th second is not free, then it is covered by the previous point. If the <tt>T-1</tt>-th second is free, then we can move our commercial there and get a lower second. Therefore, the only second left to test not covered by the previous point is <tt>0</tt>.</li>
</ul>

<p>
Now, all left is test each important second and return the better:
</p>

<pre style="color: #9c0000;">
<font color="navy">int</font> bestMinute(vector&lt;int&gt; starts_, vector&lt;int&gt; durations_, <font color="navy">int</font> ourDuration_,
               <font color="navy">int</font> secondsPerDay_, <font color="navy">int</font> N) {
  <font color="darkgreen">// check border case</font>
  <font color="navy">if</font> (starts_.empty()) <font color="navy">return</font> <font color="red">0</font>;

  <font color="darkgreen">// cast all intergers to 64-bits</font>
  vector&lt;i64&gt; starts, durations;
  <font color="navy">for</font> (<font color="navy">int</font> k = <font color="red">0</font>; k &lt; (<font color="navy">int</font>)starts_.size(); ++k) {
    starts.push_back(starts_[k]);
    durations.push_back(durations_[k]);
  }
  <font color="navy">const</font> i64 ourDuration = ourDuration_, T = secondsPerDay_;

  <font color="darkgreen">// sort all commercials by start time</font>
  <font color="navy">const int</font> M = (<font color="navy">int</font>)starts.size();
  vector&lt;pair&lt;i64, i64&gt; &gt; V(M);
  <font color="navy">for</font> (<font color="navy">int</font> k = <font color="red">0</font>; k &lt; (<font color="navy">int</font>)V.size(); ++k)
    V[k] = make_pair(starts[k], starts[k] + durations[k]);
  sort(all(V));

  <font color="darkgreen">// add the last commercial once at the beggining and the first</font>
  <font color="darkgreen">// N commercials at the end</font>
  <font color="navy">const</font> pair&lt;i64, i64&gt; last = V.back();
  V.insert(V.begin(), make_pair(last.first - T, last.second - T));
  <font color="navy">for</font> (<font color="navy">int</font> k = <font color="red">1</font>; k &lt;= N; ++k)
    V.push_back(make_pair(V[k].first + T, V[k].second + T));

  <font color="darkgreen">// try to put the commercial at 0</font>
  i64 bestSecond = <font color="red">-1</font>, bestRemembered = <font color="red">0</font>;
  <font color="navy">const</font> i64 remAtZero = GetTime(V, <font color="red">0</font>, ourDuration, N, M, T);
  <font color="navy">if</font> (remAtZero != <font color="red">-1</font>) bestSecond = <font color="red">0</font>, bestRemembered = remAtZero;

  <font color="darkgreen">// try to put the commercial after each other commercial</font>
  <font color="navy">for</font> (<font color="navy">int</font> k = <font color="red">1</font>; k &lt;= M; ++k) {
    <font color="navy">const</font> i64 second = V[k].second % T;
    <font color="navy">const</font> i64 remembered = GetTime(V, V[k].second, ourDuration, N, M, T);
    <font color="navy">if</font> (remembered == <font color="red">-1</font>) <font color="navy">continue</font>;
    <font color="navy">if</font> (remembered &gt; bestRemembered ||
        (remembered == bestRemembered && second &lt; bestSecond))
      bestRemembered = remembered, bestSecond = second;
  }
  <font color="navy">return</font> (<font color="navy">int</font>)bestSecond;
}
</pre>



<br /><br />


<div class="authorPhoto">
    <img src="/i/m/jbernadas_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="22653044" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
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
