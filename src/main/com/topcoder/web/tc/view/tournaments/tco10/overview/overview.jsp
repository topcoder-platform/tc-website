<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Tournament Overview" area="overview" menu="happenings"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../includes/htmlhead.jsp"/>
</head>

<body>

<div id="wrapper" class="homepage"><!-- the outest whole website wrapper -->

<jsp:include page="../includes/logo.jsp"/>

<div id="content">
<div class="contentInner">

<jsp:include page="../includes/menu.jsp"/>

<div id="welcome">

    <div class="crossButton"><!-- right side button -->
        <div class="blog"><a href="http://topcoder.com/home/tco10/"></a></div>
        <div class="programe"><!--<a href="javascript:;"></a>--></div>
        <div class="movie"><a href="http://topcoder.com/home/tco10/movies/"></a></div>
        <div class="photo"><a href="http://topcoder.com/home/tco10/photos/"></a></div>
    </div><!--End .crossButton-->

    <div class="welcomeText"><!-- left side text -->
        <h1 class="welcomeTitle">WELCOME TO THE 2010 TOPCODER OPEN!</h1>

      <p>The <span class="blue">2010 TopCoder Open</span> (TCO) is a world-wide programming and graphic design tournament that is open to all TopCoder members 18 and older, who are in good standing, and meet all other eligibility criteria. There are six competition tracks as part of the TCO: Algorithm, Design, Development, Marathon, Mod Dash, and Studio Design. Take part in the TCO10 to enhance your skills, compete against the most elite minds around the world, and for a chance at some great prizes! Becoming a TopCoder member is easy and free.  <a href="http://www.topcoder.com/reg">Register here</a>. Have a question? Just email <a href="mailto:service@topcoder.com">service@topcoder.com</a>.</p>
    </div>
    <!--End .welcomeText-->

</div>
<!--End .welcome-->

<div id="mainbody" class="homeMainBody"><!-- below menu ,main content -->
    <span class="leftTop"></span><!-- main content left top corner -->
    <span class="rightTop"></span><!-- main content right top corner -->
    <span class="leftBottom"></span><!-- main content left bottom corner -->
    <span class="rightBottom"></span><!-- main conent right bottom corner -->

    <jsp:include page="subMenu.jsp"/>

    <div class="bigColumn">
        <div class="text">
<%--
           <h2 class="pageTitle">Latest Happenings</h2><!-- page title -->
           
           RSS Feed from the blog needs to go here.
--%>
       
            <h2 class="pageTitle">TopCoder is proud to announce the 2010 TopCoder Open!</h2><!-- page title -->
            	<p><strong>$150,000 in Prizes! Six Competition Tracks!</strong></p>
            	<p><strong>100 Competitors WIN a Round-Trip All-Expenses Paid Trip to LAS VEGAS!</strong></p>
            	<p>Each year TopCoder strives to out do the year before and this year we feel confident that you'll be wowed with the competitions, prizes, and excitement that is the TCO10!</p>
            	<p>The TCO10 has now begun with <a href="http://www.topcoder.com/tco10?module=ViewUnifiedRegistration">registration open for all tracks of competition.</a> Be sure to visit each competition track details page and rules for all the information and registration deadlines.</p>
           	<p>The TCO10 six competition tracks:</p>
                	<ul class="textlist">
                    	<li><tco10:algorithmStaticPageLink page="rules">Algorithm Competition</tco10:algorithmStaticPageLink></li>
                    	<li><tco10:designStaticPageLink page="rules">Design Competition</tco10:designStaticPageLink></li>
                    	<li><tco10:developmentStaticPageLink page="rules">Development Competition</tco10:developmentStaticPageLink></li>
                    	<li><tco10:marathonStaticPageLink page="rules">Marathon Competition</tco10:marathonStaticPageLink></li>
                    	<li><tco10:moddashStaticPageLink page="rules">Mod Dash Competition</tco10:moddashStaticPageLink></li>
                    	<li><tco10:studioStaticPageLink page="rules">Studio Design Competition</tco10:studioStaticPageLink></li>
                    </ul>
                    <br />
           	<p>The grand finale of the TCO10 will take place at The Mirage in Las Vegas, Nevada, USA October 11 - 14, 2010.</p>
           	<p>A special thanks goes out to all the talented members who designed and help create the TCO10 website which we think is awesome!<br />
                        Logo design:  rhorea and sigit.a<br />
                        Icons design:  djnapier<br />
                        Storyboard design:  leben<br />
                        UI Prototype:  Jooc<br />
                        Leaderboard coding and Navigation edits to the Prototype:  AjJi<br />
                        Content coding:  invisiblepilot<br />
                        Wordpress skin coding:  dweng<br />
                        Assembly: isv<br /><br />
                        
                        Reviewers:<br />
                        Logo contests:  rhorea<br />
                        Icons contest:  rhorea<br />
                        Storyboard:  greenspin<br />
                        UI Prototype:  invisiblepilot, selvaa89, bohuss, YeGGo<br />
            			Assembly: snow01, cyberjag, BeBetter</p>
             		<p>We also want to thank our Event Patron NSA (linik to their landing page) and first-time sponsor Yandex (link to their landing page) for being part of the TCO10.</p>
             		<p><a href="http://www.topcoder.com/tco10?module=ViewUnifiedRegistration">Register now</a> and best of luck to you!</p>
       
       </div>
    
                </div>

                <jsp:include page="../includes/sponsors.jsp"/>

                <div class="clear"></div>
            </div>
            <!--End .mainbody-->

        </div>
        <!--End .contentInner-->
    </div>
    <!--End .content-->

    <jsp:include page="../includes/footer.jsp"/>

</div>
<!--End .wrapper-->

</body>
</html>
