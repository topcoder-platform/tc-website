package com.topcoder.web.tc.controller.legacy;


import com.topcoder.common.web.constant.TCServlet;
import com.topcoder.common.web.data.Navigation;
import com.topcoder.common.web.util.Conversion;
import com.topcoder.common.web.util.Data;
import com.topcoder.common.web.xml.HTMLRenderer;
import com.topcoder.dde.user.UserManagerRemote;
import com.topcoder.dde.user.UserManagerRemoteHome;
import com.topcoder.dde.catalog.*;
import com.topcoder.security.RolePrincipal;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.ValueTag;
import com.topcoder.shared.docGen.xml.XMLDocument;
import com.topcoder.shared.security.PathResource;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.util.*;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.development.Base;
import com.topcoder.web.tc.model.SoftwareComponent;
import com.topcoder.web.ejb.ComponentRegistrationServices.ComponentRegistrationServices;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;

public final class TaskDevelopment {

    private static final String XSL_DIR = TCServlet.XSL_ROOT + "development/";
    private static Logger log = Logger.getLogger(TaskDevelopment.class);

    public static String translateForumType(int forumtype) {
        switch (forumtype) {
            case com.topcoder.dde.catalog.Forum.SPECIFICATION:
                return "specification";
            case com.topcoder.dde.catalog.Forum.COLLABORATION:
            default:
                return "collaboration";
        }
    }


    static String formatName(String formatName) {
        while (formatName.indexOf(" ") != -1) {
            formatName = formatName.substring(0, formatName.indexOf(" ")) + "%20" +
                    formatName.substring(formatName.indexOf(" ") + 1);
        }
        return formatName;
    }

