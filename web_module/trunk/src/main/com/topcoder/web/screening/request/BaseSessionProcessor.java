package com.topcoder.web.screening.request;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.model.SessionInfo;

public abstract class BaseSessionProcessor extends BaseProcessor {
    private static int BEGIN = 0;
    private static int END = 1;

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

    protected boolean validateSessionInfo() throws Exception {
        SessionInfo info = getSessionInfo();
        HashMap errorMap = new HashMap(10);

        boolean beginSuccess = 
            validateDate(BEGIN, 
                         errorMap, 
                         info.getBeginMonth(), 
                         info.getBeginDay(), 
                         info.getBeginYear());

        boolean endSuccess = 
            validateDate(END, 
                         errorMap, 
                         info.getEndMonth(), 
                         info.getEndDay(), 
                         info.getEndYear());

        boolean success = (beginSuccess && endSuccess);

        if(info.getBeginDate().compareTo(info.getEndDate()) >= 0) {
            errorMap.put("dateCompare", 
                    "Begin Time must be earlier than End Time");
            success = false;
        }

        //check dates in db to see if we need to have them pick new ones
        if(success) {
            SimpleDateFormat sdf = new SimpleDateFormat(DBMS.INFORMIX_DATETIME_FORMAT);
            Request dRequest = new Request(); 
            dRequest.setProperty(DataAccessConstants.COMMAND, 
                    Constants.SESSION_CHECK_COMMAND);
            dRequest.setProperty("spid", info.getProfileId());
            dRequest.setProperty("cid", info.getCandidateId());
            dRequest.setProperty("uid", 
               String.valueOf(getAuthentication().getUser().getId()));
            dRequest.setProperty("start", sdf.format(info.getBeginDate()));
            dRequest.setProperty("end", sdf.format(info.getEndDate()));
            DataAccess dataAccess = getDataAccess();
            Map map = dataAccess.getData(dRequest);

            //first check to see if it is a dupe
            ResultSetContainer rsc = (ResultSetContainer)
                map.get(Constants.SESSION_DUPE_CHECK_QUERY_KEY);
            if(rsc.size() > 0) {
                success = false;
                errorMap.put("dateCompare", "This session already exists.");
            }
            else {
                //if not a dupe check to see if it violates time window
                rsc = (ResultSetContainer)
                    map.get(Constants.SESSION_CHECK_CANDIDATE_TIME_QUERY_KEY);
                if(rsc.size() > 0) {
                    success = false;
                    errorMap.put("dateCompare", 
                        "The candidate is already scheduled during selected time period");
                }
            }
        }

        if(!success) {
            getRequest().setAttribute(Constants.ERRORS, errorMap);
        }

        return success;
    }

    protected boolean validateDate(int type, 
                                   HashMap errorMap,
                                   String month, 
                                   String day, 
                                   String year) {
        boolean success = true;
        String monthKey = 
            type == BEGIN?Constants.BEGIN_MONTH:Constants.END_MONTH;
        String dayKey = 
            type == BEGIN?Constants.BEGIN_DAY:Constants.END_DAY;
        String yearKey = 
            type == BEGIN?Constants.BEGIN_YEAR:Constants.END_YEAR;

        if(month == null) {
            success = false;
            errorMap.put(monthKey, "Month must be set");
        }

        if(day == null) {
            success = false;
            errorMap.put(dayKey, "Day must be set");
        }

        if(year == null) {
            success = false;
            errorMap.put(yearKey, "Year must be set");
        }

        if(success) {
            int dayInt = Integer.parseInt(day);
            switch(Integer.parseInt(month)) {
                case 1:
                case 3:
                case 5:
                case 7:
                case 8:
                case 10:
                case 12:
                    //these don't matter cuz 1-31 is fine
                    break;

                case 2:
                    if(dayInt == 30 || dayInt == 31) {
                        success = false;
                        errorMap.put(dayKey, "Invalid day with given month");
                    }

                    int yearInt = Integer.parseInt(year);
                    //algorithm for leap year is, if divisible by 4 and 
                    //not 100 unless also divisible by 400)
                    if(dayInt == 29 && 
                       !((yearInt % 4 == 0) && 
                           ((yearInt % 100 != 0) || (yearInt % 400 == 0)))) {
                        success = false;
                        errorMap.put(dayKey, "Given year is not a leap year");
                    }
                    break;

                case 4:
                case 6:
                case 9:
                case 11:
                    if(dayInt == 31) {
                        success = false;
                        errorMap.put(dayKey, "Invalid day with given month");
                    }
                    break;
            }
        }

        return success;
    }
}
