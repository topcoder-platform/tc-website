/**

 * this class is a container for tabular data.  The assumption is that

 * the jsp will take care of the view aspect of it, the servlet fills

 * in the model and passes back to the servlet for viewing.  It is loosly

 * based on the java TableModel interface.

 */

package com.topcoder.web.tc.controller.legacy.pacts.common;


import java.io.Serializable;


public class PactsMemberTableModel implements Serializable {

    private String tableData[][];  //used to store the model data

    private int numCols;  //for convinace

    private int numRows;


    /**

     * constructor, sets up the default data

     *

     * @param nRows the number of rows

     * @param nCols the number of columns

     */

    public PactsMemberTableModel(int nRows, int nCols) {

        tableData = new String[nRows][nCols];

        numCols = nCols;

        numRows = nRows;

        for (int i = 0; i < nRows; i++) {

            for (int j = 0; j < nCols; j++) {

                tableData[i][j] = new String("");

            }

        }

    }


    /**

     * returns the number of rows inthe table

     *

     * @return the number of rows

     */

    public int getNumRows() {

        return numRows;

    }


    /**

     * returns the number of columns

     *

     * @return number of cols

     */

    public int getNumCols() {

        return numCols;

    }


    /**

     * returns an individual element, both rows and cols are 0 based

     *

     * @param row the zero based row of the element

     * @param col the zero based col of the element

     *

     * @return the element, will return null if the request is oob

     */

    public String getElement(int row, int col) {

        if (oob(row, col)) return null;


        return tableData[row][col];

    }


    /**

     * used to set the elements

     *

     * @param row the zero based row of the element

     * @param col the zero based col of the element

     * @param element the acutal element

     *

     * @return false if the row, col was oob, true if the element was set

     */

    public boolean setElement(int row, int col, String element) {

        if (oob(row, col)) return false;


        tableData[row][col] = element;

        return true;

    }


    private boolean oob(int row, int col) {

        return ((row < 0) || (row >= numRows) || (col < 0) || (col >= numCols));

    }


}

