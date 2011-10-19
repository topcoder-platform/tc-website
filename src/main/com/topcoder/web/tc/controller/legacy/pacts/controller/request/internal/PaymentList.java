package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.io.PrintWriter;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusReason;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusReason.AvailableStatusReason;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.PaymentHeader;
import com.topcoder.web.tc.controller.legacy.pacts.common.PaymentHeaderList;
import com.topcoder.web.tc.controller.legacy.pacts.common.TCData;

/**
 * Display a Payment List
 *
 * @author  cucu, pulky, VolodymyrK
 */
public class PaymentList extends PactsBaseProcessor implements PactsConstants {
   	
    public static final String PAYMENTS = "payments";
    public static final String RELIABILITY = "reliability";
    public static final String GROUP_RELIABILITY = "gr";
    public static final String TOGGLE_GROUP_RELIABILITY = "tgr";
    public static final String CSV_FORMAT = "csv";
    public static final String CSV_LINK = "csv_link";

    public static final int NAME_COL = 1;
    public static final int USER_COL = 2;
    public static final int DESC_COL = 3;
    public static final int GROSS_COL = 4;
    public static final int TAX_COL = 5;
    public static final int NET_COL = 6;
    public static final int TYPE_COL = 7;
    public static final int STATUS_COL = 8;
    public static final int CREATED_COL = 9;
    public static final int MODIFIED_COL = 10;
    public static final int CLIENT_COL = 11;
    public static final int ID_COL = 12;
    public static final int REFERENCE_ID_COL = 13;
    public static final int CONTEST_CATEGORY_NAME_COL = 14;
    public static final int COCKPIT_PROJECT_NAME_COL = 15;
    public static final int BILLING_ACCOUNT_NAME_COL = 16;
    public static final int INVOICE_NUMBER_COL = 17;
    
