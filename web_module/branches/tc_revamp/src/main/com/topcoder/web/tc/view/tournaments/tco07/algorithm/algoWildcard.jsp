<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="content">

        <jsp:include page="../header.jsp" />

        <table cellpadding="0" cellspacing="0" id="spacer">
        <tbody>
            <tr>
                <td id="navSpacer">

                    <jsp:include page="../nav.jsp" >
                    <jsp:param name="tabLev1" value="algorithm"/>
                    <jsp:param name="tabLev2" value="summary"/>
                    <jsp:param name="tabLev3" value="wildcard"/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">

                                     <h1><span>JongMan wins the Wildcard round!</span></h1>

                        <img src="/i/m/Olexiy_big2.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
<A HREF="http://forums.topcoder.com/?module=ThreadList&amp;forumID=514957">Discuss this match</A><br>
Thursday, June 28, 2007<br>
Introduction by <a href="/tc?module=MemberProfile&amp;cr=303644&amp;tab=alg" class="coderTextRed">Olexiy</a>

<img style="float:right; width:200px; 350px; padding-left:10px;" src="/i/tournament/tco07/shotR4.jpg">
<br><br>
<p>
<p>
For more minute-by-minute analysis, check out <tc-webtag:handle coderId="10574855" context="algorithm"/>'s latest <a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=blogs&d4=Petr08">blog</a>.
</p>
<p>
<tc-webtag:handle coderId="7446789" context="algorithm"/> and <tc-webtag:handle coderId="144400" context="algorithm"/> advance to the finals. They'll join 
<tc-webtag:handle coderId="309453" context="algorithm"/>,
<tc-webtag:handle coderId="8355516" context="algorithm"/>, 
<tc-webtag:handle coderId="21822659" context="algorithm"/>, 
<tc-webtag:handle coderId="14886245" context="algorithm"/>, 
<tc-webtag:handle coderId="251074" context="algorithm"/> and 
<tc-webtag:handle coderId="21971539" context="algorithm"/> in the finals tomorrow, starting at 1:30 PDT.
Congratulations and good luck to the finalists!
</p>
	

<p><span style="font-size:14px; font-weight:bold;">CauchyProduct</span></p>
<p>by <tc-webtag:handle coderId="251317" context="algorithm"/></p>

<p>Here we must compute the coefficients of the required power series.  The problem statement gives the
formula for each coefficient in terms of previously computed coefficients.  The real work here is the
rational arithmetic, which consists of fraction manipulations, and GCD for reducing.  Fortunately,
the constraints allow everything to be done with 64-bit types, which removes many potential headaches.</p>


<p><span style="font-size:14px; font-weight:bold;">PaperThickness</span></p>
<p>by <tc-webtag:handle coderId="251317" context="algorithm"/></p>

<p>Suppose we perform a sequence of folds.  At each stage, the entire state is described by a partition
of the paper into a grid of rectangles containing the respective thicknesses.  If we only make folds
along vertical axes, the paper is partitioned into a collection of vertical strips of varying
thicknesses.  Analogously, if we make only folds along horizontal axes, the paper will be
partitioned into horizontal strips.  If we make both kinds of folds, we can look at each kind in
isolation.  Each strip will have an associated thickness.  The rectangle formed by the
intersection of a vertical and horizontal strip will have thickness equal to the product of the
thicknesses of the strips.  This can be proved by induction on the number of folds made.</p>

<p>Knowing that the vertical and horizontal folds can be treated in isolation, we now solve the one
dimensional problem (ie., assume we only had folds along vertical axes).  At each step in the
process we will maintain a range object.  The range object will store a sequence of integers
representing the edges of the paper and the strip boundaries.  In addition, it will store
thicknesses of the associated strips.  Each time a (valid) fold is made, the coordinate of the fold axis
becomes an element of the sequence of integers in the range object.  Looping over the old range elements, we
construct a new range object accommodating the changes associated with the fold (reflecting
coordinates across the folding axis as needed).  This can be done in
time linear in the size of the old range object.  In addition, we also update the associated
thicknesses.  If we process all of the folds in this manner, we will have a final range object.  The
highest thickness is what we desire.  The return value is the product of the highest thicknesses for
the vertical and horizontal ranges.</p>


<p><span style="font-size:14px; font-weight:bold;">SkipList</span></p>
<p>by <tc-webtag:handle coderId="251317" context="algorithm"/></p>

<p>We will solve this problem using memoization/dynamic programming.  The key question to ask when each
integer is added to the list is whether it should also be added to the cache in order to achieve the optimal
cost.  The locality constraint allows us to consider only the previous 10 (actually, this is
overkill) decisions we have made when deciding on the current element.  This is because the number
of remaining queries is at least halved at each add so, for a particular element, after 10 adds no
more queries will occur.  With knowledge of the previous 10 decisions, we can quickly compute the
cost trade-off of adding the current integer to the cache:</p>
<ol>
<li> Cost of adding the current element to the cache: Previously added integers that have not been added to the
cache will incur an extra penalty of 1 on queries occurring after the current element is in the
cache.  Previously added integers which were added to the cache will not incur this cost.  All
elements added after the current will incur an added penalty of 1 for queries.  To speed up these
computations, the number of each kind of query occurring after an add can be precomputed prior to
the memoized recursion.
</li>
<li> Cost of not adding the current element to the cache: Each query for the current element will
have to go through the actual list, and thus we must add the cost of searching through the actual
list for each future query.  Note that since each element we do add to the cache accounts for all
future associated penalties, we don't have to worry about any cache penalties in this case.</li>
</ol>
Summing up what has been done, we recurse over the list of added elements using a 10 bit mask of the
previous 10 decisions, and the current position in the list as our memoization key.  To speed up our
computations at each stage of the recursion, we use the following precomputed structures:
<ul>
<li>queries[n][prevInd] : stores the number of queries for the kth added integer following
the addition of the nth added integer.  Here k = n - prevInd.</li>
<li>afterqueries[n] : stores the number of queries for integers added after the nth integer </li>
</ul>
<p>This allows us to quickly compute all penalties associated with a cache add.</p>


<br /><br />
                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="../footer.jsp" />
    </div>
</div>

</body>

</html>
