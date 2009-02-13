package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.Links;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.PaymentHeader;
import com.topcoder.web.tc.controller.legacy.pacts.common.PaymentHeaderList;
import com.topcoder.web.tc.controller.legacy.pacts.common.TCData;

/**
 * Display a Payment List
 *
 * @author  cucu
 */
public class PaymentList extends PactsBaseProcessor implements PactsConstants {
   	
	public static final String PAYMENTS = "payments";
	public static final String RELIABILITY = "reliability";
	public static final String GROUP_RELIABILITY = "gr";
	public static final String TOGGLE_GROUP_RELIABILITY = "tgr";
    
    protected void businessProcessing() throws TCWebException {

    	
        try {
        	boolean groupRel = !"false".equals(getRequest().getParameter(GROUP_RELIABILITY));
        	String requestQuery = INTERNAL_SERVLET_URL + "?" + getRequest().getQueryString();
            getRequest().setAttribute("query", requestQuery);
            log.debug("QueryString: " + requestQuery);
                    
            DataInterfaceBean dib = new DataInterfaceBean();

            Map query = getQuery(getRequest());
            log.debug("query.size(): " + query.size());
            if (query.size() > 0) {
                Map paymentMap = dib.findPayments(query);
    
                PaymentHeaderList phl = new PaymentHeaderList(paymentMap);
                
                PaymentHeader[] results = phl.getHeaderList();
    
                Map ids = new HashMap();
    
                // Add all the payment id's to a set
                for (int i = 0; i < results.length; i++) {
                	if (results[i].getTypeId() != RELIABILITY_BONUS_PAYMENT) {
                		ids.put(new Long(results[i].getId()), results[i]);
                	}
                }
    
                List payments = new ArrayList();
                Map reliability = new HashMap();
                
                for (int i = 0; i < results.length; i++) {
                	// remove the word "Payment" from the type description
                	int pos = results[i].getType().indexOf("Payment");
                    if (pos >= 0) {
                    	results[i].setType(results[i].getType().substring(0, pos) );
                    }
                    
                	if (!groupRel || results[i].getTypeId() != RELIABILITY_BONUS_PAYMENT) {
                		payments.add(results[i]);
                	} else {
                		Long parentId = new Long(results[i].getParentPaymentId());
                		PaymentHeader parent = (PaymentHeader) ids.get(parentId);
                		if (parent != null) {
                			reliability.put(parentId, new Long(results[i].getId()));
                			parent.setRecentGrossAmount(parent.getRecentGrossAmount() + results[i].getRecentGrossAmount());
                			parent.setRecentNetAmount(parent.getRecentNetAmount() + results[i].getRecentNetAmount());
                		} else {
                			payments.add(results[i]);            			
                		}
                	}            	
                }
                
                if (results.length != 1) {
    //                setDefault("status_id", READY_TO_PRINT_STATUS + "");
    //                setDefault("status_id",  "");
                	
    //                getRequest().setAttribute(STATUS_CODE_LIST, getStatusList());                
                    getRequest().setAttribute(PAYMENTS, payments);
                    getRequest().setAttribute(RELIABILITY, reliability);
                    getRequest().setAttribute(GROUP_RELIABILITY, Boolean.valueOf(groupRel));
    
                    // mirror parameters
                    getRequest().setAttribute(PAYMENT_ID, StringUtils.htmlEncode(getRequest().getParameter(PAYMENT_ID)));
                    getRequest().setAttribute(PROJECT_ID, StringUtils.htmlEncode(getRequest().getParameter(PROJECT_ID)));
                    getRequest().setAttribute(HANDLE, StringUtils.htmlEncode(getRequest().getParameter(HANDLE)));
                    getRequest().setAttribute(EARLIEST_CREATION_DATE, StringUtils.htmlEncode(getRequest().getParameter(EARLIEST_CREATION_DATE)));
                    getRequest().setAttribute(LATEST_CREATION_DATE, StringUtils.htmlEncode(getRequest().getParameter(LATEST_CREATION_DATE)));
                    getRequest().setAttribute(EARLIEST_MODIFICATION_DATE, StringUtils.htmlEncode(getRequest().getParameter(EARLIEST_MODIFICATION_DATE)));
                    getRequest().setAttribute(LATEST_MODIFICATION_DATE, StringUtils.htmlEncode(getRequest().getParameter(LATEST_MODIFICATION_DATE)));
                    getRequest().setAttribute(EARLIEST_PAY_DATE, StringUtils.htmlEncode(getRequest().getParameter(EARLIEST_PAY_DATE)));
                    getRequest().setAttribute(LATEST_PAY_DATE, StringUtils.htmlEncode(getRequest().getParameter(LATEST_PAY_DATE)));
                    getRequest().setAttribute(EARLIEST_DUE_DATE, StringUtils.htmlEncode(getRequest().getParameter(EARLIEST_DUE_DATE)));
                    getRequest().setAttribute(LATEST_DUE_DATE, StringUtils.htmlEncode(getRequest().getParameter(LATEST_DUE_DATE)));
                    getRequest().setAttribute(LOWEST_NET_AMOUNT, StringUtils.htmlEncode(getRequest().getParameter(LOWEST_NET_AMOUNT)));
                    getRequest().setAttribute(HIGHEST_NET_AMOUNT, StringUtils.htmlEncode(getRequest().getParameter(HIGHEST_NET_AMOUNT)));
                    getRequest().setAttribute(STATUS_CODE, StringUtils.htmlEncode(getRequest().getParameter(STATUS_CODE)));
                    getRequest().setAttribute(TYPE_CODE, StringUtils.htmlEncode(getRequest().getParameter(TYPE_CODE)));
                    getRequest().setAttribute(METHOD_CODE, StringUtils.htmlEncode(getRequest().getParameter(METHOD_CODE)));
    
                    getRequest().setAttribute(AFFIDAVIT_ID, StringUtils.htmlEncode(getRequest().getParameter(AFFIDAVIT_ID)));
                    getRequest().setAttribute(CONTRACT_ID, StringUtils.htmlEncode(getRequest().getParameter(CONTRACT_ID)));
                    getRequest().setAttribute(USER_ID, StringUtils.htmlEncode(getRequest().getParameter(USER_ID)));
                    
                    if (getRequest().getAttribute(CHECKED_PAYMENT_ID) == null) {
                        getRequest().setAttribute(CHECKED_PAYMENT_ID, "");                        
                    }                    
                    
                    String toggle = requestQuery.replaceAll(GROUP_RELIABILITY + "=" + groupRel, "") + "&" + GROUP_RELIABILITY + "=" + !groupRel;
                    getRequest().setAttribute(TOGGLE_GROUP_RELIABILITY, toggle);
                    
                    setNextPage(INTERNAL_PAYMENT_LIST_JSP);
                } else {
                    setNextPage(Links.viewPayment(results[0].getId()));
                }
                setIsNextPageInContext(true);
            } else {
                throw new TCWebException("You must specify a filter for the payment list");
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    private Map getQuery(TCRequest request) {
        Map query = new Hashtable();
        String param;

        String statusValuesStr = createValuesStr(request.getParameterValues(STATUS_CODE));
        if (!statusValuesStr.equals("")) query.put(STATUS_CODE, statusValuesStr);
    	String typeValuesStr = createValuesStr(request.getParameterValues(TYPE_CODE));
        if (!typeValuesStr.equals("")) query.put(TYPE_CODE, typeValuesStr);
    	String methodValuesStr = createValuesStr(request.getParameterValues(METHOD_CODE));
        if (!methodValuesStr.equals("")) query.put(METHOD_CODE, methodValuesStr);
        param = request.getParameter(EARLIEST_DUE_DATE);
        if (param != null && !param.equals("")) query.put(EARLIEST_DUE_DATE, TCData.dateForm(param));
        param = request.getParameter(LATEST_DUE_DATE);
        if (param != null && !param.equals("")) query.put(LATEST_DUE_DATE, TCData.dateForm(param));
        param = request.getParameter(EARLIEST_CREATION_DATE);
        if (param != null && !param.equals("")) query.put(EARLIEST_CREATION_DATE, TCData.dateForm(param));
        param = request.getParameter(LATEST_CREATION_DATE);
        if (param != null && !param.equals("")) query.put(LATEST_CREATION_DATE, TCData.dateForm(param));
        param = request.getParameter(EARLIEST_PAY_DATE);
        if (param != null && !param.equals("")) query.put(EARLIEST_PAY_DATE, TCData.dateForm(param));
        param = request.getParameter(LATEST_PAY_DATE);
        if (param != null && !param.equals("")) query.put(LATEST_PAY_DATE, TCData.dateForm(param));
        param = request.getParameter(LOWEST_NET_AMOUNT);
        if (param != null && !param.equals("")) query.put(LOWEST_NET_AMOUNT, param);
        param = request.getParameter(HIGHEST_NET_AMOUNT);
        if (param != null && !param.equals("")) query.put(HIGHEST_NET_AMOUNT, param);                
        param = createValuesStr(request.getParameterValues(PAYMENT_ID));
        if (!param.equals("")) query.put(PAYMENT_ID, param);        
        param = request.getParameter(AFFIDAVIT_ID);
        if (param != null && !param.equals("")) query.put(AFFIDAVIT_ID, param);
        param = request.getParameter(CONTRACT_ID);
        if (param != null && !param.equals("")) query.put(CONTRACT_ID, param);
        param = request.getParameter(USER_ID);
        if (param != null && !param.equals("")) query.put(USER_ID, param);
        param = request.getParameter(HANDLE);
        if (param != null && !param.equals("")) query.put(HANDLE, param);
//        param = request.getParameter(IS_REVIEWED);
//        if (param != null && !param.equals("")) query.put(IS_REVIEWED, param);
        param = request.getParameter(PROJECT_ID);
        if (param != null && !param.equals("")) query.put(PROJECT_ID, param);
        
        return query;
    }
    
    // Helper function generating a comma-separated list from an array of values
    private String createValuesStr(String[] values) {
    	if (values == null) return "";
    	StringBuffer valuesStr = new StringBuffer(100);
    	
    	for (int i=0; i<values.length; i++) {
    		if (values[i].equals("")) {
    			return "";
    		}
    		valuesStr.append(values[i]);
    		if (i < values.length-1) {
    			valuesStr.append(',');
    		}
    	}
    	return valuesStr.toString();
    }

}

