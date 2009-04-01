package com.topcoder.dde.util.DWLoad;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

public interface ReliabilityCalculator {
    public void calculateReliability(Connection conn, int historyLength, int competitionTypeId, Date startDate, Date pivotDate) throws SQLException;
}	