    static String process(HttpServletRequest request, HttpServletResponse response,
                          HTMLRenderer HTMLmaker, Navigation nav, XMLDocument document)
            throws Exception {
        String result = null;
        try {
            boolean requiresLogin = false;
            String command = Conversion.checkNull(request.getParameter("c"));
            log.debug("Initial command is: " + command);
            RecordTag devTag = new RecordTag("DEVELOPMENT");
            String date = Conversion.checkNull(request.getParameter("date"));

            String xsldocURLString = null;
            String project = Conversion.checkNull(request.getParameter("Project"));


            devTag.addTag(new ValueTag("date", date));
            devTag.addTag(new ValueTag("tccc", request.getParameter("tccc")));
            devTag.addTag(new ValueTag("tco", request.getParameter("tco")));
            devTag.addTag(new ValueTag("posting_date", request.getParameter("posting_date")));
            devTag.addTag(new ValueTag("initial_submission", request.getParameter("initial_submission")));
            devTag.addTag(new ValueTag("final_submission", request.getParameter("final_submission")));
            devTag.addTag(new ValueTag("winner_announced", request.getParameter("winner_announced")));
            devTag.addTag(new ValueTag("estimated_dev", request.getParameter("estimated_dev")));
            devTag.addTag(new ValueTag("compvers", request.getParameter("compvers")));

            log.debug("PROJECT IS: " + request.getParameter("projectId"));


            if (command.equals("tcs_inquire") || command.equals("tcs_app_inquire")) {
                if (nav.isLoggedIn()) {
                    ResultSetContainer rsc = null;

                    int phase = Integer.parseInt(request.getParameter("phase"));
                    int version = Integer.parseInt(request.getParameter("version"));
                    devTag.addTag(new ValueTag("phase", phase));
                    devTag.addTag(new ValueTag("version", version));
                    long projectId = Long.parseLong(request.getParameter("projectId"));
                    long componentId = 0;
                    boolean appProject = false;
                    if (Conversion.checkNull(request.getParameter("comp")).equals("")) {
                        appProject = true;
                    } else {
                        componentId = Long.parseLong(request.getParameter("comp"));
                        devTag.addTag(new ValueTag("comp", componentId));
                    }
                    devTag.addTag(new ValueTag("projectId", projectId));

                    if (command.equals("tcs_inquire")) {
                        InitialContext ctx = TCContext.getInitial();
                        ComponentRegistrationServices cregBean = (ComponentRegistrationServices) BaseProcessor.createEJB(ctx, ComponentRegistrationServices.class);
                        rsc = cregBean.getActiveQuestions();
                        devTag.addTag(rsc.getTag("Questions", "Question"));
                        devTag.addTag(new ValueTag("numSurveyQs", rsc.getRowCount()));
                        rsc = cregBean.getActiveAnswers();
                        devTag.addTag(rsc.getTag("Answers", "Answer"));
                    }

                    Request dataRequest = null;
                    Map resultMap = null;
                    log.debug("getting dai");
                    dataRequest = new Request();
                    dataRequest.setContentHandle("open_projects");

                    DataAccessInt dai = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
                    log.debug("got dai");

                    resultMap = dai.getData(dataRequest);
                    log.debug("got map");
                    rsc = (ResultSetContainer) resultMap.get("Retrieve open projects");

                    log.debug("got rsc");
                    if (rsc == null)
                        log.debug("rsc is null");
                    devTag.addTag(rsc.getTag("projects", "project"));
                    String to = Conversion.checkNull(request.getParameter("To"));
                    devTag.addTag(new ValueTag("ProjectName", project));
                    devTag.addTag(new ValueTag("Project", project));
                    devTag.addTag(new ValueTag("To", to));

                    devTag.addTag(new ValueTag("projectId", request.getParameter("projectId")));
                    xsldocURLString = XSL_DIR + command + ".xsl";
                } else {
                    requiresLogin = true;
                }
            } else if (command.equals("tcs_team_app_inquire")) {
                if (nav.isLoggedIn()) {
                    String to = Conversion.checkNull(request.getParameter("To"));
                    devTag.addTag(new ValueTag("ProjectName", project));
                    devTag.addTag(new ValueTag("Project", project));
                    devTag.addTag(new ValueTag("To", to));

                    devTag.addTag(new ValueTag("projectId", request.getParameter("projectId")));
                    xsldocURLString = XSL_DIR + command + ".xsl";
                } else {
                    requiresLogin = true;
                }

            } else if (command.equals("multiplier_status")) {
                Request dataRequest = null;
                ResultSetContainer rsc = null;
                Map resultMap = null;
                log.debug("getting dai");
                dataRequest = new Request();
                dataRequest.setContentHandle("open_projects");

                DataAccessInt dai = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
                log.debug("got dai");

                resultMap = dai.getData(dataRequest);
                log.debug("got map");
                rsc = (ResultSetContainer) resultMap.get("Retrieve open projects");

                ResultSetContainer rscStatus = null;
                resultMap = null;
                dataRequest = new Request();
                dataRequest.setContentHandle("Multiplier_Status");
                dataRequest.setProperty("pj", request.getParameter("pj"));

                dai = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);

                resultMap = dai.getData(dataRequest);
                log.debug("got map");
                rscStatus = (ResultSetContainer) resultMap.get("submission_status");


                devTag.addTag(rsc.getTag("projects", "project"));
                devTag.addTag(rscStatus.getTag("multiplier", "status"));
                xsldocURLString = XSL_DIR + command + ".xsl";


            } else if (command.equals("comp_archive")) {
                Request dataRequest = new Request();
                dataRequest.setContentHandle("project_status");

                DataAccessInt dai = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);

                ResultSetContainer rscStatus = (ResultSetContainer) dai.getData(dataRequest).get("project_status");
                devTag.addTag(rscStatus.getTag("reviews", "status"));

                xsldocURLString = XSL_DIR + command + ".xsl";

            } else if (command.equals("components")) {
                Request dataRequest = null;
                ResultSetContainer rsc = null;
                Map resultMap = null;
                log.debug("getting dai");
                dataRequest = new Request();
                dataRequest.setContentHandle("open_projects");

                DataAccessInt dai = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
                log.debug("got dai");

                resultMap = dai.getData(dataRequest);
                log.debug("got map");
                rsc = (ResultSetContainer) resultMap.get("Retrieve open projects");


                ResultSetContainer rscStatus = null;
                resultMap = null;
                dataRequest = new Request();
                dataRequest.setContentHandle("component_winners");

                dai = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);

                resultMap = dai.getData(dataRequest);
                log.debug("got map");
                rscStatus = (ResultSetContainer) resultMap.get("winners");

