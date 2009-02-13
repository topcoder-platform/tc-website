<%--
<%@ page import="com.topcoder.web.reg.Constants"%>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Registration</title>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_reg"/>
    </jsp:include>
</head>

<body>
<div align="center">
   <div style="padding: 0px 10px 10px 10px; width: 550px; text-align: left;">

     <jsp:include page="/page_title.jsp">
         <jsp:param name="image" value="registration_w"/>
         <jsp:param name="title" value="&#160;"/>
     </jsp:include>

   <div>
      <strong>A Message from the TopCoder Founder</strong>
      <br><br>
      Welcome to TopCoder. Before you register, there are a few things we think you should know:  First, and most importantly, TopCoder is a commercial
      site.  We charge sponsors for the right to advertise on our site.  This money pays for the operation of the site and the prizes awarded in competitions.
      <br><br>
      This has several implications. Because we feel it is our obligation to let our sponsors know who their message is reaching, we collect as much
      demographic information as possible without making the Registration process overly burdensome.  Furthermore, we require that you verify the accuracy of
      the information you provide.  This does not mean that sponsors have access to your personal information; in general, they do
      not. In certain circumstances such as participating in or opting in to certain events,
      sponsors will be given access to view your demographic information, educational and work
      experience (if provided by you), and contact information.
      <br><br>
      While we believe that sponsors have every right to expect that what we give them is accurate and valuable, we also believe that they must bring more
      than just money to our member base.  We want sponsors who provide true value to developers.  TopCoder intends to help developers increase their skill
      level as well as increase their value to employers. Therefore, we are careful to choose sponsors that represent this philosophy.
      <br><br>
      We are also very strict about the way in which sponsors present themselves to the member base&#151;no annoying banners, pop-ups, etc. We work with
      sponsors to get their message across in an appealing and non-intrusive manner.  Because we take our relationship with sponsors seriously, we
      believe that they have value to provide.  We ask that you listen to what they have to say.
      <br><br>
      Let me be the first to say good luck in the arena.
      <br><br>
      <em>Jack Hughes<br>
      Founder and Chairman, TopCoder, Inc.</em>
   </div>
</div>

<br><br>
</body>
</html>
--%>

<%@ page import="com.topcoder.shared.util.ApplicationServer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>TC Home</title>
        <script type="text/javascript" src="/js/regReskin20080904.js"></script>
        <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
        <jsp:include page="style.jsp">
            <jsp:param name="key" value="tc_reg"/>
        </jsp:include>
    </head>
    
    <body>
        
        <div id="wrapper">
        
            <div id="box-head">
                <jsp:include page="header.jsp" />
                <div id="page-head">
                    <h3><strong>A Message from the TopCoder Founder</strong></h3>
                </div>
            </div>
            
            <div id="box-body">
                <%--
                <p class="padded center">
                    <a href="tc_login.jsp">TC Login</a> | 
                    <a href="studio_home.jsp">Studio Home</a> | 
                    <a href="signup_type.jsp">Register Now</a>
                </p>
                --%>
                <br />
                <p>Welcome to TopCoder. Before you register, there are a few things we think you should know:  First, and most importantly, TopCoder is a commercial
                site.  We charge sponsors for the right to advertise on our site.  This money pays for the operation of the site and the prizes awarded in competitions.</p>
                
                <p>This has several implications. Because we feel it is our obligation to let our sponsors know who their message is reaching, we collect as much
                demographic information as possible without making the Registration process overly burdensome.  Furthermore, we require that you verify the accuracy of
                the information you provide.  This does not mean that sponsors have access to your personal information; in general, they do
                not. In certain circumstances such as participating in or opting in to certain events,
                sponsors will be given access to view your demographic information, educational and work
                experience (if provided by you), and contact information.</p>
                
                <p>While we believe that sponsors have every right to expect that what we give them is accurate and valuable, we also believe that they must bring more
                than just money to our member base.  We want sponsors who provide true value to developers.  TopCoder intends to help developers increase their skill
                level as well as increase their value to employers. Therefore, we are careful to choose sponsors that represent this philosophy.</p>
                
                <p>We are also very strict about the way in which sponsors present themselves to the member base&#151;no annoying banners, pop-ups, etc. We work with
                sponsors to get their message across in an appealing and non-intrusive manner.  Because we take our relationship with sponsors seriously, we
                believe that they have value to provide.  We ask that you listen to what they have to say.</p>
                
                <p>Let me be the first to say good luck in the arena.</p>
                
                <p><em>Jack Hughes<br />
                Founder and Chairman, TopCoder, Inc.</em></p>
            </div>
            <jsp:include page="footer.jsp" />
            
        </div>
        
    </body>
</html>
