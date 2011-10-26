package com.topcoder.web.csf.controller.request;

import com.topcoder.security.TCPrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.csf.Constants;

import java.util.Iterator;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 9, 2007
 */
public abstract class Base extends ShortHibernateProcessor {

    protected static final String DEV_END_POINT = "http://63.118.154.181:8880/review/services/";
    protected static final String PROD_END_POINT = "http://192.168.12.73:8280/review/services/";


    protected boolean isAdmin() throws Exception {
        TCSubject subject = SecurityHelper.getUserSubject(getUser().getId());
        boolean found = false;
        for (Iterator it = subject.getPrincipals().iterator(); it.hasNext() && !found;) {
            found = ((TCPrincipal) it.next()).getId() == Constants.CONTEST_ADMIN_ROLE_ID;
        }
        return found;
    }

}
