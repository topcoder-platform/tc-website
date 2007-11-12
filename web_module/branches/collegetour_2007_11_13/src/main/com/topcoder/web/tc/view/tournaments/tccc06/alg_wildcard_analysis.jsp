<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="algorithm"/>
<jsp:param name="tabLev2" value="summary"/>
<jsp:param name="tabLev3" value="wildcard"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
<div style="float: right;">
<p align="center"><span class="bodyText" align="center"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=photos">See more photos!</a></span></p>
<img src="/i/tournament/tccc06/onsitePhotos/shotWildcard.jpg" alt="" class="photoFrameBig" /><br>
</div>

<p>
<span class="bigTitle">Eryx wins the WildCard</span>
<br><br>
<img src="/i/m/lbackstrom_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
<tc-webtag:forumLink forumID="506184" message="Discuss this match" /><br>

Thursday, November 16, 2006<br>
Introduction by <a href="/tc?module=MemberProfile&amp;cr=159052&tab=alg" class="coderTextYellow">lbackstrom</a>

<p>The wildcard round proved particularly difficult, even as wildcard
rounds go.  Though the easy problem was straightforward if you saw the
trick to it (and <tc-webtag:handle coderId="260835" context="algorithm"/> scored over 248 points on it), the other two
problems were fiendishly difficult.  Despite their best efforts, none
of the competitors were able to successfully solve either of them, and
only one of them even had a solution that made it as far as the system
test phase.  In the end, it came down to challenges, and <tc-webtag:handle coderId="8355516" context="algorithm"/> and
<tc-webtag:handle coderId="7459080" context="algorithm"/> had the most.</p>
<p>Congratulations, and good luck to all the
finalists!</p>

<h1>AlmostBipartiteMatching</h1>
by <a href="/tc?module=MemberProfile&amp;cr=15231364&tab=alg" class="coderTextRed">soul-net</a>
<p>This one was my gift for theory lovers. Solving this problem was all about thinking
and, if you wanted a lot of points, maybe having faith instead of proofs. Since I
have no rush for points now, I'll give you a formal proof. As complicated as the
problem statement may sound, carefully looking at the shape of the graphs lead to
an incredibly short solution (especially for an onsite!). Anyway, let's start from
the beginning:</p>

<p>We have two <a href="http://en.wikipedia.org/wiki/Simple_path" target="_blank">simple paths</a>
and some edges that connect them. Let's call the total number
of nodes of the graph <tt>n</tt>. Of course, <tt>n</tt> = <b>nA</b> + <b>nB</b>. The maximum
possible matching is then floor(<tt>n</tt>/2) (having all nodes matched, or all but one if <tt>n</tt> is odd, is the best we can do). If a simple path has an even number of nodes <tt>k</tt>,
all its members can be perfectly matched (0 with 1, 2 with 3, ... and <tt>k</tt>-2 with

<tt>k</tt>-1). If <tt>k</tt> is odd, this strategy leaves one node alone. Then, if <b>nA</b>
or <b>nB</b> is even, we can obtain a maximum matching. If both are even, we have perfect
matching, and if one is even and one is odd, we have a matching of all nodes but one, which
is as good as it can get.</p>

<p>Now, we only need to take care of the case in which <b>nA</b> and <b>nB</b> are odd. If we
use the previous strategy in this case, we leave two nodes unmatched -- we have a way of
obtaining the second best possible match, so we need to check if a perfect match can
be achieved. If it can, then we return <tt>n</tt>/2; otherwise, we return <tt>n</tt>/2-1.</p>

