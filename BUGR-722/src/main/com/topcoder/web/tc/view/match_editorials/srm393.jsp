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
<%-- Left Column Begins--%>
   <td width="180" id="onLeft">
      <jsp:include page="/includes/global_left.jsp">
         <jsp:param name="node" value="algo_match_editorials"/>
      </jsp:include>
   </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
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
    <A href="/stat?c=round_overview&er=5&rd=11127">Match Overview</A><br />
    <tc-webtag:forumLink forumID="520289" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 393</span><br />Tuesday, March 11, 2008
<br /><br />



<h2>Match summary</h2> 

<p> 
This match was marked by <tc-webtag:handle coderId="10574855" context="algorithm"/> achieving a new record high TopCoder rating of 3756, 3 points higher than the record he set nearly a year ago. Congratulations, <tc-webtag:handle coderId="10574855" context="algorithm"/>!
</p> 
<p>In division I, coders faced a simulation-based easy problem, followed by a medium that required a lot of thinking but a relatively small amount of coding, and a hard that was tricky to implement correctly. The top three coders in the division, <tc-webtag:handle coderId="10574855" context="algorithm"/>, <tc-webtag:handle coderId="14768757" context="algorithm"/> and <tc-webtag:handle coderId="7459080" context="algorithm"/> were all placed in the same room, which is unfortunate considering that prizes were available this match.</p>
<p>In division II, the hard problem was too tricky to get any passing submissions, so competitors fought it out on the easy and medium problems. <tc-webtag:handle coderId="22675110"/> won the division, division II veteran <tc-webtag:handle coderId="14953972"/> made the jump to division I after capturing second place and <tc-webtag:handle coderId="22690008" /> took third place.</p>

