<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<c:if test="${sessionInfo.loggedIn}">
			<title>Edit Profile</title>
		</c:if>
		<c:if test="${!sessionInfo.loggedIn}">
			<title>Signup Personal Information</title>
		</c:if>
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
				<c:if test="${sessionInfo.loggedIn}">
					<h1>Edit Profile</h1>
				</c:if>
				<c:if test="${!sessionInfo.loggedIn}">
					<h1>Registration Signup</h1>
				</c:if>
			</div><!-- END .inner -->
		</div>
		<form name="form" method="post" action="signup_personal_information_1.jsp">
			<div id="content" class="registrationForm">
				<div class="leftSide">
					<p>Check all that apply.</p>
					<p>Before registering, please read our <a href="javascript:popUp('message.jsp');" title="Message from the TopCoder Founder">Message from the TopCoder Founder</a>.</p>
					<p>Please read the <a href="privacy_policy.jsp">Privacy Policy</a> </p>
					<p>All registered TopCoder members have the ability to read and post in our forums, as well as browse sections of the site that require login, such as detailed competition statistics. </p>
					<p>You can always add to your registered capabilities later by clicking &quot;Update My Profile&quot;.</p>
				</div>
				<div class="information rightSide">
					<h4><span>What would you like to do as a registered TopCoder member?</span><span class="end">&nbsp;</span></h4>
					<div class="content-body">
						<ul class="form">
							<li class="row">
								<input name="checkbox" type="checkbox" class="inline_box" id="checkbox" />
								Competition    Registration | <a href="#">tell me more</a>
							</li>
							  <li class="row">
								<input name="checkbox" type="checkbox" class="inline_box" id="checkbox" />
								High School (Secondary School) Registration | <a href="#">tell me more</a></li>
							<li class="row">
								<input name="checkbox" type="checkbox" class="inline_box" id="checkbox" />
								TopCoder Software Customer Registration | <a href="#">tell me more</a></li>
							<li class="row">
								<input name="checkbox" type="checkbox" class="inline_box" id="checkbox" />
								Corporate Registration | <a href="#">tell me more</a></li>
							<li class="row">
								<input name="checkbox" type="checkbox" class="inline_box" id="checkbox" />
								TopCoder Studio Registration | <a href="#">tell me more</a>
								<p class="label-description">(implementation note: need link to popup.js and popup content added for each selection)</p>
							</li>
							<li class="form-bottom"><br />
							  <button type="submit" id="submit">NEXT</button>
								<p>
									Or cancel and go to 
									<a href="index.jsp" title="TopCoder">TopCoder</a> or 
									<a href="studio_home.jsp" title="Studio">Studio</a></p>
								<p>&nbsp;</p>
							</li>
						  </ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</form>
		<jsp:include page="footer.jsp" />
    </body>
</html>