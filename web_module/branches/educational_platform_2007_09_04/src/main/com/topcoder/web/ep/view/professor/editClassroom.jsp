<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.web.ep.Constants"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
    <head>
        <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>
            <c:choose>
                <c:when test="${not empty classroom.id}">Edit Classroom</c:when>
                <c:otherwise>Add Classroom</c:otherwise>
            </c:choose>
        </title>
    
        <script type="text/javascript">
            function submit() {
                var myForm = document.f;
                myForm.submit();
            }
        </script>
    </head>
    
    
    <body>
        <form name="f" action="${sessionInfo.servletPath}" method="post">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="EditClassroom"/>
            <tc-webtag:errorIterator id="err" name="error">
                <font color="#FF0000"><%=err%></font><br/>
            </tc-webtag:errorIterator>
            <br/>
                <c:forEach items="${classroom.professor.activeSchools}" var="school">                
                    <c:choose>                        <c:when test="${fn:length(classroom.professor.activeSchools) > 1}">
                            <tc-webtag:radioButton name="<%=Constants.SCHOOL_ID%>" value="${school.id}"/>${school.name}&nbsp;&nbsp;
                        </c:when>
                        <c:otherwise><tc-webtag:hiddenInput name="<%=Constants.SCHOOL_ID%>" value="${school.id}"/></c:otherwise>
                    </c:choose>
                </c:forEach>
            <br/>
            Classroom: <tc-webtag:textInput name="classroom_name" size="60" editable="true" />
            <br/>
            Academic period: <tc-webtag:textInput name="classroom_academic_period" size="60" editable="true" />
            <br/>
            Description : <tc-webtag:textInput name="classroom_description" size="60" editable="true" />
            <br/>
            <p>
                <a href="javascript:submit()" class="button" style="width: 60px; margin-right: 10px;">Continue</a>
            </p>
        </form>            
    </body>
</html>