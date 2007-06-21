<%@ page import="com.topcoder.web.reg.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder High School Competitions</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>

</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="hs_overview"/>
            </jsp:include>
        </td>
        <!-- Left Column Ends -->

        <!-- Center Column Begins -->
        <td class="cardCell" width="100%" align="center" style="padding: 0px 0px 0px 0px;">
            <div class="myTCBody">

	<form action="/tc" method="POST" name="f">
	<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="HSRegister"/>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
		<c:choose>
			<c:when test="${not existSeason}">
				There are no current or upcoming High School Seasons.
			</c:when>

			<c:when test="${not registeredHs}">
				You must <a href="http://www.topcoder.com/reg">register</a> for High School first.
			</c:when>
			
			<c:when test="${not eligible}">
				You are not eligible for High School competitions.
			</c:when>
			
			<c:when test="${alreadyRegistered}">
				You are registered for current High School season.
			</c:when>

			<c:otherwise>
				<table>				
				 <tr>
			      <td>
			         How old will you be on <fmt:formatDate value="${season.endDate}" pattern="MMMMM d, yyyy"/>?
			      </td>
			      <td>
			          <tc-webtag:textInput name="<%=Constants.AGE_FOR_HS%>" size="3" maxlength="3" editable="true"/>
			      </td>
				</tr>
			    <tr>
			        <td>
			           Will you be attending high school/secondary school on <fmt:formatDate value="${season.endDate}" pattern="MMMMM d, yyyy"/>?
			        </td>
			        <td>
			            <tc-webtag:radioButton name="<%=Constants.ATTENDING_HS%>" value="yes"/> Yes
			            <tc-webtag:radioButton name="<%=Constants.ATTENDING_HS%>" value="no"/> No
			            
			        </td>
			    </tr>
			    </table>
		    	<div align="center">
				    <a href="#" onclick="document.f.submit();return false;">Submit</a>
				</div>		    
			</c:otherwise>					
		</c:choose>
</form>
            </div>

        </td>
        <!-- Center Column Ends -->

        <!-- Right Column Begins -->
        <td width="170">
            <jsp:include page="/public_right.jsp">
                <jsp:param name="level1" value="tchs"/>
            </jsp:include>
        </td>
        <!-- Right Column Ends -->

        <!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
        <!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>