<p>Let's suppose there is in fact a perfect match. Let's call red nodes to the nodes in A
matched to a member of A and to the nodes in B matched to a member of B; and blue nodes
to the rest (matched to a member of the other set). Let's call red edges to edges connecting
red nodes and blue edges to edges connecting blue nodes. Edges not used in the matching are
gray. Both A and B have an odd number of elements, and so they have one more node with even
index than nodes with odd index. All red edges have one endpoint with an odd index and one
endpoint with an even index (because of the shape of the graph); therefore, half of the red
nodes have an odd index and the other half an even index. Since overall there are
<tt>n</tt>/2-1 nodex with odd index and <tt>n</tt>/2+1 nodex with even index, the difference
of 2 nodes is in the blue set. Finally, since less than half the set of blue nodes has an
odd index, there is an edge that has both endpoints with even index.</p>

<p>Using an edge with both endpoints with even indices we can easily construct a perfect matching,
since the removal of those endpoints partitions each simple path in zero, one or two simple paths
of even size (you can check this claim on your own as a homework) and in each of those paths,
the strategy described at the beginning can be used to achieve a perfect match.</p>

<p>Altogether, checking whether the most perfect match exists is checking if any of <b>nA</b> or
<b>nB</b> is even OR if there is an edge with both endpoints in even indices. If that happens,
we return <tt>n</tt>/2, otherwise, we return <tt>n</tt>/2-1 (remember that an "almost perfect" match
is always possible). Java code follows:</p>

<pre>
int n=nA+nB;
if (nA%2==0||nB%2==0) return n/2;
for(int i=0;i&lt;edgesA.length;++i) if (edgesA[i]%2==0 && edgesB[i]%2==0) return n/2;
return n/2-1;
</pre>


<h1>SingleElimination</h1>
by <tc-webtag:handle coderId="159052" context="algorithm"/>
<p>The medium problem caused serious headaches for both the competitors and the TC staff.  In particular, the problem statement listed claimed that inputs of size 16 were allowed, but the system only allowed the competitors to test inputs up to size 8.  In fact, none of the TC solutions were quite fast enough to work with size 16 inputs, pointing to how hard it would be to solve with 16.</p>

<p>When the contradiction was discovered, the decision was made that the best thing to do was to allow inputs of size 16, since that was what the problem statement said.  It was felt that it wouldn't be fair to a competitor who spent time trying to solve the size 16 version if the limit was set at 8, and the only way to see the bug was to try to test with a size 16 input, which a competitor would likely not do until he thought he had solved the problem.  Of course, the whole situation was very unfortunate, as it caused the problem to be all but unsolvable, and it had adverse effects for some of the competitors.  In the end, no one, including the testers, had a solution that was quite fast enough, but TC was able to give the reference solution a little extra time so that the challenge phase could go forward and system tests could be run with size 16 inputs.  Below is an explanation of the solution to the problem, which works with size 8 inputs:</p>

<p>It is not necessary to test all 8! possible orders of teams to find the best solution, because many orders are equivalent. For example, swapping team 1 and team 2, or teams 1-4 with teams 5-8 will not affect the outcome.</p>

<p>First, note that with 4 teams, there are only three orders worth considering: { 0, 1, 2, 3 }, { 0, 2, 1, 3 }, and { 0, 3, 1, 2 }. All other orders are equivalent to one of these three.</p>

<p>To enumerate all interesting orders of 8 teams, we can start by selecting 3 of the remaining 7 teams to join the team we care about in the top half of the order. For each of the 35 (7 choose 3) possibilities, we can compute our team's best probability of winning by considering each of the three orders for these four teams. Call the greatest of these probabilities P<sub>1</sub>.</p>

<p>Next, we consider each of the 3 unique orders for the bottom 4 teams in the order, and compute the probability of <i>each</i> of these teams advancing to the final match. (These probabilities should sum to 1.0, of course.) Given these lists, we can compute our team's probability of winning the final match for each of the three orders. Call the greatest of these probabilities P<sub>2</sub>.</p>

<p>The maximum of P<sub>1</sub> * P<sub>2</sub> for each of the 35 possibilities is the solution to this problem for the N=8 case.</p>


<h1>Regulars</h1>
by <tc-webtag:handle coderId="159052" context="algorithm"/>

