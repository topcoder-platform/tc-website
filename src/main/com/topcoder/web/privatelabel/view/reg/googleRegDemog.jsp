<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.privatelabel.view.tag.DemographicInput,
                 com.topcoder.web.common.BaseProcessor" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="/privatelabel.tld" prefix="pl" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.FullRegInfo" scope="session" />
<jsp:usebean id="questionList" class="java.util.List" scope="request" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder | Private Label Registration</title>

<jsp:include page="../script.jsp" />
<script>
function openWin(url, name, w, h) {
    win = window.open(url, 'biowin', "scrollbars=no,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
    win.location.href = url;
    win.focus();
}
</script>

</head>

<body>

<!-- TCO Header -->

<a name="top_page"></a>
<table  width="100%" border="0" cellspacing="0" cellpadding="0" class="bodyText">
   <tr>

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Header -->
         <td width="100%" valign="top" class="bodyText" colspan="3">
       
         <table  width="100%" align="center" border="0" cellspacing="0" cellpadding="0" class="bodyText">
            <tr><td colspan="11" align="center"><img src="/i/events/google2003/google_logo_white.gif" width="300" height="150" border="0"/></td></tr>
            <tr><td colspan="11"><img src="/i/clear.gif" width="10" height="10"></td></tr>
            <tr><td colspan="11" align="center"><img src="/i/events/google2003/google_tagline.gif" width="173" height="15" border="0"/></td></tr>
            <tr><td colspan="11"><img src="/i/clear.gif" width="10" height="20"></td></tr>

            <tr>
               <td width="50%">&nbsp;</td>
               <td bgcolor="#efefef" align="center" width=95 nowrap><a href="/pl/?&module=Static&d1=google&d2=google_overview" style="text-decoration:none" ><font size="-1">Overview</font></a></td>
               <td width=15><img src="/i/clear.gif" width="15" height="1"></td>
               <td bgcolor="#efefef" align="center" width=95 nowrap><a href="/pl/?&module=Static&d1=google&d2=google_sched" style="text-decoration:none" ><font size="-1">Schedule</font></a></td>
               <td width=15><img src="/i/clear.gif" width="15" height="1"></td>
               <td bgcolor="#efefef" align="center" width=95 nowrap><a href="/pl/?&module=Static&d1=google&d2=google_rules_overview" style="text-decoration:none" ><font size="-1"><img src="/i/events/google2003/rules_arrow_blue.gif" width="15" height="10" border="0"/>Rules</font></a></td>
               <td width=15><img src="/i/clear.gif" width="15" height="1"></td>
               <td bgcolor="#3366cc" align="center" width=95 nowrap><font color="#ffffff" size="-1"><b>Register Now</b></font></td>
               <td width=15><img src="/i/clear.gif" width="15" height="1"></td>
               <td bgcolor="#efefef" align="center" width=95 nowrap><a href="Javascript:openWin('?module=Static&d1=google&d2=google_quick_launch','comp',300,225);" style="text-decoration:none"><font size="-1">Practice Arena</font></a></td>
               <td width="50%">&nbsp;</td>
            </tr>
            <tr>
               <td colspan="11" bgcolor=#3366cc><img width=1 height=1 alt=""></td>
            </tr>
         </table>
         </td>

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

      </tr>
      <tr>

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Left Column Begins -->
        <td width="150" valign="top">      
            <img src="/i/clear.gif" width="150" height="10" border="0"/><br />
            <img src="/i/events/google2003/left.gif" width="150" height="450" border="0" usemap="#tchome"/>
            <map name="tchome"><area shape="rect" alt="TC" coords="1,1,149,49" href="/" /></map>
         </td>         
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins-->
         <td width="100%" class="bodyText" valign="top">
            <img src="/i/clear.gif" width="10" height="10" border="0"/><br />            

      <h2>Registration</h2>
      <table cellpadding="1" cellspacing="3" class="bodyText" align="center">
        <form action="<jsp:getProperty name="sessionInfo" property="ServletPath"/>" method="POST" name="regForm">
            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.GOOGLE_REG_CONFIRM%>"/>
            <input type="hidden" name="<%=Constants.COMPANY_ID%>" value="<jsp:getProperty name="regInfo" property="CompanyId"/>"/>
            <input type="hidden" name="<%=Constants.EVENT_ID%>" value="<jsp:getProperty name="regInfo" property="EventId"/>"/>
            <tr>
                <td colspan="2" class="errorText">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.CODER_TYPE%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>
            <tr>
                <td align="right" width="49%">
                    Student/Professional
                </td>
                <td align="left" width="49%">
                    Student: <input type="radio" name="<%=Constants.CODER_TYPE%>" value ="<%=Constants.STUDENT%>" <%=regInfo.isStudent()?"checked":""%>>
                    Professional: <input type="radio" name="<%=Constants.CODER_TYPE%>" value ="<%=Constants.PROFESSIONAL%>" <%=regInfo.isProfessional()?"checked":""%>>
                </td>
            </tr>

            <pl:questionIterator id="question" list="<%=questionList%>">
                <tr>
                    <td colspan="2" class="errorText">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.DEMOG_PREFIX+question.getId()%>"><%=err%><br/></tc-webtag:errorIterator>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <%=question.getText()%>
                    </td>
                    <td align="left">
                        <pl:demographicInput question="<%=question%>"/>
                    </td>
               </tr>
            </pl:questionIterator>

            <tr>
               <td>
               </td>
               <td align="left">
                  <p><br /></p>
                  <p><a href="javascript: document.regForm.submit();" class="button" align="center">Submit</a></p>
                  <p><br /></p>
               </td>
            </tr>
         </form>
         </table>
            <p><br /></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

    </tr>
</table>

<!-- Footer Begins -->
<jsp:include page="../google/google_foot.jsp" />
<!-- Footer Ends -->

</body>
</html>