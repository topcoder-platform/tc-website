<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<s:include value="/includes/html_head.jsp">
		<s:param name="pageTitle">Registration</s:param>
	</s:include>
	<body class="registerPage">
		<div class="wrapper">

			<div id="header">
				<div class="inner">
					<h1><a href="javascript:;" class="logo" title="TopCoder">TopCoder</a></h1>
				</div>
			</div><!-- #header -->
			
			<div id="container">
				<div id="main">
					<!-- #mainTitle -->
					<div id="mainTitle">
						<div class="mainTitleRight">
							<div class="mainTitleCenter">
								<h2><span class="titleWrapper"><img src="i/font-mainTitle-register.png" alt="register" /></span></h2>
							</div>
						</div>
					</div>
					<!-- end #mainTitle -->
					
					<!-- #mainContent -->
					<div id="mainContent">
							<div id="errors" class="invisible">
								<s:actionerror />
								<s:fielderror />
							</div>						
							<div class="mainContentInner">
							<s:form namespace="/" action="registerAction" method="post" id="formRegister">
								<div class="registerBox">
									<div class="elemLine">
										<div class="leftPart">First Name :</div>
										<div class="rightPart">
											<s:textfield name="firstName" id="firstName" cssClass="text textNormal leftFloat" />
											<span class="tipError">Please fill your first name</span>
										</div>
										<div class="clearAll"></div>
									</div>
									<div class="elemLine">
										<div class="leftPart">Last Name :</div>
										<div class="rightPart">
											<s:textfield name="lastName" id="lastName" cssClass="text textNormal leftFloat" />
											<span class="tipError">Please fill last name</span>
										</div>
										<div class="clearAll"></div>
									</div>
									<div class="elemLine">
										<div class="leftPart">Handle :</div>
										<div class="rightPart">
											<s:textfield name="handle" id="handle" cssClass="text textNormal leftFloat" />
											<span class="tipError">Your handle is too short</span>
										</div>
										<div class="clearAll"></div>
									</div>
									<div class="elemLine">
										<div class="leftPart">E-mail :</div>
										<div class="rightPart">
											<s:textfield name="email" id="email" cssClass="text textNormal leftFloat" />
											<span class="tipError">Please fill your valid email</span>
										</div>
										<div class="clearAll"></div>
									</div>
									<div class="elemLine">
										<div class="leftPart">Password :</div>
										<div class="rightPart">
											<s:password id="loginPassword" name="password" cssClass="text textShort leftFloat" />
											<span class="compareError">Password not match</span>
											<span class="tipError">Please fill your password</span>
											<div class="barBox">
												<span class="label">Password Strength</span>
												<div class="barProgress">
													<div class="barInner">
														<div class="barContainer"></div>
														<div class="barControl"></div>
													</div>
												</div>
											</div>
										</div>
										<div class="clearAll"></div>
									</div>
									<div class="elemLine">
										<div class="leftPart">Confirm Password :</div>
										<div class="rightPart">
											<s:password name="passwordConfirm" id="confirmPassword" cssClass="text textShort leftFloat" />
											<span class="tipError">Please confirm your password</span>
										</div>
										<div class="clearAll"></div>
									</div>
									<div class="elemLine">
										<div class="leftPart">Verification Code :</div>
										<div class="rightPart">
											<div class="captcha" id="captcha"><s:action namespace="/" executeResult="true"
												name="loadCaptchaAction"></s:action></div>
											<p class="tryAnotherCode"><a id="tryAnotherCode" href="javascript:;">Try Another Code</a></p>
											<div class="verificationCodeInput">
												<s:textfield name="captchaWord" id="captchaWord" cssClass="text textShorter leftFloat"/>
												<div class="tipError">Your verification code is not match</div>
												<div class="clear"></div>
											</div>
											<div class="formCommand">
												<a href="javascript:;" class="button grayBtn resetButton"><span><span>Reset</span></span></a>
												<a href="javascript:;" id="registerSubmitButton" class="button redBtn submitButton"><span><span>Submit</span></span></a>											
											</div>
										</div>
										<div class="clearAll"></div>
									</div>
								</div>
							</s:form>
						</div>
						
					</div>
					<!-- end #mainContent -->
					
					<!-- #mainFooter -->
					<div id="mainFooter">
						<div class="mainFooterRight">
							<div class="mainFooterCenter"></div>
						</div>
					</div>
					<!-- end #mainFooter -->
					
				</div>
			</div><!-- #container -->
			
			<div id="footer">
			Lorem ipsum dolor sit amet, consectetur adipiscing elit.Nunc vitae magna augue. Cras luctus, enim eget egestas vulputate, est diam
			</div><!-- #footer -->

		</div><!-- .wrapper -->
		<div id="modal">
			<div id="modalTermsConditions" class="outLay">
				<div class="modalHeader">TERMS &amp; CONDITIONS</div>
				<div class="modalContainer">
					<div class="modalContainerInner">
					<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet.</p>
					<p>&nbsp;</p>
					<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet.</p>
					<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat. Lorem ipsum dolor sit </p>
					<p>&nbsp;</p>
					<p>amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet.</p>
					<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet.</p>
					</div>
				</div>
				<div class="modalFooter">
					<div class="modalCommand">
						<a href="javascript:;" class="button grayBtn"><span><span>Disagree</span></span></a>
						<a href="javascript:;" class="button redBtn"><span><span>Agree</span></span></a>
					</div>
				</div>
			</div>
		</div>		
	</body>
</html>

