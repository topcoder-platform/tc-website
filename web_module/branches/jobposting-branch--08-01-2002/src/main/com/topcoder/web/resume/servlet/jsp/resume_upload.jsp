<%@ page language="java"%>
<%@ page errorPage="error.jsp"%>


<HTML>
  <BODY BGCOLOR="#CCCCCC">
    <TABLE WIDTH="100%" HEIGHT="100%" BACKGROUND="/i/steel_darkblue_bg.gif">
      <TR>
        <TD>
          <form name="upload_form" enctype="multipart/form-data" method="POST" action="<%="/resume/resume"%>">
            <input type="hidden" name="<%="task"%>" value="<%="ResumeUploadTask"%>">
            <input type=file name=file1>
            <input type="submit" value="Upload"> 
          </form>
        </TD>
      </TR>
    </TABLE>
  </BODY>
</HTML>
