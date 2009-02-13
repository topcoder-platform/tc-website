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
         nav.search("m_competitor_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=SimpleStats&trans=true&c=com_history&d1=statistics&d2=coderOfMonth", "Coder of the Month", "coder_of_month"));
      nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this,'m_algo_competitions')", "Algorithm", "m_algo_competitions"));
         nav.search("m_algo_competitions").addChild(new NavNode("javascript:arena();", "Compete<br>(Launch Arena)", "algo_compete"));
         nav.search("m_algo_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this,'m_algo_stats')", "Statistics", "m_algo_stats"));
            nav.search("m_algo_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=MatchList", "Match Archive", "algo_match_archive"));
            nav.search("m_algo_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/stat?&c=round_overview", "Match Overviews", "algo_match_overviews"));
            nav.search("m_algo_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/stat?&c=last_match", "Match Results", "algo_match_results"));
            nav.search("m_algo_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=match_editorials&d2=archive", "Match Editorials", "algo_match_editorials"));
            nav.search("m_algo_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ProblemArchive", "Problem Archive", "algo_problem_archive"));
      nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this,'m_des_competitions')", "Component Design", "m_des_competitions"));
         nav.search("m_des_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewActiveContests&pi=112", "Active Contests", "des_compete"));
         nav.search("m_des_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewReviewProjects&pi=112", "Review Opportunities", "des_review"));
         nav.search("m_des_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/", "Submit Deliverables & Reviews", "des_submit"));
         nav.search("m_des_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=CompList&pi=112", "Statistics", "des_stats"));
         nav.search("m_des_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ReviewBoard&ph=112", "Meet the Review Board", "des_review_board"));
      nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this,'m_dev_competitions')", "Component Development", "m_dev_competitions"));
         nav.search("m_dev_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewActiveContests&pi=113", "Active Contests", "dev_compete"));
         nav.search("m_dev_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewReviewProjects&pi=113", "Review Opportunities", "dev_review"));
         nav.search("m_dev_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/", "Submit Deliverables & Reviews", "dev_submit"));
         nav.search("m_dev_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=CompList&pi=113", "Statistics", "dev_stats"));
         nav.search("m_dev_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ReviewBoard&ph=113", "Meet the Review Board", "dev_review_board"));
      nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this,'m_long_contests')", "Marathon Matches", "m_long_contests"));
         nav.search("m_long_contests").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/", "Compete", "long_compete"));
         nav.search("m_long_contests").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/", "Practice", "long_practice"));
         nav.search("m_long_contests").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/", "Intel Multi-Threading Competition Series", "long_intelmtcs"));
         nav.search("m_long_contests").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/", "Intel Active Contests", "long_intelmtcs_compete"));
         nav.search("m_long_contests").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/", "Intel Practice", "long_intelmtcs_practice"));
         nav.search("m_long_contests").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/", "Queue Status", "long_queue"));
         nav.search("m_long_contests").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/", "Match Editorials", "long_editorials"));
      nav.search("m_competitions").addChild(new NavNode("javascript:void(0)",  "Javascript:toggleMenu(this,'m_tournaments')", "Tournaments", "m_tournaments"));
         nav.search("m_tournaments").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=tournaments&d2=home", "TopCoder", "topcoder_tournaments"));
         nav.search("m_tournaments").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/pl/", "Powered by TopCoder", "pbtc_tournaments"));
         nav.search("m_tournaments").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=CRPFStatic&d1=crpf&d2=crpf_overview", "Charity", "charity_tournaments"));
      nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this,'m_edu_content')", "Educational Content", "m_edu_content"));
         nav.search("m_edu_content").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=tutorials&d2=alg_index", "Algorithm Tutorials", "algo_tutorials"));
         nav.search("m_edu_content").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=tutorials&d2=comp_index", "Component Tutorials", "comp_tutorials"));
         nav.search("m_edu_content").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=features&d2=archive", "Features", "features"));
         nav.search("m_edu_content").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=tutor_transcripts&d2=index", "Tutor Transcripts", "tutor_trans"));
      nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this,'m_my_tc')", "My TopCoder", "m_my_tc"));
         nav.search("m_my_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/Registration?update=true", "Update My Profile", "competitor_update_profile"));
         nav.search("m_my_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewReferrals", "Members I've Referred", "referrals"));
         nav.search("m_my_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/PactsMemberServlet?t=affidavit&c=affidavit_history", "Affidavits", "affidavits"));
         nav.search("m_my_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=card&d2=description", "Cards / Badges", "cards_badges"));
      nav.search("m_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=calendar&d2=thisMonth", "Event Calendar", "competition_calendar"));
      nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this,'m_support')", "Support / FAQs / Docs", "m_support"));
         nav.search("m_support").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this,'m_algo_support')", "Algorithm", "m_algo_support"));
            nav.search("m_algo_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=help&d2=index", "How to Compete", "algo_how_to_compete"));
            nav.search("m_algo_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=help&d2=faqIndex", "FAQs", "algo_faqs"));
            nav.search("m_algo_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=help&d2=sampleProblems", "Sample Problems", "algo_sample_problems"));
            nav.search("m_algo_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=help&d2=ratings", "Rating System", "algo_rating_system"));
            nav.search("m_algo_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=help&d2=algPayment", "How to Get Paid", "algo_get_paid"));
            nav.search("m_algo_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=help&d2=charity", "Charity Donations", "algo_charity"));
         nav.search("m_support").addChild(new NavNode("javascript:void(0)",  "Javascript:toggleMenu(this,'m_des_support')", "Design", "m_des_support"));
            nav.search("m_des_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=dev&d2=support&d3=desGettingStarted", "How to Compete", "des_getting_started"));
            nav.search("m_des_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=dev&d2=support&d3=desGettingPaid", "How to Get Paid", "des_getting_paid"));
            nav.search("m_des_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=dev&d2=support&d3=desDocumentation", "Documentation", "des_documentation"));
            nav.search("m_des_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=dev&d2=support&d3=desRatings", "Ratings", "des_ratings"));
            nav.search("m_des_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=dev&d2=support&d3=desReliability", "Reliability Ratings", "des_reliability_ratings"));
         nav.search("m_support").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this,'m_dev_support')", "Development", "m_dev_support"));
            nav.search("m_dev_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=dev&d2=support&d3=devGettingStarted", "How to Compete", "dev_getting_started"));
            nav.search("m_dev_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=dev&d2=support&d3=devGettingPaid", "How to Get Paid", "dev_getting_paid"));
            nav.search("m_dev_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=dev&d2=support&d3=devDocumentation", "Documentation", "dev_documentation"));
            nav.search("m_dev_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=dev&d2=support&d3=devRatings", "Ratings", "dev_ratings"));
            nav.search("m_dev_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=dev&d2=support&d3=devReliability", "Reliability Ratings", "dev_reliability_ratings"));
         nav.search("m_support").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this,'m_long_support')", "Marathon Match", "m_long_support"));
            nav.search("m_long_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/", "How to Compete", "long_how_to_compete"));
            nav.search("m_long_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/", "Rules", "long_rules"));

   nav.addRoot(new NavNode("http://"+ApplicationServer.FORUMS_SERVER_NAME+"/", "Forums", "forums"));

   nav.addRoot(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=contracting&d2=index", "Employment", "employment_opps"));

   nav.addRoot(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=pressroom&d2=index", "Press Room", "press_room"));

   nav.addRoot(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this,'m_about_tc')", "About TopCoder", "m_about_tc"));
      nav.search("m_about_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=about&d2=index", "Overview", "tc_overview"));
      nav.search("m_about_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=about&d2=contactus", "Contact Us", "contact_us"));
      nav.search("m_about_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=about&d2=whyjoin", "Why Join TopCoder?", "join_tc"));
      nav.search("m_about_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=about&d2=jobs", "Working at TopCoder?", "working_tc"));
      nav.search("m_about_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=about&d2=management", "Management Team", "management_team"));
      nav.search("m_about_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=about&d2=terms", "Terms, Revisions", "tc_terms"));
      nav.search("m_about_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=about&d2=privacy", "Privacy Policy", "tc_privacy"));


   request.setAttribute("tree", nav);

