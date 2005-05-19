<%@ page import="com.topcoder.web.common.BaseServlet,
         		 com.topcoder.web.forums.ForumConstants,
         		 com.jivesoftware.forum.stats.ViewCountManager"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<html>
<head>
<title>TopCoder</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="/css/roundTables.css"/>
<link type="text/css" rel="stylesheet" href="/css/stats.css"/>
<jsp:include page="script.jsp" />

</head>

<body>

<jsp:include page="top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">

<!-- Left Column Begins-->
      <td width="180">
         <jsp:include page="includes/global_left.jsp">
            <jsp:param name="level1" value=""/>
            <jsp:param name="level2" value=""/>
         </jsp:include>
      </td>
<!-- Left Column Ends -->


<!-- Center Column Begins -->
        <td width="100%" class="rtBody">

            <jsp:include page="page_title.jsp" >
                <jsp:param name="image" value="round_table"/>
                <jsp:param name="title" value="Message Preview"/>
            </jsp:include>

<span class="bodySubtitle">Message Preview</span><br>
<table cellpadding="0" cellspacing="0" class="rtTable">
   <tr>
      <td class="rtHeader" colspan="2"><a name=56640>Feb 11, 2005 at 5:20 PM EST | Re: SRM 230 - Pascal1s triangle
      (response to <A href="/" class="rtLinkNew">post</A> by <A href="/" class="coderTextYellow">ilham</A>)
      </a>
      </td>
   </tr>
   <tr>
      <td class="rtPosterCell" rowspan="2"><div class="rtPosterSpacer">
      <img src="/i/m/misof_big.jpg" width="55" height="61" border="0" class="rtPhoto" /><br>
      <span class="bodyText"><a href="/stat?c=member_profile&cr=8357090" class="coderTextRed">myHandle</a></span><br><A href="/">18 posts</A></div></td>
      <td class="rtTextCell100">I did know it... and to be honest, this was my first idea on how to solve the problem. <br><br>Luckily, it was immediately followed by the second one: "Hey, this is the 500, not the 1000! Stop it riiiight there and look for a brute force solution that involves less thinking."<br><br>Still, I do think that this is a possible way of solving the problem -- and most probably the time will be only (poly)logarithmic in the row number if implemented well.<br><br>Ah well, maybe I'll just submit it as a 1000 sometimes :-P</td>
   </tr>
</table>

<span class="bodySubtitle">Edit Message</span><br>
<table cellpadding="0" cellspacing="0" class="rtTable">
   <tr>
      <td class="rtHeader" colspan="2"><a name=56640>Feb 11, 2005 at 5:20 PM EST | Re: SRM 230 - Pascal1s triangle
      (response to <A href="/" class="rtLinkNew">post</A> by <A href="/" class="coderTextYellow">ilham</A>)
      </a>
      </td>
   </tr>
   <tr>
      <td class="rtPosterCell" rowspan="2"><div class="rtPosterSpacer">
      <span class="bodyText"><a href="/stat?c=member_profile&cr=144400" class="coderTextRed">tomek</a></span><br><A href="/">204 posts</A></div>
      </td>
      <td class="rtTextCell100">
         <b>Subject:</b><br><input type="text" name="subject" size="60" value="Re: SRM 230 - Pascal1s triangle" ><br><br>

<b>Body:</b><br><TEXTAREA COLS="60" ROWS="15" NAME="body" >I did know it... and to be honest, this was my first idea on how to solve the problem.

Luckily, it was immediately followed by the second one: "Hey, this is the 500, not the 1000! Stop it riiiight there and look for a brute force solution that involves less thinking."

Still, I do think that this is a possible way of solving the problem -- and most probably the time will be only (poly)logarithmic in the row number if implemented well.

Ah well, maybe I'll just submit it as a 1000 sometimes :-P</TEXTAREA>
      </td>
   </tr>
   <tr>
      <td class="rtFooter"><A href=""><img src="/i/roundTables/post.gif" class="rtButton" alt="" /></A><A href=""><img src="/i/roundTables/preview.gif" class="rtButton" alt="" /></A></td>
   </tr>
</table>

</td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>