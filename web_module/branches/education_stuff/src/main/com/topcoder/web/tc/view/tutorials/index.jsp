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
            
            <h2>Algorithm Tutorials</h2>
            
			<table width="100%" border="0" cellspacing="0" cellpadding="3">
				<tr valign=top><td class="bodyText"><b>Date</b></td><td class="bodyText"><b>Author</b></td><td class="bodyText" nowrap=nowrap width="100%"><b>Title</b></td></tr>
				<tr valign=top><td class="bodyText">10.26.04</td><td class="bodyText">lbackstrom</td><td class="bodyText" nowrap=nowrap><a href="/index?t=features&c=feat_100404b">The Importance of Algorithms</a></td></tr>
				<tr valign=top><td class="bodyText">10.26.04</td><td class="bodyText">gladius</td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&d1=tutorials&d2=graphsDataStrucs1">Introduction to Graphs and Their Data Structures:</A><br/>
					&#160;-&#160;<a href="/tc?module=Static&d1=tutorials&d2=graphsDataStrucs1">Section 1</a><br/>
					&#160;-&#160;<a href="/tc?module=Static&d1=tutorials&d2=graphsDataStrucs2">Section 2</a><br/>
					&#160;-&#160;<a href="/tc?module=Static&d1=tutorials&d2=graphsDataStrucs3">Section 3</a></td></tr>
				<tr valign=top><td class="bodyText">10.26.04</td><td class="bodyText">antimatter</td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&d1=tutorials&d2=dissectProblem">How To Dissect a TopCoder Problem Statement</a></td></tr>
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
