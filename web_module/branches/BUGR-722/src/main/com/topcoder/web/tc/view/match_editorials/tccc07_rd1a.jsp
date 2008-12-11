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
    <A href="/stat?c=round_overview&er=5&rd=10898">Match Overview</A><br />
    <tc-webtag:forumLink forumID="517208" message="Discuss this match" />
</div>
<span class="bodySubtitle">2007 TopCoder Collegiate Challenge<br />Algorithm Round 1A</span><br />Tuesday, August 28, 2007
<br /><br />



<h2>Match summary</h2> 

<p> 

The first Online Round of the 2007 TopCoder Collegiate Challenge brought together 490 participants, of which only 300 could advance. The problems were rather difficult for a first online round, however, so in the end only 296 coders managed to get a positive score. Thanks to a successful challenge phase, first place went to <tc-webtag:handle coderId="9906197" context="algorithm"/>, who managed to regain his target status, with <tc-webtag:handle coderId="9927526" context="algorithm"/> and <tc-webtag:handle coderId="307060" context="algorithm"/> finishing second and third.

</p> 

 

<H1> 

The Problems 

</H1>

</p> 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8110&amp;rd=10898" name="8110">LetterInterchange</a></b> 

</font> 

<A href="Javascript:openProblemRating(8110)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=517208" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 

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

      385 / 490 (78.57%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      231 / 385 (60.00%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Huacm17</b> for 248.73 points (2 mins 1 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      157.69 (for 231 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
A good way to approach a problem like this is to look at the easiest brute force solution that you can think of and optimize from there. In this case it is probably the following: for each pair of letters, swap them and see which swap results in the lexographically least string. After that, you analyze the runtime of the algorithm; we need to select two letters so that n^2/2 and each time we need to compare two strings of length n, so this algorithm performs about n^3/2 steps, which is too much as n can be as much as 5000 (I've tested this in the practice rooms and it is actually fast enough for n&lt;=1500).
</p>
<p>
The next thing to do is to find a way to optimize the algorithm. There are several alternatives here. I'll first describe the one that I think is the easiest. For this you have to notice that if you can swap a character in a certain position with a smaller character in a later position, then the resulting string will always be less than if we exchange two characters after this position. In other words, we can find the first position in the string which we can decrease and only consider the swaps with this position. The complexity of this algorithm is about n^2/2 for finding a position that we can decrease, plus an additional n comparisions of strings of length n, totaling n^2/2+n^2, which easily fits in the time limit.
</p>
<p>
There is, however, a special case we must handle. What if it is impossible to find a position in the string whose value we can decrease? In this case the string must already be sorted (otherwise there exists two adjacent positions i and i+1 with s[i+1]&lt;s[i]). The best we can do now is to keep the string the same, and exchange the first two positions which have equal characters. If no character occurs twice in the string, then the best we can do is to change the last two characters. Code follows:
</p>
<pre>
vector &lt;int&gt; interchangeWhich(vector &lt;string&gt; s1, vector &lt;string&gt; s2) {
    string s;
    for(int i=0;i&lt;s1.size();++i) s+=s1[i];
    for(int i=0;i&lt;s2.size();++i) s+=s2[i];
    
    for(int i=0;i&lt;s.size();++i) {
        bool ok=false;
        for(int j=i+1;j&lt;s.size();++j) if(s[j]&lt;s[i]) ok=true;
        if(!ok) continue;
        
        vector&lt;int&gt; ret(2);
        string best;
        for(int j=i+1;j&lt;s.size();++j) {
            swap(s[i],s[j]);
            if(j==i+1||s&lt;best) best=s,ret[0]=i,ret[1]=j;
            swap(s[i],s[j]);
        }
        return ret;
    }
    
    for(int i=0;i+1&lt;s.size();++i) if(s[i]==s[i+1]) {
        vector&lt;int&gt; ret(2);
        ret[0]=i;
        ret[1]=i+1;
        return ret;
    }
    
    vector&lt;int&gt; ret(2);
    ret[0]=s.size()-2;
    ret[1]=s.size()-1;
    return ret;
}
</pre>
<p>
We can optimize this code to a linear algorithm. The first step is to note that if we can decrease the character in a certain position, we should decrease it as much as possible to obtain the smallest possible string. If there are several characters with this lowest value, we should choose the one which occurs latest in the string, since at the same time as we decrease the value of the first position, we increase the value at the second position. So the inner loop can be rewritten as follows:
</p>
<pre>
vector&lt;int&gt; ret(2);
for(int j=i+1;j&lt;s.size();++j) {
    if(j==i+1||s[j]&lt;=s[ret[1]]) ret[0]=i,ret[1]=j;
}
return ret;

</pre>
<p>
The algorithm is still quadratic, because we first have to find a position which value we can decrease. This can be optimized by precomputing the smallest value which occurs after a certain position. This can be done as follows:
</p>
<pre>
string lowestafter=s;
for(int i=s.size()-2;i&gt;=0;--i) 
 if(lowestafter[i+1]&lt;lowestafter[i]) lowestafter[i]=lowestafter[i+1];

for(int i=0;i&lt;s.size();++i) {
    bool ok=lowestafter[i]&lt;s[i];
</pre>
<p>
To make the algorithm truly linear, we also have to change the initial concatenation to get s out of s1 and s2, since this currently still is quadratic. It should be noted that during the competition, it is completely unneccessary to perform these kinds of optimizations. Just coding the first thing that works gives you the most points.
</p>

<p>
<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7501&amp;rd=10898" name="7501">LongestSubanagramChain</a></b> 

</font> 

<A href="Javascript:openProblemRating(7501)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=517208" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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

      236 / 490 (48.16%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      182 / 236 (77.12%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Vedensky</b> for 480.08 points (5 mins 50 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      347.78 (for 182 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
In my opinion, the most difficult part of the medium problem was understanding what you were being asked to compute. Let me try to explain this in a formulation that is closer to the implementation of the algorithm to solve this problem. What you were asked for is each string B[i] in B, to find another string A[i], where the letters of A[i] form a subset of the letters of B[i], all A[i]'s have equal length and A[i] dominates A[i-1]. You had to return the maximum length possible for the A[i]'s.
</p>
<p>
The first thing to notice is that we can choose the A[i]'s in such a way that the letters in each A[i] are sorted. This can be proven by induction. Suppose that the first i-1 words are sorted and in the i-th word and the first character that is in the wrong position in word i is at position j and the character at position k should take its place (k>j). Then we can exchange the characters in position j and k for all words &gt;= i. The only thing that possibly can go wrong is that word i doesn't dominate word i-1 anymore, but this doesn't happen, as we have A[i][k]&gt;A[i][j]&gt;=A[i-1][j] and A[i][j]&gt;=A[i-1][j]&gt;=A[i-1][k].
</p>
<p>
To make our life easier, we also sort each string in B. Now it is easy to see that A[0] should consist of the first characters of B[0], since it is 'easier' to dominate this subset of B[0] than any other subset of B[0]. Similarly, for i&gt;=1 A[i] should be the smallest subsequence of B[i] that dominates A[i-1]. The only thing we don't know is how to find the smallest subsequence of B[i] that dominates A[i]. This can be done as follows: first find the smallest character in B[i] that is greater or equal to A[i-1][0], then find the smallest character that is greater or equal to A[i-1][1], etc. Once we can't find such a character, we know that it is impossible. Code follows:
</p>
<p><pre>
int getLength(vector &lt;string&gt; B) {
    for(int i=0;i&lt;B.size();++i) sort(B[i].begin(),B[i].end());
    string res=B[0];
    for(int i=1;i&lt;B.size();++i) {
        string nres;
        for(int j=0;j&lt;B[i].size();++j) 
         if(nres.size()&lt;res.size()&&B[i][j]&gt;=res[nres.size()]) 
          nres+=B[i][j];
        res=nres;
    }
    return res.size();
}
</pre></p>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8162&amp;rd=10898" name="8162">KSlopePermutation</a></b> 

</font> 

<A href="Javascript:openProblemRating(8162)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

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

      46 / 490 (9.39%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      28 / 46 (60.87%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>krijgertje</b> for 759.40 points (17 mins 10 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      601.62 (for 28 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
Here the problem description already contains a huge hint on how to solve the problem. We already know where to place 0 in the inverse permutation. It is at position f. Therefore, if f!=0 the inverse permutation will at least be a 1-slope, since it is impossible that a lower number will precede it (0 is the lowest number). Next we have to decide where to place the number 1 in the inverse permutation, if it is not at position 0 and not at position f+1, we again add 1 to the slope of the inverse permutation and otherwise, we don't. We keep on continuing this way until we have placed all numbers and count how many times we encountered a k-slope.
</p>
<p>
There is one obvious problem with the above solution: it is way too slow. Therefore we have to optimize it, just as in the easy problem. One way to optimize the algorithm is to note that at any given point the number of permutations with an extra slope of k is only dependant on which positions are taken, not on the values which are in those positions. Therefore, we can dp on the following state: (available positions,extra slope required). This gives us 2^n*n states (roughly 20 million) and each state requires about n computations. This is very borderline. An additional problem is that not all states fit into memory, so we have to first calculate the answers for k=0, from that calculate the answers for k=1, throw away the answers for k=0, from the answers for k=1 calculate the answers for k=2, throw away the answers for k=1, and so forth until we reach our desired k. All in all, this was not the intended solution, but it can be made to work. The following code, which uses some bit manipulation tricks to optimize its runtime, solves the hardest case in 1.99 seconds in the practice rooms (really :)) :
</p>
<pre>
long long dp[2][1&lt;&lt;20];

long long getCount(int n, int k, int f) {
    if(f!=0) --k; if(k&lt;0) return 0;
    int a=0,b=1;
    REPE(i,k) {
        a=1-a,b=1-b;
        dp[a][0]=i==0?1:0;
        FOR(j,1,1&lt;&lt;n) {
            dp[a][j]=0;
            int tmp=j;
            while(tmp&gt;0) {
                int k=tmp&(-tmp); tmp-=k;
                if(k==1||!(j&(k&gt;&gt;1))) dp[a][j]+=dp[a][j-k]; 
                else if(i!=0) dp[a][j]+=dp[b][j-k];
            }
        }
    }
    return dp[a][(1&lt;&lt;n)-1-(1&lt;&lt;f)];
</pre>
<p>
Allthough the above implementation works, I wouldn't feel comfortable in the contest with it, because of the 1.99 seconds runtime. With one further observation, we can reduce the runtime dramatically. The number of permutations with an extra slope of k depends only of the length of the intervals that are still available, and not on the position or the order of these intervals. Therefore we can memoize on the state: (lengths of available intervals,extra slope required). The following code runs in only 31 milliseconds in the worst case!
</p>
<pre>
map&lt;vector&lt;int&gt;,long long&gt; mem[20];
long long go(const vector&lt;int&gt; &intervals,int k) {
    if(k&lt;0) return 0;
    if(intervals.size()==0) return k==0?1:0;
    if(mem[k].count(intervals)) return mem[k][intervals];
    long long ret=0;
    for(int i=0;i&lt;intervals.size();++i) for(int j=0;j&lt;intervals[i];++j) {
        int nk=k-(j!=0?1:0);
        vector&lt;int&gt; nintervals=intervals;
        nintervals.erase(nintervals.begin()+i);
        if(j!=0) nintervals.push_back(j); 
        if(j!=intervals[i]-1) nintervals.push_back(intervals[i]-j-1);
        sort(nintervals.begin(),nintervals.end());
        ret+=go(nintervals,nk);
    }
    return mem[k][intervals]=ret;
}


class KSlopePermutation {  
public:  
    long long getCount(int n, int k, int f) {
        if(f!=0) --k;
        vector&lt;int&gt; intervals;
        if(f!=0) intervals.push_back(f); 
        if(f!=n-1) intervals.push_back(n-f-1);
        sort(intervals.begin(),intervals.end());
        return go(intervals,k);
    }
};
</pre>
<p>
During the contest I thought of both approaches above, and I was just about to implement the second algorithm when I noticed an easier algorithm. The additional slope each interval contributes is independent of the other intervals! So if we fix the numbers that go in each interval and fix how much each interval should contribute to the slope, we have smaller subproblems which we can dp / memoize on. The state in this case is: (length of the interval, extra slope required). Specifically if we have one interval of length n, and place the smallest number on position f, we can loop over all possible additional slopes for the interval to the left of f, and the additional slope for the interval to the right of f follows from this immediately. We recursively calculate the number of ways for both of these subcases, multiply their results and multiply that with the number of ways to place f of the n-1 remaining elements to the left of f. The following code is very similar to my fastest submission during the contest and runs in 2 milliseconds.
</p>
<pre>
long long choose[20][20];
long long mem[20][20];
long long go(int n,int k) {
    if(n==0) return k==0?1:0;
    long long &ret=mem[n][k];
    if(ret==-1) {
        ret=0;
        for(int f=0;f&lt;n;++f) {
            int kk=f==0?k:k-1;
            for(int i=0;i&lt;=kk;++i) ret+=go(f,i)*go(n-f-1,kk-i)*choose[n-1][f];
        }
    }
    return ret;
}

class KSlopePermutation {  
public:  
    long long getCount(int n, int k, int f) {
        choose[0][0]=1; 
        for(int i=1;i&lt;n;++i) { choose[i][0]=choose[i][i]=1; 
        for(int j=1;j&lt;i;++j) choose[i][j]=choose[i-1][j-1]+choose[i-1][j]; }
        memset(mem,-1,sizeof(mem));
        long long ret=0;
        int kk=f==0?k:k-1;
        for(int i=0;i&lt;=kk;++i) ret+=go(f,i)*go(n-f-1,kk-i)*choose[n-1][f];
        return ret;
    }
};
</pre>
<br /><br />



<div class="authorPhoto">
    <img src="/i/m/krijgertje_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="9906197" context="algorithm"/><br />
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
