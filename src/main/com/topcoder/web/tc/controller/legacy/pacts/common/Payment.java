/******************************************************************************\
 *
 * File:          Payment.java
 * Creation date: March 05, 2002 10:19
 * Author:        Matt Murphy
 * Purpose:       Store the details of a payment history
 * See:           PaymentHeader.java
 *                ResultSetContainer.java
 *
 * DBP 3/26 - Implement serializable, add rationale ID
 *
 * Copyright 2002, TopCoder, Inc
 * All rights are reserved. Reproduction in whole or part is prohibited
 * without the written consent of the copyright owner.
 *
 \******************************************************************************/

package com.topcoder.web.tc.controller.legacy.pacts.common;

import java.util.Date;
import java.util.Map;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.pacts.payments.BasePaymentStatus;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusFactory;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusReason;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusFactory.PaymentStatus;

/**
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 */
public class Payment implements PactsConstants, java.io.Serializable {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;

    private static Logger log = Logger.getLogger(Payment.class);

    private long id;
    private int typeId;
    private String type;
    private long methodId;
    private String method;
    private String description;
    //private long statusId;

    private BasePaymentStatus currentStatus;

    //private String statusDesc;
    private String modifiedDate;
    private String rationale;
    private int rationaleId;
    private double netAmount;
    private double grossAmount;
    private double totalAmount;
    private int installmentNumber;
    private String printDate;
    private String payDate;
    private String dueDate;
    private String lastName;
    private String firstName;
    private String middleName;
    private String address1;
    private String address2;
    private String city;
    private String country;
    private String zip;
    private String state;
    private String countryCode;
    private String stateCode;
    private PaymentHeader header;
    private String province;
    private String address3;
    private boolean charity;
    private String invoiceNumber;
    private String jiraIssueName;
    private String createUserHandle;

    // When the event took place. Is not stored in the db, but is needed in order to know if referrals must be paid
    private Date eventDate;

    private boolean hasGlobalAD;

