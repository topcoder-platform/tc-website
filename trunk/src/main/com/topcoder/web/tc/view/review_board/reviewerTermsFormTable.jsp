<%--
  - Author: TCSASSEMBER
  - Version: 1.0
  - Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page will render the Terms Of Use Agreement section. It will be included by other reviewer sign-up pages.
--%>
<%@  page language="java"  %>
<c:set var="NON_ELEC_AGREEABLE_TERMS_TYPE_ID" value="<%=Constants.NON_ELEC_AGREEABLE_TERMS_TYPE_ID%>"/>

<script type="text/javascript">
<!--
function togGroup(link, index) {
    var obj = document.getElementById("groupTitle" + index);
    var co = document.getElementById("group" + index);
    if (obj.className.indexOf("term_group_exp") != -1) {
        co.style.display = "none";
        obj.className = obj.className.replace("term_group_exp", "term_group_col");
    } else {
        co.style.display = "block";
        obj.className = obj.className.replace("term_group_col", "term_group_exp");
    }
    if (link.blur) link.blur();
}
function goBack() {
    var pre = '${prePendingTerms}';
    var pres = pre.split(",");
    if (pre.length > 0 && pres.length > 0) {
        var tid = pres[pres.length - 1];
        pres.splice(pres.length - 1, 1);
        pre = pres.join(",");
        location.href = '/tc?module=ProjectReviewApply&${PROJECT_ID}=${param[PROJECT_ID]}&${REVIEWER_TYPE_ID}=${param[REVIEWER_TYPE_ID]}&${PRIMARY_FLAG}=${param[PRIMARY_FLAG]}&${PROJECT_TYPE_ID}=${projectType}&tuid=' + tid + '&<%=Constants.PRE_PENDING_TERMS%>=' + pre;
    } else {
        location.href = '/tc?module=ProjectReviewApply&${PROJECT_ID}=${param[PROJECT_ID]}&${REVIEWER_TYPE_ID}=${param[REVIEWER_TYPE_ID]}&${PRIMARY_FLAG}=${param[PRIMARY_FLAG]}&${PROJECT_TYPE_ID}=${projectType}';
    }
}
// -->
</script>