    protected void businessProcessing() throws TCWebException {
        try {
            boolean invert = "desc".equals(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));

            int sortCol = 0;

            if (!"".equals(StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN)).trim())) {
                sortCol = Integer.parseInt(StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN)));
            }

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
    
                List<PaymentHeader> payments = new ArrayList<PaymentHeader>();
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
                    // sort payments
                    sortResult(payments, sortCol, invert);
                }                    

                if ("on".equalsIgnoreCase(com.topcoder.web.tc.Constants.GLOBAL_AD_FLAG)) {
                    removeDuplicateReasons(payments);
                }

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
                
                if ("true".equals(getRequest().getParameter(CSV_FORMAT))) {
                    produceCSV();
                } else {                   
                    String toggle = requestQuery.replaceAll(GROUP_RELIABILITY + "=" + groupRel, "") + "&" + GROUP_RELIABILITY + "=" + !groupRel;
                    getRequest().setAttribute(TOGGLE_GROUP_RELIABILITY, toggle);

                    String csv_link = requestQuery + "&" + CSV_FORMAT + "=true";
                    getRequest().setAttribute(CSV_LINK, csv_link);

                    setNextPage(INTERNAL_PAYMENT_LIST_JSP);
                    setIsNextPageInContext(true);
                }
            } else {
                throw new TCWebException("You must specify a filter for the payment list");
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    private void produceCSV() throws IOException {
        getResponse().addHeader("content-disposition", "inline; filename=\"payment_list.csv\"");
        getResponse().setContentType("application/csv");
        PrintWriter writer = getResponse().getWriter();

        writer.print("Payment ID,Name,User,Description,Gross,Tax,Net,Type,Status,Client,Project,Billing Acct,Reference ID,Contest Category,Invoice,Created,Modified");
        writer.print("\n");
        
        List<PaymentHeader> payments = (List<PaymentHeader>) getRequest().getAttribute(PaymentList.PAYMENTS);
        Map reliabilityMap = (Map) getRequest().getAttribute(PaymentList.RELIABILITY);
        boolean groupReliability = (Boolean) getRequest().getAttribute(PaymentList.GROUP_RELIABILITY);

        for (PaymentHeader payment : payments) {
            String description = payment.getDescription();
            if (reliabilityMap.containsKey(payment.getId())) {
                description += " + Reliability";
            }

            String status = payment.getCurrentStatus().getDesc();
            for (PaymentStatusReason reason : payment.getCurrentStatus().getReasons()) {
                status += "\n- " + reason.getDesc();
            }

            String row = "";
            row = addCSVValue(row, payment.getId());
            row = addCSVValue(row, payment.getUser().getFullName());
            row = addCSVValue(row, payment.getUser().getHandle());
            row = addCSVValue(row, description);
            row = addCSVValue(row, payment.getRecentGrossAmount());
            row = addCSVValue(row, payment.getRecentGrossAmount()-payment.getRecentNetAmount());
            row = addCSVValue(row, payment.getRecentNetAmount());
            row = addCSVValue(row, payment.getType());
            row = addCSVValue(row, status);
            row = addCSVValue(row, payment.getClient());
            row = addCSVValue(row, payment.getCockpitProjectName());
            row = addCSVValue(row, payment.getBillingAccountName());
            row = addCSVValue(row, payment.getReferenceId());
            row = addCSVValue(row, payment.getContestCategoryName());
            row = addCSVValue(row, payment.getInvoiceNumber());
            row = addCSVValue(row, payment.getCreateDate());
            row = addCSVValue(row, payment.getModifyDate());

            writer.print(row+"\n");
        }

        getResponse().setStatus(HttpServletResponse.SC_OK);
        writer.flush();
    }

    String addCSVValue(String row, Object value) {
      if (value != null) {
          String item = value.toString();
          if (item.contains(",") || item.contains("\n") || item.contains("\"")) {
              row += "\"" + item.replaceAll("\"","\"\"") + "\"";
          } else {
              row += item;
          }
      }

      return row+",";
    }

    private Map getQuery(TCRequest request) {
        Map query = new Hashtable();
        String param;

        String statusValuesStr = createValuesStr(request.getParameterValues(STATUS_CODE));
        if (!statusValuesStr.equals("")) query.put(STATUS_CODE, statusValuesStr);
    	String typeValuesStr = createValuesStr(request.getParameterValues(TYPE_CODE));
        if (!typeValuesStr.equals("")) query.put(TYPE_CODE, typeValuesStr);
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
        param = request.getParameter(PROJECT_ID);
        if (param != null && !param.equals("")) query.put(PROJECT_ID, param);      
        param = request.getParameter(INVOICE_NUMBER);
        if (param != null && !param.equals("")) query.put(INVOICE_NUMBER, param);
        param = request.getParameter(COCKPIT_PROJECT);
        if (param != null && !param.equals("")) query.put(COCKPIT_PROJECT, param);
        param = request.getParameter(BILLING_ACCOUNT);
        if (param != null && !param.equals("")) query.put(BILLING_ACCOUNT, param);

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

    /**
     * Remove duplicate reasons from payment list
     *
     * @param result the original payment list.
     */
    protected void removeDuplicateReasons(List<PaymentHeader> result) {
        if (result.size() == 0) {
            return;
        }
        
        for (PaymentHeader ph : result) {
            if (ph.getCurrentStatus().getReasons().contains(AvailableStatusReason.NO_HARD_COPY_AD_REASON.getStatusReason()) &&
                    ph.getCurrentStatus().getReasons().contains(AvailableStatusReason.NO_SIGNED_GLOBAL_AD_REASON.getStatusReason())) {
                ph.getCurrentStatus().getReasons().remove(AvailableStatusReason.NO_SIGNED_GLOBAL_AD_REASON.getStatusReason());
            }
        }
    }

    /**
     * Sorts payment list.
     *
     * @param result the original payment list.
     * @param sortcol the columnt to sort with.
     * @param invert true if the order is descending.
     * @return the sorted list.
     */
    protected void sortResult(List<PaymentHeader> result, int sortCol, boolean invert) {
        if (result.size() == 0) {
            return;
        }

        switch (sortCol) {
        case ID_COL:
            Collections.sort(result, new Comparator<PaymentHeader>() {
                public int compare(PaymentHeader arg0, PaymentHeader arg1) {
                    return new Long(arg0.getId()).compareTo(arg1.getId());
                }
            });
            break;
        case NAME_COL:
            Collections.sort(result, new Comparator<PaymentHeader>() {
                public int compare(PaymentHeader arg0, PaymentHeader arg1) {
                    if (arg0.getUser().getFullName() == null) {
                        return 1;
                    }
                    return arg0.getUser().getFullName().toUpperCase().compareTo(arg1.getUser().getFullName().toUpperCase());
                }
            });
            break;
        case USER_COL:
            Collections.sort(result, new Comparator<PaymentHeader>() {
                public int compare(PaymentHeader arg0, PaymentHeader arg1) {
                    if (arg0.getUser().getHandle() == null) {
                        return 1;
                    }
                    return arg0.getUser().getHandle().toUpperCase().compareTo(arg1.getUser().getHandle().toUpperCase());
                }
            });
            break;
        case DESC_COL:
            Collections.sort(result, new Comparator<PaymentHeader>() {
                public int compare(PaymentHeader arg0, PaymentHeader arg1) {
                    if (arg0.getDescription() == null) {
                        return 1;
                    }
                    return arg0.getDescription().toUpperCase().compareTo(arg1.getDescription().toUpperCase());
                }
            });
            break;
        case GROSS_COL:
            Collections.sort(result, new Comparator<PaymentHeader>() {
                public int compare(PaymentHeader arg0, PaymentHeader arg1) {
                    return new Double(arg0.getRecentGrossAmount()).compareTo(arg1.getRecentGrossAmount());
                    
                }
            });
            break;
        case TAX_COL:
            Collections.sort(result, new Comparator<PaymentHeader>() {
                public int compare(PaymentHeader arg0, PaymentHeader arg1) {
                    return new Double(arg0.getRecentGrossAmount() - arg0.getRecentNetAmount()).compareTo(arg1.getRecentGrossAmount() - arg1.getRecentNetAmount());
                    
                }
            });
            break;
        case NET_COL:
            Collections.sort(result, new Comparator<PaymentHeader>() {
                public int compare(PaymentHeader arg0, PaymentHeader arg1) {
                    return new Double(arg0.getRecentNetAmount()).compareTo(arg1.getRecentNetAmount());
                    
                }
            });
            break;
        case TYPE_COL:
            Collections.sort(result, new Comparator<PaymentHeader>() {
                public int compare(PaymentHeader arg0, PaymentHeader arg1) {
                    if (arg0.getType() == null) {
                        return 1;
                    }
                    return arg0.getType().toUpperCase().compareTo(arg1.getType().toUpperCase());
                }
            });
            break;
            case STATUS_COL:
            Collections.sort(result, new Comparator<PaymentHeader>() {
                public int compare(PaymentHeader arg0, PaymentHeader arg1) {
                    if (arg0.getRecentStatus() == null) {
                        return 1;
                    }
                    return arg0.getRecentStatus().toUpperCase().compareTo(arg1.getRecentStatus().toUpperCase());
                }
            });
            break;
        case CLIENT_COL:
            Collections.sort(result, new Comparator<PaymentHeader>() {
                public int compare(PaymentHeader arg0, PaymentHeader arg1) {
                    if (arg0.getClient() == null) {
                        return 1;
                    }
                    return arg0.getClient().toUpperCase().compareTo(arg1.getClient().toUpperCase());
                }
            });
            break;
        case REFERENCE_ID_COL:
            Collections.sort(result, new Comparator<PaymentHeader>() {
                public int compare(PaymentHeader arg0, PaymentHeader arg1) {
                    return new Long(arg0.getReferenceId()).compareTo(arg1.getReferenceId());
                }
            });
            break;
        case CREATED_COL:
            Collections.sort(result, new Comparator<PaymentHeader>() {
                public int compare(PaymentHeader arg0, PaymentHeader arg1) {
                    SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yy");
                    try {
                        return (sdf.parse(arg0.getCreateDate())).compareTo(sdf.parse(arg1.getCreateDate()));
                    } catch (ParseException e) {
                        return 0;
                    }
                }
            });
            break;
        case MODIFIED_COL:
            Collections.sort(result, new Comparator<PaymentHeader>() {
                public int compare(PaymentHeader arg0, PaymentHeader arg1) {
                    SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yy");
                    try {
                        return (sdf.parse(arg0.getModifyDate())).compareTo(sdf.parse(arg1.getModifyDate()));
                    } catch (ParseException e) {
                        return 0;
                    }
                }
            });
            break;
        case CONTEST_CATEGORY_NAME_COL:
            Collections.sort(result, new Comparator<PaymentHeader>() {
                public int compare(PaymentHeader arg0, PaymentHeader arg1) {
                    String contestCategoryName0 = arg0.getContestCategoryName() == null ? "" : arg0.getContestCategoryName();
                    String contestCategoryName1 = arg1.getContestCategoryName() == null ? "" : arg1.getContestCategoryName();		
                    return contestCategoryName0.toUpperCase().compareTo(contestCategoryName1.toUpperCase());						
                }
            });
            break;
        case COCKPIT_PROJECT_NAME_COL:
            Collections.sort(result, new Comparator<PaymentHeader>() {
                public int compare(PaymentHeader arg0, PaymentHeader arg1) {
                    String cockpitProjectName0 = arg0.getCockpitProjectName() == null ? "" : arg0.getCockpitProjectName();
                    String cockpitProjectName1 = arg1.getCockpitProjectName() == null ? "" : arg1.getCockpitProjectName();		
                    return cockpitProjectName0.toUpperCase().compareTo(cockpitProjectName1.toUpperCase());						
                }
            });
            break;
        case BILLING_ACCOUNT_NAME_COL:
            Collections.sort(result, new Comparator<PaymentHeader>() {
                public int compare(PaymentHeader arg0, PaymentHeader arg1) {
                    String billingAccountName0 = arg0.getBillingAccountName() == null ? "" : arg0.getBillingAccountName();
                    String billingAccountName1 = arg1.getBillingAccountName() == null ? "" : arg1.getBillingAccountName();		
                    return billingAccountName0.toUpperCase().compareTo(billingAccountName1.toUpperCase());					
                }
            });
            break;
        case INVOICE_NUMBER_COL:
            Collections.sort(result, new Comparator<PaymentHeader>() {
                public int compare(PaymentHeader arg0, PaymentHeader arg1) {
                    String invoiveNumber0 = arg0.getInvoiceNumber() == null ? "" : arg0.getInvoiceNumber();
                    String invoiveNumber1 = arg1.getInvoiceNumber() == null ? "" : arg1.getInvoiceNumber();		
                    return invoiveNumber0.toUpperCase().compareTo(invoiveNumber1.toUpperCase());
                }
            });
            break;
        default:
            Collections.sort(result, new Comparator<PaymentHeader>() {
                public int compare(PaymentHeader arg0, PaymentHeader arg1) {
                    return (new Long(arg1.getId()).compareTo(arg0.getId()));
                }
            });
            break;
        }

        if (invert) {
            Collections.reverse(result);
        }
        
        SortInfo s = new SortInfo();
        s.addDefault(ID_COL, "asc");
        s.addDefault(NAME_COL, "asc");
        s.addDefault(USER_COL, "asc");
        s.addDefault(DESC_COL, "asc");
        s.addDefault(GROSS_COL, "desc");
        s.addDefault(TAX_COL, "desc");
        s.addDefault(NET_COL, "desc");
        s.addDefault(TYPE_COL, "asc");
        s.addDefault(STATUS_COL, "asc");
        s.addDefault(CLIENT_COL, "asc");
        s.addDefault(REFERENCE_ID_COL, "asc");
        s.addDefault(CREATED_COL, "desc");
        s.addDefault(MODIFIED_COL, "desc");
        s.addDefault(CONTEST_CATEGORY_NAME_COL, "asc");
        s.addDefault(COCKPIT_PROJECT_NAME_COL, "asc");
        s.addDefault(BILLING_ACCOUNT_NAME_COL, "asc");		
        s.addDefault(INVOICE_NUMBER_COL, "asc");		
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
    }

}

