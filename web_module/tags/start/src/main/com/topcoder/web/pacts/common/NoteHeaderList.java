/******************************************************************************\
*
* File:          NoteHeaderList.java
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

package com.topcoder.web.pacts.common;

import org.apache.log4j.*;
import com.topcoder.web.common.*;
import java.util.*;

public class NoteHeaderList implements PactsConstants {

	private static Category log =
		PactsLog.getInstance(NoteHeaderList.class.getName());

	public NoteHeader headerList[];

/**************\
*              *
* Constructors *
*              *
\**************/

/* This constructor takes a map and expects the ResultSetContainer
*  NOTE_HEADER_LIST to be in the map.
*  It then constructs each NoteHeader one by one.
*
*/
	public NoteHeaderList (Map results) {
		ResultSetContainer rsc = (ResultSetContainer) results.get(NOTE_HEADER_LIST);

		if (rsc == null) {
			headerList = new NoteHeader[0];
			log.debug("There was no " + NOTE_HEADER_LIST + " result set container!");
			return;
		}
		int rowCount = rsc.getRowCount();

		headerList = new NoteHeader[rowCount];

		for (int n = 0; n < rowCount; n++) {
			headerList[n] = new NoteHeader(results,n);
		}
	}
}
