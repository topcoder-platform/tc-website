<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<html>
<head>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/style.css"/>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/gccj05.css"/>
<title>Google&#153; 中国编程精英网罗赛, 竞赛软件由 Topcoder&#174;公司提供</title>
</head>
<body>


<table border="0" width=100% cellpadding=0 cellspacing=0>
   <tr>
      <td width="49%">&#160;</td>
      <td align="center">
         <table border="0" width=100% cellpadding=0 cellspacing=0>
            <tr>
               <td width="49%"></td>
               <td valign="bottom" align="center"><img border="0" src="/i/events/gccj05/gccj05_logo.gif" alt="Google Coder Jam China logo"></td>
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

         <%-- Tab bar links--%>
         <div align="center">
         <jsp:include page="ZH_links.jsp" >
         <jsp:param name="selectedTab" value="registration"/>
         </jsp:include>
         </div>

         <br><br>

         <span class="bigTitle">忘记你的密码？</span>
         <span valign=top>
         <jsp:include page="ZH_right_reg.jsp" />
         </span>

         <br><br>
         请在下面输入您的邮箱地址。您的用户名和密码将马上发至您的信箱。
         <br><br><br><br>

         <table cellpadding="0" cellspacing="5" class="bodyText" align="center" width="100%" border="0">
         <form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="GET" name="regForm">
            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.GOOGLE_CHINA_05_CREDENTIALS%>"/>
            <tc-webtag:hiddenInput name="<%=Constants.COMPANY_ID%>"/>
            <tr>
                <td colspan="2" class="errorText" align="center">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL%>"><%=err%><br></tc-webtag:errorIterator>
                </td>
            </tr>
            <tr>
                <td align="right" nowrap>
                    邮箱地址
                </td>
                <td align="left">
                    <tc-webtag:textInput name="<%=Constants.EMAIL%>"  size="15" maxlength="<%=Constants.MAX_EMAIL_LENGTH%>"/>
                </td>
            </tr>
            <tr>
               <td colspan="2" align="center">
                  <p align="center"><a href="javascript: document.regForm.submit();">提交</a></p>
               </td>
            </tr>


            </form>
      </table>

         <br><br>
         <br><br>
         To find out more detailed information about the Google Code Jam China, including a list of the prizes, please read the <a href="/pl/?module=Static&d1=gccj05&d2=ZH_rules">Terms and Conditions</a>.
         </div>
      </td>
      <td width="49%">&#160;</td>
   <tr>
</table>
<jsp:include page="ZH_foot.jsp" />
</body>
</html>