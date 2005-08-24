<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Member Card</title>

<jsp:include page="../script.jsp" />
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

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
                <jsp:param name="level1" value="my_home"/>
                <jsp:param name="level2" value="card"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td class="cardCell" WIDTH="100%" align="center">

         <div class="cardBody">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="cards"/>
            <jsp:param name="title" value="Downloads"/>
        </jsp:include>

         <p>You can download any of the badges listed below in various sizes.  Feel free to place them on your personal website or on your resume.</p>

        <table cellpadding="0" cellspacing="15" border="0" class="bodyText" align="center">
            <tr>
                <td valign="middle" align="right" width="5%">1.</td>
                <td valign="middle" align="center" width="70%"><img src="/i/card/badge1_300x100.gif" border="0"/></td>
                <td valign="middle" align="left" width="25%"><a href="/i/card/badge1_150x50.gif">150px X 50px</a><br/><a href="/i/card/badge1_300x100.gif">300px X 100px</a><br/><a href="/i/card/badge1_450x150.gif">450px X 150px</a></td>
            </tr>
            <tr>
                <td class="bodyText" valign="middle" align="right">2.</td>
                <td class="bodyText" valign="middle" align="center"><img src="/i/card/badge2_300x100.gif" border="0"/></td>
                <td class="bodyText" valign="middle" align="left"><a href="/i/card/badge2_150x50.gif">150px X 50px</a><br/><a href="/i/card/badge2_300x100.gif">300px X 100px</a><br/><a href="/i/card/badge2_450x150.gif">450px X 150px</a></td>
            </tr>
            <tr>
                <td class="bodyText" valign="middle" align="right">3.</td>
                <td class="bodyText" valign="middle" align="center"><img src="/i/card/badge3_300x40.gif" border="0"/></td>
                <td class="bodyText" valign="middle" align="left"><a href="/i/card/badge3_300x40.gif">300px X 40px</a></td>
            </tr>
            <tr>
                <td class="bodyText" valign="middle" align="right">4.</td>
                <td class="bodyText" valign="middle" align="center"><img src="/i/card/badge4_300x40.gif" border="0"/></td>
                <td class="bodyText" valign="middle" align="left"><a href="/i/card/badge4_300x40.gif">300px X 40px</a></td>
            </tr>
         </table>

         <p>If you would like your badge to link to more info about your TopCoder experience, please insert the following HTML:</p>
         <p align=center class="bodyText"><span class="cardCode">&lt;a href="http://<%=ApplicationServer.SERVER_NAME%>/card?cr=<jsp:getProperty name="sessionInfo" property="userId"/>"&gt;</span>(image / text goes here)<span class="cardCode">&lt;a&gt;</span></p>

         </div>
         <p><br/></p>
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
