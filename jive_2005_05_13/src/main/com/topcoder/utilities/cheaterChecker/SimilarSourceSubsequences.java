package com.topcoder.utilities.cheaterChecker;

import com.topcoder.shared.util.logging.Logger;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class SimilarSourceSubsequences implements Fraud {
    private static Logger log = Logger.getLogger(SimilarSourceSubsequences.class);
    private StringBuffer report = null;
    private List tokens = null;
    private List submissions = null;
    private static final double STD_DEV_THRESHHOLD = 5.0D;
    private ArrayList potentialViolators = new ArrayList();
    private int reportCount;

    public SimilarSourceSubsequences(List tokens, List submissions, int reportCount) {
        report = new StringBuffer(submissions.size() * 10);
        this.tokens = tokens;
        this.submissions = submissions;
        this.reportCount = reportCount;
    }

    public void execute() throws Exception {
        ArrayList results = new ArrayList(Util.magic(tokens.size()));
        Submission s1 = null;
        Submission s2 = null;
        for (int i = 0; i < tokens.size() - 1; i++) {
            for (int j = i + 1; j < tokens.size(); j++) {
                s1 = (Submission) submissions.get(i);
                s2 = (Submission) submissions.get(j);
                if ((s1.isIncluded() || s2.isIncluded()) && s1.getLanguageId() == s2.getLanguageId() && s1.getCoderId() != s2.getCoderId()) {
                    int val = Util.getLongestCommonSubsequence(((TokenizedSource) tokens.get(i)).getTokens(),
                            ((TokenizedSource) tokens.get(j)).getTokens(), false);
                    results.add(new ComparisonResult(i, j, val));
                }
            }
        }
        log.debug("completed comparisons");
        double avg = Util.avg(results);
        double stddev = Util.stddev(results);
        report.append("\n");
        report.append("avg similar subsequences is " + avg + "\n");
        report.append("std dev of similar subsequences is " + stddev + "\n");
        Collections.sort(results);
        double suspicious = avg + STD_DEV_THRESHHOLD * stddev;
        ComparisonResult r = null;
        for (int i = results.size() - 1, k = 0; i > -1 && k < reportCount; i--, k++) {
            r = (ComparisonResult) results.get(i);
            if (r.getValue() > suspicious) {
                s1 = (Submission) submissions.get(r.getIndex1());
                s2 = (Submission) submissions.get(r.getIndex2());
                report.append(r.getValue());
                report.append("  ");
                report.append(s1.getHandle());
                report.append("(");
                report.append(s1.getCoderId());
                report.append(")");
                report.append(" ");
                report.append(s2.getHandle());
                report.append("(");
                report.append(s2.getCoderId());
                report.append(")");
                report.append("\n");
                potentialViolators.add(new User(s1.getCoderId(), s1.getHandle()));
                potentialViolators.add(new User(s2.getCoderId(), s2.getHandle()));
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
