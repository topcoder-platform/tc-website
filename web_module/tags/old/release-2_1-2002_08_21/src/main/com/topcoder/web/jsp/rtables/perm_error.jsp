<%-- 
/**
 *  perm_error.jsp
 */
--%>

<%@  page 
  language="java"
  import="com.coolservlets.forum.*,
          com.coolservlets.forum.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<HTML>

  <HEAD>

    <TITLE>Round Tables</TITLE>

    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>

    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>

    <%@ include file="../script.jsp" %>

  </HEAD>

  <BODY BGCOLOR=#CCCCCC TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">

    <%@ include file="../top.jsp" %>

    <!--------main content table------------>

    <TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">

      <TR>

        <!-- Left Column Begins -->

        <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">

          <!-- Left Column Include Begins -->

          <!-- Global Seconday Nav Begins -->

          <%@ include file="left.jsp" %>

          <!-- Global Seconday Nav Ends -->

          <!-- Left Column Include Ends -->

        </TD>

        <!-- Left Column Ends -->

        <!-- Gutter Begins -->

        <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD>

        <!-- Gutter Ends -->

        <!-- Body Area -->

        <!-- Center Column Begins -->

        <TD class="statText" width="100%" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="400" HEIGHT="1" VSPACE="5" BORDER="0"><BR>
        <jsp:include page="../body_top.jsp" >
           <jsp:param name="image" value="round_tables"/>
           <jsp:param name="image1" value="steelblue"/>
        </jsp:include>

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD class="statText" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="400" HEIGHT="1" BORDER="0"/><BR/>
<br>

          <!---------header table------------->

          <TABLE CELLSPACING="0" CELLPADDING="0" BORDER="0">

            <TR><TD WIDTH="4" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD></TR>

            <TR><TD class="registerNav"><b>Insufficient Privileges</b></TD></TR>

            <TR><TD WIDTH="4" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD></TR>

            <TR>

              <TD class="statText">

                Because you are not logged into the TopCoder system, you are not able to participate in Round Table Discussion groups.

                You may continue browsing Round Tables now by clicking the Back Button on your browser toolbar or use one of the links

                below.

              </TD>

            </TR>

            <TR><TD WIDTH="4" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD></TR>

            <TR><TD class="statText"><A HREF="/index?t=authentication&c=login" class="statText"><b>Login &gt;&gt;</b></A></TD></TR>

          </TABLE>
<P><BR></P>
    </TD>
    <TD VALIGN="top" WIDTH="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD COLSPAN="4" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>     
  <TR>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR>  
  <TR>
    <TD VALIGN="top" BACKGROUND="" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR>
</TABLE>
    </TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->

        <!-- Gutter -->

        <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"></TD>

        <!-- Gutter Ends -->

        <!-- Right Column Begins -->

        <TD WIDTH="10" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"><BR>

          <!-- Right Column Include Begins -->

          <!-- Right Column Include Ends -->

        </TD>

        <!-- Right Column Ends -->

        <!-- Gutter -->

        <TD WIDTH="170" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"></TD>

        <!-- Gutter Ends -->

      </TR>

    </TABLE>

    <%@ include file="../foot.jsp" %>

  </BODY>

</HTML>
