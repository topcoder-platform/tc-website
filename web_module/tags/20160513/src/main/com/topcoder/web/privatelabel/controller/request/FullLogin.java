package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.LoginException;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.ejb.address.Address;
import com.topcoder.web.ejb.coder.Coder;
import com.topcoder.web.ejb.demographic.Response;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.ejb.phone.Phone;
import com.topcoder.web.ejb.school.CurrentSchool;
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

public abstract class FullLogin extends FullReg {

    protected static final char[] INACTIVE_STATI = {'I', '0', '9', '6', '5', '4'};
    protected static final char[] UNACTIVE_STATI = {'U', '2'};
    protected static final char[] ACTIVE_STATI = {'1', 'A'};

    private static HashMap TC_TO_PL_ANSWER_MAP = new HashMap();
    private static HashMap TC_TO_PL_QUESTION_MAP = new HashMap();

    static {
        loadQuestionMaps();
        //sort them so that one can use Arrays.binarySearch to figure out if a particular
        //status is in the list
        Arrays.sort(INACTIVE_STATI);
        Arrays.sort(UNACTIVE_STATI);
        Arrays.sort(ACTIVE_STATI);
    }

    protected SimpleRegInfo makeRegInfo() throws Exception {
        Coder coder = (Coder) createEJB(getInitialContext(), Coder.class);
        FullRegInfo info = null;
        User user = (User) createEJB(getInitialContext(), User.class);
        String handle = getRequestParameter(Constants.HANDLE);
        String password = getRequestParameter(Constants.PASSWORD);

        boolean hasTCAccount = false;
        boolean hasEventAccount = false;
        try {
            getAuthentication().login(new SimpleUser(0, handle, password), false);
            char status = user.getStatus(getUser().getId(), db);
            if (Arrays.binarySearch(ACTIVE_STATI, status) >= 0) {
                log.debug("yep, they have an event account");
                hasEventAccount = true;
            } else {
                log.debug("have an inactive event account");
                if (!hasError(Constants.HANDLE)) {
                    addError(Constants.HANDLE, getBundle().getProperty("error_account_not_active"));
                }
            }
        } catch (LoginException l) {
            log.debug("no event account");
            try {
                BasicAuthentication b = new BasicAuthentication(new SessionPersistor(getRequest().getSession()),
                        getRequest(), getResponse(), BasicAuthentication.PRIVATE_LABEL_SITE);
                b.login(new SimpleUser(0, handle, password), false);
                char status = user.getStatus(getUser().getId(), DBMS.OLTP_DATASOURCE_NAME);
                if (Arrays.binarySearch(ACTIVE_STATI, status) >= 0) {
                    log.debug("yep, they have a tc account");
                    hasTCAccount = true;
                } else {
                    log.debug("have an inactive tc account");
                    if (!hasError(Constants.HANDLE)) {
                        addError(Constants.HANDLE, getBundle().getProperty("error_account_not_active"));
                    }
                }
                setAuthentication(b);
            } catch (LoginException l1) {
                log.debug("no tc account");
                if (!hasError(Constants.HANDLE)) {
                    addError(Constants.HANDLE, getBundle().getProperty("error_invalid_login"));
                }
            }
        }

        if (hasTCAccount) {
            info = getCommonInfo(getUser().getId(), DBMS.COMMON_OLTP_DATASOURCE_NAME);
            info.setUserId(getUser().getId());
            info.setAccountConversion(true);

            if (coder.exists(getUser().getId(), DBMS.OLTP_DATASOURCE_NAME)) {
                info.setCoderType(coder.getCoderTypeId(getUser().getId(), DBMS.OLTP_DATASOURCE_NAME));
            }

            //load up the demographic information
            Response response = (Response) createEJB(getInitialContext(), Response.class);
            ResultSetContainer responses = response.getResponses(getUser().getId(), DBMS.OLTP_DATASOURCE_NAME);

            log.debug(responses.toString());

            ResultSetContainer.ResultSetRow row;
            DemographicQuestion question;

            for (Iterator it = responses.iterator(); it.hasNext();) {
                row = (ResultSetContainer.ResultSetRow) it.next();
                long tcQuestionId = row.getLongItem("demographic_question_id");
                //only add the response if we have a mapping for it
                if (TC_TO_PL_QUESTION_MAP.containsKey(new Long(tcQuestionId))) {
                    question = findQuestion(((Long) TC_TO_PL_QUESTION_MAP.get(new Long(tcQuestionId))).longValue(),
                            getQuestions(transDb, info.getCoderType(), Integer.parseInt(getRequestParameter(Constants.COMPANY_ID)), getLocale()));
                    if (question != null) {
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

        } else if (hasEventAccount) {
            info = getCommonInfo(getUser().getId(), db);
            info.setNew(false);
            info.setUserId(getUser().getId());

            info.setCoderType(coder.getCoderTypeId(getUser().getId(), db));

            //load up the demographic information
            Response response = (Response) createEJB(getInitialContext(), Response.class);
            ResultSetContainer responses = response.getResponses(getUser().getId(), db);

            log.debug(responses.toString());

            ResultSetContainer.ResultSetRow row = null;

            for (Iterator it = responses.iterator(); it.hasNext();) {
                row = (ResultSetContainer.ResultSetRow) it.next();
                DemographicResponse r = new DemographicResponse();
                r.setQuestionId(row.getLongItem("demographic_question_id"));
                r.setSort(row.getIntItem("sort"));
                if (row.getItem("demographic_answer_id").getResultData() != null && row.getLongItem("demographic_answer_id") > 0)
                {
                    r.setAnswerId(row.getLongItem("demographic_answer_id"));
                } else {
                    r.setText(row.getStringItem("demographic_response"));
                }
                info.addResponse(r);

            }
            CurrentSchool cs = (CurrentSchool) createEJB(getInitialContext(), CurrentSchool.class);
            if (cs.exists(getUser().getId(), db)) {
                info.setSchoolId(cs.getSchoolId(getUser().getId(), db));
            }


        }
        return info;

    }

    private FullRegInfo getCommonInfo(long userId, String db) throws Exception {
        log.debug("getCommonInfo(" + userId + "," + db + ")");
        FullRegInfo info = new FullRegInfo();
        User user = (User) createEJB(getInitialContext(), User.class);
        Address address = (Address) createEJB(getInitialContext(), Address.class);
        Email email = (Email) createEJB(getInitialContext(), Email.class);
        Phone phone = (Phone) createEJB(getInitialContext(), Phone.class);
        UserAddress userAddress = (UserAddress) createEJB(getInitialContext(), UserAddress.class);

        info.setHandle(getAuthentication().getActiveUser().getUserName());
        info.setPassword(getRequestParameter(Constants.PASSWORD));
        info.setPasswordConfirm(getRequestParameter(Constants.PASSWORD));
        info.setEmail(email.getAddress(email.getPrimaryEmailId(userId, db), db));
        info.setEmailConfirm(email.getAddress(email.getPrimaryEmailId(userId, db), db));
        long phoneId = phone.getPrimaryPhoneId(userId, db);
        if (phoneId > 0) {
            info.setPhoneNumber(phone.getNumber(phoneId, db));
        }
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
            info.setProvince(address.getProvince(addressId, db));
        }

        info.setCompanyId(Long.parseLong(StringUtils.checkNull(getRequestParameter(Constants.COMPANY_ID))));
        info.setEventId(Long.parseLong(StringUtils.checkNull(getRequestParameter(Constants.EVENT_ID))));
        return info;
    }

    protected static void loadQuestionMaps() {
        TC_TO_PL_QUESTION_MAP.put(new Long(21), new Long(100));
        TC_TO_PL_QUESTION_MAP.put(new Long(15), new Long(106));
        TC_TO_PL_QUESTION_MAP.put(new Long(5), new Long(105));
        TC_TO_PL_QUESTION_MAP.put(new Long(2), new Long(112));
        TC_TO_PL_QUESTION_MAP.put(new Long(3), new Long(108));

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
}
