<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 java.util.List" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="privatelabel.tld" prefix="pl" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<jsp:useBean id="regInfo" class="com.topcoder.web.privatelabel.model.FullRegInfo" scope="session"/>
<% List questionList = (List) request.getAttribute("questionList");%>
<html>
<head>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/style.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/gccj05.css"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Google&#153; Code Jam - 中国编程挑战赛, 竞赛软件由 Topcoder&#174;公司提供</title>
</head>

<body>


<table border="0" width=100% cellpadding=0 cellspacing=0>
    <tr>
        <td width="49%">&#160;</td>
        <td align="center">
            <table border="0" width=100% cellpadding=0 cellspacing=0>
                <tr>
                    <td width="49%"></td>
                    <td valign="bottom" align="center"><img border="0" src="/i/events/gccj05/gcjc_logo.gif"
                                                            alt="Google Coder Jam China logo"></td>
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
                <div align="center">
                    <jsp:include page="ZH_links.jsp">
                        <jsp:param name="selectedTab" value="registration"/>
                    </jsp:include>
                </div>

                <br><br>

                <span class="bigTitle">注册</span>
                <span valign=top>
         <jsp:include page="ZH_right_reg.jsp"/>
         </span>

                <br><br>

                <div style="float: left;">
                    <b>第二步（共五步</b>

                    <div class="regBreadOff">常规信息</div>

                    <div class="regBreadOn">人口统计信息</div>

                    <div class="regBreadOff">确认</div>

                    <div class="regBreadOff">成功</div>

                    <div class="regBreadOff">激活</div>
                </div>
                <br><br><br>

        <form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="POST"
              name="regForm" enctype="multipart/form-data">
                <table cellpadding="0" cellspacing="5" class="bodyText" align="center" border="0">
                        <input type="hidden" name="<%=Constants.MODULE_KEY%>"
                               value="<%=Constants.GOOGLE_CHINA_05_REG_CONFIRM%>"/>
                        <input type="hidden" name="<%=Constants.COMPANY_ID%>"
                               value="<jsp:getProperty name="regInfo" property="companyId"/>"/>
                        <input type="hidden" name="<%=Constants.EVENT_ID%>"
                               value="<jsp:getProperty name="regInfo" property="eventId"/>"/>
                        <tc-webtag:hiddenInput name="<%=Constants.LOCALE%>"/>
                        <pl:questionIterator id="question" list="<%=questionList%>">
                            <tr>
                                <td colspan="2" class="errorText" align="center">
                                    <tc-webtag:errorIterator id="err"
                                                             name="<%=Constants.DEMOG_PREFIX+question.getId()%>"><%=err%>
                                        <br></tc-webtag:errorIterator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 160px;">
                                    <%if (question.isRequired()) {%><span class="errorText">*</span><%}%>
                                    <%=question.getText()%>
                                </td>
                                <td align="left">
                                    <pl:demographicInput question="<%=question%>"/>
                                </td>
                            </tr>
                        </pl:questionIterator>
                        <tr>
                            <td colspan="2" class="errorText" align="center">
                                <tc-webtag:errorIterator id="err" name="<%=Constants.FILE%>"><%=err%><br>
                                </tc-webtag:errorIterator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" nowra>
                                简历
                            </td>
                            <td align="left">
                                <input type=file name="Resume">
                            </td>
                        </tr>
                        <tr>
                            <td align="center" valign="bottom" colspan="2">
                                <span class="errorText">* 必须填写</span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <p align="center"><a href="javascript: document.regForm.submit();">提交</a></p>
                            </td>
                        </tr>
                </table>
        </form>

                <br><br>
                <br><br>
想要了解更多的 Google&#153; Code Jam - 中国编程挑战赛的信息， <a href="/pl/?module=Static&d1=gccj05&d2=ZH_rules">请点击 竞赛规则</a>.
            </div>
        </td>
        <td width="49%">&#160;</td>
    <tr>
</table>
<jsp:include page="ZH_foot.jsp"/>
</body>
</html>