/******************************************************************************\
 *
 * File:          TaxForm.java
 * Creation date: March 05, 2002 10:19
 * Author:        Matt Murphy
 * Purpose:       Store information of a given tax form
 * See:           ResultSetContainer.java
 *                TaxFormHeader.java
 *
 * DBP 3/26 - Implement serializable, change generic form status id to int
 * DBP 4/3 - Add _defaultUsePercentage and _usePercentage
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

public class TaxForm implements PactsConstants, java.io.Serializable {
    private static Logger log = Logger.getLogger(TaxForm.class);

/*  Explanation of Members
*
*  _header                - more commonly requested information for this tax form
*  _description           - description of the tax form
*  _withholdingPercentage - percentage to hold from each payment
*  _withholdingAmount     - aggregate amount withheld
*/
    public TaxFormHeader _header;
    public String _description;
    public float _withholdingPercentage;
    public double _withholdingAmount;
    public double _defaultWithholdingAmount;
    public float _defaultWithholdingPercentage;
    public String _genericFormStatus;
    public int _genericFormStatusID;
    public boolean _usePercentage;
    public boolean _defaultUsePercentage;

    /**************\
     *              *
     * Constructors *
     *              *
     \**************/

/* Basic constructor that sets all the default values and such
*
*  @ARGS none
*/
    public TaxForm() {
        _header = new TaxFormHeader();
        _description = "Default Description";
        _withholdingPercentage = 0;
        _withholdingAmount = 0;
        _defaultWithholdingAmount = 0;
        _defaultWithholdingPercentage = 0;
        _genericFormStatus = "default status";
        _genericFormStatusID = 0;
        _usePercentage = false;
        _defaultUsePercentage = false;
    }


/*  Constructs the TaxForm that will be passed down to the
*   addTaxForm method of the DataInterfaceBean
*
*
*/
    public TaxForm(String name, String desc, float percentage,
                   double amount, int status, boolean usePercentage) {

        _header = new TaxFormHeader();
        _header._name = name;
        _genericFormStatusID = status;
        _description = desc;
        _defaultWithholdingAmount = amount;
        _defaultWithholdingPercentage = percentage;
        _defaultUsePercentage = usePercentage;
    }

/*  Constructs the TaxForm that will be passed down to the
*   addUserTaxForm method of the DataInterfaceBean
*
*
*/
    public TaxForm(long user, long id, String dateFiled, int status) {

        _header = new TaxFormHeader();
        _header._user._id = user;
        _header._statusID = status;
        _header._id = id;
        _withholdingAmount = 0;
        _withholdingPercentage = 0;
        _header._dateFiled = dateFiled;
    }

/*  Constructs the TaxForm that will be passed down to the
*   updateTaxForm method of the DataInterfaceBean
*
*
*/
    public TaxForm(String name, String desc, float percentage,
                   double amount, int status, long tax_form_id, boolean usePercentage) {

        _header = new TaxFormHeader();
        _header._name = name;
        _genericFormStatusID = status;
        _description = desc;
        _defaultWithholdingAmount = amount;
        _defaultWithholdingPercentage = percentage;
        _header._id = tax_form_id;
        _defaultUsePercentage = usePercentage;
    }

/*  Constructs the TaxForm that will be passed down to the
*   updateUserTaxForm method of the DataInterfaceBean
*
*
*/
    public TaxForm(long user, long id, float percentage,
                   double amount, int status, String date_filed, boolean usePercentage) {

        _header = new TaxFormHeader();
        _header._user._id = user;
        _header._statusID = status;
        _header._id = id;
        _withholdingAmount = amount;
        _withholdingPercentage = percentage;
        _usePercentage = usePercentage;
        _header._dateFiled = date_filed;
    }


/* This constructor makes the object out of the expected
*  ResultSetContainter USER_TAX_FORM in the Map
*
*/
    public TaxForm(Map results) {
        ResultSetContainer rsc = (ResultSetContainer) results.get(USER_TAX_FORM_DETAIL);
        if (rsc == null) {
            rsc = (ResultSetContainer) results.get(TAX_FORM_LIST);
            if (rsc == null) {
                log.error("There was no " + USER_TAX_FORM_DETAIL + " or " + TAX_FORM_LIST + " result set.");
                _header = new TaxFormHeader();
                _description = "Default Description";
                _withholdingPercentage = 0;
                _withholdingAmount = 0;
                _defaultWithholdingAmount = 0;
                _defaultWithholdingPercentage = 0;
                _genericFormStatus = "default status";
                _genericFormStatusID = 0;
                _usePercentage = false;
                _defaultUsePercentage = false;
                return;
            }
            int rowCount = rsc.getRowCount();
            if (rowCount < 1) {
                log.error("result set " + TAX_FORM_LIST + " was empty!");
                _header = new TaxFormHeader();
                _description = "Default Description";
                _withholdingPercentage = 0;
                _withholdingAmount = 0;
                _defaultWithholdingAmount = 0;
                _defaultWithholdingPercentage = 0;
                _genericFormStatus = "default status";
                _genericFormStatusID = 0;
                _usePercentage = false;
                _defaultUsePercentage = false;
                return;
            }
            ResultSetContainer.ResultSetRow rsr = rsc.getRow(0);
            _header = new TaxFormHeader();
            _header._name = TCData.getTCString(rsr, "name", "default tax form", true);
            _header._id = TCData.getTCLong(rsr, "tax_form_id", 0, true);
            _description = TCData.getTCString(rsr, "tax_form_desc", "default tax form desc", true);
            _defaultWithholdingAmount = TCData.getTCDouble(rsr, "default_withholding_amount", 0, true);
            _defaultWithholdingPercentage = TCData.getTCFloat(rsr, "default_withholding_percentage", 0, true);
            _genericFormStatus = TCData.getTCString(rsr, "status_desc", "default status", true);
            _genericFormStatusID = TCData.getTCInt(rsr, "status_id", 0, true);
            _defaultUsePercentage = (TCData.getTCInt(rsr, "default_use_percentage", 0, true) == 1);
            return;
        }

        int rowCount = rsc.getRowCount();
        if (rowCount < 1) {
            log.error("result set container " + USER_TAX_FORM_DETAIL + " was empty!");
            _header = new TaxFormHeader();
            _description = "Default Description";
            _withholdingPercentage = 0;
            _withholdingAmount = 0;
            _defaultWithholdingAmount = 0;
            _defaultWithholdingPercentage = 0;
            _genericFormStatus = "default status";
            _genericFormStatusID = 0;
            _usePercentage = false;
            _defaultUsePercentage = false;
            return;
        }

        ResultSetContainer.ResultSetRow rsr = rsc.getRow(0);

        _header = new TaxFormHeader(results);
        _description = TCData.getTCString(rsr, "tax_form_desc", "default tax form", true);
        _withholdingPercentage = TCData.getTCFloat(rsr, "withholding_percentage", 0, true);
        _withholdingAmount = TCData.getTCDouble(rsr, "withholding_amount", 0, true);
        _defaultWithholdingAmount = TCData.getTCDouble(rsr, "default_withholding_amount", 0, true);
        _defaultWithholdingPercentage = TCData.getTCFloat(rsr, "default_withholding_percentage", 0, true);
        _genericFormStatus = TCData.getTCString(rsr, "status_desc", "default status", true);
        _genericFormStatusID = TCData.getTCInt(rsr, "status_id", 0, true);
        _usePercentage = (TCData.getTCInt(rsr, "use_percentage", 0, true) == 1);
        _defaultUsePercentage = (TCData.getTCInt(rsr, "default_use_percentage", 0, true) == 1);
    }
}
