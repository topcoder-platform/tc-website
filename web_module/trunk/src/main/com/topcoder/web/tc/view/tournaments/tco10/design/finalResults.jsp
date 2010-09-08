<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<%@ page import="com.topcoder.web.common.SessionInfo" %>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% SessionInfo sessionInfo = (SessionInfo)request.getAttribute(BaseServlet.SESSION_INFO_KEY); %>
<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="com.topcoder.web.common.tag.HandleTag" %>

<tco10:pageSetup title="TCO 10 : Design Competition Final Results" area="design" menu="finalResults"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../includes/htmlhead.jsp"/>
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

                <div class="bigColumn">
                    <div class="text">
                    <h2 class="pageTitle">Design Competition Final Results</h2><!-- page title -->
                            <p>The 2010 TopCoder Open Design Competition brought together competitors from many of our design-oriented tracks: Architecture, Component Design, Conceptualization, Specification, and Testing Scenarios. Competition was fierce, with more than 20 competitors earning over 1,000 placement points.  Designers were required to document their solutions to varying problems, from system design down to test case implementation.  The top bracket of designers each submitted over ten projects!  This year saw impressive TCO debuts from new designers - <tc-webtag:handle coderId="22841197" context="<%=HandleTag.DESIGN%>" darkBG="true" />, <tc-webtag:handle coderId="22674711" context="<%=HandleTag.DESIGN%>" darkBG="true" /> and <tc-webtag:handle coderId="22846687" context="<%=HandleTag.DESIGN%>" darkBG="true" /> all broke into the top ten on their first major outing!  However, this year was dominated by heavy hitting veterans - past winners <tc-webtag:handle coderId="310233" context="<%=HandleTag.DESIGN%>" darkBG="true" />, <tc-webtag:handle coderId="252022" context="<%=HandleTag.DESIGN%>" darkBG="true" /> and <tc-webtag:handle coderId="21932422" context="<%=HandleTag.DESIGN%>" darkBG="true" /> all made strong runs at the top spot.  It was frequent finalist <tc-webtag:handle coderId="287614" context="<%=HandleTag.DESIGN%>" darkBG="true" /> who took the championship, submitting over 30 projects for over 12,000 points!</p>
                     	<h2 class="pageTitle">Congratulations to argolite, our 2010 TopCoder Open Design Competition Champion!</h2>
                            
                        <div style="float: left"><br /><img src="http://www.topcoder.com/i/m/argolite_big.jpg" alt="argolite" style="margin: 0 10px 3px 0" /></div>
                        <h3 class="subTitle">Michael Paweska<br />
                       <em>Canada</em></h3>
                        <p>I work fulltime on TopCoder components, participating in Design and Architecture tracks. When I'm not sitting by the computer, I like to watch tv, play video games, or read a good book, but above all, I like to do walks and hiking, and generally get outside. I live in Toronto, Ontario, where the winters are getting warmer, spring and fall have become just memories, and summer has been renamed the oven season. Just like everywhere else.  A combination of determination and luck got me through the TCO10. I began the TCO with intent to be in the top 2, and set aside the time for 4 months to make it work. I think there is no other way to do it. So for that period of time, it became an overtime effort, having everything revolve around it. It became important to look out for projects that offered many competitions (such as the Ilium and COBOL projects), and try to dominate them for TCO points. Things went very well, and I also had several fortuitous competitions where no one else submitted, allowing me to garner all the TCO points for them.</p>
                        

                    
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
