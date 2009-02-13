<%@  page
  language="java"
  errorPage="/errorPage.jsp"
  import="com.topcoder.web.tc.controller.legacy.pacts.common.*"
 %>

  <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" VALIGN="top">
    <TR>
      <TD WIDTH="25" BGCOLOR="#999999" VALIGN="top" ALIGN="right"><IMG SRC="/i/sub_navbox_top_left.gif" WIDTH="25" HEIGHT="1" BORDER="0"/><BR><IMG SRC="/i/sub_navbox_btm_left.gif" WIDTH="25" HEIGHT="21" BORDER="0"/></TD>
      <TD WIDTH="100%" VALIGN="top" CLASS="moduleTitle" BGCOLOR="#666666">
        <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" VALIGN="top">      
          <TR>
            <TD COLSPAN="2" WIDTH="140" VALIGN="top" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="140" HEIGHT="1" BORDER="0"/></TD>
          </TR>
          <TR>
            <TD WIDTH="100%" VALIGN="middle" CLASS="statTextBig" BGCOLOR="#333333">&#160;P.A.C.T.s</TD>
            <TD WIDTH="5" BGCOLOR="#333333" ALIGN="right"><IMG SRC="/i/sub_nav_title_right.gif" WIDTH="5" HEIGHT="21" BORDER="0"/></TD>
          </TR>
        </TABLE>
      </TD>
    </TR>
  </TABLE>
  <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" VALIGN="top" BACKGROUND="/i/steel_gray_bg2.gif" BGCOLOR="#43515E"> 
    <TR>
      <TD COLSPAN="2" BACKGROUND=""><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0" VSPACE="2"/></TD>
      <TD WIDTH="1" BACKGROUND=""><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    </TR>
    <TR>
      <TD VALIGN="top" BACKGROUND="" CLASS="subNav" ALIGN="right">&#160;&#160;&#160;::&#160;&#160;</TD>
      <TD VALIGN="top" HEIGHT="15" BACKGROUND="" CLASS="subNav" WIDTH="100%">
        <A HREF="PactsMemberServlet?<%= PactsConstants.TASK_STRING %>=<%= PactsConstants.PAYMENT_TASK %>&<%= PactsConstants.CMD_STRING %>=<%= PactsConstants.PAYMENT_HISTORY_CMD %>" CLASS="subNav">Payments</A>
      </TD>
      <TD WIDTH="1" BACKGROUND=""><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    </TR>    
    <TR>
      <TD VALIGN="top" BACKGROUND="" CLASS="subNav" ALIGN="right">&#160;&#160;&#160;::&#160;&#160;</TD>
      <TD VALIGN="top" HEIGHT="15" BACKGROUND="" CLASS="subNav" WIDTH="100%">
        <A HREF="PactsMemberServlet?<%= PactsConstants.TASK_STRING %>=<%= PactsConstants.AFFIDAVIT_TASK %>&<%= PactsConstants.CMD_STRING %>=<%= PactsConstants.AFFIDAVIT_HISTORY_CMD %>" CLASS="subNav">Affidavits</A>
      </TD>
      <TD WIDTH="1" BACKGROUND=""><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    </TR>
    <TR>
      <TD VALIGN="top" BACKGROUND="" CLASS="subNav" ALIGN="right">&#160;&#160;&#160;::&#160;&#160;</TD>
      <TD VALIGN="top" HEIGHT="15" BACKGROUND="" CLASS="subNav" WIDTH="100%">
        <A HREF="PactsMemberServlet?<%= PactsConstants.TASK_STRING %>=<%= PactsConstants.CONTRACT_TASK %>&<%= PactsConstants.CMD_STRING %>=<%= PactsConstants.CONTRACT_HISTORY_CMD %>" CLASS="subNav">Contracts</A>
      </TD>
      <TD WIDTH="1" BACKGROUND=""><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    </TR>
    <TR>
      <TD VALIGN="top" BACKGROUND="" CLASS="subNav" ALIGN="right">&#160;&#160;&#160;::&#160;&#160;</TD>
      <TD VALIGN="top" HEIGHT="15" BACKGROUND="" CLASS="subNav" WIDTH="100%">
        <A HREF="PactsMemberServlet?<%= PactsConstants.TASK_STRING %>=<%= PactsConstants.TAX_FORM_TASK %>&<%= PactsConstants.CMD_STRING %>=<%= PactsConstants.TAX_FORM_HISTORY_CMD %>" CLASS="subNav">Tax Forms</A>
      </TD>
      <TD WIDTH="1" BACKGROUND=""><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    </TR>    

    <TR>
      <TD COLSPAN="2" BACKGROUND=""><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0" VSPACE="2"/></TD>
      <TD WIDTH="1" BACKGROUND=""><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    </TR>
    <TR><TD COLSPAN="3" BGCOLOR="#666666" ALIGN="right" BACKGROUND="/i/steel_gray_bg.gif"><IMG SRC="/i/sub_navbox_btm_right.gif" WIDTH="13" HEIGHT="17" BORDER="0"/></TD></TR>
  </TABLE>
  <IMG SRC="/i/logo_ghosted_bracket.gif" WIDTH="160" HEIGHT="77" BORDER="0" ALT="[ TopCoder ]" VSPACE="10"/>