    /**
     * this is used to set the payment when passed a result map
     * by a dipatch bean.  The dispatch bean would have gotten the
     * map as a result of a db query.  If an error occurs, the
     * values will fall back to defaults.
     *
     *
     * @param results the result map from the dipatch bean
     * @param row the row in the specific result set container for this
     *        object.
     */
    public Payment(Map results, int row) {
        ResultSetContainer rsc = (ResultSetContainer)
                results.get(PAYMENT_DETAIL_LIST);

        // check if it was there
        if (rsc == null) {
            log.error("The result map did not contain " + PAYMENT_DETAIL_LIST);
            setDefaults();
            return;
        }

        // make sure the row is valid
        if ((rsc.getRowCount() < 1) || (rsc.getRowCount() <= row)) {
            log.error("the result set container for " + PAYMENT_DETAIL_LIST + " had");
            log.error("no data in it for row " + row);
            setDefaults();
            return;
        }

        // now fill up the data structure
        ResultSetContainer.ResultSetRow rRow = rsc.getRow(row);

        try {
            id = TCData.getTCLong(rRow, "payment_detail_id");
//            statusDesc = TCData.getTCString(rRow, "status_desc");
            currentStatus = PaymentStatusFactory.createStatus(TCData.getTCLong(rRow, "payment_status_id"));
            rationale = TCData.getTCString(rRow, "modification_rationale_desc");
            rationaleId = TCData.getTCInt(rRow, "modification_rationale_id");
            grossAmount = TCData.getTCDouble(rRow, "gross_amount");
            netAmount = TCData.getTCDouble(rRow, "net_amount");
            totalAmount = TCData.getTCDouble(rRow, "total_amount");
            installmentNumber = TCData.getTCInt(rRow, "installment_number");
            payDate = TCData.getTCDate(rRow, "date_paid");
            printDate = TCData.getTCDate(rRow, "date_printed");
            dueDate = TCData.getTCDate(rRow, "date_due");
            type = TCData.getTCString(rRow, "payment_type_desc");
            typeId = TCData.getTCInt(rRow, "payment_type_id");
            method = TCData.getTCString(rRow, "payment_method_desc");
            methodId = TCData.getTCLong(rRow, "payment_method_id");
            description = TCData.getTCString(rRow, "payment_desc");
            modifiedDate = TCData.getTCDate(rRow, "modify_date");
            charity = TCData.getTCInt(rRow, "charity_ind") != 0;
            invoiceNumber = TCData.getTCString(rRow, "invoice_number");
            jiraIssueName = TCData.getTCString(rRow, "jira_issue_id");
            createUserHandle = TCData.getTCString(rRow, "create_user_handle");

            if (row == 0)
                header = new PaymentHeader(results, row);
            else {
                boolean initFromRow = true;
                ResultSetContainer rscHeaders = (ResultSetContainer) results.get(PAYMENT_HEADER_LIST);
                if (rscHeaders == null) {
                    initFromRow = false;
                }
                int numRows = rscHeaders.getRowCount();
                if (row < 0 || row >= numRows) {
                    initFromRow = false;
                }

                if (initFromRow) {
                    header = new PaymentHeader(results, row);
                } else {
                    header = new PaymentHeader();
                }
            }

            currentStatus.getReasons().clear();
            // check for status reasons
            Long paymentStatusReason = TCData.getTCLong(rRow, "payment_status_reason_id");
            if (paymentStatusReason != 0) {
                log.debug("add reason 1 total: " + rsc.getRowCount());
                currentStatus.getReasons().add(PaymentStatusReason.getStatusReasonUsingId(paymentStatusReason));

                for (int i = 1; rsc.getRowCount() > i; i++) {
                    rRow = rsc.getRow(i);
                    paymentStatusReason = TCData.getTCLong(rRow, "payment_status_reason_id");
                    if (paymentStatusReason != 0) {
                        log.debug("add reason "+ i+1);
                        currentStatus.getReasons().add(PaymentStatusReason.getStatusReasonUsingId(paymentStatusReason));
                    }
                }
            }


            if (!currentStatus.equals(PaymentStatusFactory.createStatus(PaymentStatus.PAID_PAYMENT_STATUS))) {
                rsc = (ResultSetContainer) results.get(CURRENT_CODER_ADDRESS);
                if (rsc != null) rRow = rsc.getRow(0);
            }

            lastName = TCData.getTCString(rRow, "last_name");
            firstName = TCData.getTCString(rRow, "first_name");
            middleName = TCData.getTCString(rRow, "middle_name");
            address1 = TCData.getTCString(rRow, "address1");
            address2 = TCData.getTCString(rRow, "address2");
            address3 = TCData.getTCString(rRow, "address3");
            city = TCData.getTCString(rRow, "city");
            state = TCData.getTCString(rRow, "state_name");
            country = TCData.getTCString(rRow, "country_name");
            stateCode = TCData.getTCString(rRow, "state_code");
            countryCode = TCData.getTCString(rRow, "country_code");
            zip = TCData.getTCString(rRow, "zip");
            province = TCData.getTCString(rRow, "province");

        } catch (Exception e) {
            log.error("there was an exception in the Payment contructor");
            setDefaults();
            e.printStackTrace();
        }
    }

    /**
     * Constructs a payment from a result map, assums the data is at
     * row 0
     *
     * @param results the result map from the dipatch bean
     */
    public Payment(Map results) {
        this(results, 0);
    }


    /**
     * Default constructor.   builds payment with all values set to defaults
     *
     */
    public Payment() {
        setDefaults();
    }

    /**
     * the method that set all values to defaults
     */
    private void setDefaults() {
        header = new PaymentHeader();
        id = 0;
        rationale = "Default Rationale";
        rationaleId = 0;
        netAmount = 0;
        grossAmount = 0;
        totalAmount = 0;
        installmentNumber = 1;
        printDate = "00/00/00";
        payDate = "00/00/00";
        modifiedDate = "00/00/00";
        lastName = "Last";
        firstName = "First";
        middleName = "Middle";
        address1 = "Default Address 1";
        address2 = "Default Address 2";
        city = "Default City";
        country = "Defult Country";
        zip = "00000";
        state = "Default State";
//        statusDesc = "default status desc";
//        statusId = 0;
        stateCode = "0";
        countryCode = "0";
        dueDate = "00/00/00";
        address3 = "Default Address 3";
        province = "Default Province";
        charity = false;
    }


