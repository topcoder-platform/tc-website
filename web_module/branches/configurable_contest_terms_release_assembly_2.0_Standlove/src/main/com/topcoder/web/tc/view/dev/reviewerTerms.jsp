<%--
  - Author: pulky
  - Date: 21 Jan 2009
  - Version: 1.1
  - Copyright (C) 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: Displays the Terms Of User for Design and Development Project Review and provides a form for the
  - user to accept the terms and submit the response to server to continue signing up for review.
  - Version 1.1 (Configurable Contest Terms Release Assembly v1.0) changes: Added new functionality that asks for
  - several terms of use and show those the reviewer already agreed to.
--%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@ page import="com.topcoder.web.tc.Constants"%>

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <c:set value="<%=Constants.TERMS_OF_USE_ID%>" var="TERMS_OF_USE_ID"/>
 <jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>

<head>
<title>Programming Contests, Software Development, and Employment Services at TopCoder</title>

<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="development"/>
</jsp:include>

<% int phase_id = ((Integer)request.getAttribute("phase_id")).intValue(); %>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="<%= phase_id == 112 ? "des_review" : "dev_review"%>"/>
         </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Gutter Begins --%>
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0" alt=""/></td>
<%-- Gutter Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="<%= phase_id == 112 ? "comp_design" : "comp_development"%>"/>
    <jsp:param name="title" value="Review Opportunities"/>
</jsp:include>

            <form action="<%=sessionInfo.getServletPath()%>" method="POST" name="frmTerms">
              <input type="hidden" name="<%=Constants.PROJECT_ID%>" value="<%=request.getParameter(Constants.PROJECT_ID)%>"/>
                <%-- TCS Release 2.2.0 (TCS-54) : The request passes project type ID instead of component
                     phase type ID when referrring to review project type--%>
<%--
              <input type="hidden" name="<%=Constants.PHASE_ID%>" value="<%=request.getParameter(Constants.PHASE_ID)%>"/>
--%>
                <input type="hidden" name="<%=Constants.PROJECT_TYPE_ID%>"
                       value="<%=request.getParameter(Constants.PROJECT_TYPE_ID)%>"/>
              <input type="hidden" name="<%=Constants.REVIEWER_TYPE_ID%>" value="<%=request.getParameter(Constants.REVIEWER_TYPE_ID)%>"/>
              <input type="hidden" name="<%=Constants.PRIMARY_FLAG%>" value="<%=request.getParameter(Constants.PRIMARY_FLAG)%>"/>
              <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="ProjectReviewTermsAgree"/>


			  <c:if test="${not empty eletronic_terms_not_agreed}">
					<div align="center" style="padding-top: 20px;">
						Please read through the following electronic terms and then click
						<strong>"I Agree"</strong> for each terms.
					</div>
				   <c:forEach items="${eletronic_terms_not_agreed}" var="terms" varStatus="row">
                        <c:set var="index" value="${row.index}"/>
						<jsp:useBean id="index" type="java.lang.String" />
						<tc-webtag:hiddenInput name="<%= (Constants.TERMS_OF_USE_ID + index) %>" value="${terms.termsOfUseId}"/>

						<div align="center" style="padding-top: 20px;">
							${terms.title}
						</div><br />
						<iframe width="590" height="300" marginWidth="5"
							src="${sessionInfo.servletPath}?module=Terms&amp;${TERMS_OF_USE_ID}=${terms.termsOfUseId}">
						</iframe>
						<p style="width: 510px;">
							<span class="errorText"><tc-webtag:errorIterator id="err" name="<%= (Constants.TERMS_AGREE + index) %>"><%=err%>
                                    <br /></tc-webtag:errorIterator></span>

								I Agree to the Terms and Conditions stated above&#160;
								<tc-webtag:chkBox name="<%= (Constants.TERMS_AGREE + index) %>"/>
						</p>
					</c:forEach>
				</c:if>

				<c:if test="${not empty paper_terms_not_agreed}">
					<div align="center" style="padding-top: 20px;">
						You cannot agree to the following terms electronically.
						You must print the terms and send a signed hard copy
						to TopCoder. <br/>
						For submission by <b>email</b>, send a clear and legible scan or photo of the entire page (completed, signed, and dated) as
						an attachment to member-agreements@topcoder.com.  For submission by <b>fax</b>, you may fax the completed, signed, and dated
						form (without a cover sheet) to: (US) +1 (860) 631-1027.  For submission by <b>mail</b>, send the completed, signed, and
						dated form to: Attention: Legal Department, TopCoder, Inc., 95 Glastonbury Blvd., Glastonbury, CT 06033.
					</div>					
					<c:forEach items="${paper_terms_not_agreed}" var="terms">
						<a href="${terms.url}" target="_blank">${terms.title}</a> <br/>
					</c:forEach>
				</c:if>

            <table border="0" cellspacing="0" cellpadding="5">
				<c:if test="${not empty terms_agreed}"> 
					<tr>
						<td>
							The following terms (that you already agreed to) apply to this review:
						</td>
					</tr>
					<tr>
						<td>
							<c:forEach items="${terms_agreed}" var="terms_agreed_item">
								<ul>
									<li>
										${terms_agreed_item.title}
										<c:choose>
											<c:when test="${terms_agreed_item.electronicallySignable != 1}">
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
				</c:if>


                <c:if test="${(empty eletronic_terms_not_agreed) && (empty paper_terms_not_agreed)}">
                    <c:set var="captchaFileName" value="<%=Constants.CAPTCHA_FILE_NAME%>"/>
                    <tr>
                        <td class="errorText">
                            <img src="/i/captcha/${requestScope[captchaFileName]}" alt="captcha image"/>
                            <p>
                                <a href="javascript:window.location.reload()">This image is hard to read.  Show me a different one.</a>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td class="errorText">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.CAPTCHA_RESPONSE%>">${err}<br /></tc-webtag:errorIterator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>
                                Please enter the characters you see in the image above:
                                <tc-webtag:textInput name="<%=Constants.CAPTCHA_RESPONSE%>" />
                            </p>
                        </td>
                    </tr>
                </c:if>

                <c:choose>
                    <c:when test="${(not empty eletronic_terms_not_agreed) || (not empty paper_terms_not_agreed)}">    
						<tr>
							<td align="center">
								<input type="submit" onClick="" name="submit" value=" Continue"/>
							</td>
						</tr>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td align="center">
                                <input type="submit" onClick="" name="submit" value=" Register"/>
                            </td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </table>

            </form>
        </td>
<%-- Center Column Ends --%>

<%-- Gutter --%>
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0" alt=""></td>
<%-- Gutter Ends --%>

<%-- Right Column Begins --%>
         <td width="180">
            <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>

         </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
         <td width="2"><img src="/i/clear.gif" width="2" height="1" border="0" alt=""></td>
<%-- Gutter Ends --%>

    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>

