<%@  page
  language="java"
  errorPage="../errorPage.jsp"
  import="com.topcoder.common.web.data.Navigation,com.coolservlets.forum.*,
          java.text.SimpleDateFormat,
          java.util.HashMap,
          java.util.Iterator,
          com.topcoder.shared.util.ApplicationServer"
%>

<%
    String level1 = request.getParameter("level1")==null?"":request.getParameter("level1");
    String level2 = request.getParameter("level2")==null?"":request.getParameter("level2");
%>

            <img alt="" width="180" height="5" src="/i/spacer.gif" border="0"><br>
            <img alt="" width="170" height="11" src="/i/left_nav_top.gif" border="0"><br>
            <table width="180" cellspacing="0" cellpadding="0" border="0">
            
<!-- TopCoder Info begins *************************** -->
<% if ((level1.equals("about")) || (level1.equals("review_board")) || (level1.equals("press_room")) || (level1.equals("contacts"))) { %>
                <tr><td id="leftNavTitle">TopCoder Info:</td></tr>

<!-- About TopCoder begins -->
                <tr><td id="<%=level1.equals("about")?"leftNavOn":"leftNav"%>"><a href="/?&t=about_tc&c=index" class="<%=level1.equals("about")?"leftOn":"left"%>"><img alt="" width="10" height="10" src="/images/nav_arrow_<%=level1.equals("about")?"bottom":"right"%>.gif" border="0"/>About TopCoder</a></td></tr>

            <% if (level1.equals("about")) { %>
                <tr><td id="<%=level2.equals("competition")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="/tc?module=Static&d1=about&d2=competition">Overview</a></td></tr>
                <tr><td id="<%=level2.equals("whyjoin")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="/tc?module=Static&d1=about&d2=whyjoin">Why Join TopCoder?</a></td></tr>
                <tr><td id="<%=level2.equals("jobs")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="/tc?module=Static&d1=about&d2=jobs">Working at TopCoder</a></td></tr>
                <tr><td id="<%=level2.equals("student_rep")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="/tc?module=Static&d1=about&d2=student_rep">Student Reps</a></td></tr>
                <tr><td id="<%=level2.equals("terms")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="/tc?module=Static&d1=about&d2=terms">Terms, Revisions</a></td></tr>
                <tr><td id="<%=level2.equals("privacy")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="/tc?module=Static&d1=about&d2=privacy">Privacy Policy</a></td></tr>
            <% } %>
<!-- About TopCoder ends -->

<!-- Review Boards begins -->
                <tr><td id="<%=level1.equals("review_board")?"leftNavOn":"leftNav"%>"><a href="/tc?module=Static&d1=review_board&d2=competition" class="<%=level1.equals("review_board")?"leftOn":"left"%>"><img alt="" width="10" height="10" src="/images/nav_arrow_<%=level1.equals("review_board")?"bottom":"right"%>.gif" border="0"/>Review Boards</a></td></tr>

            <% if (level1.equals("review_board")) { %>
                <tr><td id="<%=level2.equals("competition")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="/tc?module=Static&d1=review_board&d2=competition">Competition</a></td></tr>
                <tr><td id="<%=level2.equals("design")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="/tc?module=Static&d1=review_board&d2=design">Design</a></td></tr>
                <tr><td id="<%=level2.equals("development")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="/tc?module=Static&d1=review_board&d2=development">Development</a></td></tr>
            <% } %>
<!-- Review Boards ends -->

<!-- Press Room begins -->
                <tr><td id="<%=level1.equals("press_room")?"leftNavOn":"leftNav"%>"><a href="/?&t=news_events&c=index" class="<%=level1.equals("press_room")?"leftOn":"left"%>"><img alt="" width="10" height="10" src="/images/nav_arrow_<%=level1.equals("press_room")?"bottom":"right"%>.gif" border="0"/>Press Room</a></td></tr>
<!-- Press Room ends -->

<!-- Contacts begins -->
                <tr><td id="<%=level1.equals("contacts")?"leftNavOn":"leftNav"%>"><a href="/?&t=contacts&c=index" class="<%=level1.equals("contacts")?"leftOn":"left"%>"><img alt="" width="10" height="10" src="/images/nav_arrow_<%=level1.equals("contacts")?"bottom":"right"%>.gif" border="0"/>Contacts</a></td></tr>
<!-- Contacts ends -->
<!-- TopCoder Info ends *************************** -->

<!-- PACTS begins *************************** -->
<% } else if (request.getServletPath().indexOf("pacts")>-1) { %>
                <tr><td id="leftNavTitle">P.A.C.T.s:</td>
                <tr><td id="leftSubnav"><a class="leftOn" href="/PactsMemberServlet?t=payments&amp;c=payment_history">Payments</a></td></tr>
                <tr><td id="leftSubnav"><a class="leftOn" href="/PactsMemberServlet?t=affidavit&amp;c=affidavit_history">Affidavits</a></td></tr>
                <tr><td id="leftSubnav"><a class="leftOn" href="/PactsMemberServlet?t=contracts&amp;c=contract_history">Contracts</a></td></tr>
                <tr><td id="leftSubnav"><a class="leftOn" href="/PactsMemberServlet?t=tax_forms&amp;c=tax_forms_history">Tax Forms</a></td></tr>
            <% } %>
