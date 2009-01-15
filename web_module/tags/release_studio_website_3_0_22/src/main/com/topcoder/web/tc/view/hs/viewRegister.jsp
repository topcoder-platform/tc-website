<%@ page import="com.topcoder.web.reg.Constants,
				 com.topcoder.web.common.model.Event,
				 com.topcoder.web.common.model.Season,
                 com.topcoder.web.common.model.Question,
                 com.topcoder.web.common.tag.AnswerInput,
				 com.topcoder.web.common.HSRegistrationHelper,
                 com.topcoder.web.common.BaseProcessor" %>
<%@ page import="java.util.Collections,
                 java.util.Set,
                 java.util.ArrayList,
                 java.util.List,
                 java.util.HashMap" %>

<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="tc.tld" prefix="tc" %>

<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
   HashMap defaults = (HashMap) pageContext.getRequest().getAttribute(BaseProcessor.DEFAULTS_KEY);
%>
    
<html>
<head>
    <title>TopCoder High School Competitions</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
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
                <jsp:param name="node" value="m_hs_competitions"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">

                <jsp:include page="../page_title.jsp">
                    <jsp:param name="image" value="high_school"/>
                    <jsp:param name="title" value="Registration"/>
                </jsp:include>

    <form action="/tc" method="post" name="f">
    	<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="HSRegister"/>
	    <tc-webtag:hiddenInput name="<%=com.topcoder.web.tc.Constants.SEASON_ID%>" value="${season.id}"/>
        <h2 align="center">Registration for TopCoder High School ${season.name}</h2>

        <c:choose>
            <c:when test="${not eligible}">
                <p align="center">
                    You are not eligible for TopCoder High School competitions.
                </p>
            </c:when>

            <c:when test="${not existSeason}">
                <p align="center">
                    There are no current or upcoming TopCoder High School Seasons.
                </p>
            </c:when>
            <c:when test="${not regOpen}">
                <p align="center">
                    Registration for this season is not open.
                </p>
            </c:when>

            <c:when test="${not registeredHs}">
                <p align="center">
                    You must <a href="http://www.topcoder.com/reg">register</a> for TopCoder High School competitions first.
                </p>
            </c:when>
            
            
            <c:when test="${alreadyRegistered}">
                <p align="center">
                    You are already registered for TopCoder High School ${season.name}.
                </p>
            </c:when>

            <c:otherwise>
            <tc:questionIterator list="${questions}" id="question">
            	<% if (question.getKeyword().equals(HSRegistrationHelper.DOB)) { %>
                        <p align="center">
	                        <span class="bigRed">
    	                        <tc-webtag:errorIterator id="err" name="<%=AnswerInput.PREFIX+question.getId()%>"><%=err%>        	                            
		                        </tc-webtag:errorIterator>
	                        </span>
	                    </p>
	                    <p align="center">
                            <jsp:getProperty name="question" property="text"/><br />
	                        <input type="text" size="10" maxlength="10" name="<%=AnswerInput.PREFIX + question.getId()%>" id ="answerInput" value="<%= defaults.containsKey(AnswerInput.PREFIX + question.getId()) ? defaults.get(AnswerInput.PREFIX + question.getId()) : "" %>"/>
	                        <br /><em>** Your date of birth will only be used for eligibility purposes **</em>
                        </p>
            	<% } else { %>
                        <p align="center">
	                        <span class="bigRed">
		                        <tc-webtag:errorIterator id="err" name="<%=AnswerInput.PREFIX+question.getId()%>"><%=err%><br/>
		                        </tc-webtag:errorIterator>
	                        </span>
	                     </p>
                        <p align="center">
                        <jsp:getProperty name="question" property="text"/> 
                        <br/>
		                  <tc:answerInput id="answerInput" question="<%=question%>">
		                         <%=answerInput%>
		                         <%=answerText%>&nbsp;&nbsp;&nbsp;
		                  </tc:answerInput>
                        </p>
            	<% }%>

            </tc:questionIterator>


            <div align="center">
                <a href="#" onclick="document.f.submit();return false;" class="button" style="width: 60px;">Submit</a>
            </div>            

            </c:otherwise>                    
        </c:choose>

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