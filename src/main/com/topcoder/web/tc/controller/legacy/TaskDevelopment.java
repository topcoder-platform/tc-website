package com.topcoder.web.tc.controller.legacy;


import com.topcoder.common.web.constant.TCServlet;
import com.topcoder.common.web.data.CoderRegistration;
import com.topcoder.common.web.data.Navigation;
import com.topcoder.common.web.data.report.Constants;
import com.topcoder.common.web.data.report.Query;
import com.topcoder.common.web.error.NavigationException;
import com.topcoder.common.web.util.Conversion;
import com.topcoder.common.web.util.Data;
import com.topcoder.common.web.xml.HTMLRenderer;
import com.topcoder.common.web.data.User;
import com.topcoder.security.NoSuchUserException;
import com.topcoder.security.RolePrincipal;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.ValueTag;
import com.topcoder.shared.docGen.xml.XMLDocument;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.security.PathResource;

import com.topcoder.dde.catalog.Catalog;
import com.topcoder.dde.catalog.CatalogException;
import com.topcoder.dde.catalog.CatalogHome;
import com.topcoder.dde.catalog.ComponentInfo;
import com.topcoder.dde.catalog.ComponentManagerHome;
import com.topcoder.dde.catalog.ComponentManager;
import com.topcoder.dde.catalog.ComponentSummary;
import com.topcoder.dde.catalog.ComponentVersionInfo;
import com.topcoder.dde.catalog.Document;
import com.topcoder.dde.catalog.Technology;
import com.topcoder.dde.user.RegistrationInfo;
import com.topcoder.dde.forum.DDEForumHome;
import com.topcoder.dde.forum.DDEForum;
import com.topcoder.dde.user.UserManagerRemoteHome;
import com.topcoder.dde.user.UserManagerRemote;
import com.topcoder.dde.user.PricingTier;
import com.topcoder.web.common.PermissionException;

