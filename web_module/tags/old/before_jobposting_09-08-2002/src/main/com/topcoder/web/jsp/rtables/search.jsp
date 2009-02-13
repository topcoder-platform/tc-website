<%--
/**
 *  /skins/vodka/search.jsp
 */
--%>

<%@  page
  language="java"
  import="java.util.*,
          java.text.*,
          com.coolservlets.forum.*,
          com.coolservlets.forum.util.*,
          com.topcoder.common.*"
          errorPage="error.jsp"
%>

<%  ////////////////

  //

  String Redirect_URL = "http://" + request.getServerName();
  String url ="";
  String responseURL = response.encodeURL("");
  String responsePostURL = responseURL.equals("") ? "" :  responseURL.substring(1);

%>        

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
           <jsp:param name="title" value="Search"/>
        </jsp:include>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD class="statText" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>


                <form action="/rtables/search.jsp" method="post" name="searchForm" onSubmit="return authorizedSubmit">

                <TABLE BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">





<%  ////////////////////////

  // authorization check

  if( ! SkinUtils.userIsAuthorized(request,session) ) {

    response.sendRedirect(Redirect_URL);

  }

  

  // get the authToken as a way to get userID's below

  Authorization authToken 

    = (Authorization)session.getValue("jiveAuthorization");

%>

<%  //////////////////

  // get parameters

  

  boolean doSearch = ParamUtils.getBooleanParameter(request,"doSearch");

  String queryText = ParamUtils.getParameter(request,"q");

  int forumID = ParamUtils.getIntParameter(request,"forum",-1);

%>

     

    

<% if (responseURL=="") {

%>

    <tr>

      <td valign="middle" class="statText"><a class="statText" href="/rtables/index.jsp">[view round tables]</a> &#160;<a class="statText" href="/rtables/post.jsp?mode=new&forum=<%=forumID%>">[post new message]</a>&#160;</td>

    </tr>

<%

  }

  else {

%>

    <tr>

      <td valign="middle" class="statText"><a class="statText" href="/rtables/index.jsp">[view round tables]</a> &#160;<a class="statText" href="/rtables/post.jsp&mode=new&forum=<%=forumID%>">[post new message]</a>  &#160;</td>

    </tr>

<% }

%>

                </TABLE>
                

                <!---------end header table------------->

                <br>

     

<%  /////////////////

  // perform a search



  Iterator searchResults = null;

  Query query = null;

  if( doSearch && queryText!=null && forumID>0 ) {

    

    ForumFactory forumFactory = ForumFactory.getInstance(authToken);

    Forum forum = forumFactory.getForum(forumID);

    query = forum.createQuery();

    query.setQueryString(queryText);

    searchResults = query.execute();

  }

%>

<%  //////////////////////////

  // try loading up forums (exceptions may be thrown)

  ForumFactory forumFactory = ForumFactory.getInstance(authToken);

  ProfileManager manager = forumFactory.getProfileManager();

  Forum forum = null;

  boolean notAuthorizedToViewForum = false;

  boolean forumNotFound = false;

  try {

    forum = forumFactory.getForum(forumID);

  }

  catch( UnauthorizedException ue ) {

    notAuthorizedToViewForum = true;

  }

  catch( ForumNotFoundException fnfe ) {

    forumNotFound = true;

  }

  String forumName = forum.getName();

%>

                <center>



                <input type="hidden" name="doSearch" value="true">

                <input type="hidden" name="forum" value="<%= forumID %>">

                <table BACKGROUND="/i/steel_darkblue_bg.gif" cellspacing="0" cellpadding="0" border="0" align="center">

                  <tr>

                    <td align="middle"><input type="text" name="q" maxlength="40" size="35" onKeyPress="submitEnter(event)"></td>

                    <td><img src="/i/clear.gif" width="10" height="1"></td>

                    <td class="statText"><A class="statText" HREF="Javascript:document.searchForm.submit()"><b>Search &gt;&gt;</b></A></td>

                  </tr>

                  <tr><td><img src="/i/clear.gif" width="10" height="20"></td></tr>

                </table>

                </center>

                <script language="JavaScript" type="text/javascript">

<!--

var authorizedSubmit=false;



function doSubmit(){authorizedSubmit=true; document.searchForm.submit();}

  document.searchForm.q.focus();



function submitEnter(e) {

  var keycode;

  if (window.event) keycode = window.event.keyCode;

  else if (e) keycode = e.which;

  else return true;

  if (keycode == 13) {

   doSubmit();

   return false;

  } else return true;

}

//-->

                </script>

<%  if( doSearch ) { %>

<br/><br/>

                <table width="100%" cellspacing="0" cellpadding="0" border="0">

                  <tr>

                    <td><img src="/i/clear.gif" width="4" height="4" /></td>

                  </tr>

                  <tr >

                    <td class="statText">&#160;Search Results</td>

                  </tr>

                  <tr >

                    <td><img src="/i/clear.gif" width="1" height="2" /></td>

                  </tr>

                  <tr>

                    <td><img src="/i/clear.gif" width="1" height="5" /></td>

                  </tr>

                  <tr>

                    <td class="statText">



  

<%  if( searchResults == null || !searchResults.hasNext() ) { %>

                      <center><i>No results were found. Please try another search.</i></center>

<%  } else {

      User user = manager.getUser(authToken.getUserID()); 

      if (responseURL=="") { %>

                      <ol>

  <%  while( searchResults.hasNext() ) { %>

    <%    ForumMessage message = (ForumMessage)searchResults.next(); %>

    <li><a class="statText" href="/rtables/viewThread.jsp?forum=<%=forumID%>&thread=<%=message.getForumThread().getID()%>&message=<%=message.getID()%>#<%=message.getID()%>">

    <%= message.getSubject() %></a> by <%= message.getUser().getUsername() %>

    <%  } %>

                      </ol>

<%

  }

  else {

%>

                      <ol>

  <%  while( searchResults.hasNext() ) { %>

    <%    ForumMessage message = (ForumMessage)searchResults.next(); %>

    <li><a class="statText" href="/rtables/viewThread.jsp&forum=<%=forumID%>&thread=<%=message.getForumThread().getID()%>&message=<%=message.getID()%>#<%=message.getID()%>">

    <%= message.getSubject() %></a> by <%= message.getUser().getUsername() %>

    <%  } %>

                      </ol>

<% } %>

<% } %>



                    </td>

                  </tr>

                  <tr>

                    <td><img src="/i/clear.gif" width="1" height="5" /></td>

                  </tr>

                  <tr >

                    <td><img src="/i/clear.gif" width="1" height="2" /></td>

                  </tr>

                  <tr>

                    <td><img src="/i/clear.gif" width="4" height="4" /></td>

                  </tr>



<%  } %>

                </TABLE>


    </TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->
        <!-- Gutter -->
        <TD WIDTH="10" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
        <!-- Gutter Ends -->
        <!-- Right Column Begins -->
        <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"><BR>
          <!-- Right Column Include Begins -->
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



