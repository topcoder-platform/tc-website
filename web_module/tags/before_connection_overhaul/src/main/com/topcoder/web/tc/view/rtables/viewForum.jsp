<%--
/**
 *  viewForum.jsp
 */
--%>
<%@  page
  language="java"
  import="java.util.*,
          javax.naming.*,
          java.text.*,
          com.coolservlets.forum.*,
          com.coolservlets.forum.util.*,
          weblogic.common.T3Services,
          com.topcoder.common.web.data.Navigation,
          com.topcoder.common.*" %>
<%  ////////////////
  Authorization authToken = null;
  Navigation n = null;
  String rtUser = "";
  String rtPassword = "";
  String Redirect_URL = "http://" + request.getServerName();
  String Redirect_URL_NO_PERM = "http://" + request.getServerName() + "/rtables/perm_error.jsp";
  String responseURL = response.encodeURL("");
%>



<%  //////////////////////
    try {
     n = (Navigation) session.getAttribute("navigation");
     if ( n == null ) n = new Navigation(request, response);
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

      if(rtUser==""){
        authToken = authFactory.getAnonymousAuthorization();
        session.setAttribute("jiveAuthorization",authToken);
      } else {
        authToken = authFactory.getAuthorization(rtUser,rtPassword);
        session.setAttribute("jiveAuthorization",authToken);
      }
%>

<%
    // get the authToken as a way to get userID's below
  authToken = (Authorization)session.getAttribute("jiveAuthorization");
%>

<%
String checked1 = ""; 
String checked2 = ""; 
String checked3 = "";
String checked4 = "";
%>

<%  //////////////////////
  // get parameters

  int range    = ParamUtils.getIntParameter(request,"range",DEFAULT_RANGE);
  int start    = ParamUtils.getIntParameter(request,"start",0);
  int forumID  = ParamUtils.getIntParameter(request,"forum",-1);
%>

<%  //////////////////////
  // page error variables

  String errorMessage = "";
  boolean invalidForumID = (forumID < 0);
  boolean notAuthorizedToViewForum = false;
  boolean forumNotFound = false;
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
    response.sendRedirect(Redirect_URL_NO_PERM);
    return;
  }

  catch( ForumNotFoundException fnfe ) {
    forumNotFound = true;
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

    <!--------main content table------------>

<%!  ////////////////
   // global variables
   // date formatter

   SimpleDateFormat dateFormatter 
     = new SimpleDateFormat("EEE, MMM d yyyy 'at' hh:mm a z");

   // number of threads to display per page array:
   private final int[] threadRange = { 10,25,50,100 };

   // default starting index and number of threads to display
   // per page (for paging)

   private final int DEFAULT_RANGE = 10;
   private final int START_INDEX   = 0;
%>

<% /////////////////////
   // global error check

   boolean errors = (invalidForumID || notAuthorizedToViewForum || forumNotFound || (forum==null) );
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
     else {
       errorMessage = "General error occured. Please contact the "
         + "administrator and bug him/her.";
     }
     request.setAttribute("message",errorMessage);
     response.sendRedirect("errorPage.jsp");
     return;
   }
%>

<% //////////////////////
   // get forum properties (assumed no errors at this point)

   String forumName = forum.getName();
   int numThreads = forum.getThreadCount();
   int numMessages = forum.getMessageCount();
%>

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
                <jsp:param name="title" value="<%=forumName%>"/>
            </jsp:include>

            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
                <TR VALIGN="top">
                    <TD WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
                    <TD class="statText" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="10" BORDER="0"/><br>
                        <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">

<% if (responseURL=="") { %>
                            <tr><td valign="middle" class="statText"><a href="/rtables/index.jsp" class="statText">[ view round tables ]</a> &#160;<a href="/rtables/post.jsp?mode=new&forum=<%=forumID%>" class="statText">[ post new message ]</a> &#160;<a href="/rtables/search.jsp?forum=<%=forumID%>" class="statText">[ search ]</a> &#160;</td></tr>

<% } else {%>
                  <tr><td valign="middle" class="statText"><a href="/rtables/index.jsp" class="statText">[ view round tables ]</a> &#160;<a href="/rtables/post.jsp?&mode=new&forum=<%=forumID%>" class="statText">[ post new message ]</a> &#160;<a href="/rtables/search.jsp?&forum=<%=forumID%>" class="statText">[ search ]</a> &#160;</td></tr>

<% }%>

                        </TABLE>

                <!---------end header table------------->

                <br>

                <!---------body table------------->

                        <TABLE cellspacing="0" cellpadding="0" border="0" width="100%">
                            <tr>
                                <td width="40%"><img src="/i/clear.gif" width="1" height="1" /></td>
                                <td width="2"><img src="/i/clear.gif" width="2" height="1" /></td>
                                <td width="10%"><img src="/i/clear.gif" width="1" height="1" /></td>
                                <td width="2"><img src="/i/clear.gif" width="2" height="1" /></td>
                                <td width="25%"><img src="/i/clear.gif" width="1" height="1" /></td>
                                <td width="2"><img src="/i/clear.gif" width="2" height="1" /></td>
                                <td width="25%"><img src="/i/clear.gif" width="1" height="1" /></td>
                            </tr>
                            
                            <tr>
                                <td valign="bottom" align="left" colspan="7" class="statText">
                                    <form action="">       
                                    <input type="hidden" name="forum" value="<%= forumID %>"/>
                                    <input type="hidden" name="start" value="<%= start %>"/>

  <%  if( range == 10 ) { %>

  <%    checked1="checked"; %>

  <%  } else { %>

  <%  checked1="";} %>

  <%  if( range == 25 ) { %>

  <%    checked2="checked"; %>

  <%  } else { %>

  <%  checked2="";} %>

  <%  if( range == 50 ) { %>

  <%    checked3="checked"; %>

  <%  } else { %>

  <%  checked3="";} %>

  <%  if( range == 100 ) { %>

  <%    checked4="checked"; %>

  <%  } else { %>

  <%  checked4="";} %>

                            Show 

