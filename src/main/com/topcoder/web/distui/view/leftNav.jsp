<%@ page language="java"%>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ page import="com.topcoder.web.common.model.NavNode"%>
<%@ page import="com.topcoder.web.common.model.NavTree"%>
<%@ taglib uri="nav.tld" prefix="nav" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%
   /* m_name indicates the name of an expandable menu */

   NavTree nav = new NavTree();
   nav.addRoot(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_competitions')", "Competitions", "m_competitions"));
      nav.search("m_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc", "Home", "competition_home"));
      nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_competitor_stats')",  "The Tops", "m_competitor_stats"));
         nav.search("m_competitor_stats").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_top_rated_competitors')",  "Top Ranked", "m_top_rated_competitors"));
            nav.search("m_top_rated_competitors").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=AlgoRank", "Algorithm", "top_rated_algo"));
            nav.search("m_top_rated_competitors").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/stat?c=top_designers", "Design", "top_rated_des"));
            nav.search("m_top_rated_competitors").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/stat?c=top_developers", "Development", "top_rated_dev"));
            nav.search("m_top_rated_competitors").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=HSRank", "High School", "top_rated_hs"));
            nav.search("m_top_rated_competitors").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/longcontest/stats/?module=CoderRank", "Marathon Match", "top_rated_long"));
         nav.search("m_competitor_stats").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_recordbook')",  "Record Book", "m_recordbook"));
            nav.search("m_recordbook").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=statistics&amp;d2=recordbook_home", "Algorithm", "algo_recordbook"));
            nav.search("m_recordbook").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=compstats&amp;d2=comp_recordbook_home", "Component", "comp_recordbook"));
            nav.search("m_recordbook").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/longcontest/?module=Static&amp;d1=stats&amp;d2=recordbook_home", "Marathon Match", "long_recordbook"));
         nav.search("m_competitor_stats").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_com')",  "Coder of the Month", "m_com"));
            nav.search("m_com").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=COMHistory&amp;achtid=5", "Algorithm", "algo_com"));
            nav.search("m_com").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=COMHistory&amp;achtid=6", "Design", "des_com"));
            nav.search("m_com").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=COMHistory&amp;achtid=7", "Development", "dev_com"));
      nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_algo_competitions')", "Algorithm", "m_algo_competitions"));
//         nav.search("m_algo_competitions").addChild(new NavNode("/wiki/display/tc/Algorithm+Overview", "Overview", "algo_overview"));
         nav.search("m_algo_competitions").addChild(new NavNode("javascript:arena();", "Launch Arena", "algo_compete"));
         nav.search("m_algo_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_algo_stats')", "Statistics", "m_algo_stats"));
            nav.search("m_algo_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=MatchList", "Match Archive", "algo_match_archive"));
            nav.search("m_algo_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/stat?c=round_overview", "Match Overviews", "algo_match_overviews"));
            nav.search("m_algo_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=SrmDivisionWins", "Match Winners", "algo_match_winners"));
            nav.search("m_algo_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/stat?c=last_match", "Match Results", "algo_match_results"));
            nav.search("m_algo_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=match_editorials&amp;d2=archive", "Match Editorials", "algo_match_editorials"));
            nav.search("m_algo_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ProblemArchive", "Problem Archive", "algo_problem_archive"));
            nav.search("m_algo_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ColorChange&amp;ratid=1", "Recent Color Changes", "algo_color_changes"));
            nav.search("m_algo_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/wiki/display/tc/Algorithm+Data+Feeds", "Data Feeds", "algo_data_feeds"));
         nav.search("m_algo_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_algo_support')", "Support / FAQs", "m_algo_support"));
            nav.search("m_algo_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/wiki/display/tc/How+To+Compete+in+Algorithm+Competitions", "How to Compete", "algo_how_to_compete"));
            nav.search("m_algo_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/wiki/display/tc/Algorithm+Competition+FAQs", "FAQs", "algo_faqs"));
            nav.search("m_algo_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/wiki/display/tc/Algorithm+Competition+Rating+System", "Rating System", "algo_rating_system"));
            nav.search("m_algo_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/wiki/display/tc/Write+Problems+for+TopCoder", "Write Problems", "algo_write"));
      nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_architecture_competitions')", "Software Architecture", "m_architecture_competitions"));
         nav.search("m_architecture_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/wiki/display/tc/Architecture+Overview", "Overview", "architecture_overview"));
         nav.search("m_architecture_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewArchitectureActiveContests", "Active Contests", "architecture_compete"));
       nav.search("m_architecture_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ContestStatus&amp;pt=7", "Contest Status", "architecture_contest_status"));
         nav.search("m_architecture_competitions").addChild(new NavNode("http://"+ApplicationServer.SOFTWARE_SERVER_NAME+"/review", "Submit &amp; Review", "architecture_submit"));
         nav.search("m_architecture_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/wiki/display/tc/TopCoder+UML+Tool", "UML Tool", "arch_uml_tool"));
         nav.search("m_architecture_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_architecture_support')", "Support / FAQs", "m_architecture_support"));
            nav.search("m_architecture_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/wiki/display/tc/How+to+Compete+in+Architecture+Competitions", "How to Compete", "architecture_how_to_compete"));
      nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_des_competitions')", "Software Design", "m_des_competitions"));
