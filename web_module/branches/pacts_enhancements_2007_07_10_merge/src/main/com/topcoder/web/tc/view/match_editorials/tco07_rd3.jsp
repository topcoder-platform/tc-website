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
    <A href="/stat?c=round_overview&er=2&rd=10751">Match Overview</A><br>
    <tc-webtag:forumLink forumID="514952" message="Discuss this match" />
</div>
<span class="bodySubtitle">2007 TopCoder Open<br>Round 3</span><br>Saturday, April 21, 2007
<br><br>


<h2>Match summary</h2> 

<p>
The third Online Round for the TCO07 reduced the number of coders competing for the title from 300 to 150. The round started with an easy "do what it says" problem, which more than 90% of the coders had no problems with. It continued with a difficult medium, with which a lot of the coders had considerable difficulty. About a third of the coders managed to solve it, with scores spread out from 150 to almost 500. The hard was a hidden bipartite matching problem, which 37 coders managed to solve.
<br />
<br />

In the end any of the following was enough to advance to the last Online Round: two problems, a fast easy, a not too slow medium, a hard, a problem and a challenge or a lot of challenges. First was <tc-webtag:handle coderId="275071" context="algorithm"/>, who seems to be on     his way back up again, followed by <tc-webtag:handle coderId="10574855" context="algorithm"/> and <tc-webtag:handle coderId="144400" context="algorithm"/>. 
<br /><br />
</p>
 
