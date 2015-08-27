<%--
 * Copyright (C) 2004 - 2013 TopCoder Inc., All Rights Reserved.
 *
 * This JSP renders TopCoder web site's left navigation bar.
 *
 * Changes:
 * Add copilot pool link under Copilot Opportunites (TopCoder Copilot Pool Page Front End Assembly).
 * Add copilot posting link as active contests (Copilot Selection Contest Online Review and TC Site Integration Assembly)
 * Add bug hunt contest type to left side panel (Release Assembly - TopCoder BugHunt Competition Integration)
 * Updated "Review Opportunities" links to point to newly added ViewReviewAuctions controller 
 * (Review Application Integration assembly)
 * Add "CloudSpokes" node for CloudSpokes contests
 * (Release Assembly - TopCoder and CloudSpokes Platform Integration Phase 1)
 * - Add CloudSpokes contest
 *
 * (Release Assembly - TC Community Site and Online Review Update for F2F and Code contest types v1.0)
 * - Add First2Finish and Code contest types
--%>
<%@ page language="java"%>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ page import="com.topcoder.web.common.model.NavNode"%>
<%@ page import="com.topcoder.web.common.model.NavTree"%>
<%-- Since Version 1.1 (TCS Release 2.2.2) : Using constants to reference project types --%>
<%@ page import="com.topcoder.web.common.WebConstants"%>
<%@ taglib uri="nav.tld" prefix="nav" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%
   /* m_name indicates the name of an expandable menu below */


    NavTree nav = new NavTree();


        nav.addRoot(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_competitions')", "Challenges", "m_competitions"));
            //nav.search("m_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc", "Home", "competition_home"));
            nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_competitions_overview')", "Overview", "m_competitions_overview"));
                    //nav.search("m_competitions_overview").addChild(new NavNode("http://apps.topcoder.com/wiki/x/DIKMAg", "General Info", "m_overview_general_info"));
                    nav.search("m_competitions_overview").addChild(new NavNode("http://apps.topcoder.com/wiki/x/MQD9Ag", "Reliability", "m_overview_reliability"));
                    nav.search("m_competitions_overview").addChild(new NavNode("http://apps.topcoder.com/wiki/x/lYE_/", "Ratings", "m_overview_rating"));
                    nav.search("m_competitions_overview").addChild(new NavNode("http://apps.topcoder.com/wiki/x/EoK1B/", "Badges", "m_overview_badges"));
                    nav.search("m_competitions_overview").addChild(new NavNode("http://apps.topcoder.com/wiki/x/aoE_/", "How to Get Paid", "m_how_to_get_paid"));
                    nav.search("m_competitions_overview").addChild(new NavNode("http://apps.topcoder.com/wiki/x/2gRmAw", "Administrative Overview ", "m_administrative_overview"));

            nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_copilot_opportunities')", "Copilot Opportunities", "m_copilot_opportunities"));
                    nav.search("m_copilot_opportunities").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/Copilot+Overview", "Overview", "copilots_overview"));
                    nav.search("m_copilot_opportunities").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_copilot_support')", "Track Information", "m_copilot_support"));
                            nav.search("m_copilot_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/How+to+Compete+in+Copilot+Opportunities", "How to Compete", "copilot_how_to_compete"));
                            nav.search("m_copilot_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/How+to+Compete+in+Copilot+Opportunities", "Documentation", "copilot_documentation"));
                            nav.search("m_copilot_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/How+to+Compete+in+Copilot+Opportunities", "Tutorial", "copilot_tutorial"));
                    nav.search("m_copilot_opportunities").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ActiveContests&amp;pt=" + WebConstants.COPILOT_POSTING_PROJECT_TYPE, "Active Challenges", "copilots_compete"));
                     //nav.search("m_copilot_opportunities").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ContestStatus&amp;pt=" + WebConstants.COPILOT_POSTING_PROJECT_TYPE, "Challenge Status", "copilot_opportunity_status"));
                    nav.search("m_copilot_opportunities").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=CompList&amp;ph=140", "Past Challenges", "copilot_past"));
                     //nav.search("m_copilot_opportunities").addChild(new NavNode("http://" + ApplicationServer.SERVER_NAME + "/tc?module=ViewReviewAuctions&amp;pt=" + WebConstants.COPILOT_PROJECT_TYPE, "Review Opportunities", "copilot_review"));
                     //nav.search("m_copilot_opportunities").addChild(new NavNode("http://" + ApplicationServer.SERVER_NAME + "/tc?module=ReviewBoard&amp;pt=" + WebConstants.COPILOT_PROJECT_TYPE, "Meet the Review Board", "copilot_review_board"));
                    nav.search("m_copilot_opportunities").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewCopilotPool&size=20&view=0&sort=12", "Copilot Pool", "copilots_pool"));

            nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'competition_design')", "Design", "competition_design"));
                nav.search("competition_design").addChild(new NavNode("http://studio.topcoder.com", "Studio", "studio"));
                nav.search("competition_design").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_conceptualization_competitions')", "Conceptualization", "m_conceptualization_competitions"));
                     nav.search("m_conceptualization_competitions").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/TopCoder+Conceptualization+Contests", "Overview", "conceptualization_overview"));
                    nav.search("m_conceptualization_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_conceptualization_support')", "Track Information", "m_conceptualization_support"));
                            nav.search("m_conceptualization_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/Conceptualization+Competition+Tutorial", "Tutorial", "conceptualization_tutorial"));
                            nav.search("m_conceptualization_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/Conceptualization+Documentation", "Documentation", "conceptualization_documentation"));
                    nav.search("m_conceptualization_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ActiveContests&pt=23", "Active Challenges", "conceptualization_compete"));
                     nav.search("m_conceptualization_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ContestStatus&amp;pt=23", "Challenge Status", "conceptualization_contest_status"));
                    nav.search("m_conceptualization_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=CompList&amp;ph=134", "Past Challenges", "conceptualization_past"));
                     nav.search("m_conceptualization_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewReviewAuctions&amp;pt=" + WebConstants.CONCEPTUALIZATION_PROJECT_TYPE, "Review Opportunities", "conceptualization_review"));
                     nav.search("m_conceptualization_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ReviewBoard&amp;pt=" + WebConstants.CONCEPTUALIZATION_PROJECT_TYPE, "Meet the Review Board", "conceptualization_review_board"));
                  nav.search("competition_design").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_specification_competitions')", "Specification", "m_specification_competitions"));
                    nav.search("m_specification_competitions").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/TopCoder+Specification+Contests", "Overview", "specification_overview"));
                    nav.search("m_specification_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_specification_support')", "Track Information", "m_specification_support"));
                            nav.search("m_specification_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/How+to+Compete+in+Specification+Competitions", "How to Compete", "specification_how_to_compete"));
                    nav.search("m_specification_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ActiveContests&amp;pt=6", "Active Challenges", "specification_compete"));
                    nav.search("m_specification_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ContestStatus&amp;pt=6", "Challenge Status", "specification_contest_status"));
                    nav.search("m_specification_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=CompList&amp;ph=117", "Past Challenges", "specification_past"));
                    nav.search("m_specification_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewReviewAuctions&amp;pt=" + WebConstants.SPECIFICATION_PROJECT_TYPE, "Review Opportunities", "specification_review"));
                    nav.search("m_specification_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ReviewBoard&amp;pt=" + WebConstants.SPECIFICATION_PROJECT_TYPE, "Meet the Review Board", "specification_review_board"));
               nav.search("competition_design").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_architecture_competitions')", "Architecture", "m_architecture_competitions"));
                    nav.search("m_architecture_competitions").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/Architecture+Overview", "Overview", "architecture_overview"));
                    nav.search("m_architecture_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_architecture_support')", "Track Information", "m_architecture_support"));
                    nav.search("m_architecture_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/Module+Architecture+Tutorial", "Module Architecture Tutorial", "module_architecture_tutorial"));
                    nav.search("m_architecture_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ActiveContests&amp;pt=7", "Active Challenges", "architecture_compete"));
                    nav.search("m_architecture_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ContestStatus&amp;pt=7", "Challenge Status", "architecture_contest_status"));
                    nav.search("m_architecture_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=CompList&amp;ph=118", "Past Challenges", "architecture_past"));
                    nav.search("m_architecture_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewReviewAuctions&amp;pt=7", "Review Opportunities", "architecture_review"));
                    nav.search("m_architecture_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ReviewBoard&amp;pt=7", "Meet the Review Board", "architecture_review_board"));
               nav.search("competition_design").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_des_competitions')", "Component Design", "m_des_competitions"));
                    nav.search("m_des_competitions").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/Component+Design+Overview", "Overview", "des_overview"));
                    nav.search("m_des_competitions").addChild(new NavNode("javascript:void(0)",  "Javascript:toggleMenu(this.parentNode,'m_des_support')", "Track Information", "m_des_support"));
                            nav.search("m_des_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/How+to+Compete+in+Component+Design+Competitions", "How to Compete", "des_getting_started"));
                            nav.search("m_des_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/Component+Design+Documentation", "Documentation", "des_documentation"));
                            nav.search("m_des_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ColorChange&amp;ph=112", "Recent Color Changes", "des_color_changes"));
                            nav.search("m_des_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/Component+Design+Data+Feeds", "Data Feeds", "des_data_feeds"));
                    nav.search("m_des_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewActiveContests&amp;ph=112", "Active Challenges", "des_compete"));
                    nav.search("m_des_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ContestStatus&amp;pt=1", "Challenge Status", "des_contest_status"));
                    nav.search("m_des_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=CompList&amp;ph=112", "Past Challenges", "des_past"));
                    nav.search("m_des_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewReviewAuctions&amp;pt=1", "Review Opportunities", "des_review"));
                    nav.search("m_des_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ReviewBoard&amp;pt=1", "Meet the Review Board", "des_review_board"));



            nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'competition_dev')", "Development", "competition_dev"));
                nav.search("competition_dev").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_dev_competitions')", "Component Development", "m_dev_competitions"));
                    nav.search("m_dev_competitions").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/How+to+Compete+in+Component+Development+Competitions", "Overview", "dev_overview"));
                    nav.search("m_dev_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_dev_support')", "Track Information", "m_dev_support"));
                            nav.search("m_dev_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/How+to+Compete+in+Component+Development+Competitions", "How to Compete", "dev_getting_started"));
                            nav.search("m_dev_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/Component+Development+Documentation", "Documentation", "dev_documentation"));
                            nav.search("m_dev_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ColorChange&amp;ph=113", "Recent Color Changes", "dev_color_changes"));
                            nav.search("m_dev_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/Component+Development+Data+Feeds", "Data Feeds", "dev_data_feeds"));
                    nav.search("m_dev_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewActiveContests&amp;ph=113", "Active Challenges", "dev_compete"));
                    nav.search("m_dev_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ContestStatus&amp;pt=2", "Challenge Status", "dev_contest_status"));
                    nav.search("m_dev_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=CompList&amp;ph=113", "Past Challenges", "dev_past"));
                    nav.search("m_dev_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewReviewAuctions&amp;pt=2", "Review Opportunities", "dev_review"));
                    nav.search("m_dev_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ReviewBoard&amp;pt=2", "Meet the Review Board", "dev_review_board"));
                nav.search("competition_dev").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_assembly_competitions')", "Assembly", "m_assembly_competitions"));
                    nav.search("m_assembly_competitions").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/Assembly", "Overview", "assembly_overview"));
                    nav.search("m_assembly_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_assembly_support')", "Track Information", "m_assembly_support"));
                            nav.search("m_assembly_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/Assembly+Competition+Tutorials", "Tutorials", "assembly_tutorials"));
                            nav.search("m_assembly_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/Assembly+Competition+Documentation", "Documentation", "assembly_documentation"));
                    nav.search("m_assembly_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ActiveContests&amp;pt=" + WebConstants.ASSEMBLY_PROJECT_TYPE, "Active Challenges", "assembly_compete"));
                    nav.search("m_assembly_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ContestStatus&amp;pt=14", "Challenge Status", "assembly_contest_status"));
                    nav.search("m_assembly_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=CompList&amp;ph=125", "Past Challenges", "assembly_past"));
                    nav.search("m_assembly_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewReviewAuctions&amp;pt=14", "Review Opportunities", "assembly_review"));
                    nav.search("m_assembly_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ReviewBoard&amp;pt=14", "Meet the Review Board", "assembly_review_board"));

                nav.search("competition_dev").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_first2finish_competitions')", "First2Finish", "m_first2finish_competitions"));
                    nav.search("m_first2finish_competitions").addChild(new NavNode("http://www.cloudspokes.com/how-it-works-members", "Overview", "first2finish_overview"));
                    nav.search("m_first2finish_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ActiveContests&amp;pt=" + WebConstants.FIRST2FINISH_PROJECT_TYPE, "Active Challenges", "first2finish_compete"));
                    nav.search("m_first2finish_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ContestStatus&amp;pt="  + WebConstants.FIRST2FINISH_PROJECT_TYPE, "Challenge Status", "first2finish_contest_status"));
                    nav.search("m_first2finish_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=CompList&amp;pt="  + WebConstants.FIRST2FINISH_PROJECT_TYPE, "Past Challenges", "first2finish_past"));
                    nav.search("m_first2finish_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewReviewAuctions&amp;pt="  + WebConstants.FIRST2FINISH_PROJECT_TYPE, "Review Opportunities", "first2finish_review"));
                    nav.search("m_first2finish_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ReviewBoard&amp;pt="  + WebConstants.FIRST2FINISH_PROJECT_TYPE, "Meet the Review Board", "first2finish_review_board"));
               
                nav.search("competition_dev").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_code_competitions')", "Code", "m_code_competitions"));
                    nav.search("m_code_competitions").addChild(new NavNode("http://www.cloudspokes.com/how-it-works-members", "Overview", "code_overview"));
                    nav.search("m_code_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ActiveContests&amp;pt=" + WebConstants.CODE_PROJECT_TYPE, "Active Challenges", "code_compete"));
                    nav.search("m_code_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ContestStatus&amp;pt="  + WebConstants.CODE_PROJECT_TYPE, "Challenge Status", "code_contest_status"));
                    nav.search("m_code_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=CompList&amp;pt="  + WebConstants.CODE_PROJECT_TYPE, "Past Challenges", "code_past"));
                    nav.search("m_code_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewReviewAuctions&amp;pt="  + WebConstants.CODE_PROJECT_TYPE, "Review Opportunities", "code_review"));
                    nav.search("m_code_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ReviewBoard&amp;pt="  + WebConstants.CODE_PROJECT_TYPE, "Meet the Review Board", "code_review_board"));


                nav.search("competition_dev").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_test_suites_competitions')", "Test Suites", "m_test_suites_competitions"));
                    nav.search("m_test_suites_competitions").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/Test+Scenarios+and+Scripts", "Overview", "test_suites_overview"));
                    nav.search("m_test_suites_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_test_suites_support')", "Track Information", "m_test_suites_support"));
                            nav.search("m_test_suites_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/How+to+Compete+in+Testing+Competitions", "How to Compete", "test_suites_how_to_compete"));
                            nav.search("m_test_suites_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/Testing+Competition+Tutorial", "Tutorial", "test_suites_tutorial"));
                            nav.search("m_test_suites_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/Testing+Competition+Documentation", "Documentation", "test_suites_documentation"));
                    nav.search("m_test_suites_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ActiveContests&amp;pt=" + WebConstants.TEST_SUITES_PROJECT_TYPE, "Active Challenges", "test_suites_compete"));
                    nav.search("m_test_suites_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ContestStatus&amp;pt=" + WebConstants.TEST_SUITES_PROJECT_TYPE, "Challenge Status", "test_suites_status"));
                    nav.search("m_test_suites_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=CompList&amp;pt=" + WebConstants.TEST_SUITES_PROJECT_TYPE, "Past Challenges", "test_suites_past"));
                    nav.search("m_test_suites_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewReviewAuctions&amp;pt=" + WebConstants.TEST_SUITES_PROJECT_TYPE, "Review Opportunities", "test_suites_review"));
                    nav.search("m_test_suites_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ReviewBoard&amp;pt=" + WebConstants.TEST_SUITES_PROJECT_TYPE, "Meet the Review Board", "test_suites_review_board"));
               nav.search("competition_dev").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_reporting_competitions')", "Reporting", "m_reporting_competitions"));
                    nav.search("m_reporting_competitions").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/Reporting", "Overview", "reporting_overview"));
                    nav.search("m_reporting_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_reporting_support')", "Track Information", "m_reporting_support"));
                            nav.search("m_reporting_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/How+to+Compete+in+Reporting+Competitions", "How to Compete", "reporting_how_to_compete"));
                            nav.search("m_reporting_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/Reporting+Competition+Tutorial", "Tutorial", "assembly_tutorial"));
                            nav.search("m_reporting_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/Reporting+Competition+Documentation", "Documentation", "reporting_documentation"));
                    nav.search("m_reporting_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ActiveContests&amp;pt=" + WebConstants.REPORTING_PROJECT_TYPE, "Active Challenges", "reporting_compete"));
                    nav.search("m_reporting_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ContestStatus&amp;pt="+  WebConstants.REPORTING_PROJECT_TYPE, "Challenge Status", "reporting_contest_status"));
                    nav.search("m_reporting_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=CompList&amp;pt=" + WebConstants.REPORTING_PROJECT_TYPE, "Past Challenges", "reporting_past"));
                    nav.search("m_reporting_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewReviewAuctions&amp;pt=" +  WebConstants.REPORTING_PROJECT_TYPE, "Review Opportunities", "reporting_review"));
                    nav.search("m_reporting_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ReviewBoard&amp;pt=" + WebConstants.REPORTING_PROJECT_TYPE, "Meet the Review Board", "reporting_review_board"));

            nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'competition_ui_dev')", "UI Development", "competition_ui_dev"));
                  nav.search("competition_ui_dev").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_ui_prototype_competitions')", "UI Prototype", "m_ui_prototype_competitions"));
                    nav.search("m_ui_prototype_competitions").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/UI+Prototype+Competitions", "Overview", "ui_prototype_overview"));
                    nav.search("m_ui_prototype_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_ui_prototype_support')", "Track Information", "m_ui_prototype_support"));
                            nav.search("m_ui_prototype_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/UI+Prototype+Competitions", "UI Prototype Tutorial", "ui_prototype_tutorial"));
                    nav.search("m_ui_prototype_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ActiveContests&amp;pt=" + WebConstants.UI_PROTOTYPE_PROJECT_TYPE, "Active Challenges", "ui_prototype_compete"));
                    nav.search("m_ui_prototype_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ContestStatus&amp;pt=" + WebConstants.UI_PROTOTYPE_PROJECT_TYPE, "Challenge Status", "ui_prototype_status"));
                    nav.search("m_ui_prototype_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=CompList&amp;pt=" + WebConstants.UI_PROTOTYPE_PROJECT_TYPE, "Past Challenges", "ui_prototype_past"));
                    nav.search("m_ui_prototype_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewReviewAuctions&amp;pt=" + WebConstants.UI_PROTOTYPE_PROJECT_TYPE, "Review Opportunities", "ui_prototype_review"));
                    nav.search("m_ui_prototype_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ReviewBoard&amp;pt=" + WebConstants.UI_PROTOTYPE_PROJECT_TYPE, "Meet the Review Board", "ui_prototype_review_board"));

                nav.search("competition_ui_dev").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_ria_build_competitions')", "RIA Build", "m_ria_build_competitions"));
                    nav.search("m_ria_build_competitions").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/RIA+Build+Competitions", "Overview", "ria_build_overview"));
                    nav.search("m_ria_build_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_ria_build_support')", "Track Information", "m_ria_build_support"));
                            nav.search("m_ria_build_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/RIA+Build+Competitions", "RIA Build Tutorial", "ria_build_tutorial"));
                    nav.search("m_ria_build_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ActiveContests&amp;pt=" + WebConstants.RIA_BUILD_PROJECT_TYPE, "Active Challenges", "ria_build_compete"));
                    nav.search("m_ria_build_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ContestStatus&amp;pt=" + WebConstants.RIA_BUILD_PROJECT_TYPE, "Challenge Status", "ria_build_status"));
                    nav.search("m_ria_build_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=CompList&amp;pt=" + WebConstants.RIA_BUILD_PROJECT_TYPE, "Past Challenges", "ria_build_past"));
                    nav.search("m_ria_build_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewReviewAuctions&amp;pt=" + WebConstants.RIA_BUILD_PROJECT_TYPE, "Review Opportunities", "ria_build_review"));
                    nav.search("m_ria_build_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ReviewBoard&amp;pt=" + WebConstants.RIA_BUILD_PROJECT_TYPE, "Meet the Review Board", "ria_build_review_board"));

                nav.search("competition_ui_dev").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_content_creation_competitions')", "Content Creation", "m_content_creation_competitions"));
                    nav.search("m_content_creation_competitions").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/Content+Contests+Overview", "Overview", "content_creation_overview"));
                    nav.search("m_content_creation_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_content_creation_support')", "Track Information", "m_content_creation_support"));
                                            nav.search("m_content_creation_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/How+to+Compete+in+Content+Creation+Competitions", "How to Compete", "content_creation_how_to_compete"));
                                            //nav.search("m_content_creation_support").addChild(new NavNode("/wiki/display/tc/Content+Creation+Documentation", "Documentation", "content_creation_documentation"));
                                            //nav.search("m_content_creation_support").addChild(new NavNode("/wiki/display/tc/Content+Creation+Submission+Instructions", "Tutorial", "content_creation_tutorial"));
                    nav.search("m_content_creation_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ActiveContests&pt=" + 35, "Active Challenges", "content_creation_compete"));
                    nav.search("m_content_creation_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ContestStatus&amp;pt=" + 35, "Challenge Status", "content_creation_status"));
                    nav.search("m_content_creation_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=CompList&amp;pt=" + 35, "Past Challenges", "content_creation_past"));
                    nav.search("m_content_creation_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewReviewAuctions&amp;pt=" + 35, "Review Opportunities", "content_creation_review"));
                    nav.search("m_content_creation_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ReviewBoard&amp;pt=" + 35, "Meet the Review Board", "content_creation_review_board"));




            nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'competition_qa')", "QA and Maintenance", "competition_qa"));
                nav.search("competition_qa").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_test_scenarios_competitions')", "Test Scenarios", "m_test_scenarios_competitions"));
                    nav.search("m_test_scenarios_competitions").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/Test+Scenarios+and+Scripts", "Overview", "test_scenarios_overview"));
                    nav.search("m_test_scenarios_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_test_scenarios_support')", "Track Information", "m_test_scenarios_support"));
                            nav.search("m_test_scenarios_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/How+to+Compete+in+Testing+Competitions", "How to Compete", "test_scenarios_how_to_compete"));
                            nav.search("m_test_scenarios_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/Testing+Competition+Tutorial", "Tutorial", "test_scenarios_tutorial"));
                            nav.search("m_test_scenarios_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/Testing+Competition+Documentation", "Documentation", "test_scenarios_documentation"));
                    nav.search("m_test_scenarios_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ActiveContests&amp;pt=" + WebConstants.TEST_SCENARIOS_PROJECT_TYPE, "Active Challenges", "test_scenarios_compete"));
                    nav.search("m_test_scenarios_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ContestStatus&amp;pt=" + WebConstants.TEST_SCENARIOS_PROJECT_TYPE, "Challenge Status", "test_scenarios_status"));
                    nav.search("m_test_scenarios_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=CompList&amp;pt="+ WebConstants.TEST_SCENARIOS_PROJECT_TYPE, "Past Challenges", "test_scenarios_past"));
                    nav.search("m_test_scenarios_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewReviewAuctions&amp;pt=" + WebConstants.TEST_SCENARIOS_PROJECT_TYPE, "Review Opportunities", "test_scenarios_review"));
                    nav.search("m_test_scenarios_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ReviewBoard&amp;pt=" + WebConstants.TEST_SCENARIOS_PROJECT_TYPE, "Meet the Review Board", "test_scenarios_review_board"));
                nav.search("competition_qa").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_bugraces_competitions')", "Race", "m_bugraces_competitions"));
                    nav.search("m_bugraces_competitions").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/Race+Competition+Overview", "Overview", "bugraces_overview"));
                    nav.search("m_bugraces_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_bugraces_support')", "Track Information", "m_bugraces_support"));
                            nav.search("m_bugraces_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/How+to+Compete+in+Bug+Race+Competitions", "How to Compete", "bugraces_how_to_compete"));
                    nav.search("m_bugraces_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewActiveBugRaces", "Active Challenges", "bugraces_compete"));
                    nav.search("m_bugraces_competitions").addChild(new NavNode("http://apps.topcoder.com/wiki/x/FQG2AQ", "Review Opportunities", "bugraces_review"));
                nav.search("competition_qa").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_bughunt_competitions')", "Bug Hunt", "m_bughunt_competitions"));
                    nav.search("m_bughunt_competitions").addChild(new NavNode("http://apps.topcoder.com/wiki/x/W5ogAg", "Overview", "bughunt_overview"));
                    nav.search("m_bughunt_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_bughunt_support')", "Track Information", "m_bughunt_support"));
                            nav.search("m_bughunt_support").addChild(new NavNode("http://apps.topcoder.com/wiki/x/cpogAg", "How to Compete", "bug_hunt_how_to_compete"));
                            //nav.search("m_bughunt_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/Bug+Hunt+Competition+Tutorial", "Tutorial", "bug_hunt_tutorial"));
                            //nav.search("m_bughunt_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/Bug+Hunt+Competition+Documentation", "Documentation", "bug_hunt_documentation"));
                    nav.search("m_bughunt_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ActiveContests&amp;pt=" + WebConstants.BUG_HUNT_PROJECT_TYPE, "Active Challenges", "bug_hunt_compete"));
                    nav.search("m_bughunt_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ContestStatus&amp;pt="+  WebConstants.BUG_HUNT_PROJECT_TYPE, "Challenge Status", "bug_hunt_contest_status"));
                    nav.search("m_bughunt_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=CompList&amp;pt=" + WebConstants.BUG_HUNT_PROJECT_TYPE, "Past Challenges", "bug_hunt_past"));
                    nav.search("m_bughunt_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ViewReviewAuctions&amp;pt=" +  WebConstants.BUG_HUNT_PROJECT_TYPE, "Review Opportunities", "bug_hunt_review"));
                    nav.search("m_bughunt_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ReviewBoard&amp;pt=" + WebConstants.BUG_HUNT_PROJECT_TYPE, "Meet the Review Board", "bug_hunt_review_board"));


    nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'competition_algo')", "Algorithm", "competition_algo"));
                nav.search("competition_algo").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_algo_competitions')", "Single Round Matches (SRM)", "m_algo_competitions"));
                    nav.search("m_algo_competitions").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/Algorithm+Overview", "Overview", "algo_overview"));
                     nav.search("m_algo_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_algo_support')", "Track Information", "m_algo_support"));
                            nav.search("m_algo_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/How+to+Compete+in+SRM+Algorithm+Competitions", "How to Compete", "algo_how_to_compete"));
                            nav.search("m_algo_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/SRM+Algorithm+Competition+FAQs", "FAQs", "algo_faqs"));
                            nav.search("m_algo_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/Algorithm+Competition+Rating+System", "Rating System", "algo_rating_system"));
                            nav.search("m_algo_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/Write+Problems+for+TopCoder", "Write Problems", "algo_write"));
                    nav.search("m_algo_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_algo_stats')", "Statistics", "m_algo_stats"));
                            nav.search("m_algo_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=MatchList", "Match Archive", "algo_match_archive"));
                            nav.search("m_algo_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/stat?c=round_overview", "Match Overviews", "algo_match_overviews"));
                            nav.search("m_algo_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=SrmDivisionWins", "Match Winners", "algo_match_winners"));
                            nav.search("m_algo_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/stat?c=last_match", "Match Results", "algo_match_results"));
                            nav.search("m_algo_stats").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/Algorithm+Problem+Set+Analysis", "Match Editorials", "algo_match_editorials"));
                            nav.search("m_algo_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ProblemArchive", "Problem Archive", "algo_problem_archive"));
                            nav.search("m_algo_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ColorChange&amp;ratid=1", "Recent Color Changes", "algo_color_changes"));
                            nav.search("m_algo_stats").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/Algorithm+Data+Feeds", "Data Feeds", "algo_data_feeds"));
                     nav.search("m_algo_competitions").addChild(new NavNode("javascript:arena();", "Launch Arena", "algo_compete"));
                nav.search("competition_algo").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_long_contests')", "Marathon Match", "m_long_contests"));
                    nav.search("m_long_contests").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/Marathon+Match+Overview", "Overview", "long_overview"));
                    nav.search("m_long_contests").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_long_support')", "Track Information", "m_long_support"));
                            nav.search("m_long_support").addChild(new NavNode("http://apps.topcoder.com/wiki/display/tc/How+to+Compete+in+Marathon+Match+Events", "How to Compete", "long_how_to_compete"));
                            nav.search("m_long_support").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/longcontest/?module=Static&amp;d1=support&amp;d2=ratings", "Rating System", "long_rating_system"));
                    nav.search("m_long_contests").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_long_stats')", "Statistics", "m_long_stats"));
                            nav.search("m_long_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/longcontest/stats/?module=MatchList", "Match Archive", "long_match_archive"));
                            nav.search("m_long_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/longcontest/stats/?module=ViewOverview", "Match Overview", "long_match_overview"));
                            nav.search("m_long_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/longcontest/stats/?module=MatchWinners", "Match Winners", "long_match_winners"));
                            nav.search("m_long_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/longcontest/?module=Static&amp;d1=match_editorials&amp;d2=archive", "Match Editorials", "long_editorials"));
                            nav.search("m_long_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/longcontest/?module=Static&amp;d1=support&amp;d2=dataFeed", "Data Feeds", "long_data_feeds"));
                    nav.search("m_long_contests").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/longcontest/?module=ViewActiveContests", "Active Challenges", "long_compete"));
                    nav.search("m_long_contests").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/longcontest/?module=ViewPractice", "Practice", "long_practice"));
                    nav.search("m_long_contests").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/longcontest/?module=ViewQueue", "Queue Status", "long_queue"));

            nav.search("m_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_hs_competitions')", "High School", "m_hs_competitions"));
                    nav.search("m_hs_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=hs&amp;d2=home", "Overview", "hs_overview"));
                    nav.search("m_hs_competitions").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_hs_stats')", "Statistics", "m_hs_stats"));
                            nav.search("m_hs_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=HSRoundOverview", "Match Overview", "hs_match_overview"));
                            nav.search("m_hs_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=HSRoundStatsTeam", "Match Results (Team)", "hs_team_match_results"));
                            nav.search("m_hs_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=HSRoundStatsInd", "Match Results (Indiv.)", "hs_ind_match_results"));
                            nav.search("m_hs_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=hs&amp;d2=match_editorials&amp;d3=archive", "Match Editorials", "hs_match_editorials"));
                            nav.search("m_hs_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=ColorChange&amp;ratid=2", "Recent Color Changes", "hs_algo_color_changes"));
                            nav.search("m_hs_stats").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=hs&amp;d2=support&amp;d3=dataFeed", "Data Feeds", "hs_data_feeds"));
                    nav.search("m_hs_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&d1=hs&d2=spotlightSessions", "Spotlight Sessions", "hs_spotlight"));
                    nav.search("m_hs_competitions").addChild(new NavNode("javascript:arena();", "Launch Arena", "hs_compete"));

