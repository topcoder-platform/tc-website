package com.topcoder.web.tc.controller.request.tournament;

import com.topcoder.shared.security.SimpleResource;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;

import javax.transaction.Status;
import javax.transaction.TransactionManager;

/**
 * @author dok
 * @version $Revision: 55466 $ $Date$
 *          Create Date: Apr 6, 2005
 */
public class TCO05LogoTermsAgree extends Base {

    protected void businessProcessing() throws Exception {
        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new SimpleResource(this.getClass().getName()));
        } else {
            UserTermsOfUse ut = (UserTermsOfUse) createEJB(getInitialContext(), UserTermsOfUse.class);

            TransactionManager tm = (TransactionManager) getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);
            try {
                tm.begin();
                if (!ut.hasTermsOfUse(getUser().getId(), Constants.TCO05_LOGO_TERMS_ID, DBMS.JTS_OLTP_DATASOURCE_NAME)) {
                    ut.createUserTermsOfUse(getUser().getId(), Constants.TCO05_LOGO_TERMS_ID, DBMS.JTS_OLTP_DATASOURCE_NAME);
                }
                tm.commit();
            } catch (Exception e) {
                if (tm != null && (tm.getStatus() == Status.STATUS_ACTIVE || tm.getStatus() == Status.STATUS_MARKED_ROLLBACK)) {
                    tm.rollback();
                }
                throw e;
            }
            setNextPage("/tournaments/tco05/logo_submit.jsp");
            setIsNextPageInContext(true);
        }
    }

}
