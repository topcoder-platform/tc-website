/*
 * Copyright (C) 2004 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.contest;

import java.io.FileOutputStream;
import java.io.IOException;
import java.rmi.RemoteException;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Map;
import java.util.TimeZone;

import javax.ejb.CreateException;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.transaction.Status;
import javax.transaction.TransactionManager;

import com.topcoder.dde.catalog.ComponentManager;
import com.topcoder.dde.catalog.ComponentManagerHome;
import com.topcoder.dde.user.UserManagerRemote;
import com.topcoder.dde.user.UserManagerRemoteHome;
import com.topcoder.randomstringimg.InvalidConfigException;
import com.topcoder.randomstringimg.ObfuscationException;
import com.topcoder.randomstringimg.RandomStringImage;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.util.format.ObjectFormatter;
import com.topcoder.util.format.ObjectFormatterFactory;
import com.topcoder.util.spell.ConfigException;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.tag.CalendarDateFormatMethod;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.ejb.project.Project;
import com.topcoder.web.ejb.project.ProjectLocal;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.development.Base;

/**
 * <p><strong>Purpose</strong>: This processor handle registration to a specific project.</p>
 *
 * <p>
 *   Version 1.1 (Studio Coding In Online Review) Change notes:
 *   <ol>
 *     <li>Added support for new UI Prototype, RIA Build and RIA Component competitions.</li>
 *   </ol>
 *
 *   Version 1.2 (Testing Competition Split Release Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Updated Application Testing to Test Suites</li>
 *     <li>Added support for new Test Scenarios competitions</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.3 (Configurable Contest Terms Release Assembly v1.0) Change notes:
 *   <ol>
 *     <li>Added new functionality that asks for several terms of use and show those the user already agreed to.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.4 (Configurable Contest Terms Release Assembly v2.0) Change notes:
 *   <ol>
 *     <li>Fixed bug where captcha was shown in each terms of use step.</li>
 *     <li>Added sort order to displayed terms of use.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.5 (Content Creation Contest Online Review and TC Site Integration Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Updated {@link #register()} method.</li>
 *   </ol>
 * </p>
 * 
 * <p>
 *   Version 1.6 (Add Reporting Contest Type) Change notes:
 *   <ol>
 *     <li>Updated {@link #register()} method.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.7 (TopCoder Terms of Use Management Refactoring v1.0) Change notes:
 *   <ol>
 *     <li>Updated {@link #developmentProcessing()} to handle the case that the user have just agreed a dependent terms of use.</li>
 *   </ol>
 * </p>
 * 
 * @author dok, pulky, FireIce, lmmortal, TCSASSEMBER
 * @version 1.7
 */
public class Register extends ViewRegistration {

