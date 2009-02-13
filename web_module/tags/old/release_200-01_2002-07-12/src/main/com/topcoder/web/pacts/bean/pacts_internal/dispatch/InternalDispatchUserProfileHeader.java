/******************************************************************************\
*
* File:          InternalDispatchUserProfileHeader.java
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
//import com.topcoder.web.stat.common.*;
import com.topcoder.web.pacts.bean.*;
import org.apache.log4j.*;

public class InternalDispatchUserProfileHeader implements PactsConstants {
	HttpServletRequest request;
	HttpServletResponse response;

	public static Category log =
		Category.getInstance(InternalDispatchUserProfileHeader.class.getName());

	public InternalDispatchUserProfileHeader (HttpServletRequest request,
			HttpServletResponse response) {

		this.request = request;
		this.response = response;
	}

/**
*
* This method returns a UserProfileHeader object matching the affidavit_id parameter
*
* @Args    - none
* @Returns - UserProfileHeader
*
*/
	public UserProfileHeader get() throws Exception {

		long user_id = Long.parseLong(request.getParameter(USER_ID));

		DataInterfaceBean bean = new DataInterfaceBean();

		Map results = bean.getUserProfileHeader(user_id);

		if (results != null) return new UserProfileHeader(results);
		else return new UserProfileHeader();
	}
};
