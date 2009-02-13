<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder College Tour</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value=""/>
                <jsp:param name="level2" value=""/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="cardCell" width="100%" align="center">
<div class="myTCBody">

<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="college_tour"/>
<jsp:param name="title" value="Register"/>
</jsp:include>

      
<!-- college tour site subnav -->
      <p align="center"><A href="/tc?module=Static&d1=collegetour&d2=overview">Overview</A>&#160;&#160;|&#160;&#160;
      <A href="/tc?module=Static&d1=collegetour&d2=info">Instructions</A>&#160;&#160;|&#160;&#160;
      Register&#160;&#160;|&#160;&#160;
      <A href="/tc?module=Static&d1=collegetour&d2=registrants">Registrants</A>
      </p>
<!-- ends -->
      <br/><br/>
      
      <p>
      Register for the College Tour event at SCHOOL NAME <A href="#">here</a>
      </p>
</div>

</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
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
