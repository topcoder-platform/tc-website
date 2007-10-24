/*
* SelfRegister
*
* Created Sep 11, 2007
*/
package com.topcoder.web.ep.controller.request.student;

import java.util.Set;

import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Coder;
import com.topcoder.web.common.model.educ.Classroom;
import com.topcoder.web.ep.controller.request.LongBase;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class SelfRegisterConfirm extends LongBase {

    /* (non-Javadoc)
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        Set<Classroom> classrooms = getSelectedClassrooms();
        if (classrooms == null) {
            throw new NavigationException("Sorry, your session has expired.", "http://www.topcoder.com/ep");
        } else {
            getRequest().setAttribute("schoolName", getSchool().getName());                

            Coder c = DAOUtil.getFactory().getCoderDAO().find(getUser().getId());
            c.addClassrooms(classrooms);
            getFactory().getCoderDAO().saveOrUpdate(c);
            markForCommit();
            
            getRequest().setAttribute("message", "You have successfuly self registered to the selected classrooms.");                  
            getRequest().setAttribute(BaseServlet.NEXT_PAGE_KEY, "/ep/");                  
            setNextPage("/message.jsp");
            setIsNextPageInContext(true);            
        }        
    }
}
