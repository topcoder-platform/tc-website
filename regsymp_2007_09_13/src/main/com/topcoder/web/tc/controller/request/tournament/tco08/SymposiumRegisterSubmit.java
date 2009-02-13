package com.topcoder.web.tc.controller.request.tournament.tco08;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.SymposiumReg;



public class SymposiumRegisterSubmit extends SymposiumRegBase {


    @Override
    protected void dbProcessing() throws Exception {

        SymposiumReg regData = (SymposiumReg) getRequest().getSession().getAttribute(REG_DATA_ATTR);
        PaymentData paymentData = (PaymentData) getRequest().getSession().getAttribute(PAYMENT_DATA_ATTR);

        DAOUtil.getFactory().getSymposiumRegDAO().saveOrUpdate(regData);
        
        // use paymentData to do the payment.  if somehting fails, we need to rollback hibernate and display again the page to edit payment data.
        
        markForCommit();
        
        getRequest().getSession().removeAttribute(REG_DATA_ATTR);
        getRequest().getSession().removeAttribute(PAYMENT_DATA_ATTR);

        setNextPage("tournaments/tco08/symposium/success.jsp");
    }
    
}
