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

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

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
    public AffidavitHeader _header;
    public PaymentHeader _payment;
    //public String _description;
    public String _affirmationDate;
    public Long _roundID;
    public String _round;
    public String _birthday;
    public long _daysLeftToAffirm;

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
        _payment = new PaymentHeader();
        //_description = "Default Description";
        _header = new AffidavitHeader();
        _affirmationDate = "00/00/00";
        _roundID = new Long(0);
        _round = "default round";
        _birthday = "";
    }

/* This contructs a new Affidavit that will be sent down to the database
*  via the addAffidavit function
*
*
*/
    public Affidavit(Long round, long user, int status,
                     String desc, int type, boolean affirmed, boolean notarized) {

        _payment = null;
        _header = new AffidavitHeader();
        _roundID = round;
        //_description = desc;
        _header._description = desc;
        _header._typeID = type;
        _header._user._id = user;
        _header._statusID = status;
        _header._affirmed = affirmed;
        _header._notarized = notarized;

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
        _payment = new PaymentHeader(results);
        _header = new AffidavitHeader(results);
        //_description = TCData.getTCString(rsr,"affidavit_desc","default description",true);
        _affirmationDate = TCData.getTCDate(rsr, "date_affirmed", "Not Affirmed", false);
        _round = TCData.getTCString(rsr, "name", "No Round", false);
        _roundID = new Long(TCData.getTCLong(rsr, "round_id", 0, false));
        _birthday = TCData.getTCDate(rsr, "date_of_birth", "", false);
        log.debug("the birthday for the affidavit from the db is " + _birthday);
        log.debug("here is ths rsr " + rsr);
        SimpleDateFormat dfmt = new SimpleDateFormat(DATE_FORMAT_STRING);
        try {
            Date d = dfmt.parse(_header._creationDate);
            long diff = System.currentTimeMillis() - d.getTime();
            _daysLeftToAffirm = DAYS_TO_AFFIRM - (diff / ((long) 1000 * 60 * 60 * 24));
        } catch (Exception e3) {
            log.error("exception parsing the creation date");
            _daysLeftToAffirm = -1;
        }


    }

}
