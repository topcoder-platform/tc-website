<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.FullRegInfo" scope="session" />
<jsp:usebean id="fileTypeList" class="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" scope="request" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder | Private Label Registration</title>
</head>

<body>
    <table cellpadding="1" cellspacing="3">
        <form action="<jsp:getProperty name="sessionInfo" property="ServletPath"/>" enctype="multipart/form-data" method="POST" name="regForm">
            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.FULL_REG_CONFIRM%>"/>
            <input type="hidden" name="<%=Constants.COMPANY_ID%>" value="<jsp:getProperty name="regInfo" property="CompanyId"/>"/>
            <tr>
                <td colspan="2">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.CODER_TYPE%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Student/Professional
                </td>
                <td align="left">
                    Student: <input type="radio" name="<%=Constants.CODER_TYPE%>" value ="<%=Constants.STUDENT%>" <%=regInfo.isStudent()?"checked":""%>>
                    Professional: <input type="radio" name="<%=Constants.CODER_TYPE%>" value ="<%=Constants.PROFESSIONAL%>" <%=regInfo.isProfessional()?"checked":""%>>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.RESUME%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Resume
                </td>
                <td align="left">
                    <input type="file" name="file1">
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.FILE_TYPE%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    File Type
                </td>
                <td align="left">
                    <tc-webtag:rscSelect name="<%=Constants.FILE_TYPE%>" list="<%=fileTypeList%>" fieldText="file_type_desc" fieldValue="file_type_id"/>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <a href="javascript: document.regForm.submit();">submit</a>
                </td>
            </tr>


        </form>

    </table>


</body>

</html>