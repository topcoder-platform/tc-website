<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.BaseProcessor" %>
<%@ page import="com.topcoder.web.common.model.RegistrationType" %>
<%@ page import="com.topcoder.web.reg.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>Signup Personal Information</title>
        <script type="text/javascript" src="/js/regReskin20080904.js"></script>
        <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
        <jsp:include page="style.jsp">
            <jsp:param name="key" value="tc_reg"/>
        </jsp:include>
    
		<jsp:include page="registrationCss.jsp" />
    
    <script type="text/javascript" src="/js/popup.js"></script>
    <script language="javascript" type="text/javascript">
        <!--
        function openWin(url, name, w, h) {
            win = window.open(url, 'biowin', "scrollbars=yes,toolbar=no,resizable=no,menubar=no,width=" + w + ",height=" + h);
            win.location.href = url;
            win.focus();
        }
        // -->
    </script>
</head>

<body>

	<% int divId = 0;%>
	<c:forEach items="${registrationTypeList}" var="type">
		<div id="popUp<%=divId%>" class="popUp">
			<div style="width: 400px; white-space: normal;">${type.description}</div>
		</div>
	<%divId++;%>
	</c:forEach>	            
	
	<div id="wrapper">

		<div id="box-head">
		    <jsp:include page="header.jsp" />
		    <div id="page-head">
		        <h3 id="registration-signup"><span>Registration Signup: Personal Information</span></h3>
		    </div>
		</div>
            
	    <div id="box-body">
	
	        <c:if test="${sessionInfo.loggedIn}">
	            <div style="float:right;" class="small"><A href="${sessionInfo.servletPath}?module=Logout">logout</A></div>
	        </c:if>
	        
	        <c:if test="${!sessionInfo.loggedIn}">
	            <div style="float:right;" class="small">
	                (<A href="/reg/?nrg=false">Click here</A> if you're already a registered member and would like to update
	                your profile.)
	            </div>
	        </c:if>
	
	        <form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="selectionForm">
	        <div class="block">
	        
		        <div class="sidebar">
		            <p>Check all that apply.</p>
		            <p>
				        <c:if test="${!sessionInfo.loggedIn}">
				            Before registering, please read our <a href="Javascript:openWin('/reg/message.jsp','',1200,600);">Message
				            from the TopCoder Founder</a>.
				            <br/>
				        </c:if>		            
		            </p>
		            <p>Please read the <a href="Javascript:openWin('/reg/privacy_policy.jsp','',1200,600);">Privacy Policy</a> </p>
		            <p>All registered TopCoder members have the ability to read and post in our forums, as well as browse sections of the site that require login, such as detailed competition statistics. </p>
		            <p>You can always add to your registered capabilities later by clicking &quot;Update My Profile&quot;.</p>
	            </div>
	            
	            <div class="content">
	            <h4><span>What would you like to do as a registered TopCoder member?</span><span class="end">&nbsp;</span></h4>
                <div class="content-body">
                <ul>
	        
		            <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Main"/>
		
		            <c:set value="<%=Constants.REGISTRATION_TYPE%>" var="regType"/>
		            <span class="bigRed"><tc-webtag:errorIterator id="err" name="${regType}">${err}
		                <br/></tc-webtag:errorIterator></span>
		
		            <c:set value="<%=BaseProcessor.DEFAULTS_KEY%>" var="defaults"/>
		            <c:set value="<%=RegistrationType.TEACHER_ID%>" var="teacherType"/>
		            <c:set value="<%=RegistrationType.OPENAIM_ID%>" var="openAIM"/>
		            <c:set value="<%=RegistrationType.TRUVEO_ID%>" var="truveo"/>
		
		            <c:set value="<%=RegistrationType.HIGH_SCHOOL_ID%>" var="highSchool"/>
		            <% int i = 0;%>
		            <c:forEach items="${registrationTypeList}" var="type">
		            	<li class="form-row">
		                <c:set value="${regType}${type.id}" var="regTypeKey"/>
		                <c:choose>
		<%--                    <c:when test="${type.id==highSchool}">
		                        <c:choose>
		                            <c:when test="${requestScope[defaults][regTypeKey]==null}">
		                                ${type.name} <br /><A href="javascript:void(0)" onmouseover="popUp(this,'popUp<%=i%>')" onmouseout="popHide()">tell me more...</A><br />
		
		                                <div id="popUp<%=i%>" class="popUp">
		                                    <div style="width: 400px; white-space: normal;">TopCoder High School Registration is not currently open, we are still getting ready for the new season.  You may register for TopCoder Competitions now, and look for more information from TopCoder when registration for the new season starts.</div>
		                                </div>
		                            </c:when>
		                            <c:otherwise><img src="/i/interface/cbox_grayedout.gif" alt=""/>
		                                <tc-webtag:hiddenInput name="${regTypeKey}" value="on"/>
		                                ${type.name} <br /><A href="javascript:void(0)" onmouseover="popUp(this,'popUp<%=i%>')" onmouseout="popHide()">tell me more...</A><br />
		
		                                <div id="popUp<%=i%>" class="popUp">
		                                    <div style="width: 400px; white-space: normal;">${type.description}</div>
		                                </div>
		                            </c:otherwise>
		                        </c:choose>
		                    </c:when> --%>
		                    <c:when test="${type.id!=truveo && type.id!=openAIM && ((type.id==teacherType && !isNewReg) || type.id!=teacherType)}">
		                        <c:choose>
		                            <c:when test="${requestScope[defaults][regTypeKey]==null}">
		                                <input name="${regTypeKey}" style="margin-left: 10px; margin-top: 5px;" type="checkbox" />
		                            </c:when>
		                            <c:otherwise>
		                            	<input type="checkbox" style="margin-left: 10px; margin-top: 5px;" checked="true" disabled="true"/>
		                                <tc-webtag:hiddenInput name="${regTypeKey}" value="on"/>
		                            </c:otherwise>
		                        </c:choose>
		                        ${type.name} | <a href="javascript:void(0)" onmouseover="popUp(this,'popUp<%=i%>');" onmouseout="popHide()">tell me more</a>
		                    </c:when>
		                </c:choose>		                
		                </li>
		                <%i++;%>
		            </c:forEach>
		            
					<li class="form-bottom"><br />
						<button type="submit" id="submit">Submit</button>
						<p>
						    Or cancel and go to 
						    <a href="http://<%=ApplicationServer.SERVER_NAME%>/" title="TopCoder">TopCoder</a> or 
						    <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/" title="Studio">Studio</a>
						</p>
						<p>&nbsp;</p>
					</li>
		            
		        </ul>
		        </div>
		        </div>
		    </div>	
	        </form>
	    </div>
	    
	    <jsp:include page="footer.jsp" />
	    
	</div>

</body>
</html>
