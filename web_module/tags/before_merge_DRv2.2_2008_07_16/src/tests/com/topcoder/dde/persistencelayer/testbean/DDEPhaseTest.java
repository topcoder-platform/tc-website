package com.topcoder.dde.persistencelayer.testbean;

import java.util.Collection;
import javax.ejb.CreateException;
import javax.ejb.FinderException;
import javax.ejb.RemoveException;
import javax.naming.NamingException;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDEPhase;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEPhaseHome;

public final class DDEPhaseTest extends DDEServerTestCase {

    static final long PHASE_ID = 0;

    private static final String DESCRIPTION = "Phase0";

    private LocalDDEPhaseHome phaseHome;

    DDEPhaseTest() {
    }

    private static LocalDDEPhase create() throws CreateException {
        try {
            LocalDDEPhaseHome phaseHome = lookup();
            return phaseHome.create(PHASE_ID, DESCRIPTION);
        } catch (NamingException e) {
            throw new CreateException("" + e);
        }
    }

    private static LocalDDEPhaseHome lookup() throws NamingException {
        return (LocalDDEPhaseHome) lookup(LocalDDEPhaseHome.EJB_REF_NAME);
    }

    protected void setUp() throws NamingException {
        phaseHome = lookup();
    }

    public void test() throws Exception {
        String description = DESCRIPTION;
        LocalDDEPhase phase;
        try {
            phase = phaseHome.findByPrimaryKey(new Long(PHASE_ID));
            phase.remove();
        } catch (FinderException e) {
        }
        phase = testCreate();
        Long primaryKey = testFindByPrimaryKey(phase);
        testFindByDescription(description);
        testGetDescription(phase, description);
        testSetDescription(phase);
        testRemove(phase, primaryKey);
        testCreate();
    }

    private void testSetDescription(LocalDDEPhase phase) {
        String description2 = "Desc2";
        phase.setDescription(description2);
        testGetDescription(phase, description2);
    }

    private void testGetDescription(LocalDDEPhase phase, String description) {
        String description2 = phase.getDescription();
        assertEquals(description, description2);
    }

    private void testRemove(LocalDDEPhase phase, Long primaryKey) throws RemoveException {
        phase.remove();
        try {
            phaseHome.findByPrimaryKey(primaryKey);
            fail();
        } catch (FinderException e) {
        }
    }

    private void testFindByDescription(String description) throws FinderException {
        Collection collection = phaseHome.findByDescription(description);
        assertTrue(collection.size() > 0);
    }

    private Long testFindByPrimaryKey(LocalDDEPhase phase) throws FinderException {
        Long primaryKey = (Long) phase.getPrimaryKey();
        LocalDDEPhase phase2 = phaseHome.findByPrimaryKey(primaryKey);
        assertTrue(phase.isIdentical(phase2));
        return primaryKey;
    }

    private LocalDDEPhase testCreate() throws Exception {
        Collection allExisted = phaseHome.findAll();
        LocalDDEPhase phase = create();
        Collection all = phaseHome.findAll();
        assertEquals(allExisted.size() + 1, all.size());
        return phase;
    }

}