//         nav.search("m_des_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/wiki/display/tc/Component+Design+Overview", "Overview", "des_overview"));
         nav.search("m_des_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewActiveContests&amp;ph=112", "Active Contests", "des_compete"));
         nav.search("m_des_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ContestStatus&amp;pt=1", "Contest Status", "des_contest_status"));
         nav.search("m_des_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewReviewProjects&amp;ph=112", "Review Opportunities", "des_review"));
         nav.search("m_des_competitions").addChild(new NavNode("http://"+ApplicationServer.SOFTWARE_SERVER_NAME+"/review", "Submit &amp; Review", "des_submit"));
         nav.search("m_des_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/wiki/display/tc/TopCoder+UML+Tool", "UML Tool", "des_uml_tool"));
         nav.search("m_des_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_des_stats')", "Statistics", "m_des_stats"));
            nav.search("m_des_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=CompList&amp;ph=112", "Past Contests", "des_stats"));
            nav.search("m_des_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ColorChange&amp;ph=112", "Recent Color Changes", "des_color_changes"));
            nav.search("m_des_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/wiki/display/tc/Component+Design+Data+Feeds", "Data Feeds", "des_data_feeds"));
         nav.search("m_des_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ReviewBoard&amp;ph=112", "Meet the Review Board", "des_review_board"));
         nav.search("m_des_competitions").addChild(new NavNode("javascript:void(0)",  "Javascript:toggleMenu(this.parentNode,'m_des_support')", "Support / FAQs", "m_des_support"));
            nav.search("m_des_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/wiki/display/tc/How+to+Compete+in+Component+Design+Competitions", "How to Compete", "des_getting_started"));
            nav.search("m_des_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/wiki/display/tc/Component+Design+Documentation", "Documentation", "des_documentation"));
            nav.search("m_des_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/wiki/display/tc/Component+Design+Ratings", "Ratings", "des_ratings"));
            nav.search("m_des_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/wiki/display/tc/Component+Design+Reliability+Ratings", "Reliability Ratings", "des_reliability_ratings"));
      nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_dev_competitions')", "Software Development", "m_dev_competitions"));
