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

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;

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
    protected TaxFormHeader header;
    protected String description;
    protected float withholdingPercentage;
    protected double withholdingAmount;
    protected double defaultWithholdingAmount;
    protected float defaultWithholdingPercentage;
    protected String genericFormStatus;
    protected int genericFormStatusID;
    protected boolean usePercentage;
    protected boolean defaultUsePercentage;

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
        header = new TaxFormHeader();
        description = "Default Description";
        withholdingPercentage = 0;
        withholdingAmount = 0;
        defaultWithholdingAmount = 0;
        defaultWithholdingPercentage = 0;
        genericFormStatus = "default status";
        genericFormStatusID = 0;
        usePercentage = false;
        defaultUsePercentage = false;
    }


/*  Constructs the TaxForm that will be passed down to the
*   addTaxForm method of the DataInterfaceBean
*
*
*/
    public TaxForm(String name, String desc, float percentage,
                   double amount, int status, boolean usePercentage) {

        header = new TaxFormHeader();
        header.setName(name);
        genericFormStatusID = status;
        description = desc;
        defaultWithholdingAmount = amount;
        defaultWithholdingPercentage = percentage;
        defaultUsePercentage = usePercentage;
    }

/*  Constructs the TaxForm that will be passed down to the
*   addUserTaxForm method of the DataInterfaceBean
*
*
*/
    public TaxForm(long user, long id, String dateFiled, int status) {

        header = new TaxFormHeader();
        header.getUser().setId(user);
        header.setStatusId(status);
        header.setId(id);
        withholdingAmount = 0;
        withholdingPercentage = 0;
        header.setDateFiled(dateFiled);
    }

/*  Constructs the TaxForm that will be passed down to the
*   updateTaxForm method of the DataInterfaceBean
*
*
*/
    public TaxForm(String name, String desc, float percentage,
                   double amount, int status, long tax_form_id, boolean usePercentage) {

        header = new TaxFormHeader();
        header.setName(name);
        genericFormStatusID = status;
        description = desc;
        defaultWithholdingAmount = amount;
        defaultWithholdingPercentage = percentage;
        header.setId(tax_form_id);
        defaultUsePercentage = usePercentage;
    }

