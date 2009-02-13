package com.topcoder.web.common.dao;

import java.util.List;

import com.topcoder.web.common.model.MemberContactBlackList;
import com.topcoder.web.common.model.User;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author cucu
 * @version $Revision: 53709 $ Date: 2005/01/01 00:00:00
 *          Create Date: July 24, 2006
 */
public class MemberContactBlackListDAOTestCase extends TCHibernateTestCase {


    public void testFind1() {
    	User u1 = DAOUtil.getFactory().getUserDAO().find(new Long(7545675));
    	User u2 = DAOUtil.getFactory().getUserDAO().find(new Long(14882871));
        MemberContactBlackList bl = DAOUtil.getFactory().getMemberContactBlackListDAO().find(u2, u1);
        assertNotNull("there should be an entry in black_list with (cucu, pulky)", bl);
        assertFalse("pulky should not be blocked by cucu", bl.isBlocked());
    }

    public void testFind2() {
    	User u1 = DAOUtil.getFactory().getUserDAO().find(new Long(7545675));
    	User u2 = DAOUtil.getFactory().getUserDAO().find(new Long(144400));
        MemberContactBlackList bl = DAOUtil.getFactory().getMemberContactBlackListDAO().find(u2, u1);
        assertNull("there should not be an entry in black_list with (cucu, tomek)", bl);
    }

    public void testFindOrCreate() {
    	User u1 = DAOUtil.getFactory().getUserDAO().find(new Long(7545675));
    	User u2 = DAOUtil.getFactory().getUserDAO().find(new Long(144400));
        MemberContactBlackList bl = DAOUtil.getFactory().getMemberContactBlackListDAO().findOrCreate(u2, u1);
        assertNotNull("findOrCreate returned null", bl);
        assertFalse("must not be blocked", bl.isBlocked());
    }
    
    public void testGetPreviouslyBlockedUsers() {
        List l = DAOUtil.getFactory().getMemberContactBlackListDAO().getPreviouslyBlockedUsers(new Long(7545675));
        assertTrue("previously blocked users expected", l != null && !l.isEmpty());
    }



}
