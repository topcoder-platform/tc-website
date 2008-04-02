<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.BaseProcessor" %>
<%@ page import="com.topcoder.web.common.model.RegistrationType" %>
<%@ page import="com.topcoder.web.reg.Constants" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Registration</title>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_reg"/>
    </jsp:include>
    <script type="text/javascript" src="/js/popup.js"></script>
    <script language="javascript" type="text/javascript">
        <!--
        function openWin(url, name, w, h) {
            win = window.open(url, 'biowin', "scrollbars=yes,toolbar=no,resizable=no,menubar=no,width=" + w + ",height=" + h);
            win.location.href = url;
            win.focus();
        }
        // -->
    </script>
</head>

<body>

<%-- THE align="center" IS REQUIRED TO EVER CENTER IT, BUT THAT CAN BE OVERRULED TO LEFT OR RIGHT WITH CSS --%>
<div id="pageBranding" align="center">
    <a href="http://<%=ApplicationServer.SERVER_NAME%>">&nbsp;</a>
</div>

<div align="center" id="pageAligner">
    <div id="pageSpacer">
    
    <div id="pageTitle"><div>&nbsp;</div></div>

        <c:if test="${sessionInfo.loggedIn}">
            <div style="float:right;"><a href="${sessionInfo.servletPath}?module=Logout" class="small">logout</a></div>
        </c:if>
        <c:if test="${!sessionInfo.loggedIn}">
            <div align="center" class="small" style="padding-bottom: 6px;">
                (<a href="/reg/?nrg=false">Click here</a> if you're already a registered member and would like to update
                your profile.)
            </div>
        </c:if>

        <strong>What would you like to do as a registered TopCoder member?<br />Check all that apply.</strong>
        <br /><br />
        <c:if test="${!sessionInfo.loggedIn}">
            Before registering, please read our <a href="Javascript:openWin('/reg/message.jsp','message',600,600);">Message
            from the TopCoder Founder</a>
            <br /><br />
        </c:if>


        <form action="${sessionInfo.secureAbsoluteServletPath}" method="post" name="selectionForm">
            <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Main"/>

            <c:set value="<%=Constants.REGISTRATION_TYPE%>" var="regType"/>
            <span class="bigRed"><tc-webtag:errorIterator id="err" name="${regType}">${err}
                <br /></tc-webtag:errorIterator></span>

            <c:set value="<%=BaseProcessor.DEFAULTS_KEY%>" var="defaults"/>
            <c:set value="<%=RegistrationType.TEACHER_ID%>" var="teacherType"/>
            <c:set value="<%=RegistrationType.OPENAIM_ID%>" var="openAIM"/>
            <c:set value="<%=RegistrationType.HIGH_SCHOOL_ID%>" var="highSchool"/>
            <% int i = 0;%>
            <c:forEach items="${registrationTypeList}" var="type">
                <c:set value="${regType}${type.id}" var="regTypeKey"/>
                <c:choose>
                    <c:when test="${type.id==highSchool}">
                        <c:choose>
                            <c:when test="${requestScope[defaults][regTypeKey]==null}">
                                ${type.name} <br /><a href="javascript:void(0)" onmouseover="popUp(this,'popUp<%=i%>')" onmouseout="popHide()">tell me more...</a><br />

                                <div id="popUp<%=i%>" class="popUp">
                                    <div style="width: 400px; white-space: normal;">TopCoder High School Registration is not currently open, we are still getting ready for the new season.  You may register for TopCoder Competitions now, and look for more information from TopCoder when registration for the new season starts.</div>
                                </div>
                            </c:when>
                            <c:otherwise><img src="/i/interface/cbox_grayedout.gif" alt=""/>
                                <tc-webtag:hiddenInput name="${regTypeKey}" value="on"/>
                                ${type.name} <br /><a href="javascript:void(0)" onmouseover="popUp(this,'popUp<%=i%>')" onmouseout="popHide()">tell me more...</a><br />

                                <div id="popUp<%=i%>" class="popUp">
                                    <div style="width: 400px; white-space: normal;">${type.description}</div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                    <c:when test="${type.id!=openAIM && ((type.id==teacherType && !isNewReg) || type.id!=teacherType)}">
                        <c:choose>
                            <c:when test="${requestScope[defaults][regTypeKey]==null}">
                                <tc-webtag:chkBox name="${regTypeKey}"/>
                            </c:when>
                            <c:otherwise><img src="/i/interface/cbox_grayedout.gif" alt=""/>
                                <tc-webtag:hiddenInput name="${regTypeKey}" value="on"/>
                            </c:otherwise>
                        </c:choose>
                        ${type.name} <br /><a href="javascript:void(0)" onmouseover="popUp(this,'popUp<%=i%>')" onmouseout="popHide()">tell me more...</a><br />

                        <div id="popUp<%=i%>" class="popUp">
                            <div style="width: 400px; white-space: normal;">${type.description}</div>
                        </div>
                    </c:when>
                </c:choose>
                <br /><br />
                <%i++;%>
            </c:forEach>

            <div align="center">
                <button onclick="document.selectionForm.submit();return false;">Submit</button>
            </div>


        </form>

        <br /><br />
        Please read the <a href="/tc?module=Static&amp;d1=about&amp;d2=privacy">Privacy Policy</a>
        <br /><br />
        All registered TopCoder members have the ability to read and post in our forums, as well as browse sections of
        the site that require login, such as detailed competition statistics.
    </div>
</div>

<br /><br />

</body>
</html>