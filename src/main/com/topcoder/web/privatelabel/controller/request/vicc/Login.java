package com.topcoder.web.privatelabel.controller.request.vicc;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.LoginException;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.coder.Coder;
import com.topcoder.web.ejb.demographic.Response;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.ejb.school.CurrentSchool;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.FullLogin;
import com.topcoder.web.privatelabel.model.DemographicResponse;
import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;

import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 22, 2006
 */
public class Login extends FullLogin {

    protected void registrationProcessing() throws TCWebException {
        try {
            if (!hasErrors()) {
                List l = getQuestionList(((FullRegInfo) regInfo).getCoderType(), getLocale());
                Collections.sort(l);
                getRequest().setAttribute("questionList", l);
                setDefaults(regInfo);
            }
            setNextPage();
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }


    protected void setNextPage() {
        if (hasErrors()) {
            setNextPage(Constants.VICC_LOGIN_PAGE);
            setIsNextPageInContext(true);
        } else {
            setNextPage(Constants.VICC_REG_PAGE);
            setIsNextPageInContext(true);
        }
    }


    protected SimpleRegInfo makeRegInfo() throws Exception {
        Coder coder = (Coder) createEJB(getInitialContext(), Coder.class);
        FullRegInfo info = null;
        User user = (User) createEJB(getInitialContext(), User.class);
        String handle = getRequestParameter(Constants.HANDLE);
        String password = getRequestParameter(Constants.PASSWORD);

        try {
            getAuthentication().login(new SimpleUser(0, handle, password), false);
            char status = user.getStatus(getUser().getId(), db);
            if (Arrays.binarySearch(ACTIVE_STATI, status) >= 0) {
                log.debug("yep, they have an event account");
            } else {
                log.debug("have an inactive event account");
                if (!hasError(Constants.HANDLE)) {
                    addError(Constants.HANDLE, getBundle().getProperty("error_account_not_active"));
                }
            }
        } catch (LoginException l) {
            if (!hasError(Constants.HANDLE)) {
                addError(Constants.HANDLE, getBundle().getProperty("error_invalid_login"));
            }
        }

        if (!hasErrors()) {
            info = getCommonInfo(getUser().getId(), db);
            info.setNew(false);
            info.setUserId(getUser().getId());

            info.setCoderType(coder.getCoderTypeId(getUser().getId(), db));

            //load up the demographic information
            Response response = (Response) createEJB(getInitialContext(), Response.class);
            ResultSetContainer responses = response.getResponses(getUser().getId(), db);

            log.debug(responses.toString());

            ResultSetContainer.ResultSetRow row;

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
        Email email = (Email) createEJB(getInitialContext(), Email.class);

        info.setHandle(getAuthentication().getActiveUser().getUserName());
        info.setPassword(getRequestParameter(Constants.PASSWORD));
        info.setPasswordConfirm(getRequestParameter(Constants.PASSWORD));
        info.setEmail(email.getAddress(email.getPrimaryEmailId(userId, db), db));
        info.setEmailConfirm(email.getAddress(email.getPrimaryEmailId(userId, db), db));
        info.setFirstName(user.getFirstName(userId, db));
        info.setLastName(user.getLastName(userId, db));

        info.setCompanyId(Long.parseLong(StringUtils.checkNull(getRequestParameter(Constants.COMPANY_ID))));
        info.setEventId(Long.parseLong(StringUtils.checkNull(getRequestParameter(Constants.EVENT_ID))));
        return info;
    }


}
