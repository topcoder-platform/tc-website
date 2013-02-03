<%@ page contentType="text/html" %>
<%@ page import="com.topcoder.web.common.StringUtils"%>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>

<c:set value="<%=Constants.DESIGN_PROJECT_TYPE%>" var="DESIGN_PROJECT_TYPE"/>
<c:set value="<%=Constants.DEVELOPMENT_PROJECT_TYPE%>" var="DEVELOPMENT_PROJECT_TYPE"/>
<c:set value="<%=Constants.ASSEMBLY_PROJECT_TYPE%>" var="ASSEMBLY_PROJECT_TYPE"/>
<c:set value="<%=Constants.ARCHITECTURE_PROJECT_TYPE%>" var="ARCHITECTURE_PROJECT_TYPE"/>
<c:set value="<%=Constants.COMPONENT_TESTING_PROJECT_TYPE%>" var="COMPONENT_TESTING_PROJECT_TYPE"/>
<c:set value="<%=Constants.TEST_SUITES_PROJECT_TYPE%>" var="TEST_SUITES_PROJECT_TYPE"/>
<c:set value="<%=Constants.TEST_SCENARIOS_PROJECT_TYPE%>" var="TEST_SCENARIOS_PROJECT_TYPE"/>
<c:set value="<%=Constants.UI_PROTOTYPE_PROJECT_TYPE%>" var="UI_PROTOTYPE_PROJECT_TYPE"/>
<c:set value="<%=Constants.RIA_BUILD_PROJECT_TYPE%>" var="RIA_BUILD_PROJECT_TYPE"/>
<c:set value="<%=Constants.RIA_COMPONENT_PROJECT_TYPE%>" var="RIA_COMPONENT_PROJECT_TYPE"/>
<c:set value="<%=Constants.COPILOT_POSTING_PROJECT_TYPE%>" var="COPILOT_POSTING_PROJECT_TYPE"/>
<c:set value="<%=Constants.CONTENT_CREATION_PROJECT_TYPE%>" var="CONTENT_CREATION_PROJECT_TYPE"/>
<c:set value="<%=Constants.REPORTING_PROJECT_TYPE%>" var="REPORTING_PROJECT_TYPE"/>
<c:set value="<%=Constants.BUG_HUNT_PROJECT_TYPE%>" var="BUG_HUNT_PROJECT_TYPE"/>
<c:set value="<%=Constants.TERMS_OF_USE_ID%>" var="TERMS_OF_USE_ID"/>
<c:set value="<%=Constants.PROJECT_ID%>" var="PROJECT_ID"/>
<c:set var="NON_ELEC_AGREEABLE_TERMS_TYPE_ID" value="<%=Constants.NON_ELEC_AGREEABLE_TERMS_TYPE_ID%>"/>
<c:set var="ELEC_AGREEABLE_TERMS_TYPE_ID" value="<%=Constants.ELEC_AGREEABLE_TERMS_TYPE_ID%>"/>

<html>

<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
    <jsp:param name="key" value="tc_stats"/>
</jsp:include>

