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
<tc-webtag:forumLink forumID="505665" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 202</span><br>Wednesday, July 7, 2004
<br><br>

<span class="bigTitle">Match summary</span>

<p>
The div 1 easy/div 2 medium proved to have a couple tricky cases that weren't in the examples, which caused many submissions (including the reference solution) to fail.  The div 1 medium and div 2 easy were both more reasonable, as quite a few people got the div 1 medium, and almost everyone got the div 2 easy.  In division 1, Eryx won handily, beating second place LunaticFringe by almost 250 points.  In third place was Zis, doing well in only his 8th competition.  In division 2, Mozg beat first timer joose by about 90 points, and sun_agr rounded out the top 3.
</p>

<p>
<H1>
The Problems
</H1>
</p>

<font size="+2">
<b><a
href="/stat?c=problem_statement&amp;pm=961&amp;rd=5848">LetterStrings</a></b>
</font>
<A href="Javascript:openProblemRating(961)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505665" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      160 / 167 (95.81%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      157 / 160 (98.12%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>eleusive</b> for 249.53 points (1 mins 14 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      234.57 (for 157 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
The most straightforward way to solve this problem is with two nested loops.
The outer loop iterates over the elements of the input, and the inner loop
iterates over the characters in the current element.  If the letter is not a 
'-', then increment the return value.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=1911&amp;rd=5848">Hyphenated</a></b>
</font>
<A href="Javascript:openProblemRating(1911)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505665" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      125 / 167 (74.85%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      26 / 125 (20.80%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>mariusmuja</b> for 380.08 points (17 mins 7 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      272.85 (for 26 correct submissions)
    </td>
  </tr>
</table></blockquote>


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
      159 / 164 (96.95%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      58 / 159 (36.48%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>cnettel</b> for 240.45 points (5 mins 42 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      193.70 (for 58 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem proved to be way more difficult that expected, as even the writer and testers missed some cases.  The most common problems people had were with cases like {"A","-","B"} and {"A","B"}, considering one or the other to have only a single word.<br/><br/>
There are a few ways to solve this problem.  One way to solve it is to do
everything with a couple of nested loops.  In this approach, you keep a 
count of the number of words, and a count of the total number of letters.  
As you are iterating over all of the characters in the input, you should 
increment the number of words each time you get to the end of a word
(alternatively, you can increment the word count each time you get to the 
beginning of a word).  A word ends whenever you get to a letter (character 
j of element i) and the next character is not a letter and the special hyphen
case does not occur.  
<pre>
  boolean hyphen = 
      j + 2 == lines[i].length() &amp;&amp; 
      lines[i].charAt(j+1) == '-' &amp;&amp;
      i + 1 &lt; lines.length &amp;&amp; 
      isLetter(lines[i+1].charAt(0));
  boolean nextLetter = 
      j + 1 &lt; lines[i].length() &amp;&amp; 
      isLetter(lines[i].charAt(j+1));
  if(!nextLetter &amp;&amp; !hyphen){
      words ++;
  }
</pre>
Another way to solve this is to concatenate everything into one long string 
and then use some library methods to count words.  A fancy way to do this is 
with regular expressions:
<pre>
   String all = "";
   for(int i = 0; i&lt;lines.length; i++){
      all = all+lines[i]+"\n";
   }
   int chars = all.replaceAll("[^a-zA-Z]","").length();
   int words = ("A "+all).replaceAll("[a-zA-Z]\\-\n","A").
      split("[^a-zA-Z]+").length-1;
   return 1.0*chars/words;
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2876&amp;rd=5848">SimplePath</a></b>
</font>
<A href="Javascript:openProblemRating(2876)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505665" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      51 / 167 (30.54%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      8 / 51 (15.69%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>sun_agr</b> for 725.27 points (19 mins 4 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      514.42 (for 8 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

There are a couple ways to do this.  The brute force way to do it is to move one square at a time, and put all of the locations reached in some sort of a set as you go.  If you ever get to a point already in the set, then return the index of the segment that first reached that point.  However, this approach is a bit risky because it requires putting a lot of points in a set, which can be relatively slow, and you might time out.
<br/><br/>A better solution is to look at all pairs of segments and check if they intersect.  If the two segments are defined by (x1,y1)-(x2,y2) and (x3,y3)-(x4,y4), where x1 &lt; x2, and x3 &lt; x4, and similarly for y.  A simple way to tell if two segments intersect is the following:<br/>
<tt>intersect = x1 &lt; x3 &amp;&amp; x2 &lt; x4 &amp;&amp; y1 &lt; y3 &amp;&amp; y2 &lt; y4</tt><br/>
The only special case to watch for is that two segments are allowed to touch at a single point if they are consecutive.  The only case in which a pair of consecutive segments count is when they are going in opposite directions.  We can do this all with something like this:
<pre>
for(int i = 0; i+1&lt;segs.length; i++){
    if(direction[i] is reverse of directions[i+1]){
        return i;
    }
    for(int j = i+2; j&lt;segs.length; j++){
        if(segs[i].touches(segs[j])){
            return i;
        }
    }
}
return -1;
</pre>

</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2874&amp;rd=5848">Histogram</a></b>
</font>
<A href="Javascript:openProblemRating(2874)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505665" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      138 / 164 (84.15%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      106 / 138 (76.81%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>antimatter</b> for 455.30 points (9 mins 4 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      290.82 (for 106 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
The first step in this problem is to figure out how many spaces to put between columns.  
If you wanted to, you could iterate over all spacings, until you found one that worked.  
However, it isn't too hard to figure it out from the title input.  Between titles i and i+1
there need to be <br/><tt>title[i].length()/2+(title[i+1].length()-1)/2 + 1</tt><br/>characters - 
the extra 1 is for the space, and we use integer division to deal with the fact that we 
can't center the columns when the number of characters in a title is even.  
The number of characters between columns is the maximum of the number of characters
required between two adjacent titles.<br/><br/>
Once we know how many characters go between each pair of columns, we can start placing the 'X's in each column.
Since the first title goes at the beginning of the last String of the return, the first column of 'X's is in column <tt>(title[0].length()+1)/2</tt>.
Starting from there, we can easily figure out the rest of the columns with 'X's in them, based on the number of columns between 'X's (which we calculated earlier).
<br/><br/>Finally, the hard part is placing the titles.  
We already know where the centers of the titles go though, so we can figure out where the first character of each title should go based on that.  
If the center of a title, t, is at character i, then the first character of t should go at <tt>i - ((t.length()-1)/2)</tt>.  Once you have all of the 'X's and titles placed, make sure you trim the trailing spaces, and you're set.
<pre>
public String[] draw(String[] title, int[] value){
   int l = 0,h = 0,first = (title[0].length()-1)/2;
   for(int i = 0; i&lt;value.length; i++)
      h = Math.max(value[i]+1,h);
   char[][] ch = new char[h][1000];
   String[] ret = new String[h];

   for(int i = 0; i&lt;ch.length; i++)
      for(int j = 0; j&lt;1000; j++)
         ch[i][j] = ' ';

   for(int i = 0;i+1&lt;title.length;i++)
      l = Math.max(l,title[i].length()/2+(title[i+1].length()-1)/2+1);

   for(int i = 0; i&lt;value.length; i++){
      for(int j = 0; j&lt;value[i]; j++){
         ch[h-j-2][first+(l+1)*i] = 'X';
      }
      int idx = (first+(l+1)*i) - ((title[i].length()-1)/2);
      for(int j = 0; j&lt;title[i].length(); j++){
         ch[h-1][idx+j] = title[i].charAt(j);
      }
   }

   for(int i = 0; i&lt;ret.length; i++)
      ret[i] = ("A"+new String(ch[i])).trim().substring(1);
   return ret;
}

</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=762&amp;rd=5848">StockSales</a></b>
</font>
<A href="Javascript:openProblemRating(762)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505665" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      25 / 164 (15.24%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      6 / 25 (24.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Eryx</b> for 840.24 points (12 mins 54 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      640.36 (for 6 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
A bit of background in number theory was important for this one.  
The key to solving this was to know (or figure out) that given two integer, a and b, any multiple of gcd(a,b) can be realized by adding and subtracting some multiples of a and b.
From this, it follows that given integers n<sub>1</sub>,...,n<sub>k</sub> any multiple of gcd(n<sub>1</sub>,...,n<sub>k</sub>) can be realized.  So, we'll start be setting a target sum of this gcd.<br/><br/>
Due to the tiebreaker rules, we start with the first element of the input, call this a.  We then calculate the gcd of the remaining elements, call this b.  We want to find the smallest integer x such that <tt>x*a+y*b == target</tt> or <tt>-x*a+y*b == target</tt>.  This amounts to finding x such that <tt>(target-x*a)%b == 0</tt> or <tt>(target+x*a)%b == 0</tt>.  There is a fast way to do this, but simply starting at 0 and counting up until we find an x that works is fast enough.  Once we find this x, we set the first element of the return value to x or -x.  
Now, we adjust the target to <tt>target + x*a</tt> or <tt>target - x*a</tt> and move on to the second element.  In the next iteration, we set a to the second element of the input, and b to the gcd of the third through last elements.  We continue in this way until we get to the last element of the input.  When we get to the last element, we are guaranteed that <tt>target%a</tt> will be 0, so we can just set the last element of the return to <tt>target/a</tt>, and return the result.
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
