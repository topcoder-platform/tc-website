package com.topcoder.web.common.datafeed;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

/**
 * An interface for formatting items in a resultSetContainer.
 * 
 * @author Cucu
 *
 */
public interface ItemFormatter {
    String format(ResultSetContainer.ResultSetRow row, String field);
}
