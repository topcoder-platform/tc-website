<%--
  - Author: TCSDEVELOPER, pulky
  - Version: 1.1
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page shows tc about page
  -
  - Version 1.1 (Testing Competition Split Release Assembly 1.0) changes:
  -    * Updated Application Testing to Test Suites.
--%>
<%@ page import="com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.common.BaseServlet, com.topcoder.web.common.SessionInfo" %>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    SessionInfo sessionInfo = (SessionInfo)request.getAttribute(BaseServlet.SESSION_INFO_KEY);
    String level1 = request.getParameter("level1")==null?"competition":request.getParameter("level1");
     String handle = null;
    if (sessionInfo != null)
    {
        handle = sessionInfo.getHandle();
    }

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" media="screen" href="/css/home/screen.css" />
<link rel="stylesheet" type="text/css" media="screen" href="/css/home/jquery.jcarousel.css" />
<link rel="stylesheet" type="text/css" media="screen" href="/css/home/main-navigation.css" />
<!--[if IE]><link rel="stylesheet" type="text/css" href="/css/home/screen-ie.css" /><![endif]-->
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="/css/home/screen-ie7.css" /><![endif]-->
<!--[if IE 6]><link rel="stylesheet" type="text/css" href="/css/home/screen-ie6.css" /><![endif]-->
<title>Programming Contests, Software Development, and Employment Services at TopCoder</title>
<script src="/js/home/jquery-1.2.6.min.js" type="text/javascript"></script>
<script src="/js/home/jquery.hoverIntent.minified.js" type="text/javascript"></script>
<script src="/js/home/jquery.jcarousel.pack.js" type="text/javascript"></script>
<script src="/js/home/direct.js" type="text/javascript"></script>
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


    jQuery(document).ready(function() {
        jQuery('#news-carousel').jcarousel({
            scroll: 1,
            easing: 'swing',
            wrap: 'both'
        });
    });



    window.alert = function() {
    return;
};


});

    function openWin(url, name) {
        win = window.open(url, name, "menubar=no,status=no,scrollbars=yes,resizable=no,toolbar=no,width=650,height=650");
        win.location.href = url;
        win.focus();
    }
    window.name="main"; // required for whatistopcoder popup targeting
    //--%>

</script>
<script language="javascript" type="text/javascript">
    $(document).ready(function(){
            $active = "#drawer-content1"
         $("#about-nav-container a").not("#community").not("#about-contact-button").fadeTo("slow", 0.3);
         $("#about-nav-container a").not("#about-contact-button").click(function(){
             return false;
         });
         $("#community").hoverIntent(function(){
         $(this).fadeTo("slow", 1.0);
         $("#about-nav-container a").not(this).not("#about-contact-button").fadeTo("slow", 0.3);
          if ($active == "#drawer-content1") {} else
          {
              $("#drawer-container div").stop(true,true);
             $($active).slideUp(500, function(){$("#drawer-content1").slideDown("slow");
            $active = "#drawer-content1"
            });
            return false;
         }}, function(){
             return false;
         });

          $("#results").hoverIntent(function(){
          $(this).fadeTo("slow", 1.0);
                $("#about-nav-container a").not(this).not("#about-contact-button").fadeTo("slow", 0.3);

         if ($active == "#drawer-content3") {} else {
            $("#drawer-container div").stop(true,true);
             $($active).slideUp(500, function(){$("#drawer-content3").slideDown("slow");
            $active = "#drawer-content3"
            });
         return false;
         }}, function(){
             return false;
         });

          $("#plugin").hoverIntent(function(){
          $(this).fadeTo("slow", 1.0);
                $("#about-nav-container a").not(this).not("#about-contact-button").fadeTo("slow", 0.3);
         if ($active == "#drawer-content4") {} else {
            $("#drawer-container div").stop(true,true);
             $($active).slideUp(500, function(){$("#drawer-content4").slideDown("slow");
            $active = "#drawer-content4"
            });
            return false;
         }}, function(){
             return false;
         });

          $("#battling").hoverIntent(function(){
          $(this).fadeTo("slow", 1.0);
                $("#about-nav-container a").not(this).not("#about-contact-button").fadeTo("slow", 0.3);
         if ($active == "#drawer-content2") {} else {
            $("#drawer-container div").stop(true,true);
             $($active).slideUp(500, function(){$("#drawer-content2").slideDown("slow");
            $active = "#drawer-content2"
            });
            return false;
         }}, function(){
             return false;
         });
    });
</script>
</head>

<body>

    <div id="header">
        <div class="wrapper">

