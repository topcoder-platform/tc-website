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

<tc-webtag:forumLink forumID="506024" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 2</span><br>Monday, June 12, 2006
<br><br>

<span class="bigTitle">Match summary</span>

<p>
The second TopCoder High School Single Round Match, first one for the <a href="/tc?module=Static&d1=hs&d2=regions">Beta region</a>, attracted 109 registrants (59 of them newcomers) and proved to be quite eventful. With challenge opportunities left in all 3 problems, the heat was rising as the end of the intermission approached. When the coding phase ended there were 209 problems open for challenge, 94 250-pointers, 77 500-pointers and 38 1000-pointers. The first few minutes of the challenge phase were a real bloodbath as 250-pointers failed all around to the dreaded <b>poison</b> = <b>elixir</b> case. All in all, during the challenge phase 24 250-pointers were brought down along with 10 500-pointers and 12 1000-pointers. This amounts to a grand total of 46 successful challenges (the systests took down only 21 solutions!).<br>
<br>
The first place goes to <b>Burunduk1</b> from Russian Federation representing Saint-Petersburg Phys-Math Lyceum #30, the first ever TCHS red! Congratulations! Second place goes to <b>Weiqi</b> from China representing Mingzhu Middle School, and third place goes to a newcomer <b>dzhulgakov</b> from Ukraine representing National Technical University KhPI. A great thing about this SRM is that, even with quite hard problems, only a few people ended with a non-positive score. Congratulations to all competitors!
</p>

 

 

 

<H1>
The Problems
</H1>

 

</p>

 

 

 

<font size="+2">

 

<b><a href="/stat?c=problem_statement&amp;pm=6252&amp;rd=10024" name="6252">FountainOfLife</a></b>

 

</font>

 

<A href="Javascript:openProblemRating(6252)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506024" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

 

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

 

      94 / 107 (87.85%)

 

    </td>

 

  </tr>

 

  <tr>

 

    <td class="bodyText" style="background: #eee;">

 

      <b>Success Rate</b>

 

    </td>

 

    <td class="bodyText" style="background: #eee;">

 

      69 / 94 (73.40%)

 

    </td>

 

  </tr>

 

  <tr>

 

    <td class="bodyText" style="background: #eee;">

 

      <b>High Score</b>

 

    </td>

 

    <td class="bodyText" style="background: #eee;">

 

      <b>sluga</b> for 248.85 points (1 mins 55 secs)

 

    </td>

 

  </tr>

 

  <tr>

 

    <td class="bodyText" style="background: #eee;">

 

      <b>Average Score</b>

 

    </td>

 

    <td class="bodyText" style="background: #eee;">

 

      209.93 (for 69 correct submissions)

 

    </td>

 

  </tr>

 

</table></blockquote>

 

<p>
<b>The math solution</b><br>
<br>
This problem was a good example of a pen and paper friendly problem. The best way to deal with this problem is to put your keyboard away and write down the problem on paper.<br>
The mixture becomes deadly once the volume of the poison is at least 50%. This is just a complicated way of saying that the volume of the poison needs to be at least equal to the volume of elixir. At any given time <i>t</i> there is <b>poison</b> * <i>t</i> liters of poison and <b>elixir</b> * <i>t</i> + <b>pool</b> liters of elixir. We want the following to be true:<br>
<pre>
<i>t</i> >= <b>pool</b> / (<b>poison</b> - <b>elixir</b>)
</pre>
<b>pool</b> will always be positive and (<b>poison</b> - <b>elixir</b>) can be either positive, negative or zero. If (<b>poison</b> - <b>elixir</b>) is negative or zero, than the mixture will never become deadly since <b>pool</b> will be at least 1. If (<b>poison</b> - <b>elixir</b>) is positive then we need to find the minimal <i>t</i> for which the above holds true. Because <b>pool</b> / (<b>poison</b> - <b>elixir</b>) is a positive number and <i>t</i> must be at least equal to it, the minimal <i>t</i> is in fact equal to <b>pool</b> / (<b>poison</b> - <b>elixir</b>). Once you have this writen on the paper, coding it is quite simple. The following code solves the task:<br>
<br>
<pre>
    public double elixirOfDeath(int elixir, int poison, int pool){
 if ( poison <= elixir ) return -1.0;
 return 1.0 * pool / (1.0 * (poison - elixir) );
    }<br>
