<%--
  - Author: vangavroche, Standlove, TCSASSEMBLER
  - Version: 1.0 (Release Assembly - TopCoder Password Recovery Revamp v1.0)
  - Copyright (C) 2010 - 2013 TopCoder Inc., All Rights Reserved.
  -
  - Updated this to be unified for both primary and secondary
  - Version: 1.1 (Release Assembly - TopCoder Email Management Update v1.0)
  -
  - Description: This page will notify user the mail is added/updated successfully.
--%>
<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="com.topcoder.web.tc.Constants,  com.topcoder.web.common.model.Preference"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="group" value="<%= request.getAttribute("group") %>"/>
<c:set value="<%=Preference.MEMBER_CONTACT_PREFERENCE_ID%>" var="memberContactPrefId"/>
<c:set value="<%=Preference.SHOW_EARNINGS_PREFERENCE_ID%>" var="showEarningsPrefId"/>

<html>

<head>
    <title>TopCoder - My TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="script.jsp" />
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <style type="text/css">
    td.value{
    border-top: 0px;
    }
    </style>  
</head>

<body>

<jsp:include page="top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="includes/global_left.jsp">
                <jsp:param name="node" value="my_topcoder"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="maxWidthBody" align="left">
            
                <jsp:include page="page_title.jsp" >
                    <jsp:param name="image" value="my_tc"/>
                    <jsp:param name="title" value="${sessionScope.title}"/>
                </jsp:include>

               	<p>
              		Your email has been ${sessionScope.action}.
                </p>     

                 <div align="center">
                    <table cellpadding="0" cellspacing="0" style="margin: 20px;">
                    <tbody>
                        <tr>
                            <td>
                                <a href="/tc?module=MyHome" class="button" style="width: 100px;">Back to My Home</a>
                            </td>
                        </tr>
                    </tbody>
                    </table>
                </div>  

            </div>
        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
</tbody>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>