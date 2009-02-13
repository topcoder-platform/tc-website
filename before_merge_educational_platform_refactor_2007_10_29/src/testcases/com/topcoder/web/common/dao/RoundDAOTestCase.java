/*
* RoundDAOTestCase
*
* Created Sep 27, 2007
*/
package com.topcoder.web.common.dao;

import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import com.topcoder.web.common.model.algo.Round;
import com.topcoder.web.common.model.algo.RoundProperty;
import com.topcoder.web.common.model.algo.RoundType;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class RoundDAOTestCase extends TCHibernateTestCase {

    /**
     * Test method for {@link com.topcoder.web.common.dao.hibernate.RoundDAOHibernate#getRoundsAfter(java.util.Date)}.
     */
    public void testGetRoundsAfter() {
        Date d = new Date(new GregorianCalendar(2106, 1, 1).getTimeInMillis());
        List l = DAOUtil.getFactory().getRoundDAO().getRoundsAfter(d);
        
        assertTrue("There shouldn't be rounds after " + d.toString(), 
                l.size() == 0);
        
        Date d2 = new Date(new GregorianCalendar(2006, 1, 1).getTimeInMillis());
        List l2 = DAOUtil.getFactory().getRoundDAO().getRoundsAfter(d2);
        assertTrue("There should be rounds after " + d.toString(), 
                l2.size() > 0);
    }

    /**
     * Test method for {@link com.topcoder.web.common.dao.hibernate.RoundDAOHibernate#find(java.lang.Integer)}.
     */
    public void testFindInteger() {
        
        assertTrue("Could not found round 2000", DAOUtil.getFactory().getRoundDAO().find(2000l) != null);
        
        assertTrue("There is no round -100", DAOUtil.getFactory().getRoundDAO().find(-100l) == null);
    }

    /**
     * Test method for {@link com.topcoder.web.common.dao.hibernate.RoundDAOHibernate#saveOrUpdate(com.topcoder.web.common.model.algo.Round)}.
     */
    public void testSaveOrUpdateRound() {
        Round r = new Round();
        r.setContest(DAOUtil.getFactory().getContestDAO().find(4000l));

        r.setInvitational(1);
        r.setName("Test round");
        r.setRated(1);
        r.setRegistrationLimit(1024l);
        r.setShortName("tst rnd");
        r.setStatus("A");
        
        RoundType rt = new RoundType();
        rt.setDescription("test round type");
        r.setType(DAOUtil.getFactory().getRoundTypeDAO().find(RoundType.SRM));
        
        DAOUtil.getFactory().getRoundDAO().saveOrUpdate(r);
        
        tearDown();
        setUp();

        // look for r

        Round r2 = DAOUtil.getFactory().getRoundDAO().find(r.getId());
        assertTrue("Could not found round " + r.getId(), r2 != null);

        assertTrue("Different attribute: getName - " + r.getName() + " <> getName - " + r2.getName(), 
                r.getName().equals(r2.getName()));
        assertTrue("Different attribute: getInvitational - " + r.getInvitational() + " <> getInvitational - " + r2.getInvitational(), 
                r.getInvitational().equals(r2.getInvitational()));
        assertTrue("Different attribute: getRated - " + r.getRated() + " <> getRated - " + r2.getRated(), 
                r.getRated().equals(r2.getRated()));
        assertTrue("Different attribute: getRegistrationLimit - " + r.getRegistrationLimit() + " <> getRegistrationLimit - " + r2.getRegistrationLimit(), 
                r.getRegistrationLimit().equals(r2.getRegistrationLimit()));
        assertTrue("Different attribute: getShortName - " + r.getShortName() + " <> getShortName - " + r2.getShortName(), 
                r.getShortName().equals(r2.getShortName()));
        assertTrue("Different attribute: getStatus - " + r.getStatus() + " <> getStatus - " + r2.getStatus(), 
                r.getStatus().equals(r2.getStatus()));
                
        DAOUtil.getFactory().getRoundDAO().delete(r2);
    }

    public void testFindDuplicateName() {
        // todo: create test data rather than use existing data from the db
        
        assertTrue("Should've found the round", DAOUtil.getFactory().getRoundDAO().findDuplicateName(1160l, "Test Integ 2", null).size() > 0);

        assertTrue("Shouldn't have found the round", DAOUtil.getFactory().getRoundDAO().findDuplicateName(1160l, "Test Integ 2", 21102l).size() == 0);

    }

    public void testGetAssignments() {
        // todo: create test data rather than use existing data from the db

        assertTrue("There are no assignments for the classroom", DAOUtil.getFactory().getRoundDAO().getAssignments(999l).size() == 0);

        assertTrue("There are assignments for the classroom", DAOUtil.getFactory().getRoundDAO().getAssignments(1160l).size() > 0);
    }

    public void testGetAssignmentsForStudent() {
        // todo: create test data rather than use existing data from the db

        assertTrue("There are no assignments for the classroom", DAOUtil.getFactory().getRoundDAO().getAssignmentsForStudent(999l, 8416646l).size() == 0);

        assertTrue("There are no assignments for the student", DAOUtil.getFactory().getRoundDAO().getAssignmentsForStudent(1160l, 999l).size() == 0);

        assertTrue("There are assignments for the student", DAOUtil.getFactory().getRoundDAO().getAssignmentsForStudent(1160l, 8416646l).size() > 0);

    }
}
