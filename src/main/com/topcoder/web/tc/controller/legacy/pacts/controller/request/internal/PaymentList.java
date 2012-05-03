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
import java.util.Calendar;
import java.util.Date;
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
    public static final String RELIABILITY = "reliability";
    public static final String GROUP_RELIABILITY = "gr";
    public static final String TOGGLE_GROUP_RELIABILITY = "tgr";
    public static final String TRAVELEX_XML_FORMAT = "travxml";
    public static final String TRAVELEX_XML_LINK = "travxml_link";
    public static final String CSV_FORMAT = "csv";
    public static final String CSV_LINK = "csv_link";
    public static final String PAYONEER_XML_FORMAT = "payoneer_xml";
    public static final String PAYONEER_XML_LINK = "payoneer_xml_link";

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

    private static final double WIRE_FEE = 10.0;
    
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
                } else if ("true".equals(getRequest().getParameter(CSV_FORMAT))) {
                    produceCSV();
                } else if ("true".equals(getRequest().getParameter(PAYONEER_XML_FORMAT))) {
                    producePayoneerXML();
                } else {                   
                    String toggle = requestQuery.replaceAll(GROUP_RELIABILITY + "=" + groupRel, "") + "&" + GROUP_RELIABILITY + "=" + !groupRel;
                    getRequest().setAttribute(TOGGLE_GROUP_RELIABILITY, toggle);

                    String ungroup = requestQuery.replaceAll(GROUP_RELIABILITY + "=" + groupRel, "") + "&" + GROUP_RELIABILITY + "=false";
                    String csv_link = ungroup + "&" + CSV_FORMAT + "=true";
                    String travxml_link = ungroup + "&" + TRAVELEX_XML_FORMAT + "=true";
                    String payoneer_xml_link = ungroup + "&" + PAYONEER_XML_FORMAT + "=true";
                    getRequest().setAttribute(CSV_LINK, csv_link);
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
            if (!payment.getMethod().equals("Wire") && !payment.getMethod().equals("ACH")) {
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
                boolean applyWireFee = false;
                for(PaymentHeader payment : userPayments) {
                    totalUserAmount += payment.getRecentNetAmount();
                    applyWireFee = applyWireFee || payment.getMethod().equals("Wire");
                }
                if (applyWireFee) {
                    totalUserAmount -= WIRE_FEE;
                }

                Element paymentElement = doc.createElement("Payment");
                paymentElement.setAttribute("PaymentID", "" + userPayments.get(0).getId());
                paymentElement.setAttribute("PaymentReference", "TopCoder Member Payments");

                Element payFromElement = doc.createElement("PayFrom");
                payFromElement.setAttribute("PFPayerName", "TopCoder, Inc.");
                paymentElement.appendChild(payFromElement);

                Element payToElement = doc.createElement("PayTo");
                payToElement.setAttribute("PTPayeeID", user.getHandle());
                payToElement.setAttribute("PTPayeeName", user.getHandle());
                payToElement.setAttribute("PTAmount", "" + totalUserAmount);
                paymentElement.appendChild(payToElement);

                Element remittanceElement = doc.createElement("Remittance");
                remittanceElement.setAttribute("Type", "XML");
                paymentElement.appendChild(remittanceElement);

                for(PaymentHeader payment : userPayments) {
                    Element remittanceRecordElement = doc.createElement("RemittanceRecord");

                    remittanceRecordElement.setAttribute("PayerDocumentDate", new SimpleDateFormat("MM/dd/yyyy").format(date.getTime()));
                    remittanceRecordElement.setAttribute("PayerDocumentType", "PO");
                    remittanceRecordElement.setAttribute("PayerDocumentNumber", "" + payment.getReferenceId());
                    remittanceRecordElement.setAttribute("AmountPaid", "" + payment.getRecentNetAmount());
                    remittanceRecordElement.setAttribute("Notes", payment.getDescription());

                    remittanceElement.appendChild(remittanceRecordElement);
                }

                if (applyWireFee) {
                    Element remittanceRecordElement = doc.createElement("RemittanceRecord");

                    remittanceRecordElement.setAttribute("PayerDocumentDate", new SimpleDateFormat("MM/dd/yyyy").format(date.getTime()));
                    remittanceRecordElement.setAttribute("Notes", "Adjustment for Wire Fee");
                    remittanceRecordElement.setAttribute("AmountPaid", "0.0");
                    remittanceRecordElement.setAttribute("AdjustmentAmount", "-"+WIRE_FEE);
                    remittanceRecordElement.setAttribute("AdjustmentReason", "Processing Fee");

                    remittanceElement.appendChild(remittanceRecordElement);
                }
                
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

    private void produceCSV() throws IOException {
        getResponse().addHeader("content-disposition", "attachment; filename=\"payment_list.csv\"");
        getResponse().setContentType("application/csv");
        PrintWriter writer = getResponse().getWriter();

        writer.print("Payment ID,Name,User,Description,Gross,Tax,Net,Type,Status,Client,Project,Billing Acct,Reference ID,Contest Category,Invoice Number,Created,Modified");
        writer.print("\n");
        
        List<PaymentHeader> payments = (List<PaymentHeader>) getRequest().getAttribute(PaymentList.PAYMENTS);

        for (PaymentHeader payment : payments) {
            String description = payment.getDescription();

            String status = payment.getCurrentStatus().getDesc();
            for (PaymentStatusReason reason : payment.getCurrentStatus().getReasons()) {
                status += "\n- " + reason.getDesc();
            }

            StringBuilder row = new StringBuilder();
            addCSVValue(row, payment.getId());
            addCSVValue(row, payment.getUser().getFullName());
            addCSVValue(row, payment.getUser().getHandle());
            addCSVValue(row, description);
            addCSVValue(row, payment.getRecentGrossAmount());
            addCSVValue(row, payment.getRecentGrossAmount()-payment.getRecentNetAmount());
            addCSVValue(row, payment.getRecentNetAmount());
            addCSVValue(row, payment.getType());
            addCSVValue(row, status);
            addCSVValue(row, payment.getClient());
            addCSVValue(row, payment.getCockpitProjectName());
            addCSVValue(row, payment.getBillingAccountName());
            addCSVValue(row, payment.getReferenceId());
            addCSVValue(row, payment.getContestCategoryName());
            addCSVValue(row, payment.getInvoiceNumber());
            addCSVValue(row, payment.getCreateDate());
            addCSVValue(row, payment.getModifyDate());

            row.deleteCharAt(row.length()-1);
            writer.print(row.toString()+"\n");
        }

        getResponse().setStatus(HttpServletResponse.SC_OK);
        writer.flush();
    }

    public void producePayoneerXML() throws TCWebException, IOException {
        getResponse().addHeader("content-disposition", "attachment; filename=\"payments.xml\"");
        getResponse().setContentType("text/xml");

        try {
            DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
 
            // root elements
            Document doc = docBuilder.newDocument();

            Element payoneerInElement = doc.createElement("PayoneerIn");
            doc.appendChild(payoneerInElement);
 
            Element payoutPaymentsElement = doc.createElement("PayoutPayments");
            payoneerInElement.appendChild(payoutPaymentsElement);
 
            double totalAmount = 0.0;
            List<PaymentHeader> allPayments = (List<PaymentHeader>) getRequest().getAttribute(PaymentList.PAYMENTS);
            
            for (PaymentHeader payment : allPayments) {    
                UserProfileHeader user = payment.getUser();            
                totalAmount += payment.getRecentNetAmount();

                Element payoutPaymentElement = doc.createElement("PayoutPayment");
                payoutPaymentsElement.appendChild(payoutPaymentElement);
                
                Element paymentDateElement = doc.createElement("PaymentDate");
                paymentDateElement.appendChild(doc.createTextNode(""+payment.getCreateDate()));

                Element payeeIDElement = doc.createElement("PayeeID");
                payeeIDElement.appendChild(doc.createTextNode(""+payment.getUser().getId()));

                Element intPaymentIDElement = doc.createElement("IntPaymentID");
                intPaymentIDElement.appendChild(doc.createTextNode(""+payment.getId()));

                Element amountElement = doc.createElement("Amount");
                amountElement.appendChild(doc.createTextNode(""+payment.getRecentNetAmount()));
                
                Element currencyElement = doc.createElement("Currency");
                currencyElement.appendChild(doc.createTextNode("USD"));

                Element descriptionElement = doc.createElement("Description");
                descriptionElement.appendChild(doc.createTextNode(payment.getDescription()));
                
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
            amountElement.appendChild(doc.createTextNode(""+totalAmount));
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

    void addCSVValue(StringBuilder row, Object value) {
      if (value != null) {
          String item = value.toString();
          if (item.contains(",") || item.contains("\n") || item.contains("\"")) {
              row.append("\"" + item.replaceAll("\"","\"\"") + "\"");
          } else {
              row.append(item);
          }
      }

      row.append(",");
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

