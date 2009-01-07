package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.util.ArrayList;
import java.util.List;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.DigitalRunPrizePayment;
import com.topcoder.web.ejb.pacts.DigitalRunRockiePrizePayment;
import com.topcoder.web.ejb.pacts.DigitalRunTopThirdPayment;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.Links;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * Create Digital Run Payments.
 * 
 * @author Cucu
 *
 */
public class GenerateDRPayments extends ShortHibernateProcessor implements PactsConstants {

    @Override
    protected void dbProcessing() throws Exception {
        String[] pay = getRequest().getParameterValues("pay");
        
        if (pay == null || pay.length == 0) {
            throw new NavigationException("No payments selected");
        }
        DataInterfaceBean bean = new DataInterfaceBean();
        List<Long> ids = new ArrayList<Long>();
        
        for (String s : pay) {
            String []values = s.split(":"); 
            Integer contestTypeId = new Integer(values[0]);
            Integer place = new Integer(values[1]);
            Long coderId = new Long(values[2]);
            Double amount = new Double(values[3]);

            // Create the payment in PACTS
            BasePayment payment = null;
            
            if (contestTypeId.equals(Constants.CONTEST_TYPE_DR_STAGE)) {
                long stageId = Long.parseLong(getRequest().getParameter(Constants.STAGE_ID));
                payment = new DigitalRunPrizePayment(coderId, amount, stageId, place); 
                
            } else if (contestTypeId.equals(Constants.CONTEST_TYPE_DR_TOP_PERFORMERS)) {
                long stageId = Long.parseLong(getRequest().getParameter(Constants.STAGE_ID));
                payment = new DigitalRunTopThirdPayment(coderId, amount,stageId, place);
                
            } else if (contestTypeId.equals(Constants.CONTEST_TYPE_DR_ROOKIE)) {
                long seasonId = Long.parseLong(getRequest().getParameter(Constants.SEASON_ID));
                
                payment = new DigitalRunRockiePrizePayment(coderId, amount, seasonId, place); 

            } else {
                throw new Exception("Invalid contest type: " + contestTypeId);
            }
                        
            payment = bean.addPayment(payment);
            ids.add(payment.getId());
            
        }
        
        setNextPage(Links.viewPayments(ids));
        
        setIsNextPageInContext(true);

    }


}
