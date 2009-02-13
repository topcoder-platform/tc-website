package com.topcoder.web.tc.controller.request.hs;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.web.common.TCRequest;

/**
 * Holds information about the sorting and cropping of a list.
 *  
 * @author Cucu
 */
public class ListInfo {
    /**
     * First row in the list, if using cropping.
     */
    private int startRow;
    
    /**
     * Last row in the list, if using cropping.
     */
    private int endRow;
    
    /**
     * Position of the sorting column
     */
    private int sortColumn;
        
    /**
     * Sort direction: ASC or DESC
     */
    private String sortDirection;

    /**
     * Indicates whether to crop rows.
     */
    private boolean cropped;
    
    public int getNumberOfRows() {
        return endRow - startRow;
    }
    /**
     * @return Returns the endRow.
     */
    public int getEndRow() {
        return endRow;
    }

    /**
     * @return Returns the sortColumn.
     */
    public int getSortColumn() {
        return sortColumn;
    }

    /**
     * @return Returns the sortDirection.
     */
    public String getSortDirection() {
        return sortDirection;
    }  

    /**
     * @return Returns the startRow.
     */
    public int getStartRow() {
        return startRow;
    }

    /**
     * Builds a ListInfo from the request.  If any parameter can't be read, default values are used.
     * 
     * @param req
     * @param defaultStartRow
     * @param defaultRowCount
     * @param defaultSortColumn
     * @param defaultSortDirection
     */
    public ListInfo(TCRequest req, int defaultStartRow, int defaultRowCount, int defaultSortColumn, String defaultSortDirection) {
        startRow = parseInt(req.getParameter(DataAccessConstants.START_RANK), defaultStartRow);
        
        int nr = parseInt(req.getParameter(DataAccessConstants.NUMBER_RECORDS), defaultRowCount);
        endRow = startRow + nr;
        sortColumn = parseInt(req.getParameter(DataAccessConstants.SORT_COLUMN), defaultSortColumn);
        
        String sd = req.getParameter(DataAccessConstants.SORT_DIRECTION);
        sortDirection = sd == null? defaultSortDirection : sd;
        cropped = true;
    }

    /**
     * Builds a ListInfo from the request, using just sort data (no cropping).
     *   If any parameter can't be read, default values are used.
     * 
     * @param req
     * @param defaultStartRow
     * @param defaultRowCount
     * @param defaultSortColumn
     * @param defaultSortDirection
     */
    public ListInfo(TCRequest req, int defaultSortColumn, String defaultSortDirection) {
        sortColumn = parseInt(req.getParameter(DataAccessConstants.SORT_COLUMN), defaultSortColumn);
        
        String sd = req.getParameter(DataAccessConstants.SORT_DIRECTION);
        sortDirection = sd == null? defaultSortDirection : sd;
        cropped = false;
    }

    /**
     * Try to parse a string as an integer, and if it's null or can't be parsed it returns the default value.
     * 
     * @param s
     * @param def
     * @return
     */
    private int parseInt(String s, int def) {
        if (s == null) {
            return def; 
        }
        
        try {
            return Integer.parseInt(s);
        } catch(Exception e) {
            return def;
        }
    }
    public boolean isCropped() {
        return cropped;
    } 
}
