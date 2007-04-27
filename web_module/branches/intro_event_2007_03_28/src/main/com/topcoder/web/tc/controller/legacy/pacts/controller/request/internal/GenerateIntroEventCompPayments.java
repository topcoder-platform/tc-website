package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.util.ArrayList;
import java.util.List;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.IntroEventCompPayment;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.Links;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

public class GenerateIntroEventCompPayments extends BaseProcessor implements PactsConstants {

    @Override
    protected void businessProcessing() throws Exception {
        String[] pay = getRequest().getParameterValues("pay");
        
        if (pay.length == 0) {
            throw new NavigationException("BNo payments selected");
        }
        DataInterfaceBean bean = new DataInterfaceBean();
        List<Long> ids = new ArrayList<Long>();
        
        for (String s : pay) {
            log.debug(s);
            String []values = s.split(":"); 
            log.debug(values[0]);
            Long contestId = new Long(values[0]);
            log.debug(values[1]);
            Integer place = new Integer(values[1]);
            log.debug(values[2]);
            Long winnerId = new Long(values[2]);
            log.debug(values[3]);
            Double amount = new Double(values[3]);
            
            BasePayment payment = new IntroEventCompPayment(winnerId, amount, contestId, place);            
            payment = bean.addPayment(payment);
            ids.add(payment.getId());
        }
        
        setNextPage(Links.viewPayments(ids));
        
        setIsNextPageInContext(true);

    }


}
