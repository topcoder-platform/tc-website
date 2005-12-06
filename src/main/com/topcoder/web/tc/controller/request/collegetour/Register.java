package com.topcoder.web.tc.controller.request.collegetour;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.ejb.collegetour.RegistrationLocal;
import com.topcoder.web.ejb.collegetour.Registration;
import com.topcoder.web.common.PermissionException;

import javax.transaction.TransactionManager;
import javax.transaction.Status;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 5, 2005
 */
public class Register extends Base {
    protected void collegeTourProcessing() throws Exception {
        if (userIdentified()) {
            TransactionManager tm = null;
            try {
                tm = (TransactionManager) getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);
                tm.begin();
                RegistrationLocal reg = (RegistrationLocal)createLocalEJB(getInitialContext(), Registration.class);
                if (!reg.exists(getEventId(), getUser().getId(), DBMS.JTS_OLTP_DATASOURCE_NAME)) {
                    reg.create(getEventId(), getUser().getId(), DBMS.JTS_OLTP_DATASOURCE_NAME);
                }
                tm.commit();
            } catch (Exception e) {
                if (tm != null && tm.getStatus() == Status.STATUS_ACTIVE) {
                    tm.rollback();
                }
            }

            setNextPage("/collegetour/registrants.jsp");
            setIsNextPageInContext(true);
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

    }
}
