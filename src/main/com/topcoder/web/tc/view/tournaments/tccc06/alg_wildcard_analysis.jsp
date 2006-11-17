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
Introduction by <tc-webtag:handle coderId="159052" context="algorithm"/>
<br><br>
Introduction: Coming soon...

<h1>AlmostBipartiteMatching</h1>
by <tc-webtag:handle coderId="15231364" context="algorithm"/>
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

<h1>AlmostBipartiteMatching</h1>
Coming soon...
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
