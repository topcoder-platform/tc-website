package com.topcoder.utilities.cheaterChecker;

import com.topcoder.shared.util.logging.Logger;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class CPS implements Fraud {
    private static Logger log = Logger.getLogger(CPS.class);
    private StringBuffer report = null;
    private List submissions = null;
    private static final double STD_DEV_THRESHHOLD = 2.0D;
    private ArrayList potentialViolators = new ArrayList();

    public CPS(List submissions) {
        report = new StringBuffer(submissions.size() * 10);
        this.submissions = submissions;
    }

    public void execute() throws Exception {
        ArrayList results = new ArrayList(submissions.size());
        Submission s1 = null;
        for (int i = 0; i < submissions.size(); i++) {
            s1 = (Submission) submissions.get(i);
            if (s1.isIncluded()) {
                double cps = (double) s1.getSource().length() * 1000 / (s1.getSubmitTime() - s1.getOpenTime());
                results.add(new SimpleResult(i, cps));
            }
        }

        log.debug("completed comparisons");
        double avg = Util.avg(results);
        double stddev = Util.stddev(results);
        report.append("\n");
        report.append("avg characters per second is " + avg + "\n");
        report.append("std dev of characters per second is " + stddev + "\n");
        Collections.sort(results);
        double suspicious = avg + STD_DEV_THRESHHOLD * stddev;
        SimpleResult r = null;
        for (int i = results.size() - 1, k = 0; i > -1 && k < MAX_REPORT; i--, k++) {
            r = (SimpleResult) results.get(i);
            if (r.getValue() > suspicious) {
                s1 = (Submission) submissions.get(r.getIndex());
                report.append(r.getValue());
                report.append("  ");
                report.append(s1.getHandle());
                report.append("\n");
                potentialViolators.add(new User(s1.getCoderId(), s1.getHandle()));
            } else {
                break;
            }
        }
    }

    public String getReport() {
        return report.toString();
    }

    public List getPotentialViolators() {
        return potentialViolators;
    }
}
