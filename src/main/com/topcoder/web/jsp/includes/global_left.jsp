<%@ page language="java"%>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ page import="com.topcoder.web.common.model.NavTree"%>
<%@ page import="com.topcoder.web.common.model.NavNode"%>
<%@ taglib uri="nav.tld" prefix="nav" %>

<%
   /* m_name indicates the name of an expandable menu */

   NavTree nav = new NavTree();
   nav.addRoot(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this,'m_competitions')", "Competitions", "m_competitions"));
      nav.search("m_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc", "Home", "competition_home"));
      nav.search("m_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/Registration", "Register to Compete", "competition_reg"));
      nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this,'m_competitor_stats')",  "Competitor Statistics", "m_competitor_stats"));
         nav.search("m_competitor_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewAdvanced", "Find a Competitor", "competitor_search"));
         nav.search("m_competitor_stats").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this,'m_top_rated_competitors')",  "Top Ranked", "m_top_rated_competitors"));
            nav.search("m_top_rated_competitors").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=AlgoRank", "Algorithm", "top_rated_algo"));
            nav.search("m_top_rated_competitors").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/stat?c=top_designers", "Design", "top_rated_des"));
            nav.search("m_top_rated_competitors").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/stat?c=top_developers", "Development", "top_rated_dev"));
         nav.search("m_competitor_stats").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this,'m_recordbook')",  "Record Book", "m_recordbook"));
            nav.search("m_recordbook").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=statistics&d2=recordbook_home", "Algorithm", "algo_recordbook"));
            nav.search("m_recordbook").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=compstats&d2=comp_recordbook_home", "Component", "comp_recordbook"));
         nav.search("m_competitor_stats").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this,'m_com')",  "Coder of the Month", "m_com"));
            nav.search("m_com").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=COMHistory&achtid=5", "Algorithm", "algo_com"));
            nav.search("m_com").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=COMHistory&achtid=6", "Design", "des_com"));
            nav.search("m_com").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=COMHistory&achtid=7", "Development", "dev_com"));
      nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this,'m_algo_competitions')", "Algorithm", "m_algo_competitions"));
         nav.search("m_algo_competitions").addChild(new NavNode("javascript:arena();", "Compete<br>(Launch Arena)", "algo_compete"));
         nav.search("m_algo_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this,'m_algo_stats')", "Statistics", "m_algo_stats"));
            nav.search("m_algo_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=MatchList", "Match Archive", "algo_match_archive"));
            nav.search("m_algo_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/stat?c=round_overview", "Match Overviews", "algo_match_overviews"));
            nav.search("m_algo_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=SrmDivisionWins", "Match Winners", "algo_match_winners"));
            nav.search("m_algo_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/stat?c=last_match", "Match Results", "algo_match_results"));
            nav.search("m_algo_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=match_editorials&d2=archive", "Match Editorials", "algo_match_editorials"));
            nav.search("m_algo_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ProblemArchive", "Problem Archive", "algo_problem_archive"));
      nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this,'m_des_competitions')", "Software Design", "m_des_competitions"));
         nav.search("m_des_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewActiveContests&ph=112", "Active Contests", "des_compete"));
         nav.search("m_des_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ContestStatus&ph=112", "Contest Status", "des_contest_status"));
         nav.search("m_des_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewReviewProjects&ph=112", "Review Opportunities", "des_review"));
         nav.search("m_des_competitions").addChild(new NavNode("http://"+ApplicationServer.SOFTWARE_SERVER_NAME+"/forum/c_active_collab.jsp?ft=2", "TCS Developer Forums", "tcs_forums_des"));
         nav.search("m_des_competitions").addChild(new NavNode("http://"+ApplicationServer.SOFTWARE_SERVER_NAME+"/review", "Submit Deliverables & Reviews", "des_submit"));
         nav.search("m_des_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=CompList&ph=112", "Statistics", "des_stats"));
         nav.search("m_des_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ReviewBoard&ph=112", "Meet the Review Board", "des_review_board"));
      nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this,'m_dev_competitions')", "Software Development", "m_dev_competitions"));
         nav.search("m_dev_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewActiveContests&ph=113", "Active Contests", "dev_compete"));
         nav.search("m_dev_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ContestStatus&ph=113", "Contest Status", "dev_contest_status"));
         nav.search("m_dev_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewReviewProjects&ph=113", "Review Opportunities", "dev_review"));
         nav.search("m_dev_competitions").addChild(new NavNode("http://"+ApplicationServer.SOFTWARE_SERVER_NAME+"/forum/c_active_collab.jsp?ft=2", "TCS Developer Forums", "tcs_forums_dev"));
         nav.search("m_dev_competitions").addChild(new NavNode("http://"+ApplicationServer.SOFTWARE_SERVER_NAME+"/review", "Submit Deliverables & Reviews", "dev_submit"));
         nav.search("m_dev_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=CompList&ph=113", "Statistics", "dev_stats"));
         nav.search("m_dev_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ReviewBoard&ph=113", "Meet the Review Board", "dev_review_board"));
      nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this,'m_assembly_competitions')", "Software Assembly", "m_assembly_competitions"));
         nav.search("m_assembly_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=dev&d2=assembly&d3=overview", "Overview", "assembly_overview"));
         nav.search("m_assembly_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=dev&d2=assembly&d3=activeContests", "Active Contests", "assembly_compete"));
      nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this,'m_testing_competitions')", "Software Testing", "m_testing_competitions"));
         nav.search("m_testing_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=dev&d2=testing&d3=overview", "Overview", "testing_overview"));
         nav.search("m_testing_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=dev&d2=testing&d3=activeContests", "Active Contests", "testing_compete"));
      nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this,'m_long_contests')", "Marathon Matches", "m_long_contests"));
         nav.search("m_long_contests").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/longcontest/?module=ViewActiveContests", "Compete", "long_compete"));
         nav.search("m_long_contests").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/longcontest/?module=ViewPractice&rt=14", "Practice", "long_practice"));
         nav.search("m_long_contests").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/longcontest/?module=Static&d1=intel_overview", "Intel Multi-Threading Competition Series", "long_intelmtcs"));
         nav.search("m_long_contests").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/longcontest/?module=ViewActiveContests&rt=15", "Intel Active Contests", "long_intelmtcs_compete"));
         nav.search("m_long_contests").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/longcontest/?module=ViewPractice&rt=16", "Intel Practice", "long_intelmtcs_practice"));
         nav.search("m_long_contests").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/longcontest/?module=ViewQueue", "Queue Status", "long_queue"));
         nav.search("m_long_contests").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/longcontest/?module=Static&d1=match_editorials&d2=archive", "Match Editorials", "long_editorials"));
      nav.search("m_competitions").addChild(new NavNode("javascript:void(0)",  "Javascript:toggleMenu(this,'m_tournaments')", "Tournaments", "m_tournaments"));
         nav.search("m_tournaments").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=tournaments&d2=home", "TopCoder", "topcoder_tournaments"));
         nav.search("m_tournaments").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/pl/", "Powered by TopCoder", "pbtc_tournaments"));
         nav.search("m_tournaments").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=CRPFStatic&d1=crpf&d2=crpf_overview", "Charity", "charity_tournaments"));
      nav.search("m_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=digital_run&d2=description", "The Digital Run", "digital_run"));
      nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this,'m_edu_content')", "Educational Content", "m_edu_content"));
         nav.search("m_edu_content").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=tutorials&d2=alg_index", "Algorithm Tutorials", "algo_tutorials"));
         nav.search("m_edu_content").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=tutorials&d2=comp_index", "Component Tutorials", "comp_tutorials"));
         nav.search("m_edu_content").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=features&d2=archive", "Features", "features"));
         nav.search("m_edu_content").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=tutor_transcripts&d2=index", "Tutor Transcripts", "tutor_trans"));
      nav.search("m_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?&module=SurveyList", "Surveys", "competitor_surveys"));
      nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this,'m_my_tc')", "My TopCoder", "m_my_tc"));
         nav.search("m_my_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/Registration?update=true", "Update My Profile", "competitor_update_profile"));
         nav.search("m_my_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewReferrals", "Members Referrals", "referrals"));
         nav.search("m_my_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/PactsMemberServlet?t=affidavit&c=affidavit_history", "Affidavits", "affidavits"));
         nav.search("m_my_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=card&d2=description", "Cards / Badges", "cards_badges"));
      nav.search("m_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=calendar&d2=thisMonth", "Event Calendar", "competition_calendar"));
      nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this,'m_support')", "Support / FAQs / Docs", "m_support"));
         nav.search("m_support").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this,'m_algo_support')", "Algorithm", "m_algo_support"));
            nav.search("m_algo_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=help&d2=index", "How to Compete", "algo_how_to_compete"));
            nav.search("m_algo_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=help&d2=faqIndex", "FAQs", "algo_faqs"));
            nav.search("m_algo_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=help&d2=sampleProblems", "Sample Problems", "algo_sample_problems"));
            nav.search("m_algo_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=help&d2=ratings", "Rating System", "algo_rating_system"));
            nav.search("m_algo_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=help&d2=getPaid&node=algo_get_paid", "How to Get Paid", "algo_get_paid"));
            nav.search("m_algo_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=help&d2=charity", "Charity Donations", "algo_charity"));