<%-- MASTHEAD AND LOGO --%>
            <h1><a href="http://www.topcoder.com" title="TopCoder"><span>TopCoder Direct</span></a><%--<sup><small>BETA</small></sup>--%></h1>
            <h2 id="ready_engage"><span>Ready.. ENGAGE</span></h2>

<%-- MAIN NAVIGATION --%>
            <div id="nav">
                <h3 class="hide">Main Navigation</h3>
                <ul>
                    <li class="left on"><a href="http://<%=ApplicationServer.SERVER_NAME%>/">TopCoder Home</a></li>
                    <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/">Engage</a>
                        <ul>
                            <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/direct/">TopCoder Direct</a></li>
                            <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/">Components</a></li>
                            <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/indexTCS.jsp">Software</a></li>
                            <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/TCD/platform-tools.jsp">Platform Tools</a></li>
                            <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/TCD/training.jsp">Training &amp; Mentoring</a></li>
                            <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/TCD/support.jsp">Support &amp; Maintenance</a></li>
                            <li class="last-li"><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/contact.jsp">Contact Us</a></li>
                        </ul>
                    </li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc">Compete</a>
                        <ul>
                            <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ActiveContests&amp;pt=23">Conceptualization</a></li>
                            <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ActiveContests&amp;pt=6">Specification</a></li>
                            <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ActiveContests&amp;pt=7">Architecture</a></li>
                            <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewActiveContests&amp;ph=112">Component Design</a></li>
                            <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewActiveContests&amp;ph=113">Component Development</a></li>
                            <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewAssemblyActiveContests">Assembly</a></li>
                            <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/?module=ViewActiveContests">Marathon Matches</a></li>
                            <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/wiki/display/tc/Bug+Races">Bug Races</a></li>
                            <li class="last-li"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewActiveContests">Studio Competitions</a></li>
                        </ul>
                    </li>
                    <li><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/">Studio</a>
                        <ul>
                            <li><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewActiveContests">Active Contests</a></li>
                            <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/direct/">Launch a Contest</a></li>
                            <li><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/forums">Studio Forums</a></li>
                            <li><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/blog/">Studio Blog</a></li>
                            <li><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=MyStudioHome">My Studio</a></li>
                            <li class="last-li"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=Static&amp;d1=contactUs">Contact Studio</a></li>
                        </ul>
                    </li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc">Community</a>
                        <ul>
                            <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/reg/">Join TopCoder</a></li>
                            <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=MyHome">My TopCoder</a></li>
                            <li><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/">TopCoder Forums</a></li>
                            <li class="last-li"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/forums">Studio Forums</a></li>
                           </ul>
                    </li>
                </ul>
          </div><%-- #navigation ends --%>

            <%-- SUB NAVIGATION --%>
            <div id="nav_support">
                <h3 class="hide">SUB Navigation</h3>
                <ul>
                    <li class="left"><a href="http://<%=ApplicationServer.SERVER_NAME%>/">TopCoder.com</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=about&d2=index">About TopCoder</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=pressroom&amp;d2=index">News</a></li>
                    <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/contact.jsp">Contact Us</a></li>


                    <% if ( !sessionInfo.isAnonymous() ) { %>
            <li><a href="#">Hello,&nbsp;</a><tc-webtag:handle coderId='<%=sessionInfo.getUserId()%>' darkBG="true" /></li><li class="right"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Logout&nextpage=http://<%=ApplicationServer.SERVER_NAME%>">Logout</a></li>
        <% } else {%>
                <li class="right"><a class="gMetal" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?&amp;module=Login">Login</a></li>
            <% } %>
                </ul>
            </div><%-- #navigation ends --%>
        </div>
      <%-- .wrapper ends --%>
    </div><%-- #header ends --%>
