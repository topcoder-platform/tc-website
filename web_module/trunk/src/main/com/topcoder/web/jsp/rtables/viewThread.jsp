<%--
/**
 *  viewThread.jsp
 */
--%>
<%@  page 
  language="java"
  import="java.io.*,
          java.util.*,
          java.text.*,
          com.coolservlets.forum.*,
          com.coolservlets.forum.util.*,
          com.topcoder.common.web.data.Navigation,
          com.topcoder.common.*" %>

<%  ////////////////
  //
  String Redirect_URL = "http://" + request.getServerName();
  String responseURL = response.encodeURL("");
  String bufurl = response.encodeURL("/rtables/post.jsp");
%>        

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>Round Tables</TITLE>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="rating.jsp" />
  </HEAD>
  <BODY BGCOLOR=#CCCCCC TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
    <jsp:include page="../top.jsp" />
    <!--------main content table------------>
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
           <jsp:param name="title" value="View Threads"/>
        </jsp:include>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD class="statText" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

<%  ////////////////////////
  // authorization check
  
  if( ! SkinUtils.userIsAuthorized(request,session) ) {
    response.sendRedirect(Redirect_URL);
  }
  // get the authToken as a way to get userID's below
  Authorization authToken 
    = (Authorization)session.getValue("jiveAuthorization");
%>
<%  //////////////////////
  // get parameters
  int forumID  = ParamUtils.getIntParameter(request,"forum",-1);
  int threadID = ParamUtils.getIntParameter(request,"thread",-1);
  int msgID = ParamUtils.getIntParameter(request,"message",-1);
