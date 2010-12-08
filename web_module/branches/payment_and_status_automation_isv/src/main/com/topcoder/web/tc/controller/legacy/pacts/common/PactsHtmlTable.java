/**
 * This class with generate the html required to diplay
 * a table given a tableModel.  This is where all of the
 * GUI related information is held.  The model just holds the
 * string that will be displayed (however hrefs could go in the
 * model elements).
 *
 * @author Sam King
 */

package com.topcoder.web.tc.controller.legacy.pacts.common;

public class PactsHtmlTable {
    private PactsMemberTableModel tableData;

    private String bgcolor = null;
    private String border = null;
    private String cellSpacing = null;
    private String cellPadding = null;
    private String width = null;
    private String[] rowColor;
    private String[] columnWidth;
    private String[][] fontSize;
    private boolean[][] isBold;

    // new attribute for CSS stylesheet classname
    // added by Steve Burrows during initial PACTS implementation
    private String[][] className = null;


    /**
     * the constructor takes a model as the argument.  This model
     * is how the data is stored, this class adds all astestic qualities.
     * This class assumes that the number of rows and cols does not
     * change in the tableData once it has been passed to this class
     *
     * @param tableData the data that is to be displayed in the html table
     *
     */
    public PactsHtmlTable(PactsMemberTableModel tableData) {
        this.tableData = tableData;

        rowColor = new String[tableData.getNumRows()];
        columnWidth = new String[tableData.getNumCols()];
        fontSize = new String[tableData.getNumRows()][tableData.getNumCols()];
        className = new String[tableData.getNumRows()][tableData.getNumCols()];
        isBold = new boolean[tableData.getNumRows()][tableData.getNumCols()];

        for (int i = 0; i < tableData.getNumRows(); i++) {
            rowColor[i] = null;
            for (int j = 0; j < tableData.getNumCols(); j++) {
                columnWidth[j] = null;
                fontSize[i][j] = null;
                isBold[i][j] = false;
            }
        }
    }

    /**
     * used as a quick way to get access to the model.
     *
     * @return PactsMemberTableModel a reference to the current table model
     */
    public PactsMemberTableModel getTableModel() {
        return tableData;
    }

    /**
     * this method is how the html is created from the model, based on
     * all of the parameters that have ben set.
     *
     * @return the html necisarry to generate the table
     */
    public String getHtml() {
        // build the table
        StringBuffer buf = new StringBuffer();
        buf.append("<table ");

        //check the attributes
        setTableProperties(buf);

        buf.append(">");
        for (int row = 0; row < tableData.getNumRows(); row++) {
            buf.append("<tr ");
            //check row attributes
            if (rowColor[row] != null) {
                buf.append("bgcolor=\"" + rowColor[row] + "\" ");
            }
            buf.append(">");
            for (int col = 0; col < tableData.getNumCols(); col++) {
                buf.append("<td");
                if (className != null && className[row][col] != null) {
                    buf.append(" class=\"" + className[row][col] + "\"");
                }
                if (columnWidth != null && columnWidth[col] != null) {
                    buf.append(" width=\"" + columnWidth[col] + "\"");
                }
                buf.append(">");
                // set anything that applies to this cell
                if (isBold[row][col]) {
                    buf.append("<b>");
                }
                if (fontSize != null && fontSize[row][col] != null) {
                    buf.append("<font size=\"" + fontSize[row][col] + "\">");
                }

                buf.append(tableData.getElement(row, col));

                // finish up any cell attributes
                if (fontSize != null && fontSize[row][col] != null) {
                    buf.append("</font>");
                }
                if (isBold[row][col]) {
                    buf.append("</b>");
                }

                buf.append("</td>");
            }
            buf.append("</tr>");
        }
        buf.append("</table>");

        return buf.toString();
    }

    /**
     * this is a private function meant to be used for setting the
     * table wide properties.  It acts on the String buffer based
     * on the properties set by the user
     */
    private void setTableProperties(StringBuffer buf) {
        if (bgcolor != null) {
            buf.append("BGCOLOR=" + bgcolor + " ");
        }
        if (cellPadding != null) {
            buf.append("CELLPADDING=" + cellPadding + " ");
        }
        if (cellSpacing != null) {
            buf.append("CELLSPACING=" + cellSpacing + " ");
        }
        if (border != null) {
            buf.append("BORDER=" + border + " ");
        }
        if (width != null) {
            buf.append("WIDTH=" + width + " ");
        }
    }

    /**
     * this method will set the background color of the table.  It does
     * not know anything about java color vs html, etc, it just
     * puts the string in the correct place for bgcolor.
     *
     * @param color the string that represnets color in html.  For example
     *        the color while is "#FFFFFF" (including the quotes)
     */
    public void setBgcolor(String color) {
        bgcolor = color;
    }