</pre><br>
The most common error on this problem was the lack of '=' in the if, causing either wrong return value or a division by zero.
</p>

 

 

 

<font size="+2">

 

<b><a href="/stat?c=problem_statement&amp;pm=6433&amp;rd=10024" name="6433">ApocalypseSomeday</a></b>

 

</font>

 

<A href="Javascript:openProblemRating(6433)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506024" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

 

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

 

      77 / 107 (71.96%)

 

    </td>

 

  </tr>

 

  <tr>

 

    <td class="bodyText" style="background: #eee;">

 

      <b>Success Rate</b>

 

    </td>

 

    <td class="bodyText" style="background: #eee;">

 

      61 / 77 (79.22%)

 

    </td>

 

  </tr>

 

  <tr>

 

    <td class="bodyText" style="background: #eee;">

 

      <b>High Score</b>

 

    </td>

 

    <td class="bodyText" style="background: #eee;">

 

      <b>Penguincode</b> for 496.83 points (2 mins 16 secs)

 

    </td>

 

  </tr>

 

  <tr>

 

    <td class="bodyText" style="background: #eee;">

 

      <b>Average Score</b>

 

    </td>

 

    <td class="bodyText" style="background: #eee;">

 

      373.68 (for 61 correct submissions)

 

    </td>

 

  </tr>

 

</table></blockquote>

 

<p>

 

<b> The Brute-force solution </b><br>
<br>
One way to approach this problem was to simply iterate number by number, starting from 666, and counting all beastly numbers until we find the <b>n</b>-th. As <b>n</b> was quite large, it wasn't obvious that this will work in time. One way a coder could have realized the code will work in time is by considering the number 1000666. It is easy to see that there are 1000 beastly numbers prior to 1000666 of the same type (namely 666, 1666, 2666.....999666). Now the same reasoning applies to the number 1006660, and to 1066600, and to 1666000. So we already have 4000 beastly numbers below 1666000. Multiply this by 3 and you have 12000 beastly numbers below 3666000. This can easily be iterated in time.<br><br>
Note: This is just an approximation, but a good one to use in the heat of the contest. In fact there are 5500 beastly numbers below 1666000. Try to find the error and a more correct approximation. <br>
<br>
The following code is an implementation of this method.<br>
<pre>
    public int getNth(int n){
         int x = 665;
         while ( n > 0 ){
             ++x;
             if ( Integer.toString(x).indexOf("666") != -1 ) --n;
         }
         return x;
 }
</pre>
<b>The O(n) solution</b><br>
<br>
Another way to approach this problem is to further expand the idea that we used to examine the runtime of the BF solution. Beastly numbers can be divided into patterns, like ****666, ***666*, etc. For every pattern let us remember the last number we used to fill in the * in an array <i>pat</i>. In order to find the next beastly number, we simply iterate the array <i>pat</i> and use the next number for that pattern to form a beastly number, constantly keeping the smallest number found thus far. Since there is a fixed number of patterns and you will iterate them <b>n</b> times, the complexity is O(<b>n</b>). The exact details and the code for this solution are left as an exercise to the reader.<br>
<br>
For testing purposes the 100,000th beastly number is 22,230,666, the 1,000,000th is 177,966,663 and the 10,000,000th is 1,666,008,549.

 

</p>

 

 

 

<font size="+2">

 

<b><a href="/stat?c=problem_statement&amp;pm=6250&amp;rd=10024" name="6250">Wizarding</a></b>

 

</font>

 

