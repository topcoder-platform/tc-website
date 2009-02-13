<%@ page language="java"%>
<%@ page errorPage="/errorPage.jsp"%>
<%@ page import="com.topcoder.web.resume.common.Constants"%>
<%@ page import="java.util.ArrayList" %>

<jsp:useBean id="ViewUploadTask" scope="request" class="com.topcoder.web.resume.bean.ViewUploadTask" />

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
            <br/>Resume: <input type=file name=file1>
            <br/>File Type: <select name="fileType" class="dropdown">
            <%
                ArrayList al = ViewUploadTask.getFileTypes();
                for(int i = 0; i<al.size();i++){
            %>
            <option value="<%= al.get(i++) %>"><%= al.get(i) %></option>
            <%}%>
            </select>
            <br/><input type="submit" value="Upload">
            </form>
        </TD>
      </TR>
    </TABLE>
  </BODY>
</HTML>
