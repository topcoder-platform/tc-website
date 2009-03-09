package com.topcoder.web.tc.controller.request.tournament;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.security.SimpleResource;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.ejb.coder.CoderImage;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.tc.controller.request.Base;

import javax.transaction.Status;
import javax.transaction.TransactionManager;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jun 2, 2006
 */
abstract class BaseLogoTermsAgree extends Base {

    protected void businessProcessing() throws Exception {
        if (!SecurityHelper.hasPermission(getLoggedInUser(), new ClassResource(this.getClass()))) {
            throw new PermissionException(getLoggedInUser(), new SimpleResource(this.getClass().getName()));
        } else {
            UserTermsOfUse ut = (UserTermsOfUse) createEJB(getInitialContext(), UserTermsOfUse.class);

            TransactionManager tm = (TransactionManager) getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);
            try {
                tm.begin();
                if (!ut.hasTermsOfUse(getUser().getId(), getTermsId(), DBMS.JTS_OLTP_DATASOURCE_NAME)) {
                    ut.createUserTermsOfUse(getUser().getId(), getTermsId(), DBMS.JTS_OLTP_DATASOURCE_NAME);
                }
                tm.commit();
            } catch (Exception e) {
                if (tm != null && (tm.getStatus() == Status.STATUS_ACTIVE || tm.getStatus() == Status.STATUS_MARKED_ROLLBACK)) {
                    tm.rollback();
                    throw e;
                }
                throw e;
            }
            CoderImage coderImage = (CoderImage) createEJB(getInitialContext(), CoderImage.class);
            getRequest().setAttribute("submissionCount",
                    new Integer(coderImage.getImages(getUser().getId(), getImageTypeId(), DBMS.OLTP_DATASOURCE_NAME).size()));

            setNextPage();
            setIsNextPageInContext(true);
        }
    }

    protected abstract int getTermsId
            ();

    protected abstract int getImageTypeId
            ();

    protected abstract void setNextPage
            ();
}