<A href="Javascript:openProblemRating(6250)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506024" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

 

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

 

      38 / 107 (35.51%)

 

    </td>

 

  </tr>

 

  <tr>

 

    <td class="bodyText" style="background: #eee;">

 

      <b>Success Rate</b>

 

    </td>

 

    <td class="bodyText" style="background: #eee;">

 

      12 / 38 (31.58%)

 

    </td>

 

  </tr>

 

  <tr>

 

    <td class="bodyText" style="background: #eee;">

 

      <b>High Score</b>

 

    </td>

 

    <td class="bodyText" style="background: #eee;">

 

      <b>Weiqi</b> for 822.55 points (13 mins 49 secs)

 

    </td>

 

  </tr>

 

  <tr>

 

    <td class="bodyText" style="background: #eee;">

 

      <b>Average Score</b>

 

    </td>

 

    <td class="bodyText" style="background: #eee;">

 

      610.76 (for 12 correct submissions)

 

    </td>

 

  </tr>

 

</table></blockquote>

 

<p>

 

<b>The O(3^n) recursive solution</b><br>
<br>
One way to solve this problem is to try out all possible combinations of keeping, deleting or replacing the characters of the spell. There are at most 3<sup>13</sup> combinations so the code will run in time. This approach can be easily implemented with a recursive function. The parameters for our function will be an int, the character we are currently processing and a string, the counterspell we are currently forming. This is not the only way you could implement this solution, other coders used different designs, some with more success than others. I recommend checking their solutions in the arena. Here is a well commented code:<br>
<pre>
    string s, r;
    int bestpower;

 

    public void solve(int depth, String c){
        if ( depth == s.length() ){
            // check if we have an empty incantation
            if ( c == "" ) return ;
            
            // we have a candidate for the counterspell so we check it's power
            
            int power = 1;          
            for (int i = 0; i < c.length(); i++ ){
                power *= (c.charAt(i) - 'A' + 1);
                power %= 77077;
            }

 

            // compare the current counterspell and the best found thus far

 

            if ( power > bestpower ){
                bestpower = power;
                best = c;
            }
            else if ( power == bestpower ){
                if ( c.length() < best.length() ) best = c;
                else if ( c.length() == best.length() && c.compareTo(best) < 0 ) best = c;
            }
        }
        else {
            // first use the letter as-is
            solve(depth + 1, c + s.charAt(depth));
            
            // next try to delete it
            solve(depth + 1, c);
            
            // now try to replace it
            if ( r.charAt(s.charAt(depth) - 'A') != '-' )
                solve(depth + 1, c + r.charAt(s.charAt(depth) - 'A'));
        }
    }

 

    public String counterspell(String spell, String rules){
        bestpower = -1;
        s = spell;
        r = rules;

 

        // start from the first character with an empty counterspell
        solve(0, "");
        return best;
    }
</pre><br>

 


<b>The non-recursive solutions</b><br>
<br>
Recursion was not necessary to solve this problem. Non recursive solutions exist. Check <b>nordom</b>'s, <b>kupicekic</b>'s, <b>marek</b>'s and <b>Burunduk1</b>'s contest solutions for examples. Those solutions are not all the same -- they implement different algorithms. Some of those are quite difficult to come up with and code, and it would be too much to examine in detail each and every one of them, but here are a few useful observations:<br>
<ul>
<li>
Notice the usage of switch(t % 3) in <b>nordom</b>'s solution. Essentially, it is looking at every possible solution as a number in base 3, and than uses the % to determine the operation that is performed, and / to perform a base 3 analog to binary bitwise rightshift. However the % operation is quite slow, so this code is actually slower than the recursion.
</li>
<li>
Instead of base 3 and the slow %, / operators, much faster bitwise & and >> operators may be used. First, you encode every possible keep-delete decision in a binary number, and than for all possible keep-delete decision you encode all possible keep-replace decision in a new binary number. This was used in <b>kupicekic</b>'s solution.
</li>
</ul>
The most common error on this problem was returning an empty string.
</p>


<div class="authorPhoto">
    <img src="/i/m/ivankovic_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="7396310" context="algorithm"/><br />    <em>TopCoder Member</em>
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
