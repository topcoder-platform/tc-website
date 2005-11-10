package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.*;
import com.topcoder.web.common.model.DemographicQuestion;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.common.model.DemographicResponse;
import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;

import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 *
 * @author gpaul 07.07.2003
 */
public abstract class FullRegConfirm extends FullRegBase {
    protected static Logger log = Logger.getLogger(FullRegConfirm.class);

    protected void registrationProcessing() throws TCWebException {

        /*
          check the 2nd page input, no reason to do the first page again
          we got it from the persistor at this point, so we can assume it
          has already been checked.
        */
        checkRegInfo(regInfo);

        try {
            if (hasErrors()) {
                List l = getQuestionList(((FullRegInfo) regInfo).getCoderType(), regInfo.getLocale());
                Collections.sort(l);
                getRequest().setAttribute("questionList", l);
                setDefaults(regInfo);
            } else {
                getRequest().setAttribute("responseList", ((FullRegInfo) regInfo).getResponses());
                getRequest().setAttribute("questionMap", getQuestions());
                regInfo.setCountryName(findCountry(regInfo.getCountryCode()));
                regInfo.setStateName(findState(regInfo.getStateCode()));
            }
        } catch (Exception e) {
            throw new TCWebException(e);
        }
        setNextPage();
    }


    /**
     * Check the extended type information only.
     * @param info
     * @throws TCWebException
     */
    protected void checkRegInfo(SimpleRegInfo info) throws TCWebException {
        log.debug("called checkRegInfo");
        /*if (!(((FullRegInfo) info).getCoderType() == Constants.STUDENT || ((FullRegInfo) info).getCoderType() == Constants.PROFESSIONAL)) {
            addError(Constants.CODER_TYPE, "Please choose either Student or Professional.");
        }*/

        //check demographic answers
        DemographicResponse r = null;
        DemographicQuestion q = null;
        try {
            for (Iterator it = ((FullRegInfo) info).getResponses().iterator(); it.hasNext();) {
                r = (DemographicResponse) it.next();
                q = findQuestion(r.getQuestionId(), getQuestions());
                if (q.getAnswerType() == DemographicQuestion.SINGLE_SELECT ||
                        q.getAnswerType() == DemographicQuestion.MULTIPLE_SELECT) {
                    if (!validResponse(r)) {
                        addError(Constants.DEMOG_PREFIX + r.getQuestionId(), "Please choose an answer from the list.");
                    }
                } else if (q.getAnswerType() == DemographicQuestion.FREE_FORM) {
                    if (r.getText().length() > 255) {
                        addError(Constants.DEMOG_PREFIX + r.getQuestionId(), "Please enter a shorter answer.");
                    } else if (q.isRequired() && r.getText().length() < 1) {
                        addError(Constants.DEMOG_PREFIX + r.getQuestionId(), "Please enter a valid answer.");
                    }
                }
            }
        } catch (Exception e) {
            throw new TCWebException(e);
        }

    }

    private boolean validResponse(DemographicResponse response) throws Exception {
        DataAccessInt dataAccess = getDataAccess(transDb, true);
        Request r = new Request();
        r.setContentHandle("demographic_answer_list");
        r.setProperty("dq", String.valueOf(response.getQuestionId()));
        r.setProperty("cm", String.valueOf(regInfo.getCompanyId()));
        Map aMap = dataAccess.getData(r);
        ResultSetContainer answers = (ResultSetContainer) aMap.get("demographic_answer_list");

        ResultSetContainer.ResultSetRow aRow = null;
        boolean found = false;
        for (Iterator it = answers.iterator(); it.hasNext() && !found;) {
            aRow = (ResultSetContainer.ResultSetRow) it.next();
            found = (aRow.getIntItem("demographic_answer_id") == response.getAnswerId());
        }
        return found;
    }

    protected SimpleRegInfo makeRegInfo() throws Exception {
        FullRegInfo info = null;
        if (getRegInfoFromPersistor() == null) {
            //perhaps we should load it up from the db...in the case of updates...
            SessionInfo sessInfo = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
            throw new NavigationException("Sorry, your session has expired.", sessInfo.getServletPath());
        } else {
            info = (FullRegInfo) super.makeRegInfo();

            //get the rest from the request
            if (hasRequestParameter(Constants.CODER_TYPE)) {
                String sCoderType = getRequestParameter(Constants.CODER_TYPE);
                info.setCoderType(Integer.parseInt(sCoderType == null ? "-1" : sCoderType));
            }

            //get the demographic responses
            DemographicQuestion q = null;
            String[] values = null;
            DemographicResponse r = null;
            String key = null;
            List questionList = getQuestionList(info.getCoderType(), info.getLocale());
            //loop through all the questions
            info.clearResponses();
            for (Iterator it = questionList.iterator(); it.hasNext();) {
                q = (DemographicQuestion) it.next();
                key = Constants.DEMOG_PREFIX + q.getId();
                values = getRequest().getParameterValues(key);
                if (q.isRequired() && !hasRequestParameter(key) && !info.hasResponse(q.getId())) {
                    //this is cheating, cuz really it should be done in the data checking method.
                    addError(key, "Please enter a valid answer, this question is required.");
                } else if (values != null) {
                    //if they've responded in this request, replace whatever was there in persitor with this new stuff
                    if (values.length > 0) {
                        info.removeResponses(q.getId());
                    }
                    String value = null;
                    //loop through all the responses in the request
                    for (int i = 0; i < values.length; i++) {
                        value = StringUtils.checkNull(values[i]).trim();
                        if (value.length() > 0) {
                            r = new DemographicResponse();
                            r.setQuestionId(q.getId());
                            if (q.getAnswerType() == DemographicQuestion.FREE_FORM) {
                                r.setText(values[i]);
                                r.setSort(q.getSort());
                                info.addResponse(r);
                            } else if (q.getAnswerType() == DemographicQuestion.SINGLE_SELECT ||
                                    q.getAnswerType() == DemographicQuestion.MULTIPLE_SELECT) {
                                try {
                                    r.setAnswerId(Long.parseLong(values[i]));
                                    r.setSort(q.getSort());
                                    info.addResponse(r);
                                } catch (NumberFormatException e) {
                                    //skip it, it's invalid, checking will have to pick it up later
                                }
                            } else {
                                throw new Exception("invalid answer type found: " + q.getAnswerType() + " for question " + q.getId());
                            }
                        } else if (q.isRequired()) {
                            /* at this point, we know that the parameter was included in the request, but the value
                             * was empty.  we'll complain to them and ask them to fill in the question
                             */
                            addError(key, "Please enter a valid answer, this question is required.");
                        }
                    }
                }

            }
        }
        return info;
    }

}
