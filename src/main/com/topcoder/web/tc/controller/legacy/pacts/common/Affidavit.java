/******************************************************************************\
 *
 * File:          Affidavit.java
 * Creation date: March 05, 2002 10:19
 * Author:        Matt Murphy
 * Purpose:       Store information about a given affidavit.
 * See:           ResultSetContainer.java
 *                AffidavitHeader.java
 *                PaymentHeader.java
 *
 * Modifications: @INSERT_MODIFICATIONS(* )
 * March 05, 2002 10:19 Matt Murphy
 *     Added member '_payment'
 *     Added member '_description'
 *     Added member '_header'
 *     Added member '_affirmationDate'
 *
 * DBP 3/20 - Change path to ResultSetContainer - now in com.topcoder.web.common
 * DBP 3/26 - Implement serializable, have the no arg constructor set defaults
 * DBP 6/6 - Move description to header
 *
 * Copyright 2002, TopCoder, Inc
 * All rights are reserved. Reproduction in whole or part is prohibited
 * without the written consent of the copyright owner.
 *
 \******************************************************************************/

package com.topcoder.web.tc.controller.legacy.pacts.common;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

public class Affidavit implements PactsConstants, java.io.Serializable {

    private static Logger log = Logger.getLogger(Affidavit.class);
/*  Explanation of Members
*
*  _header          - the more commonly requested information of the affidavit
*  _payment         - the payment this affidavit is for
*  _description     - the description of the affidavit
*  _affirmationDate - date that the affidavit was affirmed ("00/00/00" if not)
*/
    private AffidavitHeader header;
    private PaymentHeader payment;
    //public String _description;
    private String affirmationDate;
    private Long roundId;
    private String round;
    private String birthday;
    private long daysLeftToAffirm;

    // DBP 6/6 - use the PactsConstants value
    public static final long DAYS_TO_AFFIRM = AFFIDAVIT_EXPIRE_TIME;

    /**************\
     *              *
     * Constructors *
     *              *
     \**************/

/* Basic constructor that sets all the default values and such
*
*  @ARGS none
*/
    public Affidavit() {
        setDefaults();
    }

    private void setDefaults() {
        payment = new PaymentHeader();
        //_description = "Default Description";
        header = new AffidavitHeader();
        affirmationDate = "00/00/00";
        roundId = new Long(0);
        round = "default round";
        birthday = "";
    }

/* This contructs a new Affidavit that will be sent down to the database
*  via the addAffidavit function
*
*
*/
    public Affidavit(Long round, long user, int status,
                     String desc, int type, boolean affirmed, boolean notarized) {

        payment = null;
        header = new AffidavitHeader();
        roundId = round;
        //_description = desc;
        header.setDescription(desc);
        header.setTypeId(type);
        header.getUser().setId(user);
        header.setStatusId(status);
        header.setAffirmed(affirmed);
        header.setNotarized(notarized);

    }


/* This constructor makes the object out of the Map containing
*  the ResultSetContainer with the constant name of AFFIDAVIT_DETAIL
*
*  @ARGS
*   o Map results - the map containing AFFIDAVIT_DETAIL
*
*/
    public Affidavit(Map results) {
        ResultSetContainer rsc = (ResultSetContainer) results.get(AFFIDAVIT_DETAIL);
        if (rsc == null) {
            log.error("There is no " + AFFIDAVIT_DETAIL + "in the ResultSetContainer");
            setDefaults();
            return;
        }

        int numRows = rsc.getRowCount();
        if (numRows < 1) {
            log.error("There was nothing in the ResultSetContainer");
            setDefaults();
            return;
        }

        ResultSetContainer.ResultSetRow rsr = rsc.getRow(0);

        log.debug("Making the Affidavit");
        payment = new PaymentHeader(results);
        header = new AffidavitHeader(results);
        //_description = TCData.getTCString(rsr,"affidavit_desc","default description",true);
        affirmationDate = TCData.getTCDate(rsr, "date_affirmed", "Not Affirmed", false);
        round = TCData.getTCString(rsr, "name", "No Round", false);
        roundId = new Long(TCData.getTCLong(rsr, "round_id", 0, false));
        birthday = TCData.getTCDate(rsr, "date_of_birth", "", false);
        log.debug("the birthday for the affidavit from the db is " + birthday);
        log.debug("here is ths rsr " + rsr);
        SimpleDateFormat dfmt = new SimpleDateFormat(DATE_FORMAT_STRING);
        try {
            Date d = dfmt.parse(header.getCreationDate());
            long diff = System.currentTimeMillis() - d.getTime();
            daysLeftToAffirm = DAYS_TO_AFFIRM - (diff / ((long) 1000 * 60 * 60 * 24));
        } catch (Exception e3) {
            log.error("exception parsing the creation date");
            daysLeftToAffirm = -1;
        }


    }


    public AffidavitHeader getHeader() {
        return header;
    }

    public void setHeader(AffidavitHeader header) {
        this.header = header;
    }

    public PaymentHeader getPayment() {
        return payment;
    }

    public void setPayment(PaymentHeader payment) {
        this.payment = payment;
    }

    public String getAffirmationDate() {
        return affirmationDate;
    }

    public void setAffirmationDate(String affirmationDate) {
        this.affirmationDate = affirmationDate;
    }

    public Long getRoundId() {
        return roundId;
    }

    public void setRoundId(Long roundId) {
        this.roundId = roundId;
    }

    public String getRound() {
        return round;
    }

    public void setRound(String round) {
        this.round = round;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public long getDaysLeftToAffirm() {
        return daysLeftToAffirm;
    }

    public void setDaysLeftToAffirm(long daysLeftToAffirm) {
        this.daysLeftToAffirm = daysLeftToAffirm;
    }


}
