/*
 * Copyright (C) 2002-2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * <p>A controller for handling the requests for viewing the list of available payments for selected
 * <code>Digital Run</code> track which can be presented to <code>PACTS Administrators</code> for generating the
 * payments.</p>
 *
 * <p>As of version 2.0 the controller has been totally re-written to switch to latest <code>Digital Run</code> schema.
 * </p>
 *
 * <p>It takes track ID as a parameter, finds the contests for it, and displays a list of the people that won money for
 * the contest. It checks if the user was already paid for it, and if not, it shows a check box so that it can be paid.
 * </p>
 *
 * @author Cucu, TCSDEVELOPER
 * @version 2.0
 */
public class ListDRPayments extends BaseProcessor implements PactsConstants {

    /**
     * <p>Constructs new <code>ListDRPayments</code> instance. This implementation does nothing.</p>
     *
     * @since 2.0
     */
    public ListDRPayments() {
    }

    /**
     * <p>Implements the business logic for processing incoming request which is asking to display the available
     * payments for requested DR track.</p>
     *
     * @throws TCWebException if an unexpected error occurs.
     */
    protected void businessProcessing() throws TCWebException {        
        try {
            String trackIdValue = getRequest().getParameter(Constants.TRACK_ID);
            setDefault(Constants.TRACK_ID, trackIdValue);

            if (isEmpty(trackIdValue)) {
                addError(Constants.TRACK_ID, "Please, select Digital Run track");
            } else {
                try {
                    long trackId = Long.parseLong(trackIdValue);
                    List<Contest> contests = getTrackContests(trackId);
                    for (Contest c : contests) {
                        loadResults(c);
                        fillPaid(c, trackId);
                    }
                    getRequest().setAttribute("contests", contests);
                } catch (NumberFormatException e) {
                    addError(Constants.TRACK_ID, "Invalid Digital Run track ID: " + trackIdValue);
                }
            }
            if (hasErrors()) {
                setNextPage(INTERNAL_VIEW_GENERATE_DR_PAYMENTS);
                setIsNextPageInContext(true);
            } else {
                setNextPage(INTERNAL_LIST_DR_PAYMENTS);
                setIsNextPageInContext(true);
            }
        } catch (Exception e) {
            throw new TCWebException("Failed to get the list of Digital Run payments", e);
        }
    }

    /**
     * <p>In the contest results list of the contest, fills the payment id's of the prizes that are already paid.</p>
     * 
     * @param contest a <code>Contest</code> providing the details for the contest to load existing payments for.
     * @param trackId a <code>long</code> providing the ID for the <code>Digital Run</code> track which the specified
     *        contest belongs to. 
     * @throws Exception if an unexpected error occurs.
     */
    @SuppressWarnings("unchecked")
    private void fillPaid(Contest contest, long trackId) throws Exception {
        DataInterfaceBean dib = new DataInterfaceBean();
        
        int paymentType;
        if (contest.getTypeId() == Constants.CONTEST_TYPE_DR_V2_PRIZE) {
            paymentType = DIGITAL_RUN_V2_PRIZE_PAYMENT;
        } else  if (contest.getTypeId() == Constants.CONTEST_TYPE_DR_V2_TOP_PERFORMERS) {
            paymentType = DIGITAL_RUN_V2_TOP_PERFORMERS_PAYMENT;
        } else {
            throw new Exception("Invalid DR contest type: " + contest.getTypeId());
        }
            
        List<BasePayment> payments = dib.findPayments(paymentType, trackId);
        for (ContestResult cr : contest.getResults()) {
            for (BasePayment payment : payments) {
                if (cr.getCoderId() == payment.getCoderId()) {
                    cr.setPaymentId(payment.getId());
                }
            }
        }
    }
    
    /**
     * <p>Loads the results for the specified contest and saves them to specified <code>Context</code> object.</p>
     * 
     * @param contest a <code>Contest</code> providing the details for the contest to load results for.
     * @throws Exception if an unexpected error occurs.
     */
    private void loadResults(Contest contest) throws Exception {
        Request r = new Request();
        r.setContentHandle("dr_track_contest_payments");
        r.setProperty(Constants.CONTEST_ID, String.valueOf(contest.getId()));
        
        ResultSetContainer rsc
            = new DataAccess(DBMS.TCS_DW_DATASOURCE_NAME).getData(r).get("dr_track_contest_payments");
        for (ResultSetContainer.ResultSetRow row : rsc) {
            // round the amount to 2 decimals
            double prize = Math.round(row.getDoubleItem("prize") * 100) / 100.0;
            ContestResult cr = new ContestResult(row.getIntItem("place"), row.getLongItem("coder_id"), prize);
            contest.addResult(cr);
        }
    }

    /**
     * <p>Gets the list of contests associated with the specified <code>Digital Run</code> track.</p>
     *
     * @param trackId a <code>long</code> providing the ID of <code>Digital Run</code> track to get the list of contests
     *        for.
     * @return a <code>List</code> providing the details for contests associated with the specified
     *         <code>Digital Run</code> track.  
     * @throws Exception if an unexpected error occurs.
     */
    private List<Contest> getTrackContests(long trackId) throws Exception {
        Request r = new Request();
        r.setContentHandle("dr_contests_for_track");
        r.setProperty(Constants.TRACK_ID, String.valueOf(trackId));

        ResultSetContainer rsc = new DataAccess(DBMS.TCS_DW_DATASOURCE_NAME).getData(r).get("dr_contests_for_track");

        List<Contest> contests = new ArrayList<Contest>();
        for (ResultSetContainer.ResultSetRow row : rsc) {
            contests.add(new Contest(row.getIntItem("track_contest_id"),
                                     row.getIntItem("track_contest_type_id"),
                                     row.getStringItem("track_contest_desc")));
        }

        return contests;
    }

