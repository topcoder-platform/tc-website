package com.topcoder.web.privatelabel.controller.request.dc05;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.FullReg;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.web.privatelabel.model.FullRegInfo;
        
import java.util.Calendar;
import java.util.Date;
import java.util.Map;
import java.util.List;
import java.util.Collections;

/**
 * @author  rfairfax
 * @version  
 * Create Date: Feb 14, 2005
 */
public class Reg extends FullReg {
    protected void setNextPage() {
        //public final void set(int year, int month, int date, int hour, int minute)

        Calendar now = Calendar.getInstance();
        now.setTime(new Date());

        //closes on mar 1, 6pm
        Calendar end = Calendar.getInstance();
        end.set(2005, Calendar.MARCH, 1, 18, 0);

        if (now.after(end)) {
            setNextPage(Constants.DC05_REG_CLOSED_PAGE);
            setIsNextPageInContext(true);
        } else {
            setNextPage(Constants.DC05_REG_PAGE);
            setIsNextPageInContext(true);
        }

        
    }
    
    protected SimpleRegInfo makeRegInfo() throws Exception {
        SimpleRegInfo ret = super.makeRegInfo();
        
        ((FullRegInfo) ret).setCoderType(1);
        
        //need to load demographic questions here because of 1 page approach
        try {
            List l = getQuestionList(((FullRegInfo) ret).getCoderType());
            Collections.sort(l);
            getRequest().setAttribute("questionList", l);
            log.debug("RYAN:" + l.size());
        } catch (Exception e) {
            throw new TCWebException(e);
        }
        
        return ret;
    }

}
