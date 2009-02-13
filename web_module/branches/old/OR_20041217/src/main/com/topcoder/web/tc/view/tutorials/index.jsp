<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Algorithm Tutorials</title>

<jsp:include page="../../script.jsp" />

</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="level1" value="education"/>
                <jsp:param name="level2" value="alg_tutorials"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="tutorBody">
            
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="alg_tut"/>
            <jsp:param name="title" value=""/>
        </jsp:include>
            
			<table width="100%" border="0" cellspacing="0" cellpadding="3">
				<tr valign=top><td class="bodyText"><b>Author</b></td><td class="bodyText" nowrap=nowrap width="100%"><b>Title</b></td></tr>
				<tr valign=top><td class="bodyText">
					<a class="bodyText" href="/stat?c=member_profile&amp;cr=159052">lbackstrom</a>
					</td><td class="bodyText" nowrap=nowrap><a href="/index?t=features&c=feat_100404b"><strong>The Importance of Algorithms</strong></a>
				</td></tr>
				<tr valign=top><td class="bodyText">
					<a class="bodyText" href="/stat?c=member_profile&amp;cr=275071">antimatter</a>
					</td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&d1=tutorials&d2=dissectProblem"><strong>How To Dissect a TopCoder Problem Statement</strong></a>
				</td></tr>
				<tr valign=top><td class="bodyText">
					<a class="bodyText" href="/stat?c=member_profile&amp;cr=282560">leadhyena_inran</a>
					</td><td class="bodyText" nowrap=nowrap><strong>Planning an Approach to a TopCoder Problem:</strong><br/>
					&#160;-&#160;<a href="/tc?module=Static&d1=tutorials&d2=planApproach1"><strong>Section 1</strong></a><br/>
					&#160;-&#160;<a href="/tc?module=Static&d1=tutorials&d2=planApproach2"><strong>Section 2</strong></a><br/>
				</td></tr>
				<tr valign=top><td class="bodyText">
					<a class="bodyText" href="/stat?c=member_profile&amp;cr=159052">lbackstrom</a>
					</td><td class="bodyText" nowrap=nowrap><strong>Geometry Concepts:</strong><br/>
					&#160;-&#160;<a href="/tc?module=Static&d1=tutorials&d2=geometry1"><strong>Section 1: Basic Concepts</strong></a><br/>
					&#160;-&#160;<a href="/tc?module=Static&d1=tutorials&d2=geometry2"><strong>Section 2: Line Intersection and its Applications</strong></a><br/>
					&#160;-&#160;<a href="/tc?module=Static&d1=tutorials&d2=geometry3"><strong>Section 3: Using Geometry in TopCoder Problems</strong></a><br/>
				</td></tr>
				<tr valign=top><td class="bodyText">
					<a class="bodyText" href="/stat?c=member_profile&amp;cr=268851">gladius</a>
					</td><td class="bodyText" nowrap=nowrap><strong>Introduction to Graphs and Their Data Structures:</strong><br/>
					&#160;-&#160;<a href="/tc?module=Static&d1=tutorials&d2=graphsDataStrucs1"><strong>Section 1: Recognizing and Representing a Graph</strong></a><br/>
					&#160;-&#160;<a href="/tc?module=Static&d1=tutorials&d2=graphsDataStrucs2"><strong>Section 2: Searching a Graph</strong></a><br/>
					&#160;-&#160;<a href="/tc?module=Static&d1=tutorials&d2=graphsDataStrucs3"><strong>Section 3: Finding the Best Path through a Graph</strong></a>
				</td></tr>
				<tr valign=top><td class="bodyText">
					<a class="bodyText" href="/stat?c=member_profile&amp;cr=7305703">Dumitru</a>
					</td><td class="bodyText" nowrap=nowrap><a href="tc?module=Static&d1=tutorials&d2=dynProg"><strong>Dynamic Programming:</strong> From novice to advanced</a>
				</td></tr>
			</table>

        </div>
        <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
