<%@ page language="java" %>
<%@ page import="com.topcoder.web.common.model.EventType, com.topcoder.shared.dataAccess.*, 
                 com.topcoder.web.tc.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.tc.controller.request.tournament.AdvancersBase" %>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% 
    ResultSetContainer rsc = (ResultSetContainer) request.getAttribute("result"); 
%>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:useBean id="TCO09Constants" class="com.topcoder.web.tc.controller.request.tournament.tco09.TCO09Constants"/>

<jsp:include page="../../leaderboardPageHead.jsp">
    <jsp:param name="page_id" value="${TCO09Constants.ALGORITHM_QUALIFICATION_PHASE_ID }"/>
    <jsp:param name="add_title_tag" value="${true}"/>
</jsp:include>

<script type="text/javascript">
    function next() {
	      var myForm = document.advancersForm;
	      myForm.<%=DataAccessConstants.START_RANK%>.value= parseInt(myForm.<%=DataAccessConstants.START_RANK%>.value) + parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
	      myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
	      myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
	      myForm.submit();
	  }
    function previous() {
        var myForm = document.advancersForm;
        myForm.<%=DataAccessConstants.START_RANK%>.value-=parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
        myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
        myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
        myForm.submit();
    }
</script>

        <h2>Qualification</h2>

                <form name="advancersForm" action='<jsp:getProperty name="sessionInfo" property="servletPath"/>' method="get">
                <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AlgorithmQualification"/>
                <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
                <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>
                <tc-webtag:hiddenInput name="<%=AdvancersBase.FULL_LIST%>"/>
                <div align="center">
                <a href="/tco08?module=AlgorithmQualification">Reset sorting</a>

                <c:choose>
                    <c:when test="${full}">
                        | <a href="/tco08?module=AlgorithmQualification&amp;full=false">Pages</a>
                        | Full view
                    </c:when>
                    <c:otherwise>
                        | Page view
                        | <a href="/tco08?module=AlgorithmQualification&amp;full=true">Full view</a>
                    </c:otherwise>
                </c:choose>

                <br />
                    <c:if test="${!full}">
                        <div class="pagingBox">
                            <%=(rsc.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
                            | <%=(rsc.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>":"next &gt;&gt;")%>
                        </div>
                    </c:if>
                <br />

                <table cellpadding="0" cellspacing="0" class="stat" style="width: 400px;">
                <thead>
                    <tr>
                        <th>
                            <a href="/tco08?<tc-webtag:sort includeParams='true' column="<%=rsc.getColumnIndex("handle_sort")%>"/>">Handle</a>
                            <br /><tc-webtag:textInput name="<%=Constants.HANDLE%>" size="16" style="border: 1px solid #999999; color: #999999;" onClick="this.style.color='#333333';" maxlength="100"/>
                        </th>
                        <th>
                            <a href="/tco08?<tc-webtag:sort includeParams='true' column="<%=rsc.getColumnIndex("round_name")%>"/>">Round</a>
                        </th>
                        <th>
                            <a href="/tco08?<tc-webtag:sort includeParams='true' column="<%=rsc.getColumnIndex("rating")%>"/>">Rating</a>
                        </th>
                        <th>
                            <a href="/tco08?<tc-webtag:sort includeParams='true' column="<%=rsc.getColumnIndex("points")%>"/>">Points</a>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <%boolean even = false;%>
<%-- formatting this crappy to save space in the download to the client --%>
<rsc:iterator list="<%=rsc%>" id="resultRow">
<tr class="<%=(even ? "dark" : "light")%>">

<td class="value"><tc-webtag:handle coderId='${resultRow.map["coder_id"]}' context="algorithm"/></td>
<td class="valueC" nowrap="nowrap"><c:out value="${resultRow.map['round_name']}" default="Bye"/></td>
<td class="valueR">${resultRow.map["rating"]}</td>
<td class="valueR"><c:choose><c:when test="${resultRow.map['points']==null}">Bye</c:when><c:otherwise><fmt:formatNumber value="${resultRow.map['points']}"  pattern="#.00"/></c:otherwise></c:choose></td>
</tr><%even = !even;%></rsc:iterator>

                </tbody>
                </table>
                </div>
                <br />
                    <c:if test="${!full}">
                        <div align="center">
                            <div class="pagingBox">
                               <%=(rsc.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
                               | <%=(rsc.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>":"next &gt;&gt;")%>
                            
                               <br />
                            
                               View &#160;
                               <tc-webtag:textInput name="<%=DataAccessConstants.NUMBER_RECORDS%>" size="4" maxlength="4"/>
                               &#160;at a time starting with &#160;
                               <tc-webtag:textInput name="<%=DataAccessConstants.START_RANK%>" size="4" maxlength="4"/>
                                <button name="nameSubmit" value="submit" type="submit">Go</button>
                            </div>
                        </div>
                    </c:if>
                </form>

<jsp:include page="../../leaderboardPageBottom.jsp"/>