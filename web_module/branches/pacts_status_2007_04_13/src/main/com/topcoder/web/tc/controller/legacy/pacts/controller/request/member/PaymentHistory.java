package com.topcoder.web.tc.controller.legacy.pacts.controller.request.member;

import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusFactory;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusFactory.PaymentStatus;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 *
 * @author  cucu
 */
public class PaymentHistory extends BaseProcessor implements PactsConstants {

	public static final String FULL_LIST = "full_list";
	public static final String PAYMENTS = "payments";
	public static final String CODER = "cr";
    private static final int DESCRIPTION_COL = 1;
    private static final int TYPE_COL = 2;
    private static final int DUE_DATE_COL = 3;
    private static final int NET_PAYMENT_COL = 4;
    private static final int STATUS_COL = 5;
	
    protected void businessProcessing() throws TCWebException {
        try {
        	boolean fullList = "true".equals(getRequest().getParameter(FULL_LIST));
            String startRank = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
            String endRank = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.END_RANK));
            String sortColStr = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
            
        	boolean sortAscending= "asc".equals(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        	int sortCol = 3;
        	
        	if (sortColStr.trim().length() > 0) {
        		sortCol = Integer.parseInt(sortColStr);
        	}
        	
            // Normalizes optional parameters and sets defaults
            if ("".equals(startRank) || Integer.parseInt(startRank) <= 0) {
                startRank = "1";
            }
            setDefault(DataAccessConstants.START_RANK, startRank);

            if ("".equals(endRank)) {
                endRank = String.valueOf(Integer.parseInt(startRank) + PactsConstants.PAYMENT_HISTORY_PAGE_SIZE - 1); 
            } else if (Integer.parseInt(endRank) - Integer.parseInt(startRank) > Constants.MAX_HISTORY) {
                endRank = String.valueOf(Integer.parseInt(startRank) + Constants.MAX_HISTORY);
            }
            setDefault(DataAccessConstants.END_RANK, endRank);

            
            DataInterfaceBean dib = new DataInterfaceBean();
            ResultSetContainer rsc = new ResultSetContainer(dib.getPaymentHistory(getUser().getId(), !fullList, sortCol, sortAscending), Integer.parseInt(startRank), Integer.parseInt(endRank));
            
            Map criteria = new HashMap();
            criteria.put(PactsConstants.USER_ID, String.valueOf(getUser().getId()));

            List<BasePayment> payments = dib.findCoderPayments(criteria);
            
            for (BasePayment payment : payments) {
                if (payment.getPaymentType() == 3 || payment.getPaymentType() == 5) {
                    payments.remove(payment);
                } else {
                    if (!fullList) {
                        if (payment.getCurrentStatus().equals(PaymentStatusFactory.createStatus(PaymentStatus.CANCELLED_PAYMENT_STATUS)) ||
                            payment.getCurrentStatus().equals(PaymentStatusFactory.createStatus(PaymentStatus.DELETED_PAYMENT_STATUS)) ||
                            payment.getCurrentStatus().equals(PaymentStatusFactory.createStatus(PaymentStatus.EXPIRED_PAYMENT_STATUS)) ||
                            payment.getCurrentStatus().equals(PaymentStatusFactory.createStatus(PaymentStatus.PAID_PAYMENT_STATUS))) {
                            payments.remove(payment);
                        }
                    }
                }
            }
            
            // sort the result in the first place
            sortResult(payments, sortCol, sortAscending);
            
            // now crop
            payments = cropResult(payments, Integer.parseInt(startRank), Integer.parseInt(endRank));
            
            setDefault(DataAccessConstants.SORT_COLUMN, sortCol + "");
            setDefault(DataAccessConstants.SORT_DIRECTION, sortAscending + "");
            
            getRequest().setAttribute(PAYMENTS, payments);
            getRequest().setAttribute(CODER, getUser().getId() + "");
        	getRequest().setAttribute(FULL_LIST, Boolean.valueOf(fullList));
            setNextPage(PactsConstants.PAYMENT_HISTORY_JSP);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
    

    private List cropResult(List result, int startRank, int endRank) {
        Boolean croppedDataAfter = Boolean.TRUE;
        if (endRank >= result.size()) {
            endRank = result.size();
            croppedDataAfter = Boolean.FALSE;
        }
        getRequest().setAttribute("croppedDataAfter", croppedDataAfter);        
        getRequest().setAttribute("croppedDataBefore", new Boolean(startRank > 1));
        

        if (result.size() > 0) {
            return result.subList(startRank - 1, endRank);
        } else {
            return result;
        }
    }
    
    private void sortResult(List<BasePayment> result, int sortCol, boolean sortAscending) {
        switch (sortCol) {
            case DESCRIPTION_COL:
                Collections.sort(result, new Comparator() {
                    public int compare(Object arg0, Object arg1) {
                        return ((BasePayment) arg0).getDescription().compareTo(((BasePayment) arg1).getDescription());
                    }
                });
                break;
            case TYPE_COL:
                // TODO: pulky: change for the type's description.
//                Collections.sort(result, new Comparator() {
//                    public int compare(Object arg0, Object arg1) {
//                        return ((BasePayment) arg0).getPaymentType().compareTo(((BasePayment) arg1).getPaymentType());
//                    }
//                });
                break;
            case DUE_DATE_COL:
                Collections.sort(result, new Comparator() {
                    public int compare(Object arg0, Object arg1) {
                        return ((BasePayment) arg0).getDueDate().compareTo(((BasePayment) arg1).getDueDate());
                    }
                });
                break;
            case NET_PAYMENT_COL:
                Collections.sort(result, new Comparator() {
                    public int compare(Object arg0, Object arg1) {
                        if (((BasePayment) arg0).getNetAmount() == ((BasePayment) arg1).getNetAmount()) {
                            return 0;
                        }
                        
                        return ((BasePayment) arg0).getNetAmount() < ((BasePayment) arg1).getNetAmount() ? -1 : 1;
                    }
                });
                break;
            case STATUS_COL:
                Collections.sort(result, new Comparator() {
                    public int compare(Object arg0, Object arg1) {
                        return ((BasePayment) arg0).getCurrentStatus().getDesc().compareTo(((BasePayment) arg1).getCurrentStatus().getDesc());
                    }
                });
                break;
        }
        if (!sortAscending) {
            Collections.reverse(result);
        }
    }

}

