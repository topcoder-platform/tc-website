/*
* Home
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class Home extends Base {

    /* (non-Javadoc)
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        if (userIdentified()) {
            User u  = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));

            //if u.getCoder().get
            
            
            if (hasErrors()) {
                setNextPage("/error.jsp");
                setIsNextPageInContext(true);
            } else {
                setNextPage("/home.jsp");
                setIsNextPageInContext(true);
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }

}
