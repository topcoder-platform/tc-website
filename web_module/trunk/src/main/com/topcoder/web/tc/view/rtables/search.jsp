<%@  page
  language="java"
  import="java.util.*,
          java.text.*,
          com.coolservlets.forum.*,
          com.coolservlets.forum.util.*,
          com.coolservlets.forum.database.DbQuery,
          com.coolservlets.forum.database.DbForumFactory"
  errorPage="../errorPage.jsp"
%>

<%  ////////////////

  //

  String Redirect_URL = "http://" + request.getServerName();
  String responseURL = response.encodeURL("");

%>        

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<HTML>
  <HEAD>
    <TITLE>Round Tables</TITLE>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
    <jsp:include page="../script.jsp" />
  </HEAD>
  <BODY>
    <jsp:include page="../top.jsp" />
    <!--------main content table------------>
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
           <jsp:param name="title" value="Search"/>
        </jsp:include>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#001B35" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD class="statText" COLSPAN="2" VALIGN="top" BGCOLOR="#001B35" WIDTH="100%">
        
        <IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="10" BORDER="0"/><BR/>

                <form action="/rtables/search.jsp" method="post" name="searchForm" onSubmit="return authorizedSubmit">

                <TABLE BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">

<%  ////////////////////////

  // authorization check

  if( ! SkinUtils.userIsAuthorized(request,session) ) {

    response.sendRedirect(Redirect_URL);

  }

  

  // get the authToken as a way to get userID's below

  Authorization authToken 

    = (Authorization)session.getAttribute("jiveAuthorization");

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

      <td valign="middle" class="statText"><a class="statText" href="/rtables/index.jsp">[view round tables]</a> &#160;<a class="statText" href="/rtables/post.jsp?&mode=new&forum=<%=forumID%>">[post new message]</a>  &#160;</td>

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

  if( doSearch && queryText!=null) {


      ForumFactory forumFactory = ForumFactory.getInstance(authToken);

      if (forumID > 0) {
          Forum forum = forumFactory.getForum(forumID);
          query = forum.createQuery();
          query.setQueryString(queryText);
      } else {
          //hack for seaching all forums
          query = new DbQuery((DbForumFactory)forumFactory);
      }
      searchResults = query.execute();

  }

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


      if (responseURL=="") { %>

                      <ol>

  <%  while( searchResults.hasNext() ) { %>

    <%    ForumMessage message = (ForumMessage)searchResults.next(); %>

    <li><a class="statText" href="/rtables/viewThread.jsp?forum=<%=message.getForumThread().getForum().getID()%>&thread=<%=message.getForumThread().getID()%>&message=<%=message.getID()%>#<%=message.getID()%>">

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

    <li><a class="statText" href="/rtables/viewThread.jsp?&forum=<%=message.getForumThread().getForum().getID()%>&thread=<%=message.getForumThread().getID()%>&message=<%=message.getID()%>#<%=message.getID()%>">

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

        <!-- Gutter -->
        <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
        <!-- Gutter Ends -->

      </TR>
    </TABLE>
    <jsp:include page="../foot.jsp" />
  </BODY>
</HTML>



