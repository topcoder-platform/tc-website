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
          com.topcoder.common.*" %>
<%
  Authorization authToken = null;
  String rtUser = "";
  String rtPassword = "";
  String Redirect_URL = "http://" + request.getServerName();
  SimpleDateFormat dateFormatter = new SimpleDateFormat("EEE, MMM d yyyy 'at' hh:mm a z");
  Navigation n = null;
  try {
    n = (Navigation) session.getAttribute("navigation");
    if (n==null) n = new Navigation(request, response);
    if ( n.isIdentified() ) {
      rtUser =n.getSessionInfo().getHandle();
    }
  }
  catch( Exception e ) {
    response.sendRedirect(Redirect_URL);
    return;
  }
  // do a login if all parameters are good
  AuthorizationFactory authFactory = AuthorizationFactory.getInstance();
  if(rtUser.equals("")){
    authToken = authFactory.getAnonymousAuthorization();
    session.setAttribute("jiveAuthorization",authToken);
  }else{    
    authToken = authFactory.getAuthorization(rtUser,rtPassword);
    session.setAttribute("jiveAuthorization",authToken);
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
  <BODY>
  <jsp:include page="../top.jsp" />

  <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR>
<!-- Left Column Begins -->
      <TD WIDTH="180" VALIGN="top">
        <jsp:include page="../includes/global_left.jsp">
          <jsp:param name="level1" value="rtables"/>
        </jsp:include>
      </TD>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
      <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1"></TD>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
      <TD class="statText" width="100%" valign="top"><img src="/i/clear.gif" width="400" HEIGHT="1" VSPACE="5" BORDER="0"><BR>
        <jsp:include page="../body_top.jsp" >
           <jsp:param name="image" value="round_tables"/>  
           <jsp:param name="image1" value="steelblue"/>  
           <jsp:param name="title" value="Topics"/>  
        </jsp:include>
        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="10" BGCOLOR="#001B35" WIDTH="100%">
          <TR>
            <TD class="statText" VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/>
              <P class="statText">
                Below you will find the topics currently being discussed. TopCoder Round Tables are forum style
                discussion topics. TopCoder members may use the Round Tables to discuss ideas
                with and make suggestions to the TopCoder community. The Round Tables are for discussions of any
                TopCoder related topics.
              </P>
              <TABLE WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" BORDER="0">
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
  ForumFactory forumFactory = ForumFactory.getInstance(authToken);
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
    String handle = forum.getUser().getUsername();
%>
                      <TR>
                        <TD VALIGN="top" class="statText" HEIGHT="13">
                          <A HREF="/rtables/viewForum.jsp?forum=<%= forumID %>&mc=<%=messageCount%>" class="statText"><%= forumName %></A>
                        </TD>
                        <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                        <TD VALIGN="top" class="statText"><%=threadCount%>/<%=messageCount%></TD>
                        <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                        <TD VALIGN="top" class="statText"><I><%=(forumDescription!=null)?forumDescription:"&nbsp;"%></I></TD>
                        <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                        <TD VALIGN="top" ALIGN="left" CLASS="statText"><%=dateFormatter.format(forum.getModifiedDate())+(handle==null?"":" by "+getUserDisplay(forum.getUser()))%></TD>
                      </TR>
    <TR>
      <TD COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"/></TD>    
    </TR>
<% 
  }
%>
    <TR>
      <TD COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>    
    </TR>
    <TR>
      <TD CLASS="statText" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR>
                    </TABLE>
              <P><BR></P>
    </TD>
  </TR>
  <TR>
    <TD WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR>     
</TABLE>
         
         <p><br></p>

    </TD>
  <!-- Center Column Ends -->

<!-- Gutter -->
      <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1"></TD>
<!-- Gutter Ends -->
    </TR>
  </TABLE>

  <jsp:include page="../foot.jsp" />

  </BODY>
</HTML>


