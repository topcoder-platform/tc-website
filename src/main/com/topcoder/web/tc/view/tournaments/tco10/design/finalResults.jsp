<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% SessionInfo sessionInfo = (SessionInfo) request.getAttribute(BaseServlet.SESSION_INFO_KEY); %>
<%@ page import="com.topcoder.web.common.SessionInfo" %>
<%@ page import="com.topcoder.web.common.tag.HandleTag" %>

<tco10:pageSetup title="TCO 10 : Design Competition Final Results" area="design" menu="finalResults"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../includes/htmlhead.jsp"/>
    <style type="text/css">
        a.red{color:#E00 !important;font-weight:bold;text-decoration:none;}
        a.red:hover{color:#E00 !important;text-decoration:underline;}
        a.yellow{color:#DC0 !important;font-weight:bold;text-decoration:none;}
        a.yellow:hover{color:#DC0 !important;text-decoration:underline;}
        a.blue{color:#66F !important;font-weight:bold;text-decoration:none;}
        a.blue:hover{color:#66F !important;text-decoration:underline;}
        a.white{color:#fff !important;font-weight:bold;text-decoration:none;}
        a.white:hover{color:#fff !important;text-decoration:underline;}
        a.green{color:#00A900 !important;font-weight:bold;text-decoration:none;}
        a.green:hover{color:#00A900 !important;text-decoration:underline;}
    </style>    
</head>

<body>

<div id="wrapper" class="homepage singlePage"><!-- the outest whole website wrapper -->

    <jsp:include page="../includes/logo.jsp"/>

    <div id="content">
        <div class="contentInner">

            <jsp:include page="../includes/menu.jsp"/>

            <div id="mainbody" class="singleMainBody"><!-- below menu ,main content -->
                <span class="leftTop"></span><!-- main content left top corner -->
                <span class="rightTop"></span><!-- main content right top corner -->
                <span class="leftBottom"></span><!-- main content left bottom corner -->
                <span class="rightBottom"></span><!-- main conent right bottom corner -->

                <jsp:include page="subMenu.jsp"/>

                <div class="bigColumn" style="margin-bottom:30px">
                    <div class="text">
                        <h2 class="pageTitle">Design Competition Final Results</h2><!-- page title -->
                        <p>The 2010 TopCoder Open Design Competition brought together competitors from many of our
                            design-oriented tracks: Architecture, Component Design, Conceptualization, Specification,
                            and Testing Scenarios. Competition was fierce, with more than 20 competitors earning over
                            1,000 placement points. Designers were required to document their solutions to varying
                            problems, from system design down to test case implementation. The top bracket of designers
                            each submitted over ten projects! This year saw impressive TCO debuts from new designers -
                            <a class="blue" href="http://www.topcoder.com/tc?module=MemberProfile&cr=22841197&tab=des">iogy</a>,
                            <a class="blue" href="http://www.topcoder.com/tc?module=MemberProfile&cr=22674711&tab=des">faeton</a> and
                            <a class="yellow" href="http://www.topcoder.com/tc?module=MemberProfile&cr=22846687&tab=des">mekanizumu</a> all
                            broke into the top ten on their first major outing! However, this year was dominated by
                            heavy hitting veterans - past winners <a class="yellow" href="http://www.topcoder.com/tc?module=MemberProfile&cr=310233&tab=des">Standlove</a>, <a class="yellow" href="http://www.topcoder.com/tc?module=MemberProfile&cr=252022&tab=des">AleaActaEst</a> and
                            <a class="red" href="http://www.topcoder.com/tc?module=MemberProfile&cr=21932422&tab=des">saarixx</a> all
                            made strong runs at the top spot. It was frequent finalist <a class="yellow" href="http://www.topcoder.com/tc?module=MemberProfile&cr=287614&tab=des">argolite</a> who took the
                            championship, submitting over 30 projects for over 12,000 points!</p>

                        <h2 class="pageTitle">Congratulations to argolite, our 2010 TopCoder Open Design Competition
                            Champion!</h2>

                        <div style="float: left"><br/><img src="/i/tournament/tco10/result/design.jpg" alt="argolite"
                                                           style="margin: 0 10px 3px 0"/></div>
                        <h3 class="subTitle">Michael Paweska<br/>
                            <em>Canada</em></h3>

                        <p>I work fulltime on TopCoder components, participating in Design and Architecture tracks. When
                            I'm not sitting by the computer, I like to watch tv, play video games, or read a good book,
                            but above all, I like to do walks and hiking, and generally get outside. I live in Toronto,
                            Ontario, where the winters are getting warmer, spring and fall have become just memories,
                            and summer has been renamed the oven season. Just like everywhere else. A combination of
                            determination and luck got me through the TCO10. I began the TCO with intent to be in the
                            top 2, and set aside the time for 4 months to make it work. I think there is no other way to
                            do it. So for that period of time, it became an overtime effort, having everything revolve
                            around it. It became important to look out for projects that offered many competitions (such
                            as the Ilium and COBOL projects), and try to dominate them for TCO points. Things went very
                            well, and I also had several fortuitous competitions where no one else submitted, allowing
                            me to garner all the TCO points for them.</p>
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
