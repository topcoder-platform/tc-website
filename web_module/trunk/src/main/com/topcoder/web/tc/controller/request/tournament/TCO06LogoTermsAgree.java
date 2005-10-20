package com.topcoder.web.tc.controller.request.tournament;

import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.ejb.coder.CoderImage;
import com.topcoder.shared.security.SimpleResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.ApplicationServer;

import javax.transaction.TransactionManager;
import javax.transaction.Status;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Sept 19, 2005
 */
public class TCO06LogoTermsAgree extends Base {

    protected void businessProcessing() throws Exception {
        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new SimpleResource(this.getClass().getName()));
        } else {
            UserTermsOfUse ut = (UserTermsOfUse)createEJB(getInitialContext(), UserTermsOfUse.class);

            TransactionManager tm = (TransactionManager) getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);
            try {
                tm.begin();
                if (!ut.hasTermsOfUse(getUser().getId(), Constants.TCO06_LOGO_TERMS_ID, DBMS.JTS_OLTP_DATASOURCE_NAME)) {
                    ut.createUserTermsOfUse(getUser().getId(), Constants.TCO06_LOGO_TERMS_ID, DBMS.JTS_OLTP_DATASOURCE_NAME);
                }
                tm.commit();
            } catch (Exception e) {
                if (tm!=null && tm.getStatus()==Status.STATUS_ACTIVE)
                    tm.rollback();
                throw e;
            }
            CoderImage coderImage = (CoderImage)createEJB(getInitialContext(), CoderImage.class);
            getRequest().setAttribute("submissionCount",
                    new Integer(coderImage.getImages(getUser().getId(), TCO06LogoSubmit.IMAGE_TYPE, DBMS.OLTP_DATASOURCE_NAME).size()));
            
            setNextPage("/tournaments/tco06/logo_submit.jsp");
            setIsNextPageInContext(false);
        }
    }

}
