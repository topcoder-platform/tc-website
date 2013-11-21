package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.text.ParseException;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.io.PrintWriter;
import java.io.IOException;
import java.io.ByteArrayOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletOutputStream;

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
import com.topcoder.web.tc.controller.legacy.pacts.common.UserProfileHeader;
import com.topcoder.web.tc.controller.legacy.pacts.common.TCData;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.OutputKeys;
 
import com.topcoder.excel.Row;
import com.topcoder.excel.Sheet;
import com.topcoder.excel.Workbook;
import com.topcoder.excel.impl.ExcelSheet;
import com.topcoder.excel.impl.ExcelWorkbook;
import com.topcoder.excel.output.Biff8WorkbookSaver;
import com.topcoder.excel.output.WorkbookSaver;
import com.topcoder.excel.output.WorkbookSavingException;
 
import org.w3c.dom.Attr;
import org.w3c.dom.Text;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

/**
 * Display a Payment List
 *
 * @author  cucu, pulky, VolodymyrK
 */
public class PaymentList extends PactsBaseProcessor implements PactsConstants {
    
    public static final String PAYMENTS = "payments";
    public static final String TRAVELEX_XML_FORMAT = "travxml";
    public static final String TRAVELEX_XML_LINK = "travxml_link";
    public static final String XLS_FORMAT = "xls";
    public static final String XLS_LINK = "xls_link";
    public static final String PAYONEER_XML_FORMAT = "payoneer_xml";
    public static final String PAYONEER_XML_LINK = "payoneer_xml_link";

    public static final String REFERENCE_PAYMENTS = "reference_payments";
    public static final String BREAKDOWN_LINKS = "breakdown_links";
    public static final String GROUPED_NET_AMOUNTS = "grouped_net_amounts";
    public static final String GROUPED_GROSS_AMOUNTS = "grouped_gross_amounts";
    public static final String GROUP_BY_FIELDS = "group_by_fields";

    public static final int NAME_COL = 1;
    public static final int USER_COL = 2;
    public static final int DESC_COL = 3;
    public static final int GROSS_COL = 4;
    public static final int TAX_COL = 5;
    public static final int NET_COL = 6;
    public static final int TYPE_COL = 7;
    public static final int STATUS_COL = 8;
    public static final int CREATE_DATE_COL = 9;
    public static final int MODIFY_DATE_COL = 10;
    public static final int CLIENT_COL = 11;
    public static final int ID_COL = 12;
    public static final int REFERENCE_ID_COL = 13;
    public static final int CONTEST_CATEGORY_NAME_COL = 14;
    public static final int COCKPIT_PROJECT_NAME_COL = 15;
    public static final int BILLING_ACCOUNT_NAME_COL = 16;
    public static final int INVOICE_NUMBER_COL = 17;
    public static final int PAID_DATE_COL = 18;
    public static final int METHOD_COL = 19;

    private static final double WESTERN_UNION_FEE = 8.0;