                devTag.addTag(rsc.getTag("projects", "project"));
                devTag.addTag(rscStatus.getTag("component_winners", "winner"));
                xsldocURLString = XSL_DIR + command + ".xsl";


            } else if (command.equals("tcs_send")) {
                /********** SHOULD BE A FUNCTION ****************/
                Request dataRequest = null;
                ResultSetContainer rsc = null;
                Map resultMap = null;
                log.debug("getting dai");
                dataRequest = new Request();
                dataRequest.setContentHandle("open_projects");

                DataAccessInt dai = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
                resultMap = dai.getData(dataRequest);
                rsc = (ResultSetContainer) resultMap.get("Retrieve open projects");
                devTag.addTag(rsc.getTag("projects", "project"));

                int phase = Integer.parseInt(request.getParameter("phase"));
                int version = Integer.parseInt(request.getParameter("version"));
                devTag.addTag(new ValueTag("phase", phase));
                devTag.addTag(new ValueTag("version", version));
                long projectId = Long.parseLong(request.getParameter("projectId"));
                long componentId = 0;
                boolean appProject = false;
                if (Conversion.checkNull(request.getParameter("comp")).equals("")) {
                    appProject = true;
                } else {
                    componentId = Long.parseLong(request.getParameter("comp"));
                    devTag.addTag(new ValueTag("comp", componentId));
                }
                devTag.addTag(new ValueTag("projectId", projectId));


                if (nav.isLoggedIn()) {

                    devTag.addTag(new ValueTag("Project", project));

                    String handle = nav.getSessionInfo().getHandle();
                    devTag.addTag(new ValueTag("handle", handle));

                    Data.loadUser(nav);
                    int rating = nav.getSessionInfo().getRating();
                    String from = nav.getUser().getEmail();
                    String to = Conversion.checkNull(request.getParameter("To"));
                    String comment = Conversion.clean(request.getParameter("Comment"));

                    boolean agreedToTerms = false;
                    if (request.getParameter("terms") != null) {
                        agreedToTerms = true;
                    }

                    if (!appProject) {

                        if (phase == SoftwareComponent.DESIGN_PHASE) {
                            rating = getDesignRating(nav.getSessionInfo().getUserId());
                        } else {
                            rating = getDevRating(nav.getSessionInfo().getUserId());
                        }

                        //get fancy new ejb
                        InitialContext ctx = TCContext.getInitial();
                        ComponentRegistrationServices cregBean = (ComponentRegistrationServices) BaseProcessor.createEJB(ctx, ComponentRegistrationServices.class);

                        if (!isSuspended(nav.getSessionInfo().getUserId())) {
                            if (!cregBean.isRegClosed(projectId, DBMS.TCS_OLTP_DATASOURCE_NAME)) {
                                if (!cregBean.isUserRegistered(projectId, nav.getSessionInfo().getUserId(), DBMS.TCS_OLTP_DATASOURCE_NAME)) {
                                    if (!cregBean.hasUserReviewedProject(projectId, nav.getSessionInfo().getUserId(), DBMS.TCS_OLTP_DATASOURCE_NAME)) {
                                        if (!cregBean.isUserWinningDesigner(projectId, nav.getSessionInfo().getUserId(), DBMS.TCS_OLTP_DATASOURCE_NAME)) {
                                            if (!cregBean.isUserReliableEnough(phase, nav.getSessionInfo().getUserId(), DBMS.TCS_OLTP_DATASOURCE_NAME)) {

                                                //check max rated / unrated
                                                log.debug("RYAN RATING IS:" + rating);
                                                if (rating == 0 && cregBean.getUnratedRegistrantCount(projectId, DBMS.TCS_OLTP_DATASOURCE_NAME) >= cregBean.getMaxUnratedRegistrants(projectId, DBMS.TCS_OLTP_DATASOURCE_NAME)) {
                                                    //reg full - unrated
                                                    devTag.addTag(new ValueTag("max_reg", cregBean.getMaxUnratedRegistrants(projectId, DBMS.TCS_OLTP_DATASOURCE_NAME)));
                                                    xsldocURLString = XSL_DIR + "reg_full_unrated.xsl";
                                                } else if (rating != 0 && cregBean.getRatedRegistrantCount(projectId, DBMS.TCS_OLTP_DATASOURCE_NAME) >= cregBean.getMaxRatedRegistrants(projectId, DBMS.TCS_OLTP_DATASOURCE_NAME)) {
                                                    //reg full - rated
                                                    devTag.addTag(new ValueTag("max_reg", cregBean.getMaxRatedRegistrants(projectId, DBMS.TCS_OLTP_DATASOURCE_NAME)));
                                                    xsldocURLString = XSL_DIR + "reg_full_rated.xsl";
                                                } else {
                                                    //reg succeeded - add survey responses
                                                    ResultSetContainer rscQuestions = cregBean.getActiveQuestions();
                                                    int rowCount = rscQuestions.getRowCount();
                                                    for (int i = 0; i < rowCount; i++) {
                                                        int questionId = rscQuestions.getIntItem(i, "comp_reg_question_id");
                                                        int questionStyleId = rscQuestions.getIntItem(i, "question_style_id");
                                                        if (questionStyleId == 1 || questionStyleId == 2) {
                                                            String[] selectedAnswers = request.getParameterValues("q" + questionId);
                                                            for (int j = 0; j < selectedAnswers.length; j++) {
                                                                cregBean.createResponse(projectId, nav.getUserId(), questionId, Integer.parseInt(selectedAnswers[j]));
                                                            }
                                                        } else if (questionStyleId == 3 || questionStyleId == 4) {
                                                            String responseText = request.getParameter("q" + questionId);
                                                            cregBean.createResponse(projectId, nav.getUserId(), questionId, responseText);
                                                        }
                                                    }

                                                    register(nav.getSessionInfo().getUserId(), componentId, projectId, rating, comment, agreedToTerms, phase, version);
                                                    String activeForumId = String.valueOf(getActiveForumId(componentId));
                                                    devTag.addTag(new ValueTag("forumId", activeForumId));

                                                    TCSEmailMessage mail = new TCSEmailMessage();
                                                    log.debug("from: " + from);
                                                    mail.addToAddress(from, TCSEmailMessage.TO);
                                                    mail.setFromAddress(to);
                                                    mail.setSubject(project);


                                                    xsldocURLString = XSL_DIR + "inquiry_sent_pos.xsl";

                                                    if (phase == ComponentVersionInfo.SPECIFICATION) {
                                                        mail.setBody("Registration Complete. \r\n\r\n" +
                                                                "Thank you, " + handle + ", for your interest in the " + project + " component. You now have access to the Developer Forum ( http://" + ApplicationServer.SOFTWARE_SERVER_NAME + "/forum/c_forum.jsp?f=" + activeForumId + " ) which can be used to obtain design documentation (see the Design Phase Documents thread), as well as to ask questions regarding the component design. Please post your questions at any time and a product manager will respond within 24 hours. Any questions asked within 6 hours of the submission due date/time may not be answered in time, so get your questions in early!\r\n\r\n" +
                                                                "The deadline for submitting a solution is " + date + " at 9:00 AM ET. Please upload your design using the project page found here: http://" + ApplicationServer.SOFTWARE_SERVER_NAME + "/review.  If you encounter any problems, please contact us at service@topcodersoftware.com.  All late submissions will be ignored.\r\n\r\n" +
                                                                "If you have any questions please contact service@topcodersoftware.com\r\n\r\n" +
                                                                "TopCoder Software Team");

                                                    } else {

                                                        mail.setBody("Registration Complete\r\n\r\n" +
                                                                "Thank you, " + handle + ", for your interest in the " + project + " component. You now have access to the Developer Forum ( http://" + ApplicationServer.SOFTWARE_SERVER_NAME + "/forum/c_forum.jsp?f=" + activeForumId + " ) which can be used to obtain the component design (See \"Development Phase Documents\" thread), as well as to ask questions regarding the development process or the component design. Please post your questions at any time and the component designer will respond within 24 hours. Any questions asked within 6 hours of the submission due date/time may not be answered, so get your questions in early!\r\n\r\n" +
                                                                "The deadline for submitting a solution is " + date + " at 9:00 AM ET. Please upload your solution using the project page found here: http://" + ApplicationServer.SOFTWARE_SERVER_NAME + "/review. If you encounter any problems, please contact us at service@topcodersoftware.com.  Any late submissions will be ignored. \r\n\r\n" +
                                                                "If you have any questions please contact service@topcodersoftware.com\r\n\r\n" +
                                                                "TopCoder Software Team");
                                                    }
                                                    EmailEngine.send(mail);
                                                }
                                            } else {
                                                xsldocURLString = XSL_DIR + "unreliable.xsl";
                                            }
                                        } else {
                                            xsldocURLString = XSL_DIR + "winning_designer.xsl";
                                        }
                                    } else {
                                        xsldocURLString = XSL_DIR + "already_reviewed.xsl";
                                    }
                                } else {
                                    xsldocURLString = XSL_DIR + "already_registered.xsl";
                                }

                            } else {
                                xsldocURLString = XSL_DIR + "inquiry_sent_neg.xsl";
                            }
                        } else {
                            xsldocURLString = XSL_DIR + "suspended.xsl";
                        }
                    } else {

                        StringBuffer msgText = new StringBuffer(1000);
                        msgText.append(handle);
                        msgText.append(" inquiry for project:  ");
                        msgText.append(project);
                        msgText.append("\n\n");
                        if (agreedToTerms) {
                            msgText.append("\n\nAgreed to terms.\n");
                        } else {
                            msgText.append("\n\nDid not agree to terms.\n");
                        }
                        msgText.append("\n\nComment:\n");
                        msgText.append(comment);


                        TCSEmailMessage mail = new TCSEmailMessage();
                        mail.addToAddress(to, TCSEmailMessage.TO);
                        mail.setFromAddress(from);

                        mail.setSubject("APPLICATION: " + project + " -- " + handle);

                        Request r = new Request();
                        r.setContentHandle("member_profile");
                        r.setProperty("cr", String.valueOf(nav.getUserId()));
                        DataAccessInt appDai = new CachedDataAccess(DBMS.DW_DATASOURCE_NAME);
                        ResultSetContainer appRsc = (ResultSetContainer) appDai.getData(r).get("Coder_Data");

                        int devRating = Integer.parseInt(appRsc.getItem(0, "development_rating").getResultData() == null
                                ? "0" : String.valueOf(appRsc.getIntItem(0, "development_rating")));
                        int desRating = Integer.parseInt(appRsc.getItem(0, "design_rating").getResultData() == null
                                ? "0" : String.valueOf(appRsc.getIntItem(0, "design_rating")));

                        msgText.append("\n\nAlgorithm Rating:\n");
                        msgText.append(rating);
                        msgText.append("\n\nDev Rating:\n");
                        msgText.append(devRating);
                        msgText.append("\n\nDesign Rating:\n");
                        msgText.append(desRating);
                        msgText.append("\n\n").append("http://");
                        msgText.append(ApplicationServer.SERVER_NAME);
                        msgText.append("/tc?module=MemberProfile&cr=");
                        msgText.append(nav.getUserId());
                        msgText.append("\n");

                        mail.setBody(msgText.toString());
                        xsldocURLString = XSL_DIR + "inquiry_app.xsl";
                        EmailEngine.send(mail);

                        //send an email to the person that applied
                        TCSEmailMessage resp = new TCSEmailMessage();
                        resp.addToAddress(from, TCSEmailMessage.TO);
                        resp.setFromAddress(to);
                        resp.setSubject(project);
                        StringBuffer respBody = new StringBuffer(100);
                        respBody.append("Hello ");
                        respBody.append(handle);
                        respBody.append(", \n\n");
                        respBody.append("Your application for more information on the ");
                        respBody.append(project);
                        respBody.append(" application project has been received.\n\n");
                        respBody.append("If you are chosen, you will receive an email containing more details about ");
                        respBody.append("the project.  Once you have read that information, you will be expected to ");
                        respBody.append("respond indicating whether or not you will commit to completing the work.\n\n");
                        if (desRating == 0 && phase == SoftwareComponent.DESIGN_PHASE) {
                            respBody.append("Since you do not have a component design rating, it is unlikely that ");
                            respBody.append("you will be chosen to work on this application.  You may look at ");
                            respBody.append("the current component design opportunities here ");
                            respBody.append("http://");
                            respBody.append(ApplicationServer.SERVER_NAME);
                            respBody.append("/?t=development&c=comp_projects\n\n");
                        } else if (devRating == 0 && phase == SoftwareComponent.DEV_PHASE) {
                            respBody.append("Since you do not have a component development rating, it is unlikely that ");
                            respBody.append("you will be chosen to work on this application.  You may look at ");
                            respBody.append("the current component development opportunities here ");
                            respBody.append("http://");
                            respBody.append(ApplicationServer.SERVER_NAME);
                            respBody.append("/?t=development&c=comp_projects\n\n");
                        }
                        respBody.append("TopCoder Software Service");
                        resp.setBody(respBody.toString());
                        EmailEngine.send(resp);

                    }
                } else {
                    requiresLogin = true;
                }
            } else if (command.equals("tcs_team_app_send")) {
                if (nav.isLoggedIn()) {

                    devTag.addTag(new ValueTag("Project", project));

                    String handle = nav.getSessionInfo().getHandle();
                    devTag.addTag(new ValueTag("handle", handle));

                    Data.loadUser(nav);
                    String from = nav.getUser().getEmail();
                    String to = Conversion.checkNull(request.getParameter("To"));
                    String teammate = Conversion.clean(request.getParameter("teammate"));
                    String comment = Conversion.clean(request.getParameter("Comment"));


                    StringBuffer msgText = new StringBuffer(1000);
                    msgText.append(handle);
                    msgText.append(" inquiry for project:  ");
                    msgText.append(project);
                    msgText.append("\n\n");
                    if (request.getParameter("terms") == null) {
                        msgText.append("\n\nDid not agree to terms.\n");
                    } else {
                        msgText.append("\n\nAgreed to terms.\n");
                    }
                    msgText.append("\n\nTeammate: ").append(teammate);
                    msgText.append("\n\nComment:\n");
                    msgText.append(comment);

                    log.debug("Get Rating");
                    int rating = nav.getSessionInfo().getRating();
                    log.debug("Got Rating");

                    TCSEmailMessage mail = new TCSEmailMessage();
                    mail.addToAddress(to, TCSEmailMessage.TO);
                    mail.setFromAddress(from);

                    mail.setSubject("TEAM APPLICATION: " + project + " -- " + handle);

                    Request r = new Request();
                    r.setContentHandle("member_profile");
                    r.setProperty("cr", String.valueOf(nav.getUserId()));
                    DataAccessInt appDai = new CachedDataAccess(DBMS.DW_DATASOURCE_NAME);
                    ResultSetContainer appRsc = (ResultSetContainer) appDai.getData(r).get("Coder_Data");

                    int devRating = Integer.parseInt(appRsc.getItem(0, "development_rating").getResultData() == null
                            ? "0" : String.valueOf(appRsc.getIntItem(0, "development_rating")));
                    int desRating = Integer.parseInt(appRsc.getItem(0, "design_rating").getResultData() == null
                            ? "0" : String.valueOf(appRsc.getIntItem(0, "design_rating")));

                    msgText.append("\n\nAlgorithm Rating:\n");
                    msgText.append(rating);
                    msgText.append("\n\nDev Rating:\n");
                    msgText.append(devRating);
                    msgText.append("\n\nDesign Rating:\n");
                    msgText.append(desRating);
                    msgText.append("\n\n").append("http://");
                    msgText.append(ApplicationServer.SERVER_NAME);
                    msgText.append("/tc?module=MemberProfile&cr=");
                    msgText.append(nav.getUserId());
                    msgText.append("\n");

                    mail.setBody(msgText.toString());
                    xsldocURLString = XSL_DIR + "inquiry_team_app.xsl";
                    EmailEngine.send(mail);

                    //send an email to the person that applied
                    TCSEmailMessage resp = new TCSEmailMessage();
                    resp.addToAddress(from, TCSEmailMessage.TO);
                    resp.setFromAddress(to);
                    resp.setSubject(project);
                    StringBuffer respBody = new StringBuffer(100);
                    respBody.append("Hello ");
                    respBody.append(handle);
                    respBody.append(", \n\n");

                    respBody.append("Thank you for registering for the ");
                    respBody.append(project);
                    respBody.append(" Team Application Project.  Since this is a team project, please remember that if ");
                    respBody.append("you registered without providing the TopCoder handle of your teammate, we will ");
                    respBody.append("assume that you are looking for TopCoder to assign a teammate for you.  If this is ");
                    respBody.append("not correct, you may reply to this email with the TopCoder handle of your teammate.\n\n");
                    respBody.append("In addition, if you are not familiar with the TopCoder Team Application process, ");
                    respBody.append("please read this information:  ");
                    respBody.append("http://");
                    respBody.append(ApplicationServer.SERVER_NAME);
                    respBody.append("/?t=development&c=app_team_meth");
                    respBody.append("\n\n");
                    respBody.append("Please note the deadline for proposal submissions, as this is the first deliverable ");
                    respBody.append("in the new Team Application process.\n\n");
                    respBody.append("We will contact you in the near future to ensure that you plan to participate in ");
                    respBody.append("the proposal phase of this application project and to provide you and your teammate ");
                    respBody.append("access to all of the project specification documentation.\n\n\n");
                    respBody.append("Thanks,\n\n");

                    respBody.append("TopCoder Software Service");
                    resp.setBody(respBody.toString());
                    EmailEngine.send(resp);

                } else {
                    requiresLogin = true;
                }
            } else if (command.length() > 0) {
                devTag.addTag(Base.getOpenProjects().getTag("projects", "project"));
                xsldocURLString = XSL_DIR + command + ".xsl";
            } else {
                throw new Exception("Invalid command: " + command);
            }
            if (requiresLogin) {
                throw new PermissionException(new SimpleUser(nav.getUserId(), "", ""), new PathResource(XSL_DIR + command));
            }
            document.addTag(devTag);

            ////log.debug("XML: " + document);
            result = HTMLmaker.render(document, xsldocURLString);
        } catch (NavigationException ne) {
            log.error("TaskDevelopment:ERROR:\n" + ne);
            throw ne;
        } catch (PermissionException pe) {
            throw pe;
        } catch (Exception e) {
            throw new NavigationException(e);
        }
        return result;
    }

    /**
     * return true if the registration period is open, or if they have already registered
     * for the tco
     * @param userId
     * @return
     * @throws Exception
     */
