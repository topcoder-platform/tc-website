package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.address.Address;
import com.topcoder.web.ejb.coder.Coder;
import com.topcoder.web.ejb.demographic.Response;
import com.topcoder.web.ejb.user.UserAddress;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.DemographicQuestion;
import com.topcoder.web.privatelabel.model.DemographicResponse;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.web.privatelabel.model.VerizonRegInfo;

import java.util.Iterator;
import java.util.Locale;
import java.util.Map;

public class VerizonActivate extends BaseActivate {
    protected void setNextPage() {
        VerizonRegInfo info = (VerizonRegInfo) regInfo;

        if (!info.isRegFull() && info.isEligible()) {
            setNextPage(Constants.VERIZON_ACTIVATION_PAGE);
        } else if (info.isRegFull() && info.isEligible()) {
            setNextPage(Constants.VERIZON_ACTIVATION_REG_FULL_PAGE);
        } else {
            setNextPage(Constants.VERIZON_ACTIVATION_INELIGIBLE_PAGE);
        }
        clearRegInfo();
        setIsNextPageInContext(true);
    }

    protected void registrationProcessing() throws TCWebException {
        super.registrationProcessing();
    }

    protected SimpleRegInfo makeRegInfo() throws Exception {
        VerizonRegInfo ret = new VerizonRegInfo();
        UserAddress ua = (UserAddress) createEJB(getInitialContext(), UserAddress.class);
        Address a = (Address) createEJB(getInitialContext(), Address.class);

        String code = StringUtils.checkNull(getRequest().getParameter(ACTIVATION_CODE));
        long userId = StringUtils.getCoderId(code);
        ResultSetContainer rsc = ua.getUserAddresses(userId, db);

        //get some address info that we need to determine eligibility
        String countryCode = "";
        String city = "";
        long addressId = 0;
        if (!rsc.isEmpty()) {
            addressId = rsc.getLongItem(0, "address_id");
            if (addressId > 0) {
                countryCode = a.getCountryCode(addressId, db);
                city = a.getCity(addressId, db);
            }
        }
        ret.setCity(city);
        ret.setCountryCode(countryCode);

        //load up the demographic information
        Response response = (Response) createEJB(getInitialContext(), Response.class);
        ResultSetContainer responses = response.getResponses(userId, db);

        ResultSetContainer.ResultSetRow row = null;
        DemographicQuestion question = null;

        Coder coder = (Coder) createEJB(getInitialContext(), Coder.class);

        Map questions = VerizonReg.getQuestions(transDb, coder.getCoderTypeId(userId, transDb),
                Integer.parseInt(getRequestParameter(Constants.COMPANY_ID)), Locale.US);
        for (Iterator it = responses.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow) it.next();
            question = VerizonReg.findQuestion(row.getLongItem("demographic_question_id"), questions);
            DemographicResponse r = new DemographicResponse();
            r.setQuestionId(question.getId());
            r.setSort(row.getIntItem("sort"));
            if (question.getAnswerType() == DemographicQuestion.SINGLE_SELECT ||
                    question.getAnswerType() == DemographicQuestion.MULTIPLE_SELECT) {
                r.setAnswerId(row.getLongItem("demographic_answer_id"));
            } else {
                r.setText(row.getStringItem("demographic_response"));
            }
            ret.addResponse(r);
        }


        ret.setEligible(VerizonRegSubmit.isEligible(ret));
        ret.setRegFull(VerizonReg.getActiveCount(db) >= Constants.MAX_VERIZON_REGISTRATIONS);

        return ret;
    }
}