<p>A regular expression can be converted into a <a
href="http://en.wikipedia.org/wiki/Deterministic_finite_state_machine" target="_blank">DFA</a>,
and it is easiest to think about this problem in those terms.  Once we
have a DFA, we just need to write a simple dynamic program the
computes the number of accepted strings of a particular length that
start in a particular state.  Since our DFA will have two outgoing
edges from every node, the number of accepted strings of length
<tt>k</tt> is simply the sum of the number of strings from those two
successor states, but of length <tt>k-1</tt>.</p>  

<p>Unfortunately, converting into a DFA is non-trivial.  Luckily, we
don't have to actually do an explicit conversion.  Instead, we can do
things implicitly by considering that after some sequence of zeros and
ones, we have advanced some part of the way through the regular
expression.  Of course, there are different places we could be in the
regular expression, depending on what choices we make, but there is a
well-defined set of locations, which is not hard to compute.  For
example, if the current set is <tt>S</tt>, and I append a '1', it is easy to
compute the set of possible next positions.  For each position <tt>p</tt> in <tt>S</tt>,
if <tt>p</tt> corresponds to a "1*" then I can stay at <tt>p</tt>, or advance.  If <tt>p</tt>
    corresponds to a '1' not followed by a '*', I must advance.  Of
    course, if <tt>p</tt> corresponds to something like "1*1*" I might advance
    all the way to the end, but this is all easy to compute.<br/>
    </p>

<p>The trick is to observe that each set of possible states, <tt>S</tt>,
corresponds to a state in the DFA that would represent the expression.
Furthermore, because the regular expression language being used is so
simple, the number of possible sets of states remains relatively
small.  This allows us to write a dynamic program that takes a set <tt>S</tt>
and a length as its state space:</p>
<pre>
    int[] ch;
    boolean[] b;
    int ptr;
    HashMap&lt;String, Long&gt; hm = new HashMap();
    long go(long pos, int left){
        long ret = 0;
        if((pos &amp; (1l&lt;&lt;ptr))&gt;0)ret = 1;
        if(left == 0){
            return ret;
        }
        String key = pos+" "+left;
        if(hm.containsKey(key))return hm.get(key);
        long zer = 0, one = 0;
        for(int i = 0; i&lt;ptr; i++){
            if(((1l&lt;&lt;i)&amp;pos)&gt;0){
                if(ch[i] == 0){
                    zer |= 1l&lt;&lt;(i+1);
                    if(b[i])
                        zer |= 1l&lt;&lt;i;
                }else {
                    one |= 1l&lt;&lt;(i+1);
                    if(b[i])
                        one |= 1l&lt;&lt;i;
                }
            }
        }
        for(int i = 0; i&lt;ptr; i++){
            if(b[i] &amp;&amp; ((1l &lt;&lt; i) &amp; one)&gt;0){
                one |= 1l&lt;&lt;(i+1);
            }
            if(b[i] &amp;&amp; ((1l &lt;&lt; i) &amp; zer)&gt;0){
                zer |= 1l&lt;&lt;(i+1);
            }
        }
        ret += go(one,left-1) + go(zer,left-1);
        hm.put(key,ret);
        return ret;
    }
    public long stringCt(String regex, int maxLen){
        ch = new int[regex.length()];
        b = new boolean[ch.length];
        for(int i = 0; i&lt;regex.length(); i++){
            if(regex.charAt(i) == '*'){
                b[ptr-1] = true;
            }else{
                ch[ptr++] = regex.charAt(i)-'0';
            }
        }
        long pos = 1;
        for(int i = 0; i&lt;ptr; i++){
            if(b[i])pos |= 1l&lt;&lt;(i+1);
            else break;
        }
        return go(pos,maxLen);
    }
</pre>
        </div>
      </td>
        
         
<!-- Right Column-->
        <td width="170" align="right">
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />

</body>

</html>
