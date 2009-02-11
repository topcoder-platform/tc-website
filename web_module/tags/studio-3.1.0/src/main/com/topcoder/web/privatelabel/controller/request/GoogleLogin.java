package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.LoginException;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.ejb.address.Address;
import com.topcoder.web.ejb.coder.Coder;
import com.topcoder.web.ejb.demographic.Response;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.ejb.user.UserAddress;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.DemographicQuestion;
import com.topcoder.web.privatelabel.model.DemographicResponse;
import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;

public class GoogleLogin extends FullLogin {

    private static HashMap TC_TO_PL_ANSWER_MAP = new HashMap();
    private static HashMap TC_TO_PL_QUESTION_MAP = new HashMap();

    static {
        TC_TO_PL_QUESTION_MAP.put(new Long(21), new Long(100));
        TC_TO_PL_QUESTION_MAP.put(new Long(20), new Long(102));
        TC_TO_PL_QUESTION_MAP.put(new Long(15), new Long(106));
        TC_TO_PL_QUESTION_MAP.put(new Long(5), new Long(105));
        TC_TO_PL_QUESTION_MAP.put(new Long(2), new Long(112));
        TC_TO_PL_QUESTION_MAP.put(new Long(3), new Long(108));
        TC_TO_PL_QUESTION_MAP.put(new Long(18), new Long(18));
        TC_TO_PL_QUESTION_MAP.put(new Long(23), new Long(23));

        TC_TO_PL_ANSWER_MAP.put(new Long(141), new Long(100));
        TC_TO_PL_ANSWER_MAP.put(new Long(142), new Long(101));
        TC_TO_PL_ANSWER_MAP.put(new Long(15), new Long(189));
        TC_TO_PL_ANSWER_MAP.put(new Long(16), new Long(190));
        TC_TO_PL_ANSWER_MAP.put(new Long(17), new Long(191));
        TC_TO_PL_ANSWER_MAP.put(new Long(103), new Long(198));
        TC_TO_PL_ANSWER_MAP.put(new Long(6), new Long(199));
        TC_TO_PL_ANSWER_MAP.put(new Long(8), new Long(200));
        TC_TO_PL_ANSWER_MAP.put(new Long(9), new Long(196));
        TC_TO_PL_ANSWER_MAP.put(new Long(10), new Long(195));
        TC_TO_PL_ANSWER_MAP.put(new Long(11), new Long(194));
        TC_TO_PL_ANSWER_MAP.put(new Long(127), new Long(126));
        TC_TO_PL_ANSWER_MAP.put(new Long(128), new Long(125));
        TC_TO_PL_ANSWER_MAP.put(new Long(129), new Long(124));
        TC_TO_PL_ANSWER_MAP.put(new Long(130), new Long(123));
        TC_TO_PL_ANSWER_MAP.put(new Long(131), new Long(122));
        TC_TO_PL_ANSWER_MAP.put(new Long(132), new Long(121));
        TC_TO_PL_ANSWER_MAP.put(new Long(133), new Long(120));
        TC_TO_PL_ANSWER_MAP.put(new Long(134), new Long(119));
        TC_TO_PL_ANSWER_MAP.put(new Long(135), new Long(118));
        TC_TO_PL_ANSWER_MAP.put(new Long(149), new Long(126));
        TC_TO_PL_ANSWER_MAP.put(new Long(150), new Long(106));
        TC_TO_PL_ANSWER_MAP.put(new Long(151), new Long(107));
        TC_TO_PL_ANSWER_MAP.put(new Long(152), new Long(108));
        TC_TO_PL_ANSWER_MAP.put(new Long(153), new Long(109));
        TC_TO_PL_ANSWER_MAP.put(new Long(154), new Long(110));
        TC_TO_PL_ANSWER_MAP.put(new Long(155), new Long(111));
        TC_TO_PL_ANSWER_MAP.put(new Long(156), new Long(112));
        TC_TO_PL_ANSWER_MAP.put(new Long(157), new Long(113));
        TC_TO_PL_ANSWER_MAP.put(new Long(158), new Long(114));
        TC_TO_PL_ANSWER_MAP.put(new Long(159), new Long(115));
        TC_TO_PL_ANSWER_MAP.put(new Long(160), new Long(116));
        TC_TO_PL_ANSWER_MAP.put(new Long(161), new Long(117));

    }

    protected void setNextPage() {
        //reg closed
        setNextPage(Constants.GOOGLE_REG_CLOSED_PAGE);
        setIsNextPageInContext(true);
/*
        if (hasErrors()) {
            setNextPage(Constants.GOOGLE_LOGIN_PAGE);
            setIsNextPageInContext(true);
        } else {
            setNextPage(Constants.GOOGLE_REG_PAGE);
            setIsNextPageInContext(true);
        }
*/

    }

    protected boolean hasCommonAccount() throws Exception {
        String handle = getRequestParameter(Constants.HANDLE);
        String password = getRequestParameter(Constants.PASSWORD);

        boolean ret = false;
        try {
            getAuthentication().login(new SimpleUser(0, handle, password));
        } catch (LoginException e) {
            if (!hasError(Constants.HANDLE))
                addError(Constants.HANDLE, e.getMessage());

        }
        if (!getAuthentication().getUser().isAnonymous()) {
            User user = (User) createEJB(getInitialContext(), User.class);
            char status = user.getStatus(getUser().getId(), db);
            if (Arrays.binarySearch(ACTIVE_STATI, status) >= 0) {
                Coder coder = (Coder) createEJB(getInitialContext(), Coder.class);
                ret = coder.exists(getAuthentication().getActiveUser().getId(), db);
            }
        }
        return ret;

    }

