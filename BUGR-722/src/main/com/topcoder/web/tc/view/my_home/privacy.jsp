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
                    <tr>
                        <td class="title" colspan="2">
                            Privacy Preferences
                        </td>
                    </tr>
                    <c:if test="${isHighSchool}">
                        <tr class="light">
                            <td class="value" nowrap="nowrap" style="border: none;">
                                <span style="display: block; padding-top: 4px;">Show / hide my school:</span>
                            </td>
                            <td class="value" width="100%" style="border: none;">
                                <tc-webtag:errorIterator id="err" name="err_show_school">
                                    <span class="bigRed"><%=err%></span>
                                </tc-webtag:errorIterator>
                                <tc-webtag:radioButton name="show_school" value="show"/> Show
                                <br /><tc-webtag:radioButton name="show_school" value="hide"/> Hide
                            </td>
                        </tr>
                    </c:if>
                    <c:forEach var="preference" items="${preferenceList}">
                        <tr class="light">
                            <td class="value" width="100%" style="border: none;">
                                <tc-webtag:errorIterator id="err" name="err_${preference.id}">
                                    <span class="bigRed"><%=err%></span><br />
                                </tc-webtag:errorIterator>
                                <span style="display: block; padding-top: 4px;">${preference.name}:
                                <c:if test="${preference.id == memberContactPrefId}">
                                <br />Edit my <a href="/tc?module=BlackList">black list</a>
                                </c:if>
                                <c:if test="${preference.id == showEarningsPrefId}">
                                <br /><span class="grayedOut">(You will still be able to see your own earnings statistics)</span>
                                </span>
                                </c:if>
                            </td>
                            <td class="value" nowrap="nowrap" style="border: none;">
                                <c:choose>
                                    <c:when test="${preference.type.id == 1}">
                                        <tc-webtag:chkBox name="pref_${preference.id}"/>
                                    </c:when>
                                    <c:when test="${preference.type.id == 4}">
                                        <tc-webtag:radioButton name="pref_${preference.id}" value="show"/> Show
                                        <br /><tc-webtag:radioButton name="pref_${preference.id}" value="hide"/> Hide
                                    </c:when>
                                    <c:when test="${preference.type.id == 5}">
                                        <tc-webtag:radioButton name="pref_${preference.id}" value="yes"/> Yes
                                        <br /><tc-webtag:radioButton name="pref_${preference.id}" value="no"/> No
                                    </c:when>
                                    <c:otherwise>
                                        <tc-webtag:textInput name="pref_${preference.id}"/>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
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
                                <a href="/tc?module=MyHome" class="button" style="width: 60px;">Cancel</a>
                            </td>
                        </tr>
                    </tbody>
                    </table>
                </div>
                </form>            

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