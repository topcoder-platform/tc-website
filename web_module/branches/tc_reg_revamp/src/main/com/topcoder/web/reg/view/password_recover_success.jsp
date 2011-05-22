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
						<div id="recoverSuccessContentLeftBox" class="contentBox">
							<p id="confirmRecover1" class="confirmRecoverPara"><b>Recover forgotten password has been sent into your e-mail.</b></p>
							<p id="confirmRecover2" class="confirmRecoverPara">Please check your email to recover your password.</p>
							<p id="confirmRecover3" class="confirmRecoverPara">If you don't receive any recovery password e-mail, <a 
							href='<s:url action="forgotPassword">
								<s:param name="handle">
									<s:property value="handle" />
								</s:param>
								<s:param name="email">
									<s:property value="email" />
								</s:param>
							</s:url>' class="redLink">Click here</a> to send it again.</p>
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