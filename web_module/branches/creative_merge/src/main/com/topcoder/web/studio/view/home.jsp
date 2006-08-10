<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
</head>

<body>

<div align="center">
   <div class="contentOut">
      <jsp:include page="top.jsp">
          <jsp:param name="section" value="default"/>
      </jsp:include>
      <jsp:include page="topNav.jsp">
          <jsp:param name="node" value="home"/>
      </jsp:include>
      <div class="contentIn">
         <img src="/i/studio/layout/contentInN.gif" alt="" style="display:block;" />
         <div class="contentSpacer">


         Welcome to TopCoder Studio - the best place on the web for showing off your creative skills in a competitive environment and getting paid for being the best!  At the Studio, clients post their projects with definitive timelines, deliverables and payouts, and you decide which ones pique your interest.  There's even advancement opportunities available into the Review Board, where a select group of competing members will evaluate all submissions before they are passed on to the client.  So, poke around, ask questions and, above all, compete and have fun!

         <div align="center">
         <table cellpadding="0" cellspacing="0">
            <tr>
               <td><A href="/?module=Static&d1=support&d2=getStarted"><img src="/i/studio/home/need_help.gif" alt="Need help?" /></A></td>
               <td><A href="/?module=Static&d1=support&d2=getStarted"><img src="/i/studio/home/need_help.gif" alt="Need help?" /></A></td>
               <td><A href="/?module=Static&d1=support&d2=getStarted"><img src="/i/studio/home/need_help.gif" alt="Need help?" /></A></td>
            </tr>
         </table>
         </div>

         </div>
         <img src="/i/studio/layout/contentInS.gif" alt="" style="display:block;" />
      </div>
      <jsp:include page="foot.jsp"/>
      <img src="/i/studio/layout/contentOutS.gif" alt="" style="display:block;"/>
   </div>
</div>

</body>
</html>