%>
<script language="JavaScript" type="text/javascript" src="/js/taconite-client.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/taconite-parser.js"></script>

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
   if (menuId=='m_forums') {
     var ajaxRequest = new AjaxRequest('http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=NavList');
     ajaxRequest.sendRequest();
   }
   return;
}
function flipMenu(myMenuName){
   var menuName = document.getElementById(myMenuName);
   menuName.className = 'exp_ed';
}
var detectableWithVB = false;
var pluginFound = false;

function goURL(daURL) {
    if(javascriptVersion1_1) {
   window.location.replace(daURL);
    } else {
   window.location = daURL;
    }
    return;
}

function redirectCheck(pluginFound, redirectURL, redirectIfFound) {
    if( redirectURL && ((pluginFound && redirectIfFound) ||
   (!pluginFound && !redirectIfFound)) ) {
   goURL(redirectURL);
   return pluginFound;
    } else {
   return pluginFound;
    }
}

function canDetectPlugins() {
    if( detectableWithVB || (navigator.plugins && navigator.plugins.length > 0) ) {
   return true;
    } else {
   return false;
    }
}

function detectJavaWebStartWithMimeTypes() {
    if (navigator.mimeTypes && navigator.mimeTypes.length) {
        if (navigator.mimeTypes['application/x-java-jnlp-file']) {
            return true;
        }
    }
    return false;
}

