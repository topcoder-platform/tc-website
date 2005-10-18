package com.topcoder.web.common.voting;

import com.topcoder.shared.util.logging.Logger;

import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Aug 31, 2005
 */
public class CondorcetSchulzeElection {

    private static final Logger log = Logger.getLogger(CondorcetSchulzeElection.class);
    private List candidates = null;
    private List balots = null;
    private Matrix sumMatrix = null;

    public CondorcetSchulzeElection() {
        balots = new ArrayList(1000);
    }

    public void addBalot(RankBalot balot) {
        if (candidates==null) {
            candidates = balot.getCandidates();
        }
        balots.add(balot);
    }

    public Candidate getWinner() {
        Matrix m = getSumMatrix();

        return null;
    }

    private Matrix getSumMatrix() {
        if (sumMatrix==null){
            Matrix sum = new Matrix((RankBalot)balots.get(0));
            for (int i=1; i<balots.size(); i++) {
                sum = Matrix.add(sum, new Matrix((RankBalot)balots.get(i)));
            }
            sumMatrix = sum;
        }
        return sumMatrix;
    }

    public List getSchwartzSet() {
        Matrix m = getSumMatrix();
        int[] loses = new int[candidates.size()];
        Arrays.fill(loses, 0);
        for (int i=0; i<candidates.size(); i++) {
            for (int j=0; j<candidates.size(); j++) {
                if (i!=j) {
                    if (m.beat((Candidate)candidates.get(i), (Candidate)candidates.get(j))) {
                        loses[j]++;
                    }
                }
            }
        }

        ArrayList ret = new ArrayList();
        for (int i=0; i<loses.length; i++) {
            if (loses[i]==0) {
                ret.add(candidates.get(i));
            }
        }

        return ret;
    }


}
