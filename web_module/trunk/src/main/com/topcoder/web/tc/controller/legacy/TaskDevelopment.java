package com.topcoder.web.tc.controller.legacy;


import com.topcoder.common.web.constant.TCServlet;
import com.topcoder.common.web.data.Navigation;
//import com.topcoder.common.web.data.report.Constants;
import com.topcoder.common.web.error.NavigationException;
import com.topcoder.common.web.util.Conversion;
import com.topcoder.common.web.util.Data;
import com.topcoder.common.web.xml.HTMLRenderer;
import com.topcoder.security.NoSuchUserException;
import com.topcoder.security.RolePrincipal;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.ValueTag;
import com.topcoder.shared.docGen.xml.XMLDocument;
import com.topcoder.shared.util.*;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.security.PathResource;

import com.topcoder.dde.catalog.Catalog;
import com.topcoder.dde.catalog.CatalogHome;
import com.topcoder.dde.catalog.ComponentManagerHome;
import com.topcoder.dde.catalog.ComponentManager;
import com.topcoder.dde.catalog.ComponentVersionInfo;
import com.topcoder.dde.user.UserManagerRemoteHome;
import com.topcoder.dde.user.UserManagerRemote;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.tc.controller.request.development.Base;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.SoftwareComponent;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.ejb.ComponentRegistrationServices.ComponentRegistrationServices;

import javax.rmi.PortableRemoteObject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.naming.Context;
import javax.naming.InitialContext;
import java.util.Map;
import java.text.NumberFormat;

import java.util.*;

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

