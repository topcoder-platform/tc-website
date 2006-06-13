package com.topcoder.utilities.cheaterChecker;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 15, 2006
 */
public class ExampleSubmission extends Submission {

    public String getReportInfo() {
        StringBuffer report = new StringBuffer(100);
        report.append(getHandle());
        report.append("(");
        report.append(getCoderId());
        report.append(")");
        report.append(" ");
        report.append("exs");
        report.append(getSubmissionNumber());
        return report.toString();
    }

}
