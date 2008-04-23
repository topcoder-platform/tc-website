///******************************************************************************\
// *
// * File:          InternalDispatchPaymentList.java
// * Creation date: March 11, 2002 19:32
// * Author:        Matt Murphy
// *
// * Modifications: @INSERT_MODIFICATIONS(* )
// *
// * Copyright 2002, TopCoder, Inc
// * All rights are reserved. Reproduction in whole or part is prohibited
// * without the written consent of the copyright owner.
// *
// \******************************************************************************/
//
//package com.topcoder.web.tc.controller.legacy.pacts.bean.pacts_internal.dispatch;
//
//import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
//import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
//import com.topcoder.shared.util.logging.Logger;
//import com.topcoder.web.common.HttpObjectFactory;
//import com.topcoder.web.common.TCRequest;
//import com.topcoder.web.common.TCResponse;
//import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
//import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
//import com.topcoder.web.tc.controller.legacy.pacts.common.PaymentHeader;
//import com.topcoder.web.tc.controller.legacy.pacts.common.PaymentHeaderList;
//import com.topcoder.web.tc.controller.legacy.pacts.common.TCData;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.util.Hashtable;
//import java.util.Map;
//
//public class InternalDispatchPaymentList implements PactsConstants {
//	private static Logger log = Logger.getLogger(InternalDispatchPaymentList.class);
//	
//    TCRequest request;
//    TCResponse response;
//
//    public InternalDispatchPaymentList(HttpServletRequest request, HttpServletResponse response) {
//        this.request = HttpObjectFactory.createRequest(request);
//        this.response = HttpObjectFactory.createResponse(response);
//    }
//
//    public InternalDispatchPaymentList(TCRequest request, TCResponse response) {
//        this.request = request;
//        this.response = response;
//    }
//
//    /**
//     *
//     * This method returns an array of PaymentHeaders that match the search criteria.
//     * The criteria are found in the cgi variables of request.
//     * Method assumes at least one search parameter exists.
//     *
//     * @return - PaymentHeader[]
//     *
//     */
//    public PaymentHeader[] get() throws Exception {
//        Map query = new Hashtable();
//        String param;
//    	
//    	String statusValuesStr = createValuesStr(request.getParameterValues(STATUS_CODE));
//        if (!statusValuesStr.equals("")) query.put(STATUS_CODE, statusValuesStr);
//    	String typeValuesStr = createValuesStr(request.getParameterValues(TYPE_CODE));
//        if (!typeValuesStr.equals("")) query.put(TYPE_CODE, typeValuesStr);
//    	String methodValuesStr = createValuesStr(request.getParameterValues(METHOD_CODE));
//        if (!methodValuesStr.equals("")) query.put(METHOD_CODE, methodValuesStr);
//        param = request.getParameter(EARLIEST_DUE_DATE);
//        if (param != null && !param.equals("")) query.put(EARLIEST_DUE_DATE, TCData.dateForm(param));
//        param = request.getParameter(LATEST_DUE_DATE);
//        if (param != null && !param.equals("")) query.put(LATEST_DUE_DATE, TCData.dateForm(param));
//        param = request.getParameter(EARLIEST_CREATION_DATE);
//        if (param != null && !param.equals("")) query.put(EARLIEST_CREATION_DATE, TCData.dateForm(param));
//        param = request.getParameter(LATEST_CREATION_DATE);
//        if (param != null && !param.equals("")) query.put(LATEST_CREATION_DATE, TCData.dateForm(param));
//        param = request.getParameter(EARLIEST_PAY_DATE);
//        if (param != null && !param.equals("")) query.put(EARLIEST_PAY_DATE, TCData.dateForm(param));
//        param = request.getParameter(LATEST_PAY_DATE);
//        if (param != null && !param.equals("")) query.put(LATEST_PAY_DATE, TCData.dateForm(param));
//        param = request.getParameter(LOWEST_NET_AMOUNT);
//        if (param != null && !param.equals("")) query.put(LOWEST_NET_AMOUNT, param);
//        param = request.getParameter(HIGHEST_NET_AMOUNT);
//        if (param != null && !param.equals("")) query.put(HIGHEST_NET_AMOUNT, param);
//        param = request.getParameter(PAYMENT_ID);
//        if (param != null && !param.equals("")) query.put(PAYMENT_ID, param);
//        param = request.getParameter(AFFIDAVIT_ID);
//        if (param != null && !param.equals("")) query.put(AFFIDAVIT_ID, param);
//        param = request.getParameter(CONTRACT_ID);
//        if (param != null && !param.equals("")) query.put(CONTRACT_ID, param);
//        param = request.getParameter(USER_ID);
//        if (param != null && !param.equals("")) query.put(USER_ID, param);
//        param = request.getParameter(HANDLE);
//        if (param != null && !param.equals("")) query.put(HANDLE, param);
//        param = request.getParameter(PROJECT_ID);
//        if (param != null && !param.equals("")) query.put(PROJECT_ID, param);
//        
//        DataInterfaceBean bean = new DataInterfaceBean();
//
//        Map results = bean.findPayments(query);
//
//        if (results == null) return new PaymentHeader[0];
//
//        PaymentHeaderList phl = new PaymentHeaderList(results);
//
//        return phl.getHeaderList();
//    }
//    
//    /**
//    * This method returns an array of dates which the given payments were created on.
//    *
//    * @return - String[]
//    */
//    public String[] getCreationDates(PaymentHeader[] payments) throws Exception {
//    	if (payments.length == 0) return new String[0];
//    	DataInterfaceBean bean = new DataInterfaceBean();
//    	long[] paymentIds = new long[payments.length];
//    	for (int i=0; i<payments.length; i++) {
//    		paymentIds[i] = payments[i].getId();
//    	}  	
//    	Map results = bean.getCreationDates(paymentIds);
//    	ResultSetContainer rsc = (ResultSetContainer)results.get(CREATION_DATE_LIST);
//    	
//    	if (rsc == null) {
//            log.error("There were no " + CREATION_DATE_LIST + " entries in the" +
//                    " result set map sent to InternalDispatchPaymentList.getCreatedDates()");
//            return null;
//        }
//
//        // see if there are any rows of data
//        int numRows = rsc.getRowCount();
//        if (numRows <= 0) {
//            log.debug("there were no rows of data in the result set sent\n" +
//                    "to InternalDispatchPaymentList.getCreatedDates()");
//            return new String[0];
//        }
//        
//        String[] creationDates = new String[numRows];
//        for (int i=0; i<numRows; i++) {
//        	ResultSetRow rRow = rsc.getRow(i);
//        	creationDates[i] = TCData.getTCDate(rRow, "date_created");
//        }
//        return creationDates;
//    }
//    
//    // Helper function generating a comma-separated list from an array of values
//    private String createValuesStr(String[] values) {
//    	if (values == null) return "";
//    	String valuesStr = "";
//    	for (int i=0; i<values.length; i++) {
//    		if (values[i].equals("")) {
//    			return "";
//    		}
//    		valuesStr += values[i];
//    		if (i < values.length-1) {
//    			valuesStr += ",";
//    		}
//    	}
//    	return valuesStr;
//    }
//}
