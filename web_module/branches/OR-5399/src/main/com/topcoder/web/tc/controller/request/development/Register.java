package com.topcoder.web.tc.controller.request.development;

import com.topcoder.dde.catalog.ComponentManager;
import com.topcoder.dde.catalog.ComponentManagerHome;
import com.topcoder.dde.catalog.ComponentVersionInfo;
import com.topcoder.dde.catalog.Forum;
import com.topcoder.dde.user.UserManagerRemote;
import com.topcoder.dde.user.UserManagerRemoteHome;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.*;
import com.topcoder.util.format.ObjectFormatter;
import com.topcoder.util.format.ObjectFormatterFactory;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.Answer;
import com.topcoder.web.common.model.Question;
import com.topcoder.web.common.model.SurveyResponse;
import com.topcoder.web.common.tag.AnswerInput;
import com.topcoder.web.common.tag.CalendarDateFormatMethod;
import com.topcoder.web.ejb.coder.Coder;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.ejb.project.Project;
import com.topcoder.web.ejb.project.ProjectLocal;
import com.topcoder.web.tc.Constants;

import javax.ejb.CreateException;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.transaction.Status;
import javax.transaction.TransactionManager;
import java.rmi.RemoteException;
import java.sql.Timestamp;
import java.util.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 6, 2006
 */
