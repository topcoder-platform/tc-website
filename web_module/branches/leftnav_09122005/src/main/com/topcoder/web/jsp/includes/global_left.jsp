<%@ page language="java"%>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ page import="com.topcoder.web.common.model.NavTree"%>
<%@ page import="com.topcoder.web.common.model.NavNode"%>
<%@ taglib uri="nav.tld" prefix="nav" %>

<%

   /* m_name indicates the name of an expandable menu */

   NavTree nav = new NavTree();
   nav.addRoot(new NavNode("<a href=\"Javascript:toggleMenu('m_competitions')\" class=\"exp\">Competitions</a>", "m_competitions"));
      nav.search("m_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc", "Home", "competition_home"));
      nav.search("m_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/Registration", "Register to Compete", "competition_reg"));
      nav.search("m_competitions").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_algo_competitions')\" class=\"exp\">Algorithm Competitions</a>", "m_algo_competitions"));
         nav.search("m_algo_competitions").addChild(new NavNode("", "Home", "algo_home"));
         nav.search("m_algo_competitions").addChild(new NavNode("", "Compete / Launch Arena", "algo_arena"));
         nav.search("m_algo_competitions").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_algo_stats')\" class=\"exp\">Competition Statistics</a>", "m_algo_stats"));
            nav.search("m_algo_stats").addChild(new NavNode("", "Match Archive", "algo_match_archive"));
            nav.search("m_algo_stats").addChild(new NavNode("", "Match Overviews", "algo_match_overviews"));
            nav.search("m_algo_stats").addChild(new NavNode("", "Match Results", "algo_match_results"));
            nav.search("m_algo_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=match_editorials&d2=archive", "Match Editorials", "algo_match_editorials"));
            nav.search("m_algo_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ProblemArchive", "Problem Archive", "algo_problem_archive"));
         nav.search("m_algo_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=AlgoRank", "Top Ranked Members", "algo_top_ranked"));
         nav.search("m_algo_competitions").addChild(new NavNode("", "Record Book", "algo_record_book"));
         nav.search("m_algo_competitions").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_algo_support')\" class=\"exp\">Support / FAQs</a>", "m_algo_support"));
            nav.search("m_algo_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=help&d2=index", "How to Compete", "algo_how_to_compete"));
            nav.search("m_algo_support").addChild(new NavNode("", "FAQs", "algo_faqs"));
            nav.search("m_algo_support").addChild(new NavNode("", "Sample Problems", "algo_sample_problems"));
            nav.search("m_algo_support").addChild(new NavNode("", "Rating System", "algo_rating_system"));
            nav.search("m_algo_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=help&d2=algPayment", "How to Get Paid", "algo_get_paid"));
            nav.search("m_algo_support").addChild(new NavNode("", "Charity Donations", "Charity Donations"));
      nav.search("m_competitions").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_comp_competitions')\" class=\"exp\">Component Competitions</a>", "m_comp_competitions"));
         nav.search("m_comp_competitions").addChild(new NavNode("", "Home", "component_home"));
         nav.search("m_comp_competitions").addChild(new NavNode("", "Active Contests", "component_active_contests"));
         nav.search("m_comp_competitions").addChild(new NavNode("", "Review Submissions", "comp_review"));
         nav.search("m_comp_competitions").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_comp_stats')\" class=\"exp\">Competition Statistics</a>", "m_comp_stats"));
            nav.search("m_comp_stats").addChild(new NavNode("", "Design Contests", "comp_des_contests"));
            nav.search("m_comp_stats").addChild(new NavNode("", "Development Contests", "comp_dev_contests"));
         nav.search("m_comp_competitions").addChild(new NavNode("", "Top Ranked Members", "comp_top_ranked"));
         nav.search("m_comp_competitions").addChild(new NavNode("", "Record Book", "comp_record_book"));
         nav.search("m_comp_competitions").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_comp_review_board')\" class=\"exp\">Meet the Review Board</a>", "m_comp_review_board"));
            nav.search("m_comp_review_board").addChild(new NavNode("", "Design Review Board", "comp_des_review_board"));
            nav.search("m_comp_review_board").addChild(new NavNode("", "Development Review Board", "comp_dev_review_board"));
         nav.search("m_comp_competitions").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_comp_support')\" class=\"exp\">Support / Documentation</a>", "m_comp_support"));
            nav.search("m_comp_support").addChild(new NavNode("", "How to Compete", "comp_how_to_compete"));
            nav.search("m_comp_support").addChild(new NavNode("", "How to Get Paid", "comp_how_to_get_paid"));
            nav.search("m_comp_support").addChild(new NavNode("", "Documentation", "comp_documentation"));
            nav.search("m_comp_support").addChild(new NavNode("", "Ratings", "comp_ratings"));
            nav.search("m_comp_support").addChild(new NavNode("", "Reliability Ratings", "comp_reliability_ratings"));
      nav.search("m_competitions").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_competitor_stats')\" class=\"exp\">Member Statistics</a>", "m_competitor_stats"));
         nav.search("m_competitor_stats").addChild(new NavNode("", "Find a Competitor", "competitor_find"));
         nav.search("m_competitor_stats").addChild(new NavNode("", "Competitor Profile", "competitor_profile"));
      nav.search("m_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=SimpleStats&trans=true&c=com_history&d1=statistics&d2=coderOfMonth", "Coder of the Month", "coder_of_month"));
      nav.search("m_competitions").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_tournaments')\" class=\"exp\">Tournaments</a>", "m_tournaments"));
         nav.search("m_tournaments").addChild(new NavNode("", "TopCoder", "topcoder_tournaments"));
         nav.search("m_tournaments").addChild(new NavNode("", "Powered by TopCoder", "pbtc_tournaments"));
         nav.search("m_tournaments").addChild(new NavNode("", "Charity", "charity_tournaments"));
      nav.search("m_competitions").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_edu_content')\" class=\"exp\">Educational Content</a>", "m_edu_content"));
         nav.search("m_edu_content").addChild(new NavNode("", "Algorithm Tutorials", "algo_tutorials"));
         nav.search("m_edu_content").addChild(new NavNode("", "Component Tutorials", "comp_tutorials"));
         nav.search("m_edu_content").addChild(new NavNode("", "Features", "features"));
         nav.search("m_edu_content").addChild(new NavNode("", "Tutor Transcripts", "tutor_trans"));
      nav.search("m_competitions").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_my_tc')\" class=\"exp\">My TopCoder</a>", "m_my_tc"));
         nav.search("m_my_tc").addChild(new NavNode("", "Update My Profile", "update_profile"));
         nav.search("m_my_tc").addChild(new NavNode("", "Members I've Referred", "referrals"));
         nav.search("m_my_tc").addChild(new NavNode("", "Affidavits", "affidavits"));
         nav.search("m_my_tc").addChild(new NavNode("", "Cards / Badges", "cards_badges"));
      nav.search("m_competitions").addChild(new NavNode("", "Event Calendar", "competition_calendar"));



   request.setAttribute("tree", nav);

%>

<script language="javascript" type="text/javascript">
<!--
function toggleMenu(objectID){
   var object = document.getElementById(objectID);
   if(object.style.display == 'block') object.className = 'CLOSED';
   else if(object.className == 'OPEN' && object.style.display != 'none') object.className = 'CLOSED';
   else {
      object.className = 'OPEN'; 
   }
   return;
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




<div id="navbar" style="float: left; clear: left;">
<nav:navBuilder navTree="tree" openClass="OPEN" selectedClass="highlight" selectedNode="<%=request.getParameter("node")%>"/>
</div>

<div style="float: left; clear: left; padding: 15px 0px 40px 15px;">
<jsp:include page="../includes/modules/leftNavSearch.jsp"/>
</div>