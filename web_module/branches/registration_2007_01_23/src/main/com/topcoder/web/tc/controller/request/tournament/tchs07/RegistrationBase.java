package com.topcoder.web.tc.controller.request.tournament.tchs07;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.StringTokenizer;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Answer;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.Question;
import com.topcoder.web.common.model.Response;
import com.topcoder.web.common.model.Survey;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.tag.AnswerInput;
import com.topcoder.web.common.tag.ListSelectTag;
import com.topcoder.web.tc.Constants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 16, 2007
 */
public abstract class RegistrationBase extends ShortHibernateProcessor {

    public static final String AGE = "age";
    public static final String IN_COLLEGE = "incollege";
    public static final String IN_HIGH_SCHOOL = "inhs";

    public static final List YES_NO_ANSWERS;

    static {
        YES_NO_ANSWERS = new ArrayList();
        YES_NO_ANSWERS.add(new ListSelectTag.Option(String.valueOf(true), "Yes"));
        YES_NO_ANSWERS.add(new ListSelectTag.Option(String.valueOf(false), "No"));
    }

    public List responses;

    protected void dbProcessing() throws Exception {

        Long eventId = null;

        try {
            eventId = new Long(StringUtils.checkNull(getRequest().getParameter(Constants.EVENT_ID)));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid event specified in request.");
        }

        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        } else {
            Event e = DAOUtil.getFactory().getEventDAO().find(eventId);
            getRequest().setAttribute("event", e);
            Calendar now = Calendar.getInstance();
            now.setTime(new Date());
            if (now.after(e.getRegistrationEnd())) {
                throw new NavigationException("The registration period for the " + e.getDescription() + " is over.");
            } else if (now.before(e.getRegistrationStart())) {
                throw new NavigationException("The registration period for the " + e.getDescription() + " has not yet begun.");
            } else {
                User u = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));
                if (!isRegistered(e, u)) {
                    if (isEligible()) {
                        getRequest().setAttribute("event", e);
                        regProcessing(e, u);
                    } else {
                        throw new NavigationException("You are not eligible to register for the " + e.getDescription());
                    }
                } else {
                    //dont' have anything to do really
                }
                setNextPage(e, u);
            }
        }
    }
    
    public boolean isRegistered(Event e, User u) throws Exception {
        if (log.isDebugEnabled()) {
            log.debug("checking if " + getUser().getId() + " is registered for " + e.getId());
        }

        Event curr;
        for (Iterator it = u.getEventRegistrations().iterator(); it.hasNext();) {
            curr = ((EventRegistration) it.next()).getId().getEvent();
            if (curr.equals(e)) {
                return true;
            }
        }
        return false;
    }

    public Response findResponse(List responses, long questionId) {
        Response r = null;
        boolean found = false;
        for (Iterator it = responses.iterator(); it.hasNext() && !found;) {
            r = (Response) it.next();
            found = (r.getQuestion().getId() == questionId);
        }
        return found ? r : null;
    }
    
    public List getResponses(Survey s) {
        String paramName = null;
        List responses = new ArrayList(10);
        for (Enumeration params = getRequest().getParameterNames(); params.hasMoreElements();) {
            paramName = (String) params.nextElement();
            if (log.isDebugEnabled()) {
                log.debug("param: " + paramName);
            }
            if (paramName.startsWith(AnswerInput.PREFIX)) {
                List l = validateAnswer(s.getQuestions(), paramName);
                if (l != null)
                    responses.addAll(l);
            }
        }
        return responses;
    }
    

    /**
     * Go through the request and pull out the users answers
     *
     * @param paramName
     * @return a list of the user's responses
     */
    private List validateAnswer(Set questions, String paramName) {

        Question question = null;
        String[] values = getRequest().getParameterValues(paramName);
        List ret = null;
        String errorKey = null;
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
                    question = findQuestion(questions, questionId);
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
                    if (question.getTypeId() == Question.SCHULZE_ELECTION_TYPE) {
                        if (!"".equals(values[i])) {
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
                    } else if (question.getStyleId() == Question.SINGLE_CHOICE) {
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
                Response response = new Response();
                response.setQuestion(question);
                response.setAnswer(findAnswer(answerId, question));
                response.setText(StringUtils.checkNull(values[i]));
                ret.add(response);
            }
        }

        log.debug("q: " + question.getId() + "required: " + question.isRequired() + " ret: " + ret.size());
        return ret;
    }

    public void checkRequiredQuestions(Survey s, List responses) {
        Question q = null;
        for (Iterator it = s.getQuestions().iterator(); it.hasNext();) {
            q = (Question) it.next();
            if (q.isRequired() && !containsQuestion(responses, q)) {
                addError(AnswerInput.PREFIX + q.getId(), "Please respond to this question.");
            }

        }
    }

    private boolean containsQuestion(List responses, Question question) {
        Response r = null;
        boolean found = false;
        for (Iterator it = responses.iterator(); it.hasNext() && !found;) {
            r = (Response) it.next();
            found = (r.getQuestion().equals(question));
        }
        return found;
    }

    private Question findQuestion(Set questions, long questionId) {
        Question q = null;
        boolean found = false;
        for (Iterator it = questions.iterator(); it.hasNext() && !found;) {
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
    
    protected void setDefaults(List responses) {
        Response r = null;
        for (Iterator it = responses.iterator(); it.hasNext();) {
            r = (Response) it.next();
            if (r.getQuestion().getStyle().getId().intValue() == Question.MULTIPLE_CHOICE) {
                setDefault(AnswerInput.PREFIX + r.getQuestion().getId() + "," + r.getAnswer().getId(), "true");
            } else if (r.getAnswer() == null) {
                setDefault(AnswerInput.PREFIX + r.getQuestion().getId(), r.getText());
            } else {
                setDefault(AnswerInput.PREFIX + r.getQuestion().getId(), new Long(r.getAnswer().getId()));
            }
        }
    }

    protected abstract void regProcessing(Event event, User user) throws Exception;

    protected abstract void setNextPage(Event event, User user) throws Exception;

    public abstract boolean isEligible() throws Exception;

}
