<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<s:include value="/includes/html_head.jsp">
		<s:param name="pageTitle">First Step</s:param>
	</s:include>
	<body class="preferencePage">
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
						<h2><span class="titleWrapper"><img src="i/font-mainTitle-question.png" alt="WHAT WOULD YOU LIKE TO DO?" /></span></h2>
					</div>
				</div>
			</div>
			<!-- end #mainTitle -->
			
			<!-- #mainContent -->
			<div id="mainContent">
				<div>
					<s:actionerror />
					<s:fielderror />
				</div>
				<div class="mainContentInner">
					<s:form id="formPreference" namespace="/" action="firstStepAction" method="post">
					<div class="userPreference">
						<div class="preferenceChoose">
							<div class="myContest">
								<h3>Run My Own Contest</h3>
								<div class="elemLine">
									<s:checkbox name="topcoderDirect" />
									<label>I want to start using TopCoder Direct</label>
									<a href="javascript:;" rel="popUp0" class="helpTips">help</a>
									<div class="clear"></div>
								</div>
							</div>
							<div class="otherContestCompete">
								<h3>I Want to Compete</h3>
								<div class="elemLine">
									<s:checkbox name="competeTopcoder" />
									<label>on TopCoder</label>
									<a href="javascript:;" rel="popUp1" class="helpTips">help</a>
									<div class="clear"></div>
								</div>
								<div class="elemLine">
									<s:checkbox name="competeStudio" />
									<label>on TopCoder Studio</label>
									<a href="javascript:;" rel="popUp2" class="helpTips">help</a>
									<div class="clear"></div>
								</div>
							</div>
							<div class="formCommand">
								<a id="firstStepButton" href="javascript:;" class="button redBtn submitButton"><span><span>Submit</span></span></a>
							</div>
							
						</div>
						<div class="preferenceInformation">
							<p>All registered TopCoder members have the ability to read and post in our forums, as well as browse sections of the site that require login, such as detailed competition statistics.</p>
							<p>&nbsp;</p>
							<p>You can always add to your registered capabilities later.</p>
							<p>&nbsp;</p>
							<p>Please read the <a href="https://www.topcoder.com/reg/privacy_policy.jsp" title="Privacy Policy">Privacy Policy</a></p>
						</div>
						<div class="clear"></div>
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
	<div class="h28"></div>
	</div><!-- .wrapper -->

	<div id="popUp0" class="popUp">
		<div class="popUpInner">
			<div class="arrow"></div>
			<p>Developers from all over the world are competing to build your next application. As a TopCoder Direct member, you have all the tools you need to access this community to get your project done.</p>
			<p>&nbsp;</p>
			<p>Corporate Services:</p>
			<ul>
				<li><strong>TopCoder Direct:</strong> Plug into the world's largest community of competitive software developers. Launch and monitor your own competitions, then view and download the submissions all through the TopCoder Cockpit tool.</li>
				<li><strong>Event Sponsorship:</strong> Our onsite events are large gatherings of proven and recognizable software developers. Whether you want to hire developers at the professional or college level, sponsoring TopCoder tournaments is the most effective way to reach the development community.</li>
				<li><strong>Powered by TopCoder Events:</strong> Whether your company seeks to identify and recruit the best talent or reward and recognize employees, TopCoder can provide a platform to execute online and onsite events.</li>
				<li><strong>Technical Assessment:</strong> TopCoder's Technical Assessment Tool allows companies to test candidates' technical abilities during the interview process, thereby reducing the recruiting time incurred by in-house engineers.</li>
				<li><strong>Placement:</strong> TopCoder works with companies to fill both full-time and contract positions. Clients provide us with a description of the position they need filled and we locate the most qualified members.</li>
			</ul>
		</div>
	</div>

	<div id="popUp1" class="popUp">
		<div class="popUpInner">
			<div class="arrow"></div>
			<span class="bodySubtitle">TopCoder Competitions</span>
			<p>How do you stand up among your peers?</p>
			<ul>
				<li><strong>Algorithm Competitions:</strong> The competitions are timed events where all participants compete online to solve the same problems under the same time constraints. The competitions are available in four programming languages - Java, C++, C#, and VB.Net.</li>
				<li><strong>Bug Races:</strong> The fastest and easiest way to earn money at TopCoder. Just check out our active Bug Races, fix a bug, win the prize money.</li>
				<li><strong>Component Design Competitions:</strong> In the competitions, participants convert a set of requirements into a set of diagrams and a component specification document that is the basis for Component Development Competitions.</li>
				<li><strong>Component Development Competitions:</strong> Participants are tasked with converting a component design, prepared by the winner of the Component Design Competition and reviewed by the Design Review Board, into a functional component.</li>
				<li><strong>Marathon Matches:</strong> The competitions take place over an extended timeline and provide a more flexible competition format that offers different types of problems than what can be offered in the Algorithm Competitions.</li>
			</ul>
		</div>
	</div>

	<div id="popUp2" class="popUp">
		<div class="popUpInner">
		<div class="arrow"></div>
		TopCoder Studio contests are for you "creative types" (graphic designers, artists, flash &amp; flex designers, etc.). Whether you are a working professional or a talented "amateur", trying to build your portfolio or just looking for a great way to flex your creative muscles and earn big money in the process. At Studio you can compete in a variety of design competition types for real live clients and be eligible for large cash awards, including monthly bonus prizes in the "Studio Cup"
		</div>
	</div>

	</body>	
</html>