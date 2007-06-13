<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ page import="com.topcoder.web.tc.Constants"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="group" value="<%= request.getAttribute("group") %>"/>

<html>

<head>
    <title>TopCoder - My TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <style type="text/css">
    td.value{
    border-top: 0px;
    }
    </style>
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
                    <jsp:param name="title" value="Privacy"/>
                </jsp:include>

            <form name="f" action="${sessionInfo.servletPath}" method="post">
            <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="EditPreferences"/>
            <tc-webtag:hiddenInput name="group"/>

                <table cellpadding="0" cellspacing="0" class="stat" width="100%">
                <tbody>
                    <c:forEach var="preference" items="${preferenceList}">
                        <tr class="light">
                            <td class="value" nowrap="nowrap">
                                <span style="display: block; padding-top: 4px;">${preference.name}:</span>
                            </td>
                            <td class="value" width="100%">
                                <c:choose>
                                    <c:when test="${preference.type.id == 1}">
                                        <tc-webtag:chkBox name="pref_${preference.id}"/>
                                    </c:when>
                                    <c:when test="${preference.type.id == 4}">
                                        <<tc-webtag:radioButton name="pref_${preference.id}" value="true"/> Show
                                        <br/><tc-webtag:radioButton name="pref_${preference.id}" value="false"/> Hide
                                    </c:when>
                                    <c:when test="${preference.type.id == 5}">
                                        <<tc-webtag:radioButton name="pref_${preference.id}" value="true"/> Yes
                                        <br/><tc-webtag:radioButton name="pref_${preference.id}" value="false"/> No
                                    </c:when>
                                    <c:otherwise>
                                        <tc-webtag:textInput name="pref_${preference.id}"/>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${isHighSchool}">
                        <tr class="light">
                            <td class="value" nowrap="nowrap">
                                <span style="display: block; padding-top: 4px;">Show / hide my school:</span>
                            </td>
                            <td class="value" width="100%">
                                <tc-webtag:chkBox name="show_school"/>
                            </td>
                        </tr>
                    </c:if>
                </tbody>
                </table>

                <table cellpadding="0" cellspacing="0" class="stat" width="100%">
                <tbody>
                    <tr class="light">
                        <td class="value" nowrap="nowrap">
                            <span style="display: block; padding-top: 4px;">Show / hide my school:</span>
                        </td>
                        <td class="value" width="100%">
                            <input name="school" value="show" type="radio" /> Show
                            <br /><input name="school" value="hide" type="radio" /> Hide
                        </td>
                    </tr>
                    <tr class="light">
                        <td class="value" nowrap="nowrap">
                            Show / hide my earnings:
                        </td>
                        <td class="value">
                            <input name="earnings" value="show" type="radio" /> Show
                            <br /><input name="earnings" value="hide" type="radio" /> Hide
                        </td>
                    </tr>
                    <tr class="light">
                        <td class="value" nowrap="nowrap" rowspan="2">
                            Allow members to send me messages:
                        </td>
                        <td class="value">
                            <input name="contact" value="yes" type="radio" /> Yes
                            <br /><input name="contact" value="no" type="radio" /> No
                        </td>
                    </tr>
                </tbody>
                </table>

                <div align="center">
                    <table cellpadding="0" cellspacing="0" style="margin: 20px;">
                    <tbody>
                        <tr>
                            <td>
                                <a href="javascript:submit()" class="button" style="width: 60px; margin-right: 10px;">Save</a>
                            </td>
                            <td>
                                <a href="/tc?module=Static&amp;d1=my_home&amp;d2=index" class="button" style="width: 60px;">Cancel</a>
                            </td>
                        </tr>
                    </tbody>
                    </table>
                </form>            
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