//         nav.search("m_support").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this,'m_hs_support')", "High School", "m_hs_support"));
//            nav.search("m_hs_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=hs&d2=support&d3=index", "How to Compete", "hs_how_to_compete"));
//            nav.search("m_hs_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=hs&d2=support&d3=faqIndex", "FAQs", "hs_faqs"));
//            nav.search("m_hs_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=hs&d2=support&d3=sampleProblems", "Sample Problems", "hs_sample_problems"));
//            nav.search("m_hs_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=hs&d2=support&d3=ratings", "Rating System", "hs_rating_system"));
         nav.search("m_support").addChild(new NavNode("javascript:void(0)",  "Javascript:toggleMenu(this,'m_des_support')", "Design", "m_des_support"));
            nav.search("m_des_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=dev&d2=support&d3=desGettingStarted", "How to Compete", "des_getting_started"));
            nav.search("m_des_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=dev&d2=support&d3=desDocumentation", "Documentation", "des_documentation"));
            nav.search("m_des_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=dev&d2=support&d3=desRatings", "Ratings", "des_ratings"));
            nav.search("m_des_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=dev&d2=support&d3=desReliability", "Reliability Ratings", "des_reliability_ratings"));
            nav.search("m_des_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=help&d2=getPaid&node=des_get_paid", "How to Get Paid", "des_get_paid"));
         nav.search("m_support").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this,'m_dev_support')", "Development", "m_dev_support"));
            nav.search("m_dev_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=dev&d2=support&d3=devGettingStarted", "How to Compete", "dev_getting_started"));
            nav.search("m_dev_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=dev&d2=support&d3=devDocumentation", "Documentation", "dev_documentation"));
            nav.search("m_dev_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=dev&d2=support&d3=devRatings", "Ratings", "dev_ratings"));
            nav.search("m_dev_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=dev&d2=support&d3=devReliability", "Reliability Ratings", "dev_reliability_ratings"));
            nav.search("m_dev_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=help&d2=getPaid&node=dev_get_paid", "How to Get Paid", "dev_get_paid"));
         nav.search("m_support").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this,'m_assembly_support')", "Assembly", "m_assembly_support"));
            nav.search("m_assembly_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=dev&d2=assembly&d3=instructions", "How to Compete", "assembly_how_to_compete"));
            nav.search("m_assembly_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=dev&d2=assembly&d3=tutorial", "Tutorial", "assembly_tutorial"));
            nav.search("m_assembly_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=dev&d2=assembly&d3=documentation", "Documentation", "assembly_documentation"));
            nav.search("m_assembly_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=help&d2=getPaid&node=assem_get_paid", "How to Get Paid", "assem_get_paid"));
         nav.search("m_support").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this,'m_testing_support')", "Testing", "m_testing_support"));
            nav.search("m_testing_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=dev&d2=testing&d3=instructions", "How to Compete", "testing_how_to_compete"));
            nav.search("m_testing_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=dev&d2=testing&d3=documentation", "Documentation", "testing_documentation"));
         nav.search("m_support").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this,'m_long_support')", "Marathon Match", "m_long_support"));
            nav.search("m_long_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/longcontest/?module=Static&d1=instructions", "How to Compete", "long_how_to_compete"));

   nav.addRoot(new NavNode("http://"+ApplicationServer.FORUMS_SERVER_NAME+"/", "Forums", "forums"));

   nav.addRoot(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=pressroom&d2=index", "Press Room", "press_room"));

   nav.addRoot(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this,'m_about_tc')", "About TopCoder", "m_about_tc"));
      nav.search("m_about_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=about&d2=index", "Overview", "tc_overview"));
      nav.search("m_about_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=about&d2=contactus", "Contact Us", "contact_us"));
      nav.search("m_about_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=about&d2=whyjoin", "Why Join TopCoder?", "join_tc"));
      nav.search("m_about_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=about&d2=jobs", "Working at TopCoder", "working_tc"));
      nav.search("m_about_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=about&d2=management", "Management Team", "management_team"));
      nav.search("m_about_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=about&d2=terms", "Terms, Revisions", "tc_terms"));
      nav.search("m_about_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=about&d2=privacy", "Privacy Policy", "tc_privacy"));

    request.setAttribute("tree", nav);

