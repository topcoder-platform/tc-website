<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Studio Competition Guest Judges" area="studio" menu="advancers" subMenu="judges"/>

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
                    <h2 class="pageTitle">Studio Guest Judges</h2>
                    <!-- page title -->
                            <p>In addition to TopCoder staff, the following industry experts will share their talents as guest judges for the 2010 TopCoder Open Studio Semifinal Rounds and the Championship Round.&nbsp;<br />
                      </p>
                            
                      <div style="float: left"><img src="http://www.topcoder.com/i/tournament/tco10/judges/mcclain.png" alt="Nathan McClain" style="margin: 0 10px 3px 0" /></div>
                    <h3 class="subTitle">Nathan McClain <br />
                    <em>Chicago, USA</em></h3>
                    <p>Nathan McClain has been working in the creative arts for nearly 15 years with experience in digital media, advertising, print making, and photography. Nathan's favorite pastimes are engaging in conversation beyond his capacity and setting land speed records.</p>
                    <p>In his spare time he has a rewarding career at <a href="http://www.arcww.com/" target="_blank">Arc Worldwide</a> as a creative director. Arc believes &quot;that everything that matters begins and ends with People and Behavior. We seek to identify a human behavior at the root. We believe creativity has the power to transform that human behavior. Or simply - we move people.&quot; Arc Worldwide is the marketing arm of the Leo Burnett Corporation with clients ranging from Coca-Cola. Procter &amp; Gamble, Allstate, Blackberry, Miller-Coors, and many others.</p>
                      <div style="float: left"><img src="http://www.topcoder.com/i/tournament/tco10/judges/foetsch.png" alt="Melissa Foetsch" style="margin: 0 10px 3px 0" /></div>
                    <h3 class="subTitle" style="list-style-image:none">Melissa Foetsch<br />
                    <em>New York City, USA</em></h3>
                    <p>Melissa Foetsch is a User Experience Design practitioner based in the Greater New York City area. She is currently the lead Information Architect supporting IBM's Cloud Computing initiative. In addition to many years of agency and software industry expertise, Melissa is also a traditionally trained graphic designer with an eye for good design.
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br /></p>

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