<% if (responseURL=="") {%>

                                    <input type=radio name="range" value="10" <%=checked1%> onclick="window.location='/rtables/viewForum.jsp?forum=<%=forumID%>&range='+this.value;"/>10
                                    <input type=radio name="range" value="25" <%=checked2%> onclick="window.location='/rtables/viewForum.jsp?forum=<%=forumID%>&range='+this.value;"/>25
                                    <input type=radio name="range" value="50" <%=checked3%> onclick="window.location='/rtables/viewForum.jsp?forum=<%=forumID%>&range='+this.value;"/>50
                                    <input type=radio name="range" value="100" <%=checked4%> onclick="window.location='/rtables/viewForum.jsp?forum=<%=forumID%>&range='+this.value;"/>100

<%} else {%>

                                    <input type=radio name="range" value="10" <%=checked1%> onclick="window.location='/rtables/viewForum.jsp?&forum=<%=forumID%>&range='+this.value;"/>10
                                    <input type=radio name="range" value="25" <%=checked2%> onclick="window.location='/rtables/viewForum.jsp?&forum=<%=forumID%>&range='+this.value;"/>25
                                    <input type=radio name="range" value="50" <%=checked3%> onclick="window.location='/rtables/viewForum.jsp?&forum=<%=forumID%>&range='+this.value;"/>50
                                    <input type=radio name="range" value="100" <%=checked4%> onclick="window.location='/rtables/viewForum.jsp?&forum=<%=forumID%>&range='+this.value;"/>100

<%}%>

                              &#160;Messages per page.  

                                    <noscript>
                                        <input type="submit" value="Change" class="statText">
                                    </noscript>
                                    </form><img src="/i/clear.gif" width="1" height="2" /><BR/>
                                </td>
                            </tr>
                  
                            <tr><td valign="middle" colspan="7" class="statTextBig" background="/i/steel_gray_bg.gif" Height="18" >&#160;<b><%= forumName %></b> &#160;<font color="#ffffff">&#160;Threads: <%= numThreads %>, Messages: <%= numMessages %></font></td></tr> 
                            
                            <tr><td width="1" colspan="7"><img src="/i/clear.gif" width="1" height="1" /></td></tr>                                   

                            <tr><td align="right" colspan="7" class="statText" Height="18">

<% if( start > 0 ) { %>

  <% if ( responseURL =="") {%>

                                    <a href="/rtables/viewForum.jsp?forum=<%=forumID%>&start=<%= (start-range) %>&range=<%= range %>" class="statText">&lt;&lt;&#160;Last <%= range %> threads</a>

  <%} else {%>

                                    <a href="/rtables/viewForum.jsp?&forum=<%=forumID%>&start=<%= (start-range) %>&range=<%= range %>" class="statText">&lt;&lt;&#160;Last <%= range %> threads</a>

  <% }%>

<% }%>&#160;

<% if( numThreads > (start+range) ) { %>

  <% int numRemaining = (numThreads-(start+range)); %>

  <% if ( responseURL =="") {%>

                                    <a href="/rtables/viewForum.jsp?forum=<%=forumID%>&start=<%= (start+range) %>&range=<%= range %>" class="statText">Next <%= (numRemaining>range)?range:numRemaining %> threads&#160;&gt;&gt;&#160;&#160;</a>

  <% } else {%>

                                    <a href="/rtables/viewForum.jsp?&forum=<%=forumID%>&start=<%= (start+range) %>&range=<%= range %>" class="statText">Next <%= (numRemaining>range)?range:numRemaining %> threads&#160;&gt;&gt;&#160;&#160;</a>
&#160;
  <% }%>

<% }%>

                                </td>
                            </tr>

                            <tr><td width="1" colspan="7"><img src="/i/clear.gif" width="1" height="1" /></td></tr>

<% if( start > 0 ) { %>

<% }%>

