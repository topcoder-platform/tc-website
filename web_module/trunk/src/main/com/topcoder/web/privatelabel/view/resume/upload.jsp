<%@ page import="com.topcoder.web.privatelabel.Constants"%>
<%@ page language="java"%>

<%@ taglib uri="/WEB-INF/rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="/WEB-INF/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="fileTypes" class="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" scope="request" />
<HTML>
<HEAD><TITLE>Resume Upload</TITLE></HEAD>
  <BODY BGCOLOR="#CCCCCC">
    <TABLE WIDTH="100%" HEIGHT="100%"  CLASS="bodyText">
      <TR>
        <TD class="statText">
          <form name="upload_form" enctype="multipart/form-data" method="POST" action="<jsp:getProperty name="sessionInfo" property="ServletPath"/>">
            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="UploadResume">
            <input type="hidden" name="<%=Constants.COMPANY_ID%>" value="<%=request.getParameter(Constants.COMPANY_ID)%>">
            <tc-webtag:errorIterator id="err" name="<%=Constants.FILE%>"><%=err%><br/></tc-webtag:errorIterator>
            <br/>Resume: <input type="file" name="<%=Constants.FILE%>">
            <br/>File Type: <select name="fileType" class="dropdown">
            <rsc:iterator list="<%=fileTypes%>" id="fileType">
              <option value="<rsc:item name="file_type_id" row="<%=fileType%>"/>"><rsc:item name="file_type_desc" row="<%=fileType%>"/></option>
            </rsc:iterator>
            </select>
            <br/><input type="submit" value="Upload">
            </form>
        </TD>
      </TR>
    </TABLE>
  </BODY>
</HTML>
