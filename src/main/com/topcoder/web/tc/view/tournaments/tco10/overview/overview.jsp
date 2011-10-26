<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Tournament Overview" area="overview" menu="happenings"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../includes/htmlhead.jsp"/>
    <script type="text/javascript" src="/js/tournament/tco10/overview.js"></script>
    <style type="text/css">
        a.red{color:#E00 !important;font-weight:bold;text-decoration:none;}
        a.red:hover{color:#E00 !important;text-decoration:underline;}
        a.yellow{color:#DC0 !important;font-weight:bold;text-decoration:none;}
        a.yellow:hover{color:#DC0 !important;text-decoration:underline;}
        a.blue{color:#66F !important;font-weight:bold;text-decoration:none;}
        a.blue:hover{color:#66F !important;text-decoration:underline;}
        a.white{color:#fff !important;font-weight:bold;text-decoration:none;}
        a.white:hover{color:#fff !important;text-decoration:underline;}
    </style>    
</head>

<body>

<div id="wrapper" class="homepage"><!-- the outest whole website wrapper -->

    <jsp:include page="../includes/logo.jsp"/>

    <div id="content">
        <div class="contentInner">

            <jsp:include page="../includes/menu.jsp"/>

            <div id="welcome">

                <div class="crossButton"><!-- right side button -->
                    <div class="comics"><a href="http://topcoder.com/home/tco10/comics/"></a></div>
                    <div class="blog"><a href="http://topcoder.com/home/tco10/"></a></div>
                    <div class="programe"><a href="http://topcoder.com/i/tournament/tco10/TCO10-Program.pdf"></a></div>
                    <div class="tweet"><a href="http://topcoder.com/home/tco10/twitter/"></a></div>
                    <div class="movie"><a href="http://topcoder.com/home/tco10/movies/"></a></div>
                    <div class="photo"><a href="http://topcoder.com/home/tco10/photos/"></a></div>
                </div>
                <!--End .crossButton-->

                <div class="welcomeText"><!-- left side text -->
                    <h1 class="welcomeTitle">Congratulations to the 2010 TopCoder Open Champions!</h1>

                    <div style="float: left;margin-right:10px;"><img src="/i/tournament/tco10/result/overview.jpg"
                                                                     alt=""/></div>

                    <p>Algorithm Champion: <a class="red" href="http://www.topcoder.com/tc?module=MemberProfile&cr=22692969">rng_58</a><br/>
                        Design Champion: <a class="yellow" href="http://www.topcoder.com/tc?module=MemberProfile&cr=287614">argolite</a><br/>
                        Development Champion: <a class="yellow" href="http://www.topcoder.com/tc?module=MemberProfile&cr=15604762">Yeung</a><br/>
                        Marathon Champion: <a class="red" href="http://www.topcoder.com/tc?module=MemberProfile&cr=22689544">wata</a><br/>
                        Mod Dash Champion: <a class="blue" href="http://www.topcoder.com/tc?module=MemberProfile&cr=22651137">Margarita</a><br/>
                        Studio Champion: <a class="white" href="http://studio.topcoder.com/?module=ViewMemberProfile&ha=djackmania">djackmania</a>
                    </p>


                    <iframe src="http://www.facebook.com/plugins/like.php?href=http%3A%2F%2Fwww.facebook.com%2Fpages%2FTopCoder-Open%2F153496624686456&amp;layout=button_count&amp;show_faces=true&amp;width=450&amp;action=like&amp;colorscheme=dark&amp;height=21"
                            scrolling="no" frameborder="0"
                            style="border:none; overflow:hidden; width:450px; height:21px;"
                            allowTransparency="true"></iframe>
                </div>
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

