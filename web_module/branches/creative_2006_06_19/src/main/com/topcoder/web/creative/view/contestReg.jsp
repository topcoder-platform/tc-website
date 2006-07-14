<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
   <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <title>TopCoder FX</title>
   <link type="text/css" rel="stylesheet" href="/css/creative/main.css">
   <link type="text/css" rel="stylesheet" href="/css/creative/stats.css">
   <link type="text/css" rel="stylesheet" href="/css/creative/coders.css">
</head>

<body>

<jsp:include page="/creative_top.jsp">
   <jsp:param name="section" value="default"/>
</jsp:include>

<jsp:include page="/creative_left.jsp">
   <jsp:param name="node" value="home"/>
</jsp:include>

<div class="content">

   <div style="padding:20px;">

      <div class="linkBox"><A href="">discuss this</A></div>
      <div class="breadcrumb">
         <A href="/?module=Static&d1=activeContests">Active Contests</A>
          > Contest Name
      </div>

      <h1>Contest Registration</h1>

      <div align="center">
            Please read through the following terms and then click  <strong>"I Accept"</strong> when you're done.
            <br><br>
            <form name="terms" method="POST" action="/?module=Static&d1=submit">

            <iframe width="590" height="300" marginWidth="5" src="/?module=Static&d1=contestRegContent"></iframe>

            <br><br>
            <!-- could also use <input>'s button <button> gives you more display freedom and is documented on w3c -->
            <!-- resulting page from click has value at the end of the URL, which is pointless.  Feel free to use any html/js element/method but i want the nice looking button -->
            <button name="submit" value="submit" type="submit">I Accept</button>
            <br><br>
            <span class="bigRed">Error text</span>
            </form>
      </div>
   
      <jsp:include page="/creative_foot.jsp" />
   </div>
</div>
</body>
</html>
