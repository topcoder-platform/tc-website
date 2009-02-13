<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - Algorithm Match Archive</title>

<jsp:include page="../script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
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
                <jsp:param name="node" value="algo_match_archive"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD class="statTableSpacer" width="100%" valign="top">

<jsp:include page="/page_title.jsp">
  <jsp:param name="image" value="statistics_w"/>
  <jsp:param name="title" value="Algorithm Match Archive"/>
</jsp:include>

<span class="bodySubtitle">Algorithm Statistics > Match Archive</span>

<div class="pagingBox">
<a href="" class="bcLink">&lt;&lt; prev</a>
| <a href="" class="bcLink">next &gt;&gt;</a>
</div>

<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
<tr>
<td>
<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
   <tr><td class="tableTitle" colspan="9">Algorithm Match Archive</td></tr>
   <tr>
      <td CLASS="tableHeader"><a href="" class="statLink">Match</a></td>
      <td CLASS="tableHeader" align="center"><a href="" class="statLink">Date</a></td>
      <td CLASS="tableHeader"><a href="" class="statLink">Winner</a></td>
      <td CLASS="tableHeader" align="right"><a href="" class="statLink">Competitors</a></td>
      <td CLASS="tableHeader" align="right"><a href="" class="statLink">Submissions</a></td>
      <td CLASS="tableHeader" align="right"><a href="" class="statLink">Avg. Submissions</a></td>
      <td CLASS="tableHeader" align="right"><a href="" class="statLink">Challenges</a></td>
      <td CLASS="tableHeader" align="right"><a href="" class="statLink">Avg. Challenges</a></td>
      <td CLASS="tableHeader"><a href="" class="statLink">&#160;</a></td>
   </tr>
   <%boolean even = true;%>
   <tr>
      <td class="<%=even?"statLt":"statDk"%>"><A href="" class="statLink">SRM</A></TD>
      <td class="<%=even?"statLt":"statDk"%>" align="center">01.01.2006</A></TD>
      <td class="<%=even?"statLt":"statDk"%>"><tc-webtag:handle coderId="144400" context="algorithm"/></A></TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">500</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">1234</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">2.13</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">115</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">0.67</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="center"><tc-webtag:forumLink forumID="505881" message="discuss" /></TD>
   </tr>
   <%even=!even;%>
   <tr>
      <td class="<%=even?"statLt":"statDk"%>"><A href="" class="statLink">SRM</A></TD>
      <td class="<%=even?"statLt":"statDk"%>" align="center">01.01.2006</A></TD>
      <td class="<%=even?"statLt":"statDk"%>"><tc-webtag:handle coderId="144400" context="algorithm"/></A></TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">500</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">1234</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">2.13</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">115</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">0.67</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="center"><tc-webtag:forumLink forumID="505881" message="discuss" /></TD>
   </tr>
   <%even=!even;%>
   <tr>
      <td class="<%=even?"statLt":"statDk"%>"><A href="" class="statLink">SRM</A></TD>
      <td class="<%=even?"statLt":"statDk"%>" align="center">01.01.2006</A></TD>
      <td class="<%=even?"statLt":"statDk"%>"><tc-webtag:handle coderId="144400" context="algorithm"/></A></TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">500</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">1234</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">2.13</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">115</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">0.67</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="center"><tc-webtag:forumLink forumID="505881" message="discuss" /></TD>
   </tr>
   <%even=!even;%>
   <tr>
      <td class="<%=even?"statLt":"statDk"%>"><A href="" class="statLink">SRM</A></TD>
      <td class="<%=even?"statLt":"statDk"%>" align="center">01.01.2006</A></TD>
      <td class="<%=even?"statLt":"statDk"%>"><tc-webtag:handle coderId="144400" context="algorithm"/></A></TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">500</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">1234</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">2.13</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">115</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">0.67</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="center"><tc-webtag:forumLink forumID="505881" message="discuss" /></TD>
   </tr>
   <%even=!even;%>
   <tr>
      <td class="<%=even?"statLt":"statDk"%>"><A href="" class="statLink">SRM</A></TD>
      <td class="<%=even?"statLt":"statDk"%>" align="center">01.01.2006</A></TD>
      <td class="<%=even?"statLt":"statDk"%>"><tc-webtag:handle coderId="144400" context="algorithm"/></A></TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">500</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">1234</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">2.13</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">115</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">0.67</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="center"><tc-webtag:forumLink forumID="505881" message="discuss" /></TD>
   </tr>
   <%even=!even;%>
   <tr>
      <td class="<%=even?"statLt":"statDk"%>"><A href="" class="statLink">SRM</A></TD>
      <td class="<%=even?"statLt":"statDk"%>" align="center">01.01.2006</A></TD>
      <td class="<%=even?"statLt":"statDk"%>"><tc-webtag:handle coderId="144400" context="algorithm"/></A></TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">500</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">1234</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">2.13</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">115</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">0.67</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="center"><tc-webtag:forumLink forumID="505881" message="discuss" /></TD>
   </tr>
   <%even=!even;%>
   <tr>
      <td class="<%=even?"statLt":"statDk"%>"><A href="" class="statLink">SRM</A></TD>
      <td class="<%=even?"statLt":"statDk"%>" align="center">01.01.2006</A></TD>
      <td class="<%=even?"statLt":"statDk"%>"><tc-webtag:handle coderId="144400" context="algorithm"/></A></TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">500</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">1234</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">2.13</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">115</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">0.67</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="center"><tc-webtag:forumLink forumID="505881" message="discuss" /></TD>
   </tr>
   <%even=!even;%>
   <tr>
      <td class="<%=even?"statLt":"statDk"%>"><A href="" class="statLink">SRM</A></TD>
      <td class="<%=even?"statLt":"statDk"%>" align="center">01.01.2006</A></TD>
      <td class="<%=even?"statLt":"statDk"%>"><tc-webtag:handle coderId="144400" context="algorithm"/></A></TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">500</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">1234</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">2.13</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">115</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">0.67</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="center"><tc-webtag:forumLink forumID="505881" message="discuss" /></TD>
   </tr>
   <%even=!even;%>
   <tr>
      <td class="<%=even?"statLt":"statDk"%>"><A href="" class="statLink">SRM</A></TD>
      <td class="<%=even?"statLt":"statDk"%>" align="center">01.01.2006</A></TD>
      <td class="<%=even?"statLt":"statDk"%>"><tc-webtag:handle coderId="144400" context="algorithm"/></A></TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">500</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">1234</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">2.13</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">115</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">0.67</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="center"><tc-webtag:forumLink forumID="505881" message="discuss" /></TD>
   </tr>
   <%even=!even;%>
   <tr>
      <td class="<%=even?"statLt":"statDk"%>"><A href="" class="statLink">SRM</A></TD>
      <td class="<%=even?"statLt":"statDk"%>" align="center">01.01.2006</A></TD>
      <td class="<%=even?"statLt":"statDk"%>"><tc-webtag:handle coderId="144400" context="algorithm"/></A></TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">500</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">1234</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">2.13</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">115</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">0.67</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="center"><tc-webtag:forumLink forumID="505881" message="discuss" /></TD>
   </tr>
   <%even=!even;%>
   <tr>
      <td class="<%=even?"statLt":"statDk"%>"><A href="" class="statLink">SRM</A></TD>
      <td class="<%=even?"statLt":"statDk"%>" align="center">01.01.2006</A></TD>
      <td class="<%=even?"statLt":"statDk"%>"><tc-webtag:handle coderId="144400" context="algorithm"/></A></TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">500</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">1234</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">2.13</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">115</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">0.67</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="center"><tc-webtag:forumLink forumID="505881" message="discuss" /></TD>
   </tr>
   <%even=!even;%>
   <tr>
      <td class="<%=even?"statLt":"statDk"%>"><A href="" class="statLink">SRM</A></TD>
      <td class="<%=even?"statLt":"statDk"%>" align="center">01.01.2006</A></TD>
      <td class="<%=even?"statLt":"statDk"%>"><tc-webtag:handle coderId="144400" context="algorithm"/></A></TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">500</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">1234</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">2.13</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">115</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">0.67</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="center"><tc-webtag:forumLink forumID="505881" message="discuss" /></TD>
   </tr>
   <%even=!even;%>
   <tr>
      <td class="<%=even?"statLt":"statDk"%>"><A href="" class="statLink">SRM</A></TD>
      <td class="<%=even?"statLt":"statDk"%>" align="center">01.01.2006</A></TD>
      <td class="<%=even?"statLt":"statDk"%>"><tc-webtag:handle coderId="144400" context="algorithm"/></A></TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">500</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">1234</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">2.13</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">115</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">0.67</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="center"><tc-webtag:forumLink forumID="505881" message="discuss" /></TD>
   </tr>
   <%even=!even;%>
   <tr>
      <td class="<%=even?"statLt":"statDk"%>"><A href="" class="statLink">SRM</A></TD>
      <td class="<%=even?"statLt":"statDk"%>" align="center">01.01.2006</A></TD>
      <td class="<%=even?"statLt":"statDk"%>"><tc-webtag:handle coderId="144400" context="algorithm"/></A></TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">500</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">1234</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">2.13</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">115</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">0.67</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="center"><tc-webtag:forumLink forumID="505881" message="discuss" /></TD>
   </tr>
   <%even=!even;%>
   <tr>
      <td class="<%=even?"statLt":"statDk"%>"><A href="" class="statLink">SRM</A></TD>
      <td class="<%=even?"statLt":"statDk"%>" align="center">01.01.2006</A></TD>
      <td class="<%=even?"statLt":"statDk"%>"><tc-webtag:handle coderId="144400" context="algorithm"/></A></TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">500</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">1234</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">2.13</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">115</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="right">0.67</TD>
      <td class="<%=even?"statLt":"statDk"%>" align="center"><tc-webtag:forumLink forumID="505881" message="discuss" /></TD>
   </tr>
   <%even=!even;%>
</table>
</td>
</tr>
</table>

<div class="pagingBox">
<a href="" class="bcLink">&lt;&lt; prev</a>
| <a href="" class="bcLink">next &gt;&gt;</a>
</div>

<br><br>

</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="default"/>
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