    /**
     * this method will set the border width in pixels.  This attribute
     * is passed in as a string, but the browser will interpret it
     * as an int, so make sure it is a string rep of an int.  This
     * method will not do any type checking.
     *
     * @param border the number of pixels (string rep) for the border
     */
    public void setBorder(String border) {
        this.border = border;
    }

    /**
     * this method will set the cell padding. It should be the string
     * rep of an int, there is no type checking in this method
     *
     * @param cellPadding the number of pixels to pad each cell by
     */
    public void setCellPadding(String cellPadding) {
        this.cellPadding = cellPadding;
    }

    /**
     * this method is used to set the cell spacing.  It should be
     * a string rep of an int, this method does no type checking
     *
     * @param cellSpacing the number of pixels inbetween cells
     */
    public void setCellSpacing(String cellSpacing) {
        this.cellSpacing = cellSpacing;
    }

    /**
     * used to specify the width of the entire table.
     *
     * @param width the width of the entire table.  Can be specified
     *        in either percentage or pixels.  If it is pct then 50%
     *        would be "50%" (including the quotes) and 50 pixels
     *        would be "50" (again, inluding the quotes).
     *
     */
    public void setWidth(String width) {
        this.width = width;
    }


    // BEGIN -- added by Steve Burrows during initial PACTS implementation

    /**
     * used to specify the CSS class name for the table
     *
     * @param CSS stylesheet class name.
     *
     */
    public void setClassName(String className) {
        for (int row = 0; row < tableData.getNumRows(); row++) {
            for (int col = 0; col < tableData.getNumCols(); col++) {
                setCellClassName(row, col, className);
            }
        }
    }

    /**
     * this is used to set the CSS stylesheet classname an individual cell
     *
     * @param row the 0 based row of the table
     * @param col the 0 based col of the table
     * @param size a string that represents the CSS stylesheet class name of
     * a given cell.
     */
    public void setCellClassName(int row, int col, String className) {
        if ((row < 0) || (row >= this.className.length) ||
                (col < 0) || (col >= this.className[0].length)) {
            return;
        }

        this.className[row][col] = className;
    }

    // END -- added by Steve Burrows during initial PACTS implementation



    /**
     * this class is used to set the color of individual rows.
     * the most common use would be after setting the table
     * bgcolor, set the top row to a different color.
     *
     * @param color the string that represnets color in html.  For example
     *        the color while is "#FFFFFF" (including the quotes)
     */
    public void setRowColor(int row, String color) {
        //first check if it is oob
        if ((row < 0) || (row >= rowColor.length)) {
            return;
        }

        rowColor[row] = color;
    }

    // added during integration by chuck
    /**
     * this class is used to set the width of individual columns.
     * the most common use would be after setting the table
     * bgcolor, set the top row to a different color.
     *
     * @param width the string that represnets td width attribute in html.
     */
    public void setColumnWidth(int col, String width) {
        //first check if it is oob
        if ((col < 0) || (col >= columnWidth.length)) {
            return;
        }

        columnWidth[col] = width;
    }

    /**
     * this is used to set the size of a font for an individual cell
     *
     * @param row the 0 based row of the table
     * @param col the 0 based col of the table
     * @param size a string that represents the size of the font for
     * a given cell.
     */
    public void setCellFontSize(int row, int col, String size) {
        if ((row < 0) || (row >= fontSize.length) ||
                (col < 0) || (col >= fontSize[0].length)) {
            return;
        }

        fontSize[row][col] = size;
    }

    /**
     * used to set a cell as either bold or not bold.
     *
     * @param row the 0 based row of the table
     * @param col the 0 based col of the table
     * @param bold true if the cell should be bold, false otherwise
     *
     */
    public void setCellBold(int row, int col, boolean bold) {
        if ((row < 0) || (row >= fontSize.length) ||
                (col < 0) || (col >= fontSize[0].length)) {
            return;
        }

        isBold[row][col] = bold;
    }

    /**
     * helper function to set an entire row up as bold
     *
     * @param row to set as either bold or not
     * @param bold true, set the row as bold, false do not
     *
     */
    public void setRowBold(int row, boolean bold) {
        for (int col = 0; col < tableData.getNumCols(); col++) {
            setCellBold(row, col, bold);
        }
    }

    /**
     * a helper function to set the font for the entire table
     *
     * @param size the size of the font
     *
     */
    public void setFontSize(String size) {
        for (int row = 0; row < tableData.getNumRows(); row++) {
            for (int col = 0; col < tableData.getNumCols(); col++) {
                setCellFontSize(row, col, size);
            }
        }
    }

}


