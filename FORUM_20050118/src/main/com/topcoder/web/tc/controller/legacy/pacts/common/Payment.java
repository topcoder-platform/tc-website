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

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import java.util.Map;

public class Payment implements PactsConstants, java.io.Serializable {
    private static Logger log = Logger.getLogger(Payment.class);

    public long _id;
    public int _typeId;
    public String _type;
    public String _description;
    public int _statusId;
    public String _statusDesc;
    public String _modifiedDate;
    public String _rationale;
    public int _rationaleId;
    public double _netAmount;
    public double _grossAmount;
    public String _printDate;
    public String _payDate;
    public String _dueDate;
    public String _lastName;
    public String _firstName;
    public String _middleName;
    public String _address1;
    public String _address2;
    public String _city;
    public String _country;
    public String _zip;
    public String _state;
    public String _countryCode;
    public String _stateCode;
    public PaymentHeader _header;

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
            _id = TCData.getTCLong(rRow, "payment_detail_id");
            _statusDesc = TCData.getTCString(rRow, "status_desc");
            _statusId = TCData.getTCInt(rRow, "status_id");
            _rationale = TCData.getTCString(rRow, "modification_rationale_desc");
            _rationaleId = TCData.getTCInt(rRow, "modification_rationale_id");
            _grossAmount = TCData.getTCDouble(rRow, "gross_amount");
            _netAmount = TCData.getTCDouble(rRow, "net_amount");
            _payDate = TCData.getTCDate(rRow, "date_paid");
            _printDate = TCData.getTCDate(rRow, "date_printed");
            _dueDate = TCData.getTCDate(rRow, "date_due");
            _type = TCData.getTCString(rRow, "payment_type_desc");
            _typeId = TCData.getTCInt(rRow, "payment_type_id");
            _description = TCData.getTCString(rRow, "payment_desc");
            _modifiedDate = TCData.getTCDate(rRow, "date_modified");
            if (row == 0)
                _header = new PaymentHeader(results, row);
            else
                _header = new PaymentHeader();


            if ((_statusId != PAID_STATUS) && (_statusId != PRINTED_STATUS)) {
                rsc = (ResultSetContainer) results.get(CURRENT_CODER_ADDRESS);
                if (rsc != null) rRow = rsc.getRow(0);
            }

            _lastName = TCData.getTCString(rRow, "last_name");
            _firstName = TCData.getTCString(rRow, "first_name");
            _middleName = TCData.getTCString(rRow, "middle_name");
            _address1 = TCData.getTCString(rRow, "address1");
            _address2 = TCData.getTCString(rRow, "address2");
            _city = TCData.getTCString(rRow, "city");
            _state = TCData.getTCString(rRow, "state_name");
            _country = TCData.getTCString(rRow, "country_name");
            _stateCode = TCData.getTCString(rRow, "state_code");
            _countryCode = TCData.getTCString(rRow, "country_code");
            _zip = TCData.getTCString(rRow, "zip");

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
        _header = new PaymentHeader();
        _id = 0;
        _rationale = "Default Rationale";
        _rationaleId = 0;
        _netAmount = 0;
        _grossAmount = 0;
        _printDate = "00/00/00";
        _payDate = "00/00/00";
        _lastName = "Last";
        _firstName = "First";
        _middleName = "Middle";
        _address1 = "Default Address 1";
        _address2 = "Default Address 2";
        _city = "Default City";
        _country = "Defult Country";
        _zip = "00000";
        _state = "Default State";
        _statusDesc = "default status desc";
        _statusId = 0;
        _stateCode = "0";
        _countryCode = "0";
        _dueDate = "00/00/00";
    }

    /* This contructs the payment as it will be sent to the addPayment
     *  and addAffidavit functions
     *
     *
     */
    public Payment(long user, String desc, int type,
                   double net_amount, double gross_amount, int status) {

        _header = new PaymentHeader();
        _netAmount = net_amount;
        _grossAmount = gross_amount;
        _statusId = status;
        _header._typeID = type;
        _header._user._id = user;
        _header._description = desc;
    }

    public boolean payReferrer() {
        return _typeId==CONTEST_PAYMENT;
    }

}