<table border="0" cellspacing="0" cellpadding="5" width="600" class="leftalign">
    <c:choose>
        <c:when test="${not empty terms}">
            <c:choose>
                <c:when test="${empty dependenciesTermsPending}">
                    <input type="hidden" name="<%=Constants.TERMS_OF_USE_ID%>"
                        value="${terms.termsOfUseId}"/>
                    <tr>
                        <td style="text-align:center;">
                            <strong>${terms.title}</strong>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <iframe width="590" height="300" marginWidth="5"
                                src="${sessionInfo.servletPath}?module=Terms&amp;${TERMS_OF_USE_ID}=${terms.termsOfUseId}">
                            </iframe>
                        </td>
                    </tr>
                    <c:choose>
                        <c:when test="${terms.agreeabilityType.termsOfUseAgreeabilityTypeId != NON_ELEC_AGREEABLE_TERMS_TYPE_ID}">
                            <tr>
                                <td class="errorText">
                                    <tc-webtag:errorIterator id="err" name="${TERMS_AGREE}">${err}
                                    </tc-webtag:errorIterator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    I Agree to the Terms and Conditions stated above&#160;
                                    <input name="${TERMS_AGREE}" type="checkbox" id="agreechk" onclick="if (this.checked) document.getElementById('conbtn').disabled = ''; else document.getElementById('conbtn').disabled = 'disabled';"/>
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <tr><td>
                            <jsp:include page="/terms/paper_terms.jsp">
                                <jsp:param name="terms.url" value="terms.url"/>
                            </jsp:include>
                            </td></tr>
                        </c:otherwise>
                    </c:choose>
                </c:when>
                <c:otherwise>
                    <tr><td style="text-align:center;"><strong>${terms.title}</strong></td></tr>
                    <c:if test="${not empty dependenciesTermsAgreed}">
                        <tr><td>You have the following terms (which you have agreed to) for ${terms.title}:</td></tr>
                        <tr><td><ul style="margin-left:40px;">
                            <c:forEach items="${dependenciesTermsAgreed}" var="dep_terms_agreed_item">
                                <li>
                                    ${dep_terms_agreed_item.title}
                                    <c:choose>
                                        <c:when test="${dep_terms_agreed_item.agreeabilityType.termsOfUseAgreeabilityTypeId == NON_ELEC_AGREEABLE_TERMS_TYPE_ID}">
                                            <a href="${dep_terms_agreed_item.url}">(View)</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="/tc?module=Terms&tuid=${dep_terms_agreed_item.termsOfUseId}" target="_blank">(View)</a>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                            </c:forEach>
                        </ul></td></tr>
                    </c:if>
                    <c:if test="${not empty dependenciesTermsPending}">
                        <tr><td>You have the following terms pending for agreement before you can read and agree to ${terms.title}:</td></tr>
                        <tr><td><ul style="margin-left:40px;">
                            <c:forEach items="${dependenciesTermsPending}" var="dep_terms_pending_item">
                                <li>
                                    ${dep_terms_pending_item.title}
                                    <a href="/tc?module=ProjectReviewApply&${PROJECT_ID}=${param[PROJECT_ID]}&${REVIEWER_TYPE_ID}=${param[REVIEWER_TYPE_ID]}&${PRIMARY_FLAG}=${param[PRIMARY_FLAG]}&${PROJECT_TYPE_ID}=${projectType}&${TERMS_OF_USE_ID}=${dep_terms_pending_item.termsOfUseId}&prePendingTerms=${prePendingTerms}">(View and agree)</a>
                                </li>
                            </c:forEach>
                        </ul></td></tr>
                    </c:if>
                </c:otherwise>
            </c:choose>
        </c:when>
        <c:otherwise>
            <c:if test="${not empty terms_agreed}">
                <c:forEach items="${terms_agreed}" var="terms_agreed_item_grp" varStatus="vss">
                <tr>
                    <td>
                        The following terms of use (that you already agreed to) apply to the review roles (${terms_agreed_roles[vss.index]}):
                    </td>
                </tr>
                <tr>
                    <td>
                        <c:forEach items="${terms_agreed_item_grp}" var="terms_agreed_item">
                            <ul>
                                <li>
                                    ${terms_agreed_item.title}
                                    <c:choose>
                                        <c:when test="${terms_agreed_item.agreeabilityType.termsOfUseAgreeabilityTypeId == NON_ELEC_AGREEABLE_TERMS_TYPE_ID}">
                                            <a href="${terms_agreed_item.url}">(View)</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="/tc?module=Terms&tuid=${terms_agreed_item.termsOfUseId}" target="_blank">(View)</a>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                            </ul>
                        </c:forEach>
                    </td>
                </tr>
                </c:forEach>
            </c:if>
            <c:choose>
                <c:when test="${not empty terms_group}">
                    <tr>
                        <td>
                            <div class="term_title">
                            The following groups of terms of use apply to the roles:${common_resource_roles}. <br/>
                            You need to agree to at least one of the groups of terms before you can register:
                            </div>
                        </td>
                    </tr>
                    <c:forEach items="${terms_group}" var="terms_group_item" varStatus="vars">
                    <tr>
                        <td>
                            <div class="term_group term_group_exp" id="groupTitle${vars.index}"><a href="#" onclick="togGroup(this, ${vars.index});return false;" class="term_group_icon"></a><div class="term_group_box"><strong>Group ${vars.count}</strong></div><div style="clear:both;"></div></div>
                            <div class="term_group_content" id="group${vars.index}">
                            <c:if test="${terms_group_has_agreed[vars.index]}">
                                You have agreed to:<br/>
                                <ul>
                                <c:forEach items="${terms_group_item}" var="tou_item">
                                    <c:if test="${terms_status[tou_item.termsOfUseId]}">
                                    <li>
                                        ${tou_item.title}
                                        <c:choose>
                                            <c:when test="${tou_item.agreeabilityType.termsOfUseAgreeabilityTypeId == NON_ELEC_AGREEABLE_TERMS_TYPE_ID}">
                                                <a href="${tou_item.url}">(View)</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="/tc?module=Terms&tuid=${tou_item.termsOfUseId}" target="_blank">(View)</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </li> 
                                    </c:if>
                                </c:forEach>
                                </ul>
                            </c:if>
                            You have the following terms pending for agreement:
                            <ul>
                            <c:forEach items="${terms_group_item}" var="tou_item">
                                <c:if test="${not terms_status[tou_item.termsOfUseId]}">
                                    <li>
                                        ${tou_item.title}
                                        <a href="/tc?module=ProjectReviewApply&${PROJECT_ID}=${param[PROJECT_ID]}&${REVIEWER_TYPE_ID}=${param[REVIEWER_TYPE_ID]}&${PRIMARY_FLAG}=${param[PRIMARY_FLAG]}&${PROJECT_TYPE_ID}=${projectType}&${TERMS_OF_USE_ID}=${tou_item.termsOfUseId}&prePendingTerms=${prePendingTerms}">(View and agree)</a>
                                    </li> 
                                </c:if>
                            </c:forEach>
                            </ul>
                            </div>
                        </td>
                    </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td class="errorText">
                            <img src="/i/captcha/${requestScope[CAPTCHA_FILE_NAME]}" alt="captcha image"/>

                            <p>
                                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ProjectReviewApply&<%=Constants.PRIMARY_FLAG%>=<%=request.getParameter(Constants.PRIMARY_FLAG)%>&<%=Constants.REVIEWER_TYPE_ID%>=<%=request.getParameter(Constants.REVIEWER_TYPE_ID)%>&<%=Constants.PROJECT_TYPE_ID%>=<%=request.getParameter(Constants.PROJECT_TYPE_ID)%>&<%=Constants.PROJECT_ID%>=<%=request.getParameter(Constants.PROJECT_ID)%>">This image is hard to read.
                                    Show me a different one.</a>
                            </p>
                        </td>
                    </tr>

                    <tr>
                        <td class="errorText">
                            <tc-webtag:errorIterator id="err" name="${CAPTCHA_RESPONSE}">${err}
                                <br/></tc-webtag:errorIterator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>
                                Please enter the characters you see in the image above:
                                <tc-webtag:textInput name="${CAPTCHA_RESPONSE}"/>
                            </p>
                        </td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </c:otherwise>
    </c:choose>

<c:choose>
    <c:when test="${not empty terms and empty dependenciesTermsPending}">
        <tr>
            <td style="text-align:center;">
                <c:set value="Go back" var="returnMessage"/>
                <c:if test="${terms.agreeabilityType.termsOfUseAgreeabilityTypeId != NON_ELEC_AGREEABLE_TERMS_TYPE_ID}">
                    <input id="conbtn" type="submit" onClick="" name="submit" value=" Continue" disabled/>
                    <c:set value="Cancel" var="returnMessage"/>
                </c:if>

                <input type="button" onClick="goBack()" name="${returnMessage}" value="${returnMessage}"/>
            </td>
        </tr>
    </c:when>
    <c:otherwise>
        <c:if test="${empty terms_group and empty terms}">
            <tr>
                <td style="text-align:center;">
                    <input type="submit" onClick="" name="submit" value=" Register"/>
                </td>
            </tr>
        </c:if>
    </c:otherwise>
</c:choose>
</table>
