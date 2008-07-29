<%@ page import="com.topcoder.web.winformula.Constants" %>
<%@ page import="com.topcoder.web.winformula.model.PrizeType" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="winformula.tld" prefix="winformula" %>
<c:set var="clientPrize" value="<%=PrizeType.BONUS%>"/>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>ESPN Winning Formula Challenge :: Powered by TopCoder - Register</title>
    <%-- Meta Tags --%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_winformula"/>
    </jsp:include>
</head>

<body>
    <div id="wrapper">
    <%-- Wrapper --%>
    
        <jsp:include page="nav.jsp">
        <jsp:param name="tabLev1" value="register" />
        <jsp:param name="tabLev2" value="" />
        <jsp:param name="tabLev3" value="" />
        </jsp:include>
        
        <div id="container">
        <%-- Container --%>
        <div id="main-content">
        <%-- Main Content --%>
        
        
            <h1>Register</h1>
            <div class="full-content">
                <%--
                <p class="note">[If a user is not logged in they will  see this <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=login">login page</a>.]</p>
                --%>
                <p>Registration for the Winning Formula Challenge is FREE! Simply read and agree to the terms and conditions below and click <strong>Register Now</strong>.</p>
                <h2>Terms &amp; conditions of the Winning Formula Challenge</h2>
                <p>Suspendisse vitae nisi et dolor posuere scelerisque. Vivamus ornare est sit amet leo. Sed tincidunt, risus nec ultrices elementum, justo tellus volutpat risus, in dapibus eros nibh quis felis. Praesent a ante id tortor porta vehicula. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam scelerisque ante non nunc. Duis vehicula, ante at mollis facilisis, risus turpis vulputate dolor, a commodo felis arcu et erat. Suspendisse quis quam et lacus interdum ullamcorper. Suspendisse euismod ultrices elit. Curabitur malesuada dictum pede.</p>
                <p>Pellentesque lacinia elit quis odio. Aliquam egestas tortor ut nisi. Mauris sit amet felis. Nunc ac erat. Pellentesque rhoncus, tellus non feugiat dictum, urna metus ullamcorper ipsum, a volutpat lectus massa consectetuer erat. Morbi condimentum augue non augue. Mauris felis tellus, semper et, cursus vitae, venenatis a, felis. Morbi ac leo ac quam vestibulum ornare. Curabitur vitae eros eu ipsum sodales posuere. Integer vel ante. Praesent vitae enim ac nisl feugiat vehicula. Aliquam blandit, ligula sit amet interdum vehicula, pede sem lobortis lacus, eget accumsan ante mauris eget velit. Duis ut neque sit amet neque ornare consequat. Phasellus nec lacus eget libero fringilla semper. Donec feugiat, metus eget gravida bibendum, est mauris sagittis mi, vel gravida est orci quis metus. Curabitur nisi quam, convallis eget, rhoncus eu, eleifend et, arcu. Sed cursus. Pellentesque semper. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Fusce luctus, leo sit amet congue semper, augue tellus vulputate odio, vitae pharetra est tortor eget libero.</p>
                <p>In porttitor, ipsum vel pulvinar iaculis, lectus ligula dignissim purus, non vulputate elit libero id sapien. Sed viverra. Duis bibendum, nunc ut pellentesque placerat, elit risus venenatis orci, quis adipiscing justo lectus egestas leo. Proin quis urna. Aliquam a quam. Praesent odio. Cras pharetra magna sed mauris. Nunc vestibulum. Donec elementum ante at neque. Quisque nibh. Aliquam tincidunt sagittis diam. Pellentesque interdum magna. Nulla facilisi. Suspendisse sit amet nulla. </p>
                <p>Etiam rutrum pretium tortor. Nam ullamcorper congue arcu. Phasellus a augue. Curabitur molestie justo quis sapien. Ut ante elit, vestibulum vel, iaculis vitae, gravida a, orci. Morbi urna. Morbi sed ipsum. Morbi dui lacus, convallis et, luctus ac, feugiat ut, felis. Suspendisse leo ante, fermentum non, vehicula non, blandit in, lectus. Aliquam semper tincidunt erat. Suspendisse condimentum, neque sed cursus rutrum, purus quam aliquam est, ac fermentum pede velit commodo felis. In hac habitasse platea dictumst. Proin varius, nulla in aliquet mollis, quam enim ultrices quam, at ornare velit lorem id sem. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Phasellus libero.</p>
                    <form id="form1" name="form1" method="post" action="" class="formRegister">
                    <input type="checkbox" name="terms" id="terms" />
                    <strong>
                        <label for="terms">I have read and agree to terms &amp; conditions</label>
                    </strong>
                    <label for="terms"></label>
                <p class="wrapperBtnAgree">
                <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=downloadStats" class="learnButton" title="Register Now!"><span>Register Now!</span></a>
              </p>
            </form>
            </div>
        
        <%-- Main Content --%>
        </div>
        <%-- End Container --%>
        </div>

    <div id="footer">
    <%-- Footer --%>
    </div>
    
<%-- End Wrapper --%>
</div>
</body>
</html>