<H1> 
The Problems 
</H1>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8730&amp;rd=11127" name="8730">VariableSpeedLimit</a></b> 
</font> 
<A href="Javascript:openProblemRating(8730)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520289" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      725 / 808 (89.73%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      675 / 725 (93.10%)
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>dilse</b> for 249.68 points (1 mins 1 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      197.16 (for 675 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Consider each time unit in turn. At each step, we either reach the end of the journey or we continue driving for the whole time unit. If the remaining distance we have to travel at the beginning of time unit <tt>i</tt> is <tt>d<sub>i</sub></tt>, and this value is less than <tt><b>speedLimit</b>[i]</tt>, then the extra amount of time it'll take us to complete our journey is <tt>d<sub>i</sub> / <b>speedLimit</b>[i]</tt>. Otherwise we move on to the next time unit with <tt>d<sub>i+1</sub> = d<sub>i</sub> - speedLimit[i]</tt>. Because the minimum speed limit is 1, we never have to simulate this for more than 100,000 time steps. C++ code follows.
</p>
<pre>
int N = speedLimit.size();
for (int i=0; ;i++)
  if (journeyLength &lt; speedLimit[i % N])
    return (double) journeyLength / speedLimit[i % N] + i;
  else
    journeyLength -= speedLimit[i % N];
</pre>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8607&amp;rd=11127" name="8607">InstantRunoffVoting</a></b> 
</font> 
<A href="Javascript:openProblemRating(8607)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520289" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      390 / 808 (48.27%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      220 / 390 (56.41%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>guilherme</b> for 465.37 points (7 mins 52 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      280.85 (for 220 correct submissions) 
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
      559 / 581 (96.21%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      467 / 559 (83.54%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>JongMan</b> for 247.58 points (2 mins 48 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      193.91 (for 467 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
To those coders who got a sense of d&#233;j&#224; vu reading this problem I apologise! It was found after the match to be identical to <a href="/stat?c=problem_statement&pm=2244">InstantRunoff</a> from SRM 175. We do make an effort to check that problems are original, at least within TopCoder, but unfortunately this one slipped through the net.
</p>
<p>
The problem itself is pure simulation, so simply follow the instructions carefully to get to the right answer. Many competitors misread the statement and took the voter preferences to be the candidates in the order that the voters will vote for them on subsequent rounds. This is not the case, because a voter will vote for the candidate highest on his list who has not yet been eliminated, regardless of what round he is voting in. Another common mistake was to be careless with the terminating condition, leading to an infinite loop after all candidates have been eliminated.
</p>
<p>
For an example solution, see <tc-webtag:handle coderId="15179224" context="algorithm"/>'s <a href="/stat?c=problem_solution&cr=15179224&rd=11127&pm=8607">code</a>.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8391&amp;rd=11127" name="8391">PowerAdapters</a></b> 
</font> 
<A href="Javascript:openProblemRating(8391)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520289" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      30 / 808 (3.71%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      0 / 30 (0.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      No correct submissions 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      No correct submissions 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem elicited plenty of submissions, but unfortunately none were correct. A big hint here is the constaint on the number of elements in <b>itinerary</b>: whenever you see a constaint of 16 items or fewer in a problem where you are trying to build a set of something from some subsets, you should immediately consider solutions that are exponential in this dimension (i.e., the state-space is determined by some subset of these items). This problem is no exception to this rule.
</p>
<p>Firstly, however, let's rewrite the problem in graph theory language. The countries clearly form the vertices of a graph and the adapters become directed edges. Jane can charge her laptop in any country if the vertex representing that country is reachable from the vertex representing <b>homeCountry</b>. The question therefore becomes, "what is the minimum number of edges that we must add to the graph to ensure that every vertex in <b>itinerary</b> is reachable from <b>homeCountry</b>?"
</p>
<p>The next key point is to realise that we might as well only add edges that originate at <b>homeCountry</b>. To see this, consider that if we want to make a vertex connected, we can ether add an edge to it directly from <b>homeCountry</b> or we can add an edge from some other connected vertex. Either way, the effect is exactly the same, so we might as well only consider connecting vertices directly to <b>homeCountry</b>. This reduces the number of new edges that we need to consider to <tt>N</tt>, where <tt>N</tt> is the total number of countries (be careful, there can be up to 117 different countries).
</p>
<p>We now need to work out what is the minimum number of these edges we should add, in order that all the vertices in <b>itinerary</b> are reachable. This is a fairly standard dynamic programming problem: the state-space we need to explore is <tt>f(i, S)</tt>, where we have already considered all the edges up to index <tt>i</tt> and <tt>S</tt> is the subset of vertices in <b>itinerary</b> that are already reachable from <b>homeCountry</b>. We can then consider either adding the current edge with index <tt>i</tt>, or omitting it to get the recursion relation. If <tt>T</tt> is the subset of additional vertices that would be connected due to edge <tt>i</tt> then:</p>
<tt>f(i+1, S&cup;T) = min( f(i, S&cup;T), f(i, S) + 1 )</tt>
<p>In order to work out what additional vertices are connected due to an edge, it helps to pre-calculate the transitive closure. C++ code follows.</p>
<pre>class PowerAdapters{
public:
  int needed(vector &lt;string&gt; adapters, 
             vector &lt;string&gt; itinerary, string homeCountry){
    map &lt;string,int&gt; names;
    
    // First we need to translate from names to indexes
    // Assign each name we come across a unique index
    int N = 0;
    names[homeCountry] = N++;
    for (int i=0;i&lt;itinerary.size();i++)
      if (names.find(itinerary[i]) == names.end())
        names[itinerary[i]] = N++;
    for (int i=0;i&lt;adapters.size();i++){
      stringstream ss(adapters[i]);
      string s1,s2;
      ss &gt;&gt; s1 &gt;&gt; s2;
      if (names.find(s1) == names.end())
        names[s1] = N++;
      if (names.find(s2) == names.end())
        names[s2] = N++;
    }
    
    // Now work out what is connected to what
    vector &lt;vector &lt;int&gt; &gt; conn(N,vector &lt;int&gt; (N));
    for (int i=0;i&lt;adapters.size();i++){
      stringstream ss(adapters[i]);
      string s1,s2;
      ss &gt;&gt; s1 &gt;&gt; s2;
      conn[names[s1]][names[s2]] = true;
    }
    for (int i=0;i&lt;N;i++)
      conn[i][i] = true;
      
    // Transitive closure
    for (int k = 0;k &lt; N;k++)
      for (int i = 0;i &lt; N;i++)
        for (int j = 0;j &lt; N;j++)
          conn[i][j] |= conn[i][k] &amp;&amp; conn[k][j];
          
    int M = itinerary.size();

    // Now work out which countries cover which countries in itinerary
    vector &lt;int&gt; cover(N);
    for (int i = 0;i &lt; N;i++)
      for (int j = 0;j &lt; M;j++)
        if (conn[i][names[itinerary[j]]])
          cover[i] |= (1&lt;&lt;j);
          
    int mem[1 &lt;&lt; M];
    
    // initialize mem to large values
    memset(mem,0x1f,sizeof(mem)); 
    
    // At the start we are already covering all the vertices connected from 
    // homeCountry
    mem[cover[0]] = 0;
    
    // Run our dynamic program
    for (int i=0;i&lt;N;i++)
      for (int j=(1 &lt;&lt; M) - 1;j&gt;=0;j--)
        mem[j | cover[i]] = min(mem[j | cover[i]], mem[j] + 1);
        
    return mem[(1 &lt;&lt; M) -1];
  }
};</pre>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8496&amp;rd=11127" name="8496">NSegmentDisplay</a></b> 
</font> 
<A href="Javascript:openProblemRating(8496)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520289" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      265 / 581 (45.61%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      194 / 265 (73.21%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 456.18 points (8 mins 58 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      267.34 (for 194 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<html>
<p>This problem required clear thinking, but actually isn't very difficult once you see what to  do. The definitions in the notes section are key here:</p>
<ul>
<li>A segment can be considered definitely to be working, if no configuration exists, consistent with the described behavior, in which it is broken.</li>
<li>A segment can be considered definitely to be broken, if no configuration exists, consistent with the described behavior, in which it is working.</li>
<li>If neither of the above conditions is true for a segment, there is no way of being sure  whether it is broken or not.</li>
</ul>
<p>Consider any configuration of working/broken segments and ask, "Is it possible to check whether such a configuration is valid?" This is quite easy, since once we know whether  the segments are broken or not, we can simulate the display for every symbol in the allowed set and work  out what it would show. So we just check that each of the patterns corresponds to some  symbol. If there is a pattern that cannot be generated using the allowed symbols, then the  configuration cannot be consistent with the data given. Using arrays, this check takes O(N*M*S)  time, where N is the number of symbols, P is the number of patterns and S is the number of  segments. Using 64-bit bitmasks, this can be reduced to O(N*M).</p>
<pre>boolean valid(String [] symbols, String [] patterns,boolean [] working){
  // For each pattern, try to find a symbol that is consistent
  for (int i=0;i&lt;patterns.length;i++){
    boolean found = false;
    for (int j=0;j&lt;symbols.length;j++){
      boolean valid = true;
      for (int k=0;k&lt;patterns[i].length();k++)
        if ( (working[k] &amp;&amp; symbols[j].charAt(k) == '1' ? '1' : '0') != patterns[i].charAt(k))
          valid = false;
      if (valid) found = true;
    }
    if (!found) return false;
  }
  return true;
}</pre>
<p>A first-pass attempt might therefore be to consider every possible configuration, check for  validity, and keep track of which segments have only appeared as working, which have only  appeared as broken, and which have appeared in both states. Unfortunately, with 50 segments,  there are 2<sup>50</sup> possible configurations, so such an approach is bound to time out.</p>
<p>We therefore need to prune our search somewhat. Consider a segment that has been observed in  an on-state in some pattern. There is no way that this segment could be consistent with the  behaviour, "...remains permanently in an off state...", so it has to be working. Any other  segment <i>does</i> remain permanently in an off-state, so there is no way that its behaviour  could be inconsistent with it being broken. We can therefore check that a consistent solution  exists: create a configuration where each segment which has been observed on is working, every  other segment is broken and check this for validity. If this is not a valid configuration, we can  return "INCONSISTENT" straight away, because changing any of the working segments to broken  would only ensure that the configuration is inconsistent, and changing any of the broken segments  to working cannot make a difference, since these segments have never been observed in an on-state anyway.</p>
<p>
We can then check whether any of the broken segments could be working. For each one in turn,  set it to working and check whether the configuration is still valid. If so, then we have found  configurations where it is both broken and working, so by the initial definitions, its state is  uncertain. Otherwise, no change to the other segments will ever make this configuration valid, so again by the definitions, this segment must be broken.
</p>
<pre>
public String brokenSegments(String [] symbols, String [] patterns){
  
  boolean [] working = new boolean[symbols[0].length()];

  // Find all of the segments that have been observed in an on-state
  for (int i=0;i&lt;patterns.length;i++)
    for (int j=0;j&lt;patterns[i].length();j++)
      if (patterns[i].charAt(j) == '1')
        working[j] = true;

  if (!valid(symbols,patterns,working)) return "INCONSISTENT";

  String ret = "";
  
  // Now try each segment in turn and set it to working
  for (int i=0;i&lt;working.length;i++){
    if (working[i])
      ret += 'Y';
    else {
      working[i] = true;
      if (valid(symbols,patterns,working)) ret += '?';
      else ret += 'N';
      working[i] = false;
    }
  }

  return ret;
}
</pre>
<p>The solution here is much simpler to implement using bitmasks, because the set operations  union, intersection and complement correspond to the boolean operators '|', '&amp;', and '~' and it  is therefore possible to consider all segments simultaneously. After parsing the input strings into bitmasks, the code becomes:</p>
<pre>
  long long working = 0;
    
  for (int i=0;i&lt;p.size();i++)
    working |= p[i];
      
  long long broken = 0;
  
  for (int i=0;i&lt;p.size();i++){
    long long newBroken = (1LL &lt;&lt; N) - 1LL;
    bool consistent = false;
    for (int j=0;j&lt;s.size();j++)
      if ((s[j] &amp; working) == p[i]){
        consistent = true;
        newBroken &= s[j] &amp; ~p[i];
      }
    broken |= newBroken;
    if (!consistent) return "INCONSISTENT";
  }
  
  string ret(N,' ');
  for (int i=0;i&lt;N;i++)
    ret[i] = working &amp; (1LL&lt;&lt;i) ? 
                        'Y' : broken &amp; (1LL&lt;&lt;i) ? 'N' : '?';

  return ret;
</pre> 
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8495&amp;rd=11127" name="8495">AirlineInternet</a></b> 
</font> 
<A href="Javascript:openProblemRating(8495)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520289" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      8 / 581 (1.38%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      3 / 8 (37.50%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>yuhch123</b> for 512.96 points (35 mins 52 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      476.86 (for 3 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
While not theoretically too challenging, this problem required a lot of care to code properly. Many coders will have quickly seen that the way to proceed is by binary search on the transceiver radius <tt>R</tt>. This function is obviously monotonic, so as long as we can answer the question, "given a value of <tt>R</tt>, are the aircraft connected to the Internet for all time?" we will be able to converge to the correct answer.</p>
<p>We therefore need to consider how the connectivity of the graph changes in time. For time <tt>T &lt; 0</tt>, we know that all the aircraft are sitting at airports, so they are all a distance of 0 from an airport, so must be connected. As time gets large, all the aircraft land, so they are once again connected. Now we just need to determine whether there is a period of time in between where some aircraft becomes disconnected. The way to do this is by realising that if the graph connectivity has changed, then it means that some aircraft has either come into range or gone out of range of an airport or another aircraft. So right at the point in time where the connectivity changes, the distance between two aircraft, or an aircraft and an airport must be exactly <tt>R</tt>. These "events" mark the only points in time where the graph connectivity can change. We can therefore divide time up into ranges by these points and we only need to due a single connectivity check in each range, since the connectivity must be constant for the duration of the range. Doing a connectivity check at a known point in time with a known transceiver radius is simple using either depth-first search or breadth-first search.
</p>
<p>The time complexity of the above method is O(N<sup>4</sup> * log(M)), where N is the number of aircraft and M represents the initial binary search limits. With the low constraints (N = 20), this runs in time reasonably comfortably. For an example of this method but using Floyd's algorithm for the connectivity check, see <tc-webtag:handle coderId="14768757" context="algorithm"/>'s <a href="/stat?c=problem_solution&rd=11127&rm=&cr=14768757&pm=8495">code</a>.</p>


<br /><br />


<div class="authorPhoto">
    <img src="/i/m/StevieT_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="21911760" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
  </jsp:include>
   </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