    /**
     * <p>Class to hold data of a contest and its results.</p>
     * 
     * @author cucu, TCSDEVELOPER
     * @version 1.0
     */
    public static class Contest {

        /**
         * <p>An <code>int</code> providing the ID for the track contest.</p>
         */
        private int id;

        /**
         * <p>An <code>int</code> referencing the track contest type.</p>
         */
        private int typeId;

        /**
         * <p>A <code>String</code> providing the textual description of this track contest.</p>
         */
        private String name;

        /**
         * <p>A <code>List</code> providing the results for this track contest.</p>
         */
        private List<ContestResult> results;

        /**
         * <p>A <code>double</code> providing the total amount of prizes for this track contest.</p>
         */
        private double totalPrizes = 0.0;

        /**
         * <p>Constructs new <code>ListDRPayments$Contest</code> instance with specified parameters.</p>
         *
         * @param id an <code>int</code> providing the ID for the track contest.
         * @param typeId a <code>int</code> referencing the track contest type.
         * @param name a <code>String</code> providing the textual description of this tracl contest.
         */
        public Contest(int id, int typeId, String name) {
            this.id = id;
            this.typeId = typeId;
            this.name = name;
            results = new ArrayList<ContestResult>();
        }

        /**
         * <p>Gets the ID for this track contest.</p>
         *
         * @return an <code>int</code> providing the ID for the track contest.
         */
        public int getId() {
            return id;
        }

        /**
         * <p>Gets the track contest type.</p>
         *
         * @return an <code>int</code> referencing the track contest type.
         */
        public int getTypeId() {
            return typeId;
        }

        /**
         * <p>Gets the description for this track contest.</p>
         *
         * @return a <code>String</code> providing the textual description of this track contest.
         */
        public String getName() {
            return name;
        }

        /**
         * <p>Gets the results for this track contest.</p>
         *
         * @return a <code>List</code> providing the results for this track contest.
         */
        public List<ContestResult> getResults() {
            return results;
        }

        /**
         * <p>Adds specified result to this contest.</p>
         *
         * @param result a <code>ContestResult</code> to be added to this contest.
         */
        public void addResult(ContestResult result) {
            results.add(result);
            totalPrizes += result.getPrize();
        }

        /**
         * <p>Gets the total amount of prizes for this track contest.</p>
         *
         * @return a <code>double</code> providing the total amount of prizes for this track contest.
         */
        public double getTotalPrizes() {
            return totalPrizes;
        }
    }
    
    /**
     * <p>Class to hold a result for a contest.</p>
     * 
     * @author cucu, TCSDEVELOPER
     * @since 1.0
     */
    public static class ContestResult {

        /**
         * <p>An <code>int</code> providing the placement taken by the coder.</p>
         */
        int place;

        /**
         * <p>A <code>long</code> providing the coder ID.</p>
         */
        long coderId;

        /**
         * <p>A <code>double</code> providing the prize awared to coder.</p>
         */
        double prize;

        /**
         * <p>A <code>Long</code> providing the ID of generated payment. <code>null</code> means that the payment hasn't
         * been generated yet.</p>
         */
        Long paymentId;

        /**
         * <p>Constructs new <code>ListDRPayments$ContestResult</code> instance with specified parameters.</p>
         *
         * @param place an <code>int</code> providing the placement taken by the coder.
         * @param coderId a <code>long</code> providing the coder ID.
         * @param prize a <code>double</code> providing the prize awared to coder.
         */
        public ContestResult(int place, long coderId, double prize) {
            super();
            this.place = place;
            this.coderId = coderId;
            this.prize = prize;
        }

        /**
         * <p>Gets ID for generated payment.</p>
         *
         * @return a <code>Long</code> providing the ID of generated payment. <code>null</code> means that the payment
         *         hasn't been generated yet.
         */
        public Long getPaymentId() {
            return paymentId;
        }

        /**
         * <p>Sets ID for generated payment.</p>
         *
         * @param paymentId a <code>Long</code> providing the ID of generated payment. <code>null</code> means that the
         *        payment hasn't been generated yet.
         */
        public void setPaymentId(Long paymentId) {
            this.paymentId = paymentId;
        }

        /**
         * <p>Gets the placement taken by the coder.</p>
         *
         * @return an <code>int</code> providing the placement taken by the coder.
         */
        public int getPlace() {
            return place;
        }

        /**
         * <p>Gets the prize awared to coder.</p>
         *
         * @return a <code>double</code> providing the prize awared to coder.
         */
        public double getPrize() {
            return prize;
        }

        /**
         * <p>Gets the coder ID.</p>
         *
         * @return a <code>long</code> providing the coder ID.
         */
        public long getCoderId() {
            return coderId;
        }
    }
}