function detectJavaWebStart(redirectURL, redirectIfFound) {
    pluginFound = detectJavaWebStartWithMimeTypes();
    if(!pluginFound && detectableWithVB) {
   pluginFound = detectActiveXControl('JavaWebStart.isInstalled');
    }
    return redirectCheck(pluginFound, redirectURL, redirectIfFound);
}

function detectJava(redirectURL, redirectIfFound) {
    pluginFound = detectPlugin('Java','Plug-in');
    if(!pluginFound && detectableWithVB) {
   pluginFound = detectActiveXControl('JavaPlugin');
    }
    return redirectCheck(pluginFound, redirectURL, redirectIfFound);
}

function detectPlugin() {
    var daPlugins = detectPlugin.arguments;
    var pluginFound = false;
    if (navigator.plugins && navigator.plugins.length > 0) {
   var pluginsArrayLength = navigator.plugins.length;
   for (pluginsArrayCounter=0; pluginsArrayCounter < pluginsArrayLength; pluginsArrayCounter++ ) {
       var numFound = 0;
       for(namesCounter=0; namesCounter < daPlugins.length; namesCounter++) {
      if( (navigator.plugins[pluginsArrayCounter].name.indexOf(daPlugins[namesCounter]) >= 0) ||
          (navigator.plugins[pluginsArrayCounter].description.indexOf(daPlugins[namesCounter]) >= 0) ) {
         numFound++;
      }
       }
       if(numFound == daPlugins.length) {
      pluginFound = true;
      break;
       }
   }
    }
    return pluginFound;
}

if ((navigator.userAgent.indexOf('MSIE') != -1) && (navigator.userAgent.indexOf('Win') != -1)) {
    document.writeln('<script language="VBscript">');

    document.writeln('\'do a one-time test for a version of VBScript that can handle this code');
    document.writeln('detectableWithVB = False');
    document.writeln('If ScriptEngineMajorVersion >= 2 then');
    document.writeln('  detectableWithVB = True');
    document.writeln('End If');

    document.writeln('\'this next function will detect most plugins');
    document.writeln('Function detectActiveXControl(activeXControlName)');
    document.writeln('  on error resume next');
    document.writeln('  detectActiveXControl = False');
    document.writeln('  If detectableWithVB Then');
    document.writeln('     detectActiveXControl = IsObject(CreateObject(activeXControlName))');
    document.writeln('  End If');
    document.writeln('End Function');

    document.writeln('</scr' + 'ipt>');
}

// -->
</script>

<!--node is <%=request.getParameter("node")%> -->
<div style="float: left; padding: 0px 0px 0px 0px;"><img src="/i/interface/leftnav_top.gif" alt="" /></div>
<div id="navbar">
<nav:navBuilder navTree="tree" openClass="OPEN" selectedLeafClass="highlight" selectedParentClass="exp_ed" unSelectedParentClass="exp" selectedNode="<%=request.getParameter("node")%>"/>
<jsp:include page="../includes/modules/leftNavSearch.jsp"/>
</div>
<div style="float: left; clear:left; padding: 0px 0px 23px 0px;"><img src="/i/interface/leftnav_bottom.gif" alt="" /></div>
