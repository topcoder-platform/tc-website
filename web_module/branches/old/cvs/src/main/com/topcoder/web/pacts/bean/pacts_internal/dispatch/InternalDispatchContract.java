/******************************************************************************\
*
* File:          InternalDispatchContract.java
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
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
//import com.topcoder.web.stat.common.*;
import com.topcoder.web.pacts.bean.*;
import org.apache.log4j.*;

public class InternalDispatchContract implements PactsConstants {
	HttpServletRequest request;
	HttpServletResponse response;

	public InternalDispatchContract(HttpServletRequest request,
			HttpServletResponse response) {

		this.request = request;
		this.response = response;
	}

/**
*
* This method returns an Affidavit object matching the contract_id parameter
*
* @Args    - none
* @Returns - Contract
*
*/
	public Contract get() throws Exception {

		long contract_id = Long.parseLong(request.getParameter(CONTRACT_ID));

		DataInterfaceBean bean = new DataInterfaceBean();

		Map results = bean.getContract(contract_id);

		return new Contract(results);
	}

/**
*
* This method returns an Affidavit object matching the contract_id parameter
*
* @Args    - contract_id
* @Returns - Contract
*
*/
	public Contract get(long contract_id) throws Exception {

		DataInterfaceBean bean = new DataInterfaceBean();

		Map results = bean.getContract(contract_id);

		return new Contract(results);
	}

};