//         nav.search("m_dev_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/wiki/display/tc/Component+Development+Overview", "Overview", "dev_overview"));
         nav.search("m_dev_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewActiveContests&amp;ph=113", "Active Contests", "dev_compete"));
         nav.search("m_dev_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ContestStatus&amp;pt=2", "Contest Status", "dev_contest_status"));
         nav.search("m_dev_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewReviewProjects&amp;ph=113", "Review Opportunities", "dev_review"));
         nav.search("m_dev_competitions").addChild(new NavNode("http://"+ApplicationServer.SOFTWARE_SERVER_NAME+"/review", "Submit &amp; Review", "dev_submit"));
         nav.search("m_dev_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/wiki/display/tc/TopCoder+UML+Tool", "UML Tool", "dev_uml_tool"));
         nav.search("m_dev_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_dev_stats')", "Statistics", "m_dev_stats"));
            nav.search("m_dev_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=CompList&amp;ph=113", "Past Contests", "dev_stats"));
            nav.search("m_dev_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ColorChange&amp;ph=113", "Recent Color Changes", "dev_color_changes"));
            nav.search("m_dev_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/wiki/display/tc/Component+Development+Data+Feeds", "Data Feeds", "dev_data_feeds"));
         nav.search("m_dev_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ReviewBoard&amp;ph=113", "Meet the Review Board", "dev_review_board"));
         nav.search("m_dev_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_dev_support')", "Support / FAQs", "m_dev_support"));
            nav.search("m_dev_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/wiki/display/tc/How+to+Compete+in+Component+Development+Competitions", "How to Compete", "dev_getting_started"));
            nav.search("m_dev_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/wiki/display/tc/Component+Development+Documentation", "Documentation", "dev_documentation"));
            nav.search("m_dev_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/wiki/display/tc/Component+Development+Ratings", "Ratings", "dev_ratings"));
            nav.search("m_dev_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/wiki/display/tc/Component+Development+Reliability+Ratings", "Reliability Ratings", "dev_reliability_ratings"));
      nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_assembly_competitions')", "Software Assembly", "m_assembly_competitions"));
         nav.search("m_assembly_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/wiki/display/tc/Assembly", "Overview", "assembly_overview"));
        // switch next two lines to use the old registration          
//         nav.search("m_assembly_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/registration/actions/Registration.do?method=openRegistrations", "Active Contests", "assembly_compete"));
       nav.search("m_assembly_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewAssemblyActiveContests", "Active Contests", "assembly_compete"));
       nav.search("m_assembly_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ContestStatus&amp;pt=14", "Contest Status", "assembly_contest_status"));
         nav.search("m_assembly_competitions").addChild(new NavNode("http://"+ApplicationServer.SOFTWARE_SERVER_NAME+"/review", "Submit &amp; Review", "assembly_submit"));
         nav.search("m_assembly_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_assembly_support')", "Support / FAQs", "m_assembly_support"));
            nav.search("m_assembly_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/wiki/display/tc/How+to+Compete+in+Assembly+Competitions", "How to Compete", "assembly_how_to_compete"));
            nav.search("m_assembly_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/wiki/display/tc/Assembly+Competition+Tutorial", "Tutorial", "assembly_tutorial"));
            nav.search("m_assembly_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/wiki/display/tc/Assembly+Competition+Documentation", "Documentation", "assembly_documentation"));
      nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_testing_competitions')", "Application Testing", "m_testing_competitions"));
