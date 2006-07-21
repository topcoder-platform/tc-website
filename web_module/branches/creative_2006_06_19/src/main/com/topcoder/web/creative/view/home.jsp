<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>TopCoder Studio</title>

<jsp:include page="style.jsp">
    <jsp:param name="key" value="tc_creative"/>
</jsp:include>
</head>

<body>

<jsp:include page="creativeTop.jsp">
    <jsp:param name="section" value="default"/>
</jsp:include>

<jsp:include page="creativeLeft.jsp">
    <jsp:param name="node" value="home"/>
</jsp:include>

<div class="contentOuter">
   <div class="contentInner">
      <div align="center">
      <div style="width:700px; min-height:500px;" align="left">
      <div style="margin-bottom:15px;"><img src="/i/creative/home/bnr_topcoder_studio.png" alt="TopCoder Studio" /></div>

      <div style="float:left; width:284px; padding: 0px 10px 10px 0px; margin: 0px 10px 10px 0px; border-right: 1px dashed #CCCCCC;">
         <A href="/?module=Static&d1=support&d2=artGetStarted"><img src="/i/creative/home/bnr_artists.png" alt="Register" /></A><br>
         <A href="/?module=Static&d1=support&d2=custGetStarted"><img src="/i/creative/home/bnr_customers.png" alt="Get Creative" style="margin-top: 10px;"/></A><br>

         <div class="sideboxOuter">
            <div class="sideboxInner">

            </div>
         </div>

      </div>

      <h2>TopCoder Studio</h2>
      Lorem ipsum dolor sit amet, <A href="#">consetetur</A> sadipscing elitr, sed diam nonumy eirmod tempor
      invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo
      dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
      Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut
      labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et
      ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum
      dolor sit amet, consetetur sadipscing elitr.
      <br><br>
      <h3>For Designers</h3>
      Lorem ipsum dolor sit amet, <A href="#">consetetur</A> sadipscing elitr, sed diam nonumy eirmod tempor
      invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo
      dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
      Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut
      labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et
      ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum
      dolor sit amet, consetetur sadipscing elitr.
      <br><br>
      <h3>For Customers</h3>
      Lorem ipsum dolor sit amet, <A href="#">consetetur</A> sadipscing elitr, sed diam nonumy eirmod tempor
      invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo
      dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
      Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut
      labore et dolore magna aliquyam erat, sed diam voluptua.
   </div>
</div>

        <jsp:include page="/creativeFoot.jsp"/>
    </div>
</div>
</body>
</html>
