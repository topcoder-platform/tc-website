<%--     
/**
 * post.jsp
 * Coolservlets.com
 * July 26, 2000
 */
--%>

<%@ page    
    language="java"
    import="java.util.*,
            java.text.*,
            java.net.URLEncoder,
            com.coolservlets.util.*,
            com.coolservlets.forum.*,
            com.coolservlets.forum.util.*,
            com.topcoder.common.web.data.Navigation,
            com.topcoder.ejb.DataCache.*,
            com.topcoder.common.*" %>
<%
    Navigation n = null;
    String Redirect_URL = "http://" + request.getServerName() + "/rtables/perm_error.jsp";
    String url ="";
    String responseURL = "";
    String responsePostURL = responseURL.equals("") ? "" :  responseURL.substring(1);
    String timeoutURL = "http://" + request.getServerName() + "?Command=session_timeout";
    n = (Navigation) session.getAttribute("navigation"); 
    if (n==null) {
      session = request.getSession(true);
      response.sendRedirect(timeoutURL);
    }
    try {
      n = (Navigation) session.getAttribute("navigation"); 
    } catch( Exception e ) {
      e.printStackTrace();
      response.sendRedirect(Redirect_URL);
    }
    if ( !n.getLoggedIn() ) {
      session = request.getSession(true);
      if ( session != null ){
        response.sendRedirect(Redirect_URL);
      }
    }
    // authorization check
    if(!SkinUtils.userIsAuthorized(request,session)) {
      response.sendRedirect(Redirect_URL);
    }
    // get the authToken as a way to get userID's below
    Authorization authToken = (Authorization)session.getValue("jiveAuthorization");
    if (authToken.getUserID() == -1) {  //if it's an anonymous user, they can't post
      response.sendRedirect(Redirect_URL);
    }
    // get parameters
    int forumID  = ParamUtils.getIntParameter(request,"forum",-1);
    int threadID = ParamUtils.getIntParameter(request,"thread",-1);
    int messageID = ParamUtils.getIntParameter(request,"message",-1);
    String mode = ParamUtils.getParameter(request,"mode");
    boolean isNew = (mode != null && mode.equals("new"));
    boolean isReply = (mode != null && mode.equals("reply"));
    boolean invalidMode = !(isNew || isReply);
    String errorMessage = "";
    boolean invalidForumID = (forumID < 0);
    boolean invalidThreadID = (threadID < 0 && isReply);
    boolean invalidMessageID = (messageID < 0 && isReply);
    boolean notAuthorizedToViewForum = false;
    boolean forumNotFound = false;
    boolean threadNotFound = false;
    boolean messageNotFound = false;
    // try loading up forums (exceptions may be thrown)
    ForumFactory forumFactory = ForumFactory.getInstance(authToken);
    Forum forum = null;
    try {
      forum = forumFactory.getForum(forumID);
    }
    catch( UnauthorizedException ue ) {
      ue.printStackTrace();
      notAuthorizedToViewForum = true;
    }
    catch( ForumNotFoundException fnfe ) {
      fnfe.printStackTrace();
      forumNotFound = true;
    }
    // try loading up the thread
    ForumThread thread = null;
    if( isReply && forum != null && !invalidThreadID ) {
      try {
        thread = forum.getThread(threadID);
      } catch( ForumThreadNotFoundException ftnfe ) {
        ftnfe.printStackTrace();
      }
      if( thread == null ) {
        threadNotFound = true;
      }
    }
    // try loading up the message
    ForumMessage message = null;
    if( isReply && forum != null && !invalidThreadID ) {
      try {
        message = thread.getMessage(messageID);
      } catch( ForumMessageNotFoundException fmnfe ) {
        fmnfe.printStackTrace();
      }
      if( message == null ) {
        messageNotFound = true;
      }
    }
    // global error check
    boolean errors = (invalidMode || invalidForumID || invalidThreadID
      || invalidMessageID || messageNotFound 
      || notAuthorizedToViewForum || forumNotFound 
      || threadNotFound || (forum==null) );
    // check for errors
    if( errors ) {
      if ( invalidMode ) {
        errorMessage = "A mode was not passed in.";
      }
      if( invalidForumID ) {
        errorMessage = "No forum specified or invalid forum ID.";
      }
      if ( isReply && invalidThreadID ) {
        errorMessage = "No thread specified or invalid thread ID.";
      }
      if ( isReply && invalidMessageID ) {
        errorMessage = "No message specified or invalid message ID.";
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
      else if( messageNotFound ) {
        errorMessage = "Requested message was not found in the system.";
      }
      else {
        errorMessage = "General error occured. Please contact the "
          + "administrator and bug him/her.";
      }
      response.sendRedirect("error.jsp?msg="+ URLEncoder.encode(errorMessage));
    }
    boolean doCreate = ParamUtils.getBooleanParameter(request, "doCreate");
    //Check to see if we're actually submitting a message.
    if (doCreate) {
      User currentUser = null;
      try {
        currentUser = forumFactory.getProfileManager().getUser(authToken.getUserID());
      } catch( UserNotFoundException unfe ) {
        unfe.printStackTrace();
        response.sendRedirect("error.jsp?msg="+ URLEncoder.encode("User not found"));
      }
      ForumMessage newMessage = null;
      try {
        newMessage = forum.createMessage(currentUser);
      } catch( UnauthorizedException ue ) {
        ue.printStackTrace();
        response.sendRedirect("error.jsp?msg="+ URLEncoder.encode("User not authorized to create message."));
      }
      String newSubject = ParamUtils.getParameter(request, "subject");
      String newBody = ParamUtils.getParameter(request, "body");
      try {

        newMessage.setSubject(newSubject);

        newMessage.setBody(newBody);

      } catch( UnauthorizedException ue ) {

        ue.printStackTrace();

        response.sendRedirect("error.jsp?msg="+ URLEncoder.encode("User not authorized to create message."));

      }



      // check again to make sure they are logged in before posting a message

      try {

        if (isNew) {

          ForumThread newThread = null;

          try {

            newThread = forum.createThread(newMessage);

            forum.addThread(newThread);

          } catch( UnauthorizedException ue ) {}

          url = "/rtables/viewForum.jsp?forum=" + forumID;

          response.sendRedirect(url);

        } else {

          thread.addMessage(message, newMessage);

          url = "/rtables/viewThread.jsp?forum=" + forumID + "&thread=" + threadID + "&message=" + messageID;

          if ( !response.isCommitted() )

          response.sendRedirect(url);

        }

      } catch (Exception e) {

        e.printStackTrace();

        response.sendRedirect(Redirect_URL);

      }

    }





    // get forum properties (assumed no errors at this point)

    String forumName = forum.getName();

    String threadName = "";

    if (isReply && thread != null) {  

      threadName = thread.getName();

    }

%>











<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<HTML>

  <HEAD>

    <TITLE>Round Tables</TITLE>

    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>

    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>

    <%@ include file="../script.jsp" %>
    <%@ include file="rating.jsp" %>

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

        <TD class="statText" width="100%" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="400" HEIGHT="1" VSPACE="5" BOR

DER="0"><BR>
        <jsp:include page="../body_top.jsp" >
           <jsp:param name="image" value="round_tables"/>
           <jsp:param name="image1" value="steelblue"/>
           <jsp:param name="title" value="Post New Message"/>
        </jsp:include>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD class="statText" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>          

          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
      <tr>

        <td valign="top" height="5"><img src="/i/clear.gif" width="1" height="5" /></td>

      </tr>          

<%

    if (isNew) { 

      if (responseURL=="") {

%>

            <tr>

              <td valign="middle" class="statText">

                <a href="/rtables/index.jsp" class="statText">[ view round tables ]</a>&nbsp;

                <a href="/rtables/viewForum.jsp?forum=<%= forumID %>" class="statText">[ view messages ]</a>

              </td>

            </tr>

<%

      } 

      else {

%>

            <tr>

              <td valign="middle" class="statText">

                <a href="/rtables/index.jsp" class="statText" class="statText">[ view round tables ]</a>&nbsp;

                <a href="/rtables/viewForum.jsp&forum=<%= forumID %>" class="statText">[ view messages ]</a>

              </td>

            </tr>

<%

      }

    }

    else if (isReply) {

      if (responseURL=="") {

%>

            <tr> 

              <td valign="middle" class="statText">

                <a href="/rtables/index.jsp" class="statText">[ view round tables ]</a>&nbsp;

                <a href="/rtables/viewForum.jsp?forum=<%= forumID %>" class="statText">[ view messages ]</a>&nbsp;

                <a href="/rtables/search.jsp?forum=<%=forumID%>" class="statText">[ search ]</a>

              </td>

            </tr>

<%

      }

      else {

%>

            <tr>

              <td valign="middle" class="statText">

                <a href="/rtables/index.jsp" class="statText">[ view round tables ]</a>&nbsp;

                <a href="/rtables/viewForum.jsp&forum=<%= forumID %>" class="statText">[ view messages ]</a>&nbsp;

                <a href="/rtables/search.jsp&forum=<%=forumID%>" class="statText">[ search ]</a>

              </td>

            </tr>

<%

      }

    }

%>



          </TABLE>



  <!---------end header table------------->


   <form action="/rtables/post.jsp" name="postForm" method="post" onSubmit="return authorizedSubmit">

     <input type="hidden" name="doCreate" value="true">

     <input type="hidden" name="mode" value="<%= mode %>">

     <input type="hidden" name="forum" value="<%= forumID %>">

<% if(isReply) { %>

     <input type="hidden" name="thread" value="<%= threadID %>">

     <input type="hidden" name="message" value="<%= messageID %>">

<% } %>

     <table width="100%" border="0" cellpadding="0" cellspacing="0">

       <tr>

         <td align="center" valign="middle" width="5" height="1"><img src="/i/clear.gif"></td>

       </tr>

       <tr>

         <td align="center">

           <table border="0" cellpadding="0" cellspacing="0">

             <tr>

<% if (isNew) {%>

               <td valign="middle" class="statText" background="/i/steel_gray_bg.gif" height="18"><b>&#160;Post New Message</b></td>

<% } else if (isReply) {%>

               <td valign="middle" class="statText" background="/i/steel_gray_bg.gif" height="18"><b>&#160;Reply to: <%= message.getSubject() %></b></td>

<% }%>

             </tr>





<%  

   String parentSubject = "";

   if( message != null ) {

     parentSubject = message.getSubject();

     if (parentSubject == null) {

       parentSubject = "Re: your post";

     } else if( !parentSubject.startsWith( "Re:" ) ) {

       parentSubject = "Re: " + parentSubject;

     }

   }

%>

    

             <tr>

               <td align="center" valign="middle" height="1"><img src="/i/clear.gif" width="1" height="1"></td>

             </tr>

             <tr>

               <td valign="middle" class="statText" background="/i/steel_blue_bg.gif" height="18">&#160;Subject:</td>

             </tr>

             <tr>

               <td><input name="subject" value="<%= parentSubject %>" size="55"></td>

             </tr>

             <tr>

               <td align="center" valign="middle" width="5" height="5"><img src="/i/clear.gif"></td>

             </tr>

             <tr>

               <td valign="middle" class="statText">Message: (4000 character max)</td>

             </tr>

             <tr>

               <td><textarea cols="60" rows="15" name="body" wrap="virtual"></textarea></td>

             </tr>

             <tr>

               <td align="center" valign="middle" width="5" height="5"><img src="/i/clear.gif"></td>

             </tr>

           </table>

         </td>

       </tr>

       <tr>

         <td align="center" valign="middle" width="5" height="5"><img src="/i/clear.gif"></td>

       </tr>

       <tr>

         <td align="center" valign="middle" width="5" height="5"><img src="/i/clear.gif"></td>

       </tr>

     </table>

   </form>

      

   <table width="100%" border="0" cellpadding="0" cellspacing="0">

     <tr>

       <td align="center" valign="middle" width="5" height="5"><img src="/i/clear.gif"></td>

     </tr>

     <tr>

<% if (isNew) {%>

       <td align="center" class="statText"><a class="statTextBig" href="Javascript:doValidate()"><b>Post &gt;&gt;</b></a></td>

<% } else if (isReply) {%>

       <td align="center" class="statText"><a class="statTextBig" href="Javascript:doReply()"><b>Post &gt;&gt;</b></a></td>

<% }%>

 

     </tr>

     <tr>

       <td align="center" valign="middle" width="15" height="40"><img src="/i/clear.gif"></td>

     </tr>

   </table>

   <script language="JavaScript" type="text/javascript">

<!--

  var reply = document.postForm

  var authorizedSubmit=false;

  var bodysize = 0;

  function doSubmit() {

    authorizedSubmit=true;

    reply.submit();

  }

  reply.subject.focus();

  function doValidate() { 

    if(doCheckSubject() && doCheckBody())

    reply.submit()

  }

  function doCheckSubject() {

    if(reply.subject.value=="") { 

      alert("Please enter a subject before posting.");

      reply.subject.focus();

      return false;

    }

    return true;

  }

  function doCheckBody() {

    bodysize = reply.body.value.length;

    if(bodysize>4000){

      alert("Your text size is currently " + bodysize + " characters.  Please edit the text so that it is 4000 characters or less.");

      return false;

    } else {

      return true;

    }

  } 

  function doReply(){

    if(doCheckBody())

    reply.submit()

  }

//-->

   </script>



   <table width="100%" cellspacing="0" cellpadding="0" border="0">

<%   

   if (isReply) {

     // get root message properties

     User author = message.getUser();

     int msgAuthorID = author.getID();

     String authorName = null;

     authorName = author.getUsername();

     Date creationDate = message.getCreationDate();

     String msgSubject = message.getSubject();

     String msgBody = message.getBody();

%>

     <tr>

       <td width="1"><img src="/i/clear.gif" width="1" height="1" /></td>

       <td width="1"><img src="/i/clear.gif" width="1" height="1" /></td>

       <td width="1"><img src="/i/clear.gif" width="1" height="1" /></td>

       <td width="1"><img src="/i/clear.gif" width="1" height="1" /></td>        

     </tr>

     <tr>

       <td valign="middle" class="statText"><b>Original Message: <%= forumName %></b></td>

     </tr>

     <tr>

       <td width="1" colspan="4"><img src="/i/clear.gif" width="1" height="2" /></td>

     </tr>

     <tr>

       <td width="1" colspan="4"><img src="/i/clear.gif" width="1" height="1" /></td>

     </tr>

     <tr>

       <td colspan="4" class="statText"><b><img src="/i/clear.gif" width="3" height="1" /><%= msgSubject %></b></td>

     </tr>

     <tr>

       <td width="1" colspan="4"><img src="/i/clear.gif" width="1" height="2" /></td>

     </tr>

     <tr bgcolor="#000000">

       <td width="1" colspan="4"><img src="/i/clear.gif" width="1" height="1" /></td>

     </tr>

     <tr>

       <td align="left" class="statText"><img src="/i/clear.gif" width="3" height="1" />Posted By: <%= getUserDisplay(author)%></td>

       <td colspan="3" align="right" class="statText">Posted <%= SkinUtils.dateToText(creationDate) %>

       <img src="/i/clear.gif" width="3" height="1" /><i></td>

     </tr>

     <tr bgcolor="#333333">

       <td width="1" colspan="4"><img src="/i/clear.gif" width="1" height="1" /></td>

     </tr>

     <tr>

       <td width="1" colspan="4"><img src="/i/clear.gif" width="1" height="3" /></td>

     </tr>

     <tr>

       <td valign="top" colspan="4" class="statText">

         <img src="/i/clear.gif" width="3" height="1" /><%= (msgBody!=null)?msgBody:"" %>

       </td>

     </tr>

     <tr>

       <td width="1" colspan="4"><img src="/i/clear.gif" width="1" height="3" /></td>

     </tr>

     <tr>

       <td width="1" colspan="4" bgcolor="#333333"><img src="/i/clear.gif" width="1" height="2" /></td>

     </tr>

     <tr>

       <td width="1" colspan="4"><img src="/i/clear.gif" width="1" height="5" /></td>

     </tr>



<% }%>





            <br clear="all">

          </TABLE>

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

          <!-- <%@ include file="right.jsp" %> -->

          <!-- Right Column Include Ends -->

        </TD>

        <!-- Right Column Ends -->

        <!-- Gutter -->

        <TD WIDTH="25" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"></TD>

        <!-- Gutter Ends -->

      </TR>

    </TABLE>

    <%@ include file="../foot.jsp" %>

  </BODY>

</HTML>

