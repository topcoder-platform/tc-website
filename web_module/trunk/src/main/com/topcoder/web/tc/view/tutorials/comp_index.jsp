<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Component Tutorials</title>

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
                <jsp:param name="level2" value="comp_tutorials"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="tutorBody">
            
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="comp_tut"/>
            <jsp:param name="title" value="&#160;"/>
        </jsp:include>

<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>

			<table width="100%" border="0" cellspacing="0" cellpadding="3">
				<tr valign=top><td class="bodyText"><b>Author</b></td><td class="bodyText" nowrap=nowrap width="100%"><b>Title</b></td></tr>
				<tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="152342" context="design"/>
					</td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&d1=dev&d2=support&d3=desTutorial"><strong>Design Tutorial</strong></a>
				</td></tr>
				<tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="251989" context="development"/>
					</td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&d1=dev&d2=support&d3=devTutorial"><strong>Development Tutorial</strong></a>
				</td></tr>
				<tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="296145" context="development"/>
					</td><td class="bodyText" nowrap=nowrap><a href="/index?t=features&c=feat_031703"><strong>Component-Based Development: TopCoder Style</strong></a>
				</td></tr>
				<tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="119676" context="design"/>
					</td><td class="bodyText" nowrap=nowrap><strong>The Design Process:</strong><br>
					&#160;-&#160;<a href="/tc?module=Static&d1=features&d2=040405"><strong>Section 1: some advice</strong></a><br>
					&#160;-&#160;<a href="/tc?module=Static&d1=features&d2=041105"><strong>Section 2: appeals phase don'ts</strong></a><br>
					&#160;-&#160;<a href="/tc?module=Static&d1=features&d2=041905"><strong>Section 3: appeals phase do's</strong></a><br>
					&#160;-&#160;<a href="/tc?module=Static&d1=features&d2=042505"><strong>Section 4: the wrap up</strong></a><br>
				</td></tr>
				<tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="119676" context="design"/>
					</td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&d1=tutorials&d2=singletons"><strong>Singleton Pattern</strong></a>
				</td></tr>
			</table>
        </div>
        <p><br></p>
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