    protected void businessProcessing() throws TCWebException {
        try {
            boolean invert = "desc".equals(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));

            int sortCol = 0;

            if (!"".equals(StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN)).trim())) {
                sortCol = Integer.parseInt(StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN)));
            }

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

                List<Integer> groupByFields = getGroupByFields();
                if (groupByFields.size() > 0) {
                    sortResult(Arrays.asList(results), sortCol, invert);
                    processGroupingReport(results, groupByFields);
                    return;
                }

                List<PaymentHeader> payments = new ArrayList<PaymentHeader>();
                for (int i = 0; i < results.length; i++) {
                    // remove the word "Payment" from the type description
                    int pos = results[i].getType().indexOf("Payment");
                    if (pos >= 0) {
                        results[i].setType(results[i].getType().substring(0, pos) );
                    }
                    
                    payments.add(results[i]);
                }
                
                if (results.length > 1) {
                    sortResult(payments, sortCol, invert);
                }                    

                if ("on".equalsIgnoreCase(com.topcoder.web.tc.Constants.GLOBAL_AD_FLAG)) {
                    removeDuplicateReasons(payments);
                }

                getRequest().setAttribute(PAYMENTS, payments);

                // mirror parameters
                getRequest().setAttribute(PAYMENT_ID, StringUtils.htmlEncode(createValuesStr(getRequest().getParameterValues(PAYMENT_ID))));
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
                getRequest().setAttribute(STATUS_CODE, StringUtils.htmlEncode(createValuesStr(getRequest().getParameterValues(STATUS_CODE))));
                getRequest().setAttribute(TYPE_CODE, StringUtils.htmlEncode(createValuesStr(getRequest().getParameterValues(TYPE_CODE))));
                getRequest().setAttribute(METHOD_CODE, StringUtils.htmlEncode(getRequest().getParameter(METHOD_CODE)));

                getRequest().setAttribute(AFFIDAVIT_ID, StringUtils.htmlEncode(getRequest().getParameter(AFFIDAVIT_ID)));
                getRequest().setAttribute(CONTRACT_ID, StringUtils.htmlEncode(getRequest().getParameter(CONTRACT_ID)));
                getRequest().setAttribute(USER_ID, StringUtils.htmlEncode(getRequest().getParameter(USER_ID)));
                
                if (getRequest().getAttribute(CHECKED_PAYMENT_ID) == null) {
                    getRequest().setAttribute(CHECKED_PAYMENT_ID, "");                        
                }

                if ("true".equals(getRequest().getParameter(TRAVELEX_XML_FORMAT))) {
                    produceTravelexXML();
                } else if ("true".equals(getRequest().getParameter(XLS_FORMAT))) {
                    produceXLS();
                } else if ("true".equals(getRequest().getParameter(PAYONEER_XML_FORMAT))) {
                    producePayoneerXML();
                } else {                   
                    String xls_link = requestQuery + "&" + XLS_FORMAT + "=true";
                    String travxml_link = requestQuery + "&" + TRAVELEX_XML_FORMAT + "=true";
                    String payoneer_xml_link = requestQuery + "&" + PAYONEER_XML_FORMAT + "=true";
                    getRequest().setAttribute(XLS_LINK, xls_link);
                    getRequest().setAttribute(TRAVELEX_XML_LINK, travxml_link);
                    getRequest().setAttribute(PAYONEER_XML_LINK, payoneer_xml_link);

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

    public void produceTravelexXML() throws TCWebException, IOException {
        getResponse().addHeader("content-disposition", "attachment; filename=\"payments.xml\"");
        getResponse().setContentType("text/xml");

        List<PaymentHeader> allPayments = (List<PaymentHeader>) getRequest().getAttribute(PaymentList.PAYMENTS);
        Map<Long, List<PaymentHeader>> userPaymentsMap = new HashMap<Long, List<PaymentHeader>>();

        // Group all payments by member.
        for (PaymentHeader payment : allPayments) {
            // Only Wire and ACH payments get into the Travelex XML
            if (!payment.getMethod().equals("Western Union")) {
                continue;
            }

            long userId = payment.getUser().getId();
            List<PaymentHeader> userPayments = userPaymentsMap.get(userId);
            if (userPayments == null) {
                userPayments = new ArrayList<PaymentHeader>();
                userPaymentsMap.put(userId, userPayments);
            }
            userPayments.add(payment);
        }

        Calendar date = Calendar.getInstance();
        date.setTime(new Date());

        try {
            DecimalFormat df = new DecimalFormat("0.00", new DecimalFormatSymbols(Locale.US));
            DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
 
            // root elements
            Document doc = docBuilder.newDocument();
            Element rootElement = doc.createElement("ns0:TPDocXML");
            rootElement.setAttribute("xmlns:ns0", "http://EAI");
            rootElement.setAttribute("Version", "1.0");
            rootElement.setAttribute("FileID", new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").format(date.getTime()));
            doc.appendChild(rootElement);

            Element paymentsElement = doc.createElement("Payments");
            rootElement.appendChild(paymentsElement);
 
            for(Long userId : userPaymentsMap.keySet()) {
                List<PaymentHeader> userPayments = userPaymentsMap.get(userId);
                UserProfileHeader user = userPayments.get(0).getUser();

                double totalUserAmount = 0.0;
                for(PaymentHeader payment : userPayments) {
                    totalUserAmount += payment.getRecentNetAmount();
                }
                totalUserAmount -= WESTERN_UNION_FEE;

                Element paymentElement = doc.createElement("Payment");
                paymentElement.setAttribute("PaymentID", "" + userPayments.get(0).getId());
                paymentElement.setAttribute("PaymentReference", "POP: Honorarium - TopCoder Member Payments");

                Element payFromElement = doc.createElement("PayFrom");
                payFromElement.setAttribute("PFPayerName", "TopCoder, Inc.");
                payFromElement.setAttribute("PFAmount", df.format(totalUserAmount));
                paymentElement.appendChild(payFromElement);

                Element payToElement = doc.createElement("PayTo");
                payToElement.setAttribute("PTPayeeID", user.getHandle());
                payToElement.setAttribute("PTPayeeName", user.getHandle());
                paymentElement.appendChild(payToElement);

                Element remittanceElement = doc.createElement("Remittance");
                remittanceElement.setAttribute("Type", "XML");
                paymentElement.appendChild(remittanceElement);

                for(PaymentHeader payment : userPayments) {
                    Element remittanceRecordElement = doc.createElement("RemittanceRecord");

                    remittanceRecordElement.setAttribute("PayerDocumentDate", new SimpleDateFormat("MM/dd/yyyy").format(date.getTime()));
                    remittanceRecordElement.setAttribute("PayerDocumentType", "PO");
                    remittanceRecordElement.setAttribute("PayerDocumentNumber", "" + payment.getReferenceId());
                    remittanceRecordElement.setAttribute("AmountPaid", df.format(payment.getRecentNetAmount()));
                    remittanceRecordElement.setAttribute("Notes", payment.getDescription());

                    remittanceElement.appendChild(remittanceRecordElement);
                }

                Element remittanceRecordElement = doc.createElement("RemittanceRecord");

                remittanceRecordElement.setAttribute("PayerDocumentDate", new SimpleDateFormat("MM/dd/yyyy").format(date.getTime()));
                remittanceRecordElement.setAttribute("Notes", "Adjustment for Wire Fee");
                remittanceRecordElement.setAttribute("AmountPaid", "0.0");
                remittanceRecordElement.setAttribute("AdjustmentAmount", df.format(-WESTERN_UNION_FEE));
                remittanceRecordElement.setAttribute("AdjustmentReason", "Processing Fee");

                remittanceElement.appendChild(remittanceRecordElement);

                paymentsElement.appendChild(paymentElement);
            }

            // write the content
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "2");

            PrintWriter writer = getResponse().getWriter();
            StreamResult result = new StreamResult(writer); 
            transformer.transform(new DOMSource(doc), result);
            getResponse().setStatus(HttpServletResponse.SC_OK);
            writer.flush();

        } catch (ParserConfigurationException pce) {
            throw new TCWebException(pce);
        } catch (TransformerException tfe) {
            throw new TCWebException(tfe);
        }
    }

    private void produceXLS() throws WorkbookSavingException, IOException {
        Workbook workbook = new ExcelWorkbook();
        Sheet sheet = new ExcelSheet("Payments List", (ExcelWorkbook) workbook);
        
        // the date format used for displaying the dates
        DateFormat dateFormatter = new SimpleDateFormat("MM/dd/yyy");

        // set up the sheet header first
        Row row = sheet.getRow(1);
        int colIndex = 1;
        setStringValue(row, colIndex++, "Payment ID");
        setStringValue(row, colIndex++, "Name");
        setStringValue(row, colIndex++, "User");
        setStringValue(row, colIndex++, "Description");
        setStringValue(row, colIndex++, "Gross");
        setStringValue(row, colIndex++, "Tax");
        setStringValue(row, colIndex++, "Net");
        setStringValue(row, colIndex++, "Type");
        setStringValue(row, colIndex++, "Method");
        setStringValue(row, colIndex++, "Status");
        setStringValue(row, colIndex++, "Client");
        setStringValue(row, colIndex++, "Project");
        setStringValue(row, colIndex++, "Billing Acct");
        setStringValue(row, colIndex++, "Reference ID");
        setStringValue(row, colIndex++, "Contest Category");
        setStringValue(row, colIndex++, "Invoice Number");
        setStringValue(row, colIndex++, "Created");
        setStringValue(row, colIndex++, "Modified");
        setStringValue(row, colIndex++, "Paid");

        // insert sheet data from 2nd row
        int rowIndex = 2;
        List<PaymentHeader> payments = (List<PaymentHeader>) getRequest().getAttribute(PAYMENTS);
        for (PaymentHeader payment : payments) {
            String description = payment.getDescription();

            String status = payment.getCurrentStatus().getDesc();
            for (PaymentStatusReason reason : payment.getCurrentStatus().getReasons()) {
                status += "\n - " + reason.getDesc();
            }
        
            row = sheet.getRow(rowIndex++);
            
            colIndex = 1;
            setNumberValue(row, colIndex++, payment.getId());
            setStringValue(row, colIndex++, payment.getUser().getFullName());
            setStringValue(row, colIndex++, payment.getUser().getHandle());
            setStringValue(row, colIndex++, description);
            setNumberValue(row, colIndex++, payment.getRecentGrossAmount());
            setNumberValue(row, colIndex++, payment.getRecentGrossAmount()-payment.getRecentNetAmount());
            setNumberValue(row, colIndex++, payment.getRecentNetAmount());
            setStringValue(row, colIndex++, payment.getType());
            setStringValue(row, colIndex++, payment.getMethod());
            setStringValue(row, colIndex++, status);
            setStringValue(row, colIndex++, payment.getClient());
            setStringValue(row, colIndex++, payment.getCockpitProjectName());
            setStringValue(row, colIndex++, payment.getBillingAccountName());
            setNumberValue(row, colIndex++, payment.getReferenceId());
            setStringValue(row, colIndex++, payment.getContestCategoryName());
            setStringValue(row, colIndex++, payment.getInvoiceNumber());            
            setStringValue(row, colIndex++, payment.getCreateDate());
            setStringValue(row, colIndex++, payment.getModifyDate());
            setStringValue(row, colIndex++, payment.getPaidDate());
        }
                
        workbook.addSheet(sheet);

        // Create a new WorkBookSaver
        WorkbookSaver saver = new Biff8WorkbookSaver();
        ByteArrayOutputStream saveTo = new ByteArrayOutputStream();
        saver.save(workbook, saveTo);

        // Write the output
        getResponse().addHeader("content-disposition", "attachment; filename=\"payment_list.xls\"");
        getResponse().setContentType("application/vnd.ms-excel");

        ServletOutputStream output = getResponse().getOutputStream();
        saveTo.writeTo(getResponse().getOutputStream());

        getResponse().setStatus(HttpServletResponse.SC_OK);
        output.flush();    
    }
    
    private void setNumberValue(Row row, int colIndex, double value) {
        row.getCell(colIndex).setNumberValue(value);
    }
    
    private void setStringValue(Row row, int colIndex, String value) {
        if (value != null && value.trim().length() > 0) {
            row.getCell(colIndex).setStringValue(value);
        }
    }
    
    public void producePayoneerXML() throws TCWebException, IOException {
        getResponse().addHeader("content-disposition", "attachment; filename=\"payments.xml\"");
        getResponse().setContentType("text/xml");

        List<PaymentHeader> allPayments = (List<PaymentHeader>) getRequest().getAttribute(PaymentList.PAYMENTS);
        Map<Long, Double> memberAmounts = new HashMap<Long, Double>();
        Map<Long, Long> internalPaymentIDs = new HashMap<Long, Long>();
        double totalAmount = 0.0;

        // Group all payments by member.
        for (PaymentHeader payment : allPayments) {
            // Only Payoneer payments get into the Payoneer XML
            if (payment.getMethod().equals("Payoneer")) {
	            long userId = payment.getUser().getId();
	            if (memberAmounts.containsKey(userId)) {
		            memberAmounts.put(userId, memberAmounts.get(userId)+payment.getRecentNetAmount());
	            } else {
		            memberAmounts.put(userId, payment.getRecentNetAmount());
					internalPaymentIDs.put(userId, payment.getId());
	            } 
                totalAmount += payment.getRecentNetAmount();				
			}
        }

        Calendar date = Calendar.getInstance();
        date.setTime(new Date());

        try {
            DecimalFormat df = new DecimalFormat("0.00", new DecimalFormatSymbols(Locale.US));
            DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
 
            // root elements
            Document doc = docBuilder.newDocument();

            Element payoneerInElement = doc.createElement("PayoneerIn");
            doc.appendChild(payoneerInElement);
 
            Element payoutPaymentsElement = doc.createElement("PayoutPayments");
            payoneerInElement.appendChild(payoutPaymentsElement);
         
            for(Long userId : memberAmounts.keySet()) {
                Element payoutPaymentElement = doc.createElement("PayoutPayment");
                payoutPaymentsElement.appendChild(payoutPaymentElement);
                
                Element paymentDateElement = doc.createElement("PaymentDate");
                paymentDateElement.appendChild(doc.createTextNode(new SimpleDateFormat("MM/dd/yyyy").format(date.getTime())));

                Element payeeIDElement = doc.createElement("PayeeID");
                payeeIDElement.appendChild(doc.createTextNode(""+userId));

                Element intPaymentIDElement = doc.createElement("IntPaymentID");
                intPaymentIDElement.appendChild(doc.createTextNode(""+internalPaymentIDs.get(userId)));

                Element amountElement = doc.createElement("Amount");
                amountElement.appendChild(doc.createTextNode(df.format(memberAmounts.get(userId))));
                
                Element currencyElement = doc.createElement("Currency");
                currencyElement.appendChild(doc.createTextNode("USD"));

                Element descriptionElement = doc.createElement("Description");
                descriptionElement.appendChild(doc.createTextNode("TopCoder Member Payments"));
                
                payoutPaymentElement.appendChild(paymentDateElement);
                payoutPaymentElement.appendChild(payeeIDElement);
                payoutPaymentElement.appendChild(intPaymentIDElement);
                payoutPaymentElement.appendChild(amountElement);
                payoutPaymentElement.appendChild(currencyElement);
                payoutPaymentElement.appendChild(descriptionElement);
            }

            Element payoutTotals = doc.createElement("Totals");
            payoneerInElement.appendChild(payoutTotals);
            
            Element amountElement = doc.createElement("Amount");
            amountElement.appendChild(doc.createTextNode(df.format(totalAmount)));
            payoutTotals.appendChild(amountElement);    

            // write the content
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "2");

            PrintWriter writer = getResponse().getWriter();
            StreamResult result = new StreamResult(writer); 
            transformer.transform(new DOMSource(doc), result);
            getResponse().setStatus(HttpServletResponse.SC_OK);
            writer.flush();

        } catch (ParserConfigurationException pce) {
            throw new TCWebException(pce);
        } catch (TransformerException tfe) {
            throw new TCWebException(tfe);
        }
    }

    /**
     * Finds a payment in the specified list that belongs to the same group that the specified target payment.
     * the grouping is defined by the groupByFields parameter.
     *
     * @param payments List of reference payments. Each payment in the list represents a group.
     * @param tagetPayment Target payment whose group is to be found.
     * @param groupByFields List of the fields the payments are grouped by.
     * @return Index of the group in the payments list or -1 if no group found.
     */
    private int findReferencePayment(List<PaymentHeader> payments, PaymentHeader tagetPayment, List<Integer> groupByFields) {
        for (int i=0;i<payments.size();i++) {
            PaymentHeader payment = payments.get(i);
            
            boolean match = true;
            for (Integer groupByField : groupByFields) {
                if (groupByField == USER_COL && !payment.getUser().getHandle().equals(tagetPayment.getUser().getHandle())) {
                    match = false;
                }
                if (groupByField == TYPE_COL && !payment.getType().equals(tagetPayment.getType())) {
                    match = false;
                }
                if (groupByField == STATUS_COL && !payment.getRecentStatus().equals(tagetPayment.getRecentStatus())) {
                    match = false;
                }
                if (groupByField == METHOD_COL && !payment.getMethod().equals(tagetPayment.getMethod())) {
                    match = false;
                }
                if (groupByField == PAID_DATE_COL && !payment.getPaidDate().equals(tagetPayment.getPaidDate())) {
                    match = false;
                }
                if (groupByField == CREATE_DATE_COL && !payment.getCreateDate().equals(tagetPayment.getCreateDate())) {
                    match = false;
                }
            }
            if (match) {
                return i;
            }
        }
        return -1;
    }

    /**
     * Generates breakdown report link for the specified group.
     *
     * @param payment Reference payment that defines the group.
     * @param groupByFields List of the fields the payments are grouped by.
     * @return URL link for the group breakdown report.
     */
    private String getBreakdownLink(PaymentHeader payment, List<Integer> groupByFields) {
        String requestQuery = INTERNAL_SERVLET_URL + "?" + getRequest().getQueryString();
        
        // Remove the grouping parameters from the request string.
        requestQuery = requestQuery.replaceAll(GROUPING_CODE + "=[^&]*&", "").replaceAll(GROUPING_CODE + "=[^&]*$", "");

        // For each grouping field replace the existing constraints in the request string with the one corresponding to the group.
        for (Integer groupingField : groupByFields) {
            if (groupingField == USER_COL) {
                requestQuery = requestQuery.replaceAll(HANDLE + "=[^&]*&", "").replaceAll(HANDLE + "=[^&]*$", "");
                requestQuery = (requestQuery.endsWith("&") ? requestQuery : requestQuery + "&") + HANDLE + "=" + payment.getUser().getHandle();
            }
            if (groupingField == TYPE_COL) {
                requestQuery = requestQuery.replaceAll(TYPE_CODE + "=[^&]*&", "").replaceAll(TYPE_CODE + "=[^&]*$", "");
                requestQuery = (requestQuery.endsWith("&") ? requestQuery : requestQuery + "&") + TYPE_CODE + "=" + payment.getTypeId();
            }
            if (groupingField == STATUS_COL) {
                requestQuery = requestQuery.replaceAll(STATUS_CODE + "=[^&]*&", "").replaceAll(STATUS_CODE + "=[^&]*$", "");
                requestQuery = (requestQuery.endsWith("&") ? requestQuery : requestQuery + "&") + STATUS_CODE + "=" + payment.getRecentStatusId();
            }
            if (groupingField == METHOD_COL) {
                requestQuery = requestQuery.replaceAll(METHOD_CODE + "=[^&]*&", "").replaceAll(METHOD_CODE + "=[^&]*$", "");
                requestQuery = (requestQuery.endsWith("&") ? requestQuery : requestQuery + "&") + METHOD_CODE + "=" + payment.getMethodId();
            }                        
            if (groupingField == PAID_DATE_COL) {
                requestQuery = requestQuery.replaceAll(EARLIEST_PAY_DATE + "=[^&]*&", "").replaceAll(EARLIEST_PAY_DATE + "=[^&]*$", "");
                requestQuery = (requestQuery.endsWith("&") ? requestQuery : requestQuery + "&") + EARLIEST_PAY_DATE + "=" + payment.getPaidDate();

                requestQuery = requestQuery.replaceAll(LATEST_PAY_DATE + "=[^&]*&", "").replaceAll(LATEST_PAY_DATE + "=[^&]*$", "");
                requestQuery = (requestQuery.endsWith("&") ? requestQuery : requestQuery + "&") + LATEST_PAY_DATE + "=" + payment.getPaidDate();
            }
            if (groupingField == CREATE_DATE_COL) {
                requestQuery = requestQuery.replaceAll(EARLIEST_CREATION_DATE + "=[^&]*&", "").replaceAll(EARLIEST_CREATION_DATE + "=[^&]*$", "");
                requestQuery = (requestQuery.endsWith("&") ? requestQuery : requestQuery + "&") + EARLIEST_CREATION_DATE + "=" + payment.getCreateDate();

                requestQuery = requestQuery.replaceAll(LATEST_CREATION_DATE + "=[^&]*&", "").replaceAll(LATEST_CREATION_DATE + "=[^&]*$", "");
                requestQuery = (requestQuery.endsWith("&") ? requestQuery : requestQuery + "&") + LATEST_CREATION_DATE + "=" + payment.getCreateDate();
            }
        }
        return requestQuery;
    }

    /**
     * Groups payments by the specified fields and saves the result to the request attributes.
     *
     * @param payments Arrays of payments to be grouped.
     * @param groupByFields List of the fields the payments will be grouped by.
     */
    private void processGroupingReport(PaymentHeader[] payments, List<Integer> groupByFields) throws WorkbookSavingException, IOException {
        // This list will contain one payment from each group, this payment will be referred to
        // as the "reference payment" for all other payments in the same group.
        List<PaymentHeader> referencePayments = new ArrayList<PaymentHeader>();

        // This list will contain all URL links for the breakdown report for each group.
        List<String> breakdownLinks = new ArrayList<String>();

        List<Double> netAmounts = new ArrayList<Double>(), grossAmounts = new ArrayList<Double>();
        
        for(PaymentHeader payment : payments) {
            // Check if there's already a group for this payment.
            int index = findReferencePayment(referencePayments, payment, groupByFields);
            if (index != -1) {
                // Add net and gross amounts to the existing group.
                netAmounts.set(index, netAmounts.get(index)+payment.getRecentNetAmount());
                grossAmounts.set(index, grossAmounts.get(index)+payment.getRecentGrossAmount());
            } else {
                // If no group found it is added to the list.
                referencePayments.add(payment);
                netAmounts.add(payment.getRecentNetAmount());
                grossAmounts.add(payment.getRecentGrossAmount());
                breakdownLinks.add(getBreakdownLink(payment, groupByFields));
            }
        }

        if ("true".equals(getRequest().getParameter(XLS_FORMAT))) {
            produceGroupingXLS(groupByFields, referencePayments, netAmounts, grossAmounts);
        } else {           
            String requestQuery = INTERNAL_SERVLET_URL + "?" + getRequest().getQueryString();        
            String xls_link = requestQuery + "&" + XLS_FORMAT + "=true";
            getRequest().setAttribute(XLS_LINK, xls_link);
            getRequest().setAttribute(REFERENCE_PAYMENTS, referencePayments);
            getRequest().setAttribute(BREAKDOWN_LINKS, breakdownLinks);
            getRequest().setAttribute(GROUPED_NET_AMOUNTS, netAmounts);
            getRequest().setAttribute(GROUPED_GROSS_AMOUNTS, grossAmounts);
            getRequest().setAttribute(GROUP_BY_FIELDS, groupByFields);
            setNextPage(INTERNAL_GROUPED_PAYMENT_LIST_JSP);
            setIsNextPageInContext(true);
         }
    }

    /**
     * Returns list of payment fields to group by.
     * @return List of the fields the payments will be grouped by.
     */
    private List<Integer> getGroupByFields() {
        String[] values = getRequest().getParameterValues(GROUPING_CODE);
        
        Set<Integer> groupByFields = new HashSet<Integer>();
        if (values != null) {
            for (String value : values) {
                if (StringUtils.isNumber(value)) {
                    Integer colID = Integer.valueOf(value);
                    if (colID == USER_COL || colID == TYPE_COL || colID == STATUS_COL ||
                        colID == METHOD_COL || colID == PAID_DATE_COL || colID == CREATE_DATE_COL) {
                        groupByFields.add(colID);
                    }
                }
            }
        }
        
        List<Integer> ret = new ArrayList<Integer>(groupByFields);
        Collections.sort(ret);
        return ret;
    }

    private void produceGroupingXLS(List<Integer> groupByFields, List<PaymentHeader> referencePayments,
        List<Double> netAmounts, List<Double> grossAmounts) throws WorkbookSavingException, IOException {
        Workbook workbook = new ExcelWorkbook();
        Sheet sheet = new ExcelSheet("Grouped Payments List", (ExcelWorkbook) workbook);
        
        // the date format used for displaying the dates
        DateFormat dateFormatter = new SimpleDateFormat("MM/dd/yyy");

        // set up the sheet header first
        int colIndex = 1;
        Row row = sheet.getRow(1);
        for(Integer groupByField : groupByFields) {
            switch (groupByField) {
                case USER_COL:
                    setStringValue(row, colIndex++, "Handle");
                    break;
                case TYPE_COL:
                    setStringValue(row, colIndex++, "Type");
                    break;
                case STATUS_COL:
                    setStringValue(row, colIndex++, "Status");
                    break;
                case METHOD_COL:
                    setStringValue(row, colIndex++, "Method");
                    break;
                case PAID_DATE_COL:
                    setStringValue(row, colIndex++, "Paid Date");
                    break;
                case CREATE_DATE_COL:
                    setStringValue(row, colIndex++, "Creation Date");
                    break;
            }
        }
        setStringValue(row, colIndex++, "Gross Total");
        setStringValue(row, colIndex++, "Net Total");

        // insert sheet data from 2nd row
        int rowIndex = 2;
        for (int i=0; i<referencePayments.size(); i++) {
            PaymentHeader payment = referencePayments.get(i);
            row = sheet.getRow(rowIndex++);
            
            colIndex = 1;
            for(Integer groupByField : groupByFields) {
                switch (groupByField) {
                    case USER_COL:
                        setStringValue(row, colIndex++, payment.getUser().getHandle());
                        break;
                    case TYPE_COL:
                        setStringValue(row, colIndex++, payment.getType());
                        break;
                    case STATUS_COL:
                        setStringValue(row, colIndex++, payment.getCurrentStatus().getDesc());
                        break;
                    case METHOD_COL:
                        setStringValue(row, colIndex++, payment.getMethod());
                        break;
                    case PAID_DATE_COL:
                        setStringValue(row, colIndex++, payment.getPaidDate());
                        break;
                    case CREATE_DATE_COL:
                        setStringValue(row, colIndex++, payment.getCreateDate());
                        break;
                }
            }
        setNumberValue(row, colIndex++, grossAmounts.get(i));
        setNumberValue(row, colIndex++, netAmounts.get(i));
        }
                
        workbook.addSheet(sheet);

        // Create a new WorkBookSaver
        WorkbookSaver saver = new Biff8WorkbookSaver();
        ByteArrayOutputStream saveTo = new ByteArrayOutputStream();
        saver.save(workbook, saveTo);

        // Write the output
        getResponse().addHeader("content-disposition", "attachment; filename=\"grouped_payment_list.xls\"");
        getResponse().setContentType("application/vnd.ms-excel");

        ServletOutputStream output = getResponse().getOutputStream();
        saveTo.writeTo(getResponse().getOutputStream());

        getResponse().setStatus(HttpServletResponse.SC_OK);
        output.flush();    
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
        param = request.getParameter(EARLIEST_MODIFICATION_DATE);
        if (param != null && !param.equals("")) query.put(EARLIEST_MODIFICATION_DATE, TCData.dateForm(param));
        param = request.getParameter(LATEST_MODIFICATION_DATE);
        if (param != null && !param.equals("")) query.put(LATEST_MODIFICATION_DATE, TCData.dateForm(param));
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
        param = request.getParameter(COCKPIT_PROJECT);
        if (param != null && !param.equals("")) query.put(COCKPIT_PROJECT, param);
        param = request.getParameter(BILLING_ACCOUNT);
        if (param != null && !param.equals("")) query.put(BILLING_ACCOUNT, param);
        param = request.getParameter(IS_TAXED);
        if (param != null && !param.equals("")) query.put(IS_TAXED, param);
        param = request.getParameter(IS_INVOICED);
        if (param != null && !param.equals("")) query.put(IS_INVOICED, param);

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
                    if (arg1.getType() == null) {
                        return -1;
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
                    if (arg1.getRecentStatus() == null) {
                        return -1;
                    }
                    return arg0.getRecentStatus().toUpperCase().compareTo(arg1.getRecentStatus().toUpperCase());
                }
            });
            break;
        case METHOD_COL:
            Collections.sort(result, new Comparator<PaymentHeader>() {
                public int compare(PaymentHeader arg0, PaymentHeader arg1) {
                    if (arg0.getMethod() == null) {
                        return 1;
                    }
                    if (arg1.getMethod() == null) {
                        return -1;
                    }
                    return arg0.getMethod().toUpperCase().compareTo(arg1.getMethod().toUpperCase());
                }
            });
            break;
        case CLIENT_COL:
            Collections.sort(result, new Comparator<PaymentHeader>() {
                public int compare(PaymentHeader arg0, PaymentHeader arg1) {
                    if (arg0.getClient() == null) {
                        return 1;
                    }
                    if (arg1.getClient() == null) {
                        return -1;
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
        case CREATE_DATE_COL:
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
        case MODIFY_DATE_COL:
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
        case PAID_DATE_COL:
            Collections.sort(result, new Comparator<PaymentHeader>() {
                public int compare(PaymentHeader arg0, PaymentHeader arg1) {
                    SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yy");
                    try {
                        return (sdf.parse(arg0.getPaidDate())).compareTo(sdf.parse(arg1.getPaidDate()));
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
                    String invoiceNumber0 = arg0.getInvoiceNumber() == null ? "" : arg0.getInvoiceNumber();
                    String invoiceNumber1 = arg1.getInvoiceNumber() == null ? "" : arg1.getInvoiceNumber();      
                    return invoiceNumber0.toUpperCase().compareTo(invoiceNumber1.toUpperCase());                  
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
        s.addDefault(METHOD_COL, "asc");
        s.addDefault(STATUS_COL, "asc");
        s.addDefault(CLIENT_COL, "asc");
        s.addDefault(REFERENCE_ID_COL, "asc");
        s.addDefault(CREATE_DATE_COL, "desc");
        s.addDefault(MODIFY_DATE_COL, "desc");
        s.addDefault(CONTEST_CATEGORY_NAME_COL, "asc");
        s.addDefault(COCKPIT_PROJECT_NAME_COL, "asc");
        s.addDefault(BILLING_ACCOUNT_NAME_COL, "asc");      
        s.addDefault(INVOICE_NUMBER_COL, "asc");        
        s.addDefault(PAID_DATE_COL, "asc");        
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
    }

}

