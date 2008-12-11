package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.*;
import com.topcoder.web.reg.TCHibernateTestCase;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

/**
 * @author dok
 * @version $Revision: 53709 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 13, 2006
 */
public class DemographicAssignmentDAOTestCase extends TCHibernateTestCase {

/*    public void testLoadList() {
    CoderType ct = Util.getFactory().getCoderTypeDAO().find(new Integer(1));
    RegistrationType rt = Util.getFactory().getRegistrationTypeDAO().find(new Integer(1));
    HashSet h = new HashSet();
    h.add(rt);
    List l = Util.getFactory().getDemographicAssignmentDAO().getAssignments(ct, Util.getFactory().getStateDAO().find("CO"), h);
    assertTrue("no assignments found", l!=null && !l.isEmpty());
}


public void testRequired() {
    CoderType ct = Util.getFactory().getCoderTypeDAO().find(new Integer(1));
    RegistrationType rt = Util.getFactory().getRegistrationTypeDAO().find(new Integer(1));
    HashSet h = new HashSet();
    h.add(rt);
    List l = Util.getFactory().getDemographicAssignmentDAO().getAssignments(ct,Util.getFactory().getStateDAO().find("CO"), h);
    boolean error = false;
    for (Iterator it = l.iterator(); it.hasNext();) {
        try {
            ((DemographicAssignment)it.next()).isRequired();
        } catch (Throwable e) {
            error = true;
        }

    }
    assertTrue("problem getting is required field", !error);
}*/

    public void testDecline() {
        CoderType ct = DAOUtil.getFactory().getCoderTypeDAO().find(new Integer(1));
        RegistrationType rt = DAOUtil.getFactory().getRegistrationTypeDAO().find(new Integer(1));
        HashSet h = new HashSet();
        h.add(rt);
        List l = DAOUtil.getFactory().getDemographicAssignmentDAO().getAssignments(ct, DAOUtil.getFactory().getStateDAO().find("VT"), h);
        boolean allFound = true;
        DemographicQuestion dq;
        for (Iterator it = l.iterator(); it.hasNext() && allFound;) {
            dq = ((DemographicAssignment) it.next()).getQuestion();
            if (dq.isMultipleSelect() || dq.isSingleSelect()) {
                boolean found = false;
                for (Iterator it1 = dq.getAnswers().iterator(); it1.hasNext() && !found;) {
                    DemographicAnswer da = (DemographicAnswer) it1.next();
                    if (da == null) {
                        log.debug("friggin answer is null!!!!!!");
                    }
                    found = DemographicAnswer.DECLINE.equals(da.getText());
                }
                if (!found) {
                    allFound = false;
                    log.debug("couldn't find decline on question " + dq.getText());
                }
            }
        }
        assertTrue("didn't find all the decline to answers we were supposed to", allFound);
    }


}
