<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<s:include value="/includes/html_head.jsp">
		<s:param name="pageTitle">Forgot Password</s:param>
	</s:include>
	<body>
	<!-- header -->
	<div id="headerWrapper">
		<div id="headerInner">
			<a id="topcoderLogo" href="http://www.topcoder.com"><img  src="i/topcoder-logo.png" alt="Topcoder Logo"></img></a>
		</div>
	</div>
	<!-- header end -->
	
	<!-- main content -->
	<div id="mainWrapper">
		<div id="registerInnerWrapper" class="innerWrapper">
			<!-- red rounded box-->
			<div id="registerBox" class="redRoundedBox">
				<div class="top">
					<div class="leftTop"><div class="rightTop">
						<div class="topContent">
							<div id="keyLogo" class="titleLogo"></div>
							<h2 class="title">RECOVER FORGOTTEN PASSWORD</h2>
						</div>
					</div></div>
				</div>
				<div class="contentLeft"><div class="contentRight">
					<div class="contentBox">
						<p id="recoverPara" class="loginPara"><b>Please fill one of the following</b></p>
						<div id="recoverErrors" class="invisible">
							<s:actionerror />
							<s:fielderror />
						</div>
						<s:form namespace="/" action="forgotPassword" method="post" id="recoverPasswordForm">
						<dl id="recoverForm" class="twoColumnForm loginLabelColumn">
							<dt>Handle</dt>
							<dd><s:textfield name="handle" id="TI_handle" cssClass="grayInputText registerInputMed" /><span id="handleErrorMsg" class="errorMessage1">Please fill one of your handle or email</span><span id="handleNotValidErrorMsg" class="errorMessage1">Handle is not valid</span></dd>
							<dt>Email Address</dt>
							<dd><s:textfield name="email" id="TI_email" cssClass="grayInputText registerInputMed" /><span id="emailErrorMsg" class="errorMessage1">Please fill one of your handle or email</span><span id="emailNotValidErrorMsg" class="errorMessage1">Email is not valid</span></dd>
						</dl>
						<div id="recoverButtonBox">
							<a id="submitRecover" class="mediumButton redButton">Submit<span></span></a>
							<a id="doItLater" class="mediumButton grayButton" href='<s:url value="/login.jsp"/>'>I'll do it later<span></span></a>
						</div>
						</s:form>
					</div>
				</div></div>
				<div class="bottom">
					<div class="leftBottom"><div class="rightbottom">
						<div class="bottomContent">
						</div>
					</div></div>
				</div>
			</div>
			<!-- red rounded box-->
		</div>
		<p class="footerPara">Lorem ipsum dolor sit amet, consectetur adipiscing elit.Nunc vitae magna augue. Cras luctus, enim eget egestas vulputate, est diam</p>
	</div>
	<!-- main content end -->
	</body>
</html>