package com.topcoder.utilities.cheaterChecker;

public interface Fraud {
    final static int MAX_REPORT = 20;
    String getReport();
    void execute() throws Exception;
}
