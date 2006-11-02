<%@  page language="java"  %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
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

<div align="center">
    <img src="/i/sponsor/bannerAOLMashups.png" alt="AOL Mashups" />
</div>

This skill-based Contest is designed to encourage the development and use of technologies and provides an opportunity for members of the TopCoder Community to create a description of an original application utilizing the specified technology. TopCoder, Inc. and Contest sponsors invite participants to submit entries for prizes to be awarded by the Contest judging team in accordance with these Terms and Conditions.  Each Contest may have a Contest sponsor, which will be identified in the contest description information.
<br><br>
The Contest is designed to encourage the development and use of the specified technologies. Participation in the Contest is limited to registered members of the TopCoder Community. The Contest is not open to non-members or to the general public. Those wishing to learn more about the TopCoder Community can find more information at: <A href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>">http://studio.topcoder.com</A> 
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