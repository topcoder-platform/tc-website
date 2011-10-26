<%@  page language="java"  %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - AOL Mashups</title>

<jsp:include page="/script.jsp"/>
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
            <jsp:param name="node" value="m_competitions"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<%-- Center Column Begins --%>
<td width="100%" align="center" class="bodyColumn">

<div class="fixedWidthBody" style="margin-bottom: 40px;">

<%--
--%>
<div align="center">
    <img src="/i/sponsor/bannerAOLMashups.png" alt="AOL Mashups" />
</div>

Are you a Web 2.0 visionary? Can you differentiate the cool-but-useless from what is genuinely, utterly awesome? We want your ideas. 
<br><br>
You've probably said "If I were running AOL, I would do things this way." Here's your chance!
<br><br>
As you may know, AOL has opened up its APIs for the development community to play with. Now it's taking things one step further, and challenging people to come up with the next killer mashup. Just show us how you would combine one or more of AOL's open APIs with something else - another open API, an RSS feed, or whatever - and you could win a cash prize, and some serious respect.
<br><br>
The first Mashup contest is now live at <A href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewActiveContests">the Studio</A>. In it, you're asked to combine AOL's new WebAIM API - which allows instant messaging to be integrated into a web page or application - with something else, to create an interesting and useful mashup. Full contest rules and guidelines are available at the Studio contests page.
<br><br>
Questions? Discuss them in <A href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/forums">the Studio forum</A>.
<br><br>
<span class="subtitle">How does it work?</span><br>
Once the contest starts, you'll have 10 days to lay out your vision for the mashup. Of course, 10 days is way too short to actually build the application, so all we're asking for is a visual representation of your idea  - you should show us how it looks, what it does, and why it's cool, but you don't have to worry about the underlying backend or actually integrating APIs. 
<br><br>
Winning entries will be featured on the TopCoder Studio site and on AOL's developer network at <A href="<tc-webtag:linkTracking link="http://developer.aol.com" refer="tc_mashups_page"/>" target="_blank">http://dev.aol.com</A> - and will receive a cash prize.

</div>

        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
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