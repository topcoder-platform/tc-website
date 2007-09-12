<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.topcoder.web.ep.Constants" %>
<tac:taconiteRoot>
    <tac:replaceChildren contextNodeID="results" parseOnServer="true">
        <div id="results">
            <c:if test="${results!=null}">
                <c:choose>
                    <c:when test="${fn:length(results)==0}">
                        <span class="bigRed">Your search returned no records.</span><br/><br/>
                    </c:when>
                    <c:otherwise>
                        <strong>Results</strong><br>
                        Lists includes only up to the first <strong><%=Constants.MAX_SCHOOL_RESULTS%></strong> schools. If
                        you see a
                        duplicate, <strong>please choose the school with the greatest number of registrants</strong>.
                        <br><br>
                        If any information about your school is missing or incorrect and you'd like to send us the correct
                        information, <A href="mailto:service@topcoder.com?subject=School%20Information%20Correction">click
                        here</A>.
                        <br><br>
                        Please <strong>select</strong> your school from list below.<br />
                        <span id="submitMessage"></span><br/>
                        <span class="small">
                            <c:forEach items="${results}" var="result">
                                ${result[1].name}<br/>
                                <c:if test="${result[1].address.city!=null||result[1].address.state!=null||result[1].address.postalCode!=null||result[1].address.province!=null||result[1].address.country!=null}">
                                    <c:if test="${result[1].address.city!=null}">${result[1].address.city},</c:if>
                                    <c:if test="${result[1].address.state!=null}">${result[1].address.state.code},</c:if>
                                    <c:if test="${result[1].address.postalCode!=null}">${result[1].address.postalCode}
                                        ,</c:if>
                                    <c:if test="${result[1].address.province!=null}">${result[1].address.province},</c:if>
                                    <c:if test="${result[1].address.country!=null}">${result[1].address.country.name}</c:if>
                                    <br/>
                                </c:if>
                                Registrants: ${result[0]}<br/>
                                <c:set value="\"" var="quote"/>
                                <c:set value="\\\"" var="escapedQuote"/>
    
                                <A class="small" href="/ep?module=SelectSchool&<%=Constants.SCHOOL_ID%>=${result[1].id}">Select</A>
                                <br/><br/>
                            </c:forEach>
                        </span>
                    </c:otherwise>
                </c:choose>
            </c:if>
        </div>
    </tac:replaceChildren>
</tac:taconiteRoot>
