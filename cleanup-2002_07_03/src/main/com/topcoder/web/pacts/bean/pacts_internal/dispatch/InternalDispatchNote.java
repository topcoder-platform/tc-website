/******************************************************************************\
*
* File:          InternalDispatchNote.java
* Creation date: March 16, 2002 19:32
* Author:        Matt Murphy
*
* Modifications: @INSERT_MODIFICATIONS(* )
*
* Copyright 2002, TopCoder, Inc
* All rights are reserved. Reproduction in whole or part is prohibited
* without the written consent of the copyright owner.
*
\******************************************************************************/

package com.topcoder.web.pacts.bean.pacts_internal.dispatch;

import com.topcoder.web.pacts.common.*;
//import com.topcoder.web.pacts.bean.pacts_internal.interface.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import com.topcoder.web.pacts.bean.*;
import com.topcoder.shared.util.logging.Logger;

public class InternalDispatchNote implements PactsConstants {
	HttpServletRequest request;
	HttpServletResponse response;

        private static Logger log = Logger.getLogger(InternalDispatchNote.class);

	public InternalDispatchNote (HttpServletRequest request,
			HttpServletResponse response) {

		this.request = request;
		this.response = response;
	}

/**
*
* This method returns a Note object matching the note_id parameter
*
* @Args    - none
* @Returns - Note
*
*/
	public Note get() throws Exception {
		long note_id = Long.parseLong(request.getParameter(NOTE_ID));

		DataInterfaceBean bean = new DataInterfaceBean();

		Map results = bean.getNote(note_id);

		if (results != null) return new Note(results);
		else return new Note();
	}

/**
*
* This method returns a Note object matching the note_id parameter
*
* @Args    - note_id
* @Returns - Note
*
*/
	public Note get(long note_id) throws Exception {

		DataInterfaceBean bean = new DataInterfaceBean();

		Map results = bean.getNote(note_id);

		if (results != null) return new Note(results);
		else return new Note();
	}

};
