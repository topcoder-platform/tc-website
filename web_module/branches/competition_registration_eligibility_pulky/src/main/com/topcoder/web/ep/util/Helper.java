/*
* SecurityHelper
*
* Created Oct 2, 2007
*/
package com.topcoder.web.ep.util;

import java.util.Iterator;

import com.topcoder.security.TCPrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.shared.security.User;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.ep.Constants;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class Helper {

    public static boolean hasProfessorPermission(User user) throws Exception {
        TCSubject subject = SecurityHelper.getUserSubject(user.getId());
        boolean found = false;
        for (Iterator it = subject.getPrincipals().iterator(); it.hasNext() && !found;) {
            found = ((TCPrincipal) it.next()).getId() == Constants.PROFESSOR_ROLE_ID;
        }
        return found;
    }

    public static boolean hasStudentPermission(User user) throws Exception {
        TCSubject subject = SecurityHelper.getUserSubject(user.getId());
        boolean found = false;
        for (Iterator it = subject.getPrincipals().iterator(); it.hasNext() && !found;) {
            found = ((TCPrincipal) it.next()).getId() == Constants.STUDENT_ROLE_ID;
        }
        return found;
    }
}