%>
<%!  ////////////////
  // global variables
  SimpleDateFormat dateFormatter 
    = new SimpleDateFormat("EEE, MMM d 'at' hh:mm a z");
    
  /**
   * Print a child message
   */
  private String printChildMessage( Forum forum, ForumThread thread, ForumMessage message, int indentation, int msgID, String bufurl, String responseURL)
  { 
    StringBuffer buf = new StringBuffer();
    try {
    String subject = message.getSubject();
    boolean msgIsAnonymous = message.isAnonymous();
    com.coolservlets.forum.User author = message.getUser();
    String authorName = author.getUsername();


    int forumID = forum.getID();
    int threadID = thread.getID();
    int messageID = message.getID();
    Date creationDate = message.getCreationDate();
    String msgBody = message.getBody();
    buf.append("<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" width=\"");
    buf.append( 100-(3*indentation) ).append("%\" align=\"right\">");
    buf.append("<tr>");
    buf.append("<td width=\"1\" colspan=\"2\"><img src=\"/i/clear.gif\" width=\"1\" height=\"5\" /></td>");
    buf.append("</tr>");
    buf.append("<tr>");
    buf.append("<td colspan=\"2\">");
    buf.append("<table width=\"");
    buf.append( 100-(3*indentation) ).append("%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">");
    buf.append("<tr>");
    buf.append("<td><img src=\"/i/clear.gif\" width=\"4\" height=\"4\" /></td>");
    buf.append("<td width=\"");
    buf.append( 100-(18.33*indentation) ).append("\"><img src=\"/i/clear.gif\" height=\"4\"  width=\"");
    buf.append( 100-(18.33*indentation) ).append("\" /></td>");
    buf.append("<td><img src=\"/i/clear.gif\" width=\"4\" height=\"4\" /></td>");
    buf.append("</tr>");
    buf.append("</table>");
    buf.append("</td>");
    buf.append("</tr>");
     if (messageID!=msgID) {
    buf.append("<tr>");
    buf.append("<td colspan=\"2\" valign=\"middle\" class=\"statTextBig\" background=\"/i/steel_bluebv_bg.gif\" height=\"18\"><img src=\"/i/clear.gif\" width=\"3\" height=\"1\" align=\"left\" /><b>");
    buf.append( "<a name =").append(messageID).append(">").append(subject).append("</a>" );
    buf.append("</b></td>");
    buf.append("</tr>");
    }
    else {
    buf.append("<tr>");
    buf.append("<td colspan=\"2\" class=\"statTextBig\"><img src=\"/i/clear.gif\" width=\"3\" height=\"1\" /><b>");
    buf.append( "<a name =").append(messageID).append(">").append(subject).append("</a>" );
    buf.append("</b></td>");
    buf.append("</tr>");
    }
    buf.append("<tr bgcolor=\"#000000\">");
    buf.append("<td width=\"1\" colspan=\"2\"><img src=\"/i/clear.gif\" width=\"1\" height=\"1\" /></td>");
    buf.append("</tr>");
    buf.append("<tr>");    
    buf.append("<td align=\"left\" valign=\"middle\" class=\"statText\" background=\"/i/steel_blue_bg.gif\" height=\"18\"><img src=\"/i/clear.gif\" width=\"3\" height=\"1\" />");
    buf.append("Posted By: "+getUserDisplay(author));
    buf.append("</td>");
    buf.append("<td align=\"right\" valign=\"middle\" class=\"statText\" background=\"/i/steel_blue_bg.gif\" height=\"18\">");
    buf.append("Posted ").append(dateFormatter.format(creationDate));
    buf.append("<img src=\"/i/clear.gif\" width=\"3\" height=\"1\" /></td>");
    buf.append("</tr>");
    buf.append("<tr>");
    buf.append("<td width=\"1\" colspan=\"2\"><img src=\"/i/clear.gif\" width=\"1\" height=\"1\" /></td>");
    buf.append("</tr>");
    buf.append("<tr>");
    buf.append("<td width=\"1\" colspan=\"2\"><img src=\"/i/clear.gif\" width=\"1\" height=\"3\" /></td>");
    buf.append("</tr>");
    buf.append("<tr>");
    buf.append("<td valign=\"top\" colspan=\"2\" class=\"statText\"><img src=\"/i/clear.gif\" width=\"3\" height=\"1\" />").append( (msgBody!=null)?msgBody:"" ).append("</td>");
    buf.append("</tr>");
    buf.append("<tr>");
    buf.append("<td width=\"1\" colspan=\"2\"><img src=\"/i/clear.gif\" width=\"1\" height=\"3\" /></td>");
    buf.append("</tr>");
    buf.append("<tr>");
    buf.append("<td width=\"1\" colspan=\"2\"><img src=\"/i/clear.gif\" width=\"1\" height=\"2\" /></td>");
    buf.append("</tr>");
    buf.append("<tr>");
    buf.append("<td colspan=\"2\">");
    buf.append("<table width=\"");
    buf.append( 100-(3*indentation) ).append("%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">");
    buf.append("<tr>");
    buf.append("<td><img src=\"/i/clear.gif\" width=\"4\" height=\"4\" /></td>");
    buf.append("<td width=\"");
    buf.append( 100-(18.33*indentation) ).append("\"><img src=\"/i/clear.gif\" height=\"4\"  width=\"");
    buf.append( 100-(18.33*indentation) ).append("\" /></td>");
    buf.append("<td><img src=\"/i/clear.gif\" width=\"4\" height=\"4\" /></td>");
    buf.append("</tr>");
    buf.append("</table>");
    buf.append("</td>");
    buf.append("</tr>");
    buf.append("<tr>");
    buf.append("<td width=\"1\" colspan=\"2\"><img src=\"/i/clear.gif\" width=\"1\" height=\"5\" /></td>");
    buf.append("</tr>");
    if (responseURL=="") {
    buf.append("<tr>");
    buf.append("<td width=\"1\" colspan=\"2\" class=\"statText\" align=\"center\">");
    buf.append("<a class=\"statTextBig\"href=\"").append(bufurl).append("?mode=reply&forum=");
    buf.append(forumID).append("&thread=").append(threadID).append("&message=").append(messageID).append("\"");
    buf.append("><b>[Reply]</b></a>");
    buf.append("</td>");
    buf.append("</tr>");
    }  else {
    buf.append("<tr>");
    buf.append("<td width=\"1\" colspan=\"2\" class=\"statText\" align=\"center\">");
    buf.append("<a class=\"statTextBig\" href=\"").append(bufurl).append("&mode=reply&forum=");
    buf.append(forumID).append("&thread=").append(threadID).append("&message=").append(messageID).append("\"");
    buf.append("><b>[Reply]</b></a>");
    buf.append("</td>");
    buf.append("</tr>");
    }
    buf.append("<tr>");
    buf.append("<td width=\"1\" colspan=\"2\"><img src=\"/i/clear.gif\" width=\"1\" height=\"15\" /></td>");
    buf.append("</tr>");
    buf.append("</table>");
    buf.append("<br clear=\"all\">");
    } catch( Exception ignored ) {}
    return buf.toString();
  }
  
  /**
   * Recursive method to print all the children of a message.
   */  
  private String printChildren( TreeWalker walker, Forum forum, ForumThread thread, ForumMessage message, int indentation, int msgID, String bufurl, String responseURL )
  {
    StringBuffer buf = new StringBuffer();
    
    buf.append( printChildMessage( forum, thread, message, indentation, msgID, bufurl, responseURL ) );
    
    // recursive call
        int numChildren = walker.getChildCount(message);
        if( numChildren > 0 ) {
            for( int i=0; i<numChildren; i++ ) {
                buf.append(
          printChildren( walker, forum, thread, walker.getChild(message,i), (indentation+1),msgID, bufurl, responseURL )
        );
            }
        }
    return buf.toString();
    }
%>

<%  //////////////////////
  // page error variables
  
  String errorMessage = "";
  
  boolean invalidForumID = (forumID < 0);
  boolean invalidThreadID = (threadID < 0);
  boolean notAuthorizedToViewForum = false;
  boolean forumNotFound = false;
  boolean threadNotFound = false;
  boolean rootMessageNotFound = false;
%>
<%  //////////////////////////
  // try loading up forums (exceptions may be thrown)
  ForumFactory forumFactory = ForumFactory.getInstance(authToken);
  Forum forum = null;
  try {
    forum = forumFactory.getForum(forumID);
  }
  catch( UnauthorizedException ue ) {
    notAuthorizedToViewForum = true;
%>
<SCRIPT LANGUAGE="JavaScript">doSubmitNavBar('','denied')</SCRIPT>
<%
  }
  catch( ForumNotFoundException fnfe ) {
    forumNotFound = true;
  }
%>
<%  //////////////////////////////////
  // try loading up the thread
  ForumThread thread = null;
  if( forum != null && !invalidThreadID ) {
    try {
      thread = forum.getThread(threadID);
    } catch( ForumThreadNotFoundException ftnfe ) {}
    if( thread == null ) {
      threadNotFound = true;
    }
  }
%>
<%  ///////////////////////
  // Try loading up the root message
  ForumMessage rootMessage = null;
  int rootMessageID = -1;
  try {
    rootMessage = thread.getRootMessage();
    rootMessageID = rootMessage.getID();
  }
  catch( ForumMessageNotFoundException fmnfe ) {
    rootMessageNotFound = true;
  }
%>
<%  /////////////////////
  // global error check
  boolean errors = (invalidForumID || invalidThreadID 
    || notAuthorizedToViewForum || forumNotFound 
    || threadNotFound || rootMessageNotFound || (forum==null) );
%>
<%  /////////////////////
  // check for errors
  if( errors ) {
    if( invalidForumID ) {
      errorMessage = "No forum specified or invalid forum ID.";
    }
    else if( notAuthorizedToViewForum ) {
      errorMessage = "No permission to view this forum.";
    }
    else if( forumNotFound ) {
      errorMessage = "Requested forum was not found in the system.";
    }
    else if( threadNotFound ) {
      errorMessage = "Requested thread was not found in the system.";
    }
    else if( rootMessageNotFound ) {
      errorMessage = "Requested message was not found in the system.";
    }
    else {
      errorMessage = "General error occured. Please contact the "
        + "administrator and bug him/her.";
    }
    request.setAttribute("message",errorMessage);
    response.sendRedirect("error.jsp");
    return;
  }
%>
<%  //////////////////////
  // get forum properties (assumed no errors at this point)
  String forumName = forum.getName();
  String threadName = thread.getName();
%>
<%  /////////////////////
  // get root message properties
  com.coolservlets.forum.User author = rootMessage.getUser();

  int rootMsgAuthorID = author.getID();
  String authorName = null;
  authorName = author.getUsername();
  Date creationDate = rootMessage.getCreationDate();
  String rootMsgSubject = rootMessage.getSubject();
  String rootMsgBody = rootMessage.getBody();
%>
<%  /////////////////////
// print out the number of replies
int numReplies = thread.getMessageCount()-1;
%>

     
     <!---------header table------------->
    <table width="100%" cellspacing="0" cellpadding="0" border="0">
    
      <tr>
        <td valign="top" height="5"><img src="/i/clear.gif" width="1" height="5" /></td>
      </tr>
      
<% if (responseURL=="") {%>
      <tr>
        <td valign="middle" class="statText"><a href="/rtables/index.jsp" class="statText">[ view round tables ]</a> &#160;<a href="/rtables/viewForum.jsp?forum=<%=forumID%>" class="statText">[ view threads ]</a> &#160;<a href="/rtables/post.jsp?mode=new&forum=<%=forumID%>" class="statText">[ post new message ]</a> &#160;<a href="/rtables/search.jsp?forum=<%=forumID%>" class="statText">[ search ]</a> &#160;</td>
      </tr>
<% } else {%>
      <tr>
        <td valign="middle" class="statText"><a href="/rtables/index.jsp" class="statText">[ view round tables ]</a> &#160;<a href="/rtables/viewForum.jsp?forum=<%=forumID%>" class="statText">[ view threads ]</a> &#160;<a href="/rtables/post.jsp?mode=new&forum=<%=forumID%>" class="statText">[ post new message ]</a> &#160;<a href="/rtables/search.jsp?forum=<%=forumID%>" class="statText">[ search ]</a> &#160;</td>
      </tr>
<% } %>


     
    </table>
     <!---------end header table------------->
     
     <br>         
   
<%-- root message --%>
      <table width="100%" cellspacing="0" cellpadding="0" border="0">
       
        <tr>
          <td><img src="/i/clear.gif" width="1" height="1" /></td>
          <td><img src="/i/clear.gif" width="1" height="1" /></td>
          <td><img src="/i/clear.gif" width="1" height="1" /></td>
          <td><img src="/i/clear.gif" width="1" height="1" /></td>
        </tr>
        
        <tr>
          <td valign="middle" colspan="4" class="statTextBig" background="/i/steel_gray_bg.gif" height="18">&#160;<b><%= forumName %> > <%= rootMsgSubject %></b></td>
        </tr>
        
        <tr>
          <td width="1" colspan="4"><img src="/i/clear.gif" width="1" height="1" /></td>
        </tr>
 <% if (rootMessageID!=msgID) {
%>
        <tr>
          <td colspan="4" class="statTextBig" background="/i/steel_bluebv_bg.gif" height="18"><a name =<%= rootMessageID %>> <b><img src="/i/clear.gif" width="3" height="1" /><%= rootMsgSubject %></b></a></td>
        </tr>
<%
  }
  else {
%>
    
        <tr>
          <td width="1" colspan="4"><img src="/i/clear.gif" width="1" height="2" /></td>
        </tr>

        <tr>
          <td colspan="4" class="statTextBig" background="/i/steel_bluebv_bg.gif" height="18"><a name =<%= rootMessageID %>> <b><img src="/i/clear.gif" width="3" height="1" /><%= rootMsgSubject %></b></a></td>
        </tr>
<% }
%>

        
        <tr background="/i/steel_darkblue_bg.gif">
          <td width="1" colspan="4"><img src="/i/clear.gif" width="1" height="1" /></td>
        </tr>
     
        <tr>
          <td align="left" class="statText" background="/i/steel_blue_bg.gif" height="18">
            <img src="/i/clear.gif" width="3" height="1" />Posted By: <%=getUserDisplay(author)%></td>


          <td colspan="3" align="right" class="statText" background="/i/steel_blue_bg.gif" height="18">Posted <i><%= dateFormatter.format(creationDate) %>&#160;<img src="/i/clear.gif" width="6" height="1" /></td>
        </tr>
        <tr>
          <td width="1" colspan="4"><img src="/i/clear.gif" width="1" height="3" /></td>
        </tr>
      
        <tr>
          <td colspan="4" class="statText"><img src="/i/clear.gif" width="3" height="1" /><%= (rootMsgBody!=null)?rootMsgBody:"" %></td>
        </tr>
     
        <tr>
          <td width="1" colspan="4"><img src="/i/clear.gif" width="1" height="3" /></td>
        </tr>
      
        <tr>
          <td width="1" colspan="4"><img src="/i/clear.gif" width="1" height="2" /></td>
        </tr>
        
        <tr>
         <td colspan="4">
           <img src="/i/clear.gif" width="1" height="4" />
         </td>
       </tr>
      
        <tr>
          <td width="1" colspan="4"><img src="/i/clear.gif" width="1" height="5" /></td>
        </tr>
<% if (responseURL=="") {
%>
        <tr>
          <td width="1" colspan="4" align="center"><a class="statTextBig" href="<%=response.encodeURL("/rtables/post.jsp")%>?mode=reply&forum=<%=forumID%>&thread=<%=threadID%>&message=<%=rootMessageID%>">[ Reply ]</a></td>
        </tr>
<%
  }
  else {
%>
        <tr>
          <td width="1" colspan="4" align="center"><a class="statTextBig" href="<%=response.encodeURL("/rtables/post.jsp")%>&mode=reply&forum=<%=forumID%>&thread=<%=threadID%>&message=<%=rootMessageID%>"><span class="statText">[ Reply ]</span></a></td>
        </tr>
<% }
%>

      
        <tr>
          <td width="1" colspan="4"><img src="/i/clear.gif" width="1" height="15" /></td>
        </tr>
      
        <tr>
          <td valign="top" colspan="4" class="statText"><b>There <%= (numReplies==1)?"is":"are" %> <%= numReplies %> <%= (numReplies==1)?"reply":"replies" %> to this message.</b></td>
        </tr>
      
    </table>
    
    
    
<%  /////////////////////////
  // print out all child messages:
  
  // if there are children to display:
  if( numReplies > 0 ) {
    StringBuffer buf = new StringBuffer();
    TreeWalker treeWalker = thread.treeWalker();
    int numChildren = treeWalker.getChildCount(rootMessage);
    int indentation = 1;
    for( int i=0; i<numChildren; i++ ) {
      buf.append( 
        printChildren( treeWalker, forum, thread, treeWalker.getChild(rootMessage,i), indentation, msgID, bufurl, responseURL)
      );
    }
%>
    <%= buf.toString() %>
<%  }
%>
                <!---------end body table------------->
                <br>
                <br>
                <br>
                <!--------end main content table------------>
              </td>
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
        <TD WIDTH="10" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
        <!-- Gutter Ends -->
        <!-- Right Column Begins -->
        <TD WIDTH="10" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"><BR>
          <!-- Right Column Include Begins -->
          <!-- Right Column Include Ends -->
        </TD>
        <!-- Right Column Ends -->
        <!-- Gutter -->
        <TD WIDTH="25" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"></TD>
        <!-- Gutter Ends -->
      </TR>
    </TABLE>
    <jsp:include page="../foot.jsp" />
  </BODY>
</HTML>


