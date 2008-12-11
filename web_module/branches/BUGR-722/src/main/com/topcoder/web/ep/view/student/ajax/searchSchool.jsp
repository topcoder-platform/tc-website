<%@page contentType="text/xml"%>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.topcoder.web.ep.Constants" %>

<taconite-root xml:space="preserve">

 <taconite-replace-children contextNodeID="results" parseInBrowser="true">     
 
        <div id="results">
            <c:choose>
                <c:when test="${fn:length(results)==0}">
                    <p class="bigRed">
                        Your search returned no records.
                    </p>
                </c:when>
                <c:otherwise>
                    <p>
                        <strong>Results</strong>
                    </p>

                    <p>
                        Lists includes only up to the first <strong><%=Constants.MAX_SCHOOL_RESULTS%></strong> schools. If you see a duplicate, <strong>please choose the school with the greatest number of registrants</strong>.
                    </p>

                    <p>
                        If any information about your school is missing or incorrect and you'd like to send us the correct information, <a href="mailto:service@topcoder.com?subject=School%20Information%20Correction">click here</a>.
                    </p>

                    <p>
                        Please <strong>select</strong> your school from list below.
                    </p>

                    <span id="submitMessage"></span><br />
                        <c:forEach items="${results}" var="result">
                        <div class="small" style="margin-bottom: 4px;">
                            <c:out value="${result[1].name}"/><br />
                            <c:if test="${result[1].address.city!=null||result[1].address.state!=null||result[1].address.postalCode!=null||result[1].address.province!=null||result[1].address.country!=null}">
                                <c:if test="${result[1].address.city!=null}"><c:out value="${result[1].address.city}"/>,</c:if> <c:if test="${result[1].address.state!=null}"><c:out value="${result[1].address.state.code}"/>,</c:if> <c:if test="${result[1].address.postalCode!=null}"><c:out value="${result[1].address.postalCode}"/>,</c:if> <c:if test="${result[1].address.province!=null}"><c:out value="${result[1].address.province}"/>,</c:if> <c:if test="${result[1].address.country!=null}"><c:out value="${result[1].address.country.name}"/></c:if>
                                <br />
                            </c:if>
                            Registrants: ${result[0]}<br/>
                            <c:set value="\"" var="quote"/>
                            <c:set value="\\\"" var="escapedQuote"/>
                        </div>
                        <div style="margin-bottom: 10px;">
                            <a href="${sessionInfo.servletPath}student/?module=SelectClassroom&amp;<%=Constants.SCHOOL_ID%>=${result[1].id}"><img src="/i/ep/buttons/select.png" alt="Select" /></a>
                        </div>
                        </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
</taconite-replace-children>      
 </taconite-root>
