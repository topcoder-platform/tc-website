/******************************************************************************\
*
* File:          InternalDispatchPayment.java
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
import com.topcoder.web.pacts.bean.*;
import org.apache.log4j.*;

public class InternalDispatchPayment implements PactsConstants {
	HttpServletRequest request;
	HttpServletResponse response;

	public InternalDispatchPayment(HttpServletRequest request,
			HttpServletResponse response) {

		this.request = request;
		this.response = response;
	}

/**
*
* This method returns an Payment object matching the payment_id parameter
*
* @Args    - none
* @Returns - Payment
*
*/
	public Payment get() throws Exception {

		long payment_id = Long.parseLong(request.getParameter(PAYMENT_ID));

		DataInterfaceBean bean = new DataInterfaceBean();

		Map results = bean.getPayment(payment_id);

		return new Payment(results);
	}

/**
*
* This method returns an Payment object matching the payment_id parameter
*
* @Args    - payment_id
* @Returns - Payment
*
*/
	public Payment get(long payment_id) throws Exception {

		DataInterfaceBean bean = new DataInterfaceBean();

		Map results = bean.getPayment(payment_id);

		return new Payment(results);
	}

};