    protected SimpleRegInfo makeRegInfo() throws Exception {

        boolean hasTCAccount = false; //hack to make it compile.  if copying, fix this
        boolean hasCompanyAccount = hasCommonAccount();

        FullRegInfo info = null;

        long userId = getAuthentication().getActiveUser().getId();

        if (hasCompanyAccount) {
            info = getCommonInfo(userId, db);

            Coder coder = (Coder) createEJB(getInitialContext(), Coder.class);
            info.setCoderType(coder.getCoderTypeId(userId, db));

            //load up the demographic information
            Response response = (Response) createEJB(getInitialContext(), Response.class);
            ResultSetContainer responses = response.getResponses(userId, db);

            ResultSetContainer.ResultSetRow row = null;
            DemographicQuestion question = null;

            for (Iterator it = responses.iterator(); it.hasNext();) {
                row = (ResultSetContainer.ResultSetRow) it.next();
                question = findQuestion(row.getLongItem("demographic_question_id"), getQuestions());
                DemographicResponse r = new DemographicResponse();
                r.setQuestionId(question.getId());
                r.setSort(row.getIntItem("sort"));
                if (question.getAnswerType() == DemographicQuestion.SINGLE_SELECT ||
                        question.getAnswerType() == DemographicQuestion.MULTIPLE_SELECT) {
                    r.setAnswerId(row.getLongItem("demographic_answer_id"));
                } else {
                    r.setText(row.getStringItem("demographic_response"));
                }
                info.addResponse(r);
            }
        } else if (hasTCAccount) {

            info = getCommonInfo(userId, DBMS.COMMON_OLTP_DATASOURCE_NAME);

            Coder coder = (Coder) createEJB(getInitialContext(), Coder.class);
            info.setCoderType(coder.getCoderTypeId(userId, DBMS.OLTP_DATASOURCE_NAME));

            //load up the demographic information
            Response response = (Response) createEJB(getInitialContext(), Response.class);
            ResultSetContainer responses = response.getResponses(userId, DBMS.OLTP_DATASOURCE_NAME);

            log.debug(responses.toString());

            ResultSetContainer.ResultSetRow row = null;
            DemographicQuestion question = null;

            for (Iterator it = responses.iterator(); it.hasNext();) {
                row = (ResultSetContainer.ResultSetRow) it.next();
                long tcQuestionId = row.getLongItem("demographic_question_id");
                //only add the response if we have a mapping for it
                if (TC_TO_PL_QUESTION_MAP.containsKey(new Long(tcQuestionId))) {
                    question = findQuestion(((Long) TC_TO_PL_QUESTION_MAP.get(new Long(tcQuestionId))).longValue(), getQuestions());
                    DemographicResponse r = new DemographicResponse();
                    r.setQuestionId(question.getId());
                    r.setSort(row.getIntItem("sort"));
                    if (question.getAnswerType() == DemographicQuestion.SINGLE_SELECT ||
                            question.getAnswerType() == DemographicQuestion.MULTIPLE_SELECT) {
                        long answerId = row.getLongItem("demographic_answer_id");
                        //check if we have a mapping for the answer, if so, add the response
                        if (TC_TO_PL_ANSWER_MAP.containsKey(new Long(answerId))) {
                            r.setAnswerId(((Long) TC_TO_PL_ANSWER_MAP.get(new Long(answerId))).longValue());
                            info.addResponse(r);
                        }
                    } else {
                        r.setText(row.getStringItem("demographic_response"));
                        info.addResponse(r);
                    }
                }
            }
        }
        //returning null if they don't have an account in either system
        return info;

    }

    private FullRegInfo getCommonInfo(long userId, String db) throws Exception {
        log.debug("getCommonInfo(" + userId + "," + db + ")");
        FullRegInfo info = new FullRegInfo();
        info.setNew(false);
        User user = (User) createEJB(getInitialContext(), User.class);
        Address address = (Address) createEJB(getInitialContext(), Address.class);
        Email email = (Email) createEJB(getInitialContext(), Email.class);
        UserAddress userAddress = (UserAddress) createEJB(getInitialContext(), UserAddress.class);

        info.setHandle(getAuthentication().getActiveUser().getUserName());
        info.setPassword("");
        ;
        info.setPasswordConfirm("");
        info.setEmail(email.getAddress(email.getPrimaryEmailId(userId, db), db));
        info.setEmailConfirm(email.getAddress(email.getPrimaryEmailId(userId, db), db));
        info.setFirstName(user.getFirstName(userId, db));
        info.setMiddleName(user.getMiddleName(userId, db));
        info.setLastName(user.getLastName(userId, db));

        ResultSetContainer rsc = userAddress.getUserAddresses(userId, db);
        if (rsc.size() == 1) {
            long addressId = rsc.getLongItem(0, "address_id");
            info.setAddress1(address.getAddress1(addressId, db));
            info.setAddress2(address.getAddress2(addressId, db));
            info.setAddress3(address.getAddress3(addressId, db));
            info.setCountryCode(address.getCountryCode(addressId, db));
            info.setStateCode(address.getStateCode(addressId, db));
            info.setCity(address.getCity(addressId, db));
            info.setZip(address.getZip(addressId, db));
        }

        info.setCompanyId(Long.parseLong(StringUtils.checkNull(getRequestParameter(Constants.COMPANY_ID))));
        info.setEventId(Long.parseLong(StringUtils.checkNull(getRequestParameter(Constants.EVENT_ID))));
        return info;
    }

}
