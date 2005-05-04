<%@ page language="java"%>
<%@ page errorPage="/errorPage.jsp"%>
<%@ page import="com.topcoder.web.tc.controller.legacy.resume.common.Constants"%>
<%@ page import="java.util.ArrayList" %>

<jsp:useBean id="ViewUploadTask" scope="request" class="com.topcoder.web.tc.controller.legacy.resume.bean.ViewUploadTask" />
<%@ taglib uri="/WEB-INF/rsc-taglib.tld" prefix="rsc" %>
<HTML>
<HEAD><TITLE>Resume Upload</TITLE></HEAD>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
  <BODY BGCOLOR="#CCCCCC">
    <TABLE WIDTH="100%" HEIGHT="100%" BACKGROUND="/i/steel_darkblue_bg.gif">
      <TR>
        <TD class="statText">
          <form name="upload_form" enctype="multipart/form-data" method="POST" action="Resume">
            <input type="hidden" name="<%=Constants.TASK_KEY%>" value="UploadTask">
            <% if (ViewUploadTask.hasCompany()) {%>
            <input type="hidden" name="compid" value="<jsp:getProperty name="ViewUploadTask" property="companyId"/>">
            <% } %>
            <br/>Resume: <input type=file name=file1>
            <br/>File Type: <select name="fileType" class="dropdown">
            <rsc:iterator list="<%=ViewUploadTask.getFileTypes()%>" id="fileType">
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
