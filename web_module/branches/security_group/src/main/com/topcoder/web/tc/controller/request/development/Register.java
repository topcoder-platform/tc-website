/*
 * Copyright (C) 2004 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.development;

import java.io.FileOutputStream;
import java.io.IOException;
import java.rmi.RemoteException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.TimeZone;

import javax.ejb.CreateException;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.transaction.Status;
import javax.transaction.TransactionManager;

import com.topcoder.dde.catalog.ComponentManager;
import com.topcoder.dde.catalog.ComponentManagerHome;
import com.topcoder.dde.catalog.ComponentVersionInfo;
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
import com.topcoder.web.common.model.Answer;
import com.topcoder.web.common.model.Question;
import com.topcoder.web.common.model.SurveyResponse;
import com.topcoder.web.common.tag.AnswerInput;
import com.topcoder.web.common.tag.CalendarDateFormatMethod;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.ejb.project.Project;
import com.topcoder.web.ejb.project.ProjectLocal;
import com.topcoder.web.tc.Constants;

/**
 * <p><strong>Purpose</strong>: This processor handle requests to register to a specific design or development
 * project.</p>
 *
 * <p>
 *   Version 1.1 (Configurable Contest Terms Release Assembly v1.0) Change notes:
 *   <ol>
 *     <li>Added new functionality that asks for several terms of use and show those the user already agreed to.</li>
 *   </ol>
 * </p>
 * <p>
 *   Version 1.2 (Configurable Contest Terms Release Assembly v2.0) Change notes:
 *   <ol>
 *     <li>Added sort order to displayed terms of use.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.3 (TopCoder Terms of Use Management Refactoring v1.0) Change notes:
 *   <ol>
 *     <li>Updated {@link #developmentProcessing()} to handle the case that the user have just agreed a dependent terms of use.</li>
 *   </ol>
 * </p>
 * 
 * @author dok, pulky, TCSASSEMBER
 * @version 1.3
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
            loadPhase();

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

                    if (hasTermsOfUseBan(userId, Long.parseLong(termsOfUseId))) {
                        addError(Constants.TERMS_AGREE, "Sorry, you can not agree to this terms of use.");
                    } else {
                        // save user terms of use record
                        saveUserTermsOfUse(userId, Long.parseLong(termsOfUseId));
                        if (hasPrePendingTerm("ViewProjectRegistration")) {
                            // the user has just agreed a dependent terms of use, the page need redirect to the dependency terms of use
                            return;
                        }
                    }

                    // get survey
                    getRequest().setAttribute("questionInfo", getQuestions());
                } else {
                    addError(Constants.TERMS_AGREE, "You must agree to the terms in order to proceed.");
                }
                
                // process terms of use
                boolean hasMoreTerms = processTermsOfUse(projectId, userId, Base.SUBMITTER_ROLE_IDS, Long.parseLong(termsOfUseId));
                if (!hasMoreTerms) {
                    //we're assuming that if we're here, we got a valid project id
                    loadCaptcha();
                }

                setDefault(Constants.PROJECT_ID, getRequest().getParameter(Constants.PROJECT_ID));
                setNextPage("/contest/regTerms.jsp");
                setIsNextPageInContext(true);
            } else {
                // make sure they don't have pending terms of use (they could get here faking the URL)
                if (processTermsOfUse(projectId, userId, Base.SUBMITTER_ROLE_IDS, -1)) {
                    setDefault(Constants.PROJECT_ID, getRequest().getParameter(Constants.PROJECT_ID));
                    loadCaptcha();
                    setNextPage("/contest/regTerms.jsp");
                    setIsNextPageInContext(true);
                    return;
                }

                List responses = validateSurvey();
                
                if (!answeredCaptchaCorrectly()) {
                    addError(Constants.CAPTCHA_RESPONSE, "Sorry, your response was incorect.");
                }


                boolean bother = true;

                // only bother if the user is not a professional (tccc)
                // comment this line if not needed
                // bother = !CoderType.PROFESSIONAL.equals(DAOUtil.getFactory().getCoderDAO().find(new Long(getUser().getId())).getCoderType().getId());
                log.debug("Bother: " + bother);

                // Coder c = (Coder) createEJB(getInitialContext(), Coder.class);
                // boolean isStudent = c.getCoderTypeId(getUser().getId(), DBMS.OLTP_DATASOURCE_NAME) == 1;


                if (!hasErrors()) {
                    if (log.isDebugEnabled()) {
                        log.debug("there are no errors");
                    }
                    getRequest().getSession().setAttribute("responses", responses);
                    boolean isEligible = getRequest().getAttribute(Constants.MESSAGE) == null;
                    if (isEligible) {
                        if (log.isDebugEnabled()) {
                            log.debug("they are eligible");
                        }
    /*
                        if (isTournamentTime() && isStudent) {
    */
                        if (isTournamentTime() && bother) {
                            if (log.isDebugEnabled()) {
                                log.debug("it's tournament time ");
                            }
                            boolean isRegisteredForTournament = getRequest().getAttribute("notRegistered") == null;
                            boolean isConfirmed = getRequest().getParameter("confirm") != null;
                            if (log.isDebugEnabled()) {
                                log.debug("reged: " + isRegisteredForTournament + " confirmed: " + isConfirmed);
                            }
                            if (isRegisteredForTournament || isConfirmed) {
                                if (log.isDebugEnabled()) {
                                    log.debug("either they are registered, or they've confirmed they don't want to");
                                }
                                register();
                                getRequest().removeAttribute("responses");
                                setNextPage("/contest/regSuccess.jsp");
                                setIsNextPageInContext(true);
                            } else {
                                setNextPage("/dev/tournamentConfirm.jsp");
                                setIsNextPageInContext(true);
                            }
                        } else {
                            if (log.isDebugEnabled()) {
                                log.debug("just register them, it's either not tourney time");
                            }
                            register();
                            setNextPage("/contest/regSuccess.jsp");
                            setIsNextPageInContext(true);
                        }
                    } else {
                        setNextPage("/contest/message.jsp");
                        setIsNextPageInContext(true);
                    }
                } else {
                    getRequest().setAttribute("questionInfo", getQuestions());
                    setDefaults(responses);

                    // process terms of use
                    processTermsOfUse(projectId, userId, Base.SUBMITTER_ROLE_IDS, -1);

                    setDefault(Constants.PROJECT_ID, getRequest().getParameter(Constants.PROJECT_ID));
                    loadCaptcha();
                    setNextPage("/contest/regTerms.jsp");
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

    private List validateSurvey() throws Exception {
        List sessionList = (List) getRequest().getSession().getAttribute("responses");
        if (sessionList != null) {
            return sessionList;
        } else {
            String paramName;
            List responses = new ArrayList(10);
            for (Enumeration params = getRequest().getParameterNames(); params.hasMoreElements();) {
                paramName = (String) params.nextElement();
                if (log.isDebugEnabled()) {
                    log.debug("param: " + paramName);
                }
                if (paramName.startsWith(AnswerInput.PREFIX)) {
                    List l = validateAnswer(paramName);
                    if (l != null)
                        responses.addAll(l);
                }
            }
            checkRequiredQuestions(responses);
            return responses;
        }
    }

    private void setDefaults(List responses) throws Exception {
        SurveyResponse r;
        for (Iterator it = responses.iterator(); it.hasNext();) {
            r = (SurveyResponse) it.next();
            if (findQuestion(r.getQuestionId()).getStyleId() == Question.MULTIPLE_CHOICE) {
                setDefault(AnswerInput.PREFIX + r.getQuestionId() + "," + r.getAnswerId(), "true");
            } else if (r.isFreeForm()) {
                setDefault(AnswerInput.PREFIX + r.getQuestionId(), r.getText());
            } else {
                setDefault(AnswerInput.PREFIX + r.getQuestionId(), new Long(r.getAnswerId()));
            }
        }
    }

    private List validateAnswer(String paramName) throws Exception {

        Question question = null;
        String[] values = getRequest().getParameterValues(paramName);
        List ret;
        String errorKey;
        if (values == null) {
            ret = new ArrayList(0);
        } else {
            ret = new ArrayList(values.length);
            long questionId = -1;
            long answerId = -1;
            for (int i = 0; i < values.length; i++) {
                if (log.isDebugEnabled()) {
                    log.debug("param: " + paramName + " value: " + values[i]);
                }
                /* single choice will be in the format <prefix><question_id>
                 * multiple choice will be in the format <prefix><question_id>,<answer_id>
                 */
                StringTokenizer st = new StringTokenizer(paramName.substring(AnswerInput.PREFIX.length()), ",");
                if (st.hasMoreTokens()) {
                    questionId = Long.parseLong(st.nextToken());
                }
                errorKey = AnswerInput.PREFIX + questionId;
                if (question == null) {
                    question = findQuestion(questionId);
                    if (question == null) {
                        addError(errorKey, "Question doesn't exist");
                        return null;  //quit now
                    }
                }
                if (st.hasMoreTokens()) {
                    //this must be a multiple choice question
                    try {
                        answerId = Long.parseLong(st.nextToken());
                    } catch (NumberFormatException e) {
                        if (log.isDebugEnabled()) {
                            log.debug("numberformat trying to get answer for multiple choice");
                        }
                        addError(errorKey, "Invalid answer.");
                    }
                    if (question.getStyleId() != Question.MULTIPLE_CHOICE) {
                        if (log.isDebugEnabled()) {
                            log.debug("param has answerid but it's not multiple choice");
                        }
                        addError(errorKey, "Invalid answer.");
                    } else if (findAnswer(answerId, question) == null) {
                        if (log.isDebugEnabled()) {
                            log.debug("can't find multiple choice answer");
                        }
                        addError(errorKey, "Invalid answer.");
                    }
                } else {
                    //only when it's a multiple choice question should there be multiple answers
                    if (values.length > 1) {
                        if (log.isDebugEnabled()) {
                            log.debug("not multiple choice, but there are multiple answers");
                        }
                        addError(errorKey, "Invalid answer.");
                    }
                    if (question.getStyleId() == Question.SINGLE_CHOICE) {
                        try {
                            answerId = Long.parseLong(values[i]);
                        } catch (NumberFormatException e) {
                            if (log.isDebugEnabled()) {
                                log.debug("numberformat trying to get answer for single choice");
                            }
                            addError(errorKey, "Invalid answer.");
                        }
                        if (findAnswer(answerId, question) == null) {
                            if (log.isDebugEnabled()) {
                                log.debug("can't find single choice answer");
                            }
                            addError(errorKey, "Invalid answer.");
                        }
                    }
                }
                SurveyResponse response = new SurveyResponse();
                response.setQuestionId(question.getId());
                response.setUserId(getUser().getId());
                if (question.isFreeForm()) {
                    String text = StringUtils.checkNull(values[i]).trim();
                    if (text.length() != 0) {
                        response.setText(StringUtils.checkNull(values[i]));
                        response.setFreeForm(true);
                        ret.add(response);
                    }
                } else if (answerId > 0) {
                    //answerId would be -1 in the case of a schulze election where
                    //the respondant does not rate the candidate
                    response.setAnswerId(answerId);
                    response.setFreeForm(false);
                    ret.add(response);
                }
            }
        }
        if (log.isDebugEnabled()) {
            log.debug("q: " + question.getId() + "required: " + question.isRequired() + " ret: " + ret.size());
        }
        return ret;
    }

    private Question findQuestion(long questionId) throws Exception {
        Question q = null;
        boolean found = false;
        for (Iterator it = getQuestions().iterator(); it.hasNext() && !found;) {
            q = (Question) it.next();
            found = (q.getId() == questionId);
        }
        return found ? q : null;
    }

    private Answer findAnswer(long answerId, Question question) {
        Answer a = null;
        boolean found = false;
        for (Iterator it = question.getAnswerInfo().iterator(); it.hasNext() && !found;) {
            a = (Answer) it.next();
            found = a.getId().equals(new Long(answerId));
        }
        return found ? a : null;
    }


    private void checkRequiredQuestions(List responses) throws Exception {
        Question q;
        for (Iterator it = getQuestions().iterator(); it.hasNext();) {
            q = (Question) it.next();
            if (q.isRequired() && !containsQuestion(responses, q)) {
                addError(AnswerInput.PREFIX + q.getId(), "Please respond to this question.");
            }

        }
    }

    private boolean containsQuestion(List responses, Question question) {
        SurveyResponse r;
        boolean found = false;
        for (Iterator it = responses.iterator(); it.hasNext() && !found;) {
            r = (SurveyResponse) it.next();
            found = (r.getQuestionId() == question.getId());
        }
        return found;
    }

    private void register() throws Exception, RemoteException, CreateException {
        InitialContext ctx = null;
        try {
            long projectId = Long.parseLong(getRequest().getParameter(Constants.PROJECT_ID));
            ProjectLocal pl = (ProjectLocal) createLocalEJB(getInitialContext(), Project.class);
            long componentId = pl.getComponentId(projectId, DBMS.TCS_OLTP_DATASOURCE_NAME);
            int phase = 111 + pl.getProjectTypeId(projectId, DBMS.TCS_OLTP_DATASOURCE_NAME);

            ctx = TCContext.getContext(ApplicationServer.JNDI_FACTORY, ApplicationServer.TCS_APP_SERVER_URL);
            if (log.isDebugEnabled()) {
                log.debug("context: " + ctx.getEnvironment().toString());
            }

            Object objComponentManager = ctx.lookup(ComponentManagerHome.EJB_REF_NAME);
            ComponentManagerHome componentManagerHome =
                    (ComponentManagerHome) PortableRemoteObject.narrow(objComponentManager, ComponentManagerHome.class);
            ComponentManager componentManager = componentManagerHome.create(componentId);
            String project = componentManager.getComponentInfo().getName() +
                    (phase == ComponentVersionInfo.SPECIFICATION ? " Design" : " Development");
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

            //String key = getUser().getId() % 2 == 1 ? "l96uJ8gb3yeVyljcqJv94kt2XcxPaVPcEBJQfNV3r/qfNTr0l+HHooRklk/J2sxyXw22fyIbN4YMzkr+m7yxi4nykHn4XF504ned5q6B3i5BVTrn8mxDHf5jNdbloaXPd/fsMTrRU3x4ljWuMrZ7IcU5y8Kp4X9UeSQhFxgqlZE" : "IzlKZkULNt8Y9+qZZe+FIajyifIL+7zapP11VZrSSC9NHKKrKTUUG4ATDdo/bubQBDcn25U0EGcBICe5sSJoNprrIPpz8DtVJgBGQrvkbe+HnF6O3vUEdIeH2KARRqKX6bB0vfcEUPfbCjADCIGkotVJllATF696T0CxBg1+ia0";

            //String key = "WGLuGTUg2IuqXUBnHQqVU9BOsrZq0BfB3vGGJGjD/bzpPAXm+65fmoJ9GISfW+4fOmPG1GQVE3Ibdc661Bxb5oVo/oHqNLNcyB1jHJkWxfivLySEqUAFba+ws/ep09AAbmd6k6mGQDWUTux4YcY5ODk/dW72NiTR83TNY5MZoOM";
            String key = "SQHqUcOanhgj138WrU2leIVsGuebDKbFfPr3j3X2TzYBo9r1j5eBVxHmORs+pI4qgzrGVWe4JouqJAMKq/LWTfODzXua4/bMq+ada5a9JBhybwmOETfS/8xvtAI0/KYJjBtmpY0ep9qdNq5FQM9P8SYiF5mR552k7Ce2lbQhrfw";

            if (phase == ComponentVersionInfo.SPECIFICATION) {
                mail.setBody(getUser().getUserName() + ", \n\nRegistration Complete. \n\n" +
                        "Thank you, for your interest in the " + project + " component. You now have access to the Developer Forum ( http://" + ApplicationServer.FORUMS_SERVER_NAME + "/?module=Category&categoryID=" + activeForumCategoryId + " ) which can be used to obtain design documentation (see the Design Phase Documents thread), as well as to ask questions regarding the component design. Please post your questions at any time and a product manager will respond within 24 hours. Any questions asked within 6 hours of the submission due date/time may not be answered in time, so get your questions in early!\n\n" +
                        "The deadline for submitting a solution is " + date + ". Please upload your design using the project page found here: http://" + ApplicationServer.SOFTWARE_SERVER_NAME + "/review.  If you encounter any problems, please contact us at service@topcodersoftware.com.  All late submissions will be ignored.\n\n" +
                        "If you have any questions please contact service@topcodersoftware.com\n\n" +

                        "You can read more about our UML tool and download it at\n" +
                        "http://www.topcoder.com/tc?module=Static&d1=dev&d2=umltool&d3=description\n\n" +

                        "TopCoder Software Team");

            } else {
                mail.setBody(getUser().getUserName() + ", \n\nRegistration Complete. \n\n" +
                        "Thank you, for your interest in the " + project + " component. You now have access to the Developer Forum ( http://" + ApplicationServer.FORUMS_SERVER_NAME + "/?module=Category&categoryID=" + activeForumCategoryId + " ) which can be used to obtain the component design (See \"Development Phase Documents\" thread), as well as to ask questions regarding the development process or the component design. Please post your questions at any time and the component designer will respond within 24 hours. Any questions asked within 6 hours of the submission due date/time may not be answered, so get your questions in early!\n\n" +
                        "The deadline for submitting a solution is " + date + ". Please upload your solution using the project page found here: http://" + ApplicationServer.SOFTWARE_SERVER_NAME + "/review. If you encounter any problems, please contact us at service@topcodersoftware.com.  Any late submissions will be ignored. \n\n" +
                        "If you have any questions please contact service@topcodersoftware.com\n\n" +

                        "You can read more about our UML tool and download it at\n" +
                        "http://www.topcoder.com/tc?module=Static&d1=dev&d2=umltool&d3=description\n\n" +

                        "TopCoder Software Team");
            }
            EmailEngine.send(mail);


        } finally {
            close(ctx);
        }


    }
}