<% if( numThreads > (start+range) ) {%>

  <% int numRemaining = (numThreads-(start+range));%>

<% }%>

                            <tr>
                                <td class="statText" valign="middle" background="/i/steel_bluebv_bg.gif" height="18">&#160;<b>Subject</b></td>
                                <td background="/i/steel_bluebv_bg.gif"><img src="/i/clear.gif" width="2" height="1" /></td>
                                <td class="statText" valign="middle" background="/i/steel_bluebv_bg.gif"><b>Replies</b></td>
                                <td background="/i/steel_bluebv_bg.gif"><img src="/i/clear.gif" width="2" height="1" /></td>
                                <td class="statText" valign="middle" background="/i/steel_bluebv_bg.gif"><b>Posted By</b></td>
                                <td background="/i/steel_bluebv_bg.gif"><img src="/i/clear.gif" width="2" height="1" /></td>
                                <td class="statText" valign="middle" background="/i/steel_bluebv_bg.gif"><b>Last Updated</b></td>
                           </tr>
                           
                           <tr><td width="1" colspan="7"><img src="/i/clear.gif" width="1" height="3" /></td></tr>

<% // get an iterator of threads

   Iterator threadIterator = forum.threads(start,range);

   if( !threadIterator.hasNext() ) {%>

                            <tr bgcolor="#000000">
                                <td colspan="5" align="center" class="statText"><br><i>

  <% if (responseURL=="") {%>

                                    No messages in this forum. Try <a href="/rtables/post.jsp?mode=new&forum=<%=forumID%>" class="statText">adding your own</a>.

  <% } else {%>

                                    No messages in this forum. Try <a href="/rtables/post.jsp?&mode=new&forum=<%=forumID%>" class="statText">adding your own</a>.

  <% }%>

                                    </i>

                                    <br><br>
                                </td>
                            </tr>

<% }

   while( threadIterator.hasNext() ) {

     ForumThread thread = (ForumThread)threadIterator.next();

     int threadID = thread.getID();

     String threadName = thread.getName();

     ForumMessage rootMessage = null;

     try {

       rootMessage = thread.getRootMessage();

     } catch( ForumMessageNotFoundException e ) {}

     boolean rootMsgIsAnonymous = rootMessage.isAnonymous();

     User rootMessageUser = rootMessage.getUser();

     String username = rootMessageUser.getUsername();

     String name = rootMessageUser.getName();

     String email = rootMessageUser.getEmail();%>

                            <tr><td width="1" colspan="7"><img src="/i/clear.gif" width="1" height="3" /></td></tr>

                            <tr>

  <% if ( responseURL =="") {%>

                                <td valign="top" class="statText"><a href="/rtables/viewThread.jsp?forum=<%= forumID %>&thread=<%= threadID %>&mc=<%=thread.getMessageCount()%>" class="statText"><%= threadName %></a></td>

  <% } else {%>

                                <td valign="top" class="statText"><a href="/rtables/viewThread.jsp?&forum=<%= forumID %>&thread=<%= threadID %>&mc=<%=thread.getMessageCount()%>" class="statText"><%= threadName %></a></td>

  <% }%>

                                <td><img src="/i/clear.gif" width="2" height="1" /></td>
                                <td valign="top" nowrap="" class="statText"><%= (thread.getMessageCount()-1) %></td>
                                <td><img src="/i/clear.gif" width="2" height="1" /></td>
                                <td valign="top" nowrap="" class="statText"><%=getUserDisplay(rootMessageUser)%></td>
                                <td><img src="/i/clear.gif" width="2" height="1" /></td>
                                <td valign="top" nowrap="" class="statText"><%= dateFormatter.format( thread.getModifiedDate() ) +(thread.getUser().getUsername()==null?"":" by "+getUserDisplay(thread.getUser())) %></td>
                            </tr>

                            <tr><td width="1" colspan="7"><img src="/i/clear.gif" width="1" height="3" border="0"/></td></tr>

<% }%>

                            <tr><td width="1" colspan="7"><img src="/i/clear.gif" width="1" height="6" border="0"/></td></tr>
                            <tr><td width="1" colspan="7" background="/i/steel_blue_bg.gif"><img src="/i/clear.gif" width="1" height="5" border="0"/></td></tr>
                            <tr><td width="1" colspan="7"><img src="/i/clear.gif" width="1" height="10" border="0"/></td></tr>

<% if ( responseURL =="") {%>

                            <tr><td align="center" colspan="7" class="statText"><a href="/rtables/post.jsp?mode=new&forum=<%=forumID%>" class="statText"><b>Post New Message &gt;&gt;</b></a></td></tr>

<% } else {%>

                            <tr><td align="center" colspan="7" class="statText"><a href="/rtables/post.jsp?&mode=new&forum=<%=forumID%>" class="statText"><b>Post New Message &gt;&gt;</b></a></td></tr>

<% }%>

                            <tr><td width="1" colspan="7"><img src="/i/clear.gif" width="1" height="10" /></td></tr>
                        </TABLE>    
                    </TD>
                    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
                </TR>
                
                <TR><TD COLSPAN="3" VALIGN="top" BGCOLOR="#001B35" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>     
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

