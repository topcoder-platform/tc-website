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

      <h1>Submit Your Design</h1>

      <div align="center">
         <div align="left" style="width:500px;">
            Thank you for accepting the terms of the contest. Please use the form below to upload your submission:
            <br><br>
            The maximum file size per submission is X MB.
            <br><br>

            <div align="center">
               <form action="/?module=Static&d1=submissionSuccess" method="POST" name="submission">
               <b>My design:</b><br><input type="file" name="">
               <br><br>
               <button name="submit" value="submit" type="submit">Submit</button>
               <br><br>
               <span class="bigRed">Error text</span>
               </form>
            </div>

         </div>
      </div>
   
      <jsp:include page="/creative_foot.jsp" />
   </div>
</div>
</body>
</html>
