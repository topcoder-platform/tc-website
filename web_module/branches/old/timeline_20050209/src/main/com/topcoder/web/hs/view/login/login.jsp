<html>

<head>

<title>TopCoder | High School</title>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

<jsp:include page="../includes/css.jsp" />

</head>

<body>

<!-- Top begins -->
<jsp:include page="../includes/top.jsp" />
<!-- Top ends -->

<table border="0" cellspacing="0" cellpadding="0" width="100%">
    <tr valign="top">

<!-- Left Column begins -->
        <td width="170" bgcolor="#001934">
            <jsp:include page="../includes/left_nav.jsp" />
            <jsp:include page="../includes/left_calendar.jsp" />
        </td>
<!-- Left Column begins -->
        
<!-- Center Column begins -->
        <td valign="top" width="99%">
            <table cellspacing="0" cellpadding="10" border="0" width="100%">
                <tr>
                    <td width="100%" class="statText">
                        
                        <img src="/i/hs/headinginside_login.gif" width="348" height="44" alt="Login" border="0">

                        <p>New to TopCoder? <a href="?module=Static&d1=registration&d2=registration" class="statText">Click here</a> to register now.</p><br>

<jsp:usebean id="SessionInfo" class="com.topcoder.web.hs.model.SessionInfoBean" scope="request" />
<%
String nextpage = (String)request.getAttribute("nextpage");
if(nextpage==null) nextpage = request.getParameter("nextpage");
if(nextpage==null) nextpage = request.getHeader("Referer");
if(nextpage==null) nextpage = "http://"+request.getServerName()+request.getAttribute("canonpath");
String message = (String)request.getAttribute("message");
if(message==null) message = "";
String username = request.getParameter("username");
if(username==null) username = SessionInfo.getHandle();
if(username==null) username = "";
%>

<script>
  function submitEnter(e){
    var keycode;
    if (window.event) keycode = window.event.keyCode;
    else if (e) keycode = e.which;
    else return true;
    if (keycode == 13) {
     loginform.submit();
     return false;
    } else return true;
  }
</script>
                        <form name="loginform" action="<%= "https://"+request.getServerName()+request.getAttribute("canonpath") %>" method="POST">
                        <input type="hidden" name="module" value="Login">
                        <input type="hidden" name="nextpage" value="<%= nextpage %>">
                        
                        <table cellspacing="10" cellpadding="0" border="0" align="center">
                            <tr><td class="statText"><h3><%= message %></h3></td></tr>
                        </table>

                        <table cellspacing="10" cellpadding="0" border="0" align="center">
                            <tr><td class="statText"><strong>Handle</strong><br>
                                    <input type="text" name="username" value="<%= username %>" size="25" onkeypress="submitEnter(event)"></td></tr>
                            
                            <tr><td class="statText"><strong>Password</strong><br>
                                    <input type="password" name="password" size="25" onkeypress="submitEnter(event)"></td></tr>
                                    
                            <tr><td class="statText">
                                    <div align="right"><a href="javascript:document.loginform.submit()" class="statTextBig">Login &gt;&gt;</a></div>
                                </td></form>
                            </tr>
                        </table>

<script>
  document.loginform.<%=username.equals("")?"username":"password"%>.focus();
</script>

                    </td>
                </tr>
            </table>
        </td>
        
        <td width="" bgcolor="#001934" valign="top">
            <jsp:include page="../includes/right_resources.jsp" />
        </td>
    </tr>
</table>

<jsp:include page="../includes/foot.jsp" />

</body>

</html>
