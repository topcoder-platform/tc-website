<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>TopCoder :: Contact Us</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="contact_us"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidth700Body">

            <div>
            <%--
      <jsp:include page="/page_title.jsp">
          <jsp:param name="image" value="contact_us"/>
          <jsp:param name="title" value="&nbsp;"/>
      </jsp:include>
      --%>
                <p align="center"><a href="/tc?module=Static&amp;d1=about&amp;d2=contactus"><img src="/i/about/hdr_contactus.png" alt="Contact Us" /></a></p>
                <p style="margin-left:10px;">Thank you for your interest in TopCoder. We will be contacting you shortly.</p>
                <p style="margin-left:10px;">For more information on TopCoder Direct, please click <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/">here</a> or to learn more about TopCoder Studio, click <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/">here</a>.</p>
                <p style="margin-left:10px;">The Team at TopCoder</p>
                
            </div>


            </div>
        </td>
<%-- Center Column Ends --%>
       
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
       
    </tr>
</tbody>
</table>

<jsp:include page="../foot.jsp" />

<script type="text/javascript" src="http://cetrk.com/pages/scripts/0004/0536.js"> </script>

</body>

</html>