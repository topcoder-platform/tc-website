package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.view.tag.DemographicInput;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.privatelabel.model.DemographicResponse;
import com.topcoder.web.privatelabel.model.DemographicQuestion;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.servlet.request.UploadedFile;
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

        if (hasErrors()) {
            setNextPage(Constants.VERIZON_REG_DEMOG_PAGE);
            setDefaults(regInfo);
        } else {
            regInfo.setCountryName(findCountry(regInfo.getCountryCode()));
            regInfo.setStateName(findState(regInfo.getStateCode()));
            setNextPage(Constants.VERIZON_REG_CONFIRM_PAGE);
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
        String value = null;
        DemographicResponse r = null;
        String key = null;
        List responses = new ArrayList(getQuestions().size());
        for (Iterator it = getQuestions().iterator(); it.hasNext();) {
            key = DemographicInput.PREFIX + q.getId();
            q = (DemographicQuestion) it.next();
            value = StringUtils.checkNull(getRequest().getParameter(key));
            r = new DemographicResponse();
            r.setQuestionId(q.getId());
            if (q.getAnswerType() == DemographicQuestion.FREE_FORM) {
                r.setText(value);
            } else if (q.getAnswerType() == DemographicQuestion.SINGLE_SELECT) {
                try {
                    r.setAnswerId(Long.parseLong(value));
                } catch (NumberFormatException e) {
                    addError(key, "Please enter a valid answer.");
                }
            } else if (q.getAnswerType() == DemographicQuestion.MULTIPLE_SELECT) {
                log.debug("don't know what to do with multiselect yet");
            } else {
                //todo error handling here, not a valid question
            }
            responses.add(r);
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
        if (info.getCoderType() != Constants.STUDENT || info.getCoderType() != Constants.PROFESSIONAL) {
            addError(Constants.CODER_TYPE, "Please choose either Student or Professional.");
        }
        //no need to check resume, it's not required

        //check demographic answers
        DemographicResponse r = null;
        DemographicQuestion q = null;
        try {
            for (Iterator it = info.getResponses().iterator(); it.hasNext();) {
                r = (DemographicResponse) it.next();
                q = findQuestion(getQuestions(), r.getQuestionId());
                if (q.getAnswerType() == DemographicQuestion.SINGLE_SELECT) {
                    if (!validResponse(r) && q.isRequired()) {
                        addError(DemographicInput.PREFIX + r.getQuestionId(), "Please choose an answer from the list.");
                    }
                } else if (q.getAnswerType() == DemographicQuestion.FREE_FORM) {
                    if (r.getText().length() > 255) {
                        addError(DemographicInput.PREFIX + r.getQuestionId(), "Please enter a shorter answer.");
                    } else if (q.isRequired() && r.getText().length() < 1) {
                        addError(DemographicInput.PREFIX + r.getQuestionId(), "Please valid answer.");
                    }
                } else if (q.getAnswerType() == DemographicQuestion.MULTIPLE_SELECT) {
                    //todo handle these
                }
            }
        } catch (Exception e) {
            throw new TCWebException(e);
        }

    }

    private DemographicQuestion findQuestion(List questions, long questionId) {
        DemographicQuestion q = null;
        boolean found = false;
        for (Iterator it = questions.iterator(); it.hasNext() && !found;) {
            q = (DemographicQuestion) it.next();
            found = (q.getId() == questionId);
        }
        return found ? q : null;
    }

    protected void setDefaults(FullRegInfo info) {
        //todo set default for coder type
        List responses = info.getResponses();
        DemographicResponse response = null;
        for (Iterator it = responses.iterator(); it.hasNext();) {
            response = (DemographicResponse) it.next();
            setDefault(DemographicInput.PREFIX + response.getQuestionId(), String.valueOf(response.getAnswerId()));
        }
    }

    private boolean validResponse(DemographicResponse response) throws Exception {
        DataAccessInt dataAccess = getDataAccess(true);
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
