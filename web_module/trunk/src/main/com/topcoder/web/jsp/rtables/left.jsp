<%@  page   
  language="java"
%>


<TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" VALIGN="top">

  <TR>

    <TD WIDTH="25" BGCOLOR="#999999" VALIGN="top" ALIGN="right"><IMG SRC="/i/sub_navbox_top_left.gif" WIDTH="25" HEIGHT="1" BORDER="0"><BR><IMG SRC="/i/sub_navbox_btm_left.gif" WIDTH="25" HEIGHT="21" BORDER="0"></TD>

    <TD WIDTH="100%" VALIGN="top" CLASS="moduleTitle" BGCOLOR="#999999">

      <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" VALIGN="top">

        <TR><TD COLSPAN="2" WIDTH="140" VALIGN="top" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="140" HEIGHT="1" BORDER="0"></TR>        

        <TR><TD WIDTH="100%" VALIGN="middle" class="statTextBig" BGCOLOR="#333333">&nbsp;:: more Round Tables </TD><TD WIDTH="5" BGCOLOR="#333333" ALIGN="right"><IMG SRC="/i/sub_nav_title_right.gif" WIDTH="5" HEIGHT="21" BORDER="0"></TD></TR>

      </TABLE>

    </TD>

  </TR>

</TABLE>

<TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" VALIGN="top" BGCOLOR="#43515E">

  <TR><TD COLSPAN="2" BACKGROUND="/i/steel_gray_bg.gif"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0" VSPACE="2"></TD><TD WIDTH="1" BACKGROUND="/i/steel_gray_bg.gif"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD></TR>



<%
  // do a login if all parameters are good
  Authorization aToken = (Authorization) session.getValue("jiveAuthorization");
  int userId = 0;
  try {
    userId = aToken.getUserID();
  } catch (Exception e){
    e.printStackTrace();
    return;
  }
  ForumFactory ff = ForumFactory.getInstance(aToken);
  ProfileManager mgr = ff.getProfileManager();
  String nm = null;
  String userName = null;
  com.coolservlets.forum.User nu = null;
  try {
    nu = mgr.getUser( userId );
    nm = nu.getName();
    userName = nu.getUsername();
  }
  catch( Exception e ) {
    e.printStackTrace();
    return;
  }
  Iterator forums = ff.forums();
  if( !forums.hasNext() ) {
%>

                      <TR>

                        <TD COLSPAN="7" ALIGN="center" class="statText">

                          <I> No forums have been created. Please contact the administrator and yell at him/her! :)</I>

                        </TD>

                      </TR>

<%
  }
  while( forums.hasNext() ) {
    Forum f = (Forum)forums.next();
    int fID = f.getID();
    String fName = f.getName();
%>

  <TR>

    <TD VALIGN="top" BACKGROUND="/i/steel_gray_bg.gif" CLASS="subNav" ALIGN="right">&nbsp;&nbsp;&nbsp;<FONT class="subNav">::</FONT>&nbsp;&nbsp;</TD>

    <TD VALIGN="top" HEIGHT="15" BACKGROUND="/i/steel_gray_bg.gif" CLASS="subNav" WIDTH="100%">

      <A HREF="/rtables/viewForum.jsp?forum=<%= fID %>" class="subNav">

        <FONT class="subNav"><%=(fName!=null)?fName:"&nbsp;"%></FONT>

      </A>

    </TD>

    <TD WIDTH="1" BACKGROUND="/i/steel_gray_bg.gif"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>

  </TR>

<%
  }
%>

  <TR><TD COLSPAN="2" BACKGROUND="/i/steel_gray_bg.gif">

    <IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0" VSPACE="2"></TD>

  <TD WIDTH="1" BACKGROUND="/i/steel_gray_bg.gif"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD></TR>

  <TR><TD COLSPAN="3" BACKGROUND="/i/steel_gray_bg.gif" ALIGN="right"><IMG SRC="/i/sub_navbox_btm_right.gif" WIDTH="13" HEIGHT="17" BORDER="0"></TD></TR>

</TABLE>

<IMG SRC="/i/logo_ghosted_bracket.gif" WIDTH="160" HEIGHT="77" BORDER="0" ALT="[ TopCoder ]" VSPACE="10">

