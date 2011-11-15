package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.util.ArrayList;
import java.util.List;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.comp.ContestPrize;
import com.topcoder.web.common.model.comp.UserContestPrize;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.IntroEventCompPayment;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.Links;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

public class GenerateIntroEventCompPayments extends ShortHibernateProcessor implements PactsConstants {

    @Override
    protected void dbProcessing() throws Exception {
        String[] pay = getRequest().getParameterValues("pay");
        long currentUserId = getAuthentication().getActiveUser().getId();
        
        if (pay == null || pay.length == 0) {
            throw new NavigationException("No payments selected");
        }
        DataInterfaceBean bean = new DataInterfaceBean();
        List<Long> ids = new ArrayList<Long>();
        
        for (String s : pay) {
            String []values = s.split(":"); 
            Long contestId = new Long(values[0]);
            Long prizeId = new Long(values[1]);
            Integer place = new Integer(values[2]);
            Long winnerId = new Long(values[3]);
            Double amount = new Double(values[4]);

            // Create the payment in PACTS
            BasePayment payment = new IntroEventCompPayment(winnerId, amount, contestId, place);            
            payment = bean.addPayment(payment, currentUserId);
            ids.add(payment.getId());
            
            // add an entry in user_contest_prize
            User u = DAOUtil.getFactory().getUserDAO().find(winnerId);
            ContestPrize cp = DAOUtil.getFactory().getContestPrizeDAO().find(prizeId);
            
            UserContestPrize ucp = new UserContestPrize();
            ucp.setId(new UserContestPrize.Identifier(u,cp));
            ucp.setPayment(amount);
            
            u.addCompPrizes(ucp);

        }
        
        setNextPage(Links.viewPayments(ids));
        
        setIsNextPageInContext(true);

    }


}
