/******************************************************************************\
 *
 * File:          PactsEntryList.java
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

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;

import java.util.Map;

public class PactsEntryList implements PactsConstants {

    private static Logger log = Logger.getLogger(PactsEntryList.class);

    public PactsEntry[] headerList;

    public PactsEntryList(Map data) {
        ResultSetContainer rsc = (ResultSetContainer) data.get(ENTRY_HEADER_LIST);
        if (rsc == null) {
            log.error("There was no " + ENTRY_HEADER_LIST + " result set container!");
            headerList = new PactsEntry[0];
            return;
        }
        int rowCount = rsc.getRowCount();
        headerList = new PactsEntry[rowCount];
        for (int n = 0; n < rowCount; n++) {
            headerList[n] = new PactsEntry(data, n);
        }
    }
}