    /**
     * This method is the final processor for the request
     *
     * @throws TCWebException if any error occurs
     * @see com.topcoder.web.tc.controller.request.development.Base#developmentProcessing()
     */
    protected void developmentProcessing() throws TCWebException {

        try {
            if (!SecurityHelper.hasPermission(getLoggedInUser(), new ClassResource(this.getClass()))) {
                throw new PermissionException(getLoggedInUser(), new ClassResource(this.getClass()));
            }

            validation();

            String projectId = getRequest().getParameter(Constants.PROJECT_ID);
            getRequest().setAttribute(Constants.PROJECT_ID, projectId);

            String termsOfUseId = StringUtils.checkNull(getRequest().getParameter(Constants.TERMS_OF_USE_ID));

            long userId = getLoggedInUser().getId();
            if (!"".equals(termsOfUseId)) {
                boolean agreed = "on".equals(getRequest().getParameter(Constants.TERMS_AGREE));
                if (agreed) {
                    if (log.isDebugEnabled()) {
                        log.debug("they agree to terms");
                    }
                    
                    // save user terms of use record
                    saveUserTermsOfUse(userId, Long.parseLong(termsOfUseId));
                    if (hasPrePendingTerm("ViewRegistration")) {
                        // the user has just agreed a dependent terms of use, the page need redirect to the dependency terms of use
                        return;
                    }
                } else {
                    addError(Constants.TERMS_AGREE, "You must agree to the terms in order to proceed.");
                }
                
                // process terms of use
                boolean hasMoreTerms = processTermsOfUse(projectId, userId, Base.SUBMITTER_ROLE_IDS, Long.parseLong(termsOfUseId));
                if (!hasMoreTerms) {
                    //we're assuming that if we're here, we got a valid project id
                    loadCaptcha();
                }
                getRequest().setAttribute("showCaptcha", !hasMoreTerms);

                setDefault(Constants.PROJECT_ID, getRequest().getParameter(Constants.PROJECT_ID));
                setNextPage("/contest/regTerms.jsp");
                setIsNextPageInContext(true);
            } else {
                // make sure they don't have pending terms of use (they could get here faking the URL)
                if (!answeredCaptchaCorrectly()) {
                    addError(Constants.CAPTCHA_RESPONSE, "Sorry, your response was incorect.");
                }
                if (processTermsOfUse(projectId, userId, Base.SUBMITTER_ROLE_IDS, -1) || hasErrors()) {
                    setDefault(Constants.PROJECT_ID, getRequest().getParameter(Constants.PROJECT_ID));
                     loadCaptcha();
                    setNextPage("/contest/regTerms.jsp");
                    setIsNextPageInContext(true);
                    return;
                }

                boolean isEligible = getRequest().getAttribute(Constants.MESSAGE) == null;
                if (isEligible) {
                    if (log.isDebugEnabled()) {
                        log.debug("they are eligible");
                    }
                    register();
                    setNextPage("/contest/regSuccess.jsp");
                    setIsNextPageInContext(true);
                } else {
                    setNextPage("/contest/message.jsp");
                    setIsNextPageInContext(true);
                }
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Throwable e) {
            throw new TCWebException(e);
        }
    }

    protected void loadCaptcha() throws IOException, InvalidConfigException, ObfuscationException, ConfigException {
        RandomStringImage rsi = new RandomStringImage(Constants.RANDOM_STRING_IMAGE_CONFIG);

        String fileName = getUser().getId() + "_" + System.currentTimeMillis() + ".png";
        FileOutputStream fos = new FileOutputStream(Constants.CAPTCHA_PATH + fileName);
        //so, i'm using the dictionary here because you can't use this component without configuring
        //a dictionary, i went to the effort of getting one, so might as well use it.
        //i'd rather just use a random string, but then i would need a keygenerator component
        //to do that, so i'll just use the dictionary
        String word = rsi.generateRandomFromDictionaries(fos);
        fos.close();
        getRequest().getSession().setAttribute(Constants.CAPTCHA_WORD, word);
        getRequest().setAttribute(Constants.CAPTCHA_FILE_NAME, fileName);
    }

    private boolean answeredCaptchaCorrectly() throws NavigationException {
        String response = StringUtils.checkNull(getRequest().getParameter(Constants.CAPTCHA_RESPONSE));
        String word = (String)getRequest().getSession().getAttribute(Constants.CAPTCHA_WORD);
        if (word==null) {
            throw new NavigationException("Sorry, your session has expired, please start your registration again.");
        } else {
            return word.compareToIgnoreCase(response.trim())==0;
        }
    }

    /**
     * <p>This helper method registers a user to a project.</p>
     *
     * @throws CreateException if the underlying service fails to be created.
     * @throws RemoteException if the underlying service fails to execute.
     * @throws Exception if any other error occurs while performing registration.
     */
    private void register() throws Exception, RemoteException, CreateException {
        InitialContext ctx = null;
        try {
            long projectId = Long.parseLong(getRequest().getParameter(Constants.PROJECT_ID));
            ProjectLocal pl = (ProjectLocal) createLocalEJB(getInitialContext(), Project.class);
            long componentId = pl.getComponentId(projectId, DBMS.TCS_OLTP_DATASOURCE_NAME);

            ctx = TCContext.getContext(ApplicationServer.JNDI_FACTORY, ApplicationServer.TCS_APP_SERVER_URL);
            if (log.isDebugEnabled()) {
                log.debug("context: " + ctx.getEnvironment().toString());
            }

            Object objComponentManager = ctx.lookup(ComponentManagerHome.EJB_REF_NAME);
            ComponentManagerHome componentManagerHome =
                    (ComponentManagerHome) PortableRemoteObject.narrow(objComponentManager, ComponentManagerHome.class);
            ComponentManager componentManager = componentManagerHome.create(componentId);
            String project = componentManager.getComponentInfo().getName();

            if (String.valueOf(projectTypeId).equals(String.valueOf(Constants.ASSEMBLY_PROJECT_TYPE))) {
                project += " Assembly Project";
            } else if (String.valueOf(projectTypeId).equals(String.valueOf(Constants.COMPONENT_TESTING_PROJECT_TYPE))) {
                project += " Component Testing Project";
            } else if (String.valueOf(projectTypeId).equals(String.valueOf(Constants.TEST_SUITES_PROJECT_TYPE))) {
                project += " Test Suites Project";
            } else if (String.valueOf(projectTypeId).equals(String.valueOf(Constants.TEST_SCENARIOS_PROJECT_TYPE))) {
                project += " Test Scenarios Project";
            } else if (String.valueOf(projectTypeId).equals(String.valueOf(Constants.UI_PROTOTYPE_PROJECT_TYPE))) {
                project += " UI Prototype Project";
            } else if (String.valueOf(projectTypeId).equals(String.valueOf(Constants.RIA_BUILD_PROJECT_TYPE))) {
                project += " RIA Build Project";
            } else if (String.valueOf(projectTypeId).equals(String.valueOf(Constants.RIA_COMPONENT_PROJECT_TYPE))) {
                project += " RIA Component Project";
            } else if (String.valueOf(projectTypeId).equals(String.valueOf(Constants.CONTENT_CREATION_PROJECT_TYPE))) {
                project += " Content Creation Project";
            } else if (String.valueOf(projectTypeId).equals(String.valueOf(Constants.REPORTING_PROJECT_TYPE))) {
                project += " Reporting Project";
            }

            long activeForumCategoryId = componentManager.getActiveForumCategory().getId();

            if (log.isDebugEnabled()) {
                log.debug("creating user: " + UserManagerRemoteHome.EJB_REF_NAME);
            }
            Object objUserManager = ctx.lookup(UserManagerRemoteHome.EJB_REF_NAME);
            UserManagerRemoteHome userManagerHome =
                    (UserManagerRemoteHome) PortableRemoteObject.narrow(objUserManager, UserManagerRemoteHome.class);
            UserManagerRemote userManager = userManagerHome.create();

            TransactionManager tm = (TransactionManager) getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);

            try {
                tm.begin();
                userManager.registerForProject(getUser().getId(), getRequest().getParameter("Comment"), projectId);
                tm.commit();
            } catch (Exception e) {
                if (tm != null && (tm.getStatus() == Status.STATUS_ACTIVE || tm.getStatus() == Status.STATUS_MARKED_ROLLBACK)) {
                    tm.rollback();
                }
                throw e;
            }

            TCSEmailMessage mail = new TCSEmailMessage();
            Email e = (Email) createEJB(getInitialContext(), Email.class);
            mail.addToAddress(e.getAddress(e.getPrimaryEmailId(getUser().getId(), DBMS.OLTP_DATASOURCE_NAME),
                    DBMS.OLTP_DATASOURCE_NAME), TCSEmailMessage.TO);
            mail.setFromAddress("service@topcodersoftware.com");
            mail.setSubject(project);

            Request r = new Request();
            r.setContentHandle("project_detail");
            r.setProperty(Constants.PROJECT_ID, String.valueOf(projectId));
            Map resultMap = getDataAccess().getData(r);
            ResultSetContainer details = (ResultSetContainer) resultMap.get("project_detail");
            Timestamp submitDeadline = (Timestamp) details.getItem(0, "initial_submission_date").getResultData();
            Calendar cal = Calendar.getInstance();
            cal.setTime(submitDeadline);
            cal.setTimeZone(TimeZone.getDefault());

            ObjectFormatter formatter = ObjectFormatterFactory.getEmptyFormatter();
            formatter.setFormatMethodForClass(Calendar.class,
                    new CalendarDateFormatMethod("MM.dd.yyyy HH:mm a z"), true);
            String date = formatter.format(cal);

            if (String.valueOf(projectTypeId).equals(Constants.ASSEMBLY_PROJECT_TYPE)) {
                mail.setBody(getUser().getUserName() + ", \n\nRegistration Complete. \n\n" +
                        "Thank you, for your interest in the " + project + ". You now have access to the Discussion Forum ( http://" + ApplicationServer.FORUMS_SERVER_NAME + "/?module=Category&categoryID=" + activeForumCategoryId + " ) which can be used to obtain documentation, as well as to ask questions regarding the project. Please post your questions at any time and a product manager will respond within 24 hours. Any questions asked within 6 hours of the submission due date/time may not be answered in time, so get your questions in early!\n\n" +
                        "The deadline for submitting a solution is " + date + ". Please upload your submission using the project page found here: http://" + ApplicationServer.SOFTWARE_SERVER_NAME + "/review.  If you encounter any problems, please contact us at service@topcodersoftware.com.  All late submissions will be ignored.\n\n" +
                        "Please use these forums to form your team:\n" +
                        "http://" + ApplicationServer.FORUMS_SERVER_NAME + "/?module=Category&categoryID=19.\n\n" +
                        "If you have any questions please contact service@topcodersoftware.com\n\n" +
                        "TopCoder Software Team");
            } else {
                mail.setBody(getUser().getUserName() + ", \n\nRegistration Complete. \n\n" +
                        "Thank you, for your interest in the " + project + ". You now have access to the Discussion Forum ( http://" + ApplicationServer.FORUMS_SERVER_NAME + "/?module=Category&categoryID=" + activeForumCategoryId + " ) which can be used to obtain documentation, as well as to ask questions regarding the project. Please post your questions at any time and a product manager will respond within 24 hours. Any questions asked within 6 hours of the submission due date/time may not be answered in time, so get your questions in early!\n\n" +
                        "The deadline for submitting a solution is " + date + ". Please upload your submission using the project page found here: http://" + ApplicationServer.SOFTWARE_SERVER_NAME + "/review.  If you encounter any problems, please contact us at service@topcodersoftware.com.  All late submissions will be ignored.\n\n" +
                        "If you have any questions please contact service@topcodersoftware.com\n\n" +
                        "TopCoder Software Team");
            }

            EmailEngine.send(mail);

        } finally {
            close(ctx);
        }
    }
}