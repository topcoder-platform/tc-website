/******************************************************************************\
 *
 * File:          TaxFormHeaderList.java
 * Creation date: March 05, 2002 10:19
 * Author:        Matt Murphy
 * Purpose:       Store the more commonly requested information for a tax form
 * See:           TaxFormHeader.java
 *                ResultSetContainer.java
 *
 * Copyright 2002, TopCoder, Inc
 * All rights are reserved. Reproduction in whole or part is prohibited
 * without the written consent of the copyright owner.
 *
 \******************************************************************************/

package com.topcoder.web.tc.controller.legacy.pacts.common;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import java.util.Map;

public class TaxFormHeaderList implements PactsConstants {

    private static Logger log = Logger.getLogger(TaxFormHeaderList.class);

    public TaxFormHeader headerList[];

    /**************\
     *              *
     * Constructors *
     *              *
     \**************/

/* This constructor takes a map and expects the ResultSetContainer
*  USER_TAX_FORM_HEADER_LIST to be in the map.
*  It then constructs each TaxFormHeader one by one.
*
*/
    public TaxFormHeaderList(Map results) {
        ResultSetContainer rsc = (ResultSetContainer) results.get(USER_TAX_FORM_HEADER_LIST);

        if (rsc == null) {
            rsc = (ResultSetContainer) results.get(TAX_FORM_LIST);
            if (rsc == null) {
                headerList = new TaxFormHeader[0];
                log.debug("There was no " + USER_TAX_FORM_HEADER_LIST + " or " + TAX_FORM_LIST + " result set container!");
                return;
            }
        }
        int rowCount = rsc.getRowCount();

        headerList = new TaxFormHeader[rowCount];

        for (int n = 0; n < rowCount; n++) {
            headerList[n] = new TaxFormHeader(results, n);
        }
    }
}
