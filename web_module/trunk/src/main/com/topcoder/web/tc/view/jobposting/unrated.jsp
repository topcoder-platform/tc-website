<%@ page language="java" %>
<%@ page errorPage="/errorPage.jsp" %>
<jsp:useBean id="JobHitTask" scope="request" class="com.topcoder.web.tc.controller.legacy.jobposting.bean.JobHitTask" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>Registration</TITLE>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
    <jsp:include page="../script.jsp" />
  </HEAD>
  <BODY BGCOLOR=#CCCCCC TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
    <jsp:include page="../top.jsp" />

    <TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
      <TR>
       <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
         <jsp:include page="../includes/global_left.jsp" />
       </TD>
        <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD>
        <TD CLASS="statTextBig" width="100%" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="400" HEIGHT="1" VSPACE="5" BORDER="0"><BR>
          <jsp:include page="../body_top.jsp" >
             <jsp:param name="image" value="tces"/>
             <jsp:param name="image1" value="steelblue"/>
             <jsp:param name="title" value=""/>
          </jsp:include>
          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
            <TR>
              <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
              <TD CLASS="statText" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
                <!-- begin body -->
                <BR/>
                <BR/>
                <BR/>
                The ability to apply for a job at TopCoder is restricted to rated members. In line with TopCoder's
                overall philosophy, this policy allows companies to differentiate coders who otherwise look the same
                on paper. Non-rated members wishing to obtain a rating should review the competition calendar for the
                <A HREF="/?&t=schedule&c=srm&RoundId=<jsp:getProperty name="JobHitTask" property="NextRoundId"/>" CLASS="statTextBig">next Single Round Match</A>
                or click <A HREF="/?&t=schedule&c=index" class="statTextBig">here</A> for a complete list of upcoming Single
                Round Matches.
                <BR/>
                <BR/>
                <BR/>
                <!-- end body -->
              </TD>
              <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
            </TR>
            <TR>
              <TD COLSPAN="4" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
            </TR>
            <TR>
              <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
              <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left_blue_home.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
              <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
              <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>
            <TR>
              <TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
              <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
              <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
              <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>
          </TABLE>
        </TD>
        <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"></TD>
        <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"><BR>
          <jsp:include "../public_right.jsp"/>
        </TD>
        <TD WIDTH="25" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"></TD>
      </TR>
    </TABLE>
    <jsp:include page="../foot.jsp" />
  </BODY>
</HTML>