//            nav.search("m_competitions").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/dr", "The Digital Run", "digital_run"));
            nav.search("m_competitions").addChild(new NavNode("http://"+ApplicationServer.SOFTWARE_SERVER_NAME+"/review", "Submit &amp; Review", "online_review"));

       nav.addRoot(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_topcoder_networks')", "TopCoder Networks", "m_topcoder_networks"));
               nav.search("m_topcoder_networks").addChild(new NavNode("http://community.topcoder.com/alcatel/", "Alcatel Lucent", "alu"));
               nav.search("m_topcoder_networks").addChild(new NavNode("http://community.topcoder.com/amdapp/", "AMD OpenCL", "amd_opencl"));
               nav.search("m_topcoder_networks").addChild(new NavNode("http://community.topcoder.com/darpacs/", "DARPA CS-STEM", "darpacs"));
               nav.search("m_topcoder_networks").addChild(new NavNode("http://community.topcoder.com/lifetech-network/", "Life Technologies", "lifetech"));
               nav.search("m_topcoder_networks").addChild(new NavNode("http://community.topcoder.com/ntl/", "NASA Tournament Lab", "ntl"));
               nav.search("m_topcoder_networks").addChild(new NavNode("http://community.topcoder.com/x/", "PayPalX", "ppx"));


        nav.addRoot(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_events')", "Events", "m_events"));
                nav.search("m_events").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=calendar&amp;d2=thisMonth", "Event Calendar", "competition_calendar"));
                nav.search("m_events").addChild(new NavNode("javascript:void(0)",  "Javascript:toggleMenu(this.parentNode,'m_tournaments')", "Tournaments", "m_tournaments"));
                        nav.search("m_tournaments").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=tournaments&amp;d2=home", "TopCoder", "topcoder_tournaments"));
                        nav.search("m_tournaments").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/pl/", "Powered by TopCoder", "pbtc_tournaments"));
                        nav.search("m_tournaments").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=CRPFStatic&amp;d1=crpf&amp;d2=crpf_overview", "Charity", "charity_tournaments"));


        nav.addRoot(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_stats')", "Statistics", "m_stats"));
                nav.search("m_stats").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_competitor_stats')",  "The Tops", "m_competitor_stats"));
                    nav.search("m_competitor_stats").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_top_rated_competitors')",  "Top Ranked", "m_top_rated_competitors"));
                            nav.search("m_top_rated_competitors").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=AlgoRank", "Algorithm", "top_rated_algo"));
                            nav.search("m_top_rated_competitors").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=HSRank", "High School", "top_rated_hs"));
                            nav.search("m_top_rated_competitors").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/longcontest/stats/?module=CoderRank", "Marathon Match", "top_rated_long"));
                            nav.search("m_top_rated_competitors").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/stat?c=top_conceptors", "Conceptualization", "top_rated_conceptors"));
                            nav.search("m_top_rated_competitors").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/stat?c=top_specificators", "Specification", "top_rated_specificators"));
                            nav.search("m_top_rated_competitors").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/stat?c=top_architects", "Architecture", "top_rated_architects"));
                            nav.search("m_top_rated_competitors").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/stat?c=top_designers", "Design", "top_rated_des"));
                            nav.search("m_top_rated_competitors").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/stat?c=top_developers", "Development", "top_rated_dev"));
                            nav.search("m_top_rated_competitors").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/stat?c=top_assemblers", "Assembly", "top_rated_assemblers"));
                            nav.search("m_top_rated_competitors").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/stat?c=top_testers", "Test Suites", "top_rated_testers"));
                    nav.search("m_competitor_stats").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_recordbook')",  "Record Book", "m_recordbook"));
                            nav.search("m_recordbook").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=statistics&amp;d2=recordbook_home", "Algorithm", "algo_recordbook"));
                            nav.search("m_recordbook").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=compstats&amp;d2=comp_recordbook_home", "Component", "comp_recordbook"));
                            nav.search("m_recordbook").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/longcontest/?module=Static&amp;d1=stats&amp;d2=recordbook_home", "Marathon Match", "long_recordbook"));
                    nav.search("m_competitor_stats").addChild(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_com')",  "Coder of the Month", "m_com"));
                            nav.search("m_com").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=COMHistory&amp;achtid=5", "Algorithm", "algo_com"));
                            nav.search("m_com").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=COMHistory&amp;achtid=6", "Design", "des_com"));
                            nav.search("m_com").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=COMHistory&amp;achtid=7", "Development", "dev_com"));


   nav.addRoot(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_edu_content')", "Tutorials", "m_edu_content"));
       nav.search("m_edu_content").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=education&amp;d2=overview", "Overview", "edu_overview"));
       nav.search("m_edu_content").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=tutorials&amp;d2=alg_index", "Algorithm Tutorials", "algo_tutorials"));
       nav.search("m_edu_content").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=tutorials&amp;d2=software_index", "Software Tutorials", "software_tutorials"));
       nav.search("m_edu_content").addChild(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=Static&amp;d1=tutorials&amp;d2=mm_index", "Marathon Tutorials", "mm_tutorials"));
       nav.search("m_edu_content").addChild(new NavNode("http://apps.topcoder.com/wiki/dashboard.action", "Wiki", "wiki"));



//   nav.addRoot(new NavNode("/wiki/x/L4TD", "UML Tool", "uml_tool"));

   nav.addRoot(new NavNode("http://"+ApplicationServer.FORUMS_SERVER_NAME+"/", "Forums", "forums"));


   nav.addRoot(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?&amp;module=SurveyList", "Surveys", "competitor_surveys"));

   nav.addRoot(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/tc?module=MyHome", "My TopCoder", "my_topcoder"));

   nav.addRoot(new NavNode("http://www.topcoder.com/help", "Help Center", "help_center"));

   nav.addRoot(new NavNode("javascript:void(0)", "Javascript:toggleMenu(this.parentNode,'m_about_tc')", "About TopCoder", "m_about_tc"));
      nav.search("m_about_tc").addChild(new NavNode("http://www.topcoder.com/aboutus/", "Overview", "tc_overview"));
      nav.search("m_about_tc").addChild(new NavNode("http://www.topcoder.com/aboutus/", "Why Join TopCoder?", "join_tc"));
      nav.search("m_about_tc").addChild(new NavNode("http://www.topcoder.com/aboutus/careers/", "Working at TopCoder", "working_tc"));
      nav.search("m_about_tc").addChild(new NavNode("http://www.topcoder.com/aboutus/management/", "Leadership", "management_team"));
      nav.search("m_about_tc").addChild(new NavNode("http://www.topcoder.com/aboutus/news/", "Press Room", "press_room"));


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
        <%-- UML Tool --%>
        <a href="<tc-webtag:linkTracking link='http://apps.topcoder.com/wiki/x/L4TD' refer='leftnav' />"><img src="/i/leftnav/umlTool.png" alt="UML Tool" /></a>

        <%-- TopCoder Distance
        <a href="<tc-webtag:linkTracking link='/tc?module=Static&d1=tournaments&d2=tco08&d3=distance' refer='leftnav' />"><img src="/i/leftnav/tcDistance.png" alt="TopCoder Distance" /></a>
        --%>
        <%-- TopCoder is Hiring
        <a href="<tc-webtag:linkTracking link='/tc?module=Static&d1=about&d2=jobs' refer='leftnav' />"><img src="/i/leftnav/banner_hiring_tc.png" alt="TopCoder is Hiring" /></a>
        --%>
        <%-- TopCoder Direct
        <a href="<tc-webtag:linkTracking link='http://software.topcoder.com/' refer='leftnav' />"><img src="/i/leftnav/tc_direct.png" alt="TopCoder Direct" /></a>
        --%>
        <%-- TC Channel
        <a href="<tc-webtag:linkTracking link='/tc?module=Static&d1=media&d2=tcchannel' refer='leftnav' />"><img src="/i/tcchannel/leftnavLogo.png" alt="TC Channel" /></a>
        --%>
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
