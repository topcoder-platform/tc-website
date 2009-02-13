package com.topcoder.web.common.voting;

import junit.framework.TestCase;

import java.util.ArrayList;
import java.util.List;

import com.topcoder.shared.util.logging.Logger;


/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Aug 31, 2005
 */
public class CondorcetSchulzeTestCase extends TestCase {

    private static final Logger log = Logger.getLogger(CondorcetSchulzeTestCase.class);
    private Candidate a = new Candidate("A");
    private Candidate b = new Candidate("B");
    private Candidate c = new Candidate("C");
    private Candidate d = new Candidate("D");
    private Candidate e = new Candidate("E");

    /**
     * Method setUp.
     */
    public void setUp() {
    }

    /**
     * Method tearDown.
     */
    public void tearDown() {
    }


    public void testSchwartzSetComplicated() {

        CondorcetSchulzeElection cs = getBigAWin();

        Candidate[] set = cs.getSchwartzSet();
        StringBuffer buf = new StringBuffer();
        for (int i=0; i<set.length; i++) {
            buf.append(set[i].toString()).append(",");
        }
        //log.debug("set: \n"+ buf.toString());

        assertTrue("schwartz set does not contain 1 candidate", set.length==1);
        assertTrue("schwartz set does not contain candidate A at index 0", set[0].equals(a));
    }


    public void testSchwartzSetTie() {
        CondorcetSchulzeElection cs = getABCDETie();
        Candidate[] set =cs.getSchwartzSet();
        StringBuffer buf = new StringBuffer();
        for (int i=0; i<set.length; i++) {
            buf.append(set[i].toString()).append(",");
        }
        //log.debug("set: \n"+ buf.toString());
        assertTrue("schwartz set contains the correct number of candidates", cs.getSchwartzSet().length==5);
        ArrayList list = new ArrayList();
        list.add(a);
        list.add(b);
        list.add(c);
        list.add(d);
        list.add(e);
        boolean res = false;
        for (int i=0; i<5; i++) {
            res = cs.getSchwartzSet()[i].equals(list.get(i));
        }
        assertTrue("schwartz set does not contain all the candidates on the balot", res);
    }

    public void testBeatPath() {
        CondorcetSchulzeElection cs = getAWin();
        int[][] res = new int[][] {{0,24,23,21}, {22, 0, 23, 21}, {22,22,0,21}, {-1,-1,-1,0}};
        assertTrue("beat path array is not correct", cs.getBeatPathStrengthMatrix().equals(new Matrix(cs.getCandidates(), res)));

    }

    public void testBeatPath2() {

        CondorcetSchulzeElection cs = getBDTie();
        //tie between B and D
        int[][] res = new int[][] {{0,5,5,5}, {5, 0, 7, 5}, {5,5,0,5}, {6,5,5,0}};
        assertTrue("beat path array is not correct",
                cs.getBeatPathStrengthMatrix().equals(new Matrix(cs.getCandidates(), res)));

    }

    public void testResultsBDTie() {
        CondorcetSchulzeElection cs = getBDTie();
        //tie between B and D
        CondorcetSchulzeResults csr = new CondorcetSchulzeResults(cs);
        assertFalse("has a single winner, expected 2", csr.hasSingleWinner());
        List results  = csr.getWinners();
        assertTrue("does not have 2 winners", results.size()==2);
        assertTrue("winners are not b and d, they are " + results.toString(), (((RankedResult)results.get(0)).getCandidate().equals(b)&&((RankedResult)results.get(1)).getCandidate().equals(d))
            || (((RankedResult)results.get(0)).getCandidate().equals(d)&&((RankedResult)results.get(1)).getCandidate().equals(b)));

    }


    public void testResultsBigAWin() {
        CondorcetSchulzeElection cs = getBigAWin();
        CondorcetSchulzeResults csr = new CondorcetSchulzeResults(cs);
        log.debug(csr.getResults());
        assertTrue("does not have a single winner", csr.hasSingleWinner());
        assertTrue("winner is not A", csr.getWinner().equals(a));
    }


    public void testBig() {

        CondorcetSchulzeElection cs = getBigElection();

        int[][] res = new int[][] {{0,24000,23000,21000}, {22000, 0, 23000, 21000}, {22000,22000,0,21000}, {-1,-1,-1,0}};
        assertTrue(cs.getBeatPathStrengthMatrix().equals(new Matrix(cs.getCandidates(), res)));

    }

