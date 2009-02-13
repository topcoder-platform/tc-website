<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>TopCoder</title>
<jsp:include page="../script.jsp" />
<jsp:include page="../style.jsp">
<jsp:param name="key" value="tc_stats"/>
</jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value="long"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<%-- Left Column Begins--%>
<td width="180">
         <jsp:include page="../includes/global_left.jsp">
            <jsp:param name="node" value="long_editorials"/>
         </jsp:include>
</td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">
<div align="center">
   <div class="bodyText" style="width: 100%; text-align: left;">

    <jsp:include page="../page_title.jsp">
        <jsp:param name="image" value="long_comps_topcoder"/>
        <jsp:param name="title" value="Match Editorials"/>
    </jsp:include>

<div style="float: right;" align="right"><A href="/longcontest/?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="506073" message="Discuss this match" />
</div>

<span class="bodySubtitle">Intel&#174; Multi-Threading Competition 7</span><br>07.19.2006 - 08.02.2006
<br><br>

<img src="/i/m/battyone_big.jpg" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/><br>
By&#160;<tc-webtag:handle coderId="7504863" /><br>
<span class="smallText"><em>TopCoder Member</em></span>

<br><br><br>
<span class="title"><A href="/longcontest/?module=ViewProblemStatement&compid=5982&rd=10087">CentrallyLocated</A></span>
<br><br>
<span class="subtitle">Introduction</span><br>
<p>
  In this contest we were faced with a problem that has been the subject of
  numerous research papers, known as the &quot;multi-source Weber problem&quot;
  in research circles, with the added twist of a scoring formula which required
  a fine balance between runtime and quality of the solution.
</P>
<p>
  <span class="bodySubtitle">Initial analysis </span>
</P>
<ul>
<li>After writing a testing framework that generates test cases and scores them
  per the problem description, I found that even a simplistic solution of
  placing the k suppliers at k random customers scored about 70, so with the
  best scores being around 80 it was clear that scores would be very close and
  the 1% penalty per second would make the runtime very important.
</li>
<li>As most competitors realized, since the customers were located around at
  most 100 city centers, it was only necessary to consider a small subset of
  them to get a solution which is almost as good but much faster than by using
  all of them, and given the generation procedure the first part of the input
  was as representative a set as any. My final submission used the first 20,000
  points.
</li>
<li>The optimal placement for a supplier (Weber point) minimizes a complex
  function and is hard to determine, but when considering the big picture, a
  good approximation is the center of gravity (centroid) of its customers.
  Another possibly better approximation was to generalize from 1 dimension
  (where the solution is just the median point), and use the point at the median
  of each sets of coordinates, but as that required recalculations as each
  customer is added or removed, I didn't end up using it.
</li>
<li>Starting from any configuration of suppliers and customers, that
  configuration can be improved by reallocating customers to their closest
  supplier, then moving the suppliers to the new Weber point or centroid of
  their customers, and repeating until stabilization. This method would often
  result in a high quality solution, since as a supplier moves towards an under
  served area, the customers which have alternate suppliers close to them cease
  being customers, allowing the supplier to move further towards the under
  served area, until an equilibrium is reached with good balance of suppliers
  and customers everywhere. However the resulting stable configuration would not
  necessarily be globally optimal, for example if we have two dense cities far
  from each other and have initially allocated 3 suppliers to one city and 1 to
  the other city, then that method would get close to an optimal placement of
  these suppliers in their cities, but never move towards a configuration with 2
  suppliers per city which would be better globally. Therefore, an important
  realization is that starting with a good initial configuration is a crucial
  first step towards a good final solution in complex cases.
</li>
</ul>
<p>
With this in mind, my solution ended up as follows:
</p>
<p>
  <span class="bodySubtitle">1. Initial configuration</span>
</P>
<p>
  A simple greedy method for an initial solution is to start out with each
  neighborhood of customers having their own supplier, then select the two
  nearby groups for which the added cost of using a common supplier is minimal,
  merge them with the common supplier placed at the centroid, and repeat until
  we are left with the desired number of suppliers. By keeping track of groups
  simply in the form of population count and centroid, and assuming the cost of
  moving a supplier used by a group is more or less proportional to the distance
  from the old to the new location, and to the number of customers, one arrives
  at the cost of merging 2 groups being proportional to
</P>
<P ALIGN=CENTER STYLE="MARGIN-BOTTOM: 0pt">
  <IMG HSPACE=8 NAME=Object1 SRC=/i/longcontest/match_editorials/intel_mtcs_7/ajd92kcbbbb_1ftxztw.gif>