import javax.rmi.PortableRemoteObject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.naming.Context;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.Map;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.text.DateFormat;

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
        String cacheKey = null;
        try {
            String command = Conversion.checkNull(request.getParameter("c"));
            log.debug("Initial command is: " + command);
            boolean requiresLogin = false;
            RecordTag devTag = new RecordTag("DEVELOPMENT");
            String comp = Conversion.checkNull(request.getParameter("comp"));
            devTag.addTag(new ValueTag("comp", comp));
            String date = Conversion.checkNull(request.getParameter("date"));
            String payment = Conversion.checkNull(request.getParameter("payment"));

            String xsldocURLString = null;
            String project = Conversion.checkNull(request.getParameter("Project"));
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

            devTag.addTag(new ValueTag("date", date));
            devTag.addTag(new ValueTag("version", request.getParameter("version")));
            devTag.addTag(new ValueTag("tco", request.getParameter("tco")));
            devTag.addTag(new ValueTag("phase", request.getParameter("phase")));
            devTag.addTag(new ValueTag("posting_date", request.getParameter("posting_date")));
            devTag.addTag(new ValueTag("initial_submission", request.getParameter("initial_submission")));
            devTag.addTag(new ValueTag("final_submission", request.getParameter("final_submission")));
            devTag.addTag(new ValueTag("winner_announced", request.getParameter("winner_announced")));
            devTag.addTag(new ValueTag("estimated_dev", request.getParameter("estimated_dev")));
            devTag.addTag(new ValueTag("compvers", request.getParameter("compvers")));


            if (command.equals("inquire")) {
                if (nav.isLoggedIn()) {
                    String to = Conversion.checkNull(request.getParameter("To"));
                    devTag.addTag(new ValueTag("ProjectName", project));
                    devTag.addTag(new ValueTag("Project", project));
                    devTag.addTag(new ValueTag("To", to));
                    xsldocURLString = XSL_DIR + command + ".xsl";
                } else {
                    requiresLogin = true;
                }
            }
            /********************** tcs_inquire *******************/
            else if (command.equals("tcs_inquire") || command.equals("tcs_app_inquire")) {
                if (nav.isLoggedIn()) {
                    Request dataRequest = null;
                    ResultSetContainer rsc = null;
                    Map resultMap = null;
                    log.debug("getting dai");
                    dataRequest = new Request();
                    dataRequest.setContentHandle("open_projects");

                    DataAccessInt dai = new DataAccess(
                                    dataRequest.getProperty(Constants.DB_KEY, Query.TCS_CATALOG));
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
                    String handle = nav.getSessionInfo().getHandle();
                    devTag.addTag(new ValueTag("ProjectName", project));
                    devTag.addTag(new ValueTag("Project", project));
                    devTag.addTag(new ValueTag("To", to));
                    xsldocURLString = XSL_DIR + command + ".xsl";
                } else {
                    requiresLogin = true;
                }
            }
            /********************** tcs_inquire-design *******************/
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

                    DataAccessInt dai = new DataAccess(
                                    dataRequest.getProperty(Constants.DB_KEY, Query.TCS_CATALOG));
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
            /********************** send *******************/
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
                    User user = nav.getUser();
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
            } else if (command.equals("comp_archive")) {
                Request dataRequest = null;
                ResultSetContainer rsc = null;
                Map resultMap = null;
                log.debug("getting dai");
                dataRequest = new Request();
                dataRequest.setContentHandle("open_projects");

                DataAccessInt dai = new DataAccess(
                                dataRequest.getProperty(Constants.DB_KEY, Query.TCS_CATALOG));
                log.debug("got dai");

                resultMap = dai.getData(dataRequest);
                log.debug("got map");
                rsc = (ResultSetContainer) resultMap.get("Retrieve open projects");


                ResultSetContainer rscStatus = null;
                resultMap = null;
                dataRequest = new Request();
                dataRequest.setContentHandle("project_status");

                dai = new DataAccess(
                                dataRequest.getProperty(Constants.DB_KEY, Query.TCS_CATALOG));

                resultMap = dai.getData(dataRequest);
                log.debug("got map");
                rscStatus = (ResultSetContainer) resultMap.get("project_status");

                devTag.addTag(rsc.getTag("projects", "project"));
                devTag.addTag(rscStatus.getTag("reviews", "status"));
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

                DataAccessInt dai = new DataAccess(
                                dataRequest.getProperty(Constants.DB_KEY, Query.TCS_CATALOG));
                log.debug("got dai");

                resultMap = dai.getData(dataRequest);
                log.debug("got map");
                rsc = (ResultSetContainer) resultMap.get("Retrieve open projects");

                log.debug("got rsc");
                if (rsc == null)
                    log.debug("rsc is null");
                devTag.addTag(rsc.getTag("projects", "project"));

                if (nav.isLoggedIn()) {
                    String version = Conversion.checkNull(request.getParameter("version"));
                    String phase = Conversion.checkNull(request.getParameter("phase"));
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

                        Context CONTEXT = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.TCS_APP_SERVER_URL);


                        com.topcoder.security.UserPrincipal selectedPrincipal = null;

                        //get principal manager
                        Object objPrincipalManager = CONTEXT.lookup("security/PrincipalMgr");
                        PrincipalMgrRemoteHome principalManagerHome = (PrincipalMgrRemoteHome) PortableRemoteObject.narrow(objPrincipalManager, PrincipalMgrRemoteHome.class);
                        PrincipalMgrRemote PRINCIPAL_MANAGER = principalManagerHome.create();


                        //get forum object
                        DDEForumHome ddeforumhome = (DDEForumHome) PortableRemoteObject.narrow(CONTEXT.lookup("dde/DDEForum"), DDEForumHome.class);
                        DDEForum ddeforum = ddeforumhome.create();

                        //retrieve the coder registration information
                        log.debug("terms: " + Conversion.checkNull(request.getParameter("terms")));


                        log.debug("creating user");
                        Object objUserManager = CONTEXT.lookup("dde/UserManager");
                        UserManagerRemoteHome userManagerHome = (UserManagerRemoteHome) PortableRemoteObject.narrow(objUserManager, UserManagerRemoteHome.class);
                        UserManagerRemote USER_MANAGER = userManagerHome.create();

                        try {
                            selectedPrincipal = PRINCIPAL_MANAGER.getUser(handle);
                            userId = selectedPrincipal.getId();
                            PricingTier pt = new PricingTier(1, 5.0);
                            log.debug("got user");
                        } catch (NoSuchUserException noSuchUserException) {
                            log.error("noSuchUserException: " + handle + noSuchUserException);
                            throw noSuchUserException;

                        } catch (Exception e) {
                            throw e;

                        }

                        long componentId = Long.parseLong(request.getParameter("comp"));


                        //add the user to the appropriate role to view the specification
                        java.util.HashSet rolesSet = (java.util.HashSet) PRINCIPAL_MANAGER.getRoles(null);
                        RolePrincipal[] roles = (RolePrincipal[]) rolesSet.toArray(new RolePrincipal[0]);
                        //String formattedProject = project.substring(0, project.lastIndexOf(' ')-1);

                        log.debug("phase: " + phase);
                        log.debug("version: " + version);
                        USER_MANAGER.registerInquiry(userId, componentId, rating, (new Integer(nav.getUser().getUserId())).longValue(), comment, agreedToTerms, Long.parseLong(phase), Long.parseLong(version));



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
                                            RolePrincipal roleToAdd = roles[i];
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

                        if (!permissionAdded ) {

                            log.error("Could not find a match for the specific forum");
                        }


                        TCSEmailMessage mail = new TCSEmailMessage();
                        log.debug("from: " + from);
                        mail.addToAddress(from, TCSEmailMessage.TO);
                        mail.setFromAddress(to);
                        mail.setSubject(project);


                        xsldocURLString = XSL_DIR + "inquiry_sent_pos.xsl";

                            if (Long.parseLong(phase) == ComponentVersionInfo.SPECIFICATION) {
                                mail.setBody("Your inquiry has been received. Thank You!\r\n\r\n" +
                                        "Thank you, " + handle + ", for your interest in the " + project + " component. You now have access to the Developer Forum ( http://software.topcoder.com/pages/c_forum.jsp?f=" + activeForumId + " ) which can be used to obtain design documentation (see the Design Phase Documents thread), as well as to ask questions regarding the component design. Please post your questions at any time and a product manager will respond within 24 hours. Any questions asked within 6 hours of the submission due date/time may not be answered in time, so get your questions in early!\r\n\r\n" +
                                        "The deadline for submitting a solution is " + date + " at 11:59 PM EST. Please upload your design using the project page found here: http://www.topcoder.com/index?t=development&c=comp_projects.  If you encounter any problems, please contact us at service@topcodersoftware.com.  All late submissions will be ignored.  Also, a reminder that this is a competition, and only the top three designers will receive payment.\r\n\r\n" +
                                        "If you have any questions please contact service@topcodersoftware.com\r\n\r\n" +
                                        "TopCoder Software Team");

                            } else {

                                mail.setBody("Your inquiry has been received. Thank You!\r\n\r\n" +
                                        "Thank you, " + handle + ", for your interest in the " + project + " component. You now have access to the Developer Forum ( http://software.topcoder.com/pages/c_forum.jsp?f=" + activeForumId + " ) which can be used to obtain the component design (See \"Development Phase Documents\" thread), as well as to ask questions regarding the development process or the component design. Please post your questions at any time and the component designer will respond within 24 hours. Any questions asked within 6 hours of the submission due date/time may not be answered, so get your questions in early!\r\n\r\n" +
                                        "The deadline for submitting a solution is " + date + " at 11:59 PM EST. Please upload your solution using the project page found here: http://www.topcoder.com/index?t=development&c=comp_projects. If you encounter any problems, please contact us at service@topcodersoftware.com.  Any late submissions will be ignored. Also, a reminder that this is a competition, and only the top three developers will receive payment.\r\n\r\n" +
                                        "If you have any questions please contact service@topcodersoftware.com\r\n\r\n" +
                                        "TopCoder Software Team");
                            }
                            EmailEngine.send(mail);

                        
                    } else {
                        TCSEmailMessage mail = new TCSEmailMessage();
                        mail.addToAddress(to, TCSEmailMessage.TO);
                        mail.setFromAddress(from);

                        mail.setSubject("APPLICATION: " + project + " -- " + handle);
                        msgText.append("\n\nRating: ");
                        msgText.append(rating);
                        mail.setBody(msgText.toString());

                        xsldocURLString = XSL_DIR + "inquiry_app.xsl";
                        EmailEngine.send(mail);

                    }
                } else {
                    requiresLogin = true;
                }
            } else if (command.length() > 0 && !request.getParameter("t").equals("app")) {
                /********** SHOULD BE A FUNCTION ****************/
                Request dataRequest = null;
                ResultSetContainer rsc = null;
                Map resultMap = null;
                log.debug("getting dai");
                dataRequest = new Request();
                dataRequest.setContentHandle("open_projects");

                DataAccessInt dai = new DataAccess(
                                dataRequest.getProperty(Constants.DB_KEY, Query.TCS_CATALOG));
                log.debug("got dai");

                resultMap = dai.getData(dataRequest);
                log.debug("got map");
                rsc = (ResultSetContainer) resultMap.get("Retrieve open projects");

                log.debug("got rsc");
                if (rsc == null)
                    log.debug("rsc is null");
                devTag.addTag(rsc.getTag("projects", "project"));

                DataAccessInt tcsDai = new CachedDataAccess(Query.TCS_CATALOG);
                dataRequest = new Request();
                dataRequest.setContentHandle("project_totals");
                resultMap = tcsDai.getData(dataRequest);
                rsc = (ResultSetContainer) resultMap.get("total_component_prices");
                devTag.addTag(rsc.getTag("Project", "Total"));


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
