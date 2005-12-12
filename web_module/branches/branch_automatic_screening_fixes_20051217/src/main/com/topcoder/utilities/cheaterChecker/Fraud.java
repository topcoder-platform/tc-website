package com.topcoder.utilities.cheaterChecker;

import java.util.List;

public interface Fraud {
    final static int MAX_REPORT = 100;

    String getReport();

    void execute() throws Exception;

    List getPotentialViolators();
}
