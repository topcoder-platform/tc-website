package com.topcoder.web.tc.controller.legacy.pacts.common;

/**
 * This class holds the data fields of an contract which must be known
 * when adding a new contract to the database.
 *
 * @author   Dave Pecora
 * @version  1.00, 03/21/2002
 */
public class ContractAddition implements java.io.Serializable {
    String name;
    long contracted_user_id;
    String text;
    java.sql.Date start_date;
    java.sql.Date end_date;
    String contract_desc;
    int status_id;
    long contract_type_id;

    /**
     * This constructor builds an ContractAddition from the specified data.
     * The contract creation date will be set to the current date/time.
     *
     * @param name The contract name
     * @param contractedUserId The user ID the contract is with
     * @param text The contract text
     * @param startDate The contract start date
     * @param endDate The contract end date
     * @param description The contract description
     * @param statusId The status code of the contract
     * @param typeId The type of the contract
     */
    public ContractAddition(String name, long contractedUserId, String text, java.sql.Date startDate,
                            java.sql.Date endDate, String description, int statusId, int typeId) {
        this.name = name;
        this.contracted_user_id = contractedUserId;
        this.text = text;
        this.start_date = startDate;
        this.end_date = endDate;
        this.contract_desc = description;
        this.status_id = statusId;
        this.contract_type_id = typeId;
    }
}

