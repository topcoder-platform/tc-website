<%@ page import="com.topcoder.shared.util.ApplicationServer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>Edit Personal Information</title>
        <script type="text/javascript" src="/js/regReskin20080904.js"></script>
        <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
        <jsp:include page="style.jsp">
            <jsp:param name="key" value="tc_reg"/>
        </jsp:include>
    </head>
    
    <body>
		<jsp:include page="header.jsp" />
		<div id="heading" class="registrationSuccessfulHedading">	
			<div class="inner">
				<h1>
					<a href="profile_view_personal_information.jsp" title="Your Profile" id="your_profile_link"><span>Your Profile</span></a>
					<span id="personal_information_edit"><span>/ Personal Information</span></span>
				</h1>
			</div><!-- END .inner -->
		</div> 
		<form name="form" method="post" action="profile_view_personal_information.jsp">
			<div id="content" class="registrationForm">
				<div class="leftSide">
					<p>&nbsp;</p>
				</div>
				<div class="information rightSide">
					<h4><span>Favorite Quote</span><span class="end">&nbsp;</span></h4>
					<div class="content-body">
						<ul class="form">
							<li class="row">
								<label for="first_name">Quote:</label>
								<textarea name="quote" cols="50" rows="7" wrap="virtual">Things which are complicated tend to disappear and get lost. Simplicity is difficult, not easy. Beauty is simple. All unnecessary elements are removed - only essence remains.</textarea>
							</li>
							<li class="row">
								<label for="author">Author:</label>
								<input type="text" name="last_name" id="last_name" size="40" value="Alan Hovhaness" />
							</li>
							<li class="bottom">
								<button type="submit" id="submit">Save Changes</button>
								<a id="btnSave" class="redBtn" href="JavaScript:document.form.submit();">
									<span class="buttonMask"><span class="text">SAVE CHANGES</span></span>
								</a>
								<p>
									Or cancel and 
									<a href="profile_view_personal_information.jsp" title="TopCoder">return to your profile page</a>
								</p>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</form>
		<jsp:include page="footer.jsp" />
    </body>
</html>