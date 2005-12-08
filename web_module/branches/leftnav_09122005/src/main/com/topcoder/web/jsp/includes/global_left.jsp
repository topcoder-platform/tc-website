<%@ page language="java"%>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ page import="com.topcoder.web.common.model.NavTree"%>
<%@ page import="com.topcoder.web.common.model.NavNode"%>
<%@ taglib uri="nav.tld" prefix="nav" %>
<%

    /*
        CoderSessionInfo info = (CoderSessionInfo)request.getAttribute(BaseServlet.SESSION_INFO_KEY);
        //bleh, gott do this for registration cuz it does a redirect to a jsp
        if (info==null) info = new Navigation(request, response).getSessionInfo();
    */


    NavTree nav = new NavTree();
    nav.addRoot(new NavNode("<a href=\"Javascript:toggleMenu('m_competitors')\" class=\"exp\">Competitions</a>", "m_competitors"));
        nav.search("m_competitors").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc", "Home", "competition_home"));
        nav.search("m_competitors").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/Registration", "Register to compete", "competition_registration"));
        nav.search("m_competitors").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_my_tc')\" class=\"exp\">My TopCoder</a>", "m_my_tc"));
            nav.search("m_my_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/Registration", "Update My Profile", "competition_update_profile"));
            nav.search("m_my_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewReferrals", "Members I've Referred", "referrals"));
            nav.search("m_my_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/PactsMemberServlet?t=affidavit&c=affidavit_history", "Affidavits", "affidavits"));
            nav.search("m_my_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=card&d2=description", "Card / Badges", "cards_badges"));
        nav.search("m_competitors").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_alg_comp')\" class=\"exp\">Algorithm Competitions</a>", "m_alg_comp"));
            nav.search("m_alg_comp").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/NEW_PAGE", "Home", "alg_competition_home"));
            nav.search("m_alg_comp").addChild(new NavNode("Javascript:arena()", "Compete / Launch Arena", "launch_arena"));
            nav.search("m_alg_comp").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/?&t=schedule&c=index", "Calendar", "competition_calendar"));
            //todo this needs to be completed with the full compliment of stat links
            nav.search("m_alg_comp").addChild(new NavNode("/NEW_PAGE", "Match Archive", "alg_match_archive"));
            nav.search("m_alg_comp").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ProblemArchive", "Problem Archive", "last_match"));
            nav.search("m_alg_comp").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/?t=statistics&c=quick_stats", "Record Book", "alg_record_book"));
            nav.search("m_alg_comp").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_alg_support')\" class=\"exp\">Support/FAQs</a>", "m_alg_support"));
                nav.search("m_alg_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=help&d2=index", "How to compete", "alg_competition_guide"));
                nav.search("m_alg_support").addChild(new NavNode("", "FAQs", "alg_faq"));
                nav.search("m_alg_support").addChild(new NavNode("", "Sample Problem Statements", "alg_prob_state"));
                nav.search("m_alg_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/?&t=support&c=ratings", "Rating System", "alg_rating_sys"));
                nav.search("m_alg_support").addChild(new NavNode("", "Forms W-9 & W-8BEN", "alg_tax_form"));
                nav.search("m_alg_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/?&t=support&c=charities", "Charity Donations", "alg_charity"));
        nav.search("m_competitors").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_comp_comp')\" class=\"exp\">Component Competitions</a>", "m_comp_comp"));
            nav.search("m_comp_comp").addChild(new NavNode("", "Design/Develop Components", "des_dev_comp"));
            nav.search("m_comp_comp").addChild(new NavNode("", "Review Competitors' Submissions", "review_sub"));
            nav.search("m_comp_comp").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_comp_stats')\" class=\"exp\">Statistics</a>", "m_comp_stats"));
                nav.search("m_comp_stats").addChild(new NavNode("", "Contest List", "comp_list"));
                nav.search("m_comp_stats").addChild(new NavNode("", "Achievements", "comp_achievements"));
            nav.search("m_comp_comp").addChild(new NavNode("", "Meet the Review Boards", "review_boards"));
            nav.search("m_comp_comp").addChild(new NavNode("", "Development Methodology", "dev_meth"));
            nav.search("m_comp_comp").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_comp_support')\" class=\"exp\">Support/FAQs</a>", "m_comp_support"));
                nav.search("m_comp_support").addChild(new NavNode("", "Getting Started", "comp_get_started"));
                nav.search("m_comp_support").addChild(new NavNode("", "Component Help Docs", "comp_help"));
                nav.search("m_comp_support").addChild(new NavNode("", "Rating System", "comp_rating"));
                nav.search("m_comp_support").addChild(new NavNode("", "Reliability Rating System", "comp_rel_rating"));
                nav.search("m_comp_support").addChild(new NavNode("", "How to Get Paid", "comp_paid"));
        nav.search("m_competitors").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_emp_opps')\" class=\"exp\">Employment Opportunities</a>", "m_emp_opps"));
            nav.search("m_emp_opps").addChild(new NavNode("", "Job Openings", "job_openings"));
            nav.search("m_emp_opps").addChild(new NavNode("", "Registration", "emp_reg"));
        nav.search("m_competitors").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_education')\" class=\"exp\">Educational Content</a>", "m_education"));
            nav.search("m_education").addChild(new NavNode("", "Algorithm Tutorials", "alg_tut"));
            nav.search("m_education").addChild(new NavNode("", "Component Tutorials", "comp_tut"));
            nav.search("m_education").addChild(new NavNode("", "Features", "features"));
            nav.search("m_education").addChild(new NavNode("", "Tutor Transcripts", "tut_transcripts"));
        nav.search("m_competitors").addChild(new NavNode("", "Coder of the Month", "m_com"));
        nav.search("m_competitors").addChild(new NavNode("", "Member Surveys", "m_mem_survey"));
        nav.search("m_competitors").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_events')\" class=\"exp\">Events</a>", "m_events"));
            nav.search("m_events").addChild(new NavNode("", "TopCoder Events", "tc_events"));
            nav.search("m_events").addChild(new NavNode("", "Private Label", "pl_events"));
            nav.search("m_events").addChild(new NavNode("", "Charity", "charity_events"));
    nav.addRoot(new NavNode("<a href=\"Javascript:toggleMenu('m_corp_services')\" class=\"exp\">Corporate Services</a>", "m_corp_services"));
        nav.search("m_corp_services").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_software')\" class=\"exp\">Software</a>", "m_software"));
            nav.search("m_software").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_components')\" class=\"exp\">Components</a>", "m_components"));
                nav.search("m_components").addChild(new NavNode("", "What Are Software Components?", "software_comp"));
                nav.search("m_components").addChild(new NavNode("", "Methodology", "comp_method"));
                nav.search("m_components").addChild(new NavNode("", "Find Components", "file_comp"));
                nav.search("m_components").addChild(new NavNode("", "Purchase Components", "purchase_comp"));
                nav.search("m_components").addChild(new NavNode("", "Suggest a Component", "suggest_comp"));
            nav.search("m_software").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_software')\" class=\"exp\">Software</a>", "m_applications"));
                nav.search("m_applications").addChild(new NavNode("", "Overview", "app_overview"));
                nav.search("m_applications").addChild(new NavNode("", "Methodology", "app_method"));
            nav.search("m_software").addChild(new NavNode("", "Current Customers", "software_customers"));
        nav.search("m_corp_services").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_emp_services')\" class=\"exp\">Employment Services</a>", "m_emp_services"));
            nav.search("m_emp_services").addChild(new NavNode("http://"+ApplicationServer.CORP_SERVER_NAME+"/?module=Static&d1=corp&d2=spon_prog&d3=tourny_index", "Event Sponsorship", "event_spon"));
            nav.search("m_emp_services").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_sourcing')\" class=\"exp\">Sourcing</a>", "m_sourcing"));
                nav.search("m_sourcing").addChild(new NavNode("http://"+ApplicationServer.CORP_SERVER_NAME+"/?module=Static&d1=corp&d2=private_label&d3=index", "Overview", "sourcing_overview"));
                nav.search("m_sourcing").addChild(new NavNode("http://"+ApplicationServer.CORP_SERVER_NAME+"/tces", "Reports", "sourcing_reports"));
            nav.search("m_emp_services").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_skills_ass')\" class=\"exp\">Skills Assessment</a>", "m_skills_ass"));
                nav.search("m_skills_ass").addChild(new NavNode("http://"+ApplicationServer.CORP_SERVER_NAME+"/?module=Static&d1=corp&d2=testing&d3=testing_attributes", "Process", "skills_process"));
                nav.search("m_skills_ass").addChild(new NavNode("http://"+ApplicationServer.CORP_SERVER_NAME+"/?module=Static&d1=corp&d2=testing&d3=management_tool", "Attributes", "skills_atts"));
                nav.search("m_skills_ass").addChild(new NavNode("http://"+ApplicationServer.CORP_SERVER_NAME+"/?module=Static&d1=corp&d2=testing&d3=demo", "Demo", "skills_demo"));
                nav.search("m_skills_ass").addChild(new NavNode("http://"+ApplicationServer.CORP_SERVER_NAME+"/testing", "Launch Technical Assessment", "launch_techass"));
            nav.search("m_emp_services").addChild(new NavNode("http://"+ApplicationServer.CORP_SERVER_NAME+"/?module=Static&d1=corp&d2=placement&d3=index", "Placement", "placement"));
        nav.search("m_corp_services").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_mark_services')\" class=\"exp\">Marketing Services</a>", "m_mark_services"));
            nav.search("m_mark_services").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_tournaments')\" class=\"exp\">Tournaments</a>", "m_tournaments"));
                nav.search("m_tournaments").addChild(new NavNode("http://"+ApplicationServer.CORP_SERVER_NAME+"/?module=Static&d1=corp&d2=spon_prog&d3=market_tourny", "Overview</a>", "tourny_overview"));
                nav.search("m_tournaments").addChild(new NavNode("http://"+ApplicationServer.CORP_SERVER_NAME+"/tces", "Reports</a>", "tourny_reports"));
    nav.addRoot(new NavNode("<a href=\"Javascript:toggleMenu('m_forums')\" class=\"exp\">Forums</a>", "m_forums"));
        nav.search("m_forums").addChild(new NavNode("http://"+ApplicationServer.FORUMS_SERVER_NAME+"/?module=Category&categoryID=13", "Round Tables", "round_tables"));
        nav.search("m_forums").addChild(new NavNode("http://"+ApplicationServer.FORUMS_SERVER_NAME+"/?module=Category&categoryID=14", "Round Tables", "alg_matches"));
        nav.search("m_forums").addChild(new NavNode("http://"+ApplicationServer.FORUMS_SERVER_NAME+"/?module=Category&categoryID=8", "Round Tables", "news_disc"));
        nav.search("m_forums").addChild(new NavNode("http://"+ApplicationServer.FORUMS_SERVER_NAME+"/?module=Category&categoryID=6", "Round Tables", "spons_disc"));
    nav.addRoot(new NavNode("", "Press Room", "m_press"));
    nav.addRoot(new NavNode("", "Contact Us", "m_contact"));
    nav.addRoot(new NavNode("<a href=\"Javascript:toggleMenu('m_about_tc')\" class=\"exp\">About TopCoder</a>", "m_about_tc"));
        nav.search("m_about_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=about&d2=index", "Overview", "tc_overview"));
        nav.search("m_about_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=about&d2=whyjoin", "Why Join TopCoder?", "tc_why_join"));
        nav.search("m_about_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=about&d2=jobs", "Working at TopCoder", "tc_working"));
        nav.search("m_about_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=about&d2=terms", "Terms", "tc_terms"));
        nav.search("m_about_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=about&d2=privacy", "Privacy", "tc_privacy"));
        nav.search("m_about_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=about&d2=management", "Overview", "tc_management"));

    request.setAttribute("tree", nav);