</P>
<p>
  which is very easy to calculate. Initially I defined a neighborhood as any
  customers within a fixed distance, and later switched to a
  <A HREF=http://en.wikipedia.org/wiki/Kd-tree>kd-tree</A> classification which
  was more efficient and not sensitive to the number of cities and their
  deviations. There are many possible kd-trees implementations, mine
  incrementally stored points in leaf cells, and split cells across the median
  point of the largest dimension as soon as they contained more than 20 points,
  creating 2 children with 10 points each. I later tried to use the same kd-tree
  at finer levels to replace small groups of customers with their centroids
  weighted by their population, in order to use fewer points in later
  optimization steps, but as my initial (possibly buggy) implementations of this
  idea didn't seem to improve the results at all, I gave up on it.
</P>
<p>
  <span class="bodySubtitle">2. Centroid optimization</span>
</P>
<p>
  In this step I refined the initial solution from step 1 by breaking up groups
  and reassigning customers to their closest supplier, then moving the supplier
  to the new centroid, and repeating the process until an equilibrium was
  reached. Since the most time-consuming part of this process was finding out
  which supplier is the closest to a given customer, I maintained for each
  supplier a list of nearby suppliers sorted by increasing distance, and for
  each customer only checked the alternate suppliers which were less than twice
  farther away from the current supplier than the customer was. Also I only used
  5000 points in the beginning of this process, since the objective is to
  quickly get near a good solution and not to finely optimize yet. Later I found
  out this method is known as Lloyd's algorithm.
</P>
<p>
  During this process, I kept track of the current average distance and score
  including the time penalty, and stopped when the score decreased twice in a
  row.
</P>
<p>
  <span class="bodySubtitle">3. Weber point optimization</span>
</P>
<p>
  This is the hard part. While the centroid is a good first approximation, what
  it minimizes is the sum of squared distances, but we want to minimize the sum
  of distances. The sum of squared distances gives too much weight to far away
  customers and not enough to nearby ones, which can make a significant
  difference. For example, considering 2 customers at the same location and 1
  far away, the centroid is 1/3 of the way towards the last customer while the
  Weber point is exactly at the first 2 customers.
</P>
<p>
  The function to minimize
  is<IMG ALIGN=ABSMIDDLE HSPACE=8 NAME=Object2 SRC=/i/longcontest/match_editorials/intel_mtcs_7/ajd92kcbbbb_2d87ftn.gif >which
  is derivable everywhere except at
  the<IMG ALIGN=ABSMIDDLE HSPACE=8 NAME=Object3 SRC=/i/longcontest/match_editorials/intel_mtcs_7/ajd92kcbbbb_3gps8mf.gif >customer
  coordinates, which are singular points. To fix that I added a small constant
  to the squared distances and used
  <IMG ALIGN=ABSMIDDLE HSPACE=8 NAME=Object4 SRC=/i/longcontest/match_editorials/intel_mtcs_7/ajd92kcbbbb_4fgxn6n.gif >instead,
  for a function that behaves similarly almost everywhere but is more rounded
  near the customer coordinates. Note that the
  constant<IMG ALIGN=ABSMIDDLE HSPACE=8 NAME=Object5 SRC=/i/longcontest/match_editorials/intel_mtcs_7/ajd92kcbbbb_5gnj4sd.gif >can
  be viewed as constraining the solution point to be in a separate plane,
  parallel to the one containing the customers, at a
  distance<IMG ALIGN=ABSMIDDLE HSPACE=8 NAME=Object6 SRC=/i/longcontest/match_editorials/intel_mtcs_7/ajd92kcbbbb_6g6m85p.gif >away
  (this is easier to visualize by considering the 2-dimensional problem). Also
  when<IMG ALIGN=ABSMIDDLE  HSPACE=8 NAME=Object7 SRC=/i/longcontest/match_editorials/intel_mtcs_7/ajd92kcbbbb_7hhth5j.gif >becomes
  large the solution tends towards the centroid, while as it becomes small the
  solution tends towards the Weber point. One of my solutions used
  decreasing<IMG ALIGN=ABSMIDDLE HSPACE=8 NAME=Object8 SRC=/i/longcontest/match_editorials/intel_mtcs_7/ajd92kcbbbb_8dzmsdg.gif >values
  to progressively move from the centroid to the Weber point, but as I couldn't
  find a method for
  changing<IMG ALIGN=ABSMIDDLE HSPACE=8 NAME=Object9 SRC=/i/longcontest/match_editorials/intel_mtcs_7/ajd92kcbbbb_9dhqrgd.gif >which
  was both fast and always convergent I settled on a fixed
  small<IMG ALIGN=ABSMIDDLE HSPACE=8 NAME=Object10 SRC=/i/longcontest/match_editorials/intel_mtcs_7/ajd92kcbbbb_104cvj7z.gif >value.
