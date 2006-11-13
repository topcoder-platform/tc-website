/******************************************************************************\
 *
 * File:          Contract.java
 * Creation date: March 05, 2002 10:19
 * Author:        Matt Murphy
 * Purpose:       Store information about a given contract
 * See:           ContractHeader.java
 *                PaymentHeader.java
 *                ResultSetContainer.java
 *
 * Modifications: @INSERT_MODIFICATIONS(* )
 * March 05, 2002 10:19 Matt Murphy
 *     Added member '_payments'
 *     Added member '_header'
 *     Added member '_description'
 *     Added member '_endDate'
 *     Added member '_startDate'
 *
 * STK 3/19/02
 * Added the constructor that takes a result set map
 *
 * DBP 3/20 - Change path to ResultSetContainer - now in com.topcoder.web.common
 * DBP 3/26 - Implement serializable
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

public class Contract implements PactsConstants, java.io.Serializable {
    private static Logger log = Logger.getLogger(Contract.class);

    private PaymentHeader payments[];
    private ContractHeader header;
    private String description;
    private String startDate;
    private String endDate;


    /**
     * this constructor takes in a result set map, and
     * will fill in the data structure appropriately.  If there is an
     * error, default values will be used.  There should only be
     * one contract and one contract header in this result set.  There
     * can be multiple payments.
     *
     * @param results the result set map from the db query
     */
    public Contract(Map results) {
        ResultSetContainer rsc = (ResultSetContainer) results.get(CONTRACT_DETAIL);

        // check if it was there
        if (rsc == null) {
            log.error("The result map did not contain " + CONTRACT_DETAIL);
            setDefaults();
            return;
        }

        // make sure the row is valid
        if (rsc.getRowCount() < 0) {
            log.error("the result set container for " + CONTRACT_DETAIL + "had");
            log.error("no datat in it");
            setDefaults();
            return;
        }

        if (rsc.getRowCount() != 1) {
            log.error("There should only be one contract");
        }

        // now fill up the data structure
        ResultSetContainer.ResultSetRow rRow = rsc.getRow(0);

        try {
            description = TCData.getTCString(rRow, "contract_desc");
            startDate = TCData.getTCDate(rRow, "start_date");
            endDate = TCData.getTCDate(rRow, "end_date");
            header = new ContractHeader(results);
            payments = (new PaymentHeaderList(results)).getHeaderList();
        } catch (Exception e) {
            log.error("there was an exception in the Contract contructor");
            setDefaults();
            e.printStackTrace();
        }
    }

    /**
     * constructor, sets all data to default values
     */
    public Contract() {
        setDefaults();
    }

    /**
     * used to set data to default values
     */
    private void setDefaults() {
        payments = new PaymentHeader[0];
        description = "Default Description";
        header = new ContractHeader();
        startDate = "00/00/00";
        endDate = "00/00/00";
    }

    /*  This constructs the Contract that will be added via the
     *   addContract method in the DataInterfaceBean
     *
     *
     */
    public Contract(String name, long user, String start, String end,
                    String desc, int status, int type) {

        header = new ContractHeader();
        payments = new PaymentHeader[0];
        startDate = start;
        endDate = end;
        header.setStatusId(status);
        description = desc;
        header.setName(name);
        header.setTypeId(type);
        header.getUser().setId(user);
    }

    /*  This constructs the Contract that will be updated via the
     *   updatedContract method in the DataInterfaceBean
     *
     *
     */
    public Contract(String name, String start, String end,
                    String desc, int status, int type, long contract_id) {

        header = new ContractHeader();
        payments = new PaymentHeader[0];
        startDate = start;
        endDate = end;
        header.setStatusId(status);
        description = desc;
        header.setName(name);
        header.setTypeId(type);
        header.setId(contract_id);
    }


    public PaymentHeader[] getPayments() {
        return payments;
    }

    public void setPayments(PaymentHeader[] payments) {
        this.payments = payments;
    }

    public ContractHeader getHeader() {
        return header;
    }

    public void setHeader(ContractHeader header) {
        this.header = header;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

}
