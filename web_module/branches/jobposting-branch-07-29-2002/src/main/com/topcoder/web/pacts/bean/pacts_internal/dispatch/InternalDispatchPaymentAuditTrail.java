/******************************************************************************\
*
* File:          InternalDispatchPaymentAuditTrail.java
* Creation date: March 11, 2002 19:32
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

public class InternalDispatchPaymentAuditTrail implements PactsConstants {
	HttpServletRequest request;
	HttpServletResponse response;

	public InternalDispatchPaymentAuditTrail(HttpServletRequest request,
			HttpServletResponse response) {

		this.request = request;
		this.response = response;
	}

/**
*
* This method returns an array of Payments that share the same paymentID
*
* @Args    - none
* @Returns - Payment[]
*
*/
	public Payment[] get() throws Exception {
		Map query = new Hashtable();

		long payment_id = Long.parseLong(request.getParameter(PAYMENT_ID));

		DataInterfaceBean bean = new DataInterfaceBean();

		Map results = bean.getPaymentAuditTrail(payment_id);

		PaymentList pl = new PaymentList(results);

		return pl.headerList;
	}
};
