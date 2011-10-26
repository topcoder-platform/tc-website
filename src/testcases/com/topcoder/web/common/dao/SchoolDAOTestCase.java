package com.topcoder.web.common.dao;

import java.util.Iterator;
import java.util.List;

import com.topcoder.web.common.model.Coder;
import com.topcoder.web.common.model.School;
import com.topcoder.web.common.model.SchoolAssociationType;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.UserSchool;
import com.topcoder.web.common.model.educ.Professor;
import com.topcoder.web.common.model.educ.ProfessorStatus;
import com.topcoder.web.ep.model.Classroom;
import com.topcoder.web.ep.model.StudentClassroom;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision: 66912 $ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 25, 2006
 */
public class SchoolDAOTestCase extends TCHibernateTestCase {

    public void testFind() {
        School mit = DAOUtil.getFactory().getSchoolDAO().find(new Long(775));
        assertTrue("could not find MIT in the database", mit.getName().equals("Massachusetts Institute of Technology"));
    }

    public void testSearch() {
        List l = DAOUtil.getFactory().getSchoolDAO().searchByName("mass%", 20);
        Object[] o;
        School s;
        boolean ok = true;
        for (Iterator it = l.iterator(); it.hasNext();) {
            o = (Object[]) it.next();
            s = (School) o[1];
            Long count = (Long) o[0];
            if (!s.getName().toLowerCase().startsWith("mass")) {
                ok = false;
            }
        }
        assertTrue("could not find any schools like mass%", true);
    }

    public void testCreateCoderLoaded() {
        School mit = DAOUtil.getFactory().getSchoolDAO().find(new Long(1719));
        assertFalse("coder not loaded", mit.getUser() == null);
    }

    
    public void testfindSchoolsEducation() {
        User u = DAOUtil.getFactory().getUserDAO().find("bauna", true);
        Professor delete = u.getProfessor(); 
        if (delete != null) {
            // delete all professor's classrooms
            List<Classroom> lc = DAOUtil.getFactory().getClassroomDAO().getClassroomsUsingProfessorId(delete.getId());

            for (Classroom cls : lc) {
                DAOUtil.getFactory().getClassroomDAO().delete(cls);
            }

            u.setProfessor(null);
            DAOUtil.getFactory().getProfessorDAO().delete(delete);
        }

        tearDown();
        setUp();

        // add p

        Professor p = new Professor();

        p.setStatus(DAOUtil.getFactory().getProfessorStatusDA0().find(ProfessorStatus.ACTIVE));
        User user = DAOUtil.getFactory().getUserDAO().find("bauna", true);
        p.setUser(user);

        Coder s = DAOUtil.getFactory().getCoderDAO().find(119676l);
        School school = DAOUtil.getFactory().getSchoolDAO().find(22l);
        Classroom c = new Classroom();
        c.setName("test");
        c.setProfessor(p);
        c.setAcademicPeriod("test");
        c.setDescription("test");
        c.setSchool(school);
        c.setStatusId(Classroom.ACTIVE);
        
        StudentClassroom sc = new StudentClassroom();
        sc.setStatusId(StudentClassroom.ACTIVE_STATUS);
        sc.getId().setClassroom(c);
        sc.getId().setStudent(s);
        c.addStudentClassroom(sc);
        
        UserSchool us = new UserSchool();
        us.setAssociationType(DAOUtil.getFactory().getSchoolAssociationTypeDAO().find(SchoolAssociationType.TEACHER));
        us.setSchool(school);
        us.setUser(user);
        us.setPrimary(Boolean.FALSE);
        user.addSchool(us);
        
        DAOUtil.getFactory().getProfessorDAO().saveOrUpdate(p);
        DAOUtil.getFactory().getUserDAO().saveOrUpdate(user);
        DAOUtil.getFactory().getClassroomDAO().saveOrUpdate(c);

        tearDown();
        setUp();

        // look for c using student
        List<School> ls = DAOUtil.getFactory().getSchoolDAO().findSchoolsUsingProfessorId(p.getId());
        boolean found = false;
        for (School sch : ls) {
            if (sch.getId().equals(22l)) {
                found = true;
            }
        }
        assertTrue("Could not found school using professor " + s.getId(), found);
                
        tearDown();
        setUp();

        Professor p2 = DAOUtil.getFactory().getProfessorDAO().find(p.getId());
        p2.getUser().setProfessor(null);

        // delete all professor's classrooms
        List<Classroom> lc = DAOUtil.getFactory().getClassroomDAO().getClassroomsUsingProfessorId(p2.getId());

        for (Classroom cls : lc) {
            DAOUtil.getFactory().getClassroomDAO().delete(cls);
        }

        DAOUtil.getFactory().getProfessorDAO().delete(p2);
    }


}