%>
<script language="JavaScript" type="text/javascript" src="/js/arena.js"></script>


<script language="javascript" type="text/javascript">
<!--
function toggleMenu(menuTitle,menuID){
   var menu = document.getElementById(menuID);
   if(menu.style.display == 'block') menu.className = 'CLOSED';
   else if(menu.className == 'OPEN' && menu.style.display != 'none') menu.className = 'CLOSED';
   else {
      menu.className = 'OPEN';
   }
   if(menuTitle.blur)menuTitle.blur();
   if(menuTitle.className == 'exp') menuTitle.className = 'exp_ed';
   else menuTitle.className = 'exp';
   return;
}
function flipMenu(myMenuName){
   var menuName = document.getElementById(myMenuName);
   menuName.className = 'exp_ed';
}

// -->
</script>

<!--node is <%=request.getParameter("node")%> -->
<div style="float: left; padding: 0px 0px 0px 0px;"><img src="/i/interface/leftnav_top.gif" alt="" /></div>
<div id="navbar">
<nav:navBuilder navTree="tree" openClass="OPEN" selectedLeafClass="highlight" selectedParentClass="exp_ed" unSelectedParentClass="exp" selectedNode="<%=request.getParameter("node")%>"/>
<jsp:include page="/includes/modules/simpleSearch.jsp"/>
</div>
<div style="float: left; clear:left; padding: 0px 0px 23px 0px;"><img src="/i/interface/leftnav_bottom.gif" alt="" /></div>