<div id="about-tc-wrapper">
    <div id="slide-container">

        <div id="about-nav-container">
        <h2>About TopCoder</h2>
        <a href="#" id="community">The World's Largest Community of Competitive Software Developers</a>
        <a href="#" id="battling">Battling to be the Best</a>
        <a href="#" id="results">The Result of Their Competition... is your application...</a>
        <a href="#" id="plugin">Now you can plug into this communiity directly</a>
        <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=about&d2=contactus" class="button" id="about-contact-button">Contact Us</a>
        </div>
    </div>
    <div id="drawer-container">

        <!-- Drawer 1-->
        <div id="drawer-content1" class="drawer">
            <div class="drawer-inner-wrapper" id="community-drawer">
                <div class="left-column">
                    <h2>TopCoder Community</h2>
                    <p>In all fields of endeavor great people love to compete, and this is no different when it comes to delivering software solutions.
                    TopCoder's global community of developers competes here in skill-based challenges representing every stage of the software development
                    process. From discovery and specification, through development, testing and deployment; competition is at the core of everything we do. For
                    our members, TopCoder is the place your talents can be truly rewarded. For our customers, TopCoder can deliver solutions developed through
                    competition, in time frames and quality levels that are simply impossible using a traditional approach.</p>
                    <ul class="links">
                        <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/TCD/methodology.jsp">Learn More</a></li>
                        <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc">Slash TC, The Community Home Page</a></li>
                        <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/stat?c=top_designers">TopCoder's Top Tens</a></li>
                        <li><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/">The Forums</a></li>
                    </ul>
                </div>
                <div class="right-column">
                    <div id="member-map">
                        <h3><span class="red"><tc-webtag:format object="${sessionInfo.memberCount}" format="#,##0"/>    </span> members and counting!</h3>
                        <a href="http://<%=ApplicationServer.SERVER_NAME%>/reg/" class="join-today button">Join Today!</a>
                    </div>
                </div>
                <p class="clear"></p>
            </div>
        </div>

        <!-- Drawer 2-->
        <div id="drawer-content2" class="drawer">
            <div class="drawer-inner-wrapper" id="competitions-drawer">
                <div class="left-column">
                    <h2>TopCoder Competitions</h2>
                    <h3 class="green">Over $7 Million in Prizes awarded so far!</h3>
                    <h4>Compete now: 10 ways to win at TopCoder</h4>

                    <ul class="left-list">

                        <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/wiki/display/tc/How+To+Compete+in+Algorithm+Competitions">Algorithm</a></li>
                        <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/wiki/display/tc/TopCoder+Conceptualization+Contests">Conceptualization &amp; Specification</a></li>
                        <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/wiki/display/tc/Architecture+Overview">Software Architecture</a></li>
                        <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/wiki/display/tc/Getting+Started+in+Component+Design+Competitions">Software Design</a></li>
                        <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/wiki/display/tc/Getting+Started+in+Component+Development+Competitions">Software Development</a></li>

                    </ul>

                    <ul class="right-list">
                        <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/wiki/display/tc/Assembly">Software Assembly</a></li>
                        <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/wiki/display/tc/Test+Suites">Test Suites</a></li>
                        <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/wiki/display/tc/Bug+Races">Bug Races </a></li>
                        <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=hs&d2=home">High School </a></li>
                        <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/?module=Static&d1=instructions">Marathon Matches </a></li>
                    </ul>
                    <p class="clear"></p>
                    <h3 id="topcoder-studio">TopCoder Studio</h3>
                    <h3 class="subhead1">The Global Design Community of TopCoder</h3>
                    <p>Compete now in creative competitions ranging from logo and web page design, to Flash, Flex and prototype development<br/>
                    <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/" class="blue">Check it out!</a>
                </div>

                <div class="right-column">
                    <h3>Ongoing Competitions</h3>
                    <div id="digital-run">
                        <p>You don't have to win every contest to make big money at TopCoder. The more you participate, and the better you perform, the more
                        points you can earn toward this guaranteed monthly bonus pool.<br/><a href="http://<%=ApplicationServer.SERVER_NAME%>/dr">Learn More &gt;</a></p>
                    </div>
                       <div id="topcoder-open">
                        <p>Once a year, TopCoder brings the best of the best to Las Vegas, Nevada to compete onsite for the title of TopCoder Open Champion, and
                        a share of more than $250,000 in prizes.
                         <br/><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=tournaments&d2=home">Learn More &gt;</a></p>
                     </div>
                </div>
                <p class="clear"></p>
            </div>
        </div>

        <!-- Drawer 3-->
        <div id="drawer-content3" class="drawer">
            <div class="drawer-inner-wrapper" id="methodology-drawer">
            <div class="left-column">
                <h2>TopCoder Methodology</h2>
                <p>No one understands how to apply the talent of a global community to specific problems better than TopCoder.  We take your problem, define it,
                break it down into pieces to be delivered in parallel and assemble the solution - all using the global resource of the world's largest
                competitive developer community.  By measuring and scoring every interaction - impossible in a traditional approach - we are able to provide our
                customers with the peace of mind that can only come with knowing that someone is watching every detail.</p>

                <h3>Components: Those Little Pieces</h3>

                <p>Typically, 50% of your application is already built and exists as reusable components in TopCoder's Software Catalog.  Your access to these
                more than 1400 tested and certified components speeds up your timeline, and improves your bottom line.</p>
             </div>
               <div class="right-column">
            <div id="components-graphic">
            <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/TCD/methodology.jsp " class="button" id="learn-more">Learn More</a>
            </div>
            </div>

            </div>
        </div>

        <!-- Drawer 4-->
        <div id="drawer-content4" class="drawer">
            <div class="drawer-inner-wrapper" id="engaged-drawer">
            <div class="left-column">
            <h2>Engage!</h2>
            <p class="engage-text">TopCoder is the first massively parallel, non-labor based end-to-end solution for the development of all things digital. No matter how big or small the project, from requirements discovery to design, build and test for applications ranging from small web, mobile and internal departmental apps to large ERP, CRM and decision support development and implementation, TopCoder is a platform that provides instant access to a vast wealth of resource. Send us a note so we can talk about how TopCoder can work for you.</p>
            <a class="button" id="contact-us-button" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=about&d2=contactus">Contact Us</a>
            </div>

            <div class="right-column">
             <h3 id="tcdirect">TopCoder Direct</h3>
             <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/" class="button" id="learn-more-button" >Learn More</a>
             <p>TopCoder Direct puts you in control.  Whether you're trying to build or change your website, building a web based ordering system for your customers, need to do a presentation or a new flyer or marketing piece, TopCoder Direct is your command center.  Launch your own competitions, monitor the progress, choose a winner and download your new design - all from your personal TopCoder Direct control panel.</p>
            </div>


            </div>
        </div>
        <div id="drawer-footer"></div>
       </div>
