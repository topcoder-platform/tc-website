/*
* Home
*
* Created Jun 14, 2007
*/
package com.topcoder.web.tc.controller.request.myhome;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class Home extends ShortHibernateProcessor {

    protected void dbProcessing() throws Exception {
        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        User u  = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));
        getRequest().setAttribute("regUser", u);

        setNextPage("/my_home/index.jsp");
        setIsNextPageInContext(true);
    }
}
