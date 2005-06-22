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

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;

import java.util.Map;

public class Payment implements PactsConstants, java.io.Serializable {
    private static Logger log = Logger.getLogger(Payment.class);

    private long id;
    private int typeId;
    private String type;
    private String description;
    private int statusId;
    private String statusDesc;
    private String modifiedDate;
    private String rationale;
    private int rationaleId;
    private double netAmount;
    private double grossAmount;
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
            statusDesc = TCData.getTCString(rRow, "status_desc");
            statusId = TCData.getTCInt(rRow, "status_id");
            rationale = TCData.getTCString(rRow, "modification_rationale_desc");
            rationaleId = TCData.getTCInt(rRow, "modification_rationale_id");
            grossAmount = TCData.getTCDouble(rRow, "gross_amount");
            netAmount = TCData.getTCDouble(rRow, "net_amount");
            payDate = TCData.getTCDate(rRow, "date_paid");
            printDate = TCData.getTCDate(rRow, "date_printed");
            dueDate = TCData.getTCDate(rRow, "date_due");
            type = TCData.getTCString(rRow, "payment_type_desc");
            typeId = TCData.getTCInt(rRow, "payment_type_id");
            description = TCData.getTCString(rRow, "payment_desc");
            modifiedDate = TCData.getTCDate(rRow, "date_modified");
            if (row == 0)
                header = new PaymentHeader(results, row);
            else
                header = new PaymentHeader();


            if ((statusId != PAID_STATUS) && (statusId != PRINTED_STATUS)) {
                rsc = (ResultSetContainer) results.get(CURRENT_CODER_ADDRESS);
                if (rsc != null) rRow = rsc.getRow(0);
            }

            lastName = TCData.getTCString(rRow, "last_name");
            firstName = TCData.getTCString(rRow, "first_name");
            middleName = TCData.getTCString(rRow, "middle_name");
            address1 = TCData.getTCString(rRow, "address1");
            address2 = TCData.getTCString(rRow, "address2");
            city = TCData.getTCString(rRow, "city");
            state = TCData.getTCString(rRow, "state_name");
            country = TCData.getTCString(rRow, "country_name");
            stateCode = TCData.getTCString(rRow, "state_code");
            countryCode = TCData.getTCString(rRow, "country_code");
            zip = TCData.getTCString(rRow, "zip");

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
        printDate = "00/00/00";
        payDate = "00/00/00";
        lastName = "Last";
        firstName = "First";
        middleName = "Middle";
        address1 = "Default Address 1";
        address2 = "Default Address 2";
        city = "Default City";
        country = "Defult Country";
        zip = "00000";
        state = "Default State";
        statusDesc = "default status desc";
        statusId = 0;
        stateCode = "0";
        countryCode = "0";
        dueDate = "00/00/00";
    }

    /* This contructs the payment as it will be sent to the addPayment
     *  and addAffidavit functions
     *
     *
     */
    public Payment(long user, String desc, int type,
                   double net_amount, double gross_amount, int status) {

        header = new PaymentHeader();
        netAmount = net_amount;
        grossAmount = gross_amount;
        statusId = status;
        header.setTypeId(type);
        header.getUser().setId(user);
        header.setDescription(desc);
    }

    public boolean payReferrer() {
        return typeId == CONTEST_PAYMENT;
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public String getStatusDesc() {
        return statusDesc;
    }

    public void setStatusDesc(String statusDesc) {
        this.statusDesc = statusDesc;
    }

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


}