/*
    private static String[] setFields(String phoneNumber) {
        if (phoneNumber == null) phoneNumber = "";
        StringBuffer phoneFormatted = new StringBuffer("");
        for (int i = 0; i < phoneNumber.length(); i++) {
            char c = phoneNumber.charAt(i);
            if (Character.isDigit(c)) {
                phoneFormatted.append(c);
            }
        }
        String phone = phoneFormatted.toString();
        String[] phoneElements = new String[3];
        int[] limits = {10, 7, 0};
        for (int i = 0; i < 3; i++) {
            int limit = limits[i];

            String s;
            int length = phone.length();
            if (length > limit) {
                int index = length - limit;
                s = phone.substring(0, index);
                phone = phone.substring(index);
            } else {
                s = "";
            }
            phoneElements[i] = s;
        }
        return phoneElements;
    }
*/

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
//        String cacheKey = null;
        try {
            String command = Conversion.checkNull(request.getParameter("c"));
            log.debug("Initial command is: " + command);
            boolean requiresLogin = false;
            RecordTag devTag = new RecordTag("DEVELOPMENT");
            String comp = Conversion.checkNull(request.getParameter("comp"));
            devTag.addTag(new ValueTag("comp", comp));
/*   don't need this stuff, we don't have a max inquiry..at least for now
            devTag.addTag(new ValueTag("MaxInquiries", Constants.MAX_RATED_INQUIRIES+Constants.MAX_UNRATED_INQUIRIES));
            devTag.addTag(new ValueTag("MaxRatedInquiries", Constants.MAX_RATED_INQUIRIES));
            devTag.addTag(new ValueTag("MaxUnratedInquiries", Constants.MAX_UNRATED_INQUIRIES));
*/
            String date = Conversion.checkNull(request.getParameter("date"));
//            String payment = Conversion.checkNull(request.getParameter("payment"));

            String xsldocURLString = null;
            String project = Conversion.checkNull(request.getParameter("Project"));
/*
            if (!payment.equals("")) {
                NumberFormat format = NumberFormat.getCurrencyInstance();

                double paymentAmt = Double.parseDouble(payment);
                devTag.addTag(new ValueTag("payment", format.format(paymentAmt)));
                log.debug(format.format(paymentAmt * .75));
                devTag.addTag(new ValueTag("first_payment", format.format(paymentAmt * .75)));
                devTag.addTag(new ValueTag("second_payment", format.format(paymentAmt * .25)));

            } else {
                devTag.addTag(new ValueTag("payment", payment));
            }
*/
            String phase = request.getParameter("phase");

            devTag.addTag(new ValueTag("date", date));
            devTag.addTag(new ValueTag("version", request.getParameter("version")));
            devTag.addTag(new ValueTag("tccc", request.getParameter("tccc")));
            devTag.addTag(new ValueTag("tco", request.getParameter("tco")));
            devTag.addTag(new ValueTag("phase", phase));
            devTag.addTag(new ValueTag("posting_date", request.getParameter("posting_date")));
            devTag.addTag(new ValueTag("initial_submission", request.getParameter("initial_submission")));
            devTag.addTag(new ValueTag("final_submission", request.getParameter("final_submission")));
            devTag.addTag(new ValueTag("winner_announced", request.getParameter("winner_announced")));
            devTag.addTag(new ValueTag("estimated_dev", request.getParameter("estimated_dev")));
            devTag.addTag(new ValueTag("compvers", request.getParameter("compvers")));
            devTag.addTag(new ValueTag("projectId", request.getParameter("projectId")));

            log.debug("PROJECT IS: " + request.getParameter("projectId"));



            if (command.equals("tcs_inquire") || command.equals("tcs_app_inquire")) {
                if (nav.isLoggedIn()) {
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

                    log.debug("got rsc");
                    if (rsc == null)
                        log.debug("rsc is null");
                    devTag.addTag(rsc.getTag("projects", "project"));
                    String to = Conversion.checkNull(request.getParameter("To"));
                    //String handle = nav.getUser().getHandle();
                    //String handle = nav.getSessionInfo().getHandle();
                    devTag.addTag(new ValueTag("ProjectName", project));
                    devTag.addTag(new ValueTag("Project", project));
                    devTag.addTag(new ValueTag("To", to));

                    devTag.addTag(new ValueTag("projectId", request.getParameter("projectId")));
                    /*if(command.equals("tcs_inquire") && !tcoTermsCheck(nav.getSessionInfo().getUserId()) && (request.getParameter("continue") == null || !request.getParameter("continue").equals("true")))
                    {
                        xsldocURLString = XSL_DIR + "tco_terms.xsl";
                    }
                    else
                    {*/
                        xsldocURLString = XSL_DIR + command + ".xsl";
                    //}
                } else {
                    requiresLogin = true;
                }
            }
            /********************** tcs_inquire-design *******************/
/*  doesn't seem like this is used anymore
            else if (command.equals("tcs_inquire-design") || command.equals("tcs_inquire-dev")) {
                if (comp != null && comp.length() > 0) {
                    log.debug("here");
                    long componentId = Long.parseLong(comp);

                    ComponentManager componentManager = getComponentManager(componentId, Long.parseLong(request.getParameter("version")));
                    ComponentInfo componentInfo = componentManager.getComponentInfo();
                    Collection technologies = componentManager.getTechnologies();
                    Technology summaries[] = (Technology[]) technologies.toArray(new Technology[0]);
                    RecordTag technologyTag = new RecordTag("technologies");
                    for (int i = 0; i < summaries.length; i++) {
                        technologyTag.addTag(new ValueTag("techName", summaries[i].getName()));
                    }
                    devTag.addTag(technologyTag);

                    devTag.addTag(new ValueTag("componentName", componentInfo.getName()));
                    devTag.addTag(new ValueTag("formattedName", formatName(componentInfo.getName())));
                    devTag.addTag(new ValueTag("overview", componentInfo.getDescription()));


                    devTag.addTag(new ValueTag("documentId", request.getParameter("docId")));

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

                    log.debug("got rsc");
                    if (rsc == null)
                        log.debug("rsc is null");
                    devTag.addTag(rsc.getTag("projects", "project"));

                    xsldocURLString = XSL_DIR + command + ".xsl";
                } else {
                    log.error("Missing component id");
                }
            }
*/
            /********************** send *******************/

/* doesn't seem like this is used

else if (command.equals("send")) {
                if (nav.isLoggedIn()) {
                    devTag.addTag(new ValueTag("Project", project));
                    //String handle = nav.getUser().getHandle();
                    String handle = nav.getSessionInfo().getHandle();
                    String from = nav.getUser().getEmail();
                    String to = Conversion.checkNull(request.getParameter("To"));
                    String experience = Conversion.clean(request.getParameter("Experience"));
                    String workWeek = Conversion.checkNull(request.getParameter("WorkWeek"));
                    String comment = Conversion.clean(request.getParameter("Comment"));
                    TCSEmailMessage mail = new TCSEmailMessage();
                    mail.setSubject(project + " -- " + handle);
                    StringBuffer msgText = new StringBuffer(1000);
                    msgText.append(handle);
                    msgText.append(" inquiry for project:  ");
                    msgText.append(project);
                    msgText.append("\n\n");
                    msgText.append("Hours per Week:  ");
                    msgText.append(workWeek);

                    Data.loadUser(nav);
                    //User user = nav.getUser();
                    //CoderRegistration coder = (CoderRegistration) user.getUserTypeDetails().get("Coder");
                    //int rating = coder.getRating().getRating();
                    int rating = nav.getSessionInfo().getRating();

                    msgText.append("\n\nRating:\n");
                    msgText.append(rating);
                    msgText.append("\n\nExperience:\n");
                    msgText.append(experience);
                    msgText.append("\n\nComment:\n");
                    msgText.append(comment);
                    mail.setBody(msgText.toString());
                    mail.addToAddress(to, TCSEmailMessage.TO);
                    mail.setFromAddress(from);
                    EmailEngine.send(mail);
                    xsldocURLString = XSL_DIR + "inquiry_sent.xsl";
                } else {
                    requiresLogin = true;
                }
            }*/ else if (command.equals("multiplier_status")) {
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
                dataRequest.setContentHandle("project_status");

                dai = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);

                resultMap = dai.getData(dataRequest);
                log.debug("got map");
                rscStatus = (ResultSetContainer) resultMap.get("project_status");

                devTag.addTag(rsc.getTag("projects", "project"));
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


            }
            /********************** tcs_send *******************/
            else if (command.equals("tcs_send")) {
                /********** SHOULD BE A FUNCTION ****************/
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

                log.debug("got rsc");
                if (rsc == null)
                    log.debug("rsc is null");
                devTag.addTag(rsc.getTag("projects", "project"));

                if (nav.isLoggedIn()) {

                    long userId;
                    devTag.addTag(new ValueTag("Project", project));

                    //String handle = nav.getUser().getHandle();
                    String handle = nav.getSessionInfo().getHandle();
                    devTag.addTag(new ValueTag("handle", handle));

                    Data.loadUser(nav);
                    String from = nav.getUser().getEmail();
                    String to = Conversion.checkNull(request.getParameter("To"));
                    String comment = Conversion.clean(request.getParameter("Comment"));
                    String activeForumId = "";


                    StringBuffer msgText = new StringBuffer(1000);
                    msgText.append(handle);
                    msgText.append(" inquiry for project:  ");
                    msgText.append(project);
                    msgText.append("\n\n");
                    boolean agreedToTerms = false;
                    if (request.getParameter("terms") == null) {
                        msgText.append("\n\nDid not agree to terms.\n");
                        agreedToTerms = false;
                    } else {
                        msgText.append("\n\nAgreed to terms.\n");
                        agreedToTerms = true;
                    }
                    msgText.append("\n\nComment:\n");
                    msgText.append(comment);
                    boolean permissionAdded = false;
                    //User user = nav.getUser();
                    //CoderRegistration coder = (CoderRegistration) user.getUserTypeDetails().get("Coder");
                    log.debug("Get Rating");
                    int rating = nav.getSessionInfo().getRating();
                    log.debug("Got Rating");
                    if (comp.length() > 0) {
                        long componentId = Long.parseLong(request.getParameter("comp"));
                        long version = Long.parseLong(request.getParameter("version"));
                        long ph = Long.parseLong(phase);
                        long projId = Long.parseLong(request.getParameter("projectId"));
                        
                        if(ph == 112) {
                            rating = getDesignRating(nav.getSessionInfo().getUserId());
                        } else {
                            rating = getDevRating(nav.getSessionInfo().getUserId());
                        }
                        
                        //get fancy new ejb
                        InitialContext ctx = TCContext.getInitial();
                        
                        ComponentRegistrationServices cregBean = (ComponentRegistrationServices)BaseProcessor.createEJB(ctx, ComponentRegistrationServices.class);

                        if (!isSuspended(nav.getSessionInfo().getUserId())) {
                             if(!cregBean.isRegClosed(projId, DBMS.TCS_OLTP_DATASOURCE_NAME)) {
                                if (!cregBean.isUserRegistered(projId, nav.getSessionInfo().getUserId(), DBMS.TCS_OLTP_DATASOURCE_NAME)) {
                                    if (!cregBean.hasUserReviewedProject(projId, nav.getSessionInfo().getUserId(), DBMS.TCS_OLTP_DATASOURCE_NAME)) {
                                        if (!cregBean.isUserWinningDesigner(projId, nav.getSessionInfo().getUserId(), DBMS.TCS_OLTP_DATASOURCE_NAME)) {
                                            //check max rated / unrated
                                            log.debug("RYAN RATING IS:" + rating);
                                            if(rating == 0 && cregBean.getUnratedRegistrantCount(projId, DBMS.TCS_OLTP_DATASOURCE_NAME) >= cregBean.getMaxUnratedRegistrants(projId, DBMS.TCS_OLTP_DATASOURCE_NAME) ) {
                                                //reg full - unrated
                                                devTag.addTag(new ValueTag("max_reg", cregBean.getMaxUnratedRegistrants(projId, DBMS.TCS_OLTP_DATASOURCE_NAME)));
                                                xsldocURLString = XSL_DIR + "reg_full_unrated.xsl";
                                            } else if (rating != 0 && cregBean.getRatedRegistrantCount(projId, DBMS.TCS_OLTP_DATASOURCE_NAME) >= cregBean.getMaxRatedRegistrants(projId, DBMS.TCS_OLTP_DATASOURCE_NAME)) {
                                                //reg full - rated
                                                devTag.addTag(new ValueTag("max_reg", cregBean.getMaxRatedRegistrants(projId, DBMS.TCS_OLTP_DATASOURCE_NAME)));
                                                xsldocURLString = XSL_DIR + "reg_full_rated.xsl";
                                            } else {

                                                Context CONTEXT = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.TCS_APP_SERVER_URL);

                                                com.topcoder.security.UserPrincipal selectedPrincipal = null;

                                                //get principal manager
                                                Object objPrincipalManager = CONTEXT.lookup("security/PrincipalMgr");
                                                PrincipalMgrRemoteHome principalManagerHome = (PrincipalMgrRemoteHome) PortableRemoteObject.narrow(objPrincipalManager, PrincipalMgrRemoteHome.class);
                                                PrincipalMgrRemote PRINCIPAL_MANAGER = principalManagerHome.create();


                                                //get forum object
                                                //DDEForumHome ddeforumhome = (DDEForumHome) PortableRemoteObject.narrow(CONTEXT.lookup("dde/DDEForum"), DDEForumHome.class);
                                                //DDEForum ddeforum = ddeforumhome.create();

                                                //retrieve the coder registration information
                                                log.debug("terms: " + Conversion.checkNull(request.getParameter("terms")));


                                                log.debug("creating user");
                                                Object objUserManager = CONTEXT.lookup("dde/UserManager");
                                                UserManagerRemoteHome userManagerHome = (UserManagerRemoteHome) PortableRemoteObject.narrow(objUserManager, UserManagerRemoteHome.class);
                                                UserManagerRemote USER_MANAGER = userManagerHome.create();

                                                try {
                                                    selectedPrincipal = PRINCIPAL_MANAGER.getUser(handle);
                                                    userId = selectedPrincipal.getId();
                                                    //PricingTier pt = new PricingTier(1, 5.0);
                                                    log.debug("got user");
                                                } catch (NoSuchUserException noSuchUserException) {
                                                    log.error("noSuchUserException: " + handle + noSuchUserException);
                                                    throw noSuchUserException;

                                                } catch (Exception e) {
                                                    throw e;

                                                }

                                                //add the user to the appropriate role to view the specification
                                                java.util.HashSet rolesSet = (java.util.HashSet) PRINCIPAL_MANAGER.getRoles(null);
                                                RolePrincipal[] roles = (RolePrincipal[]) rolesSet.toArray(new RolePrincipal[0]);
                                                //String formattedProject = project.substring(0, project.lastIndexOf(' ')-1);

                                                log.debug("phase: " + ph);
                                                log.debug("version: " + version);

                                                long projectId = Long.parseLong(request.getParameter("projectId"));

                                                USER_MANAGER.registerInquiry(userId, componentId, rating, (new Integer(nav.getUser().getUserId())).longValue(), comment, agreedToTerms, ph, version, projectId);



                                                //log.debug("FormattedProject: " + formattedProject);

                                                int i = 0;
                                                boolean notFound = true;
                                                //if (rating > 0 || rating == -1) {
                                                //get catalog object
                                                Object objTechTypes = CONTEXT.lookup("ComponentManagerEJB");
                                                ComponentManagerHome home = (ComponentManagerHome) PortableRemoteObject.narrow(objTechTypes, ComponentManagerHome.class);

                                                ComponentManager componentMgr = home.create(componentId);
                                                com.topcoder.dde.catalog.Forum activeForum = componentMgr.getActiveForum(com.topcoder.dde.catalog.Forum.SPECIFICATION);

                                                while (notFound && i < roles.length) {
                                                    String roleName = roles[i].getName();
                                                    if (roleName.startsWith("ForumUser")) {


                                                        if (activeForum != null) {

                                                            log.debug("Role: " + roleName);
                                                            log.debug("FormName:  FormUser " + activeForum.getId());
                                                            activeForumId = Long.toString(activeForum.getId());
                                                            devTag.addTag(new ValueTag("forumId", activeForumId));
                                                            if (roleName.equalsIgnoreCase("ForumUser " + activeForumId)) {
                                                                log.debug("--->got a match");
                                                                notFound = false;
                                                                //RolePrincipal roleToAdd = roles[i];
                                                                try {

                                                                    PRINCIPAL_MANAGER.assignRole(selectedPrincipal, roles[i], null);
                                                                    permissionAdded = true;
                                                                } catch (com.topcoder.security.GeneralSecurityException gse) {
                                                                    //ignore
                                                                    log.error("GeneralSecurityException occurred! ", gse);
                                                                    notFound = true;

                                                                }
                                                            }

                                                        }
                                                    }
                                                    i++;
                                                }
                                                //}

                                                if (!permissionAdded) {

                                                    log.error("Could not find a match for the specific forum");
                                                }


                                                TCSEmailMessage mail = new TCSEmailMessage();
                                                log.debug("from: " + from);
                                                mail.addToAddress(from, TCSEmailMessage.TO);
                                                mail.setFromAddress(to);
                                                mail.setSubject(project);


                                                xsldocURLString = XSL_DIR + "inquiry_sent_pos.xsl";

                                                if (ph == ComponentVersionInfo.SPECIFICATION) {
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

                        //todo ug, nasty!, make this a bit smarter one day
                        if (project.toLowerCase().startsWith("team_app_")) {

                        } else {
                            TCSEmailMessage mail = new TCSEmailMessage();
                            mail.addToAddress(to, TCSEmailMessage.TO);
                            mail.setFromAddress(from);

                            mail.setSubject("APPLICATION: " + project + " -- " + handle);

                            Request r = new Request();
                            r.setContentHandle("member_profile");
                            r.setProperty("cr", String.valueOf(nav.getUserId()));
                            DataAccessInt appDai = new CachedDataAccess(DBMS.DW_DATASOURCE_NAME);
                            ResultSetContainer appRsc = (ResultSetContainer)appDai.getData(r).get("Coder_Data");

                            int devRating = Integer.parseInt(appRsc.getItem(0, "development_rating").getResultData()==null
                                    ?"0":String.valueOf(appRsc.getIntItem(0, "development_rating")));
                            int desRating = Integer.parseInt(appRsc.getItem(0, "design_rating").getResultData()==null
                                    ?"0":String.valueOf(appRsc.getIntItem(0, "design_rating")));

                            msgText.append("\n\nAlgorithm Rating:\n");
                            msgText.append(rating);
                            msgText.append("\n\nDev Rating:\n");
                            msgText.append(devRating);
                            msgText.append("\n\nDesign Rating:\n");
                            msgText.append(desRating);
                            msgText.append("\n\n").append("http://");
                            msgText.append(ApplicationServer.SERVER_NAME);
                            msgText.append("/stat?c=member_profile&cr=");
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
                            if (desRating == 0&&phase.equals(String.valueOf(SoftwareComponent.DESIGN_PHASE))) {
                                    respBody.append("Since you do not have a component design rating, it is unlikely that ");
                                    respBody.append("you will be chosen to work on this application.  You may look at ");
                                    respBody.append("the current component design opportunities here ");
                                    respBody.append("http://");
                                    respBody.append(ApplicationServer.SERVER_NAME);
                                    respBody.append("/?t=development&c=comp_projects\n\n");
                            } else if (devRating == 0&&phase.equals(String.valueOf(SoftwareComponent.DEV_PHASE))) {
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
                    }
                } else {
                    requiresLogin = true;
                }
            } else if (command.equals("tcs_team_app_send")) {
                if (nav.isLoggedIn()) {

                    devTag.addTag(new ValueTag("Project", project));

                    //String handle = nav.getUser().getHandle();
                    String handle = nav.getSessionInfo().getHandle();
                    devTag.addTag(new ValueTag("handle", handle));

                    Data.loadUser(nav);
                    String from = nav.getUser().getEmail();
                    String to = Conversion.checkNull(request.getParameter("To"));
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
                            ResultSetContainer appRsc = (ResultSetContainer)appDai.getData(r).get("Coder_Data");

                            int devRating = Integer.parseInt(appRsc.getItem(0, "development_rating").getResultData()==null
                                    ?"0":String.valueOf(appRsc.getIntItem(0, "development_rating")));
                            int desRating = Integer.parseInt(appRsc.getItem(0, "design_rating").getResultData()==null
                                    ?"0":String.valueOf(appRsc.getIntItem(0, "design_rating")));

                            msgText.append("\n\nAlgorithm Rating:\n");
                            msgText.append(rating);
                            msgText.append("\n\nDev Rating:\n");
                            msgText.append(devRating);
                            msgText.append("\n\nDesign Rating:\n");
                            msgText.append(desRating);
                            msgText.append("\n\n").append("http://");
                            msgText.append(ApplicationServer.SERVER_NAME);
                            msgText.append("/stat?c=member_profile&cr=");
                            msgText.append(nav.getUserId());
                            msgText.append("\n");

                            mail.setBody(msgText.toString());
                            xsldocURLString = XSL_DIR + "inquiry_teamp_app.xsl";
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
                            respBody.append(" Team Application Project.  Since this is a team project, please remember that ");
                            respBody.append("if you registered without providing the TopCoder handle of a teammate, we will ");
                            respBody.append("assume that you are looking for TopCoder to assign a teammate for you.  If this ");
                            respBody.append("is not correct, you may reply to this email with the TopCoder handle of your ");
                            respBody.append("teammate.\n\n");
                            respBody.append("In addition, if you are not familiar with the TopCoder Team Application process, ");
                            respBody.append("please read this information: ");
                            respBody.append("http://");
                            respBody.append(ApplicationServer.SERVER_NAME);
                            respBody.append("/?t=development&c=app_team_meth");
                            respBody.append("\n\n");
                            respBody.append("Please note the deadline for proposal submissions, as this is the first ");
                            respBody.append("deliverable in the new Team Application process.\n\n");
                            respBody.append("Access to all of the project specification documentation will be provided to ");
                            respBody.append("you shortly.\n\n");
                            respBody.append("We will contact you in the near future to ensure that you plan to participate ");
                            respBody.append("in the proposal phase of this application project.\n\n");

                            respBody.append("TopCoder Software Service");
                            resp.setBody(respBody.toString());
                            EmailEngine.send(resp);

                } else {
                    requiresLogin = true;
                }
            } else if (command.length() > 0 && !request.getParameter("t").equals("app")) {
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
            log.debug(e.getMessage());
            e.printStackTrace();
            StringBuffer msg = new StringBuffer(150);
            msg.append("TaskDevelopment:process:");
            msg.append(":ERROR:\n");
            msg.append(e.getMessage());
            throw new NavigationException(msg.toString(), TCServlet.INTERNAL_ERROR_PAGE);
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
    private static boolean tcoTermsCheck(long userId) throws Exception {
        Calendar c = Calendar.getInstance();

        if(c.before(new GregorianCalendar(2004, 7, 10)) || c.after(new GregorianCalendar(2004, 9, 23)))
        {
            return true;
        }

        boolean ret = false;
        InitialContext ctx = TCContext.getInitial();
        try {
            UserTermsOfUse userTerms = (UserTermsOfUse)BaseProcessor.createEJB(ctx, UserTermsOfUse.class);
            ret = userTerms.hasTermsOfUse(userId, Constants.TCO04_COMPONENT_TERMS_OF_USE_ID, DBMS.OLTP_DATASOURCE_NAME);
        } finally {
            BaseProcessor.close(ctx);
        }

        return ret;
    }

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
        if(rsc.getItem(0, "design_rating").getResultData() == null)
        {
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
        if(rsc.getItem(0, "development_rating").getResultData() == null)
        {
            return 0;
        } else {
            return rsc.getIntItem(0, "development_rating");
        }
    }

    static ComponentManager getComponentManager(long componentId) {

        ComponentManager componentMgr = null;
        try {
            Context CONTEXT = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.TCS_APP_SERVER_URL);
            Object objTechTypes = CONTEXT.lookup("ComponentManagerEJB");
            ComponentManagerHome home = (ComponentManagerHome) PortableRemoteObject.narrow(objTechTypes, ComponentManagerHome.class);
            componentMgr = home.create(componentId);
        } catch (javax.naming.NamingException namingException) {
            log.error("Could not create context: " + namingException.getMessage());
        } catch (javax.ejb.CreateException createException) {
            log.error("Could not create component Manager: " + createException.getMessage());
        } catch (java.rmi.RemoteException remoteException) {
            log.error("Could not create component Manager: " + remoteException.getMessage());
        }
        return componentMgr;
    }

    static ComponentManager getComponentManager(long componentId, long version) {

        ComponentManager componentMgr = null;
        try {
            Context CONTEXT = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.TCS_APP_SERVER_URL);
            Object objTechTypes = CONTEXT.lookup("ComponentManagerEJB");
            ComponentManagerHome home = (ComponentManagerHome) PortableRemoteObject.narrow(objTechTypes, ComponentManagerHome.class);
            componentMgr = home.create(componentId, version);
        } catch (javax.naming.NamingException namingException) {
            log.error("Could not create context: " + namingException.getMessage());
        } catch (javax.ejb.CreateException createException) {
            log.error("Could not create component Manager: " + createException.getMessage());
        } catch (java.rmi.RemoteException remoteException) {
            log.error("Could not create component Manager: " + remoteException.getMessage());
        }
        return componentMgr;
    }

    static Catalog getCatalog() {

        Catalog catalog = null;
        try {
            Context CONTEXT = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.TCS_APP_SERVER_URL);
            Object objTechTypes = CONTEXT.lookup("CatalogEJB");
            CatalogHome home = (CatalogHome) PortableRemoteObject.narrow(objTechTypes, CatalogHome.class);
            catalog = home.create();

        } catch (javax.naming.NamingException namingException) {
            log.error("Could not create context: " + namingException.getMessage());
        } catch (javax.ejb.CreateException createException) {
            log.error("Could not create catalog: " + createException.getMessage());
        } catch (java.rmi.RemoteException remoteException) {
            log.error("Could not create catalog: " + remoteException.getMessage());
        }
        return catalog;
    }


}
