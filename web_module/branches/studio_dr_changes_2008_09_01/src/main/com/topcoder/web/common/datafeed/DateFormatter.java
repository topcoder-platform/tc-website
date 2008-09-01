package com.topcoder.web.common.datafeed;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;

/**
 * Formats a date when the field value is a number of milliseconds
 * 
 * @author Cucu
 *
 */
public class DateFormatter implements ItemFormatter {

    public String format(ResultSetRow row, String field) {
        Date d = new Date(row.getLongItem(field));
        return new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").format(d);
    }

}
