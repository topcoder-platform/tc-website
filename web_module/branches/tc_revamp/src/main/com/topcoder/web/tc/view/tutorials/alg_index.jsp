<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Algorithm Tutorials</title>


<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="algo_tutorials"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="tutorBody">

        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="alg_tut"/>
            <jsp:param name="title" value="&#160;"/>
        </jsp:include>

         <table width="100%" border="0" cellspacing="0" cellpadding="3">
            <tr valign=top><td class="bodyText"><strong>Author</strong></td><td class="bodyText" nowrap=nowrap width="100%"><strong>Title</strong></td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="159052" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=tutorials&amp;d2=importance_of_algorithms"><strong>The Importance of Algorithms</strong></a>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="275071" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=tutorials&amp;d2=dissectProblem"><strong>How To Dissect a TopCoder Problem Statement</strong></a>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="7305703" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=tutorials&amp;d2=findSolution"><strong>How to Find a Solution</strong></a>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="282560" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><strong>Planning an Approach to a TopCoder Problem:</strong><br>
               &#160;-&#160;<a href="/tc?module=Static&amp;d1=tutorials&amp;d2=planApproach1"><strong>Section 1</strong></a><br>
               &#160;-&#160;<a href="/tc?module=Static&amp;d1=tutorials&amp;d2=planApproach2"><strong>Section 2</strong></a><br>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="276230" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=tutorials&amp;d2=math_for_topcoders"><strong>Mathematics for TopCoders</strong></a>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="159052" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><strong>Geometry Concepts:</strong><br>
               &#160;-&#160;<a href="/tc?module=Static&amp;d1=tutorials&amp;d2=geometry1"><strong>Section 1: Basic Concepts</strong></a><br>
               &#160;-&#160;<a href="/tc?module=Static&amp;d1=tutorials&amp;d2=geometry2"><strong>Section 2: Line Intersection and its Applications</strong></a><br>
               &#160;-&#160;<a href="/tc?module=Static&amp;d1=tutorials&amp;d2=geometry3"><strong>Section 3: Using Geometry in TopCoder Problems</strong></a><br>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="268851" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><strong>Introduction to Graphs and Their Data Structures:</strong><br>
               &#160;-&#160;<a href="/tc?module=Static&amp;d1=tutorials&amp;d2=graphsDataStrucs1"><strong>Section 1: Recognizing and Representing a Graph</strong></a><br>
               &#160;-&#160;<a href="/tc?module=Static&amp;d1=tutorials&amp;d2=graphsDataStrucs2"><strong>Section 2: Searching a Graph</strong></a><br>
               &#160;-&#160;<a href="/tc?module=Static&amp;d1=tutorials&amp;d2=graphsDataStrucs3"><strong>Section 3: Finding the Best Path through a Graph</strong></a>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="7371063" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=tutorials&amp;d2=greedyAlg"><strong>Greedy is Good</strong></a>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="7305703" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=tutorials&amp;d2=dynProg"><strong>Dynamic Programming:</strong> From novice to advanced</a>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="8357090" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><strong>Computational Complexity</a><br />
               &#160;-&#160;<a href="/tc?module=Static&amp;d1=tutorials&amp;d2=complexity1"><strong>Section 1</strong></a><br>
               &#160;-&#160;<a href="/tc?module=Static&amp;d1=tutorials&amp;d2=complexity2"><strong>Section 2</strong></a><br>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="7465390" context="algorithm"/> & <tc-webtag:handle coderId="294328" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=tutorials&amp;d2=regularExpressions"><strong>Using Regular Expressions</strong></a>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="7371063" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=tutorials&amp;d2=probabilities"><strong>Understanding Probabilities</strong></a>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="10407399" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=tutorials&amp;d2=dataStructures"><strong>Data Structures</strong></a>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="7545675" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=tutorials&amp;d2=java_1_5"><strong>New Features of Java 1.5</strong></a>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="10407399" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=tutorials&amp;d2=sorting"><strong>Sorting</strong></a>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="8593420" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><strong>Maximum Flow</a><br />
               &#160;-&#160;<a href="/tc?module=Static&amp;d1=tutorials&amp;d2=maxFlow"><strong>Section 1</strong></a><br>
               &#160;-&#160;<a href="/tc?module=Static&amp;d1=tutorials&amp;d2=maxFlow2"><strong>Section 2</strong></a><br>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="8357090" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><strong>Representation of Integers and Reals</a><br />
               &#160;-&#160;<a href="/tc?module=Static&amp;d1=tutorials&amp;d2=integersReals"><strong>Section 1</strong></a><br>
               &#160;-&#160;<a href="/tc?module=Static&amp;d1=tutorials&amp;d2=integersReals2"><strong>Section 2</strong></a><br>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="7390467" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=tutorials&amp;d2=binarySearch"><strong>Binary Search</strong></a>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="251074" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=tutorials&amp;d2=bitManipulation"><strong>A bit of fun: fun with bits</strong></a>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="22065256" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=tutorials&amp;d2=lowestCommonAncestor"><strong>Range Minimum Query and Lowest Common Ancestor</strong></a>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="21749340" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=tutorials&amp;d2=standardTemplateLibrary"><strong>Power up C++ with the Standard Template Library: Part I</strong></a>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="21749340" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=tutorials&amp;d2=standardTemplateLibrary2"><strong>Power up C++ with the Standard Template Library: Part II: Advanced Uses</strong></a>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="269207" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=tutorials&amp;d2=primeNumbers"><strong>Prime Numbers, Factorization and Euler Function</strong></a>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="15498334" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=tutorials&amp;d2=recursionPt1"><strong>An Introduction to Recursion, Part 1</strong></a>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="15498334" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=tutorials&amp;d2=recursionPt2"><strong>An Introduction to Recursion, Part 2</strong></a>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="19841837" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=tutorials&amp;d2=binarySearchRedBlack"><strong>An Introduction to Binary Search and Red-Black Trees</strong></a>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="251074" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=tutorials&amp;d2=lineSweep"><strong>Line Sweep Algorithms</strong></a>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="22671469" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><strong>Minimum Cost Flow</a> <br />
               &#160;-&#160;<a href="/tc?module=Static&amp;d1=tutorials&amp;d2=minimumCostFlow1"><strong>Part 1 - Key Concepts</strong></a><br>
               &#160;-&#160;<a href="/tc?module=Static&amp;d1=tutorials&amp;d2=minimumCostFlow2"><strong>Part 2 - Algorithms</strong></a><br>
               &#160;-&#160;<a href="/tc?module=Static&amp;d1=tutorials&amp;d2=minimumCostFlow3"><strong>Part 3 - Applications</strong></a><br>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="13396848" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=tutorials&amp;d2=algorithmGames"><strong>Algorithm Games</strong></a>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="20394568" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=tutorials&amp;d2=binaryIndexedTrees"><strong>Binary Indexed Trees</strong></a>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="14926760" />
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=tutorials&amp;d2=stringSearching"><strong>Introduction to String Searching Algorithms</strong></a>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="22671469" />
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=tutorials&amp;d2=maxFlowRevisited"><strong>Maximum Flow: Augmenting Path Algorithms Comparison</strong></a>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="22654859" />
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=tutorials&amp;d2=combinatorics"><strong>Basics of combinatorics</strong></a>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="21500759" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=tutorials&amp;d2=maxflowPushRelabel"><strong>A New Approach to the Maximum Flow Problem</strong></a>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="13298470" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=tutorials&amp;d2=disjointDataStructure"><strong>Disjoint-set Data Structures</strong></a>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="10200923" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=tutorials&amp;d2=usingTries"><strong>Using Tries</strong></a>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="21684580" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=tutorials&amp;d2=mddb"><strong>An Introduction to Multidimensional Databases</strong></a>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="22630158" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><strong>The Best Questions for Would-be C++ Programmers</a> <br />
               &#160;-&#160;<a href="/tc?module=Static&amp;d1=tutorials&amp;d2=tenBestQuestions"><strong>Part 1</strong></a><br>
               &#160;-&#160;<a href="/tc?module=Static&amp;d1=tutorials&amp;d2=tenBestQuestions2"><strong>Part 2</strong></a><br>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="22419265" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=tutorials&amp;d2=primalityTesting"><strong>Primality Testing : Non-deterministic Algorithms</strong></a>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="22654859" context="algorithm"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=tutorials&amp;d2=hungarianAlgorithm"><strong>Assignment Problem and Hungarian Algorithm</strong></a>
            </td></tr>
           <tr valign="top">
               <td class="bodyText" colspan="2"><br><a href="/tc?module=Static&amp;d1=help&amp;d2=writeForTC">Write algorithm tutorials for TopCoder.com</a></td>
            </tr>
         </table>
        </div>
        <p><br></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="defaults"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