public class Register extends ViewRegistration {
    protected void developmentProcessing() throws TCWebException {

        try {
            loadPhase();

            if (!SecurityHelper.hasPermission(getLoggedInUser(), new ClassResource(this.getClass()))) {
                throw new PermissionException(getLoggedInUser(), new ClassResource(this.getClass()));
            }

            validation();

            getRequest().setAttribute(Constants.PROJECT_ID, getRequest().getParameter(Constants.PROJECT_ID));

            boolean agreed = "on".equals(getRequest().getParameter(Constants.TERMS_AGREE));
            List responses = validateSurvey();
            Coder c = (Coder) createEJB(getInitialContext(), Coder.class);
            boolean isStudent = c.getCoderTypeId(getUser().getId(), DBMS.OLTP_DATASOURCE_NAME) == 1;
            if (agreed && !hasErrors()) {
                if (log.isDebugEnabled()) {
                    log.debug("they agree to terms and there are no errors");
                }
                getRequest().getSession().setAttribute("responses", responses);
                boolean isEligible = getRequest().getAttribute(Constants.MESSAGE) == null;
                if (isEligible) {
                    if (log.isDebugEnabled()) {
                        log.debug("they are eligible");
                    }
                    if (isTournamentTime() && isStudent) {
                        if (log.isDebugEnabled()) {
                            log.debug("it's tournament time and they are as student");
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
                            setNextPage("/dev/regSuccess.jsp");
                            setIsNextPageInContext(true);
                        } else {
                            setNextPage("/dev/tournamentConfirm.jsp");
                            setIsNextPageInContext(true);
                        }
                    } else {
                        if (log.isDebugEnabled()) {
                            log.debug("just register them, it's either not tourney time, or they are a pro");
                        }
                        register();
                        setNextPage("/dev/regSuccess.jsp");
                        setIsNextPageInContext(true);
                    }
                } else {
                    setNextPage("/dev/message.jsp");
                    setIsNextPageInContext(true);
                }
            } else {
                if (!agreed) {
                    addError(Constants.TERMS_AGREE, "You must agree to the terms in order to proceed.");
                }
                getRequest().setAttribute("questionInfo", getQuestions());
                setDefault(Constants.TERMS, getTerms());
                setDefaults(responses);
                //we're assuming if we got here, we had a valid project id
                setDefault(Constants.PROJECT_ID, getRequest().getParameter(Constants.PROJECT_ID));
                setNextPage("/dev/regTerms.jsp");
                setIsNextPageInContext(true);
            }

        } catch (TCWebException e) {
            throw e;
        } catch (Throwable e) {
            throw new TCWebException(e);
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
            found = (a.getId() == answerId);
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
            long activeForumCategoryId = componentManager.getActiveForumCategory(Forum.SPECIFICATION).getId();

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

            String key = getUser().getId() % 2 == 1 ? "l96uJ8gb3yeVyljcqJv94kt2XcxPaVPcEBJQfNV3r/qfNTr0l+HHooRklk/J2sxyXw22fyIbN4YMzkr+m7yxi4nykHn4XF504ned5q6B3i5BVTrn8mxDHf5jNdbloaXPd/fsMTrRU3x4ljWuMrZ7IcU5y8Kp4X9UeSQhFxgqlZE" : "IzlKZkULNt8Y9+qZZe+FIajyifIL+7zapP11VZrSSC9NHKKrKTUUG4ATDdo/bubQBDcn25U0EGcBICe5sSJoNprrIPpz8DtVJgBGQrvkbe+HnF6O3vUEdIeH2KARRqKX6bB0vfcEUPfbCjADCIGkotVJllATF696T0CxBg1+ia0";
            
            if (phase == ComponentVersionInfo.SPECIFICATION) {
                mail.setBody(getUser().getUserName() + ", \n\nRegistration Complete. \n\n" +
                        "Thank you, for your interest in the " + project + " component. You now have access to the Developer Forum ( http://" + ApplicationServer.FORUMS_SERVER_NAME + "/?module=Category&categoryID=" + activeForumCategoryId + " ) which can be used to obtain design documentation (see the Design Phase Documents thread), as well as to ask questions regarding the component design. Please post your questions at any time and a product manager will respond within 24 hours. Any questions asked within 6 hours of the submission due date/time may not be answered in time, so get your questions in early!\n\n" +
                        "The deadline for submitting a solution is " + date + ". Please upload your design using the project page found here: http://" + ApplicationServer.SOFTWARE_SERVER_NAME + "/review.  If you encounter any problems, please contact us at service@topcodersoftware.com.  All late submissions will be ignored.\n\n" +
                        "If you have any questions please contact service@topcodersoftware.com\n\n" +
                        "Gentleware will be supporting Poseidon 4.x for TopCoder until April 1st " +
                        "2006.  After April 1st, TopCoder will standardize on Poseidon 5.X\n\n" +

                        "Below is your serial number for Poseidon for 5.0 UML Community Version.Edition." +
                        "This license is good for one year and is valid for TopCoder work.\n\n" +

                        key +
                        "\n\n" +
                        "If you have not downloaded 5.0 yet, please download the software from http://www.gentleware.com?redirect=download\n\n" +
                        "TopCoder Software Team");

            } else {
                mail.setBody(getUser().getUserName() + ", \n\nRegistration Complete. \n\n" +
                        "Thank you, for your interest in the " + project + " component. You now have access to the Developer Forum ( http://" + ApplicationServer.FORUMS_SERVER_NAME + "/?module=Category&categoryID=" + activeForumCategoryId + " ) which can be used to obtain the component design (See \"Development Phase Documents\" thread), as well as to ask questions regarding the development process or the component design. Please post your questions at any time and the component designer will respond within 24 hours. Any questions asked within 6 hours of the submission due date/time may not be answered, so get your questions in early!\n\n" +
                        "The deadline for submitting a solution is " + date + ". Please upload your solution using the project page found here: http://" + ApplicationServer.SOFTWARE_SERVER_NAME + "/review. If you encounter any problems, please contact us at service@topcodersoftware.com.  Any late submissions will be ignored. \n\n" +
                        "If you have any questions please contact service@topcodersoftware.com\n\n" +
                        "Gentleware will be supporting Poseidon 4.x for TopCoder until April 1st " +
                        "2006.  After April 1st, TopCoder will standardize on Poseidon 5.X\n\n" +

                        "Below is your serial number for Poseidon for 5.0 UML Community Version.Edition." +
                        "This license is good for one year and is valid for TopCoder work.\n\n" +

                        key +
                        "\n\n" +
                        "If you have not downloaded 5.0 yet, please download the software from http://www.gentleware.com?redirect=download\n\n" +
                        "TopCoder Software Team");
            }
            EmailEngine.send(mail);


        } finally {
            close(ctx);
        }


    }
}