//         nav.search("m_testing_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/wiki/display/tc/Testing+Overview", "Overview", "testing_overview"));
         nav.search("m_testing_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=dev&amp;d2=testing&amp;d3=overview", "Overview", "testing_overview"));
         nav.search("m_testing_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ActiveContests&amp;pt=13", "Active Contests", "app_testing_compete"));
         nav.search("m_testing_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ContestStatus&pt=13", "Contest Status", "app_testing_status"));
         nav.search("m_testing_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_testing_support')", "Support / FAQs", "m_testing_support"));
            nav.search("m_testing_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=dev&amp;d2=testing&amp;d3=instructions", "How to Compete", "testing_how_to_compete"));
            nav.search("m_testing_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=dev&amp;d2=testing&amp;d3=tutorial", "Tutorial", "testing_tutorial"));
            nav.search("m_testing_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=dev&amp;d2=testing&amp;d3=documentation", "Documentation", "testing_documentation"));
      nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_bugraces_competitions')", "Bug Races", "m_bugraces_competitions"));
         nav.search("m_bugraces_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/wiki/display/tc/Bug+Races", "Overview", "bugraces_overview"));
         nav.search("m_bugraces_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/wiki/display/tc/Active+Bug+Races", "Active Contests", "bugraces_compete"));
         nav.search("m_bugraces_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_bugraces_support')", "Support / FAQs", "m_bugraces_support"));
            nav.search("m_bugraces_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/wiki/display/tc/How+to+Compete+in+Bug+Races", "How to Compete", "bugraces_how_to_compete"));
      nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_hs_competitions')", "High School", "m_hs_competitions"));
         nav.search("m_hs_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=hs&amp;d2=home", "Overview", "hs_overview"));
         nav.search("m_hs_competitions").addChild(new NavNode("javascript:arena();", "Launch Arena", "hs_compete"));
         nav.search("m_hs_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_hs_stats')", "Statistics", "m_hs_stats"));
            nav.search("m_hs_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=HSRoundOverview", "Match Overview", "hs_match_overview"));
            nav.search("m_hs_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=HSRoundStatsTeam", "Match Results (Team)", "hs_team_match_results"));
            nav.search("m_hs_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=HSRoundStatsInd", "Match Results (Indiv.)", "hs_ind_match_results"));
            nav.search("m_hs_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=hs&amp;d2=match_editorials&amp;d3=archive", "Match Editorials", "hs_match_editorials"));
            nav.search("m_hs_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ColorChange&amp;ratid=2", "Recent Color Changes", "hs_algo_color_changes"));
            nav.search("m_hs_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=hs&amp;d2=support&amp;d3=dataFeed", "Data Feeds", "hs_data_feeds"));
         nav.search("m_hs_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=hs&amp;d2=sponsorship", "Sponsorship", "hs_sponsor"));
         nav.search("m_hs_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_hs_support')", "Support / FAQs", "m_hs_support"));
            nav.search("m_hs_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=hs&amp;d2=support&amp;d3=index", "How to Compete", "hs_how_to_compete"));
            nav.search("m_hs_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=hs&amp;d2=support&amp;d3=faqIndex", "FAQs", "hs_faqs"));
            nav.search("m_hs_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=hs&amp;d2=support&amp;d3=sampleProblems", "Sample Problems", "hs_sample_problems"));
            nav.search("m_hs_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=hs&amp;d2=support&amp;d3=ratings", "Rating System", "hs_rating_system"));
            nav.search("m_hs_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=help&amp;d2=problemWriter&amp;node=hs_write", "Write Problems", "hs_write"));
      nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_long_contests')", "Marathon Matches", "m_long_contests"));
