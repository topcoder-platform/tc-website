<%--
  - Author: vangavroche, Standlove, TCSASSEMBLER
  - Version: 1.0 (Release Assembly - TopCoder Password Recovery Revamp v1.0)
  - Copyright (C) 2010 - 2013 TopCoder Inc., All Rights Reserved.
  -
  - Updated this to show both existing and editing second email
  - Version: 1.1 (Release Assembly - TopCoder Email Management Update v1.0)
  -
  - Description: The user use this page to input his/her second email address.
--%>
<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="com.topcoder.web.tc.Constants, com.topcoder.web.common.model.Preference"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="group" value="<%= request.getAttribute("group") %>"/>
<c:set value="<%=Preference.MEMBER_CONTACT_PREFERENCE_ID%>" var="memberContactPrefId"/>
<c:set value="<%=Preference.SHOW_EARNINGS_PREFERENCE_ID%>" var="showEarningsPrefId"/>

<%
  String secondEmail =  (String)session.getAttribute(Constants.SECOND_EMAIL_ADDRESS);  
  String secondEmailEdit =  (String)session.getAttribute(Constants.SECOND_EMAIL_ADDRESS_ON_EDIT);
  pageContext.setAttribute("secondEmail", secondEmail);
  pageContext.setAttribute("secondEmailEdit", secondEmailEdit);
  if(secondEmail == null){
    pageContext.setAttribute("title", "Add Secondary Email");
    pageContext.setAttribute("button", "Submit");
  }else{
    pageContext.setAttribute("title", "Update Secondary Email");
    pageContext.setAttribute("button", "Change");
  }
  if (secondEmailEdit == null) {
    secondEmailEdit = "";
  }
%>

<html>

<head>
    <title>TopCoder - My TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../script.jsp" />
    <script language="JavaScript" type="text/javascript" src="/js/passwordRecovery.js"></script>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>

    <style type="text/css">
    td.value{
    border-top: 0px;
    }
    </style>

    <script type="text/javascript">  
    $(document).ready(function () {
        var inputControl = $('#frm .addSecondEmail')[0];
        $('#frm').submit(function(){
            return validateAddSecondEmail( inputControl );
        });
    });
    </script>    
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="myHome">
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
                    <jsp:param name="title" value="${title}"/>
                </jsp:include>

            <form id="frm" action="${sessionInfo.servletPath}" method="post">
                <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AddSecondEmail"/>
                <c:if test="${secondEmail ne null }">
                    <tc-webtag:hiddenInput name="<%=Constants.SECOND_EMAIL_ADDRESS%>" value="${secondEmail}"/>
                </c:if>
                <table cellpadding="0" cellspacing="0" class="stat" width="100%">
                <tbody>
                    <tr>
                        <td class="title" colspan="2">${title}</td>
                    </tr>
                    <tr>
                        <td class="value" colspan="2">Providing a secondary email is optional, but will help us verify your account if you forget your password.</td>
                    </tr>
                        <c:if test="${secondEmail ne null }">
                            <tr class="light">
                                <td class="value" nowrap="nowrap" style="border: none;">
                                    <span style="display: block; padding-top: 4px;">Your secondary email : </span>
                                </td>
                                <td class="value" width="100%" style="border: none;">
                                    <span style="display: block; padding-top: 4px;"><c:out value="${secondEmail}"/></span>
                                </td>
                            </tr>
                        </c:if>
                        <tr class="dark">
                            <td class="value" nowrap="nowrap" style="border: none;">
                                <span style="display: block; padding-top: 4px;">Enter new secondary email:</span>
                            </td>
                            <td class="value" width="100%" style="border: none;">
                                <tc-webtag:textInput name="<%= Constants.EMAIL %>"  value="${secondEmailEdit}" size="50" maxlength="<%=com.topcoder.web.reg.Constants.MAX_EMAIL_LENGTH%>" styleClass="addSecondEmail" />
                                <tc-webtag:errorIterator id="err" name="<%=Constants.ERROR_INFO %>">
                                    <span class="bigRed"><%=err%></span>
                                </tc-webtag:errorIterator>
                            </td>
                        </tr>
                </tbody>
                </table>

                </form>

                <%
                    Boolean isNewStyle = request.getAttribute("isNewStyle") == null ? false : (Boolean) request.getAttribute("isNewStyle");
                %>

                <% if(isNewStyle) { %>
                    <div>
                        <table class="controls">
                            <tbody>
                            <tr>
                                <td>
                                    <a class="btn" href="javascript:;" onclick="$('#frm').submit();">${button}</a>
                                </td>
                                <td>
                                    <a class="btn btnBlue" href="/tc?module=MyHome">Cancel</a>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                <% } else { %>


                <div align="center">
                    <table cellpadding="0" cellspacing="0" style="margin: 20px;">
                        <tbody>
                        <tr>
                            <td>
                                <a href="javascript:$('#frm').submit();" class="button" style="width: 60px; margin-right: 10px;">${button}</a>
                            </td>
                            <td>
                                <a href="/tc?module=MyHome" class="button" style="width: 60px;">Cancel</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <% } %>


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
