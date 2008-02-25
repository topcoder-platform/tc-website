<%-- REDIRECT PAGE --%>
<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.WebConstants"%>

<html>

<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../../script.jsp" />
    <jsp:include page="../../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <% String node = request.getParameter(WebConstants.LEFT_NAV_KEY);
        if (node!=null&&!(node.equals("arch_uml_tool")||node.equals("des_uml_tool")||node.equals("dev_uml_tool"))) {
            node = null;
        }
        if(node==null){
            node = "des_uml_tool";
        }
    %>
</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="node" value="<%=node==null?"":node%>"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">

                <div style="margin-bottom: 10px; border-bottom: 1px solid #999999;">
                    <img src="/i/development/umltool/banner.jpg" alt="TopCoder UML Tool" />
                </div>

                <p align="center">
                    We've moved this page to <a href="/wiki/display/tc/TopCoder+UML+Tool">the wiki</a>.
                </p>
                
            </div>
        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
</tbody>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>