/*    private static boolean tcoTermsCheck(long userId) throws Exception {
        Calendar c = Calendar.getInstance();

        if (c.before(new GregorianCalendar(2004, 7, 10)) || c.after(new GregorianCalendar(2004, 9, 23))) {
            return true;
        }

        boolean ret = false;
        InitialContext ctx = TCContext.getInitial();
        try {
            UserTermsOfUse userTerms = (UserTermsOfUse) BaseProcessor.createEJB(ctx, UserTermsOfUse.class);
            ret = userTerms.hasTermsOfUse(userId, Constants.TCO04_COMPONENT_TERMS_OF_USE_ID, DBMS.OLTP_DATASOURCE_NAME);
        } finally {
            BaseProcessor.close(ctx);
        }

        return ret;
    }*/

    public static boolean isProjectLockedOut(long componentId, long version, long phase, long userId) throws Exception {
/*
        DataAccessInt dAccess = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
        Request inquiryRequest = new Request();
        inquiryRequest.setContentHandle("inquiry_count");
        inquiryRequest.setProperty("cd", String.valueOf(componentId));
        inquiryRequest.setProperty("vid", String.valueOf(version));
        inquiryRequest.setProperty("ph", String.valueOf(phase));
        ResultSetContainer totalRsc = (ResultSetContainer) dAccess.getData(inquiryRequest).get("inquiry_count");
        ResultSetContainer ratedRsc = (ResultSetContainer) dAccess.getData(inquiryRequest).get("rated_inquiry_count");

        int ratedCount = ratedRsc.getIntItem(0, "count");
        int unratedCount = totalRsc.getIntItem(0, "count")-ratedCount;

        Request ratingRequest = new Request();
        ratingRequest.setContentHandle("rating_info");
        ratingRequest.setProperty("uid", String.valueOf(userId));
        ratingRequest.setProperty("ph", String.valueOf(phase));
        ResultSetContainer ratingRsc = (ResultSetContainer) dAccess.getData(ratingRequest).get("rating_info");
        boolean rated = !ratingRsc.isEmpty()&&ratingRsc.getIntItem(0, "num_ratings")>0;

        boolean ret = false;
        if (rated && ratedCount>=Constants.MAX_RATED_INQUIRIES) {
            ret = true;
        } else if (!rated && unratedCount>=Constants.MAX_UNRATED_INQUIRIES) {
            ret = true;
        } else if (ratedCount+unratedCount>=Constants.MAX_RATED_INQUIRIES+Constants.MAX_UNRATED_INQUIRIES) {
            //this is the case where someone registers while unrated, and becomes rated.
            //without this case, an urated spot frees up
            ret = true;
        }
*/
        //it's never locked up, we took that out (at least for now)
        boolean ret = false;

        return ret;

    }

    static boolean isTournamentComponent(long componentId, long version, long phase) throws Exception {
        DataAccessInt dAccess = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("component_dates_status");
        r.setProperty("cd", String.valueOf(componentId));
        r.setProperty("vid", String.valueOf(version));
        r.setProperty("ph", String.valueOf(phase));
        ResultSetContainer rsc = (ResultSetContainer) dAccess.getData(r).get("component_dates_status");
        return rsc.getIntItem(0, "status_id") == Constants.TOURNAMENT_COMPONENT;
    }

    static boolean isSuspended(long userId) throws Exception {
        DataAccessInt dAccess = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("component_suspension");
        r.setProperty("uid", String.valueOf(userId));
        ResultSetContainer rsc = (ResultSetContainer) dAccess.getData(r).get("component_suspension");
        return !rsc.isEmpty();
    }

    static int getDesignRating(long userId) throws Exception {
        DataAccessInt dAccess = new DataAccess(DBMS.DW_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("member_profile");
        r.setProperty("cr", String.valueOf(userId));
        ResultSetContainer rsc = (ResultSetContainer) dAccess.getData(r).get("Coder_Data");
        if (rsc.getItem(0, "design_rating").getResultData() == null) {
            return 0;
        } else {
            return rsc.getIntItem(0, "design_rating");
        }
    }

    static int getDevRating(long userId) throws Exception {
        DataAccessInt dAccess = new DataAccess(DBMS.DW_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("member_profile");
        r.setProperty("cr", String.valueOf(userId));
        ResultSetContainer rsc = (ResultSetContainer) dAccess.getData(r).get("Coder_Data");
        if (rsc.getItem(0, "development_rating").getResultData() == null) {
            return 0;
        } else {
            return rsc.getIntItem(0, "development_rating");
        }
    }

    static ComponentManager getComponentManager(long componentId) {

        ComponentManager componentMgr = null;
        Context ctx = null;
        try {
            ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.TCS_APP_SERVER_URL);
            Object objTechTypes = ctx.lookup("ComponentManagerEJB");
            ComponentManagerHome home = (ComponentManagerHome) PortableRemoteObject.narrow(objTechTypes, ComponentManagerHome.class);
            componentMgr = home.create(componentId);
        } catch (javax.naming.NamingException namingException) {
            log.error("Could not create context: " + namingException.getMessage());
        } catch (javax.ejb.CreateException createException) {
            log.error("Could not create component Manager: " + createException.getMessage());
        } catch (java.rmi.RemoteException remoteException) {
            log.error("Could not create component Manager: " + remoteException.getMessage());
        } finally {
            BaseProcessor.close(ctx);
        }
        return componentMgr;
    }

    static ComponentManager getComponentManager(long componentId, long version) {

        ComponentManager componentMgr = null;
        Context ctx = null;
        try {
            ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.TCS_APP_SERVER_URL);
            Object objTechTypes = ctx.lookup(ComponentManagerHome.EJB_REF_NAME);
            ComponentManagerHome home = (ComponentManagerHome) PortableRemoteObject.narrow(objTechTypes, ComponentManagerHome.class);
            componentMgr = home.create(componentId, version);
        } catch (javax.naming.NamingException namingException) {
            log.error("Could not create context: " + namingException.getMessage());
        } catch (javax.ejb.CreateException createException) {
            log.error("Could not create component Manager: " + createException.getMessage());
        } catch (java.rmi.RemoteException remoteException) {
            log.error("Could not create component Manager: " + remoteException.getMessage());
        } finally {
            BaseProcessor.close(ctx);
        }
        return componentMgr;
    }

    static Catalog getCatalog() {

        Catalog catalog = null;
        Context ctx = null;
        try {
            ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.TCS_APP_SERVER_URL);
            Object objTechTypes = ctx.lookup(CatalogHome.EJB_REF_NAME);
            CatalogHome home = (CatalogHome) PortableRemoteObject.narrow(objTechTypes, CatalogHome.class);
            catalog = home.create();

        } catch (javax.naming.NamingException namingException) {
            log.error("Could not create context: " + namingException.getMessage());
        } catch (javax.ejb.CreateException createException) {
            log.error("Could not create catalog: " + createException.getMessage());
        } catch (java.rmi.RemoteException remoteException) {
            log.error("Could not create catalog: " + remoteException.getMessage());
        } finally {
            BaseProcessor.close(ctx);
        }
        return catalog;
    }


    static void register(long userId, long componentId, long projectId, int rating, String comment, boolean agreedToTerms, int phase, int version) throws Exception {
        Context ctx = null;
        try {
            log.debug(ApplicationServer.SECURITY_CONTEXT_FACTORY);
            log.debug(ApplicationServer.TCS_APP_SERVER_URL);
            log.debug(UserManagerRemoteHome.EJB_REF_NAME);
            ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.TCS_APP_SERVER_URL);
            log.debug("creating user");
            Object objUserManager = ctx.lookup(UserManagerRemoteHome.EJB_REF_NAME);
            UserManagerRemoteHome userManagerHome = (UserManagerRemoteHome) PortableRemoteObject.narrow(objUserManager, UserManagerRemoteHome.class);
            UserManagerRemote USER_MANAGER = userManagerHome.create();

            USER_MANAGER.registerInquiry(userId, componentId, rating, userId, comment, agreedToTerms, phase, version, projectId);


            String roleName = "ForumUser " + getActiveForumId(componentId);

            //add the user to the appropriate role to view the forum
            Object objPrincipalManager = ctx.lookup("security/PrincipalMgr");
            PrincipalMgrRemoteHome principalManagerHome = (PrincipalMgrRemoteHome) PortableRemoteObject.narrow(objPrincipalManager, PrincipalMgrRemoteHome.class);
            PrincipalMgrRemote principalMgr = principalManagerHome.create();
            Collection roles = principalMgr.getRoles(null);
            RolePrincipal role = null;
            for (Iterator it = roles.iterator(); it.hasNext();) {
                role = (RolePrincipal) it.next();
                if (role.getName().equalsIgnoreCase(roleName)) {
                    log.debug("--->got a match");
                    UserPrincipal up = principalMgr.getUser(userId);
                    try {
                        principalMgr.assignRole(up, role, null);
                    } catch (Exception e) {
                        //ignoring, most likely they already have the role, so all is well
                        log.info("userId " + userId + " already had role: " + roleName + " so not adding again");
                    }
                }
            }
        } finally {
            BaseProcessor.close(ctx);
        }
    }

    static long getActiveForumId(long componentId) throws Exception {

        Context ctx = null;
        try {
            ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.TCS_APP_SERVER_URL);
            Object objTechTypes = ctx.lookup(ComponentManagerHome.EJB_REF_NAME);
            ComponentManagerHome home = (ComponentManagerHome) PortableRemoteObject.narrow(objTechTypes, ComponentManagerHome.class);
            ComponentManager componentMgr = home.create(componentId);
            Forum activeForum = componentMgr.getActiveForum(Forum.SPECIFICATION);

            if (activeForum == null) throw new Exception("Could not find forum for component " + componentId);
            return activeForum.getId();
        } finally {
            BaseProcessor.close(ctx);
        }

    }

}