<script type="text/javascript">
function goBack() {
    var pre = '${prePendingTerms}';
    var pres = pre.split(",");
    if (pre.length > 0 && pres.length > 0) {
        var tid = pres[pres.length - 1];
        pres.splice(pres.length - 1, 1);
        pre = pres.join(",");
        location.href = '${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=Terms&is_agree=true&${TERMS_OF_USE_ID}=' + tid + '&<%=Constants.PRE_PENDING_TERMS%>=' + pre;
    } else {
        if (tid) {
            location.href = '${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=Terms&is_agree=true&${TERMS_OF_USE_ID}=' + tid;
        } else {
            var origin = '<%= session.getAttribute(Constants.TERMS_ORIGIN_PAGE_KEY)%>';
            if (origin && origin.length > 0) {
                location.href = origin;
            } else {
                location.href = '/';
            }
        }
    }
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

            <td width="100%" align="center" class="bodyColumn">
                <div class="maxWidthBody" align="left">

                    <jsp:include page="../page_title.jsp" >
                    <jsp:param name="image" value="my_tc"/>
                    <jsp:param name="title" value="&nbsp;"/>
                </jsp:include>

                <div class="maxWidthBody" align="center">
                        <b>${terms.title}</b>
                </div>
              <br/>
                <c:if test="${empty dependenciesTermsPending}">
                <form action="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AgreeToTerms&<%=Constants.PRE_PENDING_TERMS%>=${prePendingTerms}" method="POST" name="agreeToTermsForm">
                    <div style="height:500px;overflow:scroll"><%= StringUtils.checkNull((String) request.getAttribute("terms.content")) %></div>
                    <tc-webtag:hiddenInput name="${TERMS_OF_USE_ID}" value="${terms.termsOfUseId}"/>
                    <c:if test="${not empty terms.url}">
                        <br/>
                        <div align="center">
                            You can get a printer friendly version <a href="${terms.url}">here</a>.
                        </div>
                    </c:if>
                    <p style="width: 510px;">
                        <c:if test="${not empty terms}">
                        <c:choose>
                            <c:when test="${terms.agreeabilityType.termsOfUseAgreeabilityTypeId == ELEC_AGREEABLE_TERMS_TYPE_ID}">
                            <span class="errorText"><tc-webtag:errorIterator id="err" name="<%=Constants.TERMS_AGREE%>"><%=err%>
                                <br /></tc-webtag:errorIterator></span>

                                I Agree to the Terms and Conditions stated above&#160;
                                <input name="<%=Constants.TERMS_AGREE%>" type="checkbox" id="agreechk" onclick="if (this.checked) document.getElementById('conbtn').disabled = ''; else document.getElementById('conbtn').disabled = 'disabled';"/>
                            </c:when>
                            <c:otherwise>
                                <jsp:include page="/terms/paper_terms.jsp">
                                    <jsp:param name="terms.url" value="terms.url"/>
                                </jsp:include>
                            </c:otherwise>
                        </c:choose>
                        </c:if>
                    </p>
                    <p style="width: 510px;">
                        <c:choose>
                        <c:when test="${not empty terms}">
                        <table>
                            <tr>
                                <c:set value="Go back" var="returnMessage"/>
                                <c:if test="${terms.agreeabilityType.termsOfUseAgreeabilityTypeId == ELEC_AGREEABLE_TERMS_TYPE_ID}">
                                <td>
                                    <input id="conbtn" type="submit" onClick="" name="submit" value=" Agree" disabled/>
                                </td>
                                <c:set value="Cancel" var="returnMessage"/>
                            </c:if>
                            <td>
                                <input type="button" onClick="goBack()" name="${returnMessage}" value="${returnMessage}"/>
                            </td>
                            </tr>
                        </table>
                        </c:when>
                            <c:otherwise>
                                <c:if test="${empty terms}">
                                    <a class="button" href="Javascript:document.agreeToTermsForm.submit();" style="width:60px;">Agree</a>
                                </c:if>
                            </c:otherwise>
                        </c:choose>
                    </p>
                </c:if>

                <c:if test="${not empty dependenciesTermsPending}">
                You have the following terms pending for agreement before you can read and agree to ${terms.title}:<br/>
                <ul style="margin-left:40px;">
                    <c:forEach items="${dependenciesTermsPending}" var="dep_terms_pending_item">
                    <li>
                        ${dep_terms_pending_item.title}
                        <c:choose>
                        <c:when test="${dep_terms_pending_item.agreeabilityType.termsOfUseAgreeabilityTypeId == NON_ELEC_AGREEABLE_TERMS_TYPE_ID}">
                            <a href="${dep_terms_pending_item.url}">(View)</a>
                        </c:when>
                        <c:otherwise>
                            <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=Terms&tuid=${dep_terms_pending_item.termsOfUseId}&prePendingTerms=${prePendingTerms}&is_agree=true">(View and agree)</a>
                        </c:otherwise>
                        </c:choose>
                    </li>
                    </c:forEach>
                </ul>
                </c:if>

            </div>
        </td>
    </tr>
</tbody>
</table>
</body>