/*  Constructs the TaxForm that will be passed down to the
*   updateUserTaxForm method of the DataInterfaceBean
*
*
*/
    public TaxForm(long user, long id, float percentage,
                   double amount, int status, String date_filed, boolean usePercentage) {

        header = new TaxFormHeader();
        header.getUser().setId(user);
        header.setStatusId(status);
        header.setId(id);
        withholdingAmount = amount;
        withholdingPercentage = percentage;
        this.usePercentage = usePercentage;
        header.setDateFiled(date_filed);
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
                header = new TaxFormHeader();
                description = "Default Description";
                withholdingPercentage = 0;
                withholdingAmount = 0;
                defaultWithholdingAmount = 0;
                defaultWithholdingPercentage = 0;
                genericFormStatus = "default status";
                genericFormStatusID = 0;
                usePercentage = false;
                defaultUsePercentage = false;
                return;
            }
            int rowCount = rsc.getRowCount();
            if (rowCount < 1) {
                log.error("result set " + TAX_FORM_LIST + " was empty!");
                header = new TaxFormHeader();
                description = "Default Description";
                withholdingPercentage = 0;
                withholdingAmount = 0;
                defaultWithholdingAmount = 0;
                defaultWithholdingPercentage = 0;
                genericFormStatus = "default status";
                genericFormStatusID = 0;
                usePercentage = false;
                defaultUsePercentage = false;
                return;
            }
            ResultSetContainer.ResultSetRow rsr = rsc.getRow(0);
            header = new TaxFormHeader();
            header.setName(TCData.getTCString(rsr, "name", "default tax form", true));
            header.setId(TCData.getTCLong(rsr, "tax_form_id", 0, true));
            description = TCData.getTCString(rsr, "tax_form_desc", "default tax form desc", true);
            defaultWithholdingAmount = TCData.getTCDouble(rsr, "default_withholding_amount", 0, true);
            defaultWithholdingPercentage = TCData.getTCFloat(rsr, "default_withholding_percentage", 0, true);
            genericFormStatus = TCData.getTCString(rsr, "status_desc", "default status", true);
            genericFormStatusID = TCData.getTCInt(rsr, "status_id", 0, true);
            defaultUsePercentage = (TCData.getTCInt(rsr, "default_use_percentage", 0, true) == 1);
            return;
        }

        int rowCount = rsc.getRowCount();
        if (rowCount < 1) {
            log.error("result set container " + USER_TAX_FORM_DETAIL + " was empty!");
            header = new TaxFormHeader();
            description = "Default Description";
            withholdingPercentage = 0;
            withholdingAmount = 0;
            defaultWithholdingAmount = 0;
            defaultWithholdingPercentage = 0;
            genericFormStatus = "default status";
            genericFormStatusID = 0;
            usePercentage = false;
            defaultUsePercentage = false;
            return;
        }

        ResultSetContainer.ResultSetRow rsr = rsc.getRow(0);

        header = new TaxFormHeader(results);
        description = TCData.getTCString(rsr, "tax_form_desc", "default tax form", true);
        withholdingPercentage = TCData.getTCFloat(rsr, "withholding_percentage", 0, true);
        withholdingAmount = TCData.getTCDouble(rsr, "withholding_amount", 0, true);
        defaultWithholdingAmount = TCData.getTCDouble(rsr, "default_withholding_amount", 0, true);
        defaultWithholdingPercentage = TCData.getTCFloat(rsr, "default_withholding_percentage", 0, true);
        genericFormStatus = TCData.getTCString(rsr, "status_desc", "default status", true);
        genericFormStatusID = TCData.getTCInt(rsr, "status_id", 0, true);
        usePercentage = (TCData.getTCInt(rsr, "use_percentage", 0, true) == 1);
        defaultUsePercentage = (TCData.getTCInt(rsr, "default_use_percentage", 0, true) == 1);
    }


    public TaxFormHeader getHeader() {
        return header;
    }

    public void setHeader(TaxFormHeader header) {
        this.header = header;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getWithholdingPercentage() {
        return withholdingPercentage;
    }

    public void setWithholdingPercentage(float withholdingPercentage) {
        this.withholdingPercentage = withholdingPercentage;
    }

    public double getWithholdingAmount() {
        return withholdingAmount;
    }

    public void setWithholdingAmount(double withholdingAmount) {
        this.withholdingAmount = withholdingAmount;
    }

    public double getDefaultWithholdingAmount() {
        return defaultWithholdingAmount;
    }

    public void setDefaultWithholdingAmount(double defaultWithholdingAmount) {
        this.defaultWithholdingAmount = defaultWithholdingAmount;
    }

    public float getDefaultWithholdingPercentage() {
        return defaultWithholdingPercentage;
    }

    public void setDefaultWithholdingPercentage(float defaultWithholdingPercentage) {
        this.defaultWithholdingPercentage = defaultWithholdingPercentage;
    }

    public String getGenericFormStatus() {
        return genericFormStatus;
    }

    public void setGenericFormStatus(String genericFormStatus) {
        this.genericFormStatus = genericFormStatus;
    }

    public int getGenericFormStatusID() {
        return genericFormStatusID;
    }

    public void setGenericFormStatusID(int genericFormStatusID) {
        this.genericFormStatusID = genericFormStatusID;
    }

    public boolean isUsePercentage() {
        return usePercentage;
    }

    public void setUsePercentage(boolean usePercentage) {
        this.usePercentage = usePercentage;
    }

    public boolean isDefaultUsePercentage() {
        return defaultUsePercentage;
    }

    public void setDefaultUsePercentage(boolean defaultUsePercentage) {
        this.defaultUsePercentage = defaultUsePercentage;
    }


}
