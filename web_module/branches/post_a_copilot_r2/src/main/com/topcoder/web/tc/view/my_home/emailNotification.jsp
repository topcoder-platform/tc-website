<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="com.topcoder.web.tc.Constants"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
    <title>TopCoder - My TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <script type="text/javascript">
        function submit() {
            var myForm = document.f;
            myForm.submit();
        }
    </script>
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
                <jsp:param name="node" value="my_topcoder"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="maxWidthBody" align="left">
            
                <jsp:include page="../page_title.jsp" >
                    <jsp:param name="image" value="my_tc"/>
                    <jsp:param name="title" value="Email Notification Preferences"/>
                </jsp:include>

                <p align="center">
                    Please check off all the email categories that you'd like to receive
                </p>

            <form name="f" action="${sessionInfo.servletPath}" method="post">
            <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="EditNotifications"/>
                <table cellpadding="0" cellspacing="0" class="stat" width="100%">
                <tbody>                
                    <tr>
                        <td class="title">
                            Email Notification Preferences
                        </td>
                    </tr>
                    <c:set var="oldNotificationType" value="null"/>
                    <c:forEach var="notification" items="${notifications}">
                        <c:if test="${notification.type != oldNotificationType}">
                            <tr>
                                <td class="header">
                                    ${notification.type.description}
                                </td>
                            </tr>
                        </c:if>
                        <tr class="light">
                            <td class="value" style="border: none;">
                                <tc-webtag:chkBox name="notif_${notification.id}"/> ${notification.name}
                            </td>
                        </tr>
                        <c:set var="oldNotificationType" value="${notification.type}"/>                   
                    </c:forEach>
                </tbody>
                </table>
                </form>        

                <div align="center">
                    <table cellpadding="0" cellspacing="0" style="margin: 20px;">
                    <tbody>
                        <tr>
                            <td>
                                <a href="javascript:submit()" class="button" style="width: 60px; margin-right: 10px;">Save</a>
                            </td>
                            <td>
                                <a href="/tc?module=MyHome" class="button" style="width: 60px;">Cancel</a>
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
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
</tbody>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>