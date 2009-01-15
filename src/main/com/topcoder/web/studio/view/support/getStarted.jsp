<%@ taglib uri="studio.tld" prefix="studio" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="description" content="Overview of how to start competing in graphic and web design competitions at TopCoder Studio" />
    <meta name="keywords" content="topcoder, studio, graphic competitions, graphic design contests, graphic design, web design, logo, contests, compete, prizes, cash, clients" />
    <title>TopCoder Studio | How it Works</title>

     <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
    <script src="js/NewStyleHeaderFooter/jquery-1.2.6.min.js" type="text/javascript"></script>
	<script src="js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript"></script>
	<script src="js/NewStyleHeaderFooter/scripts.js" type="text/javascript"></script>
	<script type="text/javascript" language="javascript">

	$(document).ready(function(){
	
	
		$("#nav ul li").hoverIntent(function(){
			$(this).children("ul").slideDown("fast");
		}, function() {
			$(this).children("ul").slideUp("fast");
		});
		
		$("#nav ul ul li").hover(function() {
			$(this).parents("#nav ul li").children('a').addClass("active-item");
		}, function() {
			$(this).parents("#nav ul li").children('a').removeClass("active-item");
		});
	
	
	});
	</script>
</head>

<body>
	<div id="page-wrap">
    	<div align="center">
			<jsp:include page="../top.jsp">
            	<jsp:param name="section" value="howitworks" />
        	</jsp:include>
        <br />
        <!-- container -->
        <div id="container">
        	<div id="wrapper">
    
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

                        
                        <div style="padding: 10px 0;">
					      <a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=getStarted">Overview</a>
					    | <a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=whyJoin">Why Join</a>
					    | <a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=memberRefferalProgram">Member Referral Program</a>
						| <a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=newMemberFaqs">New Member FAQs</a>
						| <a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=startingACompetition">Starting a Competition</a>
					    </div>
        
                        <h1>Overview</h1>
                        
                        <h3>The TopCoder Studio Methodology</h3>
						<p>
						Studio challenges top creative talent from around the world to present their best concepts to clients searching for new design solutions.
						</p>
						<p>
						<strong>Clients have multiple designs to choose from. Designers have multiple ways to win.</strong>
						</p>
						<p>
						Our clients hold competitions where designers compete for cash prizes, along with placement points that accumulate for the opportunity to win larger cash awards in our monthly and annual tournaments. 
						</p>
						<p>
						By tapping into a pool of creative people with multiple specialties, our clients benefit from new approaches and innovative concepts from a global community. Our competitors are here not just to win prizes, but to learn new skills, consult with peers, and earn the chance to be called one of the best designers in the world.
                        </p>
                        
                        <h3>The Process</h3>
                        <p>
                        Studio helps clients specify the goals, requirements and scope of the design project. The competition is posted and Studio members submit their designs. The client then evaluates the submissions and chooses a winner (or multiple winners). The design is transferred to the client and the winners receive prizes and placement points for ongoing tournaments.
						</p>
						
						<h3>The Designs</h3>
                        <p>
                        Clients engage the Studio community for design work ranging from icon creation to full application user interface design. In addition to logos, banners, print, apparel and other more traditional design work, members compete in Flash, widget design, Flex 3, HTML/CSS, Javascript and other development competitions. This allows Studio to take your project from the drawing board to production.
                        </p>
                        
						<h3>The Approach</h3>
                        <p>
                        The Studio model allows work to be completed quickly and efficiently in many different ways. A large project can be completed by running several design competitions in parallel with each other. Mini-tournaments give clients the chance to hold "rounds" with a small group of finalists to produce a refined design. "Rapid Design Contests" and "Bug Races" can get small projects done with lightning speed.
						</p>
                        
                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="../foot.jsp"/>


</body>
</html>
