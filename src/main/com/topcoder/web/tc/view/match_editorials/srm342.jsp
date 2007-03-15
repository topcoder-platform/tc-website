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
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <A href="/stat?c=round_overview&er=5&rd=10666">Match Overview</A><br>
    <tc-webtag:forumLink forumID="506232" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 342</span><br>Wednesday, March 14, 2007
<br><br>



<h2>Match summary</h2> 

 

<p> 

This match was coincident with the ACM ICPC World Finals - not just the same week or the same day, but the SRM actually started and ended during the 5 hour event.  As such, several top student competitors were out of this competition.  In spite of this and the apparent widespread confusion surrounding daylight savings time changing early this year in the USA, five targets and more than 900 total competitors still showed up for the event.  At least one of the coaches for the ICPC World Finals also competed, something that we found amusing in the admin room.</p>
<p>In division 1, the match started fast with 
<tc-webtag:handle coderId="22627975" context="algorithm"/>
finishing the first problem in just under three minutes.  
Six other people submitted for more than 240 points.  Division two saw an even faster start, as their trivial 250 was solved by about 8 people within 2 minutes.  The division 2 500 submissions followed, some as fast as the division 1 250 submissions, but most a bit slower.</p>
<p>The Division One 500 proved challenging to solve and slow to implement for most competitors, with 
<tc-webtag:handle coderId="7446789" context="algorithm"/>'s impressive 13-minute submission as the only standout exception.  Except for a couple solutions in the 17-minute range, everyone else took at least 20 minutes to solve it, and some took more than twice that long.</p>
<p>The 1000-point problem was harder to figure out but reasonably quick to code for both divisions, 
which also meant they had a big effect on the final scores.</p>
<p>When the dust settled, <tc-webtag:handle coderId="8355516" context="algorithm"/> was the clear winner of division 1, with one of the fastest 250s, the fastest 1000, and 2 successful out of three challenges.  
<tc-webtag:handle coderId="20812309" context="algorithm"/>came in next with another very impressive time on the 1000, and <tc-webtag:handle coderId="11829284" context="algorithm"/>
was in 3rd after
<tc-webtag:handle coderId="10574855" context="algorithm"/> dropped below him due to a failed challenge.</p>
<p>In division 2, many more people solved all three problems, and 

<tc-webtag:handle coderId="21758586" context="algorithm"/>, 
<tc-webtag:handle coderId="21475659" context="algorithm"/> and 
<tc-webtag:handle coderId="22675302" context="algorithm"/> came out on top.
</p> 

 

<H1> 

The Problems 

</H1>

</p> 

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7410&amp;rd=10666" name="7410">DegreesToRadians</a></b> 

</font> 

