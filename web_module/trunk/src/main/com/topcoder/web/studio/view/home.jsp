<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="studio.tld" prefix="studio" %>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>

	<script src="http://www.google-analytics.com/urchin.js" type="text/javascript"> </script> 
	<script type="text/javascript"> _uacct = "UA-321688-2"; urchinTracker(); </script>
</head>

<body>

<div align="center">
   <div class="contentOut">
      <jsp:include page="top.jsp" />
      <jsp:include page="topNav.jsp">
          <jsp:param name="node" value="home"/>
      </jsp:include>
      <div class="contentIn">
         <img src="/i/layout/contentInN.gif" alt="" style="display:block;" />
         <div class="contentSpacer">

<table cellpadding="0" cellspacing="0" style="width:740px;">
<tbody>
   <tr>
      <td style="padding: 0px 10px 0px 0px; border-right: 1px dashed #999999;">
         <div>
         <A href="https://<%=ApplicationServer.SERVER_NAME%>/reg/"><img src="/i/home/register_now.gif" alt="Register now" /></A>
         </div>
         <div>
         <A href="/?module=Static&d1=support&d2=getStarted"><img src="/i/home/need_help.gif" alt="Need help?" /></A>
         </div>
         <div>
         <A href="/?module=Static&d1=contactUs"><img src="/i/home/post_project.gif" alt="Post a project" /></A>
         </div>
      </td>
      <td valign="top" style="padding-left: 10px;">

         <h1>Welcome to TopCoder Studio</h1>
         Welcome to TopCoder Studio - the best place on the web for showing off your creative skills in a competitive environment and getting paid for being the best! 
         <br><br>
         At the Studio, clients post their projects with definitive timelines, deliverables and payouts, and you decide which ones pique your interest. There are even advancement opportunities available into the Review Board, where a select group of competing members will evaluate all submissions before they are passed on to the client. 
         <br><br>
         So, poke around, ask questions and, above all, compete and have fun! 
         <br><br>
         <h2><A href="/?module=ViewActiveContests">Contests available now!</A></h2>
         <A href="https://<%=ApplicationServer.SERVER_NAME%>/reg/">Register</A> as a Studio member so you can receive emails when new contests arrive.

<%--
         <br><br>
         <table cellpadding="0" cellspacing="0" class="stat" style="width:485px;">
         <tbody>
            <tr>
               <td class="NW">&nbsp;</td>
               <td class="title" colspan="3">
               Recent Winners
               </td>
               <td class="NE">&nbsp;</td>
            </tr>
            <tr>
               <td class="headerW"><div>&nbsp;</div></td>
               <td class="header">
               Winner
               </td>
               <td class="header">
               Contest
               </td>
               <td class="headerR">
               Prize
               </td>
               <td class="headerE"><div>&nbsp;</div></td>
            </tr>
            <% boolean even = true;%>
            <tr class="<%=even?"light":"dark"%>">
               <td class="valueW"><div>&nbsp;</div></td>
               <td class="value">
               <studio:handle coderId="119676"/>
               </td>
               <td class="value">
               <A href="">TCHS 07 Logo Contest</A>
               </td>
               <td class="valueR">
               $500.00
               </td>
               <td class="valueE"><div>&nbsp;</div></td>
            </tr>
            <% even = !even;%>
            <tr class="<%=even?"light":"dark"%>">
               <td class="valueW"><div>&nbsp;</div></td>
               <td class="value">
               <studio:handle coderId="119676"/>
               </td>
               <td class="value">
               <A href="">TCHS 07 Logo Contest</A>
               </td>
               <td class="valueR">
               $500.00
               </td>
               <td class="valueE"><div>&nbsp;</div></td>
            </tr>
            <% even = !even;%>
            <tr class="<%=even?"light":"dark"%>">
               <td class="valueW"><div>&nbsp;</div></td>
               <td class="value">
               <studio:handle coderId="119676"/>
               </td>
               <td class="value">
               <A href="">TCHS 07 Logo Contest</A>
               </td>
               <td class="valueR">
               $500.00
               </td>
               <td class="valueE"><div>&nbsp;</div></td>
            </tr>
            <% even = !even;%>
            <tr class="<%=even?"light":"dark"%>">
               <td class="valueW"><div>&nbsp;</div></td>
               <td class="value">
               <studio:handle coderId="119676"/>
               </td>
               <td class="value">
               <A href="">TCHS 07 Logo Contest</A>
               </td>
               <td class="valueR">
               $500.00
               </td>
               <td class="valueE"><div>&nbsp;</div></td>
            </tr>
            <% even = !even;%>
            <tr class="<%=even?"light":"dark"%>">
               <td class="valueW"><div>&nbsp;</div></td>
               <td class="value">
               <studio:handle coderId="119676"/>
               </td>
               <td class="value">
               <A href="">TCHS 07 Logo Contest</A>
               </td>
               <td class="valueR">
               $500.00
               </td>
               <td class="valueE"><div>&nbsp;</div></td>
            </tr>
            <% even = !even;%>
            <tr>
               <td class="SW" colspan="4">&nbsp;</td>
               <td class="SE">&nbsp;</td>
            </tr>
         </tbody>
         </table>
--%>
      </td>
   </tr>
</tbody>
</table>

         </div>
         <img src="/i/layout/contentInS.gif" alt="" style="display:block;" />
      </div>
      <jsp:include page="foot.jsp"/>
      <img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
   </div>
</div>

</body>
</html>