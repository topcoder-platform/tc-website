/*
* ClassroomDAOTestCase
*
* Created Sep 28, 2007
*/
package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.educ.Classroom;
import com.topcoder.web.common.model.educ.Professor;
import com.topcoder.web.common.model.educ.ProfessorStatus;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class ClassroomDAOTestCase extends TCHibernateTestCase {

    /**
     * Test method for {@link com.topcoder.web.common.dao.GenericDAO#find(java.io.Serializable)}.
     */
    public void testFindSaveOrUpdate() {
        User u = DAOUtil.getFactory().getUserDAO().find("bauna", true);
        Professor p = u.getProfessor();

        if (p == null) {
            p = new Professor();
            p.setStatus(DAOUtil.getFactory().getProfessorStatusDA0().find(ProfessorStatus.ACTIVE));
            p.setUser(u);
            u.setProfessor(p);
            DAOUtil.getFactory().getProfessorDAO().saveOrUpdate(p);

            tearDown();
            setUp();
        }

        Classroom c = new Classroom();
        c.setName("test classroom");
        c.setAcademicPeriod("test academic");
        c.setDescription("test");
        c.setProfessor(p);
        c.setSchool(DAOUtil.getFactory().getSchoolDAO().find(22l));
        c.setStatusId(Classroom.ACTIVE);

        DAOUtil.getFactory().getClassroomDAO().saveOrUpdate(c);

        tearDown();
        setUp();

        // look for c

        Classroom c2 = DAOUtil.getFactory().getClassroomDAO().find(c.getId());
        assertTrue("Could not found classroom " + c.getId(), c2 != null);

        assertTrue("Different attribute: getStatusId - " + c.getStatusId() + " <> getStatusId - " + c2.getStatusId(),
                c.getStatusId().equals(c2.getStatusId()));
        assertTrue("Different attribute: getName - " + c.getName() + " <> getName - " + c2.getName(),
                c.getName().equals(c2.getName()));
        assertTrue("Different attribute: getAcademicPeriod - " + c.getAcademicPeriod() + " <> getAcademicPeriod - " + c2.getAcademicPeriod(),
                c.getAcademicPeriod().equals(c2.getAcademicPeriod()));
        assertTrue("Different attribute: getDescription - " + c.getDescription() + " <> getDescription - " + c2.getDescription(),
                c.getDescription().equals(c2.getDescription()));
        assertTrue("Different attribute: getProfessor - " + c.getProfessor() + " <> getProfessor - " + c2.getProfessor(),
                c.getProfessor().equals(c2.getProfessor()));
        assertTrue("Different attribute: getSchool - " + c.getSchool() + " <> getSchool - " + c2.getSchool(),
                c.getSchool().equals(c2.getSchool()));

        c2.getProfessor().removeClassroom(c2);
        DAOUtil.getFactory().getClassroomDAO().delete(c2);
    }

}
