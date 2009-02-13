package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.LoginException;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.model.DemographicQuestion;
import com.topcoder.web.common.model.DemographicResponse;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.ejb.coder.Coder;
import com.topcoder.web.ejb.demographic.Response;
import com.topcoder.web.ejb.address.Address;
import com.topcoder.web.ejb.user.UserAddress;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.privatelabel.Constants;
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

    protected boolean hasTopCoderAccount() throws Exception {
        String handle = getRequestParameter(Constants.HANDLE);
        String password = getRequestParameter(Constants.PASSWORD);

        boolean ret = false;
        //long userId = getUserId(handle);
        try {
            getAuthentication().login(new SimpleUser(0, handle, password));
        } catch (LoginException l) {
            if (!hasError(Constants.HANDLE))
                addError(Constants.HANDLE, getBundle().getProperty("error_invalid_login"));
        }
        long userId = getAuthentication().getActiveUser().getId();
        Coder coder = (Coder) createEJB(getInitialContext(), Coder.class);
        if (coder.exists(userId, DBMS.OLTP_DATASOURCE_NAME)) {
            log.debug(handle + " exists in the tc db");
            char status = getStatus(userId);
            if (Arrays.binarySearch(ACTIVE_STATI, status) > 0) {
                ret = true;
            } else {
                addError(Constants.HANDLE, getBundle().getProperty("error_account_not_active"));

            }
        } else {
            log.debug(handle + " does not have a tc account");
            if (!hasError(Constants.HANDLE)) {
                addError(Constants.HANDLE, getBundle().getProperty("error_no_tc_account"));
            }
        }
        return ret;
    }

    /**
     * @param userId
     * @return
     * @throws Exception if user doesn't exist or some other ejb problem
     */
    private char getStatus(long userId) throws Exception {
        char result;
        com.topcoder.web.ejb.user.User user = (com.topcoder.web.ejb.user.User) createEJB(getInitialContext(), com.topcoder.web.ejb.user.User.class);
        result = user.getStatus(userId, DBMS.OLTP_DATASOURCE_NAME);
        return result;

    }

/*
    private long getUserId(String handle) throws Exception {
        Request r = new Request();
        r.setContentHandle("user_id_using_handle");
        r.setProperty("ha", handle);
        ResultSetContainer rsc = (ResultSetContainer) getDataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(r).get("user_id");
        if (rsc.isEmpty())
            return -1;
        else
            return rsc.getLongItem(0, "user_id");
    }
*/

    protected boolean hasEventAccount() throws Exception {
        String handle = getRequestParameter(Constants.HANDLE);
        String password = getRequestParameter(Constants.PASSWORD);

        Request r = new Request();
        r.setContentHandle("event_account");
        r.setProperty("hn", handle);
        r.setProperty("pass", password);

        ResultSetContainer rsc = (ResultSetContainer) getDataAccess(db).getData(r).get("event_account");
        return !rsc.isEmpty();
    }

    protected SimpleRegInfo makeRegInfo() throws Exception {
        Coder coder = (Coder) createEJB(getInitialContext(), Coder.class);
        FullRegInfo info = new FullRegInfo();
        User user = (User)createEJB(getInitialContext(), User.class);

       if (hasEventAccount()) {
            addError(Constants.HANDLE, getBundle().getProperty("error_event_account_exists"));
            return null;
       } else if (user.userExists(getRequestParameter(Constants.HANDLE), db)) {
           addError(Constants.HANDLE, getBundle().getProperty("error_event_account_exists"));
           return null;
        } else {
            if (!hasErrors()&&hasTopCoderAccount()) {
                //this must be done after the account checks, cuz that's where they get logged in...confusing?  yes
                long userId = getAuthentication().getActiveUser().getId();
                info = getCommonInfo(userId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
                info.setUserId(userId);

                info.setCoderType(coder.getCoderTypeId(userId, DBMS.OLTP_DATASOURCE_NAME));
                log.error(info.getCoderType() + "");

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
                        question = findQuestion(((Long) TC_TO_PL_QUESTION_MAP.get(new Long(tcQuestionId))).longValue(),
                                getQuestions(transDb, info.getCoderType(), Integer.parseInt(getRequestParameter(Constants.COMPANY_ID)),getLocale()));
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
            }
        }

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
        info.setPassword(getRequestParameter(Constants.PASSWORD));
        info.setPasswordConfirm(getRequestParameter(Constants.PASSWORD));
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

    protected static void loadQuestionMaps() {
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
}
