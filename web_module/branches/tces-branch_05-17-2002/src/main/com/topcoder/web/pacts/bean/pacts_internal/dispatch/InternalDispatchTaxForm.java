/******************************************************************************\
*
* File:          InternalDispatchTaxForm.java
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

public class InternalDispatchTaxForm implements PactsConstants {
	HttpServletRequest request;
	HttpServletResponse response;

	public InternalDispatchTaxForm(HttpServletRequest request,
			HttpServletResponse response) {

		this.request = request;
		this.response = response;
	}

/**
*
* This method returns an TaxForm object matching the tax_form_id parameter
*
* @Args    - none
* @Returns - TaxForm
*
*/
	public TaxForm get() throws Exception {

		long tax_form_id = Long.parseLong(request.getParameter(TAX_FORM_ID));

		DataInterfaceBean bean = new DataInterfaceBean();

		Map results = bean.getTaxForm(tax_form_id);

		return new TaxForm(results);
	}

/**
*
* This method returns an TaxForm object matching the tax_form_id parameter
*
* @Args    - tax_form_id
* @Returns - TaxForm
*
*/
	public TaxForm get(long tax_form_id) throws Exception {

		DataInterfaceBean bean = new DataInterfaceBean();

		Map results = bean.getTaxForm(tax_form_id);

		return new TaxForm(results);
	}

};
