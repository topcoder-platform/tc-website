<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<%@ page import="com.topcoder.web.common.SessionInfo" %>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% SessionInfo sessionInfo = (SessionInfo)request.getAttribute(BaseServlet.SESSION_INFO_KEY); %>
<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="com.topcoder.web.common.tag.HandleTag" %>

<tco10:pageSetup title="TCO 10 : Development Competition Final Results" area="development" menu="finalResults"/>

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
                    <h2 class="pageTitle">Development Competition Final Results</h2>
                    <!-- page title -->
                            <p>The 2010 TopCoder Open Development Competition brought together competitors from our development contests: Assembly, Component Development, Prototypes, and Testing Suites. &nbsp;Developers were required to implement designs in each of these tracks, over a broad variety of technology platforms including cutting-edge web and mobile offerings. &nbsp;Our most prolific developers submitted on a huge number of projects - <tc-webtag:handle coderId="22678937" context="<%=HandleTag.DEVELOPMENT%>" darkBG="true" /> turned in 40 submissions, while <tc-webtag:handle coderId="22847777" context="<%=HandleTag.DEVELOPMENT%>" darkBG="true" /> turned in a whopping 54!&nbsp; Bringing prototypes into this year&rsquo;s TCO also allowed our Studio web developers a foothold - <tc-webtag:handle coderId="22503298" context="<%=HandleTag.DEVELOPMENT%>" darkBG="true" /> made the top 10 exclusively submitting prototypes, and <tc-webtag:handle coderId="22847777" context="<%=HandleTag.DEVELOPMENT%>" darkBG="true" /> heavily favored HTML and JavaScript projects. &nbsp;Still, our hardcore coders put in a great showing with both Java and .NET developers making the top slots &ndash; <tc-webtag:handle coderId="15604762" context="<%=HandleTag.DEVELOPMENT%>" darkBG="true" /> favoring almost entirely .NET and <tc-webtag:handle coderId="22630348" context="<%=HandleTag.DEVELOPMENT%>" darkBG="true" /> preferring Java.&nbsp; In the end, <tc-webtag:handle coderId="15604762" context="<%=HandleTag.DEVELOPMENT%>" darkBG="true" /> managed to secure the win by netting over 14,000 points!</p>
<h2 class="pageTitle">Congratulations to Yeung, our 2010 TopCoder Open Development  Competition Champion!</h2>
                            
                      <div style="float: left"><br /><img src="http://www.topcoder.com/i/m/Yeung_big.jpg" alt="Yeung" style="margin: 0 10px 3px 0" /></div>
                        <h3 class="subTitle">Yang Lee<br />
                      <em>China</em></h3>
                        <p>TopCoder is my full time job now. I live in Zhongshan, a small city in China. I like to sleep, watch movies, and travel.&nbsp; I made it to the TCO thanks to Ilium. This was a huge project and it was a little complicated. So not many people were competing. Ilium is my lucky charm in TCO 2010.<br /><br /><br /><br /><br /><br /></p>
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