<H1>
The Problems
</H1>
</p> 

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7544&amp;rd=10751" name="7544">SortMaterials</a></b> </font> <A href="Javascript:openProblemRating(7544)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A><A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514952" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level One: <blockquote><table cellspacing="2">
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
      287 / 290 (98.97%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      266 / 287 (92.68%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>JongMan</b> for 245.52 points (3 mins 51 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      219.70 (for 266 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This is just a "do what it says"-problem. One possible solution is to loop over all elements of data and determine if it satisfies all requirements:


<pre>
int totalVolume(vector &lt;string&gt; data, vector &lt;string&gt; requirements) {
    int ret=0;
    for(int i=0;i&lt;(int)data.size();++i) {
      istringstream iss(data[i]); int edge,quality; string color;
      iss&gt;&gt;edge&gt;&gt;quality&gt;&gt;color;
      bool ok=true;
      for(int j=0;j&lt;(int)requirements.size();++j) if(requirements[j][0]=='E') {
        int x=atoi(requirements[j].c_str()+5); if(edge!=x) ok=false;
      } else if(requirements[j][0]=='Q') {
        int x=atoi(requirements[j].c_str()+8); if(quality&lt;x) ok=false;
      } else {
        string s=requirements[j].substr(6); if(color!=s) ok=false;
      }
      if(ok) ret+=edge*edge*edge;
    }
  return ret;
}
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7622&amp;rd=10751" name="7622">Candles</a></b> </font> <A href="Javascript:openProblemRating(7622)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A><A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514952" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      204 / 290 (70.34%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      100 / 204 (49.02%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>tteesstt</b> for 480.50 points (5 mins 46 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      295.24 (for 100 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
When looking at a problem statement like this, you have to ask yourself: "What are the important variables that I need to determine?" You have to be able to express the constraints as well as the objective in these variables. This is an important step in solving the problem, and the wrong choice may lead to disaster.
<br />
<br />

In this case, the best choice for the variables is, "how long am I going to burn each candle of type 1 and how long am I going to burn each candle of type 2?" Let's call these variables burn1 and burn2 respectively. Now let's look at the constraints:


<ul>
  <li>
All ceremonies have the same length. This wasn't stated in the problem, but was broadcast as a clarification during the contest. This means that we can replace "how long am I going to burn,&quot; with "how many ceremonies am I going to burn.&quot; Furthermore, because a candle either burns an entire ceremony or it doesn't burn at all during a ceremony, burn1 and burn2 should be integers.
</li>

  <li>
Afterwards all candles need to have the same length. This means that burn1*r1=burn2*r2. Now we have an integer equation, which we can solve using a little algebra. The lowest possible positive values for which the equation is true (let's call them step1 and step2), is when step1*r1=step2*r2=lcm(r1,r2), so step1=lcm(r1,r2)/r1=r2/gcd(r1,r2) and step2=lcm(r1,r2)/r2=r1/gcd(r1,r2). All solutions to the equations are of the form burn1=times*step1 and burn2=times*step2. So now we have only one variable left to determine.
</li>

  <li>
We have to minimize the number of ceremonies, which is equal to (n1*burn1+n2*burn2)/n=times*(n1*step1+n2*step2)/n, so we have to minimize times. This also implies that times*(n1*step1+n2*step2) is divisible by n. In the contest, you could do this by simply looping over the variable times until this condition was met, or using some algebra you could directly derive that the lowest positive valid value for times is n/gcd(n,n1*step1+n2*step2).
</li>

<li>
Finally, at each ceremony n candles are lit. This again means that times*(n1*step1+n2*step2) should be divisible by n, but also that it should be possible to assign n candles to each ceremony in such a way that all candles burn the amount of time we want. Example 2 shows what can go wrong. I think this is the hardest part of the problem, and I've seen several ways to do it.

  <ul>
    <li>
If we need to burn a candle of one of the types more times than we have ceremonies, it is obviously impossible. In other words, we should return -1 if max(times*step1,times*step2)>times*(n1*step1+n2*step2)/n or if n*max(step1,step2)>(n1*step1+n2*step2). Otherwise it turns out that it is always possible (proof left as an exercise for the reader).
</li>

    <li>
If the total number of burns for candles of a type is smaller than the minimal number of burns for candles of that type, then it is also impossible. We should return -1 if n1*step1<(n-n1)*step2 or n2*step2<(n-n2)*step1. Regarding the first formula: we need exactly n1*step1 burns of type 1 candles, but we need at least step2 different ceremonies to satisfy the candles of type 2 (you cant burn one candle multiple times during a ceremony) and at each ceremony, we have to burn at least n-n1 candles of type 1 at each ceremony. After rearranging terms, this formula turns out to be equivalent to the one in the previous paragraph.
</li>

    <li>
Just simulate the process using the following strategy: at each ceremony burn the candles that need the most burns. If you ever have to burn a candle that already has enough burns, return -1.
</li>
  </ul></li></ul>

<pre>
int ceremonies(int n, int n1, int r1, int n2, int r2) {
    int step1=r2/__gcd(r1,r2),step2=r1/__gcd(r1,r2);
    if(n*max(step1,step2)&gt;n1*step1+n2*step2) return -1;
    int times=n/__gcd(n,n1*step1+n2*step2);
    return times*(n1*step1+n2*step2)/n;
}  
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7335&amp;rd=10751" name="7335">VotingBloc</a></b> </font> <A href="Javascript:openProblemRating(7335)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A><A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514952" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      101 / 290 (34.83%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      37 / 101 (36.63%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 817.15 points (14 mins 6 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      594.97 (for 37 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
First we are going to reformulate the problem in graph concepts. Let the nodes of the graph be the voters and draw an edge between two voters if they are not allowed to vote both, i.e. they are allies and they have different opinions. The problem now basically asks to find the largest set of voters, such that there does not exist an edge between two voters in this set. You have to return the complement of this set, taking some tiebreaking rules in account.
<br /><br />

Experienced coders should recognize immediately that this is a 'Maximum independent set'-problem, which is NP-hard. So there must be some trick that makes it possible to calculate efficiently. The first thing to check for is if the graph is bipartite, in which case there are efficient algorithms. This is indeed the case, because the set of voters can be partitioned into two subsets -- the yes-voters and the no-voters -- and there are no edges between voters in the same subset.
<br />
<br />

To find the 'maximum independent set' in a bipartite graph we can use bipartite matching. The only thing left is the tiebreaking rule. We can take this it into account as follows: first calculate the number of voters who need to abstain, and call this res. Now let the first voter abstain from voting and calculate the additional number of voters who need to abstain. If this number is less than it was previously (it will always be one less in this case), there is a set of voters who abstain from voting which includes the first voter, so the return set must include the first voter. Otherwise, there is no set of voters who abstain which includes the first voter, so the return set does not include the first voter. Continue this process with the second voter, etc. until all voters have been processed. After this we will have constructed the lexographically least set of voters who can abstain from voting, so we just return this set.

<pre>
int n;
int ally[50][50];

int nrleft,nrright;
int left[50],right[50];
int can[50];

int done[50],match[50];

bool augment(int i) {
  if(!can[left[i]]||done[i]) return false; else done[i]=true;
    for(int j=0;j&lt;nrright;++j) if(ally[left[i]][right[j]]&&can[right[j]])
      if(match[j]==-1||augment(match[j])) {
        match[j]=i;
        return true;
      }
  return false;
}

int maxflow() {
  memset(done,0,sizeof(done));
  memset(match,-1,sizeof(match));
  int ret=0;
  for(int i=0;i&lt;nrleft;++i) if(augment(i)) {
    ++ret;
    memset(done,0,sizeof(done));
  }
  return ret;
}

vector &lt;int&gt; abstainers(vector &lt;string&gt; voter) {
  n=(int)voter.size();
  memset(ally,0,sizeof(ally));
  for(int i=0;i&lt;n;++i) {
    istringstream iss(voter[i].c_str()+1); int j;
    while(iss&gt;&gt;j) { --j; ally[i][j]=ally[j][i]=1; }
  }

  nrleft=0,nrright=0;
  for(int i=0;i&lt;n;++i) if(voter[i][0]=='N') {
    left[nrleft++]=i;
  } else {
    right[nrright++]=i;
  }
  for(int i=0;i&lt;n;++i) can[i]=true;
      
  int res=maxflow();
  vector&lt;int&gt; ret;
  for(int i=0;i&lt;n;++i) {
    can[i]=false;
    if(maxflow()==res-1) {
      ret.push_back(i+1);
      --res;
    } else {
      can[i]=true;
    }
  }
  return ret; 
} 

</pre>
</p>




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
            <jsp:include page="/public_right.jsp">
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
