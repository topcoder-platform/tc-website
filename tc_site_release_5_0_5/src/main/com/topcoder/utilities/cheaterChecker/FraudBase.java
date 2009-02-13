package com.topcoder.utilities.cheaterChecker;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 17, 2006
 */
public abstract class FraudBase implements Fraud {
    private int reportSize = MAX_REPORT;

    public int getReportSize() {
        return reportSize;
    }

    public void setReportSize(int reportSize) {
        this.reportSize = reportSize;
    }
}
