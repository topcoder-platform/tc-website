package com.topcoder.utilities.cheaterChecker;

import com.topcoder.shared.util.logging.Logger;

import java.util.List;
import java.util.ArrayList;
import java.util.Collections;

public class SimilarHistogram implements Fraud {
    private static Logger log = Logger.getLogger(SimilarHistogram.class);
    private StringBuffer report = null;
    private List tokens = null;
    private List submissions = null;

    public SimilarHistogram(List tokens, List submissions) {
        report = new StringBuffer(submissions.size() * 10);
        this.tokens = tokens;
        this.submissions = submissions;
    }

    public void execute() throws Exception {
        ArrayList results = new ArrayList(Util.magic(tokens.size()));
        TokenHistogram t1 = null;
        TokenHistogram t2 = null;
        Submission s1 = null;
        Submission s2 = null;
        for (int i = 0; i < tokens.size() - 1; i++) {
            for (int j = i + 1; j < tokens.size(); j++) {
                s1 = (Submission)submissions.get(i);
                s2 = (Submission)submissions.get(j);
                if (s1.isIncluded() || s2.isIncluded()) {
                    t1 = new TokenHistogram(((TokenizedSource) tokens.get(i)).getTokens());
                    t2 = new TokenHistogram(((TokenizedSource) tokens.get(j)).getTokens());
                    int val = t1.getDifference(t2);
                    results.add(new ComparisonResult(i, j, val));
                }
            }
        }
        log.debug("completed comparisons");
        double avg = Util.avg(results);
        double stddev = Util.stddev(results);
        report.append("\n");
        report.append("avg histogram difference is " + avg + "\n");
        report.append("std dev histogram difference is " + stddev + "\n");
        Collections.sort(results);
        ComparisonResult r = null;
        for (int i = 0; i < MAX_REPORT && i < results.size(); i++) {
            r = (ComparisonResult)results.get(i);
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

    public String getReport() {
        return report.toString();
    }


}
