package com.topcoder.web.screening.request;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.model.SessionInfo;

public abstract class BaseSessionProcessor extends BaseProcessor {
    protected SessionInfo getSessionInfo() {
        HttpServletRequest request = (HttpServletRequest)getRequest();
        HttpSession session = request.getSession();
        SessionInfo info = (SessionInfo)
            session.getAttribute(Constants.SESSION_INFO);
        if(info == null) {
            info = new SessionInfo();
            session.setAttribute(Constants.SESSION_INFO, info);
        }

        return info;
    }

    protected void clearSessionInfo() {
        HttpServletRequest request = (HttpServletRequest)getRequest();
        HttpSession session = request.getSession();
        session.removeAttribute(Constants.SESSION_INFO);

    }

    protected void updateSessionInfo() {
        SessionInfo info = getSessionInfo();

        ServletRequest request = getRequest();
        info.setProfileId(request.getParameter(Constants.PROFILE_ID));
        info.setCandidateId(request.getParameter(Constants.CANDIDATE_ID));
        info.setBeginMonth(request.getParameter(Constants.BEGIN_MONTH));
        info.setBeginDay(request.getParameter(Constants.BEGIN_DAY));
        info.setBeginYear(request.getParameter(Constants.BEGIN_YEAR));
        info.setBeginHour(request.getParameter(Constants.BEGIN_HOUR));
        info.setEndMonth(request.getParameter(Constants.END_MONTH));
        info.setEndDay(request.getParameter(Constants.END_DAY));
        info.setEndYear(request.getParameter(Constants.END_YEAR));
        info.setEndHour(request.getParameter(Constants.END_HOUR));
        info.setCandidateEmail(request.getParameter(Constants.CANDIDATE_EMAIL));
        info.setRepEmail(request.getParameter(Constants.REP_EMAIL));
    }
}