%>


<script language="javascript" type="text/javascript">
<!--
function toggleMenu(objectID){
   var object = document.getElementById(objectID);
   if(object.style.display == 'block') object.style.display = 'none';
   else if(object.className == 'OPEN' && object.style.display != 'none') object.style.display = 'none';
   else object.style.display = 'block';
   return;
}

function arena() {
  w=window.open("http://www.topcoder.com/tc?module=Static&d1=applet&d2=launch","Launch","top=2,left=2,width=300,height=225,resizable=yes,status=1");
  return;
}
// -->
</script>




<div id="navbar" style="float: left; clear: left;">
<nav:navBuilder navTree="tree" openClass="OPEN" selectedClass="highlight" selectedNode="<%=request.getParameter("node")%>"/>
</div>

<div style="float: left; clear: left; padding: 15px 0px 40px 15px;">
<jsp:include page="../includes/modules/leftNavSearch.jsp"/>
</div>




<%--

<% if ((level1.equals("about")) || (level1.equals("review_board")) || (level1.equals("press_room")) || (level1.equals("management"))) { %>

            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <tr><td id="leftNavTitle">TopCoder Info:</td></tr>

                <tr><td id="<%=level1.equals("about")?"leftNavOn":"leftNav"%>"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=about&d2=index" class="<%=level1.equals("about")?"leftOn":"left"%>"><img alt="" width="10" height="10" src="/images/nav_arrow_<%=level1.equals("about")?"bottom":"right"%>.gif" border="0"/>About TopCoder</a></td></tr>

            <% if (level1.equals("about")) { %>
                <tr><td id="<%=level2.equals("overview")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=about&d2=index">Overview</a></td></tr>
                <tr><td id="<%=level2.equals("whyjoin")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=about&d2=whyjoin">Why Join TopCoder?</a></td></tr>
                <tr><td id="<%=level2.equals("jobs")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=about&d2=jobs">Working at TopCoder</a></td></tr>
                <tr><td id="<%=level2.equals("terms")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=about&d2=terms">Terms, Revisions</a></td></tr>
                 <tr><td id="<%=level2.equals("privacy")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=about&d2=privacy">Privacy Policy</a></td></tr>
            <% } %>
                <tr><td id="<%=level1.equals("review_board")?"leftNavOn":"leftNav"%>"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ReviewBoard&ph=112" class="<%=level1.equals("review_board")?"leftOn":"left"%>"><img alt="" width="10" height="10" src="/images/nav_arrow_<%=level1.equals("review_board")?"bottom":"right"%>.gif" border="0"/>Review Boards</a></td></tr>
            <% if (level1.equals("review_board")) { %>
                <tr><td id="<%=level2.equals("design")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ReviewBoard&ph=112">Design</a></td></tr>
                <tr><td id="<%=level2.equals("development")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ReviewBoard&ph=113">Development</a></td></tr>
            <% } %>
                <tr><td id="<%=level1.equals("press_room")?"leftNavSelect":"leftNav"%>"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=pressroom&d2=index" class="<%=level1.equals("press_room")?"leftOn":"left"%>"><img alt="" src="/images/<%=level1.equals("press_room")?"clear":"nav_arrow_right"%>.gif" border="0"/>Press Room</a></td></tr>
                <tr><td id="<%=level1.equals("management")?"leftNavSelect":"leftNav"%>"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=about&d2=management" class="<%=level1.equals("management")?"leftOn":"left"%>"><img alt="" src="/images/<%=level1.equals("management")?"clear":"nav_arrow_right"%>.gif" border="0"/>Management Team</a></td></tr>
                <tr><td id="<%=level1.equals("contacts")?"leftNavOn":"leftNav"%>"><a href="http://<%=ApplicationServer.SERVER_NAME%>/?&t=contacts&c=index" class="<%=level1.equals("contacts")?"leftOn":"left"%>"><img alt="" width="10" height="10" src="/images/nav_arrow_<%=level1.equals("contacts")?"bottom":"right"%>.gif" border="0"/>Contact Us</a></td></tr>
            </table>
<% } else if (level1.equals("employment")) { %>
            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <tr><td id="leftNavTitle" >Employment Opportunities:</td></tr>
                <tr><td id="leftNavApplet"><a href="Javascript:arena()" class="left"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Launch Arena Applet</a></td></tr>
                <% if (!info.isAnonymous() || level1.equals("my_home")) { %>
                    <tr><td id="<%=level1.equals("my_home")?"leftNavOn":"leftNav"%>"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=my_home&d2=index" class="<%=level1.equals("my_home")?"leftOn":"left"%>"><img alt="" width="10" height="10" src="/images/nav_arrow_<%=level1.equals("my_home")?"bottom":"right"%>.gif" border="0"/>$HOME</a></td></tr>
                <% } %>
                <tr><td id="<%=level2.equals("openings")?"leftNavSelect":"leftNav"%>"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=contracting&d2=index" class="<%=level2.equals("openings")?"leftOn":"left"%>"><img alt="" src="/images/<%=level2.equals("openings")?"clear":"nav_arrow_right"%>.gif" border="0"/>Job Openings</a></td></tr>
                <tr><td id="<%=level2.equals("registration")?"leftNavSelect":"leftNav"%>"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ContractingPreferences" class="<%=level2.equals("registration")?"leftOn":"left"%>"><img alt="" src="/images/<%=level2.equals("registration")?"clear":"nav_arrow_right"%>.gif" border="0"/>Registration</a></td></tr>
            </table>


<% } else if (level1.equals("development")) { %>
            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <tr><td id="leftNavTitle" >Development:</td></tr>
                <tr><td id="leftNavApplet"><a href="Javascript:arena()" class="left"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Launch Arena Applet</a></td></tr>
                <% if (!info.isAnonymous() || level1.equals("my_home")) { %>
                    <tr><td id="<%=level1.equals("my_home")?"leftNavOn":"leftNav"%>"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=my_home&d2=index" class="<%=level1.equals("my_home")?"leftOn":"left"%>"><img alt="" width="10" height="10" src="/images/nav_arrow_<%=level1.equals("my_home")?"bottom":"right"%>.gif" border="0"/>$HOME</a></td></tr>
                    <% if (level1.equals("my_home")) { %>
                        <tr><td id="<%=level2.equals("profile")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/Registration">Update My Profile</A></td></tr>
                        <tr><td id="<%=level2.equals("referrals")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewReferrals">Referrals</A></td></tr>
                        <tr><td id="<%=level2.equals("card")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=card&d2=description">Cards / Badges</A></td></tr>
                        <tr><td id="<%=level2.equals("pacts")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/PactsMemberServlet?t=affidavit&c=affidavit_history">Affidavits</A></td></tr>
                    <% } %>
                <% } %>
                <tr><td id="<%=level2.equals("rTables")?"leftNavOn":"leftNav"%>"><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=205768&sortField=9&sortOrder=0" class="<%=level2.equals("rTables")?"leftOn":"left"%>"><img width="10" height="10" src="/images/nav_arrow_<%=level2.equals("rTables")?"bottom":"right"%>.gif" alt="" border="0"/>TC Developer Forums</a></td></tr>
                <tr><td id="<%=level2.equals("forums")?"leftNavOn":"leftNav"%>"><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/forum/c_active_collab.jsp?ft=2" class="<%=level2.equals("forums")?"leftOn":"left"%>"><img width="10" height="10" src="/images/nav_arrow_<%=level2.equals("forums")?"bottom":"right"%>.gif" alt="" border="0"/>TCS Developer Forums</a></td></tr>
                <tr><td id="<%=level2.equals("components")?"leftNavOn":"leftNav"%>"><a href="http://<%=ApplicationServer.SERVER_NAME%>/?t=development&c=comp_projects" class="<%=level2.equals("components")?"leftOn":"left"%>"><img width="10" height="10" src="/images/nav_arrow_<%=level2.equals("components")?"bottom":"right"%>.gif" alt="" border="0"/>Components</a></td></tr>
                <% if (level2.equals("components")) { %>
                    <tr><td id="<%=level3.equals("open")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?t=development&c=comp_projects">Projects</A></td></tr>
                    <tr><td id="<%=level3.equals("reviews")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewReviewProjects">Review Opportunities</A></td></tr>
                    <tr><td id="<%=level3.equals("winners")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?t=development&c=components">Recent Project Winners</A></td></tr>
                    <tr><td id="<%=level3.equals("submit")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/review">Project Submit & Review</A></td></tr>
                    <tr><td id="<%=level3.equals("status")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?t=development&c=comp_archive">Project Status</A></td></tr>
                    <tr><td id="<%=level3.equals("method")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?t=development&c=comp_meth">Development Methodology</A></td></tr>
                <% } %>
                <tr><td id="<%=level2.equals("contests")?"leftNavOn":"leftNav"%>"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=dev&d2=usdc_overview" class="<%=level2.equals("contests")?"leftOn":"left"%>"><img width="10" height="10" src="/images/nav_arrow_<%=level2.equals("contests")?"bottom":"right"%>.gif" alt="" border="0"/>Contests</a></td></tr>
                <% if (level2.equals("contests")) { %>
                   <tr><td id="<%=level3.equals("ultimate")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=dev&d2=usdc_overview">Ultimate Contest</A></td></tr>
                    <tr><td id="<%=level3.equals("descontest2")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?t=development&c=des_bonus_contest_2">Design Bonus Contest 2</A></td></tr>
                    <tr><td id="<%=level3.equals("descontest1")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?t=development&c=bonus_contest_0303">Design Bonus Contest 1</A></td></tr>
                    <tr><td id="<%=level3.equals("open")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?&t=tournaments&c=tourny_index">TCO & TCCC Component Contests</A></td></tr>
                <% } %>
                <tr><td id="<%=level2.equals("support")?"leftNavOn":"leftNav"%>"><a href="http://<%=ApplicationServer.SERVER_NAME%>/?t=development&c=getting_started" class="<%=level2.equals("support")?"leftOn":"left"%>"><img width="10" height="10" src="/images/nav_arrow_<%=level2.equals("support")?"bottom":"right"%>.gif" alt="" border="0"/>Support / FAQs</a></td></tr>
                <% if (level2.equals("support")) { %>
                    <tr><td id="<%=level3.equals("gettingStarted")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?t=development&c=getting_started">Getting Started</A></td></tr>
                   <tr><td id="<%=level3.equals("compDocumentation")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=dev&d2=support&d3=compDocumentation">Component Documentation</A></td></tr>
                   <tr><td id="<%=level3.equals("ratings")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=dev&d2=support&d3=ratings">Rating System</A></td></tr>
                   <tr><td id="<%=level3.equals("reliability")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=dev&d2=support&d3=reliability">Reliability Rating</A></td></tr>
                   <tr><td id="<%=level3.equals("getPaid")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?&t=development&c=dev_payment">How to Get Paid</A></td></tr>
                <% } %>
            </table>

<% } else { %>

            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <tr><td id="leftNavTitle" >Competition:</td></tr>
                <tr><td id="leftNavApplet"><a href="Javascript:arena()" class="left"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Launch Arena Applet</a></td></tr>
                <% if (!info.isAnonymous() || level1.equals("my_home")) { %>
                    <tr><td id="<%=level1.equals("my_home")?"leftNavOn":"leftNav"%>"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=my_home&d2=index" class="<%=level1.equals("my_home")?"leftOn":"left"%>"><img alt="" width="10" height="10" src="/images/nav_arrow_<%=level1.equals("my_home")?"bottom":"right"%>.gif" border="0"/>$HOME</a></td></tr>
                    <% if (level1.equals("my_home")) { %>
                        <tr><td id="<%=level2.equals("profile")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/Registration">Update My Profile</A></td></tr>
                        <tr><td id="<%=level2.equals("referrals")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewReferrals">Referrals</A></td></tr>
                        <tr><td id="<%=level2.equals("card")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=card&d2=description">Cards / Badges</A></td></tr>
                        <tr><td id="<%=level2.equals("pacts")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/PactsMemberServlet?t=affidavit&c=affidavit_history">Affidavits</A></td></tr>
                    <% } %>
                <% } %>
                <tr><td id="<%=level1.equals("schedule")?"leftNavOn":"leftNav"%>"><a href="http://<%=ApplicationServer.SERVER_NAME%>/?&t=schedule&c=index" class="<%=level1.equals("schedule")?"leftOn":"left"%>"><img width="10" height="10" src="/images/nav_arrow_<%=level1.equals("schedule")?"bottom":"right"%>.gif" alt="" border="0"/>Calendar</a></td></tr>
                <tr><td id="<%=level1.equals("statistics")?"leftNavOn":"leftNav"%>"><a href="http://<%=ApplicationServer.SERVER_NAME%>/stat?&c=round_overview" class="<%=level1.equals("statistics")?"leftOn":"left"%>"><img width="10" height="10" src="/images/nav_arrow_<%=level1.equals("statistics")?"bottom":"right"%>.gif" alt="" border="0"/>Statistics</a></td></tr>

            <% if (level1.equals("statistics")) { %>
            <%
                //this can probably go if we can standardize the MVC.  rtables is the current exception
                //this hoses up registration if it's executed for all of global_left.  haven't figured out
                //why though...????
                if (info==null) {
                    Navigation nav = (Navigation)session.getAttribute("navigation");
                    if (nav==null) info = new Navigation(request, response).getSessionInfo();
                    else info = nav.getSessionInfo();
                }
            %>
                <tr><td id="<%=level2.equals("round_overview")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/stat?&c=round_overview<%=request.getParameter("rd")==null?"":"&rd="+request.getParameter("rd")%>">Round Overview</a></td></tr>
                <tr><td id="<%=level2.equals("last_match")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/stat?&c=last_match">Last Match Results</a></td></tr>
                <% if (!info.isAnonymous() && info.getRating()>0) { %>
                    <tr><td id="<%=level2.equals("my_last_match")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/stat?c=coder_room_stats&cr=<%=info.getUserId()%>">My Last Match</a></td></tr>
                    <tr><td id="<%=level2.equals("member_profile")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=MemberProfile&cr=<%=info.getUserId()%>">Member Profile</a></td></tr>
                    <tr><td id="<%=level2.equals("ratings_history")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/stat?c=ratings_history&cr=<%=info.getUserId()%>">Ratings History</a></td></tr>
                    <tr><td id="<%=level2.equals("earnings_history")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/stat?c=earnings_history&cr=<%=info.getUserId()%>">Earnings History</a></td></tr>
                <% } %>
                <tr><td id="<%=level2.equals("problem_archive")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ProblemArchive">Problem Archive</a></td></tr>
                <tr><td id="<%=level2.equals("coder_ratings")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?&module=AlgoRank">Coder Rankings</a></td></tr>
                <tr><td id="<%=level2.equals("match_editorials")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=match_editorials&d2=archive">Match Editorials</a></td></tr>
                <tr><td id="<%=level2.equals("quick_stats")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?t=statistics&c=quick_stats">Quick Stats</a></td></tr>
                <tr><td id="<%=level2.equals("coder_of_month")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=SimpleStats&trans=true&c=com_history&d1=statistics&d2=coderOfMonth">Coder of the Month</a></td></tr>
                <tr><td id="<%=level2.equals("search")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewAdvanced">Advanced Member Search</a></td></tr>
                <tr><td id="<%=level2.equals("member_surveys")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?&module=SurveyList">Member Surveys</a></td></tr>
            <% } %>
                <tr><td id="<%=level1.equals("education")?"leftNavOn":"leftNav"%>"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=tutorials&d2=alg_index" class="<%=level1.equals("education")?"leftOn":"left"%>"><img alt="" width="10" height="10" src="/images/nav_arrow_<%=level1.equals("education")?"bottom":"right"%>.gif" border="0"/>Educational Content</a></td></tr>

            <% if (level1.equals("education")) { %>
                <tr><td id="<%=level2.equals("alg_tutorials")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=tutorials&d2=alg_index">Algorithm Tutorials</A></td></tr>
                <tr><td id="<%=level2.equals("comp_tutorials")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=tutorials&d2=comp_index">Component Tutorials</A></td></tr>
                <tr><td id="<%=level2.equals("features")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?&t=features&c=index">Features</A></td></tr>
                <tr><td id="<%=level2.equals("tutor_transcripts")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=tutor_transcripts&d2=index">Tutor Transcripts</A></td></tr>
            <% } %>

                <tr><td id="<%=level1.equals("events")?"leftNavOn":"leftNav"%>"><a href="http://<%=ApplicationServer.SERVER_NAME%>/?&t=tournaments&c=tourny_index" class="<%=level1.equals("events")?"leftOn":"left"%>"><img alt="" width="10" height="10" src="/images/nav_arrow_<%=level1.equals("events")?"bottom":"right"%>.gif" border="0"/>Events</a></td></tr>

            <% if (level1.equals("events")) { %>
                <tr><td id="<%=level2.equals("tournaments")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?&amp;t=tournaments&amp;c=tourny_index">Tournaments</A></td></tr>
                <tr><td id="<%=level2.equals("charity")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?&amp;module=CRPFStatic&amp;d1=crpf&amp;d2=crpf_photos">Charity</A></td></tr>
                <tr><td id="<%=level2.equals("private_label")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/pl/">Private Label</A></td></tr>
            <% } %>

                <tr><td id="<%=level1.equals("forums")?"leftNavOn":"leftNav"%>"><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=13" class="<%=level1.equals("forums")?"leftOn":"left"%>"><img alt="" width="10" height="10" src="/images/nav_arrow_<%=level1.equals("forums")?"bottom":"right"%>.gif" border="0"/>Forums</a></td></tr>
            <% if (level1.equals("forums")) { %>
                <tr><td id="<%if (unreadCategories.indexOf("roundtables")==-1) {%><%=level2.equals("roundtables")?"leftSubnavOldOn":"leftSubnavOld"%><%} else {%><%=level2.equals("roundtables")?"leftSubnavOn":"leftSubnav"%><%}%>"><A class="leftOn" href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=13">Round Tables</A></td></tr>
                <tr><td id="<%if (unreadCategories.indexOf("matches")==-1) {%><%=level2.equals("matches")?"leftSubnavOldOn":"leftSubnavOld"%><%} else {%><%=level2.equals("matches")?"leftSubnavOn":"leftSubnav"%><%}%>"><A class="leftOn" href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=14">Algorithm Matches</A></td></tr>
                <tr><td id="<%if (unreadCategories.indexOf("news")==-1) {%><%=level2.equals("news")?"leftSubnavOldOn":"leftSubnavOld"%><%} else {%><%=level2.equals("news")?"leftSubnavOn":"leftSubnav"%><%}%>"><A class="leftOn" href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=8">News Discussions</A></td></tr>
                <tr><td id="<%if (unreadCategories.indexOf("sponsors")==-1) {%><%=level2.equals("sponsors")?"leftSubnavOldOn":"leftSubnavOld"%><%} else {%><%=level2.equals("sponsors")?"leftSubnavOn":"leftSubnav"%><%}%>"><A class="leftOn" href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=6">Sponsor Discussions</A></td></tr>
            <% } %>



                    <tr><td id="<%=level1.equals("support")?"leftNavOn":"leftNav"%>"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=help&d2=index" class="<%=level1.equals("support")?"leftOn":"left"%>"><img alt="" width="10" height="10" src="/images/nav_arrow_<%=level1.equals("support")?"bottom":"right"%>.gif" border="0"/>Support / FAQs</a></td></tr>
            <% if (level1.equals("support")) { %>
                <tr><td id="<%=level2.equals("guide")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=help&d2=index">Algorithm Competition Guide</A></td></tr>
                <tr><td id="<%=level2.equals("general")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?&t=support&c=index">General FAQ</A></td></tr>
                <tr><td id="<%=level2.equals("competition")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?&t=support&c=comp_faq">Competition FAQ</A></td></tr>
                <tr><td id="<%=level2.equals("forms")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?&t=support&c=form_faq">Forms W-9 & W-8BEN FAQ</A></td></tr>
                <tr><td id="<%=level2.equals("ratings")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?&t=support&c=ratings">Ratings Overview</A></td></tr>
                <tr><td id="<%=level2.equals("charity")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?&t=support&c=charities">Charity Donations</A></td></tr>
                <tr><td id="<%=level2.equals("samples")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?&t=support&c=sample_problems">Sample Problem Statements</A></td></tr>
                <tr><td id="<%=level2.equals("algPayment")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=help&d2=algPayment">How to Get Paid</A></td></tr>
            <% } %>

            </table>

<% } %>


            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <tr><td bgcolor="#990000"><jsp:include page="../includes/modules/simpleSearch.jsp"/></td></tr>
            </table>

            <img alt="" width="180" height="23" src="/i/left_nav_btm.gif" border="0"/><br />
            <img alt="" width="5" height="5" src="/i/clear.gif" border="0"/><br />

    <% if (level1.equals("home")) { %>

            <jsp:include page="/home/coder_of_month.jsp" />
            <img alt="" width="1" height="9" src="/i/clear.gif" border="0"/><br />
            <jsp:include page="../calendar.jsp" />
    <% } %>

            <div align="center"><img src="/i/logo_ghosted_bracket.gif" width="160" height="77" alt="[ TopCoder ]" vspace="10" border="0"/></div><br /><br />


--%>
