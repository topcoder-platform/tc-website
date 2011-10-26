<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Marathon Match Tutorials</title>


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
            <jsp:param name="node" value="mm_tutorials"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="tutorBody">

        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="mm_tut"/>
            <jsp:param name="title" value="&#160;"/>
        </jsp:include>
        
The following articles apply specifically to Marathon Matches. You may also want to review our <a href="/tc?module=Static&d1=tutorials&d2=alg_index">Algorithm Tutorials</a> as well, though, since much of the information in that section can be applied to Marathon Matches.
<br /><br />        
        <table width="100%" border="0" cellspacing="0" cellpadding="3">
            <tr valign=top><td class="bodyText"><b>Author</b></td><td class="bodyText" nowrap=nowrap width="100%"><b>Title</b></td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="21464956" context="marathon"/>
               </td><td class="bodyText" nowrap=nowrap><strong>An Introduction to Marathon Matches </strong><br />
               &#160;-&#160;<a href="/tc?module=Static&d1=tutorials&d2=mmIntro"><strong>Part 1</strong></a><br />
               &#160;-&#160;<a href="/tc?module=Static&d1=tutorials&d2=mmIntro2"><strong>Part 2</strong></a><br />
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="10407399" context="marathon"/>
               </td><td class="bodyText" nowrap=nowrap><strong>Stepping up to a Marathon Match problem</strong><br />
               &#160;-&#160;<a href="/tc?module=Static&d1=tutorials&d2=mmProblems"><strong>Part 1</strong></a><br />
               &#160;-&#160;<a href="/tc?module=Static&d1=tutorials&d2=mmProblems2"><strong>Part 2</strong></a><br />
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="251074" context="marathon"/>
               </td><td class="bodyText" nowrap=nowrap><strong>Generating random distributions</strong><br />
               &#160;-&#160;<a href="/tc?module=Static&d1=tutorials&d2=randomNumbers"><strong>Part 1</strong></a><br />
               &#160;-&#160;<a href="/tc?module=Static&d1=tutorials&d2=randomNumbers2"><strong>Part 2</strong></a><br />
            </td></tr>
            <tr valign="top">
               <td class="bodyText" colspan="2"><br /><a href="/tc?module=Static&d1=help&d2=writeForTC">Write Marathon Match tutorials for TopCoder.com</a></td>
            </tr>
         </table>
        </div>
        <p><br /></p>
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
