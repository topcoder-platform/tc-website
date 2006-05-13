package com.topcoder.web.reg.dao;


import com.topcoder.web.reg.TCHibernateTestCase;
import com.topcoder.web.reg.model.CoderType;

import java.util.Iterator;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 28, 2006
 */
public class CoderTypeDAOTestCase extends TCHibernateTestCase {

    public void testGetCoderTypes() {
        List coderTypes = Util.getFactory().getCoderTypeDAO().getCoderTypes();
        boolean foundStudent = false;
        boolean foundPro = false;

        CoderType curr;
        for (Iterator it = coderTypes.iterator(); it.hasNext();) {
            curr = (CoderType) it.next();
            if (curr.getId().equals(CoderType.STUDENT)) {
                foundStudent = true;
            } else if (curr.getId().equals(CoderType.PROFESSIONAL)) {
                foundPro = true;
            }
        }
        assertTrue("does not have student codertype", foundStudent);
        assertTrue("does not have pro codertype", foundPro);

    }

    public void testFind() {
        CoderType stud = Util.getFactory().getCoderTypeDAO().find(CoderType.STUDENT);
        CoderType pro = Util.getFactory().getCoderTypeDAO().find(CoderType.PROFESSIONAL);
        assertTrue("could not find the student type", stud != null && stud.getId().equals(CoderType.STUDENT));
        assertTrue("could not find the pro type", pro != null && pro.getId().equals(CoderType.PROFESSIONAL));
    }

}
