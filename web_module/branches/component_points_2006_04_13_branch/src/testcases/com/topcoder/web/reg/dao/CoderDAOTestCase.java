package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.TCHibernateTestCase;
import com.topcoder.web.reg.model.Coder;
import com.topcoder.web.reg.model.Resume;

import java.util.Iterator;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 25, 2006
 */
public class CoderDAOTestCase extends TCHibernateTestCase {

    public void testFind() {

        Coder tomek = Util.getFactory().getCoderDAO().find(new Long(144400));

        assertTrue("could not load tomek", tomek != null);

    }

    public void testResumeLoad() {
        Coder dok = Util.getFactory().getCoderDAO().find(new Long(132456));

        Iterator it = dok.getResumes().iterator();
        Resume r = (Resume)it.next();
        log.debug("resume is " + r.getFileName());
        assertFalse("could not find dok's resume", dok.getResumes().isEmpty());

    }

}
