<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: TCHS SRM 56 Problem Set &amp; Analysis</title>

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
    <a href="/tc?module=Static&amp;d1=hs&amp;d2=match_editorials&amp;d3=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <a href="/tc?module=HSRoundOverview&amp;rd=13525&amp;snid=3&amp;er=5">Match Overview</a><br />

<tc-webtag:forumLink forumID="523238" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 56</span><br />Thursday, September 4, 2008
<br /><br />


<h2>Match summary</h2> 

<p>
TCHS SRM 56 was more difficult than a typical SRM, with a low success rate in both the medium and hard problem. Only 2 coders were able to solve all three problems, the winner <tc-webtag:handle coderId="22707311" context="hs_algorithm"/> and the runner-up <tc-webtag:handle coderId="22698470" context="hs_algorithm"/>. Both of them have competed at TC for less than a year, and they are already yellow in the regular Algorithm bracket as well. Good luck to the both of you at becoming red! 
</p> 
<p>Finishing out the top 5 were <tc-webtag:handle coderId="22695296" context="hs_algorithm"/>, <tc-webtag:handle coderId="22687801" context="hs_algorithm"/> and <tc-webtag:handle coderId="11972352" context="hs_algorithm"/>. </p>
 
<h1> 
The Problems 
</h1>
<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=10010&amp;rd=13525" name="10010">StrangeComparator</a></strong></font> 
<a href="Javascript:openProblemRating(10010)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523238" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br> 
Used as: Division One - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      250 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      64 / 69 (92.75%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      63 / 64 (98.44%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Zuza</strong> for 249.14 points (1 mins 40 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      225.73 (for 63 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>This was the only easy problem of the SRM, and it was very easy. To pass system test, you had to implement a function which did what the problem statement told you to do.</p>
<pre>
    vector&lt;string&gt; compareString(vector&lt;string&gt; a, vector&lt;string&gt; b)
    {
        vector&lt;string&gt; ret;
        for(int i = 0; i &lt; a.size(); i++)
        {
            if(a[i].size() != b[i].size()) ret.push_back("No");
            else
            {
                int wrong = 0;
                for(int j = 0; j &lt; a[i].size(); j++)
                {
                    if(a[i][j] != b[i][j]) wrong++;
                }
                if(wrong > 1) ret.push_back("No");
                else ret.push_back("Yes");
            }
        }
        return ret;
    }
    </pre>


<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9985&amp;rd=13525" name="9985">Playlist</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9985)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523238" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      16 / 69 (23.19%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      6 / 16 (37.50%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Zuza</strong> for 411.52 points (13 mins 48 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      275.40 (for 6 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>When I was solving this SRM in the practice room, this question tricked me a couple of times and bamboozled me for a good hour. For me, it was harder than the 1000-point problem. I submitted 2 or 3 wrong solutions before coming to the right answer. </p>
<p>The issues and faulty logic I encountered came from trying to tackle this problem head on. I attempted to write code which calculated the "possible spots" to put good songs based on each spot's frequency in the playlist, which is easy, and then used that to optimally assign good songs to some subset of those spots. This failed because, as I found out, my logic couldn't deal with cases where there were many more "possible spots" than good songs. Try as I might, I couldn't make progress thinking about the problem this way. </p>
<p>So, I decided to take a different approach. Instead of trying to directly calculate the optimal solution, I just calculated what the <strong>best_score</strong> of the optimal solution would be. To do this, you just choose the <strong> M </strong> most frequently played positions in the playlist, where <strong> M </strong> is the size of <strong> best </strong>, and take the total number of points earned by putting good songs in those positions. </p>
<p>With this information, my code then iteratively builds the optimal solution. Starting at position 0 in the playlist, and working forward, at each position <strong>i</strong> I iterate over all the song numbers I have yet to add to the playlist, in order. With each song <strong> j </strong> reached, I try to add it to my optimal solution at position <strong>i</strong>, and then calculate to see the best score I could get. If this is equal to the <strong>best_score</strong>, I keep song <strong> j</strong> at position <strong> i </strong> and then continue to position <strong> i+1 </strong>. </p>
<h4> Exercises </h4> <ol> <li> What is the complexity of the following code in Big-O Notation? </li> <li> Write a solution to this problem that does not use this iterate-and-test method. </li> <li> What is the complexity of that solution? </li> </ol>
<pre>
const int MAXN = 55;
int times[MAXN];
class Playlist {
public:

    
    int pos_score(vector&lt;int&gt; left, vector&lt;int&gt; best, int pos, int N)
    {
        if(pos == N) return 0;
        vector&lt;int&gt; points;
        for(int i = pos; i &lt; N; i++) 
            points.push_back(times[i]);
        
        sort(points.begin(), points.end());
        int ret = 0;
        for(int i = 0; i &lt; best.size(); i++)
        {
            if(left[best[i]] == 0) continue;
            ret += points.back();
            points.pop_back();
        }
        
        return ret;
    }
            
    vector&lt;int&gt; trackSort(int N, vector&lt;int&gt; best, vector&lt;int&gt; order)
    {
        memset(times,0,sizeof(times));
        for(int i = 0; i &lt; best.size(); i++) 
            best[i]--;
        for(int i = 0; i &lt; order.size(); i++) 
            times[order[i]-1]++;
        
        vector&lt;int&gt; left(N,1);
        int best_score = pos_score(left,best,0,N);
        
        vector&lt;int&gt; ret(N,0);
        int cur_score = 0;
        for(int i = 0; i &lt; N; i++)
        {
            for(int j = 0; j &lt; N; j++)
            {
                if(left[j] == 0) continue;
                left[j] = 0;
                bool is_good = false;
                for(int k = 0; k &lt; best.size(); k++) 
                    if(best[k] == j) is_good = true;
                if(is_good) cur_score += times[i];
                int total = pos_score(left,best,i+1,N);

                if((total + cur_score) == best_score)
                {
                    ret[i] = j+1;
                    break;
                }
                else
                {
                    left[j] = 1;
                    if(is_good) cur_score -= times[i];
                }
            }
        }
        
        return ret;
    }
};
</pre>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9987&amp;rd=13525" name="9987">BestJob</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9987)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523238" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1000 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      12 / 69 (17.39%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      4 / 12 (33.33%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>AndyFang</strong> for 676.47 points (21 mins 59 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      641.36 (for 4 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p><i> A quick definition: to make the inverse of a string <strong> a </strong>, replace each 'Y' with an 'N', and each 'N' with a 'Y'. For example, 'YNNNNY' becomes 'NYYYYN' and 'NYNY' becomes 'YNYN'. </i> </p>
<p>This problem looks complicated at the beginning, but becomes very simple with one key observation. That is, if <strong> k1 != 0 </strong> or <strong>k2 != 0</strong>, then the solution, if it exists, has to equal either one of the answer strings given in the input vector, or the <strong> inverse </strong> of one of those answer strings. This is obvious, because if the solution is not, then every person answered at least one question right and one question wrong and they all belong to group 3, which is a contradiction. With this knowledge we can break down the solution into two cases:
<h4> Case A : k1 != 0 || k2 != 0 </h4>
<p>So, we know that for Case A, the solution is either one of the answer strings, or one of their inverses. To find the optimal one, we iterate over all of the answer strings, and each of their inverses, and calculate what the sizes of the three groups - <strong> g1, g2 and g3 </strong> - would be if that string was the actual list of answers for the test. If <strong> g1 == k1 &amp;&amp; g2 == k2 &amp;&amp; g3 == n-k1-k2 </strong>, then that string is a possible solution. Out of all the possible solutions, we return the lexographically shortest one. </p>
<h4> Case B: k1 == 0 &amp;&amp; k2 == 0 </h4>
<p>We can use our key observation to tell us what the solution to Case B should look like - it <strong> cannot </strong> be equal to one of the answer strings or their inverses. In fact, all those strings which do not appear in the input vector and are not inverses of the strings in the input vector are possible solutions. Therefore, we should return the lexographically smallest of them. </p>
<p>How do we do that? Well, lets start at the smallest string (all 'N's), and iterate through the strings in lexographic order. We return the first string we encounter which is not an answer string or the inverse of an answer string. Iterating through the strings in order is actually a tricky problem, so lets diagram out the order of strings we would check if <strong> N = 3</strong>, to see if we can find a pattern to code:</p>
<pre>
N N N
N N Y
N Y N
N Y Y
Y N N
Y N Y
Y Y N
Y Y Y
</pre>
<p>Mentally replace the N's with 0's and the Y's with 1, and you will come to a possibly startling insight - this is a ordered list of the number 0-7... in binary! Therefore, to iterate through the strings, we only have to start at 0, and continue forward, translating each number to its respective string, and then check that string to see if it is a valid solution. </p>

<h4> Exercises </h4>
<ol>
<li> In Case B, how come we do not check 2^(N) strings in the worst case? How many strings <strong>do</strong> we check in the worse case? </li>
<li> What is the complexity in Big-O notation of the algorithm for each Case, assuming that testing for string equality takes N operations. </li>
<li> Is this the smallest complexity possible? </li>
</ol>
<pre>

class BestJob {
public:
    
    int N, NQ;
    vector&lt; vector&lt;int&gt; &gt; responses, inverses;
    
    vector&lt;int&gt; makeinv(vector&lt;int&gt; answers)
    {
        vector&lt;int&gt; ret;
        for(int i = 0; i &lt; NQ; i++)
        {
            ret.push_back(1-answers[i]);
        }
        return ret;
    }
    
    int correct(vector&lt;int&gt; person, vector&lt;int&gt; data) 
    {
        int ret = 0;
        for(int i = 0; i &lt; NQ; i++)
            if(person[i] == data[i]) ret++;
        
        return ret;
    }
    
    string convert(vector&lt;int&gt; data)
    {
        string ret =  "";
        for(int i = 0; i &lt; data.size(); i++)
        {
            if(data[i] == 1) ret += 'Y';
            else ret += 'N';
        }
        return ret;
    }
    
    vector&lt;int&gt; nextSmallest(vector&lt;int&gt; current)
    {
        for(int i = current.size()-1; i &gt;= 0; i--)
        {
            if(current[i] == 1) current[i] = 0;
            else 
            {
                current[i]++;
                return current;
            }
        }
        current[0] = -1;
        return current;
    }
    
    string didIMadeMistake(int right, int wrong, vector&lt;string&gt; answers)
    {
        N = answers.size(); 
        NQ = answers[0].size();
        
        for(int i = 0; i &lt; N; i++)
        {
            vector&lt;int&gt; next;
            for(int j = 0; j &lt; NQ; j++)
            {
                if(answers[i][j] == 'Y') next.push_back(1);
                else next.push_back(0);
            }
            responses.push_back(next);
        }
        
        for(int i = 0; i &lt; N; i++)
            inverses.push_back(makeinv(responses[i]));
        
        if(right == 0 &amp;&amp; wrong == 0)
        {
            vector&lt;int&gt; test(NQ,0);
            while(true)
            {    
                int ok = 1;
                for(int i = 0; i &lt; N; i++)
                {
                    int score = correct(responses[i],test);
                    if(score == 0 || score == NQ) 
                    {
                        ok = 0;
                    }
                }
                if(ok == 1) return convert(test);
                test = nextSmallest(test);
                if(test[0] == -1) break;
            }
            return "";
        }
        
        string best = "";
        for(int i = 0; i &lt; 2*N; i++)
        {
            vector&lt;int&gt; possible;
            if(i &lt; N) possible = responses[i];
            else possible = inverses[i-N];
            
            int numberW = 0, numberR = 0;
            for(int j = 0; j &lt; N; j++)
            {
                int score = correct(responses[j],possible);
                if(score == 0) numberW++;
                else if(score == NQ) numberR++;
            }
            if(numberW == wrong &amp;&amp; numberR == right)
            {
                if(best.size() == 0 || convert(possible) &lt; best) 
                    best = convert(possible);
            }
        }
        
        return best;
    }
};
</pre>
<br />


<div class="authorPhoto">
    <img src="/i/m/nophoto.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="20635649" context="algorithm" /><br />    <em>TopCoder Member</em>
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
