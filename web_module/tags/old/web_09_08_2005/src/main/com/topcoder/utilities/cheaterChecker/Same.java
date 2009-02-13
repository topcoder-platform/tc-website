package com.topcoder.utilities.cheaterChecker;

import com.topcoder.shared.util.logging.Logger;

import java.util.ArrayList;
import java.util.List;

public class Same implements Fraud {
    private static Logger log = Logger.getLogger(Same.class);
    private StringBuffer report = null;
    private List tokens = null;
    private List submissions = null;
    private ArrayList potentialViolators = new ArrayList();
    private int reportCount;

    public Same(List tokens, List submissions, int reportCount) {
        report = new StringBuffer(submissions.size() * 10);
        this.tokens = tokens;
        this.submissions = submissions;
        this.reportCount = reportCount;
    }

    public void execute() throws Exception {
        List l1 = null;
        List l2 = null;
        Submission s1 = null;
        Submission s2 = null;
        report.append("\n");
        for (int i = 0; i < tokens.size() - 1; i++) {
            for (int j = i + 1; j < tokens.size(); j++) {
                s1 = (Submission) submissions.get(i);
                s2 = (Submission) submissions.get(j);
                if ((s1.isIncluded() || s1.isIncluded()) && s1.getLanguageId() == s2.getLanguageId() && s1.getCoderId() != s2.getCoderId()) {
                    l1 = ((TokenizedSource) tokens.get(i)).getTokens();
                    l2 = ((TokenizedSource) tokens.get(j)).getTokens();
                    if (l1.equals(l2)) {
                        report.append(s1.getHandle());
                        report.append("(");
                        report.append(s1.getCoderId());
                        report.append(")");
                        report.append(" is the same as ");
                        report.append(s2.getHandle());
                        report.append("(");
                        report.append(s2.getCoderId());
                        report.append(")");
                        report.append("\n");
                        potentialViolators.add(new User(s1.getCoderId(), s1.getHandle()));
                        potentialViolators.add(new User(s2.getCoderId(), s2.getHandle()));

                    }
                }
//                if (count%10==0) log.debug(""+ count + " comparisons made");
            }
        }
        log.debug("completed comparisons");
    }

    public String getReport() {
        return report.toString();
    }

    public List getPotentialViolators() {
        return potentialViolators;
    }

}
