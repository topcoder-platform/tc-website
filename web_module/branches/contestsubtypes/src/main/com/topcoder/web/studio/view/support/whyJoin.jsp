<%@ taglib uri="studio.tld" prefix="studio" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="description" content="Overview of the benefits for designers in competing in graphic and web design competitions at TopCoder Studio" />
    <meta name="keywords" content="topcoder, studio, graphic competitions, graphic design contests, graphic design, web design, logo, contests, compete, prizes, cash, clients" />
    <title>TopCoder Studio | Why join Studio?</title>

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
                        | Why Join
                        | <a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=memberRefferalProgram">Member Referral Program</a>
                        | <a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=newMemberFaqs">New Member FAQs</a>
                        | <a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=startingACompetition">Starting a Competition</a>
                        </div>
        
                        <h1>Why join Studio?</h1>
                        
                        <h3>Be a Big Fish in a Small(er) Pond</h3>
                        <p>
                        The Studio community is still growing, which means you have a chance to get involved and make some waves while the pool is still small. You also have the chance to become a finalist in multi-round competitions, increasing your chances of winning even more. The field of competition is wide open for talented designers like you.  Our clients are waiting.  Don't let them down. 
                        </p>
                        
                        <h3>More than Just Logo Contests</h3>
                        <p>
                        Many other competition sites focus solely on graphic design, but at Studio, you can challenge your coding skills in HTML, CSS, ActionScript, Flex 3, and JavaScript contests.  Are you a multi-talented web guru?  There's a competition perfect for your skill set on Studio right now. Can't code? Don't worry - Studio runs plenty of graphic designs contests as well!
                        </p>
                        
                        <h3>Big Clients. REALLY Big!</h3>
                        <p>
                        Studio's clients include some of the biggest, highest profile companies in the world, including AOL, Geico, LendingTree, ESPN, just to name a few.  Imagine featuring work for one of these companies in your portfolio!
                        </p>
                        
                        <h3>Multiple Ways to Win</h3>
                        <p>
                        Each year, Studio members compete in online rounds to become a finalist and travel onsite to our annual championship competition. During the 2008 TopCoder Open, twelve Studio finalists competed during the week of May 12, 2008 in Las Vegas for a total prize purse of $45,000. The champion won the grand prize of $20,000 and another $50,000 was distributed to the top finalists. <a href="http://www.topcoder.com/tc?module=Static&d1=tournaments&d2=tco08&d3=studio&d4=summary" target="_blank">See more details about TCO08 here</a>.
                        </p>
                        
                        <p>
                        Studio also rewards designers for competing and placing high, not just for winning. Each contest awards Studio Cup points to designers who place within the top five best submissions.  Collect enough points and you can win a piece of the guaranteed $5,000 bonus pool. Win the Studio Cup in any given month, and you'll win a paid trip to watch our annual onsite championship. 
                        </p>
                        
                        <h3>Recruit Your Friends and Earn More</h3>
                        <p>
                        We don't want Studio to be kept a secret; share Studio with your friends, and when they win, you'll land a bonus of 10% of their earnings for the first twelve months that they compete. This includes prizes they may earn in the Studio Cup or during the annual championship!
                        </p>
                        
                        <h3>With More to Come</h3>
                        <p>
                        TopCoder Studio is always working to offer our community tools for success and the chance to take full advantage of the competition model.  In the future, Studio community members will have opportunities to earn more by guiding clients through projects, display their best work to the world with profile pages, and much more.  Stick with us - we're going places!
                         </p>
                         <p>
                        Need to see more?  <a href="http://studio.topcoder.com/?module=ViewActiveContests">Check out our active contests right now</a>. 
                        </p>
                        <p>
                        Ready to sign up?  <a href="http://www.topcoder.com/reg/">Then let's get started</a>! 
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
