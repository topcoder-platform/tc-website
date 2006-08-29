<%@ page language="java"
import="com.topcoder.dde.util.Constants" %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<HTML>
<HEAD><TITLE>Upload</TITLE></HEAD>
    <TABLE WIDTH="100%" HEIGHT="100%">
      <TR>
        <TD class="statText">
          <form name="upload_form" enctype="multipart/form-data" method="POST" action="/tcs">
            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="UploadApplicationSpecificationTask">                
            <br/>Upload file: <input type=file name=file1>
            <br/><input type="submit" value="Upload">
            </form>
        </TD>
      </TR>
    </TABLE>
</HTML>
