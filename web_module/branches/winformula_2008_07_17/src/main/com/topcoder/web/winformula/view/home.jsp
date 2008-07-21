<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>Winformula Developer Challenge :: Powered by TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_winformula"/>
    </jsp:include>

    <script type="text/javascript">
        function preloadTabs() {
            var img = new Image();
            img.src = '/i/events/winformula/tabs/registerOn.png';
            img.src = '/i/events/winformula/tabs/submitOn.png';
            img.src = '/i/events/winformula/tabs/apisOn.png';
            img.src = '/i/events/winformula/tabs/discussOn.png';
        }
    </script>
</head>

<body>

<jsp:include page="tcTop.jsp"/>


<div align="center">
    <div id="aimFrame">
        <div id="aimFrameN">
            <div id="aimFrameS">
                <jsp:include page="winformulaTop.jsp"/>

                <div class="content" align="right">
                    <div class="contentTexture">
                        <jsp:include page="topNav.jsp"/>
                        <div class="siteBoxFull">
                            <h1>Home</h1>
                            <p align="left">
                            Marketing language about this contest. Duis in est sit amet nibh malesuada facilisis. Suspendisse vitae nibh. Pellentesque ornare tristique purus. Nam placerat, purus ultrices tincidunt tempus, leo nisi sollicitudin ligula, et suscipit leo magna a dolor. Suspendisse laoreet malesuada odio. Suspendisse blandit. Etiam congue, sapien mollis aliquam ullamcorper, purus elit adipiscing eros, sed molestie tellus sem vel quam. Nullam et metus. Duis blandit. Vivamus sed mauris eu nisi iaculis facilisis. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Phasellus lobortis, nulla sit amet molestie vehicula, eros arcu egestas nunc, sit amet lobortis diam erat ac eros. Aliquam erat volutpat.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="tcFoot.jsp"/>

</body>

</html>