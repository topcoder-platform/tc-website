package com.topcoder.utilities.cheaterChecker;

import com.topcoder.shared.util.logging.Logger;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;

/**
 * This fraud detection module takes the given list of tokenized
 * source and checks how many tokens a each item shares in common
 * with every other item.  it calculates this number as a
 * percentage in common, and of course calculates the avg
 * percent difference and standard deviation.
 */
public class Similar extends FraudBase {
    private static Logger log = Logger.getLogger(Similar.class);
    private StringBuffer report = null;
    private List tokens = null;
    private List submissions = null;
    private static final double STD_DEV_THRESHHOLD = 2.0D;
    private ArrayList potentialViolators = new ArrayList();
    private int reportCount;

    public Similar(List tokens, List submissions, int reportCount) {
        report = new StringBuffer(submissions.size() * 10);
        this.tokens = tokens;
        this.submissions = submissions;
        this.reportCount = reportCount;
    }

    public void execute() throws Exception {
        ArrayList results = new ArrayList(Util.magic(tokens.size()));
        List l1 = null;
        List l2 = null;
        Submission s1 = null;
        Submission s2 = null;
        log.debug("got " + tokens.size() + " tokens");
        for (int i = 0; i < tokens.size() - 1; i++) {
            for (int j = i + 1; j < tokens.size(); j++) {
                s1 = (Submission) submissions.get(i);
                s2 = (Submission) submissions.get(j);
                if ((s1.isIncluded() || s2.isIncluded()) && s1.getLanguageId() == s2.getLanguageId() && s1.getCoderId() != s2.getCoderId())
                {
                    l1 = ((TokenizedSource) tokens.get(i)).getTokens();
                    l2 = ((TokenizedSource) tokens.get(j)).getTokens();
                    int sim1 = 0;
                    int sim2 = 0;

                    double similarPercentage = 0d;
                    if (l1.size() > 0 && l2.size() > 0) {
                        for (int k = 0; k < l1.size(); k++) {
                            if (l2.contains(l1.get(k))) sim1++;
                        }
                        for (int k = 0; k < l2.size(); k++) {
                            if (l1.contains(l2.get(k))) sim2++;
                        }
                        similarPercentage = ((double) sim1 / (double) l1.size() + (double) sim2 / (double) l2.size()) / 2d;
                    }

                    if (log.isDebugEnabled()) {
                        if (Double.isNaN(similarPercentage)) {
                            log.debug("sim1 " + sim1 + " lisize " + l1.size() + " sim2 " + sim2 + " l2size " + l2.size());
                        }
                    }
                    results.add(new ComparisonResult(i, j, similarPercentage));
                }
            }
        }
        log.debug("completed comparisons " + results.size());
        double avg = Util.avg(results);
        double stddev = Util.stddev(results);
        report.append("\n");
        report.append("avg similarity percentage is " + avg + "\n");
        report.append("std dev similarity percentage is " + stddev + "\n");
        Collections.sort(results);
        double suspicious = avg + STD_DEV_THRESHHOLD * stddev;
        ComparisonResult r = null;
        HashSet violateSet = new HashSet();
        for (int i = results.size() - 1, k = 0; i > -1 && k < reportCount; i--, k++) {
            r = (ComparisonResult) results.get(i);
            if (r.getValue() > suspicious) {
                s1 = (Submission) submissions.get(r.getIndex1());
                s2 = (Submission) submissions.get(r.getIndex2());
                //only add them if they're not already in there
                if (!violateSet.contains(s1.getCoderId() + " " + s1.getCoderId())) {
                    report.append(r.getValue());
                    report.append("  ");
                    report.append(s1.getReportInfo());
                    report.append(" ");
                    report.append(s2.getReportInfo());
                    report.append("\n");
                    potentialViolators.add(new User(s1.getCoderId(), s1.getHandle()));
                    potentialViolators.add(new User(s2.getCoderId(), s2.getHandle()));
                    violateSet.add(s1.getCoderId() + " " + s1.getCoderId());
                }
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
