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
import java.text.DecimalFormat;
import java.text.NumberFormat;
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
 *
 * @author  cucu, pulky, VolodymyrK
 */
public class PaymentHistory extends BaseProcessor implements PactsConstants {


    public static final String XLS_FORMAT = "xls";
    public static final String XLS_LINK = "xls_link";
    public static final String FULL_LIST = "full_list";
    public static final String PAYMENTS = "payments";
    public static final String CODER = "cr";
    private static final int DESCRIPTION_COL = 1;
    private static final int TYPE_COL = 2;
    private static final int DUE_DATE_COL = 3;
    private static final int NET_PAYMENT_COL = 4;
    private static final int STATUS_COL = 5;
    private static final int PAID_DATE_COL = 6;
    
    protected void businessProcessing() throws TCWebException {
        try {
            boolean fullList = "true".equals(getRequest().getParameter(FULL_LIST));
            String startRank = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
            String endRank = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.END_RANK));
            String sortColStr = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
            boolean exportToExcel = "true".equals(getRequest().getParameter(XLS_FORMAT));
            
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
            
            Map criteria = new HashMap();
            criteria.put(PactsConstants.USER_ID, String.valueOf(getUser().getId()));

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
                getRequest().setAttribute(CODER, getUser().getId() + "");
                getRequest().setAttribute(FULL_LIST, Boolean.valueOf(fullList));

                String requestQuery = MEMBER_SERVLET_URL + "?" + getRequest().getQueryString();
                String xlsLink = requestQuery + "&" + XLS_FORMAT + "=true";
                getRequest().setAttribute(XLS_LINK, xlsLink);
            
                SortInfo s = new SortInfo();
                s.addDefault(DESCRIPTION_COL, "asc");
                s.addDefault(TYPE_COL, "asc");
                s.addDefault(DUE_DATE_COL, "desc");
                s.addDefault(NET_PAYMENT_COL, "desc");
                s.addDefault(STATUS_COL, "asc");
                s.addDefault(PAID_DATE_COL, "desc");
                getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
            
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
     */
    private void insertSheetData(Sheet sheet, List<BasePayment> payments) {
        // the date format used for displaying the dates
        DateFormat dateFormatter = new SimpleDateFormat("MM/dd/yyy");

        // the format used for payment amounts
        NumberFormat moneyFormatter = new DecimalFormat("###,##0.00");

        // set up the sheet header first
        Row row = sheet.getRow(1);
        row.getCell(1).setStringValue("Description");
        row.getCell(2).setStringValue("Type");
        row.getCell(3).setStringValue("Due Date");
        row.getCell(4).setStringValue("Net Payment");
        row.getCell(5).setStringValue("Status");
        row.getCell(6).setStringValue("Date Paid");

        // insert sheet data from 2nd row
        int rowIndex = 2;
        for (BasePayment payment : payments) {
            row = sheet.getRow(rowIndex++);

            row.getCell(1).setStringValue(payment.getDescription());
            row.getCell(2).setStringValue(payment.getPaymentTypeDesc());
            row.getCell(3).setStringValue(dateFormatter.format(payment.getDueDate()));
            row.getCell(4).setStringValue(moneyFormatter.format(payment.getNetAmount()));
            row.getCell(5).setStringValue(payment.getCurrentStatus().getDesc());

            if (payment.getPaidDate() != null) {
                row.getCell(6).setStringValue(dateFormatter.format(payment.getPaidDate()));
            }
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
            case DUE_DATE_COL:
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