<A href="Javascript:openProblemRating(7410)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506232" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      451 / 483 (93.37%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      429 / 451 (95.12%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Alltouch</b> for 249.63 points (1 mins 6 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      222.76 (for 429 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

This problem had two very simple parts. The first is calculating the number of degrees as a double rather than the degree-minute-second combination. The second is converting that number to radians. Java even has a built-in function to do this conversion, so the resulting formula is simply Math.toRadians(degrees+minutes/60.0+seconds/3600.0).

</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7411&amp;rd=10666" name="7411">TagalogDictionary</a></b> 

</font> 

<A href="Javascript:openProblemRating(7411)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506232" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      335 / 483 (69.36%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      254 / 335 (75.82%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>michalcp</b> for 487.44 points (4 mins 35 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      309.00 (for 254 correct submissions) 

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

      366 / 373 (98.12%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      345 / 366 (94.26%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Quelloquialism</b> for 247.39 points (2 mins 55 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      194.93 (for 345 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

This is the second time I've written a problem based on the Tagalog language.  Actually, a few people who were up on their Kawigi-trivia guessed that I had written it without even reading the whole problem statement.  The first one was <a href="http://www.topcoder.com/stat?c=problem_statement&pm=3070">TaglishTranslator</a> from SRM 220.  The point of the other one was actually a bit of a poke at high-rated TopCoder veterans who complained about certain problems favoring native English-speakers, saying "here's a problem that favors native Tagalog-speakers!"  Unfortunately, as far as I know, no native Tagalog-speakers got to that problem during the contest with enough time to finish it.  While native Tagalog-speakers might have had a mild advantage on this problem (a few came and told me they liked the problem later), I really picked it because it's a nice, slightly twisted sorting problem.  In spite of the linguistic history I provided at the beginning of this problem, some people still didn't realize that Tagalog is a real language until I was speaking it with the couple of Tagalog-speakers that came to ask me how I knew about their language after the match.</p>
<p>In order to write a solution to this problem quickly, it helps to know the standard libraries for sorting in your language.  Otherwise, you'll need to write a whole sorting algorithm, where the built-in sorting functions allow you to just implement a comparison.</p>
<p>Since the standard lexicographical ordering doesn't work in this case (the k is out of order and the ng messes things up), the way I implemented my comparison function was to normalize the two strings to strings that could be lexicographically compared, and comparing those normalized strings.  My clever way of doing this looked like this:</p>
<ol>
<li>Convert the word to lowercase.  Originally, the problem allowed mixed case,
but asked for an alphabetical (not lexicographical) ordering that disregarded the case.  
Be glad that 
<tc-webtag:handle coderId="15545604" context="algorithm"/>
saved you all from doing that.</li>
<li>Change all of the 'k's into 'c's.</li>
<li>Convert all of the letters from 'a'-'n' to upper case</li>
<li>Replace all of the instances of 'NG' to a lower case 'n'.  This allows "ng" to be one letter and puts it after 'N' but before 'o' (because lowercase letters are lexicographically later than uppercase letters).</li>
</ol>
<p>Most of the faster times on this problem also had particularly clever ways to either compare the strings or normalize the strings to be compared automatically.  One of the most interesting solutions used a Java library I'm not familiar with - 
<tc-webtag:handle coderId="15500249" context="algorithm"/>'s 
<a href="http://www.topcoder.com/stat?c=problem_solution&rm=263915&rd=10666&pm=7411&cr=15500249">submission</a> used a <a href="http://java.sun.com/javase/6/docs/api/java/text/RuleBasedCollator.html">RuleBasedCollator</a> to specify the sorting order of substrings.  I also liked the method shared by 
<tc-webtag:handle coderId="21913678" context="algorithm"/> and 
<tc-webtag:handle coderId="22669153" context="algorithm"/>, which involved converting k to c, shifting o and p to p and q, and changing ng to o, then sorting and reverting the changes.  For comedic value, 
<tc-webtag:handle coderId="22627975" context="algorithm"/>'s <a href="http://www.topcoder.com/stat?c=problem_solution&rm=263920&rd=10666&pm=7411&cr=22627975">fastest submission</a> is worth looking at - I'm sure one "z" would have been enough, but why not add 55, just to be safe?
</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7413&amp;rd=10666" name="7413">ReverseUnnaturalBaseConversion</a></b> 

</font> 

<A href="Javascript:openProblemRating(7413)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506232" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      70 / 483 (14.49%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      53 / 70 (75.71%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>yudhistra</b> for 896.97 points (9 mins 51 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      583.73 (for 53 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

The hardest part about writing this problem for me was coming up with a clear, concise description of number bases (such that it would be obvious what they meant in the context of both positive and negative bases).  My favorite part about this problem is that it is a beautiful generalization of both standard number base conversion and problems like <a href="http://www.spoj.pl/problems/NEG2/">The Moronic Cowmputer</a> from USACO (available at the SPOJ archive, as well as other online judges).</p>
<p>The (relatively) simple algorithm people use to convert numbers into positive number bases also works on negative bases if it is implemented carefully.  This algorithm basically comes down to something like this:</p>
<pre>
x : number to be converted
b : number base
s : return string
s = ""
digit : next digit to prefix s with

if x = 0
    return "0"

if b > 0 and x < 0
    addsign = true
    x = abs(x)

while x != 0
    digit = x mod abs(b)
    s = digit + s
    x = (x-dig)/b

if (addsign)
    s = "-" + s;
return s
</pre>
<p>The interesting lines of code are:</p>
<ul>
<li><tt>if x = 0 return "0"</tt> : This is an easy way to make sure you don't return a zero-digit number when x is 0.  Another way to do this is to make the while loop later into a do-while loop.</li>
<li><tt>digit = x mod abs(b)</tt> : There's more to this than I wrote here.  "mod" in this case should be interpreted as "the difference between x and the next multiple of abs(b) less than x".  When x is positive, this is the same as x % b, but most programming languages define x%b as -((-x)%b) if x is negative.  An easy way to implement "x mod n" in these languages is (x%n+n)%n.</li>
<li><tt>x = (x-dig)/b</tt> : Again, if x is positive, it's normal to get this with x/b, but if x is negative, this doesn't do the right thing (x/b rounds toward zero rather than down).</li>
</ul>
</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7415&amp;rd=10666" name="7415">ReverseResources</a></b> 

</font> 

<A href="Javascript:openProblemRating(7415)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506232" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

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

      61 / 373 (16.35%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      34 / 61 (55.74%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>JongMan</b> for 419.02 points (13 mins 1 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      272.01 (for 34 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

This problem is based on a conversation with a friend of mine at Microsoft.  It's a problem he had floating around in his head, and he posed the problem to me because he knew me to be someone who loves solving a good, algorithmically interesting problem.  As such, I let it swim around in my head for a little while, too, and concluded that it's a very good, and practically interesting, dynamic programming problem.</p>
<p>However, when I tried to write a solution to this problem, I started to realize that the problem is harder than I thought it would be.  I think on the whole, the people who tried to solve it during the match would agree that it was harder than most div 1 500s.</p>
<p>There are differences between the "real-world" version of this problem and the "programming contest" version.  The real-world version would have to be able to handle longer input strings (probably on the order of 100-120 characters), and many more resource strings (easily thousands).  The "real-world" problem would also use non-resource strings in some cases (numbers, user-assigned names for objects, or file names, for instance) and might allow appending.  On the other hand, the programming contest version has pathological and fairly degenerate resource strings.</p>
<p>The gist of the problem was that you were given a bunch of strings as resources, created from a combination of normal characters and possibly littered with "%s" tokens, representing places where other strings are inserted, inspired by C's printf family of functions.  Then you're given a string, <b>str</b>, which may (or may not) have been constructed by repeatedly calling sprintf with those resource strings and other strings created by using sprintf on other resource strings.  The problem is to figure out how many unique ways <b>str</b> could have been constructed from the resources given.</p>
<p>The intended way for people to solve the problem was dynamic programming on all substrings.  This is a common pattern of dynamic programming that can be effectively done either bottom up (i.e. the filling-up-a-table way) or top-down (the recursive with memoization way).  In either case, you start with an NxN table (where N is the length of <b>str</b>), and you try to calculate each entry i,j in the table (where i <= j) no more than once.  Each entry represents the number of decompositions of the substring of str from index i to index j, inclusive.  To fill the table bottom-up, you should check all length-1 strings, then all length-2 strings, and so on, because longer substrings depend on shorter ones.</p>
<p>Then you're left with the problem of figuring out the number of decompositions of a substring given the number of decompositions of its substrings.  The easy thing to recognize, perhaps, is that it's the sum of the number of ways to decompose the substring using each resource strings.  When I got to this subproblem the first time I tried to write a solution to this problem, I realized that the problem was harder than I thought (and I even proposed that it might be used as a level 3 problem).  The reason was that finding the number of decompositions of a substring with a given outer resource string also required dynamic programming.  I'm going to have a harder time describing how I solved this subproblem in English, so I'll describe it with a gratuitously commented version of my code.</p>
<p>In the following code, <tt>substring</tt> is the substring being analyzed, <tt>start</tt> and <tt>end</tt> are the zero-based indexes of the first and last characters of <tt>substring</tt> in the original string.  <tt>resparts</tt> is the result of <tt>resources[i].split("%s", -1)</tt>, which divides up the resource on instances of "%s", including an empty string at the end if it ends with "%s".  <tt>MOD</tt> is a constant representing 1000000007.  <tt>memo</tt> is the table I described above:</p>
<pre>
// Make sure the first and last sections of the resource string match the beginning and end of this substring:
if (substring.startsWith(resparts[0]) && substring.endsWith(resparts[resparts.length-1]))
{
    // The first dimension is the number of %s's in the current 
    // resource plus the number of literal segments between
    // those %s's.  Even indexes here represent the points ending 
    // with literal sections of the resource string and
    // odd indexes represent points ending with %s insertions.  
    // Think of it like I've divided the resource string
    // chunks which are either "%s" or literal substrings with no "%s".
    // The second dimension is the length of the sub-substring 
    // that has been processed so far.
    // so tempmemo[x][y] represents the number of ways to construct 
    // the first y characters of substring with the
    // first x+1 chunks of the resource string.
    int[][] tempmemo = new int[resparts.length*2-1][substring.length()+1];
    // We've already verified that the first substring matches.
    tempmemo[0][resparts[0].length()] = 1;
    // for each chunk of the resource string:
    for (int j=1; j<resparts.length*2-1; j++)
        // for each prefix of the substring:
        for (int k=0; k<=substring.length(); k++)
            // If we're looking at a "%s" chunk:
            if (j%2 == 1)
            {
                // substitutions can't have zero length
                if (k > 0)
                    // for each substring of substring that ends at k (exclusive, this is different
                    // from the convention of the outer memo).
                    for (int l=k-1; l>=0; l--)
                    {
                        // add the number of decompositions of this substring times the number
                        // of partial decompositions of the first j-1 chunks over the part of
                        // the substring that's before this sub-substring.  This assumes that
                        // those parts of the table are already filled in.  If it were
                        // implemented top-down, this would be a recursive call.
                        int d = memo[start+l][start+k-1];
                        tempmemo[j][k] = (int)((tempmemo[j][k]+(long)d*tempmemo[j-1][l])%MOD);
                    }
            }
            // If we're looking at a literal chunk and the first k characters of substring ends with the
            // current chunk, then this answer includes all partial decompositions of the part of the
            // string before this suffix with the previous chunks of the resource string.
            else if (k >= resparts[j/2].length() 
            && substring.substring(k-resparts[j/2].length(), k).equals(resparts[j/2]))
                tempmemo[j][k] = (tempmemo[j][k]+tempmemo[j-1][k-resparts[j/2].length()])%MOD;
    // And now we add the results for this resource string 
    // to the answer for this value of the memo.  We assume that
    // the value here was 0 before we processed the first resource.
    int ways = tempmemo[resparts.length*2-2][substring.length()];
    memo[start][end] = (memo[start][end]+ways)%MOD;
}
</pre>
<p>The nested (and interleaved) nature of the dynamic programming makes this a particularly challenging DP problem, and the loads of iteration (especially in the case that the resource strings include lots of %s's) made it so we couldn't use this solution with the typical constraint of "everything can be 50".  One way to specifically optimize against the worst cases was to precompute the minimum length of a substring that could match each resource (basically it was the number of %s's + the number of characters not part of a %s), and not do the inner DP unless the resource could possibly match the substring based on that.  Still, that will only help on certain kinds of test cases, and in the end, we decided to reduce the constraints to allow the intended solution to pass.  I think there a more efficient solution to the problem exists, particularly if one makes optimizations for the common practical cases in the real-world problem, but perhaps even in the most pathological cases.  If you can think of some, feel free to share them with me and the community.</p>
<p>The higher-scoring solutions during the contest (like <tc-webtag:handle coderId="7446789" context="algorithm"/>'s, <a href="http://www.topcoder.com/stat?c=problem_solution&rm=263922&rd=10666&pm=7415&cr=7446789">here</a>) used a single dynamic programming scheme rather than the weaved algorithms that were more obvious to me - the state space was typically four-dimensional - the first two dimensions represented the current substring, and the last two represented the resource and which piece of the resource.
</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7412&amp;rd=10666" name="7412">DrivingAround</a></b> 

</font> 

<A href="Javascript:openProblemRating(7412)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506232" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      31 / 373 (8.31%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      15 / 31 (48.39%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Eryx</b> for 895.75 points (9 mins 55 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      660.85 (for 15 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

The solution to this problem should be both quickly recognized and relatively easy to throw together for people experienced in competitive programming - if the graph were unweighted, that is.  It's a well-known fact that we reds try and keep a secret from everyone else that the number of ways to get from point a to point b in a graph in exactly x steps, given an adjacency matrix, is element a,b of the adjacency matrix raised to the xth power.  We also try to keep it a secret that the exponentiation can be done in O(n^3logx) time, where n is the size of the matrix.  This kind of algorithm is the way to go if x is unreasonably large, as it is in this problem (if the graph were bigger or more general and the time were smaller, there's a much simpler O(E*x) algorithm for this particular problem).</p>
<p>The quirk to this problem is that the edges are weighted.  When I originally came up with this problem, I thought that the solution would involve expanding each edge into several more nodes (the length of the edge minus one), which makes the size of the matrix explode to unreasonable proportions rather quickly.  I thought that maybe if the graph were undirected, I could reuse nodes going both ways, but one day as I was (appropriately, I might add) driving around, I realized that wouldn't work, because you couldn't just turn around any time you wanted in the middle of the road.  Then it came to me that there was a different class of nodes that were equivalent - nodes in the middle of a road on the way to the same node.</p>
<p>My solution was then to create 5 nodes for every original node - one that represented the original node, and 4 that acted as a sort of "runway" to it.  Then I reconstruct the graph with the edge pointing from the first node to either the second node (if the edge length was 1) or a point on that node's runway.  I exponentized that matrix, and returned the answer from the nodes in the new graph that corresponded with my start and end times.</p>
<p>

<tc-webtag:handle coderId="303185" context="algorithm"/>, 
who was one of the problem's testers, came up with a slightly different but closely related approach.  Rather than converting the graph to a square n*l x n*l matrix (where n is the number of nodes and l is the maximum length of an edge), he created an n x n x l x l 4-dimensional matrix.  He still expanded it by something like logarithmic exponentiation; he just represented the modified graph differently.
</p>





<div class="authorPhoto">
    <img src="/i/m/Kawigi_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="8416646" context="algorithm"/><br />
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
