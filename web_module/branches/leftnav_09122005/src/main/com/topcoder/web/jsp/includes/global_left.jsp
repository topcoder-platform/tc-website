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
      nav.search("m_competitions").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_algo_competitions')\" class=\"exp\">Algorithm</a>", "m_algo_competitions"));
         nav.search("m_algo_competitions").addChild(new NavNode("", "Compete", "algo_compete"));
         nav.search("m_algo_competitions").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_algo_stats')\" class=\"exp\">Statistics</a>", "m_algo_stats"));
            nav.search("m_algo_stats").addChild(new NavNode("", "Match Archive", "algo_match_archive"));
            nav.search("m_algo_stats").addChild(new NavNode("", "Match Overviews", "algo_match_overviews"));
            nav.search("m_algo_stats").addChild(new NavNode("", "Match Results", "algo_match_results"));
            nav.search("m_algo_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=match_editorials&d2=archive", "Match Editorials", "algo_match_editorials"));
            nav.search("m_algo_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ProblemArchive", "Problem Archive", "algo_problem_archive"));
      nav.search("m_competitions").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_des_competitions')\" class=\"exp\">Design</a>", "m_des_competitions"));
         nav.search("m_des_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewActiveContests", "Compete", "des_compete"));
         nav.search("m_des_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewReviewProjects", "Review Submissions", "des_review"));
         nav.search("m_des_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=CompList&pi=112", "Statistics", "des_stats"));
         nav.search("m_des_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ReviewBoard&ph=112", "Meet the Review Board", "des_review_board"));
      nav.search("m_competitions").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_dev_competitions')\" class=\"exp\">Development</a>", "m_dev_competitions"));
         nav.search("m_dev_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewActiveContests", "Compete", "dev_compete"));
         nav.search("m_dev_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewReviewProjects", "Review Submissions", "dev_review"));
         nav.search("m_dev_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=CompList&pi=113", "Statistics", "dev_stats"));
         nav.search("m_dev_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ReviewBoard&ph=113", "Meet the Review Board", "dev_review_board"));
      nav.search("m_competitions").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_long_contests')\" class=\"exp\">Marathon Matches</a>", "m_long_contests"));
         nav.search("m_long_contests").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/", "Compete", "long_compete"));
         nav.search("m_long_contests").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/", "Practice", "long_practice"));
         nav.search("m_long_contests").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/", "Match Editorials", "long_editorials"));
      nav.search("m_competitions").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_competitor_stats')\" class=\"exp\">Competitor Statistics</a>", "m_competitor_stats"));
         nav.search("m_competitor_stats").addChild(new NavNode("", "Find a Competitor", "competitor_find"));
         nav.search("m_competitor_stats").addChild(new NavNode("", "Competitor Profile", "competitor_profile"));
         nav.search("m_competitor_stats").addChild(new NavNode("", "Top Rated", "top_rated"));
         nav.search("m_competitor_stats").addChild(new NavNode("", "Record Book", "record_book"));
         nav.search("m_competitor_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=SimpleStats&trans=true&c=com_history&d1=statistics&d2=coderOfMonth", "Coder of the Month", "coder_of_month"));
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
      nav.search("m_competitions").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_support')\" class=\"exp\">Support / FAQs / Docs</a>", "m_support"));
         nav.search("m_support").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_algo_support')\" class=\"exp\">Algorithm</a>", "m_algo_support"));
            nav.search("m_algo_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=help&d2=index", "How to Compete", "algo_how_to_compete"));
            nav.search("m_algo_support").addChild(new NavNode("", "FAQs", "algo_faqs"));
            nav.search("m_algo_support").addChild(new NavNode("", "Sample Problems", "algo_sample_problems"));
            nav.search("m_algo_support").addChild(new NavNode("", "Rating System", "algo_rating_system"));
            nav.search("m_algo_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=help&d2=algPayment", "How to Get Paid", "algo_get_paid"));
            nav.search("m_algo_support").addChild(new NavNode("", "Charity Donations", "Charity Donations"));
         nav.search("m_support").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_des_support')\" class=\"exp\">Design</a>", "m_des_support"));
            nav.search("m_des_support").addChild(new NavNode("", "How to Compete", "comp_how_to_compete"));
            nav.search("m_des_support").addChild(new NavNode("", "How to Get Paid", "comp_how_to_get_paid"));
            nav.search("m_des_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=dev&d2=support&d3=compDocumentation", "Documentation", "comp_documentation"));
            nav.search("m_des_support").addChild(new NavNode("", "Ratings", "comp_ratings"));
            nav.search("m_des_support").addChild(new NavNode("", "Reliability Ratings", "comp_reliability_ratings"));
         nav.search("m_support").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_dev_support')\" class=\"exp\">Development</a>", "m_dev_support"));
            nav.search("m_dev_support").addChild(new NavNode("", "How to Compete", "comp_how_to_compete"));
            nav.search("m_dev_support").addChild(new NavNode("", "How to Get Paid", "comp_how_to_get_paid"));
            nav.search("m_dev_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=dev&d2=support&d3=compDocumentation", "Documentation", "comp_documentation"));
            nav.search("m_dev_support").addChild(new NavNode("", "Ratings", "comp_ratings"));
            nav.search("m_dev_support").addChild(new NavNode("", "Reliability Ratings", "comp_reliability_ratings"));
         nav.search("m_support").addChild(new NavNode("<a href=\"Javascript:toggleMenu('m_long_support')\" class=\"exp\">Marathon Match</a>", "m_long_support"));
            nav.search("m_long_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/", "How to Compete", "long_how_to_compete"));
            nav.search("m_long_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/", "Rules", "long_rules"));

   nav.addRoot(new NavNode("<a onClick=\"flipMenu(this.id)\" href=\"Javascript:toggleMenu('m_forums')\" class=\"exp\">Forums</a>", "m_forums"));
      nav.search("m_forums").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc", "Round Tables", "forum_round_tables"));
      nav.search("m_forums").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc", "Algorithm Matches", "forum_algo_matches"));
      nav.search("m_forums").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc", "Marathon Matches", "forum_long_contests"));
      nav.search("m_forums").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc", "News Discussions", "forum_news"));
      nav.search("m_forums").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc", "Sponsor Discussions", "forum_sponsors"));



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

<div style="float: left; padding: 3px 0px 0px 0px;"><img src="/i/interface/leftnav_top.gif" alt="" /></div>
<div id="navbar">
<nav:navBuilder navTree="tree" openClass="OPEN" selectedClass="highlight" selectedNode="<%=request.getParameter("node")%>"/>
<jsp:include page="../includes/modules/leftNavSearch.jsp"/>
</div>
<div style="float: left; padding: 0px 0px 3px 0px;"><img src="/i/interface/leftnav_bottom.gif" alt="" /></div>