<!-- PACTS ends *************************** -->

<!-- Competition begins *************************** -->
<% } else { %>
                <tr><td id="leftNavTitle" >Competition:</td></tr>
                <tr><td id="leftNavApplet"><a href="Javascript:arena()" class="left"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Launch Arena Applet</a></td></tr>
                
<!-- Schedule begins -->
                <tr><td id="<%=level1.equals("schedule")?"leftNavOn":"leftNav"%>"><a href="/?&t=schedule&c=index" class="<%=level1.equals("schedule")?"leftOn":"left"%>"><img width="10" height="10" src="/images/nav_arrow_<%=level1.equals("schedule")?"bottom":"right"%>.gif" alt="" border="0"/>Schedule</a></td></tr>
<!-- Schedule ends -->

<!-- Statistics begins -->
                <tr><td id="<%=level1.equals("statistics")?"leftNavOn":"leftNav"%>"><a href="/stat?&c=round_overview" class="<%=level1.equals("statistics")?"leftOn":"left"%>"><img width="10" height="10" src="/images/nav_arrow_<%=level1.equals("statistics")?"bottom":"right"%>.gif" alt="" border="0"/>Statistics</a></td></tr>

            <% if (level1.equals("statistics")) { %>
                <tr><td id="<%=level2.equals("round_overview")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="/stat?&c=round_overview">Round Overview</a></td></tr>
                <tr><td id="<%=level2.equals("last_match")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="/stat?&c=last_match">Last Match Results</a></td></tr>
                <tr><td id="<%=level2.equals("coder_ratings")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="/stat?&c=coder_ratings">Coder Rankings</a></td></tr>
                <tr><td id="<%=level2.equals("editorial_archive")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="/?t=statistics&c=editorial_archive">Match Editorials</a></td></tr>
                <tr><td id="<%=level2.equals("quick_stats")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="/?t=statistics&c=quick_stats">Quick Stats</a></td></tr>
                <tr><td id="<%=level2.equals("search")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="/tc?module=ViewAdvanced">Advanced Member Search</a></td></tr>
                <tr><td id="<%=level2.equals("member_surveys")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="/tc?&module=SurveyList">Member Surveys</a></td></tr>
            <% } %>
<!-- Statistics ends -->
                
<!-- Features begins -->
                <tr><td id="<%=level1.equals("features")?"leftNavOn":"leftNav"%>"><a href="/?&t=features&c=index" class="<%=level1.equals("features")?"leftOn":"left"%>"><img alt="" width="10" height="10" src="/images/nav_arrow_<%=level1.equals("features")?"bottom":"right"%>.gif" border="0"/>Features</a></td></tr>
<!-- Features ends -->

<!-- Events begins -->
                <tr><td id="<%=level1.equals("events")?"leftNavOn":"leftNav"%>"><a href="/?&t=tournaments&c=tourny_index" class="<%=level1.equals("events")?"leftOn":"left"%>"><img alt="" width="10" height="10" src="/images/nav_arrow_<%=level1.equals("events")?"bottom":"right"%>.gif" border="0"/>Events</a></td></tr>

            <% if (level1.equals("events")) { %>
                <tr><td id="<%=level2.equals("tournaments")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="/?&amp;t=tournaments&amp;c=tourny_index">Tournaments</A></td></tr>
                <tr><td id="<%=level2.equals("charity")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="/tc?&amp;module=CRPFStatic&amp;d1=crpf&amp;d2=crpf_photos">Charity</A></td></tr>
                <tr><td id="<%=level2.equals("private_label")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="/pl/">Private Label</A></td></tr>
            <% } %>
<!-- Events ends -->

<!-- Round Tables begins -->
                <tr><td id="<%=level1.equals("rtables")?"leftNavOn":"leftNav"%>"><a href="/rtables/index.jsp" class="<%=level1.equals("rtables")?"leftOn":"left"%>"><img alt="" width="10" height="10" src="/images/nav_arrow_<%=level1.equals("rtables")?"bottom":"right"%>.gif" border="0"/>Round Tables</a></td></tr>

            <% if (level1.equals("rtables")) {
                String temp = request.getParameter("forum");
                temp = temp==null?"-1":temp;
                int paramFid = Integer.parseInt(temp); %>

            <% // do a login if all parameters are good
            Authorization aToken = (Authorization) session.getAttribute("jiveAuthorization");
            if (aToken==null) {
                Authorization authToken = null;
                String rtUser = "";
                String rtPassword = "";
                String Redirect_URL = "http://" + request.getServerName();
                Navigation n = null;
                try {
                    n = (Navigation) session.getAttribute("navigation");
                    if (n==null) n = new Navigation();
                    if ( n.isIdentified() ) {
                        rtUser = n.getSessionInfo().getHandle();
                    }
                } catch( Exception e ) {
                    response.sendRedirect(Redirect_URL);
                    return;
                }
                // do a login if all parameters are good
                AuthorizationFactory authFactory = AuthorizationFactory.getInstance();
                if(rtUser.equals("")) {
                    authToken = authFactory.getAnonymousAuthorization();
                    session.setAttribute("jiveAuthorization",authToken);
                } else {
                    authToken = authFactory.getAuthorization(rtUser,rtPassword);
                    session.setAttribute("jiveAuthorization",authToken);
                }
                aToken = (Authorization) session.getAttribute("jiveAuthorization");
            }
            ForumFactory ff = ForumFactory.getInstance(aToken);
            Iterator forums = ff.forums();
            while( forums.hasNext() ) {
                Forum f = (Forum)forums.next();
                int fID = f.getID();
                String fName = f.getName();
                int messageCount = f.getMessageCount(); %>

                <tr><td id="<%=paramFid>0&&paramFid==fID?"leftSubnavOn":"leftSubnav"%>"><a href="/rtables/viewForum.jsp?forum=<%= fID %>&mc=<%=messageCount%>" class="leftOn"><%=(fName!=null)?fName:"&nbsp;"%></a></td></tr>

            <% } %>
<!-- Round Tables ends -->

<!-- Support/FAQs begins -->
                <tr><td id="<%=level1.equals("support")?"leftNavOn":"leftNav"%>"><a class="left" href="/?&t=support&c=index"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Support/FAQs</a></td></tr>
<!-- Support/FAQs ends -->

<% } %>

                <tr><td bgcolor="#990000"><jsp:include page="../includes/modules/simpleSearch.jsp"/></td></tr>
            </table>
            
            <img alt="" width="180" height="23" src="/i/left_nav_btm.gif" border="0"/><br /><br />
            <div align="center"><img src="/i/logo_ghosted_bracket.gif" width="160" height="77" alt="[ TopCoder ]" vspace="10" border="0"/></div><br /><br />
