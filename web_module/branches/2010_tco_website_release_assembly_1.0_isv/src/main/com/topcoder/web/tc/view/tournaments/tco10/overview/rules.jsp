<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Official Rules &amp; Regulations" area="overview" menu="rules"/>

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

            <div id="mainbody" class="singleMainBody"><!-- below menu ,main content -->
                <span class="leftTop"></span><!-- main content left top corner -->
                <span class="rightTop"></span><!-- main content right top corner -->
                <span class="leftBottom"></span><!-- main content left bottom corner -->
                <span class="rightBottom"></span><!-- main conent right bottom corner -->

                <jsp:include page="subMenu.jsp"/>

                <div class="bigColumn">
                    <div class="text">
                        <h2 class="pageTitle">Official Rules & Regulations</h2><!-- page title -->
                        <p>
                        <div class="section">
                            <div class="rules">
                                <div class="text">
                                    <p>
                                        Below are the TCO10 Rules. For rules on each section please see the specific
                                        tracks.
                                    </p>

                                    <p>
                                        <tco10:algorithmStaticPageLink page="rules">Algorithm</tco10:algorithmStaticPageLink> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                        <tco10:marathonStaticPageLink page="rules">Marathon</tco10:marathonStaticPageLink><br/>
                                        <tco10:designStaticPageLink page="rules">Design</tco10:designStaticPageLink> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                        <tco10:moddashStaticPageLink page="rules">Mod Dash</tco10:moddashStaticPageLink><br/>
                                        <tco10:developmentStaticPageLink page="rules">Development</tco10:developmentStaticPageLink> &nbsp; &nbsp; &nbsp; &nbsp;
                                        <tco10:studioStaticPageLink page="rules">Studio</tco10:studioStaticPageLink>
                                    </p>
                                </div>
                            </div>
                        </div>
                        </p>
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
