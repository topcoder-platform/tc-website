<%--
   - Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
   - This is the home page of registration app.
   -
   - Change in v1.1 (Release Assembly - TopCoder Website Social Login)
   - - Add some struts tags to pre-fill regiteration form data.
   -
   - Changes in v1.2(BugR 10042)
   - - Add utm_source, utm_medium, utm_campaign hidden fields.
   -
   - Version: 1.2
   - Author: leo_lol, KeSyren
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<s:include value="includes/html_head.jsp">
		<s:param name="pageTitle">Login</s:param>
	</s:include>
	<body>
		<s:include value="includes/head.jsp"></s:include>
		<div class="reg_validation_area">
		  <div class="reg_validation">
		      <s:actionerror/>
		      <s:fielderror />
		  </div>
		</div>
		<div id="content">
			<div class="leftSide longer">
				<h2>
	                <span class="heading"><img src="i/text-dont-have-an-account.png" width="228" height="45" alt="Don't Have An Account? TopCoder Signup" /></span>
	            </h2>
				<div class="accessLogos">
					<p>Registering for a TopCoder account<br />gives you access to following areas:</p>
					<a href="#"><img src="i/logo-topcoder.png" width="136" height="21" alt="TopCoder" /></a><br />
					<a href="#"><img src="i/logo-tc-studio.png" width="135" height="45" alt="TopCoder Studio" /></a><br />
					<a href="#"><img src="i/logo-tc-cockpit.png" width="136" height="71" alt="TopCoder Cockpit" /></a>
				</div>				
			</div>
			<div class="rightSide">
					<div class="form">
					    <s:form id="register_user_form" method="post" action="register" theme="simple" namespace="/ajax">
			                        <input type="hidden" name="utm_source" id="utm_source" value="${utm_source}">
			                        <input type="hidden" name="utm_medium" id="utm_medium" value="${utm_medium}">
			                        <input type="hidden" name="utm_campaign" id="utm_campaign" value="${utm_campaign}">
						<div class="row">
							<label>First Name</label>
							<s:textfield name="user.firstName" id="txtFName" cssClass="text" type="text" theme="simple" value="%{social.givenName}"></s:textfield>
						</div>
						<div class="row">
							<label>Last Name</label>
							<s:textfield name="user.lastName" id="txtLName" cssClass="text" type="text" theme="simple" value="%{social.familyName}"></s:textfield>
						</div>
						<div class="row">
							<label>Handle</label>
							<s:textfield name="user.handle" id="txtHandle" cssClass="text" type="text" theme="simple"></s:textfield>
							<a href="javascript:;" class="blue question whatsThis">What's this?</a>
							<span class="reg_msg"></span>
						</div>
						<div class="row">
							<label>Country</label>
							<s:select id="selCountry" name="user.country" list="countries" listKey="code" listValue="name" headerKey="" headerValue="Please Select"></s:select>
						</div>
						<div class="row">
							<label>Email</label>
							<s:textfield id="txtEmail" type="text" cssClass="text" name="user.email" theme="simple" value="%{social.email}"></s:textfield>
							<span class="reg_msg"></span>
						</div>
						<s:if test="%{social == null}">
						<div class="row">
							<label>Password</label>
							<s:password id="txtPassword" cssClass="password text" name="user.password" theme="simple"></s:password>
							<span class="passwordStrength"></span>
						</div>
						<div class="row">
							<label>Confirm Password</label>
							<s:password id="txtCPassword" cssClass="password text" name="user.confirmPassword" theme="simple"></s:password>
						</div>
						</s:if>
						<div class="row">
							<label>Verification Code</label>
							<s:textfield id="txtCaptcha" cssClass="text" type="text" name="user.verificationCode" theme="simple"></s:textfield>
						</div>
						<div class="row nolabel" id="captcha_row">
							<a href="javascript:;" class="refresh blue" id="tryAnotherCode">Try another code</a>
							<span id="captcha_span">
								<s:action namespace="/" executeResult="true" name="getCaptchaCode"></s:action>
							</span>
						</div>
						<div class="row btns nolabel">
							<p class="policy">By Clicking Register, you have read and accept the <a href="javascript:;" id="privacyPolicyBtn">privacy policy</a></p>
							<a href="javascript:;" class="reset blue clear">Clear</a>
							<a class="redBtn arrow register" href="javascript:;">
								<span class="buttonMask"><span class="text"><span class="arrow">REGISTER</span></span></span>
							</a>
							<div class="clear"></div>								
						</div>
						</s:form>
					</div>
			</div>
		</div><!-- End #content -->
		<div class="clear"></div>
		<s:include value="includes/footer.jsp"></s:include>
		<s:include value="includes/modal.jsp"></s:include>
		
	</body>
</html>