package com.topcoder.web.screening.request;

import java.util.HashMap;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.model.SessionInfo;

public class ConfirmSession extends BaseSessionProcessor {
    private static int BEGIN = 0;
    private static int END = 1;

    public void process() {
        updateSessionInfo();

        //validate the info
        if(!validateSessionInfo()) {
            setNextPage(Constants.SESSION_SETUP_PAGE);
            setNextPageInContext(true);
            return;
        }

        setNextPage(Constants.SESSION_CONFIRM_PAGE);
        setNextPageInContext(true);
    }

    private boolean validateSessionInfo() {
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

        if(!(beginSuccess && endSuccess)) {
            getRequest().setAttribute(Constants.ERRORS, errorMap);
            return false;
        }

        return true;
    }

    private boolean validateDate(int type, 
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
