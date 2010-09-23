<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Tournament Overview" area="overview" menu="happenings"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../includes/htmlhead.jsp"/>             
    <script type="text/javascript" src="/js/tournament/tco10/overview.js"></script>  
</head>

<body>

<div id="wrapper" class="homepage"><!-- the outest whole website wrapper -->

<jsp:include page="../includes/logo.jsp"/>

<div id="content">
<div class="contentInner">

<jsp:include page="../includes/menu.jsp"/>

<div id="welcome">

    <div class="crossButton"><!-- right side button -->
        <div class="comics"><a href=""></a></div>
        <div class="blog"><a href="http://topcoder.com/home/tco10/"></a></div>
        <div class="programe"><!--<a href="javascript:;"></a>--></div>
        <div class="tweet"><a href="http://topcoder.com/home/tco10/twitter/"></a></div>
        <div class="movie"><a href="http://topcoder.com/home/tco10/movies/"></a></div>
        <div class="photo"><a href="http://topcoder.com/home/tco10/photos/"></a></div>
    </div><!--End .crossButton-->

    <div class="welcomeText"><!-- left side text -->
        <h1 class="welcomeTitle">WELCOME TO THE 2010 TOPCODER OPEN!</h1>

      <p>The <span class="blue">2010 TopCoder Open</span> (TCO) is a world-wide programming and graphic design tournament that is open to all TopCoder members 18 and older, who are in good standing, and meet all other eligibility criteria. There are six competition tracks as part of the TCO: Algorithm, Design, Development, Marathon, Mod Dash, and Studio Design. Take part in the TCO10 to enhance your skills, compete against the most elite minds around the world, and for a chance at some great prizes! Becoming a TopCoder member is easy and free.  <a href="http://www.topcoder.com/reg">Register here</a>. Have a question? Just email <a href="mailto:support@topcoder.com">support@topcoder.com</a>.</p>
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
       
	     <span id="feeds_element"></span> 
       
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

