/*
* Home
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
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

            // check wether student or professor
            getRequest().setAttribute("user", u);
            if (u.isProfessor()) {
                getRequest().setAttribute("classrooms", u.getProfessor().getClassrooms());                
                setNextPage("/home.jsp");
                setIsNextPageInContext(true);
            } else {
                // look for student's details
                if (u.getCoder() == null) {
                    throw new TCWebException("Could not get user information");
                }
                
                if (u.getCoder().getProfessors().size() > 0) {
                    // user already registered
                    getRequest().setAttribute("classrooms", u.getCoder().getClassrooms());                
                    setNextPage("/home.jsp");
                    setIsNextPageInContext(true);
                } else {
                    // we need to make him self register
                    if (u.getCoder().getCurrentSchool() == null) {
                        setNextPage("/noSchoolSelfRegister.jsp");
                    } else {
                        setNextPage("/selfRegister.jsp");
                    }
                    setIsNextPageInContext(true);
                }
            }
            
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