//         nav.search("m_long_contests").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/wiki/display/tc/Marathon+Matches+Overview", "Overview", "long_overview"));
         nav.search("m_long_contests").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/longcontest/?module=ViewActiveContests", "Active Contests", "long_compete"));
         nav.search("m_long_contests").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/longcontest/?module=ViewPractice", "Practice", "long_practice"));
         nav.search("m_long_contests").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/longcontest/?module=ViewQueue", "Queue Status", "long_queue"));
         nav.search("m_long_contests").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_long_stats')", "Statistics", "m_long_stats"));
            nav.search("m_long_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/longcontest/stats/?module=MatchList", "Match Archive", "long_match_archive"));
            nav.search("m_long_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/longcontest/stats/?module=ViewOverview", "Match Overview", "long_match_overview"));
            nav.search("m_long_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/longcontest/stats/?module=MatchWinners", "Match Winners", "long_match_winners"));        
            nav.search("m_long_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/longcontest/?module=Static&amp;d1=match_editorials&amp;d2=archive", "Match Editorials", "long_editorials"));
            nav.search("m_long_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/longcontest/?module=Static&amp;d1=support&amp;d2=dataFeed", "Data Feeds", "long_data_feeds"));                
         nav.search("m_long_contests").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_long_support')", "Support / FAQs", "m_long_support"));
            nav.search("m_long_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/longcontest/?module=Static&amp;d1=instructions", "How to Compete", "long_how_to_compete"));
            nav.search("m_long_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/longcontest/?module=Static&amp;d1=support&amp;d2=ratings", "Rating System", "long_rating_system"));
      nav.search("m_competitions").addChild(new NavNode("javascript:void(0)",  "Javascript:toggleMenu(this.parentNode,'m_tournaments')", "Tournaments", "m_tournaments"));
         nav.search("m_tournaments").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=tournaments&amp;d2=home", "TopCoder", "topcoder_tournaments"));
         nav.search("m_tournaments").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/pl/", "Powered by TopCoder", "pbtc_tournaments"));
         nav.search("m_tournaments").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=CRPFStatic&amp;d1=crpf&amp;d2=crpf_overview", "Charity", "charity_tournaments"));
      nav.search("m_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=digital_run&amp;d2=description", "The Digital Run", "digital_run"));
      nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_edu_content')", "Educational Content", "m_edu_content"));
         nav.search("m_edu_content").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=education&amp;d2=overview", "Overview", "edu_overview"));
         nav.search("m_edu_content").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=tutorials&amp;d2=alg_index", "Algorithm Tutorials", "algo_tutorials"));
         nav.search("m_edu_content").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=tutorials&amp;d2=comp_index", "Component Tutorials", "comp_tutorials"));
         nav.search("m_edu_content").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=tutorials&amp;d2=mm_index", "Marathon Tutorials", "mm_tutorials"));
         nav.search("m_edu_content").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=features&amp;d2=archive", "Features", "features"));
         nav.search("m_edu_content").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=help&amp;d2=writeForTC", "Write for TopCoder", "write_for_tc"));
      nav.search("m_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/wiki/display/tc/How+to+Get+Paid+for+Competing", "How to Get Paid", "how_to_get_paid"));

   nav.addRoot(new NavNode("http://"+ApplicationServer.FORUMS_SERVER_NAME+"/", "Forums", "forums"));

   nav.addRoot(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=calendar&amp;d2=thisMonth", "Event Calendar", "competition_calendar"));

   nav.addRoot(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=pressroom&amp;d2=index", "Press Room", "press_room"));

   nav.addRoot(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?&amp;module=SurveyList", "Surveys", "competitor_surveys"));

   nav.addRoot(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=MyHome", "My TopCoder", "my_topcoder"));

   nav.addRoot(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_about_tc')", "About TopCoder", "m_about_tc"));
      nav.search("m_about_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=about&amp;d2=index", "Overview", "tc_overview"));
      nav.search("m_about_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=about&amp;d2=contactus", "Contact Us", "contact_us"));
      nav.search("m_about_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=about&amp;d2=whyjoin", "Why Join TopCoder?", "join_tc"));
      nav.search("m_about_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=about&amp;d2=jobs", "Working at TopCoder", "working_tc"));
      nav.search("m_about_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=about&amp;d2=management", "Management Team", "management_team"));
      nav.search("m_about_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=about&amp;d2=terms", "Terms, Revisions", "tc_terms"));
      nav.search("m_about_tc").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=about&amp;d2=privacy", "Privacy Policy", "tc_privacy"));

    request.setAttribute("tree", nav);

%>
<script language="JavaScript" type="text/javascript" src="/js/arena.js"></script>


<script language="JavaScript" type="text/javascript">
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

<div style="padding: 0px;"><img src="/i/interface/leftnav_top.gif" alt="" /></div>
<div id="navbar">
    <nav:navBuilder navTree="tree" openClass="OPEN" selectedLeafClass="highlight" selectedParentClass="exp_ed" unSelectedParentClass="exp" selectedNode="<%=request.getParameter("node")%>"/>
    <div style="float: left; padding: 10px 0px 0px 17px;">
        <a href="<tc-webtag:linkTracking link='/tc?module=Static&amp;d1=media&amp;d2=tcchannel' refer='leftnav' />"><img src="/i/tcchannel/leftnavLogo.png" alt="TC Channel" /></a>
    </div>
    <jsp:include page="includes/modules/simpleSearch.jsp"/>
</div>
<div style="float: left; clear:left; padding: 0px 0px 23px 0px;"><img src="/i/interface/leftnav_bottom.gif" alt="" /></div>

<%
    String node = request.getParameter("node") == null ? "" : request.getParameter("node");
    if (!node.equals("competition_home")) {%>
    <div align="center" style="float: left; clear:left; width: 170px; margin: 0px;">
        <img src="/i/interface/brackets.png" alt="" style="margin-bottom: 23px;" />
    </div>
<% } %>