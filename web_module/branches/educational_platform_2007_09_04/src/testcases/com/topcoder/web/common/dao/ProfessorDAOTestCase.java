/*
* ProfessorDAOTestCase
*
* Created Sep 28, 2007
*/
package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.educ.Professor;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class ProfessorDAOTestCase extends TCHibernateTestCase {

    /**
     * Test method for {@link com.topcoder.web.common.dao.GenericDAO#find(java.io.Serializable)}.
     */
    public void testFindSaveOrUpdate() {
        User u = DAOUtil.getFactory().getUserDAO().find("bauna", true);
        if (u.getProfessor() != null) {
            DAOUtil.getFactory().getProfessorDAO().delete(u.getProfessor());
            u.setProfessor(null);
        }

        tearDown();
        setUp();

        // add p

        Professor p = new Professor();
        
        p.setStatusId(Professor.ACTIVE_STATUS);
        p.setUser(DAOUtil.getFactory().getUserDAO().find("bauna", true));

        DAOUtil.getFactory().getProfessorDAO().saveOrUpdate(p);
        
        tearDown();
        setUp();

        // look for p
        
        Professor p2 = DAOUtil.getFactory().getProfessorDAO().find(p.getId());
        assertTrue("Could not found professor " + p.getId(), p2 != null);

        assertTrue("Different attribute: getClassroom size - " + p.getClassrooms().size() + " <> getClassrooms size - " + p2.getClassrooms().size(), 
                p.getClassrooms().size() == p2.getClassrooms().size());
        assertTrue("Different attribute: getProfessorSchools size - " + p.getProfessorSchools().size() + " <> getProfessorSchools size - " + p2.getProfessorSchools().size(), 
                p.getProfessorSchools().size() == p2.getProfessorSchools().size());
        assertTrue("Different attribute: getStatusId - " + p.getStatusId() + " <> getStatusId - " + p2.getStatusId(), 
                p.getStatusId().equals(p2.getStatusId()));
        assertTrue("Different attribute: getUser - " + p.getUser() + " <> getUser - " + p2.getUser(), 
                p.getUser().equals(p2.getUser()));
        
        p2.getUser().setProfessor(null);
        DAOUtil.getFactory().getProfessorDAO().delete(p2);
    }

}
