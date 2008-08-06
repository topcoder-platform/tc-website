/*
 * Copyright (C) 2007 TopCoder Inc., All Rights Reserved.
 */
/**
 * @since 4.0
 */
package com.topcoder.web.winformula.controller.request;

import java.util.List;

import com.topcoder.util.format.ObjectFormatter;
import com.topcoder.web.tag.paging.RowDataTag;
import com.topcoder.web.tag.paging.RowRenderer;


/**
 * This class is a concrete implemLentation of RowRenderer interface. This class provides an implementation in which all
 * the grouped columns are displayed as a single cell spanning over multiple rows sharing the values.
 *
 * <p>
 * <strong>Thread Safety:</strong> This class has no instance members and hence thread safe.
 * </p>
 *
 * @author prunthaban, TCSDEVELOPER
 * @version 4.0
 *
 * @since 4.0
 */
public class SimpleEvenOddRowRenderer implements RowRenderer {
    /**
     * <p>
     * Empty constructor.
     * </p>
     */
    public SimpleEvenOddRowRenderer() {
        // Empty
    }

    /**
     * <p>
     * This method is responsible for returning well formed html mark-up for a row in which all the grouped columns are
     * displayed as a single cell spanning over multiple rows sharing the values.
     * </p>
     *
     * <p>
     * The rowData should not be null. If it is null, throw IllegalArgumentException.
     * </p>
     *
     * @param rowDataTag <code>RowDataTag</code> associated with this renderer
     *
     * @return a string containing html mark-up for a row
     *
     * @throws IllegalArgumentException if the rowDataTag is null
     */
    public String renderRow(RowDataTag rowDataTag) {
        if (rowDataTag == null) {
            throw new IllegalArgumentException("The argument 'rowDataTag' should not be null.");
        }

        StringBuffer buffer = new StringBuffer();

        buffer.append(getFormattedOpenRow(rowDataTag));

        buffer.append(getFormattedNonGroupColumns(rowDataTag));
        buffer.append("</tr>");

        return buffer.toString();
    }

    
    private String getFormattedOpenRow(RowDataTag rowDataTag) {
        StringBuffer buffer = new StringBuffer();
        buffer.append("<tr");

        String rowStyle = rowDataTag.getStyleForCurrentRow();

        if (rowStyle != null) {
            // Write the class attribute
            buffer.append(" class=\"").append(rowStyle).append("\"");
        }

        buffer.append(">");

        return buffer.toString();
    }

    static String getFormattedNonGroupColumns(RowDataTag rowDataTag) {
        StringBuffer buffer = new StringBuffer();

        // Get the current row data List
        List row = (List) rowDataTag.getRow();

        // For each non-grouped column, write a td tag
        for (int idx = 0; idx < row.size(); ++idx) {
            buffer.append("<td>").append(getFormattedItem(rowDataTag, row, idx)).append("</td>");
        }

        return buffer.toString();
    }


    static String getFormattedItem(RowDataTag rowDataTag, List row, int index) {
        List formatters = rowDataTag.getFormatters();

        if ((formatters != null) && (index < formatters.size())) {
            return ((ObjectFormatter) formatters.get(index)).format(row.get(index));
        }

        return row.get(index).toString();
    }

}
