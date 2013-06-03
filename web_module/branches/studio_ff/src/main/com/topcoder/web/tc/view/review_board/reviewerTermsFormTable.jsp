<%--
  - Author: TCSASSEMBER
  - Version: 1.1
  - Copyright (C) 2011-2012 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page will render the Terms Of Use Agreement section. It will be included by other reviewer sign-up pages.
  - Version 1.1 (Review Application Integration assembly) change notes:
  -  Updated the logic to use review auctions.
--%>
<%@  page language="java"  %>


<c:set var="NON_ELEC_AGREEABLE_TERMS_TYPE_ID" value="<%=Constants.NON_ELEC_AGREEABLE_TERMS_TYPE_ID%>"/>
<c:set var="REVIEW_APPLICATION_ROLE_ID" value="<%=Constants.REVIEW_APPLICATION_ROLE_ID%>" scope="request"/>
<c:set var="REVIEW_AUCTION_ID" value="<%=Constants.REVIEW_AUCTION_ID%>" scope="request"/>

<c:set var="t" value="${''}"/>
<c:forEach items="${paramValues[REVIEW_APPLICATION_ROLE_ID]}" var="role">
    <fmt:formatNumber value="${role}" pattern="######0" var="roleId"/>
    <c:set var="t" value="${t}${REVIEW_APPLICATION_ROLE_ID}=${roleId}&"/>
</c:forEach>

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
        location.href = '/tc?module=ReviewAuctionApply&${REVIEW_AUCTION_ID}=${param[REVIEW_AUCTION_ID]}&${t}tuid=' + tid + '&<%=Constants.PRE_PENDING_TERMS%>=' + pre;
    } else {
        location.href = '/tc?module=ReviewAuctionApply&${REVIEW_AUCTION_ID}=${param[REVIEW_AUCTION_ID]}&${t}';
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
                        <td style="text-align:center;" colspan="2">
                            <strong>${terms.title}</strong>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <iframe width="590" height="300" marginWidth="5"
                                src="${sessionInfo.servletPath}?module=Terms&amp;${TERMS_OF_USE_ID}=${terms.termsOfUseId}">
                            </iframe>
                        </td>
                    </tr>
                    <c:choose>
                        <c:when test="${terms.agreeabilityType.termsOfUseAgreeabilityTypeId != NON_ELEC_AGREEABLE_TERMS_TYPE_ID}">
                            <tr>
                                <td class="errorText" colspan="2">
                                    <tc-webtag:errorIterator id="err" name="${TERMS_AGREE}">${err}
                                    </tc-webtag:errorIterator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    I Agree to the Terms and Conditions stated above&#160;
                                    <input name="${TERMS_AGREE}" type="checkbox" id="agreechk" onclick="if (this.checked) document.getElementById('conbtn').disabled = ''; else document.getElementById('conbtn').disabled = 'disabled';"/>
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <tr><td colspan="2">
                            <jsp:include page="/terms/paper_terms.jsp">
                                <jsp:param name="terms.url" value="terms.url"/>
                            </jsp:include>
                            </td></tr>
                        </c:otherwise>
                    </c:choose>
                </c:when>
                <c:otherwise>
                    <tr><td style="text-align:center;" colspan="2"><strong>${terms.title}</strong></td></tr>
                    <c:if test="${not empty dependenciesTermsAgreed}">
                        <tr><td colspan="2">You have the following terms (which you have agreed to) for ${terms.title}:</td></tr>
                        <tr><td colspan="2"><ul style="margin-left:40px;">
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
                        <tr><td colspan="2">You have the following terms pending for agreement before you can read and agree to ${terms.title}:</td></tr>
                        <tr><td colspan="2"><ul style="margin-left:40px;">
                            <c:forEach items="${dependenciesTermsPending}" var="dep_terms_pending_item">
                                <li>
                                    ${dep_terms_pending_item.title}
                                    <a href="/tc?module=ReviewAuctionApply&${REVIEW_AUCTION_ID}=${param[REVIEW_AUCTION_ID]}&${t}${TERMS_OF_USE_ID}=${dep_terms_pending_item.termsOfUseId}&prePendingTerms=${prePendingTerms}">(View and agree)</a>
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
                    <td colspan="2">
                        The following terms of use (that you already agreed to) apply to the review roles (${terms_agreed_roles[vss.index]}):
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
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
                        <td colspan="2">
                            <div class="term_title">
                            The following groups of terms of use apply to the roles: ${common_resource_roles}. <br/>
                            You need to agree to at least one of the groups of terms before you can register:
                            </div>
                        </td>
                    </tr>
                    <c:forEach items="${terms_group}" var="terms_group_item" varStatus="vars">
                    <tr>
                        <td colspan="2">
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
                                        <a href="/tc?module=ReviewAuctionApply&${REVIEW_AUCTION_ID}=${param[REVIEW_AUCTION_ID]}&${t}${TERMS_OF_USE_ID}=${tou_item.termsOfUseId}&prePendingTerms=${prePendingTerms}">(View and agree)</a>
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
                        <td class="bodyText" colspan="2">
                            By applying to review the contest you are committing to the <a href="/tc?module=ReviewAuctionDetails&${REVIEW_AUCTION_ID}=${param[REVIEW_AUCTION_ID]}">review timeline</a>.
                            The timeline can change later since phases rarely end exactly as per the original schedule.
                            The reviewers must be available throughout the entire contest and adjust to the changes in
                            the timeline.
                            Failure to meet the timeline may result in a suspension from the TopCoder Review Board.
                            More details can be found <a href="http://www.topcoder.com/wiki/display/tc/Late+Deliverables+Tracking">here</a>.
                        </td>
                    </tr>
                    <tr>
                        <td class="errorText">
                            <img src="/i/captcha/${requestScope[CAPTCHA_FILE_NAME]}" alt="captcha image"/>
                        </td>
                        <td width="100%">
                            <p>
                                Please enter the characters you see in the image:
                                <tc-webtag:textInput name="${CAPTCHA_RESPONSE}"/>
                            </p>
                            <a href="${sessionInfo.servletPath}?module=ReviewAuctionApply&${REVIEW_AUCTION_ID}=${param[REVIEW_AUCTION_ID]}&${t}">
                                Show me a different image.</a>
                        </td>
                    </tr>
                    <tr>
                        <td class="errorText" colspan="2">
                            <tc-webtag:errorIterator id="err" name="${CAPTCHA_RESPONSE}">${err}
                                <br/></tc-webtag:errorIterator>
                        </td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </c:otherwise>
    </c:choose>

<c:choose>
    <c:when test="${not empty terms and empty dependenciesTermsPending}">
        <tr>
            <td style="text-align:center;" colspan="2">
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
                <td style="text-align:center;" colspan="2">
                    <input type="submit" onClick="" name="submit" value=" Register"/>
                </td>
            </tr>
        </c:if>
    </c:otherwise>
</c:choose>
</table>
