/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.legacy.pacts.controller.request.member;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusFactory;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusFactory.PaymentStatus;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusReason.AvailableStatusReason;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

import com.topcoder.excel.Row;
import com.topcoder.excel.Sheet;
import com.topcoder.excel.Workbook;
import com.topcoder.excel.impl.ExcelSheet;
import com.topcoder.excel.impl.ExcelWorkbook;
import com.topcoder.excel.output.Biff8WorkbookSaver;
import com.topcoder.excel.output.WorkbookSaver;
import com.topcoder.excel.output.WorkbookSavingException;

/**
 * <p>
 * Version 1.1 (Member Payments Automation Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Updated {@link #insertSheetData(Sheet, List)} method to include new <code>Release Date</code> column into 
 *     generated Excel worksheet.</li>
 *     <li>Updated {@link #businessProcessing()} method to parse new {@link DataAccessConstants#NUMBER_RECORDS} 
 *     parameter and fix the bug with parsing {@link DataAccessConstants#START_RANK} and 
 *     {@link DataAccessConstants#END_RANK} parameters.</li>
 *     <li>Added {@link #USER_PAYMENT_METHOD} constant.</li>
 *     <li>Added {@link #PAYMENT_CONFIRMATION_TEMPLATE} constant.</li>
 *     <li>Updated {@link #sortResult(List, int, boolean)} method to add sorting by release dates.</li>
 *   </ol>
 * </p>
 *
 * @author  cucu, pulky, VolodymyrK, isv
 * @version 1.1
 */
public class PaymentHistory extends BaseProcessor implements PactsConstants {


    public static final String XLS_FORMAT = "xls";
    public static final String FULL_LIST = "full_list";
    public static final String PAYMENTS = "payments";

    /**
     * <p>A <code>String</code> providing the name for request attribute holding the ID of a payment method preferred by
     * current user.</p>
     * 
     * @since 1.1
     */
    public static final String USER_PAYMENT_METHOD = "userPaymentMethod";

    /**
     * <p>A <code>String</code> providing the name for request attribute holding the template for confirmation message
     * to be shown to current user when processing the payments.</p>
     *
     * @since 1.1
     */
    public static final String PAYMENT_CONFIRMATION_TEMPLATE = "paymentConfirmationTemplate";

    /**
     * 
     */
    public static final String PAYMENT_ID = "paymentId";
    
    public static final String CODER = "cr";
    private static final int DESCRIPTION_COL = 1;
    private static final int TYPE_COL = 2;
    private static final int CREATE_DATE_COL = 3;
    private static final int NET_PAYMENT_COL = 4;
    private static final int STATUS_COL = 5;
    
    /**
     * <p>An <code>int</code> referencing the column with release dates for payments.</p>
     * 
     * @since 1.1
     */
    private static final int RELEASE_DATE_COL = 6;
    
    private static final int PAID_DATE_COL = 7;

    /**
     * <p>Processes the incoming request. Retrieves user payments and binds them to request.</p>
     * 
     * @throws TCWebException if an unexpected error occurs.
     */
    protected void businessProcessing() throws TCWebException {
        try {
            boolean fullList = "true".equals(getRequest().getParameter(FULL_LIST));
            String startRank = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
            String sortColStr = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
            boolean exportToExcel = "true".equals(getRequest().getParameter(XLS_FORMAT));
            String numRecords = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.NUMBER_RECORDS));
            