    private CondorcetSchulzeElection getBigAWin() {
        ArrayList list = new ArrayList();
        list.add(a);
        list.add(b);
        list.add(c);
        list.add(d);

        CondorcetSchulzeElection cs = new CondorcetSchulzeElection();
        for (int i=0; i<46; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(b, 1));
            balot.add(new Vote(a, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<44; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(c, 1));
            balot.add(new Vote(a, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<50; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(d, 1));
            balot.add(new Vote(a, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<54; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(a, 1));
            balot.add(new Vote(b, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<42; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(c, 1));
            balot.add(new Vote(b, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<48; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(d, 1));
            balot.add(new Vote(b, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<56; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(a, 1));
            balot.add(new Vote(c, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<58; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(b, 1));
            balot.add(new Vote(c, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<40; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(d, 1));
            balot.add(new Vote(c, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<50; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(a, 1));
            balot.add(new Vote(d, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<52; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(b, 1));
            balot.add(new Vote(d, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<60; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(c, 1));
            balot.add(new Vote(d, 2));
            cs.addBalot(balot);
        }
        return cs;
    }
    private CondorcetSchulzeElection getABCDETie() {
        ArrayList list = new ArrayList();
        list.add(a);
        list.add(b);
        list.add(c);
        list.add(d);
        list.add(e);

        CondorcetSchulzeElection cs = new CondorcetSchulzeElection();
        for (int i=0; i<108; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(a, 1));
            balot.add(new Vote(b, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<106; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(a, 1));
            balot.add(new Vote(c, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<102; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(a, 1));
            balot.add(new Vote(d, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<90; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(a, 1));
            balot.add(new Vote(e, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<92; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(b, 1));
            balot.add(new Vote(a, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<88; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(b, 1));
            balot.add(new Vote(c, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<120; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(b, 1));
            balot.add(new Vote(d, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<114; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(b, 1));
            balot.add(new Vote(e, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<94; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(c, 1));
            balot.add(new Vote(a, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<112; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(c, 1));
            balot.add(new Vote(b, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<84; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(c, 1));
            balot.add(new Vote(d, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<118; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(c, 1));
            balot.add(new Vote(e, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<98; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(d, 1));
            balot.add(new Vote(a, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<80; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(d, 1));
            balot.add(new Vote(b, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<116; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(d, 1));
            balot.add(new Vote(c, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<104; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(d, 1));
            balot.add(new Vote(e, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<110; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(e, 1));
            balot.add(new Vote(a, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<86; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(e, 1));
            balot.add(new Vote(b, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<82; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(e, 1));
            balot.add(new Vote(c, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<96; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(e, 1));
            balot.add(new Vote(d, 2));
            cs.addBalot(balot);
        }
        return cs;

    }

    private CondorcetSchulzeElection getAWin() {
        ArrayList list = new ArrayList();
        list.add(a);
        list.add(b);
        list.add(c);
        list.add(d);

        CondorcetSchulzeElection cs = new CondorcetSchulzeElection();
        for (int i=0; i<12; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(b, 1));
            balot.add(new Vote(a, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<22; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(c, 1));
            balot.add(new Vote(a, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<17; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(d, 1));
            balot.add(new Vote(a, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<24; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(a, 1));
            balot.add(new Vote(b, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<13; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(c, 1));
            balot.add(new Vote(b, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<16; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(d, 1));
            balot.add(new Vote(b, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<14; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(a, 1));
            balot.add(new Vote(c, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<23; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(b, 1));
            balot.add(new Vote(c, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<15; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(d, 1));
            balot.add(new Vote(c, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<19; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(a, 1));
            balot.add(new Vote(d, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<20; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(b, 1));
            balot.add(new Vote(d, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<21; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(c, 1));
            balot.add(new Vote(d, 2));
            cs.addBalot(balot);
        }
        return cs;
    }

    private CondorcetSchulzeElection getBDTie() {
        ArrayList list = new ArrayList();
        list.add(a);
        list.add(b);
        list.add(c);
        list.add(d);

        CondorcetSchulzeElection cs = new CondorcetSchulzeElection();
        for (int i=0; i<3; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(a, 1));
            balot.add(new Vote(b, 2));
            balot.add(new Vote(c, 3));
            balot.add(new Vote(d, 4));
            cs.addBalot(balot);
        }
        for (int i=0; i<2; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(d, 1));
            balot.add(new Vote(a, 2));
            balot.add(new Vote(b, 3));
            balot.add(new Vote(c, 4));
            cs.addBalot(balot);
        }
        for (int i=0; i<2; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(d, 1));
            balot.add(new Vote(b, 2));
            balot.add(new Vote(c, 3));
            balot.add(new Vote(a, 4));
            cs.addBalot(balot);
        }
        for (int i=0; i<2; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(c, 1));
            balot.add(new Vote(b, 2));
            balot.add(new Vote(d, 3));
            balot.add(new Vote(a, 4));
            cs.addBalot(balot);
        }
        return cs;

    }

    private CondorcetSchulzeElection getBigElection() {
        ArrayList list = new ArrayList();
        list.add(a);
        list.add(b);
        list.add(c);
        list.add(d);

        CondorcetSchulzeElection cs = new CondorcetSchulzeElection();
        for (int i=0; i<12000; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(b, 1));
            balot.add(new Vote(a, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<22000; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(c, 1));
            balot.add(new Vote(a, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<17000; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(d, 1));
            balot.add(new Vote(a, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<24000; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(a, 1));
            balot.add(new Vote(b, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<13000; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(c, 1));
            balot.add(new Vote(b, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<16000; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(d, 1));
            balot.add(new Vote(b, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<14000; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(a, 1));
            balot.add(new Vote(c, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<23000; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(b, 1));
            balot.add(new Vote(c, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<15000; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(d, 1));
            balot.add(new Vote(c, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<19000; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(a, 1));
            balot.add(new Vote(d, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<20000; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(b, 1));
            balot.add(new Vote(d, 2));
            cs.addBalot(balot);
        }
        for (int i=0; i<21000; i++) {
            RankBalot balot = new RankBalot(list);
            balot.add(new Vote(c, 1));
            balot.add(new Vote(d, 2));
            cs.addBalot(balot);
        }
        return cs;
    }
}