    /* This contructs the payment as it will be sent to the addPayment
     *  and addAffidavit functions
     *
     *
     */
    public Payment(long user, String desc, int type, long method,
                   double net_amount, double gross_amount, BasePaymentStatus status) {

        header = new PaymentHeader();
        netAmount = net_amount;
        grossAmount = gross_amount;
        totalAmount = gross_amount;
        currentStatus = status;
        header.setTypeId(type);
        header.setMethodId(method);
        header.getUser().setId(user);
        header.setDescription(desc);
    }

    public boolean payReferrer() {
        for (int i = 0; i < PAY_REFFERAL_TYPES.length; i++) {
            if (header.getTypeId() == PAY_REFFERAL_TYPES[i]) {
                return true;
            }
        }
        return false;
    }


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public long getMethodId() {
        return methodId;
    }

    public void setMethodId(long methodId) {
        this.methodId = methodId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

//    public long getStatusId() {
//        return statusId;
//    }
//
//    public void setStatusId(long statusId) {
//        this.statusId = statusId;
//    }

    public BasePaymentStatus getCurrentStatus() {
        return currentStatus;
    }

    public void setCurrentStatus(BasePaymentStatus status) {
        log.debug("Payment: Setting current status: #reasons: " + ((status == null ? "null" : status.getReasons().size())));
        this.currentStatus = status;
    }

//    public String getStatusDesc() {
//        return statusDesc;
//    }
//
//    public void setStatusDesc(String statusDesc) {
//        this.statusDesc = statusDesc;
//    }

    public String getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(String modifiedDate) {
        this.modifiedDate = modifiedDate;
    }

    public String getRationale() {
        return rationale;
    }

    public void setRationale(String rationale) {
        this.rationale = rationale;
    }

    public int getRationaleId() {
        return rationaleId;
    }

    public void setRationaleId(int rationaleId) {
        this.rationaleId = rationaleId;
    }

    public double getNetAmount() {
        return netAmount;
    }

    public void setNetAmount(double netAmount) {
        this.netAmount = netAmount;
    }

    public double getGrossAmount() {
        return grossAmount;
    }

    public void setGrossAmount(double grossAmount) {
        this.grossAmount = grossAmount;
    }

    public String getPrintDate() {
        return printDate;
    }

    public void setPrintDate(String printDate) {
        this.printDate = printDate;
    }

    public String getPayDate() {
        return payDate;
    }

    public void setPayDate(String payDate) {
        this.payDate = payDate;
    }

    public String getDueDate() {
        return dueDate;
    }

    public void setDueDate(String dueDate) {
        this.dueDate = dueDate;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }

    public String getStateCode() {
        return stateCode;
    }

    public void setStateCode(String stateCode) {
        this.stateCode = stateCode;
    }

    public PaymentHeader getHeader() {
        return header;
    }

    public void setHeader(PaymentHeader header) {
        this.header = header;
    }

    public static Logger getLog() {
        return log;
    }

    public static void setLog(Logger log) {
        Payment.log = log;
    }

    public Date getEventDate() {
        return eventDate;
    }

    public void setEventDate(Date eventDate) {
        this.eventDate = eventDate;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getAddress3() {
        return address3;
    }

    public void setAddress3(String address3) {
        this.address3 = address3;
    }

    public boolean isCharity() {
        return charity;
    }

    public void setCharity(boolean charity) {
        this.charity = charity;
    }

    public String getInvoiceNumber() {
        return invoiceNumber;
    }

    public void setInvoiceNumber(String invoiceNumber) {
        this.invoiceNumber = invoiceNumber;
    }

    public int getInstallmentNumber() {
        return installmentNumber;
    }

    public void setInstallmentNumber(int installmentNumber) {
        this.installmentNumber = installmentNumber;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public boolean getHasGlobalAD() {
        return hasGlobalAD;
    }

    public void setHasGlobalAD(boolean hasGlobalAD) {
        this.hasGlobalAD = hasGlobalAD;
    }

    public String getJiraIssueName() {
        return jiraIssueName;
    }

    public void setJiraIssueName(String jiraIssueName) {
        this.jiraIssueName = jiraIssueName;
    }

    public String getCreateUserHandle() {
        return createUserHandle;
    }

    public void setCreateUserHandle(String createUserHandle) {
        this.createUserHandle = createUserHandle;
    }
}