            boolean sortAscending= "asc".equals(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
            int sortCol = 3;
            
            if (sortColStr.trim().length() > 0) {
                sortCol = Integer.parseInt(sortColStr);
            }
            
            // Normalizes optional parameters and sets defaults
            if ("".equals(numRecords)) {
                numRecords = "20";
            } else if (Integer.parseInt(numRecords) > 200) {
                numRecords = "200";
            }
            setDefault(DataAccessConstants.NUMBER_RECORDS, numRecords);

            if ("".equals(startRank) || Integer.parseInt(startRank) <= 0) {
                startRank = "1";
            }
            setDefault(DataAccessConstants.START_RANK, startRank);

            String endRank = String.valueOf(Integer.parseInt(startRank) + Integer.parseInt(numRecords) - 1);
            setDefault(DataAccessConstants.END_RANK, endRank);

            
            DataInterfaceBean dib = new DataInterfaceBean();
            
            Map criteria = new HashMap();
            long userId = getUser().getId();
            criteria.put(PactsConstants.USER_ID, String.valueOf(userId));

            List<BasePayment> payments = dib.findCoderPayments(criteria);
            
            List<BasePayment> removePayments = new ArrayList<BasePayment>();

            for (BasePayment payment : payments) {
                if (payment.getPaymentType() == 3 || payment.getPaymentType() == 5) {
                    removePayments.add(payment);
                } else {
                    if (!fullList && !exportToExcel) {
                        if (payment.getCurrentStatus().equals(PaymentStatusFactory.createStatus(PaymentStatus.CANCELLED_PAYMENT_STATUS)) ||
                            payment.getCurrentStatus().equals(PaymentStatusFactory.createStatus(PaymentStatus.EXPIRED_PAYMENT_STATUS)) ||
                            payment.getCurrentStatus().equals(PaymentStatusFactory.createStatus(PaymentStatus.PAID_PAYMENT_STATUS))) {
                            removePayments.add(payment);
                        }
                    }

                    // Deleted payments should not be shown either way.
                    if (payment.getCurrentStatus().equals(PaymentStatusFactory.createStatus(PaymentStatus.DELETED_PAYMENT_STATUS))) {
                        removePayments.add(payment);
                    }
                }
            }
            
            payments.removeAll(removePayments);
            
            // sort the result in the first place
            sortResult(payments, sortCol, sortAscending);
            
            if ("on".equalsIgnoreCase(com.topcoder.web.tc.Constants.GLOBAL_AD_FLAG)) {
                removeDuplicateReasons(payments);
            }

            if (exportToExcel) {
                produceXLS(payments);
            } else {
                // now crop
                payments = cropResult(payments, Integer.parseInt(startRank), Integer.parseInt(endRank));
                        
                setDefault(DataAccessConstants.SORT_COLUMN, sortCol + "");
                setDefault(DataAccessConstants.SORT_DIRECTION, getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
            
                getRequest().setAttribute(PAYMENTS, payments);
                getRequest().setAttribute(CODER, userId + "");
                getRequest().setAttribute(FULL_LIST, Boolean.valueOf(fullList));

                SortInfo s = new SortInfo();
                s.addDefault(DESCRIPTION_COL, "asc");
                s.addDefault(TYPE_COL, "asc");
                s.addDefault(CREATE_DATE_COL, "desc");
                s.addDefault(NET_PAYMENT_COL, "desc");
                s.addDefault(STATUS_COL, "asc");
                s.addDefault(RELEASE_DATE_COL, "desc");
                s.addDefault(PAID_DATE_COL, "desc");
                getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
                
                // Get user's payment method preferences
                Long userPaymentMethod = dib.getUserPaymentMethod(userId);
                getRequest().setAttribute(USER_PAYMENT_METHOD, userPaymentMethod);
                if (userPaymentMethod != null) {
                    if (userPaymentMethod == PAYPAL_PAYMENT_METHOD_ID) {
                        getRequest()
                            .setAttribute(PAYMENT_CONFIRMATION_TEMPLATE, 
                                          Constants.PAYME_CONFIRMATION_MESSAGE_TEMPLATE_PAYPAL);
                    } else if (userPaymentMethod == PAYONEER_PAYMENT_METHOD_ID) {
                        getRequest()
                            .setAttribute(PAYMENT_CONFIRMATION_TEMPLATE, 
                                          Constants.PAYME_CONFIRMATION_MESSAGE_TEMPLATE_PAYONEER);
                    } else if (userPaymentMethod == WESTERN_UNION_PAYMENT_METHOD_ID) {
                        getRequest()
                            .setAttribute(PAYMENT_CONFIRMATION_TEMPLATE, 
                                          Constants.PAYME_CONFIRMATION_MESSAGE_TEMPLATE_WESTERN_UNION);
                    }
                }

                setNextPage(PactsConstants.PAYMENT_HISTORY_JSP);
                setIsNextPageInContext(true);
            }
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    private void produceXLS(List<BasePayment> payments) throws WorkbookSavingException, IOException {
        Workbook workbook = new ExcelWorkbook();
        Sheet sheet = new ExcelSheet("Member Payments", (ExcelWorkbook) workbook);
        insertSheetData(sheet, payments);
        workbook.addSheet(sheet);

        // Create a new WorkBookSaver
        WorkbookSaver saver = new Biff8WorkbookSaver();
        ByteArrayOutputStream saveTo = new ByteArrayOutputStream();
        saver.save(workbook, saveTo);

        // Write the output
        getResponse().addHeader("content-disposition", "attachment; filename=\"payments.xls\"");
        getResponse().setContentType("application/vnd.ms-excel");

        ServletOutputStream output = getResponse().getOutputStream();
        saveTo.writeTo(getResponse().getOutputStream());

        getResponse().setStatus(HttpServletResponse.SC_OK);
        output.flush();
    }

    /**
     * <p>Inserts the sheet data.</p>
     *
     * @param sheet the sheet.
     * @param payments a list of payments to be included into generated worksheet.
     */
    private void insertSheetData(Sheet sheet, List<BasePayment> payments) {
        // the date format used for displaying the dates
        DateFormat dateFormatter = new SimpleDateFormat("MM/dd/yyy");

        // set up the sheet header first
        Row row = sheet.getRow(1);
        row.getCell(1).setStringValue("Description");
        row.getCell(2).setStringValue("Type");
        row.getCell(3).setStringValue("Create Date");
        row.getCell(4).setStringValue("Net Payment");
        row.getCell(5).setStringValue("Status");
        row.getCell(6).setStringValue("Release Date");
        row.getCell(7).setStringValue("Date Paid");

        // insert sheet data from 2nd row
        int rowIndex = 2;
        for (BasePayment payment : payments) {
            row = sheet.getRow(rowIndex++);

            row.getCell(1).setStringValue(payment.getDescription());
            row.getCell(2).setStringValue(payment.getPaymentTypeDesc());
            row.getCell(3).setStringValue(dateFormatter.format(payment.getCreateDate()));
            row.getCell(4).setNumberValue(payment.getNetAmount());
            row.getCell(5).setStringValue(payment.getCurrentStatus().getDesc());
            if (payment.getDueDate() != null) {
                row.getCell(6).setStringValue(dateFormatter.format(payment.getDueDate()));
            }
            if (payment.getPaidDate() != null) {
                row.getCell(7).setStringValue(dateFormatter.format(payment.getPaidDate()));
            }
        }

    }

    /**
     * <p>Gets the items for the specified range within the specified list.</p> 
     * 
     * @param result a <code>List</code> providing the data. 
     * @param startRank an <code>int</code> providing the index of starting item.
     * @param endRank an <code>int</code> providing the index of last item.
     * @return a <code>List</code> listing the items within the specified range. 
     */
    private List cropResult(List result, int startRank, int endRank) {
        Boolean croppedDataAfter = Boolean.TRUE;
        if (endRank >= result.size()) {
            endRank = result.size();
            croppedDataAfter = Boolean.FALSE;
        }
        getRequest().setAttribute("croppedDataAfter", croppedDataAfter);        
        getRequest().setAttribute("croppedDataBefore", new Boolean(startRank > 1));
        

        if (result.size() > 0) {
            if (startRank <= endRank) {
                return result.subList(startRank - 1, endRank);
            } else {
                return Collections.emptyList();
            }
        } else {
            return result;
        }
    }

    /**
     * Remove duplicate reasons from payment list
     *
     * @param result the original payment list.
     */
    protected void removeDuplicateReasons(List<BasePayment> result) {
        if (result.size() == 0) {
            return;
        }
        
        for (BasePayment bp : result) {
            if (bp.getCurrentStatus().getReasons().contains(AvailableStatusReason.NO_HARD_COPY_AD_REASON.getStatusReason()) &&
                    bp.getCurrentStatus().getReasons().contains(AvailableStatusReason.NO_SIGNED_GLOBAL_AD_REASON.getStatusReason())) {
                bp.getCurrentStatus().getReasons().remove(AvailableStatusReason.NO_SIGNED_GLOBAL_AD_REASON.getStatusReason());
            }
        }
    }

    /**
     * <p>Sorts the specified payments against specified column in specified order.</p>
     * 
     * @param result a list of payments to sort.
     * @param sortCol a number of column to sort against.
     * @param sortAscending true if sorting is to be ascending; false if descending.
     */
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
                Collections.sort(result, new Comparator() {
                    public int compare(Object arg0, Object arg1) {
                        return ((BasePayment) arg0).getPaymentTypeDesc().compareTo(((BasePayment) arg1).getPaymentTypeDesc());
                    }
                });
                break;
            case CREATE_DATE_COL:
                Collections.sort(result, new Comparator() {
                    public int compare(Object arg0, Object arg1) {
                        Date date0 = ((BasePayment) arg0).getCreateDate();
                        Date date1 = ((BasePayment) arg1).getCreateDate();
                        if (date0 == null && date1 == null) return 0; 
                        if (date0 == null && date1 != null) return -1; 
                        if (date0 != null && date1 == null) return 1; 
                        
                        return date0.compareTo(date1);
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
            case RELEASE_DATE_COL:
                Collections.sort(result, new Comparator() {
                    public int compare(Object arg0, Object arg1) {
                        Date date0 = ((BasePayment) arg0).getDueDate();
                        Date date1 = ((BasePayment) arg1).getDueDate();
                        if (date0 == null && date1 == null) return 0;
                        if (date0 == null && date1 != null) return -1;
                        if (date0 != null && date1 == null) return 1;

                        return date0.compareTo(date1);
                    }
                });
                break;
            case PAID_DATE_COL:
                Collections.sort(result, new Comparator() {                    
                    public int compare(Object arg0, Object arg1) {
                        Date date0 = ((BasePayment) arg0).getPaidDate();
                        Date date1 = ((BasePayment) arg1).getPaidDate();
                        if (date0 == null && date1 == null) return 0; 
                        if (date0 == null && date1 != null) return -1; 
                        if (date0 != null && date1 == null) return 1; 
                        
                        return date0.compareTo(date1);
                    }
                });
                break;
        }
        if (!sortAscending) {
            Collections.reverse(result);
        }
    }

}

