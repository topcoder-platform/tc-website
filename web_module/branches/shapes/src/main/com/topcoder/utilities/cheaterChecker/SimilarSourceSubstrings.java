package com.topcoder.utilities.cheaterChecker;

import com.topcoder.shared.util.logging.Logger;

import java.util.List;
import java.util.ArrayList;
import java.util.Collections;

public class SimilarSourceSubstrings implements Fraud {
    private static Logger log = Logger.getLogger(SimilarSourceSubstrings.class);
    private StringBuffer report = null;
    private List tokens = null;
    private List submissions = null;
    private static final double STD_DEV_THRESHHOLD = 3.0D;

    public SimilarSourceSubstrings(List tokens, List submissions) {
        report = new StringBuffer(submissions.size() * 10);
        this.tokens = tokens;
        this.submissions = submissions;
    }

    public void execute() throws Exception {
        ArrayList results = new ArrayList(Util.magic(tokens.size()));
        Submission s1 = null;
        Submission s2 = null;
        for (int i = 0; i < tokens.size() - 1; i++) {
            for (int j = i + 1; j < tokens.size(); j++) {
                s1 = (Submission) submissions.get(i);
                s2 = (Submission) submissions.get(j);
                if ((s1.isIncluded() || s2.isIncluded()) && s1.getLanguageId()==s2.getLanguageId()) {
                    int val = Util.getLongestCommonSubsequence(((TokenizedSource) tokens.get(i)).getTokens(),
                            ((TokenizedSource) tokens.get(j)).getTokens(), true);
                    results.add(new ComparisonResult(i, j, val));
                }
            }
        }
        log.debug("completed comparisons");
        double avg = Util.avg(results);
        double stddev = Util.stddev(results);
        report.append("\n");
        report.append("avg similar substrings is " + avg + "\n");
        report.append("std dev of similar substrings is " + stddev + "\n");
        Collections.sort(results);
        double suspicious = avg + STD_DEV_THRESHHOLD * stddev;
        ComparisonResult r = null;
        for (int i=results.size()-1, k=0; i>-1&&k<MAX_REPORT; i--,k++) {
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
            }
        }
    }

    public String getReport() {
        return report.toString();
    }


}
