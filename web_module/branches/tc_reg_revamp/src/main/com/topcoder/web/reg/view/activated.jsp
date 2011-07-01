<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<s:include value="/includes/html_head.jsp">
		<s:param name="pageTitle">ACTIVATE YOUR ACCOUNT</s:param>
	</s:include>
	<body class="confirmAccountPage">
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
						<h2><span class="titleWrapper"><img src="/i/reg/font-mainTitle-congrat.png" alt="CONGRATULATION" /></span></h2>
					</div>
				</div>
			</div>
			<!-- end #mainTitle -->
			
			<!-- #mainContent -->
			<div id="mainContent">
			
				<div class="mainContentInner">
					<div class="accoutSummery">
						<h3>Your account has been activated</h3>
						<p>Congratulations. Now you can use your account to participate in TopCoder.</p> 
						<p>Please <a href='<s:url value="http://www.topcoder.com/tc?&module=Login"/>'>Login</a> for the next step.</p>
					</div>
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
                <!--Update footer-->
               
                <div class="copyright">
                    <span>Copyright TopCoder, Inc. 2001-2011</span>
                    <a href="https://www.topcoder.com/tc?module=Static&d1=about&d2=terms" target="_blank" title="Terms of Use">Terms of Use</a>
                    <a href="https://www.topcoder.com/tc?module=Static&d1=about&d2=privacy" target="_blank" title="Privacy Policy">Privacy Policy</a>
                </div>
                <!--End copyright-->
      </div>

	</div><!-- .wrapper -->

	</body>
</html>