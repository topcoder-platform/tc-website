package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.view.tag.DemographicInput;
import com.topcoder.web.privatelabel.model.*;
import com.topcoder.web.common.TCWebException;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;

/**
 *
 * @author gpaul 07.07.2003
 */
public class FullRegConfirm extends FullRegBase {

    protected void registrationProcessing() throws TCWebException {

        /*
          check the 2nd page input, no reason to do the first page again
          we got it from the persistor at this point, so we can assume it
          has already been checked.
        */
        checkRegInfo(regInfo);

        try {
            if (hasErrors()) {
                getRequest().setAttribute("questionList", getQuestionList());
                setNextPage(Constants.VERIZON_REG_DEMOG_PAGE);
                setDefaults(regInfo);
            } else {
                getRequest().setAttribute("responseList", ((FullRegInfo) regInfo).getResponses());
                getRequest().setAttribute("questionMap", questions);
                regInfo.setCountryName(findCountry(regInfo.getCountryCode()));
                regInfo.setStateName(findState(regInfo.getStateCode()));
                setNextPage(Constants.VERIZON_REG_CONFIRM_PAGE);
            }
        } catch (Exception e) {
            throw new TCWebException(e);
        }
        setIsNextPageInContext(true);
    }

    protected SimpleRegInfo makeRegInfo() throws Exception {
        //get the main reg info from the session
        FullRegInfo info = (FullRegInfo) getRegInfoFromPersistor();
        if (info == null) {
            //perhaps we should load it up from the db...in the case of updates...
            throw new Exception("Registration info not found in persistor");
        }


        //get the rest from the request
        String sCoderType = getRequestParameter(Constants.CODER_TYPE);
        info.setCoderType(Integer.parseInt(sCoderType == null ? "-1" : sCoderType));

        //get the demographic responses
        DemographicQuestion q = null;
        String[] values = null;
        DemographicResponse r = null;
        String key = null;
        List questionList = getQuestionList();
        List responses = new ArrayList(questionList.size());
        //loop through all the questions
        for (Iterator it = questionList.iterator(); it.hasNext();) {
            q = (DemographicQuestion) it.next();
            key = DemographicInput.PREFIX + q.getId();
            values = getRequest().getParameterValues(key);
            //loop through all the responses in the request
            if (q.isRequired() && (values == null || values.length == 0)) {
                //this is cheating, cuz really it should be done in the data checking method.
                addError(DemographicInput.PREFIX + r.getQuestionId(), "Please enter a valid answer, this question is required.");
            } else if (values != null) {
                for (int i = 0; i < values.length; i++) {
                    r = new DemographicResponse();
                    r.setQuestionId(q.getId());
                    if (q.getAnswerType() == DemographicQuestion.FREE_FORM) {
                        r.setText(values[i]);
                        responses.add(r);
                    } else if (q.getAnswerType() == DemographicQuestion.SINGLE_SELECT ||
                            q.getAnswerType() == DemographicQuestion.MULTIPLE_SELECT) {
                        try {
                            r.setAnswerId(Long.parseLong(values[i]));
                            responses.add(r);
                        } catch (NumberFormatException e) {
                            //skip it, it's invalid, checking will have to pick it up later
                        }
                    } else {
                        throw new Exception("invalid answer type found: " + q.getAnswerType() + " for question " + q.getId());
                    }
                }
            }

        }
        info.setResponses(responses);

        return info;
    }

    /**
     * Check the extended type information only.
     * @param info
     * @throws TCWebException
     */
    protected void checkRegInfo(FullRegInfo info) throws TCWebException {
        if (!(info.getCoderType() == Constants.STUDENT || info.getCoderType() == Constants.PROFESSIONAL)) {
            addError(Constants.CODER_TYPE, "Please choose either Student or Professional.");
        }

        //check demographic answers
        DemographicResponse r = null;
        DemographicQuestion q = null;
        try {
            for (Iterator it = info.getResponses().iterator(); it.hasNext();) {
                r = (DemographicResponse) it.next();
                q = findQuestion(r.getQuestionId());
                if (q.getAnswerType() == DemographicQuestion.SINGLE_SELECT ||
                        q.getAnswerType() == DemographicQuestion.MULTIPLE_SELECT) {
                    if (!validResponse(r)) {
                        addError(DemographicInput.PREFIX + r.getQuestionId(), "Please choose an answer from the list.");
                    }
                } else if (q.getAnswerType() == DemographicQuestion.FREE_FORM) {
                    if (r.getText().length() > 255) {
                        addError(DemographicInput.PREFIX + r.getQuestionId(), "Please enter a shorter answer.");
                    } else if (q.isRequired() && r.getText().length() < 1) {
                        addError(DemographicInput.PREFIX + r.getQuestionId(), "Please enter a valid answer.");
                    }
                }
            }
        } catch (Exception e) {
            throw new TCWebException(e);
        }

    }

    private boolean validResponse(DemographicResponse response) throws Exception {
        DataAccessInt dataAccess = getDataAccess(db, true);
        Request r = new Request();
        r.setContentHandle("demographic_answer_list");
        r.setProperty("dq", String.valueOf(response.getQuestionId()));
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


}
