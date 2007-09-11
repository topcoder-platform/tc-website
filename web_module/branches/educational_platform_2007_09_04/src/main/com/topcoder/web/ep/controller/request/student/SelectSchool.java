/*
* SelfRegister
*
* Created Sep 11, 2007
*/
package com.topcoder.web.ep.controller.request.student;

import java.util.List;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.School;
import com.topcoder.web.common.model.educ.Professor;
import com.topcoder.web.ep.Constants;
import com.topcoder.web.ep.controller.request.Base;
import com.topcoder.web.ep.controller.request.Home;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class SelectSchool extends Base {

    private static Logger log = Logger.getLogger(Home.class);

    /* (non-Javadoc)
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        if (log.isDebugEnabled()) {
            log.debug("Select school called...");
            if (getActiveUser() == null) {
                log.debug("user is null");
            } else if (getActiveUser().isNew()) {
                log.debug("user is new");
            } else {
                log.debug("handle : " + getActiveUser().getHandle());
                log.debug("name: " + getActiveUser().getFirstName() + " " + getActiveUser().getLastName());
            }
        }
        if (getActiveUser() == null) {
            throw new NavigationException("Sorry, your session has expired.", "http://www.topcoder.com/reg");
        } else if (userLoggedIn()) {
            // get school parameter
            Long schoolId = getSchoolParam();
            
            // add selected school to the session
            School s  = DAOUtil.getFactory().getSchoolDAO().find(schoolId);

            // get professors from that school
            List<Professor> professors  = DAOUtil.getFactory().getProfessorDAO().getProfessors(s);
            getRequest().setAttribute("professors", professors);            
            
            setNextPage("/selectProfessor.jsp");
            setIsNextPageInContext(true);            
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }        
    }

    private Long getSchoolParam() throws TCWebException {
        String schoolId = StringUtils.checkNull(getRequest().getParameter(Constants.SCHOOL_ID));
        
        if (schoolId == "") {
            throw new TCWebException("Invalid school id");
        }

        Long id;
        try {
            id = Long.parseLong(schoolId);
        } catch (NumberFormatException e) {
            throw new TCWebException("Invalid school id");
        }
        
        return id;
    }
}