</P>
<p>
  To minimize the sum of distances, which is a convex function, we need to find
  a point where its derivatives over x, y and z are all zero. If we write and
  simplify the equations for this we arrive to the conditions:
</P>
<P ALIGN=CENTER STYLE="MARGIN-BOTTOM: 0pt">
  <IMG ALIGN=ABSMIDDLE HSPACE=8 NAME=Object11 SRC=/i/longcontest/match_editorials/intel_mtcs_7/ajd92kcbbbb_11txtfw9.gif>
  <IMG ALIGN=ABSMIDDLE HSPACE=8 NAME=Object12 SRC=/i/longcontest/match_editorials/intel_mtcs_7/ajd92kcbbbb_12f752ns.gif>
  <IMG ALIGN=ABSMIDDLE HSPACE=8 NAME=Object13 SRC=/i/longcontest/match_editorials/intel_mtcs_7/ajd92kcbbbb_13mqqqdf.gif>
</P>
<p>
  with<IMG ALIGN=ABSMIDDLE HSPACE=8 NAME=Object14 SRC=/i/longcontest/match_editorials/intel_mtcs_7/ajd92kcbbbb_14f47x3p.gif >being
  the distance from the solution point to the i'th customer
  (with<IMG ALIGN=ABSMIDDLE HSPACE=8 NAME=Object15 SRC=/i/longcontest/match_editorials/intel_mtcs_7/ajd92kcbbbb_15dj8pmt.gif >added
  in to avoid divisions by zero). In other words, the Weber point is the average
  of the customers coordinates, weighted by the inverse of their distance to the
  Weber point. This suggests a simple iterative procedure to find that point,
  which is to start from anywhere and repeatedly replace the point by the
  average of the customers weighted by the inverse of their distances to the
  current point. As it turned out, this is a very classic algorithm which was
  first published by Hungarian mathematician Weiszfeld in 1937. Since at each
  step we are taking an average and merely adjusting the weights one could
  expect the method to converge very quickly. Unfortunately, while it converges,
  it does so rather slowly. A number of acceleration methods have been
  published, mostly around the idea of anticipating future steps given the
  current step direction, but I haven't found these were significantly better in
  my own experiments.
</P>
<p>
  Another iterative method I explored was extrapolating the derivatives as
  behaving linearly with respect to the second order derivatives at the current
  point, and solving a linear system of 3 equations to find the next point where
  all 3 derivatives were zeroed. This is Newton's method generalized to 3
  dimensions, and it turned out to work extremely well when the current point
  and the solution are in the same neighborhood and not near a singular point,
  and badly or not at all otherwise. The reason for this becomes clear if we
  consider the 1-dimensional problem and observe that the derivative is almost
  constant in-between customers and has sharp jumps at the customers, thus a
  linear extrapolation will overshoot the solution point and lead us far astray,
  unless we are already in the same interval as the solution.
</P>
<p>
  I tried a few other methods of moving the point in an opposite direction of
  the derivatives (gradient), but didn't find anything better than both the
  Weiszfeld and Newton methods. So, I ended up using the following hybrid
  algorithm:
</P>
<ul>
<li>calculate at each step both the next Newton point and the next Weiszfeld point, while keeping track of the distance to the closest customer</li>
<li>use the Newton point if the iteration is less than 1.5 times the distance to the closest customer</li>
<li>otherwise, use the next Weiszfeld point</li>
</ul>
<p>
  This worked quite well in most cases, since the Weiszfeld iterations are fast
  when we are far away from the solution, and the Newton iterations are precise
  when we are close, and only left the pathological cases of solutions at or
  near a customer being slow. These latter cases might have been solved better
  by a special test for whether the solution is at the closest customer, but I
  didn't get to that.
</P>
<p>
  Again, during this process I reassigned customers to their newly closest
  suppliers, and stopped when the score started to decline.
</P>
<p>
  <span class="bodySubtitle">4. Threading</span>
</P>
<p>
  As in previous contests, my threading simply consisted of running one instance
  of the same algorithm on each core, and returning the best solution found in
  the end. In my local testing I found that multiple instances gave moderate
  benefit beyond fixing the occasional very sub-optimal solution caused by bad
  luck in the initial clustering, for which 2 instances would usually have been
  enough, so it is likely that threading the algorithm itself to run on multiple
  cores to cut the runtime would have been more beneficial, for example 2
  instances using 4 cores each. My final submission's runtime was 100 to 200 ms
  on the large examples, which fortunately for me was fast enough to win.
</P>
   </div>
</div>
</td>

<%-- Right Column Begins --%>
<td width="170">
    <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>
</td>
<%-- Right Column Ends --%>

<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
</tr>
</table>

<jsp:include page="../foot.jsp"/>
</body>
</html>