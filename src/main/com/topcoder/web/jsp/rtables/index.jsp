<%@  page 
  language="java"
  import="java.util.*,
          java.io.*,
          java.text.*,
          javax.naming.*,
          com.coolservlets.forum.*,
          com.coolservlets.forum.util.*,
          weblogic.common.T3Services,
          com.topcoder.common.web.data.Navigation,
          com.topcoder.ejb.AuthenticationServices.*,
          com.topcoder.common.*" %>
<%
  Authorization authToken = null;
  com.topcoder.ejb.AuthenticationServices.User user = null;
  String rtUser = "";
  String rtPassword = "";
  String Redirect_URL = "http://" + request.getServerName();
  String responseURL = response.encodeURL(""); 
  SimpleDateFormat dateFormatter = new SimpleDateFormat("EEE, MMM d 'at' hh:mm a z");
  Navigation n = null;
  try {
    n = (Navigation) session.getAttribute("navigation");
    if (n==null) n = new Navigation();
    user = n.getUser();
    HashMap userTypeDetails = user.getUserTypeDetails();
    HashMap sessionObjects = n.getSessionObjects();
    if ( n.getLoggedIn() ) {
      rtUser =user.getHandle();
      rtPassword =user.getPassword();
    }
  }
  catch( Exception e ) {
    response.sendRedirect(Redirect_URL);
    return;
  }
  // do a login if all parameters are good
  AuthorizationFactory authFactory = AuthorizationFactory.getInstance();
  if(rtUser==""){
    authToken = authFactory.getAnonymousAuthorization();
    session.putValue("jiveAuthorization",authToken);
  }else{    
    authToken = authFactory.getAuthorization(rtUser,rtPassword);
    session.putValue("jiveAuthorization",authToken);
  }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>Round Tables</TITLE>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
    <jsp:include page="../script.jsp" />
    <%@ include file="rating.jsp" %>
  </HEAD>
  <BODY BGCOLOR=#CCCCCC TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
  <jsp:include page="../top.jsp" />
  <TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
    <TR>
    <!-- Left Column Begins -->
      <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
        <!-- Left Column Include Begins -->
        <!-- Global Seconday Nav Begins -->
        <jsp:include page="left.jsp" />
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
           <jsp:param name="title" value="Topics"/>  
        </jsp:include>
        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
          <TR>
            <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
            <TD class="statText" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/>
              <P class="statText">
                Below you will find the topics currently being discussed. TopCoder Round Tables are forum style
                discussion topics. TopCoder members may use the Round Tables to discuss ideas
                with and make suggestions to the TopCoder community. The Round Tables are for discussions of any
                TopCoder related topics.
              </P>
              <TABLE WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" BORDER="0">
                <TR>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif" HEIGHT="18">&#160;<b>Name</b></TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><b>T./M.</b></TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><b>Description</b></TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><b>Last Updated</b></TD>
                </TR>
                <TR><TD COLSPAN="7" ALIGN="center" class="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"></TD></TR>
<%
  int userID = 0;
  try {
    userID = authToken.getUserID();
  } catch (Exception e){
    e.printStackTrace();
  }
  ForumFactory forumFactory = ForumFactory.getInstance(authToken);
  ProfileManager manager = forumFactory.getProfileManager();
  String name = null;
  String username = null;
  com.coolservlets.forum.User newUser = null;
  try {
    newUser = manager.getUser( userID );
    name = newUser.getName();
    username = newUser.getUsername();
  }
  catch( Exception e ) {
    e.printStackTrace();
  }

  Iterator forumIterator = forumFactory.forums();
  if( !forumIterator.hasNext() ) {
%>
                      <TR>
                        <TD COLSPAN="7" ALIGN="center" class="statText">
                          <I> No forums have been created. Please contact the administrator and yell at him/her! :)</I>
                        </TD>
                      </TR>
<%
  }
  while( forumIterator.hasNext() ) {
    Forum forum = (Forum)forumIterator.next();
    int forumID = forum.getID();
    String forumName = forum.getName();
    String forumDescription = forum.getDescription();
    int threadCount = forum.getThreadCount();
    int messageCount = forum.getMessageCount();
    Date creationDate = forum.getCreationDate();
    Date modifiedDate = forum.getModifiedDate();
    String handle = forum.getUser().getUsername();
%>
                      <TR>
                        <TD VALIGN="top" class="statText" HEIGHT="13">
                          <A HREF="/rtables/viewForum.jsp?forum=<%= forumID %>" class="statText"><%= forumName %></A>
                        </TD>
                        <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                        <TD VALIGN="top" class="statText"><%=threadCount%>/<%=messageCount%></TD>
                        <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                        <TD VALIGN="top" class="statText"><I><%=(forumDescription!=null)?forumDescription:"&nbsp;"%></I></TD>
                        <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                        <TD VALIGN="top" ALIGN="left" CLASS="statText"><%=dateFormatter.format(forum.getModifiedDate())+(handle==null?"":" by "+getUserDisplay(forum.getUser()))%></TD>
                      </TR>
    <TR>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"/></TD>    
    </TR>
<% 
  }
%>
    <TR>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>    
    </TR>
    <TR>
      <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR>
                    </TABLE>
              <P><BR></P>
    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
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
        <!-- <jsp:include page="right.jsp" /> -->
        <!--include virtual="/includes/public_right_col.shtml"-->
        <!-- Right Column Include Ends -->
      </TD>
      <!-- Right Column Ends -->
      <!-- Gutter -->
      <TD WIDTH="25" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
    </TR>
  </TABLE>
  <!-- Body Ends -->

  <jsp:include page="../foot.jsp" />

  </BODY>
</HTML>