</div>



<%-- LINKS BLOCK --%>
    <div id="links">
        <div class="wrapper">
            <div class="col">
                <h4>Customer Service</h4>
                <ul>
                    <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/contact.jsp">Contact Support</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=about&amp;d2=privacy">Privacy Policy</a></li>
                     <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=about&d2=terms">Terms &amp; Conditions</a></li>
                </ul>
            </div>

            <div class="col">
                <h4>About TopCoder</h4>
                <ul>
                    <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/contact.jsp">Contact Us</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=pressroom&amp;d2=mediaRequestForm">Public Relations</a></li>
                    <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/TCD/rss.jsp">RSS Feeds</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=pressroom&amp;d2=index">Press Room</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=about&amp;d2=jobs">Working at TopCoder</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=about&amp;d2=terms">Legal Information</a></li>
                </ul>

            </div>

            <div class="col">
                <h4>Platform Tools</h4>
                <ul><li><a href="http://<%=ApplicationServer.SERVER_NAME%>/wiki/display/tc/Upcoming+Contests">Pipeline</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/wiki/display/tc/TopCoder+UML+Tool">UML Tool</a></li>
                    <li><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&amp;categoryID=22">TopCoder Forums</a></li>
                    <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/index.jsp">Component Catalog</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/wiki/">TopCoder Wiki</a></li>
                </ul>
          </div>

            <div class="col">
                <h4>TopCoder Community</h4>
                <ul>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc">TopCoder Community Home</a></li>
                    <li><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/">TopCoder Forums</a></li>
                    <li><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/forums">Studio Forums</a></li>
                </ul>

                <h4>TopCoder Blogs</h4>
                 <ul>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/direct/blogs/">TopCoder Direct</a></li>
                    <li><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/blog/">Studio TopCoder</a></li>
                </ul>
            </div>

            <div class="col">
                <h4>My Account</h4>
                <ul>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/reg/">TopCoder Registration</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=MyHome">Manage Profile</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/dr">TopCoder Digital Run</a></li>
                    <li><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=Static&amp;d1=digitalrun&amp;d2=2008v2&amp;d3=home">Studio Cup</a></li>
                </ul>
            </div>

            <div class="col">
                <h4>Powered by TopCoder</h4>
                <ul>
                    <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/">TopCoder Direct</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/">TopCoder.com</a></li>
                    <li><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/">Studio TopCoder</a></li>
                </ul>
            </div>

        </div><%-- .wrapper ends --%>
    </div><%-- #links block ends --%>

<%-- FOOTER BLOCK --%>
    <div id="footer">
        <div class="wrapper">
            <p id="footer_1800"><strong>Support@TopCoder.com</strong></p>
            <p>TopCoder is the world's largest competitive software development community with <tc-webtag:format object="${sessionInfo.memberCount}" format="#,##0"/> developers representing over 200 countries.</p>
            <p>Copyright TopCoder, Inc. 2001-<script type="text/javascript">d=new Date();document.write(d.getFullYear());</script></p>
        </div><%-- .wrapper ends --%>
    </div><%-- #footer ends --%>


<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-6340959-1']);
  _gaq.push(['_setDomainName', '.topcoder.com']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

</body>
</html>