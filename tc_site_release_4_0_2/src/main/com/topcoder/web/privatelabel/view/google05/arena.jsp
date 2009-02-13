<%@ page contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/google05.css"/>
<title>Google Code Jam 2005, Powered by TopCoder</title>
<jsp:include page="../script.jsp" />
</head>
<body>


<table border=0 width=100% cellpadding=0 cellspacing=0>
   <tr>
      <td width="49%">&#160;</td>
      <td align=center>
         <table border=0 width=100% cellpadding=0 cellspacing=0>
            <tr>
               <td width="49%"></td>
               <td valign=bottom align=center><img border=0 src="/i/events/google2005/codejamLogo.gif" alt="Google Code Jam logo"></td>
               <td width="49%"></td>
            </tr>
         </table>
      </td>
      <td width="49%"></td>
   </tr>
   <tr>
      <td width="49%">&#160;</td>
      <td>
         <div class=greenBigBox>

         <!-- Tab bar links-->
         <div align=center>
         <jsp:include page="links.jsp" >
         <jsp:param name="selectedTab" value="arena"/>
         </jsp:include>
         </div>


         <br/><br/>
         <span class=bigTitle>Competition Arena</span>
         <span valign=top>
         <jsp:include page="right.jsp" />
         </span>
         <br/><br/>
            If you have a 2005 Google Code Jam account but you forgot your password, <A href="/pl/?module=Google05Credentials&cid=1865">click here</A>.
         <br/><br/>
Click <A href="/pl/?&module=Static&d1=google05&d2=instructions">here</A> to read to the <A href="/pl/?&module=Static&d1=google05&d2=instructions">Instructions</A> page.
<br/><br/>
Click <a href="Javascript:openWin('?module=Static&d1=google05&d2=google_quick_launch','comp',300,275);">here</a> to run the Competition Arena as a <a href="Javascript:openWin('?module=Static&d1=google05&d2=google_quick_launch','comp',300,275);">Java Applet</A>.
<br/><br/>
Click <a href="/contest/arena/ContestAppletGoogle.jnlp" target="_blank">here</a> to run the Competition Arena as a <a href="/contest/arena/ContestAppletGoogle.jnlp" target="_blank">Java Web Start Application</A>.
<br/><br/>
Note:  If you wish to install Java Web Start click <a href="http://java.sun.com/products/javawebstart/index.html" target="_blank">here</a>.
<br/><br/>
If you experience problems loading or running the Competition Arena please contact  <A href="mailto:googlecodejam@topcoder.com">googlecodejam@topcoder.com</A>.
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

         <br/><br/>
         To find out more detailed information about the Google Code Jam 2005, including a list of the prizes, please read the <a href="/pl/?&module=Static&d1=google05&d2=rules">Terms and Conditions</a>.
         </div>
      </td>
      <td width="49%">&#160;</td>
   <tr>
</table>
<jsp:include page="foot.jsp" />
</body>
</html>
