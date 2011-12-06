/*
 * Copyright (C) 2004 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.ejb.pacts;

import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.sql.Types;
import java.text.DecimalFormat;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.ejb.EJBException;
import javax.ejb.SessionContext;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.ValueTag;
import com.topcoder.shared.docGen.xml.XMLDocument;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.idgenerator.IDGenerationException;
import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocument;
import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocumentStatus;
import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocumentTemplate;
import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocumentType;
import com.topcoder.web.ejb.pacts.assignmentdocuments.ComponentProject;
import com.topcoder.web.ejb.pacts.assignmentdocuments.StudioContest;
import com.topcoder.web.ejb.pacts.assignmentdocuments.User;
import com.topcoder.web.ejb.pacts.payments.BasePaymentStatus;
import com.topcoder.web.ejb.pacts.payments.OwedPaymentStatus;
import com.topcoder.web.ejb.pacts.payments.EventFailureException;
import com.topcoder.web.ejb.pacts.payments.InvalidStatusException;
import com.topcoder.web.ejb.pacts.payments.InvalidStatusReasonException;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusFactory;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusManager;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusReason;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusFactory.PaymentStatus;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusManager.UserEvents;
import com.topcoder.web.tc.controller.legacy.pacts.bean.pacts_client.dispatch.UserProfileBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.Affidavit;
import com.topcoder.web.tc.controller.legacy.pacts.common.Contract;
import com.topcoder.web.tc.controller.legacy.pacts.common.IllegalUpdateException;
import com.topcoder.web.tc.controller.legacy.pacts.common.NoObjectFoundException;
import com.topcoder.web.tc.controller.legacy.pacts.common.Note;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;
import com.topcoder.web.tc.controller.legacy.pacts.common.PaymentPaidException;
import com.topcoder.web.tc.controller.legacy.pacts.common.TCData;
import com.topcoder.web.tc.controller.legacy.pacts.common.TaxForm;
import com.topcoder.web.tc.controller.legacy.pacts.common.UserProfile;
import com.topcoder.web.tc.controller.legacy.pacts.common.UserProfileHeader;

import static com.topcoder.web.tc.Constants.MINIMUM_PAYMENT_ACCRUAL_AMOUNT;

/**
 * <p>The EJB class which handles database access for the PACTS system.</p>
 *
 * <p>
 *   Version 1.1 (Testing Competition Split Release Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Updated Application Testing to Test Suites.</li>
 *     <li>Added support for new Test Scenarios competitions.</li>
 *   </ol>
 * </p>
 *
  * <p>
  *   Version 1.2 (Miscellaneous TC Improvements Release Assembly 1.0) Change notes:
  *   <ol>
  *     <li>Updated {@link #generateComponentPayments(long, long, String, boolean, long, long, boolean, boolean)} method
 *      to handle the case when there is no design project associated with project to generate payments for.</li>
  *   </ol>
  * </p>
 *
 * <p>
 *   Version 1.3 (Member Payment Improvements Release Assembly v1.0) Change notes:
 *   <ol>
 *     <li>Updated {@link #findUsers(java.util.Map)} method to retrieve user profile statuses from data store.</li>
 *     <li>Updated <code>serialVersionUID</code> static field.</p>
 *   </ol>
 * </p>
 * <p>
 *   Version 1.4 (Studio Electronic Assignment Document Assembly version 1.0) Change notes:
 *   <ol>
 *     <li>Change the process of add payment</li>
 *   </ol>
 * </p>
 * <p>
 *   Version 1.5 (Copilot Selection Contest Online Review and TC Site Integration Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Added support for new Copilot Posting competitions.</li>
 *   </ol>
 * </p>
 * <p>
 *   Version 1.6 (Online Review Payments and Status Automation Assembly 1.0) Changes Notes:
 * <ol>
 * <li>a new parameter is added for the three generateComponentPayments methods to populate the related resource
 *     ids for generated component payments.</li>
 * <li>a new method {@link #addOnlineReviewPayments(List, List)} is added for adding payments in persistence and
 *     populating the payment statuses for the given resource ids.</li>
 * </ol>
 * </p>
 * <p>
 *   Version 1.7 (Content Creation Contest Online Review and TC Site Integration Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Added {@link #CONTENT_CREATION_PROJECT_TYPE} constant.</li>
 *     <li>Updated {@link #generateComponentPayments(long, long, String, boolean, long, long, boolean, boolean)} method.
 *     </li>
 *     <li>Updated {@link #generateComponentUserPayments(long, double, String, long, int, long, boolean, long, boolean)}
 *     method.</li>
 *   </ol>
 * </p>
 *
 * <p>VERY IMPORTANT: remember to update serialVersionUID if needed.</p>
 *
 * @author Dave Pecora, pulky, isv, Vitta, Blues, FireIce
 * @version 1.7
 * @see PactsConstants
 */
public class PactsServicesBean extends BaseEJB implements PactsConstants {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     *
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 8L;


    private static final Logger log = Logger.getLogger(PactsServicesBean.class);
    private static final double FIRST_INSTALLMENT_PERCENT = 0.75;

    public static final Long COLLEGE_MAJOR_DESC = 14l;
    public static final Long DEGREE_PROGRAM = 16l;
    public static final Long COLLEGE_MAJOR = 17l;

    private static final String trxDataSource = DBMS.JTS_OLTP_DATASOURCE_NAME;

    private SessionContext ejbContext;

    public void ejbRemove() {
        super.ejbRemove();
    }

    /**
     * @see javax.ejb.SessionBean#setSessionContext(javax.ejb.SessionContext)
     */
    public void setSessionContext(SessionContext ctx) throws EJBException {
        this.ejbContext = ctx;
    }

    private void printException(Exception e) {
        try {
            if (e instanceof SQLException) {
                String sqlErrorDetails = DBMS.getSqlExceptionString((SQLException) e);
                log.error("PACTS EJB: SQLException caught\n" + sqlErrorDetails, e);
            } else {
                log.error("PACTS EJB: Exception caught", e);
            }
        } catch (Exception ex) {
            log.error("PACTS EJB: Error printing exception!");
        }
    }

    private ResultSetContainer runSelectQuery(String query) throws SQLException {
        String s[] = new String[1];
        s[0] = query;
        ResultSetContainer rsc[] = runSelectQuery(s);
        return rsc[0];
    }

    private ResultSetContainer[] runSelectQuery(String query[]) throws SQLException {
        Connection c = null;

        try {
            c = DBMS.getConnection();
            ResultSetContainer rsc[] = runSelectQuery(c, query);
            c.close();
            c = null;
            return rsc;
        } catch (Exception e) {
            try {
                if (c != null) c.close();
            } catch (Exception e1) {
                printException(e1);
            }
            c = null;
            throw new SQLException(e.getMessage());
        }
    }

    private ResultSetContainer runSelectQuery(Connection c, String query) throws SQLException {
        String s[] = new String[1];
        s[0] = query;
        ResultSetContainer rsc[] = runSelectQuery(c, s);
        return rsc[0];
    }

    private ResultSetContainer[] runSelectQuery(Connection c, String query[]) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ResultSetContainer rsc[] = new ResultSetContainer[query.length];
            for (int i = 0; i < query.length; i++) {
                ps = c.prepareStatement(query[i]);
                rs = ps.executeQuery();
                rsc[i] = new ResultSetContainer(rs, false);
                rs.close();
                rs = null;
                ps.close();
                ps = null;
            }
            return rsc;
        } catch (Exception e) {
            for (int i = 0; i < query.length; i++) {
                StringBuffer sb = new StringBuffer(1000);
                sb.append("------------\n");
                sb.append("Query " + i + ":\n");
                sb.append(query[i] + "\n");
                sb.append("------------\n");
                log.error(sb.toString());
            }
            printException(e);
            try {
                if (rs != null) rs.close();
            } catch (Exception e1) {
                printException(e1);
            }
            try {
                if (ps != null) ps.close();
            } catch (Exception e1) {
                printException(e1);
            }
            rs = null;
            ps = null;
            throw new SQLException(e.getMessage());
        }
    }

    private int runUpdateQuery(String query) throws SQLException {
        Connection c = null;
        try {
            c = DBMS.getConnection();
            int rowsModified = runUpdateQuery(c, query);
            c.close();
            c = null;
            return rowsModified;
        } catch (Exception e) {
            try {
                if (c != null) c.close();
            } catch (Exception e1) {
                printException(e1);
            }
            c = null;
            throw new SQLException(e.getMessage());
        }
    }

    private int runUpdateQuery(Connection c, String query) throws SQLException {
        PreparedStatement ps = null;
        try {
            ps = c.prepareStatement(query);
            int rowsModified = ps.executeUpdate();
            ps.close();
            ps = null;
            return rowsModified;
        } catch (Exception e) {
            StringBuffer sb = new StringBuffer(300);
            sb.append("------------\n");
            sb.append("Query:\n");
            sb.append(query + "\n");
            sb.append("------------\n");
            log.error(sb.toString());
            printException(e);
            try {
                if (ps != null) ps.close();
            } catch (Exception e1) {
                printException(e1);
            }
            ps = null;
            throw new SQLException(e.getMessage());
        }
    }

    private ResultSetContainer runSearchQuery(String query, ArrayList objects) throws SQLException {
        return runSearchQuery((String) null, query, objects);
    }

    private ResultSetContainer runSearchQuery(String connection, String query, ArrayList objects) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            c = connection == null ? DBMS.getConnection() : DBMS.getConnection(connection);
            ps = c.prepareStatement(query);
            for (int i = 0; i < objects.size(); i++) {
                Object o = objects.get(i);
                if (o instanceof Timestamp)
                    ps.setTimestamp(i + 1, (Timestamp) o);
                else if (o instanceof String)
                    ps.setString(i + 1, (String) o);
            }
            rs = ps.executeQuery();
            ResultSetContainer rsc = new ResultSetContainer(rs, false);
            rs.close();
            rs = null;
            ps.close();
            ps = null;
            c.close();
            c = null;

            return rsc;
        } catch (Exception e) {
            printException(e);
            StringBuffer sb = new StringBuffer(300);
            sb.append("----- Query:\n");
            sb.append(query + "\n");
            sb.append("----- Objects:\n");
            for (int i = 0; i < objects.size(); i++)
                sb.append(objects.get(i).toString());
            log.error(sb.toString());

            try {
                if (rs != null) rs.close();
            } catch (Exception e1) {
                printException(e1);
            }
            rs = null;
            try {
                if (ps != null) ps.close();
            } catch (Exception e1) {
                printException(e1);
            }
            ps = null;
            try {
                if (c != null) c.close();
            } catch (Exception e1) {
                printException(e1);
            }
            c = null;
            throw new SQLException(e.getMessage());
        }
    }

    private ResultSetContainer runSearchQuery(Connection c, String query, ArrayList objects) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = c.prepareStatement(query);
            for (int i = 0; i < objects.size(); i++) {
                Object o = objects.get(i);
                if (o instanceof Timestamp)
                    ps.setTimestamp(i + 1, (Timestamp) o);
                else if (o instanceof String)
                    ps.setString(i + 1, (String) o);
            }
            rs = ps.executeQuery();
            ResultSetContainer rsc = new ResultSetContainer(rs, false);
            rs.close();
            rs = null;
            ps.close();
            ps = null;

            return rsc;
        } catch (Exception e) {
            printException(e);
            StringBuffer sb = new StringBuffer(300);
            sb.append("----- Query:\n");
            sb.append(query + "\n");
            sb.append("----- Objects: (size:");
            sb.append(objects.size());
            sb.append(")\n");
            for (int i = 0; i < objects.size(); i++)
                sb.append(objects.get(i).toString() + "\n");
            log.error(sb.toString());

            try {
                if (rs != null) rs.close();
            } catch (Exception e1) {
                printException(e1);
            }
            rs = null;
            try {
                if (ps != null) ps.close();
            } catch (Exception e1) {
                printException(e1);
            }
            ps = null;
            throw new SQLException(e.getMessage());
        }
    }

    private List retrieveAssignmentDocuments(Connection c, String query, ArrayList objects) throws SQLException {
        List l = new ArrayList();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = c.prepareStatement(query);
            for (int i = 0; i < objects.size(); i++) {
                Object o = objects.get(i);
                if (o instanceof Timestamp)
                    ps.setTimestamp(i + 1, (Timestamp) o);
                else if (o instanceof String)
                    ps.setString(i + 1, (String) o);
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                AssignmentDocument ad = createAssignmentDocumentBean(c, rs);

                l.add(ad);
            }

            return l;
        } catch (Exception e) {
            printException(e);
            StringBuffer sb = new StringBuffer(300);
            sb.append("----- Query:\n");
            sb.append(query + "\n");
            sb.append("----- Objects: (size:");
            sb.append(objects.size());
            sb.append(")\n");
            for (int i = 0; i < objects.size(); i++)
                sb.append(objects.get(i).toString() + "\n");
            log.error(sb.toString());

            throw new SQLException(e.getMessage());
        } finally {
            close(rs);
            close(ps);
        }
    }

    private Timestamp makeTimestamp(String dateString, boolean allowNulls, boolean endOfDay)
            throws Exception {
        log.debug("makeTimestamp: " + dateString + " " + allowNulls + " " + endOfDay);
        if (allowNulls) {
            if (dateString == null) {
                return null;
            }
            String s = dateString.trim();
            if (s.equals("") || s.equals(EMPTY_DATE_STRING) || s.equals(ANOTHER_EMPTY_DATE_STRING)) {
                return null;
            }
        }
        if (dateString == null)
            throw new Exception("Date string input " + dateString + " could not be parsed");
        SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_STRING);
        sdf.setLenient(false);
        ParsePosition pp = new ParsePosition(0);
        java.util.Date dt = sdf.parse(dateString, pp);
        if (dt == null)
            throw new Exception("Date string input " + dateString + " could not be parsed");

        // Make sure the time is set to midnight on that day - javadocs for the SimpleDateFormat
        // parser are unclear on this point and the parser code is horrifically complicated...
        GregorianCalendar g = new GregorianCalendar();
        g.setTime(dt);
        g.set(Calendar.HOUR_OF_DAY, 0);
        g.set(Calendar.MINUTE, 0);
        g.set(Calendar.SECOND, 0);
        g.set(Calendar.MILLISECOND, 0);
        dt = g.getTime();

        long ms = dt.getTime();
        // In some cases it can be useful to set the time to 11:59:59 PM, for example if we're
        // trying to find payments that were printed sometime that day and this is the end
        // timestamp value.
        if (endOfDay) {
            ms += (60 * 60 * 24 * 1000 - 1);
        }
        return new Timestamp(ms);
    }

    private boolean makeBoolean(String booleanString) throws Exception {
        booleanString = booleanString.toUpperCase();
        if (booleanString.equals("T") || booleanString.equals("TRUE"))
            return true;
        if (booleanString.equals("F") || booleanString.equals("FALSE"))
            return false;
        throw new Exception("String " + booleanString + " could not be converted to boolean type");
    }

    /*****************************************************
     * Object retrieval functions
     *****************************************************/

    /**
     * Returns the affidavit specified by the given affidavit ID.  <p>
     *
     * @param affidavitId The ID of the affidavit to retrieve.
     * @return The affidavit data.
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map getAffidavit(long affidavitId) throws SQLException {
        StringBuffer selectAffidavitHeader = new StringBuffer(300);
        selectAffidavitHeader.append("SELECT a.affidavit_id, a.status_id, s.status_desc, a.user_id, ");
        selectAffidavitHeader.append("a.notarized, a.affirmed, a.date_created, u.handle, ");
        selectAffidavitHeader.append("a.affidavit_type_id, atl.affidavit_type_desc, a.affidavit_desc ");
        selectAffidavitHeader.append("FROM affidavit a, status_lu s, user u, affidavit_type_lu atl ");
        selectAffidavitHeader.append("WHERE a.affidavit_id = " + affidavitId + " ");
        selectAffidavitHeader.append("AND a.affidavit_type_id = atl.affidavit_type_id ");
        selectAffidavitHeader.append("AND a.status_id = s.status_id ");
        selectAffidavitHeader.append("AND u.user_id = a.user_id");

        StringBuffer selectAffidavitDetails = new StringBuffer(300);
        selectAffidavitDetails.append("SELECT a.round_id, a.date_affirmed, a.payment_id, ");
        selectAffidavitDetails.append("c.name, coder.date_of_birth ");
        selectAffidavitDetails.append("FROM affidavit a, OUTER(round r, contest c), coder ");
        selectAffidavitDetails.append("WHERE a.affidavit_id = " + affidavitId + " ");
        selectAffidavitDetails.append("AND r.round_id = a.round_id ");
        selectAffidavitDetails.append("AND r.contest_id = c.contest_id ");
        selectAffidavitDetails.append("AND a.user_id = coder.coder_id");

        Connection c = null;
        try {
            c = DBMS.getConnection(trxDataSource);
            // Get affidavit header
            ResultSetContainer rsc = runSelectQuery(c, selectAffidavitHeader.toString());
            if (rsc.getRowCount() == 0) {
                throw new NoObjectFoundException("No affidavit found with ID " + affidavitId);
            }
            HashMap hm = new HashMap();
            hm.put(AFFIDAVIT_HEADER_LIST, rsc);

            // Get affidavit details
            rsc = runSelectQuery(c, selectAffidavitDetails.toString());
            if (rsc.getRowCount() == 0) {
                throw new NoObjectFoundException("No affidavit details found with ID " + affidavitId);
            }
            boolean hasPayment = rsc.getStringItem(0, "payment_id") != null;
            hm.put(AFFIDAVIT_DETAIL, rsc);

            if (hasPayment) {
                long paymentId = Long.parseLong(rsc.getItem(0, "payment_id").toString());
                // Get payment header for affidavit
                StringBuffer selectPaymentHeader = new StringBuffer(300);
                selectPaymentHeader.append("SELECT p.payment_id, pd.payment_desc, pd.payment_type_id,  p.create_date, pd.create_date as modify_date, ");
                selectPaymentHeader.append("pt.payment_type_desc, pd.payment_method_id, pm.payment_method_desc, ");
                selectPaymentHeader.append("pd.net_amount, pd.payment_status_id, s.payment_status_desc, ");
                selectPaymentHeader.append("p.user_id, u.handle, pd.date_modified, pd.gross_amount, pd.client, ");
                selectPaymentHeader.append("pd.algorithm_round_id, pd.component_project_id, pd.algorithm_problem_id, ");
                selectPaymentHeader.append("pd.studio_contest_id, pd.component_contest_id, pd.digital_run_stage_id, 0 as payment_status_reason_id, ");
                selectPaymentHeader.append("pd.digital_run_season_id, pd.parent_payment_id, pd.total_amount, pd.installment_number, pd.digital_run_track_id, pd.invoice_number ");
                selectPaymentHeader.append("FROM payment p, payment_type_lu pt, payment_method_lu pm, payment_detail pd, ");
                selectPaymentHeader.append("payment_status_lu s, user u ");
                selectPaymentHeader.append("WHERE p.payment_id = " + paymentId + " ");
                selectPaymentHeader.append("AND p.most_recent_detail_id = pd.payment_detail_id ");
                selectPaymentHeader.append("AND pt.payment_type_id = pd.payment_type_id ");
                selectPaymentHeader.append("AND pm.payment_method_id = pd.payment_method_id ");
                selectPaymentHeader.append("AND s.payment_status_id = pd.payment_status_id ");
                selectPaymentHeader.append("AND p.user_id = u.user_id ");

                rsc = runSelectQuery(c, selectPaymentHeader.toString());
                if (rsc.getRowCount() == 0) {
                    throw new NoObjectFoundException("No payment header details found for payment ID " + paymentId);
                }
                hm.put(PAYMENT_HEADER_LIST, rsc);
            }
            return hm;
        } catch (Exception e) {
            printException(e);
            throw new SQLException(e.getMessage());
        } finally {
            close(c);
        }
    }

    /**
     * Returns the contract specified by the given contract ID.  <p>
     *
     * @param contractId The ID of the contract to retrieve.
     * @return The contract data.
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map getContract(long contractId) throws SQLException {
        StringBuffer selectContractHeader = new StringBuffer(300);
        selectContractHeader.append("SELECT c.contract_id, c.creation_date, c.status_id, s.status_desc, ");
        selectContractHeader.append("c.contracted_user_id, u.handle, c.name, c.contract_type_id, ");
        selectContractHeader.append("ct.contract_type_desc ");
        selectContractHeader.append("FROM contract c, status_lu s, user u, contract_type_lu ct ");
        selectContractHeader.append("WHERE c.contract_id = " + contractId + " ");
        selectContractHeader.append("AND c.status_id = s.status_id ");
        selectContractHeader.append("AND c.contracted_user_id = u.user_id ");
        selectContractHeader.append("AND ct.contract_type_id = c.contract_type_id");

        StringBuffer selectContractDetails = new StringBuffer(300);
        selectContractDetails.append("SELECT start_date, end_date, contract_desc FROM contract ");
        selectContractDetails.append("WHERE contract_id = " + contractId);

        StringBuffer selectPaymentHeaders = new StringBuffer(300);
        selectPaymentHeaders.append("SELECT p.payment_id, pd.payment_desc, pd.payment_type_id, pd.payment_method_id, p.create_date, pd.create_date as modify_date,  ");
        selectPaymentHeaders.append("pt.payment_type_desc, pm.payment_method_desc, pd.net_amount, pd.payment_status_id, s.payment_status_desc, ");
        selectPaymentHeaders.append("p.user_id, u.handle, pd.date_modified, pd.gross_amount, pd.client, ");
        selectPaymentHeaders.append("pd.algorithm_round_id, pd.component_project_id, pd.algorithm_problem_id, ");
        selectPaymentHeaders.append("pd.studio_contest_id, pd.component_contest_id, pd.digital_run_stage_id, ");
        selectPaymentHeaders.append("pd.digital_run_season_id, pd.parent_payment_id, pd.total_amount, pd.installment_number, pd.digital_run_track_id, pd.invoice_number ");
        selectPaymentHeaders.append("FROM contract_payment_xref cpx, payment p, payment_type_lu pt, payment_method_lu pm, ");
        selectPaymentHeaders.append("payment_detail pd, payment_status_lu s, user u ");
        selectPaymentHeaders.append("WHERE cpx.contract_id = " + contractId + " ");
        selectPaymentHeaders.append("AND cpx.payment_id = p.payment_id ");
        selectPaymentHeaders.append("AND p.most_recent_detail_id = pd.payment_detail_id ");
        selectPaymentHeaders.append("AND pt.payment_type_id = pd.payment_type_id ");
        selectPaymentHeaders.append("AND pm.payment_method_id = pd.payment_method_id ");
        selectPaymentHeaders.append("AND s.payment_status_id = pd.payment_status_id ");
        selectPaymentHeaders.append("AND p.user_id = u.user_id ");
        selectPaymentHeaders.append("ORDER BY 1");

        String queries[] = new String[3];
        queries[0] = selectContractHeader.toString();
        queries[1] = selectContractDetails.toString();
        queries[2] = selectPaymentHeaders.toString();
        ResultSetContainer rsc[] = runSelectQuery(queries);

        HashMap hm = new HashMap();
        hm.put(CONTRACT_HEADER_LIST, rsc[0]);
        hm.put(CONTRACT_DETAIL, rsc[1]);
        hm.put(PAYMENT_HEADER_LIST, rsc[2]);
        return hm;
    }

    /**
     * Returns the note specified by the given note ID.  <p>
     *
     * @param noteId The ID of the note to retrieve.
     * @return The note data.
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map getNote(long noteId) throws SQLException {
        StringBuffer selectNoteHeader = new StringBuffer(300);
        selectNoteHeader.append("SELECT n.note_id, n.create_date, n.note_type_id, nt.note_type_desc, ");
        selectNoteHeader.append("n.submitted_by, u.handle ");
        selectNoteHeader.append("FROM note n, note_type_lu nt, user u ");
        selectNoteHeader.append("WHERE n.note_id = " + noteId + " ");
        selectNoteHeader.append("AND nt.note_type_id = n.note_type_id ");
        selectNoteHeader.append("AND u.user_id = n.submitted_by");

        StringBuffer selectNoteDetails = new StringBuffer(300);
        selectNoteDetails.append("SELECT text FROM note WHERE note_id = " + noteId);

        String queries[] = new String[2];
        queries[0] = selectNoteHeader.toString();
        queries[1] = selectNoteDetails.toString();
        ResultSetContainer rsc[] = runSelectQuery(queries);

        HashMap hm = new HashMap();
        hm.put(NOTE_HEADER_LIST, rsc[0]);
        hm.put(NOTE_DETAIL, rsc[1]);
        return hm;
    }

    /**
     * Returns the payment specified by the given payment ID.  The data returned will consist
     * of the payment header, the most recent payment detail record (with print address, if
     * applicable), and the current coder address information. <p>
     *
     * @param paymentId The ID of the payment to retrieve.
     * @return The payment data.
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map getPayment(long paymentId) throws SQLException {
        log.debug("getpayment(long) called..");
        StringBuffer selectPaymentDetails = new StringBuffer(300);
        selectPaymentDetails.append("SELECT pd.payment_detail_id, pd.net_amount, pd.gross_amount, ");
        selectPaymentDetails.append("pd.date_paid, pd.payment_status_id, s.payment_status_desc, ");
        selectPaymentDetails.append("pd.modification_rationale_id, mr.modification_rationale_desc, ");
        selectPaymentDetails.append("pd.payment_type_id, pt.payment_type_desc, pd.payment_desc, ");
        selectPaymentDetails.append("pd.payment_method_id, pm.payment_method_desc, ");
        selectPaymentDetails.append("pa.first_name, pa.middle_name, pa.last_name, pa.address1, ");
        selectPaymentDetails.append("pa.address2, pa.city, pa.state_code, pa.zip, pa.country_code, ");
        selectPaymentDetails.append("state.state_name, country.country_name, pd.date_modified, pd.date_due, ");
        selectPaymentDetails.append("pd.charity_ind, pa.address3, pa.province, pd.total_amount, pd.installment_number, ");
        selectPaymentDetails.append("pd.invoice_number, pd.jira_issue_id, pdsrx.payment_status_reason_id ");
        selectPaymentDetails.append("FROM payment p, payment_detail pd, payment_status_lu s, ");
        selectPaymentDetails.append("modification_rationale_lu mr, payment_type_lu pt, payment_method_lu pm, ");
        selectPaymentDetails.append("OUTER payment_detail_status_reason_xref pdsrx, ");
        selectPaymentDetails.append("OUTER(payment_address pa, OUTER state, OUTER country) ");
        selectPaymentDetails.append("WHERE p.payment_id = " + paymentId + " ");
        selectPaymentDetails.append("AND pd.payment_detail_id = p.most_recent_detail_id ");
        selectPaymentDetails.append("AND pt.payment_type_id = pd.payment_type_id ");
        selectPaymentDetails.append("AND pm.payment_method_id = pd.payment_method_id ");
        selectPaymentDetails.append("AND pa.payment_address_id = pd.payment_address_id ");
        selectPaymentDetails.append("AND s.payment_status_id = pd.payment_status_id ");
        selectPaymentDetails.append("AND mr.modification_rationale_id = pd.modification_rationale_id ");
        selectPaymentDetails.append("AND state.state_code = pa.state_code ");
        selectPaymentDetails.append("AND country.country_code = pa.country_code ");
        selectPaymentDetails.append("AND pdsrx.payment_detail_id = pd.payment_detail_id ");

        return doPayment(paymentId, selectPaymentDetails.toString());
    }


    /**
     * Returns the complete audit trail for the payment specified by the given payment ID.
     * Data returned will include the payment header, all payment detail records (with print
     * addresses, if applicable), and the current coder address. <p>
     *
     * @param paymentId The ID of the payment to retrieve.
     * @return The payment audit trail data.
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map getPaymentAuditTrail(long paymentId) throws SQLException {
        StringBuffer selectPaymentDetails = new StringBuffer(300);
        selectPaymentDetails.append("SELECT pd.payment_detail_id, pd.net_amount, pd.gross_amount, ");
        selectPaymentDetails.append("pd.date_paid, pd.payment_status_id, s.payment_status_desc, ");
        selectPaymentDetails.append("pd.modification_rationale_id, mr.modification_rationale_desc, ");
        selectPaymentDetails.append("pd.payment_type_id, pt.payment_type_desc, pd.payment_desc, ");
        selectPaymentDetails.append("pd.payment_method_id, pm.payment_method_desc, ");
        selectPaymentDetails.append("pa.first_name, pa.middle_name, pa.last_name, pa.address1, ");
        selectPaymentDetails.append("pa.address2, pa.city, pa.state_code, pa.zip, pa.country_code, ");
        selectPaymentDetails.append("state.state_name, country.country_name, pd.create_date as modify_date, pd.date_due, ");
        selectPaymentDetails.append("pd.charity_ind, pa.address3, pa.province, pd.total_amount, pd.installment_number, ");
        selectPaymentDetails.append("pd.invoice_number, pd.jira_issue_id, cu.handle as create_user_handle ");
        selectPaymentDetails.append("FROM payment p, payment_detail_xref pdx, payment_detail pd, ");
        selectPaymentDetails.append("payment_status_lu s, modification_rationale_lu mr, payment_type_lu pt, payment_method_lu pm, ");
        selectPaymentDetails.append("OUTER(payment_address pa, OUTER state, OUTER country), outer user cu ");
        selectPaymentDetails.append("WHERE p.payment_id = " + paymentId + " ");
        selectPaymentDetails.append("AND pdx.payment_id = p.payment_id ");
        selectPaymentDetails.append("AND pd.payment_detail_id = pdx.payment_detail_id ");
        selectPaymentDetails.append("AND pt.payment_type_id = pd.payment_type_id ");
        selectPaymentDetails.append("AND pm.payment_method_id = pd.payment_method_id ");
        selectPaymentDetails.append("AND pa.payment_address_id = pd.payment_address_id ");
        selectPaymentDetails.append("AND s.payment_status_id = pd.payment_status_id ");
        selectPaymentDetails.append("AND mr.modification_rationale_id = pd.modification_rationale_id ");
        selectPaymentDetails.append("AND state.state_code = pa.state_code ");
        selectPaymentDetails.append("AND country.country_code = pa.country_code ");
        selectPaymentDetails.append("AND cu.user_id = pd.create_user ");
        selectPaymentDetails.append("ORDER BY 1");

        return doPayment(paymentId, selectPaymentDetails.toString());
    }

    // Helper function to retrieve payment information
    private Map doPayment(long paymentId, String detailsQuery) throws SQLException {
        log.debug("dopayment(long, String) called...");
        StringBuffer selectPaymentHeader = new StringBuffer(300);
        selectPaymentHeader.append("SELECT p.payment_id, pd.payment_desc, pd.payment_type_id, p.create_date, pd.create_date as modify_date, ");
        selectPaymentHeader.append("pt.payment_type_desc, pd.payment_method_id, pm.payment_method_desc, ");
        selectPaymentHeader.append("pd.net_amount, pd.payment_status_id, s.payment_status_desc, ");
        selectPaymentHeader.append("p.user_id, u.handle, pd.date_modified, pd.gross_amount, pd.client, ");
        selectPaymentHeader.append("pd.algorithm_round_id, pd.component_project_id, pd.algorithm_problem_id, ");
        selectPaymentHeader.append("pd.studio_contest_id, pd.component_contest_id, pd.digital_run_stage_id, 0 as payment_status_reason_id, ");
        selectPaymentHeader.append("pd.digital_run_season_id, pd.parent_payment_id, pd.total_amount, pd.installment_number, pd.digital_run_track_id, ");
        selectPaymentHeader.append("pd.invoice_number, pd.jira_issue_id ");
        selectPaymentHeader.append("FROM payment p, payment_type_lu pt, payment_method_lu pm, payment_detail pd, ");
        selectPaymentHeader.append("payment_status_lu s, user u ");
        selectPaymentHeader.append("WHERE p.payment_id = " + paymentId + " ");
        selectPaymentHeader.append("AND p.most_recent_detail_id = pd.payment_detail_id ");
        selectPaymentHeader.append("AND pt.payment_type_id = pd.payment_type_id ");
        selectPaymentHeader.append("AND pm.payment_method_id = pd.payment_method_id ");
        selectPaymentHeader.append("AND s.payment_status_id = pd.payment_status_id ");
        selectPaymentHeader.append("AND p.user_id = u.user_id");

        Connection c = null;
        try {
            c = DBMS.getConnection();
            ResultSetContainer rsc = runSelectQuery(c, selectPaymentHeader.toString());
            if (rsc.getRowCount() == 0) {
                throw new NoObjectFoundException("Payment " + paymentId + " not found");
            }
            long userId = Long.parseLong(rsc.getItem(0, "user_id").toString());

            HashMap hm = new HashMap();
            hm.put(PAYMENT_HEADER_LIST, rsc);

            rsc = runSelectQuery(c, detailsQuery);
            hm.put(PAYMENT_DETAIL_LIST, rsc);

            StringBuffer selectCoderAddress = new StringBuffer(300);
            selectCoderAddress.append("SELECT a.country_code, a.zip, a.state_code, a.city, ");
            selectCoderAddress.append("a.address1, a.address2, u.first_name, u.middle_name, ");
            selectCoderAddress.append("u.last_name, state.state_name, country.country_name, a.address3, a.province ");
            selectCoderAddress.append("FROM coder c, address a, user_address_xref x, OUTER state, OUTER country, user u ");
            selectCoderAddress.append("WHERE c.coder_id = " + userId + " ");
            selectCoderAddress.append("AND state.state_code = a.state_code ");
            selectCoderAddress.append("and x.user_id = c.coder_id and x.address_id = a.address_id ");
            selectCoderAddress.append("and a.address_type_id = 2 ");
            selectCoderAddress.append("and u.user_id = c.coder_id ");
            selectCoderAddress.append("AND country.country_code = a.country_code");

            rsc = runSelectQuery(c, selectCoderAddress.toString());
            hm.put(CURRENT_CODER_ADDRESS, rsc);

            c.close();
            c = null;
            return hm;
        } catch (Exception e) {
            printException(e);
            try {
                if (c != null) c.close();
            } catch (Exception e1) {
                printException(e1);
            }
            c = null;
            throw new SQLException(e.getMessage());
        }
    }

    /**
     * Returns the user profile corresponding to the given user ID.  <p>
     *
     * @param userId The user ID for which to retrieve the user profile.
     * @return The user profile data.
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map getUserProfile(long userId) throws SQLException {
        StringBuffer selectDetails = new StringBuffer(300);
        selectDetails.append("SELECT e.address as email, p.phone_number as work_phone, p.phone_number as home_phone, a.country_code, a.zip, ");
        selectDetails.append("a.state_code, a.city, a.address1, a.address2, u.first_name, u.middle_name, ");
        selectDetails.append("u.last_name, state.state_name, country.country_name, ");
        selectDetails.append("c.coder_type_id, ct.coder_type_desc, s.user_status_desc, a.address3, a.province ");
        selectDetails.append("FROM coder c, user u, email e, coder_type ct, OUTER state, OUTER country, outer phone p, address a, user_address_xref x, user_status_lu s ");
        selectDetails.append("WHERE c.coder_id = " + userId + " ");
        selectDetails.append("AND u.user_id = " + userId + " ");
        selectDetails.append("AND u.user_id = e.user_id ");
        selectDetails.append("AND u.status = s.user_status_id ");
        selectDetails.append("AND e.primary_ind = 1 ");
        selectDetails.append("and p.user_id = u.user_id ");
        selectDetails.append("and p.primary_ind = 1 ");
        selectDetails.append("and x.user_id = u.user_id ");
        selectDetails.append("and x.address_id = a.address_id ");
        selectDetails.append("and a.address_type_id = 2 ");
        selectDetails.append("AND ct.coder_type_id = c.coder_type_id ");
        selectDetails.append("AND state.state_code = a.state_code ");
        selectDetails.append("AND country.country_code = a.country_code ");

        Connection c = null;
        try {
            c = DBMS.getConnection();
            HashMap hm = new HashMap();
            hm.putAll(getUserProfileHeader(c, userId));

            ResultSetContainer rsc = runSelectQuery(c, selectDetails.toString());
            hm.put(USER_PROFILE_DETAIL, rsc);
            c.close();
            c = null;
            return hm;
        } catch (Exception e) {
            printException(e);
            try {
                if (c != null) c.close();
            } catch (Exception e1) {
                printException(e1);
            }
            c = null;
            throw new SQLException(e.getMessage());
        }
    }

    /**
     * Returns the user profile header corresponding to the given user ID.  <p>
     *
     * @param userId The user ID for which to retrieve the user profile header.
     * @return The user profile header data.
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map getUserProfileHeader(long userId) throws SQLException {
        Connection c = null;
        try {
            c = DBMS.getConnection();
            Map m = getUserProfileHeader(c, userId);
            c.close();
            c = null;
            return m;
        } catch (Exception e) {
            printException(e);
            try {
                if (c != null) c.close();
            } catch (Exception e1) {
                printException(e1);
            }
            c = null;
            throw new SQLException(e.getMessage());
        }
    }

    // Helper function to get the user profile header given a connection and user Id.
    private Map getUserProfileHeader(Connection c, long userId) throws SQLException {
        StringBuffer selectHeader = new StringBuffer(300);
        selectHeader.append("SELECT u.user_id, u.handle, u.first_name, u.middle_name, u.last_name, ");
        selectHeader.append("nvl(ua.accrual_amount,"+MINIMUM_PAYMENT_ACCRUAL_AMOUNT+") as accrual_amount, ");
        selectHeader.append("pml.payment_method_desc as payment_method ");
        selectHeader.append("FROM user u ");
        selectHeader.append("LEFT OUTER JOIN user_accrual ua ON u.user_id = ua.user_id ");
        selectHeader.append("LEFT OUTER JOIN user_payment_method upm ON u.user_id = upm.user_id ");
        selectHeader.append("INNER JOIN payment_method_lu pml ON pml.payment_method_id = nvl(upm.payment_method_id, "+NOT_SET_PAYMENT_METHOD_ID+") ");
        selectHeader.append("WHERE u.user_id = " + userId + " ");

        StringBuffer selectGroups = new StringBuffer(300);
        selectGroups.append("SELECT group_id FROM group_user ");
        selectGroups.append("WHERE user_id = " + userId + " ");

        String queries[] = new String[2];
        queries[0] = selectHeader.toString();
        queries[1] = selectGroups.toString();

        ResultSetContainer rsc[] = runSelectQuery(c, queries);
        HashMap hm = new HashMap();
        hm.put(USER_PROFILE_HEADER_LIST, rsc[0]);
        hm.put(USER_GROUP_LIST, rsc[1]);

        return hm;
    }

    /**
     * Returns the generic tax form specified by the given tax form ID.  <p>
     *
     * @param taxFormId The ID of the generic tax form to retrieve.
     * @return The tax form data.
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map getTaxForm(long taxFormId) throws SQLException {
        StringBuffer selectTaxForm = new StringBuffer(300);
        selectTaxForm.append("SELECT tf.name, tf.tax_form_id, tf.status_id, tf.tax_form_desc, ");
        selectTaxForm.append("tf.default_withholding_amount, tf.default_withholding_percentage, ");
        selectTaxForm.append("s.status_desc, tf.use_percentage AS default_use_percentage ");
        selectTaxForm.append("FROM tax_form tf, status_lu s ");
        selectTaxForm.append("WHERE tf.tax_form_id = " + taxFormId + " ");
        selectTaxForm.append("AND s.status_id = tf.status_id");

        ResultSetContainer rsc = runSelectQuery(selectTaxForm.toString());
        HashMap hm = new HashMap();
        hm.put(TAX_FORM_LIST, rsc);
        return hm;
    }

    /**
     * Returns the user-specific tax form specified by the given tax form ID.  <p>
     *
     * @param userId    The user ID of the tax form to retrieve.
     * @param taxFormId The tax form ID of the tax form to retrieve.
     * @return The tax form data.
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map getUserTaxForm(long userId, long taxFormId) throws SQLException {
        StringBuffer selectHeader = new StringBuffer(300);
        selectHeader.append("SELECT utf.tax_form_id, utf.status_id, utf.date_filed, utf.user_id, ");
        selectHeader.append("s.status_desc, u.handle, tf.name ");
        selectHeader.append("FROM user_tax_form_xref utf, tax_form tf, status_lu s, user u ");
        selectHeader.append("WHERE utf.tax_form_id = " + taxFormId + " ");
        selectHeader.append("AND utf.user_id = " + userId + " ");
        selectHeader.append("AND tf.tax_form_id = " + taxFormId + " ");
        selectHeader.append("AND s.status_id = utf.status_id ");
        selectHeader.append("AND utf.user_id = u.user_id");

        StringBuffer selectDetails = new StringBuffer(300);
        selectDetails.append("SELECT utf.withholding_amount, utf.withholding_percentage, tf.status_id, ");
        selectDetails.append("tf.default_withholding_amount, tf.default_withholding_percentage, ");
        selectDetails.append("tf.tax_form_desc, s.status_desc, utf.use_percentage, tf.use_percentage AS default_use_percentage ");
        selectDetails.append("FROM user_tax_form_xref utf, tax_form tf, status_lu s ");
        selectDetails.append("WHERE utf.tax_form_id = " + taxFormId + " ");
        selectDetails.append("AND utf.user_id = " + userId + " ");
        selectDetails.append("AND tf.tax_form_id = " + taxFormId + " ");
        selectDetails.append("AND s.status_id = tf.status_id ");

        String queries[] = new String[2];
        queries[0] = selectHeader.toString();
        queries[1] = selectDetails.toString();

        ResultSetContainer rsc[] = runSelectQuery(queries);
        HashMap hm = new HashMap();
        hm.put(USER_TAX_FORM_HEADER_LIST, rsc[0]);
        hm.put(USER_TAX_FORM_DETAIL, rsc[1]);

        return hm;
    }

    /*****************************************************
     * Subobject retrieval functions
     *****************************************************/

    /**
     * Returns the list of affidavits for the given user.
     *
     * @param userId The coder ID of the affidavits.
     * @return The affidavit header list.
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map getUserAffidavitList(long userId) throws SQLException {
        StringBuffer selectAffidavitHeaders = new StringBuffer(300);
        // New version which sorts by a combination time field which is round start time
        // if the affidavit is associated with a contest, and the affidavit creation date
        // otherwise.  Also gets affidavit description.
        selectAffidavitHeaders.append("SELECT a.affidavit_id, a.status_id, s.status_desc, a.user_id, ");
        selectAffidavitHeaders.append("a.notarized, a.affirmed, a.date_created, u.handle, ");
        selectAffidavitHeaders.append("a.affidavit_type_id, atl.affidavit_type_desc, a.affidavit_desc, ");
        selectAffidavitHeaders.append("NVL(rs.start_time, a.date_created) AS origin_date ");
        selectAffidavitHeaders.append("FROM affidavit a, status_lu s, user u, affidavit_type_lu atl, ");
        selectAffidavitHeaders.append("OUTER round_segment rs ");
        selectAffidavitHeaders.append("WHERE a.user_id = " + userId + " ");
        selectAffidavitHeaders.append("AND u.user_id = " + userId + " ");
        selectAffidavitHeaders.append("AND a.affidavit_type_id = atl.affidavit_type_id ");
        selectAffidavitHeaders.append("AND a.status_id = s.status_id ");
        selectAffidavitHeaders.append("AND a.status_id in (57,58,59) ");
        selectAffidavitHeaders.append("AND a.round_id = rs.round_id ");
        selectAffidavitHeaders.append("AND a.date_created > mdy(1,1,2005) "); //don't bother with old stuff, people just get confused.
        selectAffidavitHeaders.append("AND rs.segment_id = ");
        selectAffidavitHeaders.append("  (SELECT MIN(segment_id) FROM round_segment ");
        selectAffidavitHeaders.append("   WHERE round_id=a.round_id)");
        selectAffidavitHeaders.append("ORDER BY origin_date DESC");

        ResultSetContainer rsc = runSelectQuery(selectAffidavitHeaders.toString());
        HashMap hm = new HashMap();
        hm.put(AFFIDAVIT_HEADER_LIST, rsc);
        return hm;
    }

    /**
     * Returns the list of contracts for the given user.
     *
     * @param userId The contracted user ID of the contracts.
     * @return The contract header list.
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map getUserContractList(long userId) throws SQLException {
        StringBuffer selectContractHeaders = new StringBuffer(300);
        selectContractHeaders.append("SELECT c.contract_id, c.creation_date, c.status_id, s.status_desc, ");
        selectContractHeaders.append("c.contracted_user_id, u.handle, c.name, c.contract_type_id, ");
        selectContractHeaders.append("ct.contract_type_desc ");
        selectContractHeaders.append("FROM contract c, status_lu s, user u, contract_type_lu ct ");
        selectContractHeaders.append("WHERE c.contracted_user_id = " + userId + " ");
        selectContractHeaders.append("AND u.user_id = " + userId + " ");
        selectContractHeaders.append("AND c.status_id = s.status_id ");
        selectContractHeaders.append("AND ct.contract_type_id = c.contract_type_id ");
        selectContractHeaders.append("ORDER BY 1");

        ResultSetContainer rsc = runSelectQuery(selectContractHeaders.toString());
        HashMap hm = new HashMap();
        hm.put(CONTRACT_HEADER_LIST, rsc);
        return hm;
    }

    /**
     * Returns the list of payments to the given user.
     *
     * @param userId The coder ID of the payments.
     * @return The payment header list.
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map getUserPaymentList(long userId) throws SQLException {
        StringBuffer selectPaymentHeaders = new StringBuffer(300);
        selectPaymentHeaders.append("SELECT p.payment_id, pd.payment_desc, pd.payment_type_id, pd.payment_method_id,  p.create_date, pd.create_date as modify_date, ");
        selectPaymentHeaders.append("pt.payment_type_desc, pm.payment_method_desc, pd.net_amount, pd.payment_status_id, s.payment_status_desc, ");
        selectPaymentHeaders.append("p.user_id, u.handle, pd.date_modified, pd.gross_amount, pd.client, ");
        selectPaymentHeaders.append("pd.algorithm_round_id, pd.component_project_id, pd.algorithm_problem_id, ");
        selectPaymentHeaders.append("pd.studio_contest_id, pd.component_contest_id, pd.digital_run_stage_id, ");
        selectPaymentHeaders.append("pd.digital_run_season_id, pd.parent_payment_id, pd.total_amount, pd.installment_number, pd.digital_run_track_id, pd.invoice_number ");
        selectPaymentHeaders.append("FROM payment p, payment_type_lu pt, payment_method_lu pm, payment_detail pd, ");
        selectPaymentHeaders.append("payment_status_lu s, user u ");
        selectPaymentHeaders.append("WHERE p.user_id = " + userId + " ");
        selectPaymentHeaders.append("AND u.user_id = " + userId + " ");
        selectPaymentHeaders.append("AND p.most_recent_detail_id = pd.payment_detail_id ");
        selectPaymentHeaders.append("AND pt.payment_type_id = pd.payment_type_id ");
        selectPaymentHeaders.append("AND pm.payment_method_id = pd.payment_method_id ");
        selectPaymentHeaders.append("AND s.payment_status_id = pd.payment_status_id ");
        selectPaymentHeaders.append("ORDER BY 1");

        ResultSetContainer rsc = runSelectQuery(selectPaymentHeaders.toString());
        HashMap hm = new HashMap();
        hm.put(PAYMENT_HEADER_LIST, rsc);
        return hm;
    }

    /**
     * Returns the list of payment details of the given type(s) for the given user.
     *
     * @param userId       The coder ID of the payments.
     * @param paymentTypes The payment type(s) to filter on.
     * @param pendingOnly  True if only details which are pending, owed, or on hold should be returned.
     * @return The payment header list.
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map getUserPaymentDetailsList(long userId, int[] paymentTypes, boolean pendingOnly) throws SQLException {
        String paymentTypeList = makeList(paymentTypes);
        StringBuffer selectPaymentDetails = new StringBuffer(300);
        selectPaymentDetails.append("SELECT p.payment_id, pd.payment_detail_id, pd.net_amount, pd.gross_amount, ");
        selectPaymentDetails.append("pd.date_paid, pd.payment_status_id, s.payment_status_desc, ");
        selectPaymentDetails.append("pd.modification_rationale_id, mr.modification_rationale_desc, ");
        selectPaymentDetails.append("pd.payment_type_id, pt.payment_type_desc, pd.payment_desc, ");
        selectPaymentDetails.append("pd.payment_method_id, pm.payment_method_desc, ");
        selectPaymentDetails.append("pa.first_name, pa.middle_name, pa.last_name, pa.address1, ");
        selectPaymentDetails.append("pa.address2, pa.city, pa.state_code, pa.zip, pa.country_code, ");
        selectPaymentDetails.append("state.state_name, country.country_name, pd.create_date as modify_date, pd.date_due, ");
        selectPaymentDetails.append("pd.charity_ind, pa.address3, pa.province, pd.total_amount, pd.installment_number, pd.invoice_number ");
        selectPaymentDetails.append("FROM payment p, payment_detail pd, payment_status_lu s, ");
        selectPaymentDetails.append("modification_rationale_lu mr, payment_type_lu pt, payment_method_lu pm, ");
        selectPaymentDetails.append("OUTER(payment_address pa, OUTER state, OUTER country) ");
        selectPaymentDetails.append("WHERE p.user_id = " + userId + " ");

        // if no elements, don't filter.
        if (paymentTypes.length > 0) {
            selectPaymentDetails.append("AND pd.payment_type_id IN (" + paymentTypeList + ") ");
        }

        selectPaymentDetails.append("AND pd.payment_detail_id = p.most_recent_detail_id ");
        selectPaymentDetails.append("AND pt.payment_type_id = pd.payment_type_id ");
        selectPaymentDetails.append("AND pm.payment_method_id = pd.payment_method_id ");
        selectPaymentDetails.append("AND pa.payment_address_id = pd.payment_address_id ");
        selectPaymentDetails.append("AND s.payment_status_id = pd.payment_status_id ");
        selectPaymentDetails.append("AND mr.modification_rationale_id = pd.modification_rationale_id ");
        selectPaymentDetails.append("AND state.state_code = pa.state_code ");
        selectPaymentDetails.append("AND country.country_code = pa.country_code ");

        if (pendingOnly) {
            selectPaymentDetails.append(" AND pd.payment_status_id IN (" +
                    PaymentStatus.ON_HOLD_PAYMENT_STATUS.getId() + "," +
                    PaymentStatus.OWED_PAYMENT_STATUS.getId() + "," +
                    PaymentStatus.ACCRUING_PAYMENT_STATUS.getId() + ")");
        }

        selectPaymentDetails.append("ORDER BY date_due DESC");

        return doUserPayments(userId, selectPaymentDetails.toString(), paymentTypes, pendingOnly);
    }

    //  Helper function to retrieve payment information for a given user.
    private Map doUserPayments(long userId, String detailsQuery, int[] paymentTypes, boolean pendingOnly) throws SQLException {
        String paymentTypeList = makeList(paymentTypes);
        StringBuffer selectPaymentHeaders = new StringBuffer(300);
        selectPaymentHeaders.append("SELECT p.payment_id, pd.payment_desc, pd.payment_type_id, p.create_date, pd.create_date as modify_date,  ");
        selectPaymentHeaders.append("pt.payment_type_desc, pd.payment_method_id, pm.payment_method_desc, ");
        selectPaymentHeaders.append("pd.net_amount, pd.payment_status_id, s.payment_status_desc, ");
        selectPaymentHeaders.append("p.user_id, u.handle, pd.date_modified, pd.gross_amount, pd.client, ");
        selectPaymentHeaders.append("pd.algorithm_round_id, pd.component_project_id, pd.algorithm_problem_id, ");
        selectPaymentHeaders.append("pd.studio_contest_id, pd.component_contest_id, pd.digital_run_stage_id, ");
        selectPaymentHeaders.append("pd.digital_run_season_id, pd.parent_payment_id, pd.total_amount, pd.installment_number, digital_run_track_id, pd.invoice_number ");
        selectPaymentHeaders.append("FROM payment p, payment_detail pd, payment_status_lu s, user u, ");
        selectPaymentHeaders.append("modification_rationale_lu mr, payment_type_lu pt, payment_method_lu pm, ");
        selectPaymentHeaders.append("OUTER(payment_address pa, OUTER state, OUTER country) ");
        selectPaymentHeaders.append("WHERE p.user_id = " + userId + " ");
        selectPaymentHeaders.append("AND p.user_id = u.user_id ");

        // if no elements, don't filter.
        if (paymentTypes.length > 0) {
            selectPaymentHeaders.append("AND pd.payment_type_id IN (" + paymentTypeList + ") ");
        }

        selectPaymentHeaders.append("AND pd.payment_detail_id = p.most_recent_detail_id ");
        selectPaymentHeaders.append("AND pt.payment_type_id = pd.payment_type_id ");
        selectPaymentHeaders.append("AND pm.payment_method_id = pd.payment_method_id ");
        selectPaymentHeaders.append("AND pa.payment_address_id = pd.payment_address_id ");
        selectPaymentHeaders.append("AND s.payment_status_id = pd.payment_status_id ");
        selectPaymentHeaders.append("AND mr.modification_rationale_id = pd.modification_rationale_id ");
        selectPaymentHeaders.append("AND state.state_code = pa.state_code ");
        selectPaymentHeaders.append("AND country.country_code = pa.country_code ");

        if (pendingOnly) {
            selectPaymentHeaders.append(" AND pd.payment_status_id IN (" +
                    PaymentStatus.ON_HOLD_PAYMENT_STATUS.getId() + "," +
                    PaymentStatus.OWED_PAYMENT_STATUS.getId() + "," +
                    PaymentStatus.ACCRUING_PAYMENT_STATUS.getId() + ")");
        }

        selectPaymentHeaders.append("ORDER BY date_due DESC");

        Connection c = null;
        try {
            c = DBMS.getConnection();
            ResultSetContainer rsc = runSelectQuery(c, selectPaymentHeaders.toString());

            HashMap hm = new HashMap();
            hm.put(PAYMENT_HEADER_LIST, rsc);

            rsc = runSelectQuery(c, detailsQuery);
            hm.put(PAYMENT_DETAIL_LIST, rsc);

            StringBuffer selectCoderAddress = new StringBuffer(300);
            selectCoderAddress.append("SELECT a.country_code, a.zip, a.state_code, a.city, ");
            selectCoderAddress.append("a.address1, a.address2, u.first_name, u.middle_name, ");
            selectCoderAddress.append("u.last_name, state.state_name, country.country_name, a.address3, a.province ");
            selectCoderAddress.append("FROM coder c, address a, user_address_xref x, OUTER state, OUTER country, user u ");
            selectCoderAddress.append("WHERE c.coder_id = " + userId + " ");
            selectCoderAddress.append("AND state.state_code = a.state_code ");
            selectCoderAddress.append("and x.user_id = c.coder_id and x.address_id = a.address_id ");
            selectCoderAddress.append("and a.address_type_id = 2 ");
            selectCoderAddress.append("and u.user_id = c.coder_id ");
            selectCoderAddress.append("AND country.country_code = a.country_code");

            rsc = runSelectQuery(c, selectCoderAddress.toString());
            hm.put(CURRENT_CODER_ADDRESS, rsc);

            c.close();
            c = null;
            return hm;
        } catch (Exception e) {
            printException(e);
            try {
                if (c != null) c.close();
            } catch (Exception e1) {
                printException(e1);
            }
            c = null;
            throw new SQLException(e.getMessage());
        }
    }

    /**
     * Returns the list of tax forms for the given user.
     *
     * @param userId The user ID of the tax forms.
     * @return The tax form header list.
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map getUserTaxFormList(long userId) throws SQLException {
        StringBuffer selectHeaders = new StringBuffer(300);
        selectHeaders.append("SELECT utf.tax_form_id, utf.status_id, utf.date_filed, utf.user_id, ");
        selectHeaders.append("s.status_desc, u.handle, tf.name ");
        selectHeaders.append("FROM user_tax_form_xref utf, tax_form tf, status_lu s, user u ");
        selectHeaders.append("WHERE utf.user_id = " + userId + " ");
        selectHeaders.append("AND u.user_id = " + userId + " ");
        selectHeaders.append("AND tf.tax_form_id = utf.tax_form_id ");
        selectHeaders.append("AND s.status_id = utf.status_id ");
        selectHeaders.append("ORDER BY 1");

        ResultSetContainer rsc = runSelectQuery(selectHeaders.toString());
        HashMap hm = new HashMap();
        hm.put(USER_TAX_FORM_HEADER_LIST, rsc);
        return hm;
    }

    /**
     * Returns the list of notes associated with the given object,
     * which can be an affidavit, contract, tax form, payment, or
     * user profile.
     *
     * @param objectId      The ID of the object.
     * @param objectType    The type of the object, as defined in
     *                      <tt>PactsConstants.java</tt>
     * @param taxFormUserId If the object is a tax form, the user ID of
     *                      the tax form.  This parameter is otherwise disregarded.
     * @return The note header list.
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map getNoteList(long objectId, int objectType, long taxFormUserId) throws SQLException {
        String tableName = "";
        String whereClause = "";
        if (objectType == AFFIDAVIT_OBJ) {
            tableName = "affidavit_note_xref xr";
            whereClause = "WHERE xr.affidavit_id = " + objectId;
        } else if (objectType == CONTRACT_OBJ) {
            tableName = "contract_note_xref xr";
            whereClause = "WHERE xr.contract_id = " + objectId;
        } else if (objectType == PAYMENT_OBJ) {
            tableName = "payment_note_xref xr";
            whereClause = "WHERE xr.payment_id = " + objectId;
        } else if (objectType == USER_PROFILE_OBJ) {
            tableName = "user_note_xref xr";
            whereClause = "WHERE xr.user_id = " + objectId;
        } else if (objectType == USER_TAX_FORM_OBJ) {
            tableName = "user_tax_form_note_xref xr";
            whereClause = "WHERE xr.tax_form_id = " + objectId + " AND xr.user_id = " + taxFormUserId;
        }

        StringBuffer selectNoteHeaders = new StringBuffer(300);
        selectNoteHeaders.append("SELECT n.note_id, n.create_date, n.note_type_id, nt.note_type_desc, ");
        selectNoteHeaders.append("n.submitted_by, u.handle ");
        selectNoteHeaders.append("FROM " + tableName + ", note n, note_type_lu nt, user u ");
        selectNoteHeaders.append(whereClause + " ");
        selectNoteHeaders.append("AND n.note_id = xr.note_id ");
        selectNoteHeaders.append("AND nt.note_type_id = n.note_type_id ");
        selectNoteHeaders.append("AND u.user_id = n.submitted_by ");
        selectNoteHeaders.append("ORDER BY 1");

        ResultSetContainer rsc = runSelectQuery(selectNoteHeaders.toString());
        HashMap hm = new HashMap();
        hm.put(NOTE_HEADER_LIST, rsc);
        return hm;
    }

    /**
     * Returns the list of payments associated with the given contract.
     *
     * @param contractId The contract ID of the payments.
     * @return The payment header list.
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map getContractPaymentList(long contractId) throws SQLException {
        StringBuffer selectPaymentHeaders = new StringBuffer(300);
        selectPaymentHeaders.append("SELECT p.payment_id, pd.payment_desc, pd.payment_type_id, pd.payment_method_id,  p.create_date, pd.create_date as modify_date, ");
        selectPaymentHeaders.append("pt.payment_type_desc, pm.payment_method_desc, pd.net_amount, pd.payment_status_id, s.payment_status_desc, ");
        selectPaymentHeaders.append("p.user_id, u.handle, pd.date_modified, pd.gross_amount, pd.client, ");
        selectPaymentHeaders.append("pd.algorithm_round_id, pd.component_project_id, pd.algorithm_problem_id, ");
        selectPaymentHeaders.append("pd.studio_contest_id, pd.component_contest_id, pd.digital_run_stage_id, ");
        selectPaymentHeaders.append("pd.digital_run_season_id, pd.parent_payment_id, pd.total_amount, pd.installment_number, pd.digital_run_track_id, pd.invoice_number ");
        selectPaymentHeaders.append("FROM contract_payment_xref cpx, payment p, payment_type_lu pt, payment_method_lu pm, ");
        selectPaymentHeaders.append("payment_detail pd, payment_status_lu s, user u ");
        selectPaymentHeaders.append("WHERE cpx.contract_id = " + contractId + " ");
        selectPaymentHeaders.append("AND cpx.payment_id = p.payment_id ");
        selectPaymentHeaders.append("AND p.most_recent_detail_id = pd.payment_detail_id ");
        selectPaymentHeaders.append("AND pt.payment_type_id = pd.payment_type_id ");
        selectPaymentHeaders.append("AND pm.payment_method_id = pd.payment_method_id ");
        selectPaymentHeaders.append("AND s.payment_status_id = pd.payment_status_id ");
        selectPaymentHeaders.append("AND p.user_id = u.user_id ");
        selectPaymentHeaders.append("ORDER BY 1");

        ResultSetContainer rsc = runSelectQuery(selectPaymentHeaders.toString());
        HashMap hm = new HashMap();
        hm.put(PAYMENT_HEADER_LIST, rsc);
        return hm;
    }

    /**
     * Returns the text of an affidavit, contract, note, or tax form.
     *
     * @param objectId   The ID of the object.
     * @param objectType The type of the object, as defined in
     *                   <tt>PactsConstants.java</tt>
     * @return The text associated with the object.
     * @throws SQLException If there is some problem retrieving the data
     */

    public Map getText(long objectId, int objectType) throws SQLException {
        String selectClause = "";
        if (objectType == AFFIDAVIT_OBJ) {
            selectClause = "SELECT text FROM affidavit WHERE affidavit_id = " + objectId;
        } else if (objectType == CONTRACT_OBJ) {
            selectClause = "SELECT text FROM contract WHERE contract_id = " + objectId;
        } else if (objectType == NOTE_OBJ) {
            selectClause = "SELECT text FROM note WHERE note_id = " + objectId;
        } else if (objectType == TAX_FORM_OBJ) {
            selectClause = "SELECT text FROM tax_form WHERE tax_form_id = " + objectId;
        }

        HashMap hm = new HashMap();
        Connection c = null;
        try {
            c = DBMS.getConnection(trxDataSource);
            // Get affidavit header
            ResultSetContainer rsc = runSelectQuery(c, selectClause);
            hm.put(TEXT, rsc);
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw (new EJBException(e.getMessage(), e));
        } catch (Exception e) {
            throw (new EJBException(e.getMessage(), e));
        } finally {
            close(c);
        }
        return hm;
    }

    /*****************************************************
     * Type listing retrieval functions
     *****************************************************/

    /**
     * Returns the list of all affidavit types.
     *
     * @return The list of affidavit types
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map getAffidavitTypes() throws SQLException {
        StringBuffer sb = new StringBuffer(300);
        sb.append("SELECT affidavit_type_id, affidavit_type_desc FROM affidavit_type_lu ORDER BY 2");

        ResultSetContainer rsc = runSelectQuery(sb.toString());
        HashMap hm = new HashMap();
        hm.put(AFFIDAVIT_TYPE_LIST, rsc);
        return hm;
    }

    /**
     * Returns the list of all assignment document types.
     *
     * @return The list of assignment document types
     * @throws SQLException If there is some problem retrieving the data
     */
    public List<AssignmentDocumentType> getAssignmentDocumentTypes() throws SQLException {
        List<AssignmentDocumentType> assignmentDocumentTypes = new ArrayList<AssignmentDocumentType>();
        StringBuffer sb = new StringBuffer(300);
        sb.append("SELECT assignment_document_type_id, assignment_document_type_desc FROM assignment_document_type_lu ORDER BY 2");

        ResultSetContainer rsc = runSelectQuery(sb.toString());

        for (Iterator it = rsc.iterator(); it.hasNext();) {
            ResultSetRow rsr = (ResultSetRow) it.next();

            AssignmentDocumentType adt = new AssignmentDocumentType();
            adt.setId(new Long(rsr.getLongItem("assignment_document_type_id")));
            adt.setDescription(rsr.getStringItem("assignment_document_type_desc"));

            assignmentDocumentTypes.add(adt);
        }

        return assignmentDocumentTypes;
    }


    /**
     * Returns the accrual threshold of a user
     *
	 * @param userId User ID
     * @return accrual threshold
     * @throws SQLException If there is some problem retrieving the data
     */
    public double getUserAccrualThreshold(long userId) throws SQLException {
        Connection conn = null;
        try {
            conn = DBMS.getConnection(trxDataSource);
            ResultSetContainer rsc = runSelectQuery(conn, "SELECT accrual_amount FROM user_accrual where user_id = " + userId);

            if (rsc.iterator().hasNext()) {
                return ((ResultSetRow) rsc.iterator().next()).getDoubleItem("accrual_amount");
            } else {
                return MINIMUM_PAYMENT_ACCRUAL_AMOUNT;
            }
        } finally {
            close(conn);
        }
    }

    /**
     */
    public void saveUserAccrualThreshold(long userId, double newAccrualAmount) {
        PreparedStatement ps = null;
        Connection c = null;

        // validate
        if (userId == 0) {
            throw new IllegalArgumentException("Invalid user ID");
        }

        if (newAccrualAmount < MINIMUM_PAYMENT_ACCRUAL_AMOUNT) {
            throw new IllegalArgumentException("Invalid accrual amount, should be greater or equal than "+MINIMUM_PAYMENT_ACCRUAL_AMOUNT);
        }

        // store
        boolean addOperation = true;
        try {
            c = DBMS.getConnection(trxDataSource);

            ResultSetContainer rsc = runSelectQuery(c, "SELECT accrual_amount FROM user_accrual where user_id = " + userId);

            if (rsc.iterator().hasNext()) {
                addOperation = false;
            }


            StringBuffer query = new StringBuffer(1024);
            if (addOperation) {
                // add
                query.append("insert into 'informix'.user_accrual( ");
                query.append("accrual_amount, ");
                query.append("user_id) ");
                query.append("values (?, ?)");
            } else {
                // update
                query.append("update 'informix'.user_accrual set ");
                query.append("accrual_amount = ? ");
                query.append("where user_id = ? ");
            }

            ps = c.prepareStatement(query.toString());
            ps.setDouble(1, newAccrualAmount);
            ps.setLong(2, userId);
            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw (new EJBException("Wrong number of rows updated in 'saveUserAccrualThreshold'. " +
                        "Updated " + rc + ", should have updated 1."));
            }

            // check total amount for currently accruing payments for this user
            double totalAmount = getUserAccruingPaymentsTotal(userId);
            log.debug("totalAmount: " + totalAmount);

            if (totalAmount >= newAccrualAmount) {
                // we have reached the amount, notify all accrual payments
                log.debug("need to notify all accruing payments");
                Map criteria = new HashMap();
                criteria.put(PactsConstants.USER_ID, String.valueOf(userId));
                criteria.put(PactsConstants.PAYMENT_STATUS_ID, String.valueOf(PaymentStatus.ACCRUING_PAYMENT_STATUS.getId()));

                List<BasePayment> payments = findCoderPayments(criteria);
                log.debug("need to notify " + payments.size() + " payments");

                // update each payment
                for (BasePayment notifyPayment : payments) {
                    notifyPayment.getCurrentStatus().accrualThresholdReached(notifyPayment);
                    updatePayment(notifyPayment);
                }
            }

        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw (new EJBException(e.getMessage(), e));
        } catch (Exception e) {
            throw (new EJBException(e.getMessage(), e));
        } finally {
            close(ps);
            close(c);
        }
    }

    /**
     * Returns the preferred payment method for a user.
     *
     * @param userId User ID	 
     * @return ID of the preferred payment method or null if not set
     * @throws SQLException If there is some problem retrieving the data
     */
    public Long getUserPaymentMethod(long userId) throws SQLException {
        Connection conn = null;
        try {
            conn = DBMS.getConnection(trxDataSource);
            ResultSetContainer rsc = runSelectQuery(conn, "SELECT payment_method_id FROM user_payment_method where user_id = " + userId);

            if (rsc.iterator().hasNext()) {
                return ((ResultSetRow) rsc.iterator().next()).getLongItem("payment_method_id");
            } else {
                return null;
            }
        } finally {
            close(conn);
        }
    }

    /**
     * Saves the preferred payment method for a user.
     *
     * @param userId User ID	 
     * @param paymentMethod ID of the preferred payment method.
     * @throws SQLException If there is some problem updating the data
     */
    public void saveUserPaymentMethod(long userId, long paymentMethodId) {
        if (userId == 0) {
            throw new IllegalArgumentException("Invalid user ID");
        }
		
        if (paymentMethodId <= 0) {
            throw new IllegalArgumentException("Invalid payment method ID.");
        }

        PreparedStatement insertPs = null, updatePs = null;
        Connection conn = null;
        try {
            conn = DBMS.getConnection(trxDataSource);

            updatePs = conn.prepareStatement("update 'informix'.user_payment_method set payment_method_id = '"+paymentMethodId+"' where user_id = "+userId);
            int updated = updatePs.executeUpdate();
            if (updated == 0) {
                insertPs = conn.prepareStatement("insert into 'informix'.user_payment_method(user_id, payment_method_id) values ("+userId+",'"+paymentMethodId+"')");
                insertPs.executeUpdate();
            } else if (updated > 1) {
                throw (new EJBException("Wrong number of rows updated in 'saveUserPaymentMethod'. " + "Updated " + updated + ", should have updated 1."));
            }

        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw (new EJBException(e.getMessage(), e));
        } catch (Exception e) {
            throw (new EJBException(e.getMessage(), e));
        } finally {
            close(updatePs);
            close(insertPs);
            close(conn);
        }
    }


    public Map<Long, BasePaymentStatus> getPaymentStatusMap() throws SQLException {
        Map<Long, BasePaymentStatus> statusMap = new HashMap<Long, BasePaymentStatus>();

        try {
            StringBuffer sb = new StringBuffer(300);
            sb.append("SELECT payment_status_id, payment_status_desc, payment_status_active_ind FROM payment_status_lu");

            ResultSetContainer rsc = runSelectQuery(sb.toString());

            for (Iterator it = rsc.iterator(); it.hasNext();) {
                ResultSetRow rsr = (ResultSetRow) it.next();

                String className = null;
                Long id = new Long(rsr.getLongItem("payment_status_id"));

                for (PaymentStatus availableStatus : PaymentStatus.values()) {
                    if (availableStatus.getId().equals(id)) {
                        className = availableStatus.getClassName();
                    }
                }

                Class c = Class.forName(className);
                BasePaymentStatus bps = (BasePaymentStatus) c.newInstance();

                bps.setDesc(rsr.getStringItem("payment_status_desc"));
                bps.setActive(rsr.getIntItem("payment_status_active_ind") == 1);

                log.debug("PaymentStatus found - id: " + id + " desc: " +
                        rsr.getStringItem("payment_status_desc") + " active: " +
                        rsr.getIntItem("payment_status_active_ind"));


                statusMap.put(id, bps);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new SQLException(e.getMessage());
        }

        return statusMap;
    }


    /**
     * Returns the accruing payments total of a user
     *
     * @return accruing total
     * @throws SQLException If there is some problem retrieving the data
     */
    public double getUserAccruingPaymentsTotal(long userId) throws SQLException {
        Connection conn = null;
        try {
            conn = DBMS.getConnection(trxDataSource);
            StringBuffer sb = new StringBuffer(300);

            sb.append(" select nvl(sum(pd.net_amount), 0) as total from payment p, payment_detail pd where ");
            sb.append(" p.most_recent_detail_id = pd.payment_detail_id ");
            sb.append(" and p.user_id = " + userId);
            sb.append(" and (pd.payment_status_id = " + PaymentStatus.ACCRUING_PAYMENT_STATUS.getId());
            sb.append(" or (pd.payment_status_id = " + PaymentStatus.OWED_PAYMENT_STATUS.getId());
            sb.append(" and year(pd.date_modified) = year(current) and month(pd.date_modified) = month(current)))");

            ResultSetContainer rsc = runSelectQuery(conn, sb.toString());

            if (rsc.iterator().hasNext()) {
                return ((ResultSetRow) rsc.iterator().next()).getDoubleItem("total");
            } else {
                return 0;
            }
        } finally {
            close(conn);
        }
    }

    /**
     * Returns the list of all assignment document status.
     *
     * @return The list of assignment document status
     * @throws SQLException If there is some problem retrieving the data
     */
    public List getAssignmentDocumentStatus() throws SQLException {
        List assignmentDocumentStatus = new ArrayList();
        StringBuffer sb = new StringBuffer(300);
        sb.append("SELECT assignment_document_status_id, assignment_document_status_desc FROM assignment_document_status_lu ORDER BY 2");

        ResultSetContainer rsc = runSelectQuery(sb.toString());

        for (Iterator it = rsc.iterator(); it.hasNext();) {
            ResultSetRow rsr = (ResultSetRow) it.next();

            AssignmentDocumentType adt = new AssignmentDocumentType();
            adt.setId(new Long(rsr.getLongItem("assignment_document_status_id")));
            adt.setDescription(rsr.getStringItem("assignment_document_status_desc"));

            assignmentDocumentStatus.add(adt);
        }

        return assignmentDocumentStatus;
    }

    /**
     * Helper method to create the assignment document bean
     *
     * @param conn the connection to use
     * @param rs   the ResultSetRow retrieved
     * @return The Assignment Document bean
     * @throws SQLException If there is some problem retrieving the data
     */
    private AssignmentDocument createAssignmentDocumentBean(Connection conn, ResultSet rs) throws SQLException {
        AssignmentDocument ad = new AssignmentDocument();
        ad.setId(new Long(rs.getLong("assignment_document_id")));

        ad.setHardCopy(new Boolean(rs.getInt("assignment_document_hard_copy_ind") == 1));
        ad.setAffirmedDate(rs.getTimestamp("affirmed_date"));
        ad.setExpireDate(rs.getTimestamp("expire_date"));
        ad.setCreateDate(rs.getTimestamp("create_date"));
        ad.setModifyDate(rs.getTimestamp("modify_date"));

        UserProfileHeader user = new UserProfileHeader(getUserProfileHeader(conn, rs.getLong("user_id")));
        User u = new User();
        u.setId(new Long(user.getId()));
        u.setHandle(user.getHandle());
        ad.setUser(u);

        byte[] bytes = rs.getBytes("assignment_document_text");
        if (bytes == null)
            ad.setText("");
        else
            ad.setText(new String(bytes));

        ad.setSubmissionTitle(rs.getString("assignment_document_submission_title"));

        AssignmentDocumentType adt = new AssignmentDocumentType();
        adt.setId(new Long(rs.getLong("assignment_document_type_id")));
        adt.setDescription(rs.getString("assignment_document_type_desc"));
        ad.setType(adt);

        AssignmentDocumentStatus ads = new AssignmentDocumentStatus();
        ads.setId(new Long(rs.getLong("assignment_document_status_id")));
        ads.setDescription(rs.getString("assignment_document_status_desc"));
        ad.setStatus(ads);

        if (rs.getObject("component_project_id") != null) {
            ComponentProject cp = findComponentProjectById(rs.getLong("component_project_id"));
            ad.setComponentProject(cp);
        }
        if (rs.getObject("studio_contest_id") != null) {
            StudioContest c = findStudioContestsById(rs.getLong("studio_contest_id"));
            ad.setStudioContest(c);
        }

        return ad;
    }

    /**
     * Helper method to create the SQL select to find assignment document
     *
     * @return The SQL select to find assignment document
     */
    private StringBuffer getAssignmentDocumentSelect() {
        StringBuffer sb = new StringBuffer(100);
        sb.append("select ");
        sb.append("ad.assignment_document_id , ");
        sb.append("ad.assignment_document_type_id , ");
        sb.append("adt.assignment_document_type_desc , ");
        sb.append("ad.assignment_document_status_id , ");
        sb.append("ads.assignment_document_status_desc , ");
        sb.append("ad.assignment_document_text , ");
        sb.append("ad.assignment_document_hard_copy_ind , ");
        sb.append("ad.assignment_document_submission_title , ");
        sb.append("ad.user_id , ");
        sb.append("ad.studio_contest_id , ");
        sb.append("ad.component_project_id , ");
        sb.append("ad.affirmed_date, ");
        sb.append("ad.expire_date, ");
        sb.append("ad.create_date , ");
        sb.append("ad.modify_date ");
        sb.append("from 'informix'.assignment_document ad, 'informix'.assignment_document_type_lu adt, 'informix'.assignment_document_status_lu ads ");
        sb.append("where ad.assignment_document_type_id = adt.assignment_document_type_id ");
        sb.append("and ad.assignment_document_status_id = ads.assignment_document_status_id ");
        sb.append("and ad.assignment_document_status_id <> " + AssignmentDocumentStatus.DELETED_STATUS_ID + " ");
        return sb;
    }

    /**
     * Find assignment documents
     *
     * @param searchCriteria The map containing the search criteria
     * @return The list of assignment document status
     * @throws SQLException If there is some problem retrieving the data
     */
    public List findAssignmentDocument(Map searchCriteria) {
        ResultSet rs = null;
        List l = new ArrayList();
        Connection c = null;

        try {
            c = DBMS.getConnection(trxDataSource);

            StringBuffer getAssignmentDocument = getAssignmentDocumentSelect();

            ArrayList objects = new ArrayList();
            Iterator i = searchCriteria.keySet().iterator();
            while (i.hasNext()) {
                String key = (String) i.next();
                String value = ((String) searchCriteria.get(key)).toUpperCase();
                if (key.equals(HANDLE)) {
                    getAssignmentDocument.append("and ad.user_id in (select user_id from user where UPPER(handle_lower) like ?) ");
                    objects.add(value);
                } else if (key.equals(ASSIGNMENT_DOCUMENT_ID)) {
                    getAssignmentDocument.append("and ad.assignment_document_id = ? ");
                    objects.add(value);
                } else if (key.equals(USER_ID)) {
                    getAssignmentDocument.append("and ad.user_id = ? ");
                    objects.add(value);
                } else if (key.equals(SUBMISSION_TITLE)) {
                    getAssignmentDocument.append("and UPPER(ad.assignment_document_submission_title) like ? ");
                    objects.add(value);
                } else if (key.equals(TYPE)) {
                    getAssignmentDocument.append("and ad.assignment_document_type_id = ? ");
                    objects.add(value);
                } else if (key.equals(STATUS)) {
                    getAssignmentDocument.append("and ad.assignment_document_status_id = ? ");
                    objects.add(value);
                } else if (key.equals(HARD_COPY)) {
                    getAssignmentDocument.append("and ad.assignment_document_hard_copy_ind = ? ");
                    objects.add(value);
                } else if (key.equals(COMPONENT_PROJECT)) {
                    getAssignmentDocument.append("and ad.component_project_id = ? ");
                    objects.add(value);
                } else if (key.equals(STUDIO_CONTEST)) {
                    getAssignmentDocument.append("and ad.studio_contest_id = ? ");
                    objects.add(value);
                } else if (key.equals(EARLIEST_CREATION_DATE)) {
                    getAssignmentDocument.append(" AND ad.create_date >= ?");
                    objects.add(makeTimestamp(value, false, true));
                } else if (key.equals(LATEST_CREATION_DATE)) {
                    getAssignmentDocument.append(" AND ad.create_date <= ?");
                    objects.add(makeTimestamp(value, false, true));
                } else if (key.equals(EARLIEST_MODIFICATION_DATE)) {
                    getAssignmentDocument.append(" AND ad.modify_date <= ?");
                    objects.add(makeTimestamp(value, false, true));
                } else if (key.equals(LATEST_MODIFICATION_DATE)) {
                    getAssignmentDocument.append(" AND ad.modify_date <= ?");
                    objects.add(makeTimestamp(value, false, true));
                } else if (key.equals(EARLIEST_EXPIRE_DATE)) {
                    getAssignmentDocument.append(" AND ad.expire_date >= ?");
                    objects.add(makeTimestamp(value, false, true));
                } else if (key.equals(LATEST_EXPIRE_DATE)) {
                    getAssignmentDocument.append(" AND ad.expire_date <= ?");
                    objects.add(makeTimestamp(value, false, true));
                } else if (key.equals(EARLIEST_AFFIRM_DATE)) {
                    getAssignmentDocument.append(" AND ad.affirm_date <= ?");
                    objects.add(makeTimestamp(value, false, true));
                } else if (key.equals(LATEST_AFFIRM_DATE)) {
                    getAssignmentDocument.append(" AND ad.affirm_date <= ?");
                    objects.add(makeTimestamp(value, false, true));
                }
            }

            l = retrieveAssignmentDocuments(c, getAssignmentDocument.toString(), objects);

        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw (new EJBException(e.getMessage(), e));
        } catch (Exception e) {
            throw (new EJBException(e.getMessage(), e));
        } finally {
            close(rs);
            close(c);
        }
        return l;
    }

    /**
     * Gets a Assignment Document using its ID
     *
     * @param assignmentDocumentId the Assignment Document id to find
     * @return The Assignment Document
     * @throws SQLException If there is some problem retrieving the data
     */
    public AssignmentDocument getAssignmentDocument(long assignmentDocumentId) {
        log.debug("get the assignment document from the db: " + assignmentDocumentId);

        try {
            Map searchCriteria = new HashMap();

            searchCriteria.put(ASSIGNMENT_DOCUMENT_ID, String.valueOf(assignmentDocumentId));

            List result = findAssignmentDocument(searchCriteria);

            if (result.isEmpty()) {
                throw new IllegalUpdateException("Couldn't find an assigment document for id: " + assignmentDocumentId);
            }

            AssignmentDocument ad = (AssignmentDocument) result.get(0);
            return ad;
        } catch (Exception e) {
            throw (new EJBException(e.getMessage(), e));
        }
    }

    /**
     * Gets a list of Assignment Documents using its project id
     *
     * @param projectId the Assignment Document's project id to find
     * @return a List of Assignment Documents
     * @throws SQLException If there is some problem retrieving the data
     */
    public List getAssignmentDocumentByProjectId(long projectId) {
        log.debug("get the assignment document from the db (project_id = " + projectId + ")");

        try {
            Map searchCriteria = new HashMap();

            searchCriteria.put(COMPONENT_PROJECT, String.valueOf(projectId));
            searchCriteria.put(TYPE, String.valueOf(AssignmentDocumentType.COMPONENT_COMPETITION_TYPE_ID));

            return findAssignmentDocument(searchCriteria);
        } catch (Exception e) {
            throw (new EJBException(e.getMessage(), e));
        }
    }

    /**
     * Returns whether a user has a hard copy of an assignmet document
     *
     * @param userId                   the Assignment Document's user id to find
     * @param assignmentDocumentTypeId the Assignment Document's type id to find
     * @return true if the user has a hard copy assignment document
     * @throws SQLException If there is some problem retrieving the data
     */
    public Boolean hasHardCopyAssignmentDocumentByUserId(long userId, long assignmentDocumentTypeId) {
        log.debug("check if user has a hard copy assignment document (project_id)");

        try {
            Map searchCriteria = new HashMap();

            searchCriteria.put(USER_ID, String.valueOf(userId));
            searchCriteria.put(TYPE, String.valueOf(assignmentDocumentTypeId));
            searchCriteria.put(HARD_COPY, "1");

            return new Boolean(findAssignmentDocument(searchCriteria).size() > 0);
        } catch (Exception e) {
            throw (new EJBException(e.getMessage(), e));
        }
    }

    /**
     * Gets a list of Assignment Documents using its user id
     *
     * @param userId                   the Assignment Document's user id to find
     * @param assignmentDocumentTypeId the Assignment Document's type id to find
     * @return a List of Assignment Documents
     * @throws SQLException If there is some problem retrieving the data
     */
    public List getAssignmentDocumentByUserId(long userId, long assignmentDocumentTypeId, boolean onlyPending) {
        log.debug("get the assignment document from the db (user_id : " + userId + " / typeId : " + assignmentDocumentTypeId + ")");

        try {
            Map searchCriteria = new HashMap();
            searchCriteria.put(USER_ID, String.valueOf(userId));
            searchCriteria.put(TYPE, String.valueOf(assignmentDocumentTypeId));
            if (onlyPending) {
                searchCriteria.put(STATUS, String.valueOf(AssignmentDocumentStatus.PENDING_STATUS_ID));
            }

            return findAssignmentDocument(searchCriteria);
        } catch (Exception e) {
            throw (new EJBException(e.getMessage(), e));
        }
    }

    /**
     * Gets a list of Assignment Documents using its user id and project id
     *
     * @param userId    the Assignment Document's user id to find
     * @param projectId the Assignment Document's project id to find
     * @return a List of Assignment Documents
     * @throws SQLException If there is some problem retrieving the data
     */
    public List getAssignmentDocumentByUserIdProjectId(long userId, long projectId) {
        log.debug("get the assignment document from the db (user_id = " + userId + ", project_id = " + projectId + ")");

        try {
            Map searchCriteria = new HashMap();

            searchCriteria.put(COMPONENT_PROJECT, String.valueOf(projectId));
            searchCriteria.put(TYPE, String.valueOf(AssignmentDocumentType.COMPONENT_COMPETITION_TYPE_ID));
            searchCriteria.put(USER_ID, String.valueOf(userId));

            return findAssignmentDocument(searchCriteria);
        } catch (Exception e) {
            throw (new EJBException(e.getMessage(), e));
        }
    }


    /**
     * Gets a list of Assignment Documents using its user id and studio contest id
     *
     * @param userId          the Assignment Document's user id to find
     * @param studioContestId the studio contest to find
     * @return a List of Assignment Documents
     * @throws SQLException If there is some problem retrieving the data
     */
    public List getAssignmentDocumentByUserIdStudioContestId(long userId, long studioContestId) {
        log.debug("get the assignment document from the db (user_id = " + userId + ", studio_contest_id = " + studioContestId + ")");

        try {
            Map searchCriteria = new HashMap();

            searchCriteria.put(STUDIO_CONTEST, String.valueOf(studioContestId));
            searchCriteria.put(TYPE, String.valueOf(AssignmentDocumentType.STUDIO_CONTEST_TYPE_ID));
            searchCriteria.put(USER_ID, String.valueOf(userId));

            return findAssignmentDocument(searchCriteria);
        } catch (Exception e) {
            throw (new EJBException(e.getMessage(), e));
        }
    }

    /**
     * Gets the transformed text of an assignment document
     *
     * @param ad                       the Assignment Document to transform
     * @param assignmentDocumentTypeId the Assignment Document's type id
     * @return a List of Assignment Documents
     * @throws SQLException If there is some problem retrieving the data
     */
    public String getAssignmentDocumentTransformedText(long assignmentDocumentTypeId, AssignmentDocument ad) {
        AssignmentDocumentTemplate adt = getAssignmentDocumentTemplate(null, assignmentDocumentTypeId, true).get(0);

        return adt.transformTemplate(ad, prepareUserAssignmentDocumentInfo(ad.getUser().getId(), ad.getSubmissionTitle()));
    }

    public List<AssignmentDocumentTemplate> getAssignmentDocumentTemplate(long assignmentDocumentTypeId, boolean onlyCurrent) {
        return getAssignmentDocumentTemplate(null, assignmentDocumentTypeId, onlyCurrent);
    }

    /**
     * Returns an assignment document template
     *
     * @param conn                     the Connection to use
     * @param assignmentDocumentTypeId the Assignment Document's type id
     * @return The required assignment document template
     * @throws SQLException If there is some problem retrieving the data
     */
    public List<AssignmentDocumentTemplate> getAssignmentDocumentTemplate(Connection conn, long assignmentDocumentTypeId, boolean onlyCurrent) {
        boolean closeConnection = false;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ResultSetContainer rsc = null;
        List<AssignmentDocumentTemplate> adtl = new ArrayList<AssignmentDocumentTemplate>();

        try {
            if (conn == null) {
                closeConnection = true;
                conn = DBMS.getConnection();
            }

            log.debug("get the assignment document template from the db");

            StringBuffer sb = new StringBuffer(100);
            sb.append("select ");
            sb.append("assignment_document_template_id, ");
            sb.append("assignment_document_template_text, ");
            sb.append("assignment_document_template_name, ");
            sb.append("cur_version ");
            sb.append("from 'informix'.assignment_document_template ");
            sb.append("where assignment_document_type_id = ? ");
            if (onlyCurrent) {
                sb.append("and cur_version = 1 ");
            }
            sb.append("order by assignment_document_template_name ");

            ps = conn.prepareStatement(sb.toString());

            ps.setLong(1, assignmentDocumentTypeId);
            rs = ps.executeQuery();

            while (rs.next()) {
                AssignmentDocumentTemplate adt = new AssignmentDocumentTemplate();
                adt.setId(new Long(rs.getLong("assignment_document_template_id")));
                adt.setName(rs.getString("assignment_document_template_name"));

                byte[] bytes = rs.getBytes("assignment_document_template_text");
                if (bytes == null)
                    adt.setText("");
                else
                    adt.setText(new String(bytes));

                adt.setCurrent(rs.getBoolean("cur_version"));
                adtl.add(adt);
            }

            if (adtl.size() == 0) {
                throw new IllegalUpdateException("Couldn't find an assigment document type for id: " + assignmentDocumentTypeId);
            }

            return adtl;
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw (new EJBException(e.getMessage(), e));
        } catch (Exception e) {
            throw (new EJBException(e.getMessage(), e));
        } finally {
            close(rs);
            close(ps);
            if (closeConnection) {
                close(conn);
            }
        }
    }

    public AssignmentDocumentTemplate getAssignmentDocumentTemplate(long assignmentDocumentTemplateId) {
        return getAssignmentDocumentTemplate(null, assignmentDocumentTemplateId);
    }

    /**
     * Returns an assignment document template
     *
     * @param conn                     the Connection to use
     * @param assignmentDocumentTypeId the Assignment Document's type id
     * @return The required assignment document template
     * @throws SQLException If there is some problem retrieving the data
     */
    public AssignmentDocumentTemplate getAssignmentDocumentTemplate(Connection conn, long assignmentDocumentTemplateId) {
        boolean closeConnection = false;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ResultSetContainer rsc = null;

        try {
            if (conn == null) {
                closeConnection = true;
                conn = DBMS.getConnection();
            }

            log.debug("get the assignment document template from the db");

            StringBuffer sb = new StringBuffer(100);
            sb.append("select ");
            sb.append("assignment_document_template_id, ");
            sb.append("assignment_document_template_text, ");
            sb.append("assignment_document_template_name, ");
            sb.append("cur_version ");
            sb.append("from 'informix'.assignment_document_template ");
            sb.append("where assignment_document_template_id = ? ");

            ps = conn.prepareStatement(sb.toString());

            ps.setLong(1, assignmentDocumentTemplateId);
            rs = ps.executeQuery();

            if (!rs.next()) {
                throw new IllegalUpdateException("Couldn't find an assigment document template for id: " + assignmentDocumentTemplateId);
            }

            AssignmentDocumentTemplate adt = new AssignmentDocumentTemplate();
            adt.setId(new Long(rs.getLong("assignment_document_template_id")));
            adt.setName(rs.getString("assignment_document_template_name"));

            byte[] bytes = rs.getBytes("assignment_document_template_text");
            if (bytes == null)
                adt.setText("");
            else
                adt.setText(new String(bytes));

            adt.setCurrent(rs.getBoolean("cur_version"));

            return adt;
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw (new EJBException(e.getMessage(), e));
        } catch (Exception e) {
            throw (new EJBException(e.getMessage(), e));
        } finally {
            close(rs);
            close(ps);
            if (closeConnection) {
                close(conn);
            }
        }
    }

    public AssignmentDocument addAssignmentDocument(AssignmentDocument ad) throws DeleteAffirmedAssignmentDocumentException {
            return addAssignmentDocument(ad, null);
    }

    /**
     * Inserts or updates an assignment document to the DB
     *
     * @param ad the Assignment Document to store
     * @return The stored assignment document template
     * @throws DeleteAffirmedAssignmentDocumentException
     *          If there's an attempt to delete an affirmed assignment document
     */
    public AssignmentDocument addAssignmentDocument(AssignmentDocument ad, Long assignmentDocumentTemplateId) throws DeleteAffirmedAssignmentDocumentException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection c = null;

        boolean addOperation = false;
        if (ad.getId() == null) {
            addOperation = true;
        }

        // validate
        if (!ad.getType().getId().equals(AssignmentDocumentType.GLOBAL_TYPE_ID)) {
            if (ad.getSubmissionTitle() == null || ad.getSubmissionTitle().trim().length() == 0) {
                throw new IllegalArgumentException("Assignment Document's submission title cannot be null or empty");
            }
        }

        if (ad.getType() == null) {
            throw new IllegalArgumentException("Assignment Document's type cannot be null");
        }

        if (ad.getStatus() == null) {
            throw new IllegalArgumentException("Assignment Document's status cannot be null");
        }

        if (ad.isHardCopy() == null) {
            ad.setHardCopy(Boolean.FALSE);
        }

        Boolean hasHardCopy = hasHardCopyAssignmentDocumentByUserId(ad.getUser().getId().longValue(),
                ad.getType().getId().longValue());

        if (!ad.getType().getId().equals(AssignmentDocumentType.GLOBAL_TYPE_ID)) {
            if (ad.getExpireDate() == null) {
                Calendar dueDateCal = Calendar.getInstance();
                dueDateCal.add(Calendar.DAY_OF_YEAR, hasHardCopy.booleanValue() ? ASSIGNMENT_DOCUMENT_SHORT_EXPIRATION_PERIOD : ASSIGNMENT_DOCUMENT_LONG_EXPIRATION_PERIOD);
                ad.setExpireDate(new Timestamp(dueDateCal.getTimeInMillis()));
            }
        }

        if (ad.getStatus().getId().equals(AssignmentDocumentStatus.AFFIRMED_STATUS_ID) && ad.getAffirmedDate() == null) {
            Calendar dueDateCal = Calendar.getInstance();
            ad.setAffirmedDate(new Timestamp(dueDateCal.getTimeInMillis()));
        }

        if (ad.getUser() == null) {
            throw new IllegalArgumentException("Assignment Document's user cannot be null");
        }

        if (ad.getType().getId().equals(AssignmentDocumentType.COMPONENT_COMPETITION_TYPE_ID)) {
            if (ad.getComponentProject() == null) {
                throw new IllegalArgumentException("Assignment Document's component project cannot be null");
            } else {
                try {
                    findComponentProjectById(ad.getComponentProject().getId().longValue());
                } catch (Exception e) {
                    throw new IllegalArgumentException("Assignment Document's component project doesn't exists " + ad.getComponentProject());
                }
            }
        }

        if (ad.getType().getId().equals(AssignmentDocumentType.STUDIO_CONTEST_TYPE_ID)) {
            if (ad.getStudioContest() == null) {
                throw new IllegalArgumentException("Assignment Document's studio contest cannot be null");
            } else {
                try {
                    findStudioContestsById(ad.getStudioContest().getId().longValue());
                } catch (Exception e) {
                    throw new IllegalArgumentException("Assignment Document's studio contest doesn't exists: " +
                            ad.getStudioContest().getId().longValue());
                }
            }
        }

        // only update text if it's an addition or the AD is being affirmed.
        boolean updateText = false;
        // store
        try {
            c = DBMS.getConnection(trxDataSource);

            AssignmentDocument oldAssignmentDocumentInstance = null;
            if (ad.getId() != null) {
                // update
                oldAssignmentDocumentInstance = getAssignmentDocument(ad.getId().longValue());

                if (oldAssignmentDocumentInstance.getStatus().getId().equals(AssignmentDocumentStatus.AFFIRMED_STATUS_ID) &&
                        (ad.getStatus().getId().equals(AssignmentDocumentStatus.DELETED_STATUS_ID))) {
                    throw new DeleteAffirmedAssignmentDocumentException("Assignment Document cannot be deleted or rejected since it was affirmed");
                }

                if (!oldAssignmentDocumentInstance.getStatus().getId().equals(AssignmentDocumentStatus.AFFIRMED_STATUS_ID) &&
                        (ad.getStatus().getId().equals(AssignmentDocumentStatus.AFFIRMED_STATUS_ID))) {
                    // notify the payment status manager the new affirmed assignment document
                    if (!ad.getType().getId().equals(AssignmentDocumentType.GLOBAL_TYPE_ID)) {
                        (new PaymentStatusManager()).affirmedIPTransfer(ad);
                    } else {
                        (new PaymentStatusManager()).signedGlobalAD(ad.getUser().getId());
                    }
                }

                if (oldAssignmentDocumentInstance.getType().getId().equals(AssignmentDocumentType.GLOBAL_TYPE_ID) &&
                        !ad.getType().equals(oldAssignmentDocumentInstance.getType())) {
                    throw new IllegalArgumentException("Cannot change the type of a global assignment document");
                }

            }

            if (ad.getText() == null || ad.getText().trim().length() == 0) {
                // template is transformed if the ad is created with affirmed status
                // or the status is updated to affirmed. (and the text is empty)
                if ((ad.getStatus().getId().equals(AssignmentDocumentStatus.AFFIRMED_STATUS_ID) &&
                        (oldAssignmentDocumentInstance == null ||
                                !oldAssignmentDocumentInstance.getStatus().getId().equals(AssignmentDocumentStatus.AFFIRMED_STATUS_ID)))) {

                    AssignmentDocumentTemplate adt;
                    if (assignmentDocumentTemplateId != null) {
                        adt = getAssignmentDocumentTemplate(c, assignmentDocumentTemplateId);
                    } else {
                        adt = getAssignmentDocumentTemplate(c, ad.getType().getId().longValue(), true).get(0);
                    }
                    ad.setText(adt.transformTemplate(ad, prepareUserAssignmentDocumentInfo(ad.getUser().getId(), ad.getSubmissionTitle())));
                    updateText = true;

                    // for GADs, set the template name (GAD version) as the submission title
                    if (ad.getType().getId().equals(AssignmentDocumentType.GLOBAL_TYPE_ID)) {
                        ad.setSubmissionTitle(adt.getName());
                    }
                }
            }

            StringBuffer query = new StringBuffer(1024);
            if (addOperation) {
                // add
                query.append("insert into 'informix'.assignment_document( ");
                query.append("assignment_document_id , ");
                query.append("assignment_document_type_id , ");
                query.append("assignment_document_status_id , ");
                query.append("assignment_document_hard_copy_ind , ");
                query.append("assignment_document_submission_title , ");
                query.append("user_id , ");
                query.append("studio_contest_id , ");
                query.append("component_project_id , ");
                query.append("affirmed_date , ");
                query.append("assignment_document_text , ");
                query.append("expire_date , ");
                query.append("modify_date) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, current)");

                long assignmentDocumentId = IdGeneratorClient.getSeqId("ASSIGNMENT_DOCUMENT_SEQ");
                ad.setId(new Long(assignmentDocumentId));
            } else {
                // update
                query.append("update 'informix'.assignment_document set ");
                query.append("assignment_document_id = ?, ");
                query.append("assignment_document_type_id = ?, ");
                query.append("assignment_document_status_id = ?, ");
                query.append("assignment_document_hard_copy_ind = ?, ");
                query.append("assignment_document_submission_title = ?, ");
                query.append("user_id = ?, ");
                query.append("studio_contest_id = ?, ");
                query.append("component_project_id = ?, ");
                query.append("affirmed_date = ?, ");
                if (updateText) {
                    query.append("assignment_document_text = ?, ");
                }
                query.append("expire_date = ?, ");
                query.append("modify_date = current ");
                query.append("where assignment_document_id = ? ");
            }

            ps = c.prepareStatement(query.toString());
            ps.setLong(1, ad.getId().longValue());
            ps.setLong(2, ad.getType().getId().longValue());
            ps.setLong(3, ad.getStatus().getId().longValue());
            ps.setInt(4, (ad.isHardCopy() != null && ad.isHardCopy().booleanValue()) ? 1 : 0);
            ps.setString(5, ad.getSubmissionTitle());
            ps.setLong(6, ad.getUser().getId().longValue());
            ps.setObject(7, ad.getStudioContest() == null ? null : ad.getStudioContest().getId());
            ps.setObject(8, ad.getComponentProject() == null ? null : ad.getComponentProject().getId());
            ps.setTimestamp(9, ad.getAffirmedDate());
            if (addOperation || updateText) {
                ps.setBytes(10, ad.getText() == null ? null : DBMS.serializeTextString(ad.getText()));
                ps.setTimestamp(11, ad.getExpireDate());
                if (!addOperation) {
                    ps.setLong(12, ad.getId().longValue());
                }
            } else {
                ps.setTimestamp(10, ad.getExpireDate());
                if (!addOperation) {
                    ps.setLong(11, ad.getId().longValue());
                }
            }
            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw (new EJBException("Wrong number of rows updated in 'addAssignmentDocument'. " +
                        "Updated " + rc + ", should have updated 1."));
            }

            if (!hasHardCopy && ad.isHardCopy()) {
                (new PaymentStatusManager()).hardCopyIPTransfer(ad.getUser().getId(), ad.getComponentProject() == null ? TC_STUDIO_PAYMENT : COMPONENT_PAYMENT);
            }

            if (ad.getType().getId().equals(AssignmentDocumentType.GLOBAL_TYPE_ID)) {
                (new PaymentStatusManager()).signedGlobalAD(ad.getUser().getId());
            }

            return ad;
        } catch (IDGenerationException e) {
            ejbContext.setRollbackOnly();
            throw new EJBException(e);
        } catch (SQLException e) {
            ejbContext.setRollbackOnly();
            DBMS.printSqlException(true, e);
            throw (new EJBException(e.getMessage(), e));
        } catch (Exception e) {
            ejbContext.setRollbackOnly();
            throw (new EJBException(e.getMessage(), e));
        } finally {
            close(rs);
            close(ps);
            close(c);
        }
    }

    /**
     * Marks an assignment document as deleted
     *
     * @param ad the Assignment Document to store
     * @throws DeleteAffirmedAssignmentDocumentException
     *          If there's an attempt to delete an affirmed assignment document
     */
    public void deleteAssignmentDocument(AssignmentDocument ad) throws DeleteAffirmedAssignmentDocumentException {
        Connection conn = null;
        PreparedStatement ps = null;

        // validate
        if (ad.getId() == null) {
            throw new IllegalArgumentException("Assignment Document's id cannot be null");
        }

        try {
            ad = getAssignmentDocument(ad.getId().longValue());
        } catch (Exception e) {
            throw new IllegalArgumentException("Assignment document does not exists");
        }

        // deny the operation if the assignment document is affirmed.

        if (ad.getStatus().getId().equals(AssignmentDocumentStatus.AFFIRMED_STATUS_ID)) {
            throw new DeleteAffirmedAssignmentDocumentException("Cannot delete an affirmed Assignment Document");
        }

        // mark as deleted
        try {
            conn = DBMS.getConnection();

            StringBuffer query = new StringBuffer(1024);
            query.append("update 'informix'.assignment_document set ");
            query.append("assignment_document_status_id = ?, ");
            query.append("modify_date = current ");
            query.append("where assignment_document_id = ? ");

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, AssignmentDocumentStatus.DELETED_STATUS_ID.longValue());
            ps.setLong(2, ad.getId().longValue());

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw (new EJBException("Wrong number of rows updated in 'deleteAssignmentDocument'. " +
                        "Updated " + rc + ", should have updated 1."));
            }

        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw (new EJBException(e.getMessage(), e));
        } catch (Exception e) {
            throw (new EJBException(e.getMessage(), e));
        } finally {
            close(ps);
            close(conn);
        }
    }

    /**
     * Returns whether the user has already affirmed the corresponding Assignment Document
     *
     * @param paymentTypeId payment type to check for Assignment Document
     * @param coderId       coder to check for Assignment Document
     * @param referenceId   reference id to check for Assignment Document
     * @return whether the user has already affirmed the corresponding Assignment Document
     */
    public boolean hasAffirmedAssignmentDocument(long paymentTypeId, long coderId, long referenceId) {
        try {
            List assignmentDocuments = new ArrayList();

            if (paymentTypeId == TC_STUDIO_PAYMENT) {
                assignmentDocuments = getAssignmentDocumentByUserIdStudioContestId(coderId, referenceId);
            } else if (paymentTypeId == COMPONENT_PAYMENT) {
                assignmentDocuments = getAssignmentDocumentByUserIdProjectId(coderId, referenceId);
            }

            if (assignmentDocuments.size() == 0) {
                return false;
            }

            AssignmentDocument ad = (AssignmentDocument) assignmentDocuments.get(0);

            return (ad.getStatus().getId().equals(AssignmentDocumentStatus.AFFIRMED_STATUS_ID));
        } catch (Exception e) {
            return false;
        }
    }


    /**
     * Marks an assignment document as affirmed
     *
     * @param ad the Assignment Document to store
     * @throws DeleteAffirmedAssignmentDocumentException
     *          If there's an attempt to delete an affirmed assignment document
     */
    public void affirmAssignmentDocument(AssignmentDocument ad) {
        // validate
        if (ad.getId() == null) {
            throw new IllegalArgumentException("Assignment Document's id cannot be null");
        }

        try {
            ad = getAssignmentDocument(ad.getId().longValue());
        } catch (Exception e) {
            throw new IllegalArgumentException("Assignment document does not exists");
        }

        // deny the operation if the assignment document is affirmed.
        if (!ad.getStatus().getId().equals(AssignmentDocumentStatus.PENDING_STATUS_ID)) {
            throw new IllegalArgumentException("Assignment Document should be pending");
        }

        ad.setStatus(new AssignmentDocumentStatus(AssignmentDocumentStatus.AFFIRMED_STATUS_ID));
        ad.setAffirmedDate(null);

        try {
            addAssignmentDocument(ad);
        } catch (Exception e) {
            printException(e);
            ejbContext.setRollbackOnly();
            throw (new EJBException(e.getMessage(), e));
        }
    }

    /**
     * Returns the list of all contract types.
     *
     * @return The list of contract types
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map getContractTypes() throws SQLException {
        StringBuffer sb = new StringBuffer(300);
        sb.append("SELECT contract_type_id, contract_type_desc FROM contract_type_lu ORDER BY 2");

        ResultSetContainer rsc = runSelectQuery(sb.toString());
        HashMap hm = new HashMap();
        hm.put(CONTRACT_TYPE_LIST, rsc);
        return hm;
    }

    /**
     * Returns the list of all note types.
     *
     * @return The list of note types
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map getNoteTypes() throws SQLException {
        StringBuffer sb = new StringBuffer(300);
        sb.append("SELECT note_type_id, note_type_desc FROM note_type_lu ORDER BY 2");

        ResultSetContainer rsc = runSelectQuery(sb.toString());
        HashMap hm = new HashMap();
        hm.put(NOTE_TYPE_LIST, rsc);
        return hm;
    }

    /**
     * Returns the list of all payment types.
     *
     * @return The list of payment types
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map getPaymentTypes() throws SQLException {
        StringBuffer sb = new StringBuffer(300);
        sb.append("SELECT payment_type_id, payment_type_desc, payment_reference_id FROM payment_type_lu ORDER BY 2");
        ResultSetContainer rsc = runSelectQuery(sb.toString());
        HashMap hm = new HashMap();
        hm.put(PAYMENT_TYPE_LIST, rsc);
        return hm;
    }

    /**
     * Returns the list of all payment methods.
     *
     * @return The list of payment methods
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map getPaymentMethods() throws SQLException {
        StringBuffer sb = new StringBuffer(300);
        sb.append("SELECT payment_method_id, payment_method_desc FROM payment_method_lu ORDER BY payment_method_list_order, 2");
        ResultSetContainer rsc = runSelectQuery(sb.toString());
        HashMap hm = new HashMap();
        hm.put(PAYMENT_METHOD_LIST, rsc);
        return hm;
    }


    /**
     * Returns the list of all payment modification rationales.
     *
     * @return The list of rationales
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map getModificationRationales() throws SQLException {
        StringBuffer sb = new StringBuffer(300);
        sb.append("SELECT modification_rationale_id, modification_rationale_desc ");
        sb.append("FROM modification_rationale_lu ORDER BY 2");

        ResultSetContainer rsc = runSelectQuery(sb.toString());
        HashMap hm = new HashMap();
        hm.put(MODIFICATION_RATIONALE_LIST, rsc);
        return hm;
    }

    /**
     * Returns the list of all project termination status types.
     *
     * @return The list of project termination status types
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map getProjectTerminationStatusTypes() throws SQLException {
        StringBuffer sb = new StringBuffer(300);
        sb.append("SELECT project_status_id, name FROM project_status_lu ORDER BY 2");

        Connection c = null;

        try {
            c = DBMS.getConnection(DBMS.TCS_OLTP_DATASOURCE_NAME);
            ResultSetContainer rsc = runSelectQuery(c, sb.toString());
            HashMap hm = new HashMap();
            hm.put(PROJECT_TERMINATION_STATUS_LIST, rsc);
            c.close();
            c = null;
            return hm;
        } catch (Exception e) {
            try {
                if (c != null) c.close();
            } catch (Exception e1) {
                printException(e1);
            }
            c = null;
            throw new SQLException(e.getMessage());
        }
    }

    /**
     * Returns the list of all status codes.
     *
     * @return The list of status codes
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map getStatusCodes() throws SQLException {
        StringBuffer sb = new StringBuffer(300);
        sb.append("SELECT status_id, status_desc FROM status_lu ORDER BY 2");

        ResultSetContainer rsc = runSelectQuery(sb.toString());
        HashMap hm = new HashMap();
        hm.put(STATUS_CODE_LIST, rsc);
        return hm;
    }

    /**
     * Returns the list of all status codes for a given object type.
     *
     * @param objectType The object type
     * @return The list of status codes
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map getStatusCodes(int objectType) throws SQLException {
        StringBuffer sb = new StringBuffer(300);
        sb.append("SELECT status_id, status_desc FROM status_lu WHERE status_type_id = ");
        sb.append(objectType + " ORDER BY 2");

        ResultSetContainer rsc = runSelectQuery(sb.toString());
        HashMap hm = new HashMap();
        hm.put(STATUS_CODE_LIST, rsc);
        return hm;
    }


    /**
     * Returns the list of all payment statuses
     *
     * @return The list of payment statuses
     * @throws SQLException If there is some problem retrieving the data
     */
    public List<BasePaymentStatus> getPaymentStatusList() throws SQLException {
        return PaymentStatusFactory.getAllStatusList();
    }

    /**
     * Returns the list of all user types.
     *
     * @return The list of user types
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map getUserTypes() throws SQLException {
        StringBuffer sb = new StringBuffer(300);
        sb.append("SELECT user_type_id, user_type_desc FROM user_type ORDER BY 2");

        ResultSetContainer rsc = runSelectQuery(sb.toString());
        HashMap hm = new HashMap();
        hm.put(USER_TYPE_LIST, rsc);
        return hm;
    }

    /**
     * Returns the list of all rounds.
     *
     * @return The list of all rounds
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map getRounds() throws SQLException {
        StringBuffer sb = new StringBuffer(300);
        sb.append("SELECT r.round_id, rs.start_time, c.name || ' ' || r.name AS name ");
        sb.append("FROM round r, round_segment rs, contest c ");
        sb.append("WHERE r.contest_id = c.contest_id ");
        sb.append("AND r.round_id = rs.round_id ");
        sb.append("AND (r.round_type_id = 1 OR r.round_type_id = 2) "); // No practice rounds
        sb.append("AND rs.segment_id = 1 ");
        sb.append("ORDER BY 2 DESC");

        ResultSetContainer rsc = runSelectQuery(sb.toString());
        HashMap hm = new HashMap();
        hm.put(ROUND_LIST, rsc);
        return hm;
    }

    /**
     * Returns the demographic data for a given user.
     *
     * @return The demographic data
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map getDemographicData(long userId) throws SQLException {
        StringBuffer sb = new StringBuffer(300);
        sb.append("SELECT DISTINCT dq.demographic_question_text, dq.demographic_question_desc, ");
        sb.append("dr.demographic_response, dans.demographic_answer_text ");
        sb.append("FROM demographic_assignment da, demographic_question dq, ");
        sb.append("OUTER (demographic_response dr, OUTER demographic_answer dans) ");
        sb.append("WHERE da.coder_type_id = ");
        sb.append("  (SELECT coder_type_id from coder where coder_id = " + userId + ") ");
        sb.append("AND dq.demographic_question_id = da.demographic_question_id ");
        sb.append("AND dr.user_id = " + userId + " ");
        sb.append("AND dr.demographic_question_id = dq.demographic_question_id ");
        sb.append("AND dans.demographic_question_id = dr.demographic_question_id ");
        sb.append("AND dans.demographic_answer_id = dr.demographic_answer_id ");
        sb.append("AND da.status = 'A' ");

        ResultSetContainer rsc = runSelectQuery(sb.toString());
        HashMap hm = new HashMap();
        hm.put(USER_DEMOGRAPHICS, rsc);

        sb.replace(0, sb.length(), "SELECT cs.school_id, cs.coder_id, s.name as school_name from  ")
                .append(" current_school cs, school s where cs.school_id = s.school_id and coder_id = " + userId);

        rsc = null;
        rsc = runSelectQuery(sb.toString());
        hm.put(USER_CURRENT_SCHOOL, rsc);

        return hm;
    }

    /**
     * Returns project and component IDs from the component and review board payments in the given list.
     *
     * @param paymentIds The list of payment IDs.
     * @return the map of (projectID, componentID) pairs
     * @throws SQLException If there was some error retrieving the data.
     */
    public Map getPaymentComponentData(long[] paymentIds) throws SQLException {
        String paymentList = makeList(paymentIds);
        StringBuffer sb = new StringBuffer(300);
        sb.append("SELECT pd.component_project_id, cc.component_id ");
        sb.append("FROM payment p, payment_detail pd, tcs_catalog:project proj, ");
        sb.append("tcs_catalog:comp_catalog cc, tcs_catalog:comp_versions cv ");
        sb.append("WHERE pd.component_project_id = proj.project_id ");
        sb.append("AND proj.comp_vers_id = cv.comp_vers_id ");
        sb.append("AND cc.component_id = cv.component_id ");
        sb.append("AND p.payment_id IN (" + paymentList + ") ");
        sb.append("AND p.most_recent_detail_id = pd.payment_detail_id ");
        sb.append("AND pd.payment_type_id IN (" + COMPONENT_PAYMENT + "," + REVIEW_BOARD_PAYMENT + ") ");
        sb.append("AND proj.cur_version = 1");

        ResultSetContainer rsc = runSelectQuery(sb.toString());
        HashMap hm = new HashMap();
        hm.put(COMPONENT_DATA, rsc);
        return hm;
    }

    /**
     * Returns the created dates for the given payments.
     *
     * @return The created dates
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map getCreationDates(long[] paymentIds) throws SQLException {
        String paymentList = makeList(paymentIds);
        StringBuffer sb = new StringBuffer(300);
        sb.append("SELECT pdx.payment_id, min(pd.date_modified) as date_created ");
        sb.append("FROM payment_detail_xref pdx, payment_detail pd ");
        sb.append("WHERE payment_id IN (" + paymentList + ") ");
        sb.append("AND pdx.payment_detail_id = pd.payment_detail_id ");
        sb.append("GROUP BY 1 ");
        sb.append("ORDER BY 1 ");

        ResultSetContainer rsc = runSelectQuery(sb.toString());
        HashMap hm = new HashMap();
        hm.put(CREATION_DATE_LIST, rsc);
        return hm;
    }

    /*****************************************************
     * Search functions
     *****************************************************/

    /**
     * Finds affidavits that match the specified search criteria.
     *
     * @param searchCriteria The crtieria to search by.
     * @return A list of affidavit headers for the affidavits that satisfy the criteria.
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map findAffidavits(Map searchCriteria) throws SQLException {
        StringBuffer selectHeaders = new StringBuffer(300);

        // New version which sorts by a combination time field which is round start time
        // if the affidavit is associated with a contest, and the affidavit creation date
        // otherwise.  Also gets affidavit description.
        selectHeaders.append("SELECT a.affidavit_id, a.status_id, s.status_desc, a.user_id, ");
        selectHeaders.append("a.notarized, a.affirmed, a.date_created, u.handle, ");
        selectHeaders.append("a.affidavit_type_id, atl.affidavit_type_desc, a.affidavit_desc, ");
        selectHeaders.append("NVL(rs.start_time, a.date_created) AS origin_date ");
        selectHeaders.append("FROM affidavit a, status_lu s, user u, affidavit_type_lu atl, ");
        selectHeaders.append("OUTER round_segment rs ");
        selectHeaders.append("WHERE a.affidavit_type_id = atl.affidavit_type_id ");
        selectHeaders.append("AND a.status_id = s.status_id ");
        selectHeaders.append("AND u.user_id = a.user_id ");
        selectHeaders.append("AND a.round_id = rs.round_id ");
        selectHeaders.append("AND rs.segment_id = ");
        selectHeaders.append("  (SELECT MIN(segment_id) FROM round_segment ");
        selectHeaders.append("   WHERE round_id=a.round_id)");

        ArrayList objects = new ArrayList();
        Iterator i = searchCriteria.keySet().iterator();
        try {
            while (i.hasNext()) {
                String key = (String) i.next();
                String value = ((String) searchCriteria.get(key)).toUpperCase();
                if (key.equals(EARLIEST_CREATION_DATE)) {
                    selectHeaders.append(" AND a.date_created >= ?");
                    objects.add(makeTimestamp(value, false, false));
                } else if (key.equals(LATEST_CREATION_DATE)) {
                    selectHeaders.append(" AND a.date_created <= ?");
                    objects.add(makeTimestamp(value, false, true));
                } else if (key.equals(USER_ID)) {
                    selectHeaders.append(" AND a.user_id = " + value);
                } else if (key.equals(AFFIDAVIT_ID)) {
                    selectHeaders.append(" AND a.affidavit_id = " + value);
                } else if (key.equals(HANDLE)) {
                    selectHeaders.append(" AND UPPER(u.handle) LIKE ?");  //todo user handle_lower
                    objects.add(value);
                } else if (key.equals(STATUS_CODE)) {
                    selectHeaders.append(" AND a.status_id in (" + value + ")");
                } else if (key.equals(ROUND_ID)) {
                    selectHeaders.append(" AND a.round_id = " + value);
                } else if (key.equals(TYPE_CODE)) {
                    selectHeaders.append(" AND a.affidavit_type_id = " + value);
                } else if (key.equals(IS_AFFIRMED)) {
                    selectHeaders.append(" AND a.affirmed = " + (makeBoolean(value) ? 1 : 0));
                } else if (key.equals(IS_NOTARIZED)) {
                    selectHeaders.append(" AND a.notarized = " + (makeBoolean(value) ? 1 : 0));
                }
            }
        } catch (Exception e) {
            throw new SQLException(e.getMessage());
        }

        selectHeaders.append(" ORDER BY origin_date DESC");

        Connection c = null;
        try {
            c = DBMS.getConnection(trxDataSource);
            ResultSetContainer rsc = runSearchQuery(c, selectHeaders.toString(), objects);
            HashMap hm = new HashMap();
            hm.put(AFFIDAVIT_HEADER_LIST, rsc);
            return hm;
        } finally {
            close(c);
        }
    }

    /**
     * Finds contracts that match the specified search criteria.
     *
     * @param searchCriteria The crtieria to search by.
     * @return A list of contract headers for the contracts that satisfy the criteria.
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map findContracts(Map searchCriteria) throws SQLException {
        StringBuffer selectContractHeaders = new StringBuffer(300);
        selectContractHeaders.append("SELECT c.contract_id, c.creation_date, c.status_id, s.status_desc, ");
        selectContractHeaders.append("c.contracted_user_id, u.handle, c.name, c.contract_type_id, ");
        selectContractHeaders.append("ct.contract_type_desc ");

        StringBuffer from = new StringBuffer(300);
        from.append("FROM contract c, status_lu s, user u, contract_type_lu ct");

        StringBuffer whereClauses = new StringBuffer(300);
        whereClauses.append(" WHERE c.status_id = s.status_id ");
        whereClauses.append(" AND c.contracted_user_id = u.user_id ");
        whereClauses.append(" AND ct.contract_type_id = c.contract_type_id ");

        ArrayList objects = new ArrayList();
        Iterator i = searchCriteria.keySet().iterator();
        try {
            while (i.hasNext()) {
                String key = (String) i.next();
                String value = ((String) searchCriteria.get(key)).toUpperCase();
                if (key.equals(EARLIEST_CREATION_DATE)) {
                    whereClauses.append(" AND c.creation_date >= ? ");
                    objects.add(makeTimestamp(value, false, false));
                } else if (key.equals(LATEST_CREATION_DATE)) {
                    whereClauses.append(" AND c.creation_date <= ? ");
                    objects.add(makeTimestamp(value, false, true));
                } else if (key.equals(EARLIEST_START_DATE)) {
                    whereClauses.append(" AND c.start_date >= ? ");
                    objects.add(makeTimestamp(value, false, false));
                } else if (key.equals(LATEST_START_DATE)) {
                    whereClauses.append(" AND c.start_date <= ? ");
                    objects.add(makeTimestamp(value, false, true));
                } else if (key.equals(EARLIEST_END_DATE)) {
                    whereClauses.append(" AND c.end_date >= ? ");
                    objects.add(makeTimestamp(value, false, false));
                } else if (key.equals(LATEST_END_DATE)) {
                    whereClauses.append(" AND c.end_date <= ? ");
                    objects.add(makeTimestamp(value, false, true));
                } else if (key.equals(USER_ID)) {
                    whereClauses.append(" AND c.contracted_user_id = " + value);
                } else if (key.equals(CONTRACT_ID)) {
                    whereClauses.append(" AND c.contract_id = " + value);
                } else if (key.equals(HANDLE)) {
                    whereClauses.append(" AND UPPER(u.handle) LIKE ?");  //todo user handle_lower
                    objects.add(value);
                } else if (key.equals(CONTRACT_NAME)) {
                    whereClauses.append(" AND UPPER(c.name) LIKE ?");
                    objects.add(value);
                } else if (key.equals(STATUS_CODE)) {
                    whereClauses.append(" AND c.status_id = " + value);
                } else if (key.equals(TYPE_CODE)) {
                    whereClauses.append(" AND c.contract_type_id = " + value);
                } else if (key.equals(PAYMENT_ID)) {
                    from.append(", contract_payment_xref cpx");
                    whereClauses.append(" AND c.contract_id = cpx.contract_id ");
                    whereClauses.append(" AND cpx.payment_id = " + value);
                } // end if
            } // end while
        } catch (Exception e) {
            throw new SQLException(e.getMessage());
        }

        selectContractHeaders.append(from.toString());
        selectContractHeaders.append(whereClauses.toString());
        selectContractHeaders.append(" ORDER BY 1");

        ResultSetContainer rsc = runSearchQuery(selectContractHeaders.toString(), objects);
        HashMap hm = new HashMap();
        hm.put(CONTRACT_HEADER_LIST, rsc);
        return hm;
    }

    /**
     * Finds objects that a given note is associated with.
     *
     * @param noteId The note ID for which to find associated objects.
     * @return A list of headers for the objects that are associated with the given note.
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map findNoteObjects(long noteId) throws SQLException {
        StringBuffer select = new StringBuffer(300);
        select.append(" SELECT " + AFFIDAVIT_OBJ + " AS object_type, ");
        select.append(" affidavit_id AS first_id, 0 AS second_id ");
        select.append(" FROM affidavit_note_xref WHERE note_id = " + noteId);
        select.append("  UNION ");
        select.append(" SELECT " + CONTRACT_OBJ + ", contract_id, 0 ");
        select.append(" FROM contract_note_xref WHERE note_id = " + noteId);
        select.append("  UNION ");
        select.append(" SELECT " + PAYMENT_OBJ + ", payment_id, 0 ");
        select.append(" FROM payment_note_xref WHERE note_id = " + noteId);
        select.append("  UNION ");
        select.append(" SELECT " + USER_PROFILE_OBJ + ", user_id, 0 ");
        select.append(" FROM user_note_xref WHERE note_id = " + noteId);
        select.append("  UNION ");
        select.append(" SELECT " + USER_TAX_FORM_OBJ + ", tax_form_id, user_id ");
        select.append(" FROM user_tax_form_note_xref WHERE note_id = " + noteId);
        select.append(" ORDER BY 1, 2");

        ResultSetContainer rsc = runSelectQuery(select.toString());
        HashMap hm = new HashMap();
        hm.put(ENTRY_HEADER_LIST, rsc);
        return hm;
    }

    /**
     * Finds notes that match the specified search criteria.
     *
     * @param searchCriteria The crtieria to search by.
     * @return A list of note headers for the notes that
     *         satisfy the criteria.
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map findNotes(Map searchCriteria) throws SQLException {
        StringBuffer selectNoteHeaders = new StringBuffer(300);
        selectNoteHeaders.append("SELECT n.note_id, n.create_date, n.note_type_id, nt.note_type_desc, ");
        selectNoteHeaders.append("n.submitted_by, u.handle ");

        StringBuffer from = new StringBuffer(300);
        from.append("FROM note n, note_type_lu nt, user u");

        StringBuffer whereClauses = new StringBuffer(300);
        whereClauses.append(" WHERE nt.note_type_id = n.note_type_id ");
        whereClauses.append(" AND u.user_id = n.submitted_by");

        boolean joinedUserTaxForm = false;
        boolean joinedUser = false;

        ArrayList objects = new ArrayList();
        Iterator i = searchCriteria.keySet().iterator();
        try {
            while (i.hasNext()) {
                String key = (String) i.next();
                String value = ((String) searchCriteria.get(key)).toUpperCase();
                if (key.equals(EARLIEST_CREATION_DATE)) {
                    whereClauses.append(" AND n.create_date >= ?");
                    objects.add(makeTimestamp(value, false, false));
                } else if (key.equals(LATEST_CREATION_DATE)) {
                    whereClauses.append(" AND n.create_date <= ?");
                    objects.add(makeTimestamp(value, false, true));
                } else if (key.equals(CONTRACT_ID)) {
                    from.append(", contract_note_xref cnx");
                    whereClauses.append(" AND cnx.note_id = n.note_id");
                    whereClauses.append(" AND cnx.contract_id = " + value);
                } else if (key.equals(AFFIDAVIT_ID)) {
                    from.append(", affidavit_note_xref anx");
                    whereClauses.append(" AND anx.note_id = n.note_id");
                    whereClauses.append(" AND anx.affidavit_id = " + value);
                } else if (key.equals(USER_ID)) {
                    if (!joinedUser) {
                        joinedUser = true;
                        from.append(", user_note_xref unx");
                        whereClauses.append(" AND unx.note_id = n.note_id");
                    }
                    whereClauses.append(" AND unx.user_id = " + value);
                } else if (key.equals(NOTE_ID)) {
                    whereClauses.append(" AND n.note_id = " + value);
                } else if (key.equals(TYPE_CODE)) {
                    whereClauses.append(" AND n.note_type_id = " + value);
                } else if (key.equals(TAX_FORM_ID)) {
                    if (!joinedUserTaxForm) {
                        joinedUserTaxForm = true;
                        from.append(", user_tax_form_note_xref utnx");
                        whereClauses.append(" AND utnx.note_id = n.note_id");
                    }
                    whereClauses.append(" AND utnx.tax_form_id = " + value);
                } else if (key.equals(TAX_FORM_USER_ID)) {
                    if (!joinedUserTaxForm) {
                        joinedUserTaxForm = true;
                        from.append(", user_tax_form_note_xref utnx");
                        whereClauses.append(" AND utnx.note_id = n.note_id");
                    }
                    whereClauses.append(" AND utnx.user_id = " + value);
                } else if (key.equals(HANDLE)) {
                    if (!joinedUser) {
                        joinedUser = true;
                        from.append(", user_note_xref unx");
                        whereClauses.append(" AND unx.note_id = n.note_id");
                    }
                    from.append(", user u2");
                    whereClauses.append(" AND u2.user_id = unx.user_id");
                    whereClauses.append(" AND UPPER(u2.handle) LIKE ?");
                    objects.add(value);
                } else if (key.equals(SUBMITTING_HANDLE)) {
                    whereClauses.append(" AND UPPER(u.handle) LIKE ?"); //todo user handle_lower
                    objects.add(value);
                } else if (key.equals(IN_DEPTH_HANDLE)) {
                    from.append(", user u3, user_note_xref x");
                    whereClauses.append(" AND u3.user_id = x.user_id");
                    whereClauses.append(" AND n.note_id = x.note_id");
                    whereClauses.append(" AND UPPER(u3.handle) LIKE ?");
                    objects.add(value);
                } else if (key.equals(SUBMITTING_USER_ID)) {
                    whereClauses.append(" AND n.submitted_by = " + value);
                } else if (key.equals(PAYMENT_ID)) {
                    from.append(", payment_note_xref pnx");
                    whereClauses.append(" AND pnx.note_id = n.note_id");
                    whereClauses.append(" AND pnx.payment_id = " + value);
                }
            }
        } catch (Exception e) {
            throw new SQLException(e.getMessage());
        }

        selectNoteHeaders.append(from.toString());
        selectNoteHeaders.append(whereClauses.toString());
        selectNoteHeaders.append(" ORDER BY 1");

        ResultSetContainer rsc = runSearchQuery(selectNoteHeaders.toString(), objects);

        HashMap hm = new HashMap();
        hm.put(NOTE_HEADER_LIST, rsc);
        return hm;
    }

    /**
     * Finds payments that match the specified search criteria.
     *
     * @param searchCriteria The crtieria to search by.
     * @return A list of payment headers for the payments that
     *         satisfy the criteria.
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map findPayments(Map searchCriteria) throws SQLException {
        StringBuffer selectHeaders = new StringBuffer(3000);
        selectHeaders.append("SELECT p.payment_id, pd.payment_desc, pd.payment_type_id, pd.payment_method_id, p.create_date, pd.create_date as modify_date,  ");
        selectHeaders.append("pt.payment_type_desc, pm.payment_method_desc, pd.net_amount, pd.payment_status_id, s.payment_status_desc, ");
        selectHeaders.append("p.user_id, u.handle, u.first_name, u.middle_name, u.last_name, ");
        selectHeaders.append("pd.date_modified, pd.gross_amount, nvl(pdsrx.payment_status_reason_id, 0) as payment_status_reason_id, ");
        selectHeaders.append("pd.algorithm_round_id, pd.component_project_id, pd.algorithm_problem_id, ");
        selectHeaders.append("pd.studio_contest_id, pd.component_contest_id, pd.digital_run_stage_id, ");
        selectHeaders.append("pd.digital_run_season_id, pd.parent_payment_id, pd.total_amount, pd.installment_number, pd.digital_run_track_id, pd.invoice_number, pd.jira_issue_id, ");
        selectHeaders.append("ttp.name as billing_account_name, ttp.po_box_number as po_number, tdp.project_id as cockpit_project_id, tdp.name as cockpit_project_name, ");
        selectHeaders.append("pcl.name as project_category_name, ");

        // client_name
        selectHeaders.append(" nvl((select ttc.name from time_oltp:client_project ttcp, time_oltp:client ttc where ttp.project_id = ttcp.project_id and ttcp.client_id = ttc.client_id), pd.client) as client_name ");

        StringBuffer from = new StringBuffer(1500);
        from.append(" FROM payment p ");
        from.append(" INNER JOIN payment_detail pd ON pd.payment_detail_id = p.most_recent_detail_id ");
        from.append(" INNER JOIN payment_type_lu pt ON pt.payment_type_id = pd.payment_type_id ");
        from.append(" INNER JOIN payment_method_lu pm ON pm.payment_method_id = pd.payment_method_id ");
        from.append(" INNER JOIN payment_status_lu s ON s.payment_status_id = pd.payment_status_id ");
        from.append(" INNER JOIN user u ON u.user_id = p.user_id ");
        from.append(" LEFT OUTER JOIN payment_detail_status_reason_xref pdsrx ON pdsrx.payment_detail_id = pd.payment_detail_id ");
        from.append(" LEFT OUTER JOIN tcs_catalog:project proj ON proj.project_id = pd.component_project_id ");
        from.append(" LEFT OUTER JOIN tcs_catalog:project_category_lu pcl ON pcl.project_category_id = proj.project_category_id ");
        from.append(" LEFT OUTER JOIN studio_oltp:contest cont ON cont.contest_id = pd.studio_contest_id ");
        from.append(" LEFT OUTER JOIN tcs_catalog:project_info pi ON pi.project_id = pd.component_project_id and pi.project_info_type_id = 32 ");
        from.append(" LEFT OUTER JOIN studio_oltp:contest_config cc1 ON cc1.contest_id = pd.studio_contest_id and cc1.property_id = 28 ");
        from.append(" LEFT OUTER JOIN tcs_catalog:tc_direct_project tdp ON tdp.project_id = nvl(proj.tc_direct_project_id::int,cont.tc_direct_project_id::int) ");
        from.append(" LEFT OUTER JOIN time_oltp:project ttp ON ttp.project_id = nvl(pi.value::int,cc1.property_value::int) ");

        StringBuffer whereClauses = new StringBuffer(300);
        whereClauses.append(" WHERE 1=1 ");
        
        ArrayList objects = new ArrayList();
        Iterator i = searchCriteria.keySet().iterator();
        try {
            while (i.hasNext()) {
                String key = (String) i.next();
                String value = ((String) searchCriteria.get(key)).toUpperCase();
                if (key.equals(EARLIEST_CREATION_DATE)) {
                    whereClauses.append(" AND p.create_date >= ?");
                    objects.add(makeTimestamp(value, false, false));
                } else if (key.equals(LATEST_CREATION_DATE)) {
                    whereClauses.append(" AND p.create_date <= ?");
                    objects.add(makeTimestamp(value, false, true));
                } else if (key.equals(EARLIEST_MODIFICATION_DATE)) {
                    whereClauses.append(" AND pd.create_date >= ?");
                    objects.add(makeTimestamp(value, false, false));
                } else if (key.equals(LATEST_MODIFICATION_DATE)) {
                    whereClauses.append(" AND pd.create_date <= ?");
                    objects.add(makeTimestamp(value, false, true));
                } else if (key.equals(EARLIEST_PAY_DATE)) {
                    whereClauses.append(" AND pd.date_paid >= ?");
                    objects.add(makeTimestamp(value, false, false));
                } else if (key.equals(LATEST_PAY_DATE)) {
                    whereClauses.append(" AND pd.date_paid <= ?");
                    objects.add(makeTimestamp(value, false, true));
                } else if (key.equals(EARLIEST_DUE_DATE)) {
                    whereClauses.append(" AND pd.date_due >= ?");
                    objects.add(makeTimestamp(value, false, false));
                } else if (key.equals(LATEST_DUE_DATE)) {
                    whereClauses.append(" AND pd.date_due <= ?");
                    objects.add(makeTimestamp(value, false, true));
                } else if (key.equals(CONTRACT_ID)) {
                    from.append(" INNER JOIN contract_payment_xref cpx ON cpx.payment_id = p.payment_id and cpx.contract_id = " + value);
                } else if (key.equals(AFFIDAVIT_ID)) {
                    from.append(" INNER JOIN affidavit a ON a.payment_id = p.payment_id and a.affidavit_id = " + value);
                } else if (key.equals(USER_ID)) {
                    whereClauses.append(" AND p.user_id = " + value);
                } else if (key.equals(PAYMENT_ID)) {
                    whereClauses.append(" AND p.payment_id in (" + value + ")");
                } else if (key.equals(HANDLE)) {
                    whereClauses.append(" AND UPPER(u.handle) LIKE ?");  //todo user handle_lower
                    objects.add(value);
                } else if (key.equals(INVOICE_NUMBER)) {
                    whereClauses.append(" AND UPPER(pd.invoice_number) = ?");
                    objects.add(value);
                } else if (key.equals(COCKPIT_PROJECT)) {
                    whereClauses.append(" AND UPPER(tdp.name) LIKE ?");
                    objects.add(value);
                } else if (key.equals(BILLING_ACCOUNT)) {
                    whereClauses.append(" AND UPPER(ttp.name) LIKE ?");
                    objects.add(value);
                } else if (key.equals(STATUS_CODE)) {
                    whereClauses.append(" AND pd.payment_status_id IN (" + value + ")");
                } else if (key.equals(TYPE_CODE)) {
                    whereClauses.append(" AND pd.payment_type_id IN (" + value + ")");
                } else if (key.equals(METHOD_CODE)) {
                    whereClauses.append(" AND pd.payment_method_id IN (" + value + ")");
                } else if (key.equals(PROJECT_ID)) {
                    whereClauses.append(" AND pd.component_project_id = " + value);
                } else if (key.equals(LOWEST_NET_AMOUNT)) {
                    whereClauses.append(" AND pd.net_amount >= " + value);
                } else if (key.equals(HIGHEST_NET_AMOUNT)) {
                    whereClauses.append(" AND pd.net_amount <= " + value);
                }
            }
        } catch (Exception e) {
            throw new SQLException(e.getMessage());
        }

        selectHeaders.append(from.toString());
        selectHeaders.append(whereClauses.toString());
        selectHeaders.append(" ORDER BY 1");

        ResultSetContainer rsc = runSearchQuery(selectHeaders.toString(), objects);
        HashMap hm = new HashMap();
        hm.put(PAYMENT_HEADER_LIST, rsc);
        return hm;
    }

    /**
     * Finds generic tax forms that match the specified search criteria.
     *
     * @param searchCriteria The crtieria to search by.
     * @return A list of tax form headers for the generic tax forms that
     *         satisfy the criteria.
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map findTaxForms(Map searchCriteria) throws SQLException {
        StringBuffer selectTaxForms = new StringBuffer(300);
        selectTaxForms.append("SELECT tf.name, tf.tax_form_id, tf.status_id, tf.tax_form_desc, ");
        selectTaxForms.append("tf.default_withholding_amount, tf.default_withholding_percentage, ");
        selectTaxForms.append("s.status_desc, tf.use_percentage AS default_use_percentage, ");
        selectTaxForms.append("UPPER(tf.name) AS ucname ");
        selectTaxForms.append("FROM tax_form tf, status_lu s ");
        selectTaxForms.append("WHERE tf.status_id = s.status_id");

        Iterator i = searchCriteria.keySet().iterator();
        while (i.hasNext()) {
            String key = (String) i.next();
            String value = (String) searchCriteria.get(key);
            if (key.equals(STATUS_CODE))
                selectTaxForms.append(" AND tf.status_id = " + value);
            else if (key.equals(LOWEST_WITHHOLDING_AMOUNT))
                selectTaxForms.append(" AND tf.default_withholding_amount >= " + value);
            else if (key.equals(HIGHEST_WITHHOLDING_AMOUNT))
                selectTaxForms.append(" AND tf.default_withholding_amount <= " + value);
            else if (key.equals(LOWEST_WITHHOLDING_PERCENTAGE))
                selectTaxForms.append(" AND tf.default_withholding_percentage >= " + value);
            else if (key.equals(HIGHEST_WITHHOLDING_PERCENTAGE))
                selectTaxForms.append(" AND tf.default_withholding_percentage <= " + value);
            else if (key.equals(TAX_FORM_ID))
                selectTaxForms.append(" AND tf.tax_form_id = " + value);
        }

        selectTaxForms.append(" ORDER BY ucname");

        ResultSetContainer rsc = runSelectQuery(selectTaxForms.toString());
        HashMap hm = new HashMap();
        hm.put(TAX_FORM_LIST, rsc);
        return hm;
    }

    /**
     * Finds user-specific tax forms that match the specified search criteria.
     *
     * @param searchCriteria The crtieria to search by.
     * @return A list of tax form headers for the user-specific tax forms that
     *         satisfy the criteria.
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map findUserTaxForms(Map searchCriteria) throws SQLException {
        StringBuffer selectHeaders = new StringBuffer(300);
        selectHeaders.append("SELECT utf.tax_form_id, utf.status_id, utf.date_filed, utf.user_id, ");
        selectHeaders.append("s.status_desc, u.handle, tf.name, UPPER(u.handle) AS uchandle, ");
        selectHeaders.append("UPPER(tf.name) AS ucname ");
        selectHeaders.append("FROM user_tax_form_xref utf, tax_form tf, status_lu s, user u ");
        selectHeaders.append("WHERE utf.tax_form_id = tf.tax_form_id ");
        selectHeaders.append("AND s.status_id = utf.status_id ");
        selectHeaders.append("AND utf.user_id = u.user_id");

        ArrayList objects = new ArrayList();
        Iterator i = searchCriteria.keySet().iterator();
        try {
            while (i.hasNext()) {
                String key = (String) i.next();
                String value = ((String) searchCriteria.get(key)).toUpperCase();
                if (key.equals(EARLIEST_DATE_FILED)) {
                    selectHeaders.append(" AND utf.date_filed >= ?");
                    objects.add(makeTimestamp(value, false, false));
                } else if (key.equals(LATEST_DATE_FILED)) {
                    selectHeaders.append(" AND utf.date_filed <= ?");
                    objects.add(makeTimestamp(value, false, true));
                } else if (key.equals(USER_ID)) {
                    selectHeaders.append(" AND utf.user_id = " + value);
                } else if (key.equals(TAX_FORM_ID)) {
                    selectHeaders.append(" AND utf.tax_form_id = " + value);
                } else if (key.equals(HANDLE)) {
                    selectHeaders.append(" AND UPPER(u.handle) LIKE ?");
                    objects.add(value);
                } else if (key.equals(STATUS_CODE)) {
                    selectHeaders.append(" AND utf.status_id = " + value);
                } else if (key.equals(LOWEST_WITHHOLDING_AMOUNT)) {
                    selectHeaders.append(" AND utf.withholding_amount >= " + value);
                } else if (key.equals(HIGHEST_WITHHOLDING_AMOUNT)) {
                    selectHeaders.append(" AND utf.withholding_amount <= " + value);
                } else if (key.equals(LOWEST_WITHHOLDING_PERCENTAGE)) {
                    selectHeaders.append(" AND utf.withholding_percentage >= " + value);
                } else if (key.equals(HIGHEST_WITHHOLDING_PERCENTAGE)) {
                    selectHeaders.append(" AND utf.withholding_percentage <= " + value);
                }
            }
        } catch (Exception e) {
            throw new SQLException(e.getMessage());
        }

        selectHeaders.append(" ORDER BY uchandle, ucname");

        ResultSetContainer rsc = runSearchQuery(selectHeaders.toString(), objects);
        HashMap hm = new HashMap();
        hm.put(USER_TAX_FORM_HEADER_LIST, rsc);
        return hm;
    }

    /**
     * Finds user profiles that match the specified search criteria.
     *
     * @param searchCriteria The crtieria to search by.
     * @return A list of user profile headers for the user profiles that
     *         satisfy the criteria.
     * @throws SQLException If there is some problem retrieving the data
     */
    public Map findUsers(Map searchCriteria) throws SQLException {
        StringBuffer selectHeader = new StringBuffer(300);
        selectHeader.append("SELECT u.user_id, u.handle, UPPER(u.handle) AS uchandle, u.first_name, u.middle_name, ");
        selectHeader.append("u.last_name, nvl(ua.accrual_amount, "+MINIMUM_PAYMENT_ACCRUAL_AMOUNT+") as accrual_amount, s.user_status_desc, ");
        selectHeader.append("pml.payment_method_desc as payment_method ");
        StringBuffer from = new StringBuffer(300);
        from.append("FROM user u ");

        ArrayList joinClauses = new ArrayList();
        ArrayList whereClauses = new ArrayList();		
        ArrayList orClauses = new ArrayList();
        ArrayList objects = new ArrayList();

        joinClauses.add("INNER JOIN user_status_lu s ON u.status = s.user_status_id ");
        joinClauses.add("LEFT OUTER JOIN user_accrual ua ON u.user_id = ua.user_id ");
        joinClauses.add("LEFT OUTER JOIN user_payment_method upm ON u.user_id = upm.user_id ");
        joinClauses.add("INNER JOIN payment_method_lu pml ON pml.payment_method_id = nvl(upm.payment_method_id, "+NOT_SET_PAYMENT_METHOD_ID+") ");				

        Iterator i = searchCriteria.keySet().iterator();
        try {
            while (i.hasNext()) {
                String key = (String) i.next();
                String value = ((String) searchCriteria.get(key)).toUpperCase();
                if (key.equals(PAYMENT_ID)) {
                    from.append(", payment p");
                    whereClauses.add("u.user_id = p.user_id");
                    whereClauses.add("p.payment_id = " + value);
                } else if (key.equals(CONTRACT_ID)) {
                    from.append(", contract con");
                    whereClauses.add("u.user_id = con.contracted_user_id");
                    whereClauses.add("con.contract_id = " + value);
                } else if (key.equals(AFFIDAVIT_ID)) {
                    from.append(", affidavit a");
                    whereClauses.add("u.user_id = a.user_id");
                    whereClauses.add("a.affidavit_id = " + value);
                } else if (key.equals(TAX_FORM_ID)) {
                    from.append(", user_tax_form_xref utf");
                    whereClauses.add("u.user_id = utf.user_id");
                    whereClauses.add("utf.tax_form_id = " + value);
                } else if (key.equals(FIRST_NAME)) {
                    whereClauses.add("UPPER(u.first_name) LIKE ?");
                    objects.add(value);
                } else if (key.equals(MIDDLE_NAME)) {
                    whereClauses.add("UPPER(u.middle_name) LIKE ?");
                    objects.add(value);
                } else if (key.equals(LAST_NAME)) {
                    whereClauses.add("UPPER(u.last_name) LIKE ?");
                    objects.add(value);
                } else if (key.equals(HANDLE)) {
                    whereClauses.add("UPPER(u.handle) LIKE ?");
                    objects.add(value);
                } else if (key.equals(METHOD_CODE)) {
                    whereClauses.add("nvl(upm.payment_method_id, "+NOT_SET_PAYMENT_METHOD_ID+") IN (" + value + ")");					
                } else if (key.equals(HAS_ACTIVE_CONTRACTS)) {
                    boolean wantExists = makeBoolean(value);
                    StringBuffer clause = new StringBuffer(300);
                    if (!wantExists) {
                        clause.append("NOT ");
                    }
                    clause.append("EXISTS (SELECT 1 FROM contract ");
                    clause.append("        WHERE contract.contracted_user_id = u.user_id");
                    clause.append("        AND contract.status_id = " + CONTRACT_ACTIVE_STATUS + ")");
                    orClauses.add(clause.toString());
                } else if (key.equals(HAS_PENDING_AFFIDAVITS)) {
                    boolean wantExists = makeBoolean(value);
                    StringBuffer clause = new StringBuffer(300);
                    if (!wantExists) {
                        clause.append("NOT ");
                    }
                    clause.append("EXISTS (SELECT 1 FROM affidavit ");
                    clause.append("        WHERE affidavit.user_id = u.user_id");
                    clause.append("        AND affidavit.affirmed = 0)");
                    orClauses.add(clause.toString());
                } else if (key.equals(HAS_TAX_FORMS_ON_FILE)) {
                    boolean wantExists = makeBoolean(value);
                    StringBuffer clause = new StringBuffer(300);
                    if (!wantExists) {
                        clause.append("NOT ");
                    }
                    clause.append("EXISTS (SELECT 1 FROM user_tax_form_xref ");
                    clause.append("        WHERE user_tax_form_xref.user_id = u.user_id)");
                    orClauses.add(clause.toString());
                } else if (key.equals(IS_OWED_MONEY)) {
                    boolean wantExists = makeBoolean(value);
                    StringBuffer clause = new StringBuffer(300);
                    if (!wantExists) {
                        clause.append("NOT ");
                    }
                    clause.append("EXISTS (SELECT 1 FROM payment, payment_detail ");
                    clause.append("        WHERE payment.user_id = u.user_id");
                    clause.append("        AND payment.most_recent_detail_id = payment_detail.payment_detail_id");
                    clause.append("        AND payment_detail.payment_status_id in (" +
                            PaymentStatus.OWED_PAYMENT_STATUS.getId() + "," +
                            PaymentStatus.ACCRUING_PAYMENT_STATUS.getId() + "))");
                    orClauses.add(clause.toString());
                } else if (key.equals(HAS_GLOBAL_AD)) {
                    boolean wantExists = makeBoolean(value);
                    StringBuffer clause = new StringBuffer(300);
                    if (!wantExists) {
                        clause.append("NOT ");
                    }
                    clause.append("EXISTS (SELECT 1 FROM assignment_document ad ");
                    clause.append("        WHERE ad.user_id = u.user_id");
                    clause.append("        AND ad.assignment_document_type_id = " + AssignmentDocumentType.GLOBAL_TYPE_ID);
                    clause.append("        AND ad.assignment_document_status_id = " + AssignmentDocumentStatus.AFFIRMED_STATUS_ID + ")");
                    orClauses.add(clause.toString());
                }
            }
        } catch (Exception e) {
            throw new SQLException(e.getMessage());
        }

        selectHeader.append(from.toString());
        for (int j = 0; j < joinClauses.size(); j++) {
            selectHeader.append((String) joinClauses.get(j));
        }

        for (int j = 0; j < whereClauses.size(); j++) {
            if (j == 0)
                selectHeader.append(" WHERE ");
            else
                selectHeader.append(" AND ");
            selectHeader.append((String) whereClauses.get(j));
        }

        int ors = orClauses.size();
        if (ors > 0) {
            if (whereClauses.size() > 0)
                selectHeader.append(" AND (");
            else
                selectHeader.append(" WHERE (");

            for (int j = 0; j < ors; j++) {
                if (j > 0)
                    selectHeader.append(" OR ");
                selectHeader.append((String) orClauses.get(j));
            }
            selectHeader.append(")");
        }

        selectHeader.append(" ORDER BY uchandle");

        ResultSetContainer rsc = runSearchQuery(selectHeader.toString(), objects);
        HashMap hm = new HashMap();
        hm.put(USER_PROFILE_HEADER_LIST, rsc);
        return hm;
    }

    /**
     * Adds the specified affidavit and payment to the database, and associates the two.
     * Also adds a corresponding referral payment if the affidavit is a contest winnings
     * affidavit and someone referred the winning coder. <p>
     * <p/>
     * If the payment input parameter is null, the affidavit will still be created, but
     * without being associated with a payment.
     *
     * @param a             Data for the new affidavit.
     * @param affidavitText The new affidavit's text
     * @param p             Data for the new payment
     * @return The new affidavit's ID.
     * @throws IllegalUpdateException If the user is trying to make an illegal update.
     * @throws SQLException           If there is some problem updating the data
     */
    public long addAffidavit(Affidavit a, String affidavitText, Payment p)
            throws IllegalUpdateException, SQLException {
        Connection c = null;
        try {
            c = DBMS.getConnection(trxDataSource);

            long affidavitId = makeAffidavitPayment(c, a, affidavitText, p)[1];

            return affidavitId;
        } catch (Exception e) {
            printException(e);
            ejbContext.setRollbackOnly();
            if (e instanceof IllegalUpdateException)
                throw (IllegalUpdateException) e;
            throw new SQLException(e.getMessage());
        } finally {
            close(c);
        }
    }


    // Helper function, assumes autocommit is false
    private long[] makeAffidavitPayment(Connection c, Affidavit a, String text, Payment p) throws Exception {
        log.debug("makeAffidavitPayment called...");
        PreparedStatement ps = null;
        try {
            // Get ID numbers.  As affidavit references payment, we must add the
            // payment first (if applicable).
            long affidavitId = IdGeneratorClient.getSeqId("AFFIDAVIT_SEQ");
            long paymentId = -1;

            String paymentStr = "null";
            if (p != null) {
                paymentId = makeNewPayment(c, p, p.payReferrer(), 0);
                paymentStr = "" + paymentId;
            } else {
                if (a.getPayment() != null) {
                    paymentStr = "" + a.getPayment().getId();
                }
            }
            log.debug("in makeAffidavit payment, the paymentId is " + paymentId);

            // Add the affidavit record
            StringBuffer insertAffidavit = new StringBuffer(300);
            String roundStr = "null";

            if (a.getRoundId() != null)
                roundStr = "" + a.getRoundId().longValue();

            String localText = text;
            if (text == null) {
                log.debug("get the affidavit text from the db");
                StringBuffer getAffidavitTexts = new StringBuffer(300);
                getAffidavitTexts.append("SELECT att.text ");
                getAffidavitTexts.append("FROM affidavit_template att, country_affidavit_template_xref x, user_address_xref uax, address ad ");
                getAffidavitTexts.append("WHERE att.affidavit_type_id = " + a.getHeader().getTypeId());
                getAffidavitTexts.append(" and att.affidavit_template_id =x.affidavit_template_id ");
                getAffidavitTexts.append(" and ad.country_code = x.country_code ");
                getAffidavitTexts.append(" and uax.address_id = ad.address_id ");
                getAffidavitTexts.append(" and ad.address_type_id = 2 ");
                getAffidavitTexts.append(" and uax.user_id = " + a.getHeader().getUser().getId());
                ResultSetContainer rsc = runSelectQuery(c, getAffidavitTexts.toString());
                if (rsc.isEmpty()) {
                    throw new Exception("Couldn't find an affidavit template for user " + a.getHeader().getUser().getId());
                }
                localText = rsc.getStringItem(0, "text");
            }

            insertAffidavit.append("INSERT INTO affidavit ");
            insertAffidavit.append(" (round_id, affidavit_id, user_id, status_id, notarized, affirmed, ");
            insertAffidavit.append("  payment_id, affidavit_desc, affidavit_type_id, text, date_created, date_affirmed) ");
            insertAffidavit.append(" VALUES(" + roundStr + ",?,?,?,?,?," + paymentStr + ",?,?,?,?,null)");
            ps = c.prepareStatement(insertAffidavit.toString());
            ps.setLong(1, affidavitId);
            ps.setLong(2, a.getHeader().getUser().getId());
            ps.setInt(3, a.getHeader().getStatusId());
            ps.setInt(4, 0); // notarized
            ps.setInt(5, 0); // affirmed
            ps.setString(6, a.getHeader().getDescription());
            ps.setInt(7, a.getHeader().getTypeId());
            ps.setBytes(8, DBMS.serializeTextString(localText));
            //todo STUPID!!!! make this a default in the database
            ps.setTimestamp(9, new Timestamp(System.currentTimeMillis())); // date_created
            ps.executeUpdate();
            ps.close();
            ps = null;

            return new long[]{paymentId, affidavitId};
        } catch (Exception e) {
            try {
                if (ps != null) ps.close();
            } catch (Exception e1) {
                printException(e1);
            }
            ps = null;
            throw e;
        }
    }

    /**
     * Adds the specified contract to the database.
     *
     * @param c            Data for the new contract.
     * @param contractText The new contract text.
     * @return The new contract's ID.
     * @throws SQLException If there is some problem updating the data
     */
    public long addContract(Contract c, String contractText) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBMS.getConnection();

            // Get ID numbers
            long contractId = IdGeneratorClient.getSeqId("CONTRACT_SEQ");

            StringBuffer insertContract = new StringBuffer(300);
            insertContract.append("INSERT INTO contract ");
            insertContract.append(" (name, contract_id, contracted_user_id, text, creation_date, ");
            insertContract.append("  start_date, end_date, contract_desc, status_id, contract_type_id) ");
            insertContract.append(" VALUES(?,?,?,?,?,?,?,?,?,?)");
            ps = con.prepareStatement(insertContract.toString());
            ps.setString(1, c.getHeader().getName());
            ps.setLong(2, contractId);
            ps.setLong(3, c.getHeader().getUser().getId());
            ps.setBytes(4, DBMS.serializeTextString(contractText));
            ps.setTimestamp(5, new Timestamp(System.currentTimeMillis())); // creation_date
            ps.setTimestamp(6, makeTimestamp(c.getStartDate(), true, false));
            ps.setTimestamp(7, makeTimestamp(c.getEndDate(), true, false));
            ps.setString(8, c.getDescription());
            ps.setInt(9, c.getHeader().getStatusId());
            ps.setInt(10, c.getHeader().getTypeId());
            ps.executeUpdate();
            ps.close();
            ps = null;

            con.close();
            con = null;

            return contractId;
        } catch (Exception e) {
            printException(e);
            try {
                if (ps != null) ps.close();
            } catch (Exception e1) {
                printException(e1);
            }
            ps = null;
            try {
                if (con != null) con.close();
            } catch (Exception e1) {
                printException(e1);
            }
            con = null;
            throw new SQLException(e.getMessage());
        }
    }

    // Helper function that checks a payment for validity
    private void checkPayment(Connection c, Payment p, boolean newPayment)
            throws IllegalUpdateException, PaymentPaidException, SQLException {

        // Can't have net amount > gross amount
        if (p.getNetAmount() > p.getGrossAmount()) {
            throw new IllegalUpdateException("Net amount cannot exceed gross amount");
        }

        if (p.getGrossAmount() < 0) {
            throw new IllegalUpdateException("Gross amount must be non negative");
        }

        if (newPayment) {
            return;
        }

        // Can't update if payment has already been paid
        StringBuffer checkPaid = new StringBuffer(300);
        checkPaid.append("SELECT COUNT(*) FROM payment p, payment_detail pd, payment_detail_xref pdx ");
        checkPaid.append("WHERE p.payment_id = pdx.payment_id ");
        checkPaid.append("AND pdx.payment_detail_id = pd.payment_detail_id ");
        checkPaid.append("AND pd.payment_status_id = " + PaymentStatus.PAID_PAYMENT_STATUS.getId() + " ");
        checkPaid.append("AND p.payment_id = " + p.getHeader().getId());
        ResultSetContainer rsc = runSelectQuery(c, checkPaid.toString());
        int paidRecords = Integer.parseInt(rsc.getItem(0, 0).toString());
        if (paidRecords > 0) {
            throw new PaymentPaidException("Payment " + p.getHeader().getId() + " has already been paid " +
                    "and cannot be updated");
        }
    }

    // Calculates the payment net amount from the payment gross amount
    public double computePaymentNetAmount(int paymentTypeId, double grossAmount, long coderId) throws SQLException {
        // Computes the appropriate net amount based on the
        // withholdings specified in the user_tax_form_xref for the payee.
        // If that isn't available, we just set net amount = gross amount.

        log.debug("In computePaymentNetAmount");
        Connection c = null;
        
        try {
            c = DBMS.getConnection(trxDataSource);

            double withholdAmount = 0.0;
            float withholdPercent = 0.0F;
            int usePercent = 0;
            boolean dataFound = false;

            double netAmount = grossAmount;

            if (paymentTypeId == ALGORITHM_CONTEST_PAYMENT
                    || paymentTypeId == MARATHON_MATCH_PAYMENT
                    || paymentTypeId == ALGORITHM_TOURNAMENT_PRIZE_PAYMENT
                    || paymentTypeId == HIGH_SCHOOL_TOURNAMENT_PRIZE_PAYMENT
                    || paymentTypeId == MARATHON_MATCH_TOURNAMENT_PRIZE_PAYMENT
                    || paymentTypeId == ROYALTY_PAYMENT
                    || paymentTypeId == CODER_REFERRAL_PAYMENT
                    || paymentTypeId == ONE_OFF_PAYMENT
                    || paymentTypeId == DIGITAL_RUN_V2_TAXABLE_PRIZE_PAYMENT
                    || paymentTypeId == DIGITAL_RUN_V2_TAXABLE_TOP_PERFORMERS_PAYMENT) {                    

                StringBuffer getUserWithholding = new StringBuffer(300);
                getUserWithholding.append("SELECT withholding_amount, withholding_percentage, use_percentage,date_filed ");
                getUserWithholding.append(" FROM user_tax_form_xref ");
                getUserWithholding.append(" WHERE user_id = " + coderId);
                getUserWithholding.append(" AND status_id = 60");
                getUserWithholding.append(" ORDER by date_filed DESC ");

                ResultSetContainer rsc = runSelectQuery(c, getUserWithholding.toString());
                if (rsc.getRowCount() > 0) {
                    withholdAmount = TCData.getTCDouble(rsc.getRow(0), "withholding_amount");
                    withholdPercent = TCData.getTCFloat(rsc.getRow(0), "withholding_percentage");
                    usePercent = TCData.getTCInt(rsc.getRow(0), "use_percentage");
                    dataFound = true;
                    log.debug("Got user withholding");
                }
            }

            // Calculate the amount
            if (dataFound) {
                if (usePercent == 1) {
                    netAmount = netAmount * (1 - withholdPercent);
                } else {
                    netAmount = netAmount - withholdAmount;
                }

                // Net amount can't be negative
                if (netAmount < 0) {
                    netAmount = 0;
                }
            }
            
            // Round to nearest penny
            DecimalFormat df = new DecimalFormat("0.00");
            String netAmountStr = df.format(netAmount);
            double roundedNetAmount = new Double(netAmountStr).doubleValue();

            // Make sure we don't exceed the gross amount by rounding.
            return roundedNetAmount < grossAmount ? roundedNetAmount : grossAmount;
        } finally {
            close(c);
        }
    }


    // Helper function that calculates the payment net amount if necessary
    private void fillPaymentNetAmount(Payment p) throws SQLException {
        // If the net amount is zero, fill in the appropriate net amount based on the
        // withholdings specified in the user_tax_form_xref for the payee.  If that isn't available,
        // we use the withholdings specified in the default tax form for the payee's country.
        // If that isn't available, we just set net amount = gross amount.

        if (p.getNetAmount() != 0)
            return;

        log.debug("In fillPaymentNetAmount");

        double netAmount = computePaymentNetAmount(p.getHeader().getTypeId(), p.getGrossAmount(), p.getHeader().getUser().getId());
        p.setNetAmount(netAmount);
    }

    // Helper function getting the referring user
    private ResultSetContainer getReferrer(Connection c, long userId, Date eventDate) throws Exception {
        log.debug("getReferrer with userId=" + userId);
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            StringBuffer getReferralUser = new StringBuffer(300);
            getReferralUser.append("SELECT cr.reference_id, u.handle AS referrer_handle, ");
            getReferralUser.append("u2.handle AS coder_handle ");
            getReferralUser.append("FROM coder_referral cr, user u, user u2, coder c2 ");
            getReferralUser.append("WHERE cr.coder_id = " + userId + " ");
            getReferralUser.append("AND cr.referral_id = " + CODER_REFERRAL_TYPE + " ");
            getReferralUser.append("AND u.user_id = cr.reference_id ");
            getReferralUser.append("AND u2.user_id = cr.coder_id ");
            getReferralUser.append("AND c2.coder_id = cr.coder_id ");
            getReferralUser.append("AND c2.member_since + 365 UNITS DAY >= ?");

            // if no event date, assume today
            if (eventDate == null) {
                eventDate = new Date();
            }
            log.debug("enventDate=" + eventDate);

            ps = c.prepareStatement(getReferralUser.toString());
            ps.setTimestamp(1, new Timestamp(eventDate.getTime()));
            rs = ps.executeQuery();

            return new ResultSetContainer(rs, false);

        } finally {
            close(rs);
            close(ps);
        }
    }

    private void setNullableLong(PreparedStatement ps, int n, long value) throws SQLException {
        if (value != 0) {
            ps.setLong(n, value);
        } else {
            ps.setNull(n, Types.DECIMAL);
        }
    }

    private void setNullableString(PreparedStatement ps, int n, String value) throws SQLException {
        if (value != null) {
            ps.setString(n, value);
        } else {
            ps.setNull(n, Types.VARCHAR);
        }
    }

    /**
     * Inserts a new row into payment_detail table.
     *
     * @param c Connection to use
     * @param p payment to insert
     * @param operatorUserId User ID of the operator or 0 if not set
     * @return the payment_detail_id of the inserted record
     * @throws Exception
     */
    private long insertPaymentDetail(Connection c, Payment p, long operatorUserId) throws Exception {
        PreparedStatement ps = null;
        long paymentDetailId = IdGeneratorClient.getSeqId("PAYMENT_DETAIL_SEQ");
        try {
            StringBuffer insertPaymentDetail = new StringBuffer(300);
            insertPaymentDetail.append("INSERT INTO payment_detail ");
            insertPaymentDetail.append(" (payment_detail_id, net_amount, date_paid, ");
            insertPaymentDetail.append("  gross_amount, payment_status_id, payment_address_id, modification_rationale_id, ");
            insertPaymentDetail.append("  payment_desc, payment_type_id, payment_method_id, date_modified, date_due, client, ");
            insertPaymentDetail.append("  algorithm_round_id, component_project_id, algorithm_problem_id, studio_contest_id, ");
            insertPaymentDetail.append("  component_contest_id, digital_run_stage_id, digital_run_season_id, parent_payment_id, ");
            insertPaymentDetail.append("  charity_ind, total_amount, installment_number, digital_run_track_id, invoice_number, jira_issue_id, create_user ) ");
            insertPaymentDetail.append(" VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

            ps = c.prepareStatement(insertPaymentDetail.toString());
            ps.setLong(1, paymentDetailId);
            ps.setDouble(2, p.getNetAmount());
            ps.setTimestamp(3, makeTimestamp(p.getPayDate(), true, false));
            ps.setDouble(4, p.getGrossAmount());
            ps.setLong(5, p.getCurrentStatus().getId());
            setNullableLong(ps, 6, 0);
            ps.setInt(7, p.getRationaleId());
            ps.setString(8, p.getHeader().getDescription());
            ps.setInt(9, p.getHeader().getTypeId());
            ps.setLong(10, p.getHeader().getMethodId());
            ps.setTimestamp(11, new Timestamp(System.currentTimeMillis())); // date_modified
            ps.setTimestamp(12, makeTimestamp(p.getDueDate(), true, false));
            if (!checkNull(p.getHeader().getClient()).equals("")) {
                ps.setString(13, p.getHeader().getClient());
            } else {
                ps.setNull(13, Types.VARCHAR);
            }

            for (int i = 14; i <= 21; i++) {
                ps.setNull(i, Types.DECIMAL);
            }
            ps.setNull(25, Types.DECIMAL);
            ps.setNull(27, Types.VARCHAR);
            switch (BasePayment.getReferenceTypeId(p.getHeader().getTypeId())) {
                case REFERENCE_ALGORITHM_ROUND_ID:
                    setNullableLong(ps, 14, p.getHeader().getAlgorithmRoundId());
                    break;
                case REFERENCE_COMPONENT_PROJECT_ID:
                    setNullableLong(ps, 15, p.getHeader().getComponentProjectId());
                    setNullableString(ps, 27, p.getHeader().getJiraIssueName());
                    break;
                case REFERENCE_ALGORITHM_PROBLEM_ID:
                    setNullableLong(ps, 16, p.getHeader().getAlgorithmProblemId());
                    break;
                case REFERENCE_STUDIO_CONTEST_ID:
                    setNullableLong(ps, 17, p.getHeader().getStudioContestId());
                    setNullableString(ps, 27, p.getHeader().getJiraIssueName());
                    break;
                case REFERENCE_COMPONENT_CONTEST_ID:
                    setNullableLong(ps, 18, p.getHeader().getComponentContestId());
                    break;
                case REFERENCE_DIGITAL_RUN_STAGE_ID:
                    setNullableLong(ps, 19, p.getHeader().getDigitalRunStageId());
                    break;
                case REFERENCE_DIGITAL_RUN_SEASON_ID:
                    setNullableLong(ps, 20, p.getHeader().getDigitalRunSeasonId());
                    break;
                case REFERENCE_PARENT_PAYMENT_ID:
                    setNullableLong(ps, 21, p.getHeader().getParentPaymentId());
                    break;
                case REFERENCE_DIGITAL_RUN_TRACK_ID:
                    setNullableLong(ps, 25, p.getHeader().getDigitalRunTrackId());
                    break;
            }
            ps.setBoolean(22, p.isCharity());
            ps.setDouble(23, p.getTotalAmount() == 0 ? p.getGrossAmount() : p.getTotalAmount()); // default to gross amount if not filled.
            ps.setInt(24, p.getInstallmentNumber());
            ps.setString(26, p.getInvoiceNumber());

            if (operatorUserId != 0) {
                ps.setLong(28, operatorUserId);
            } else {
                ps.setNull(28, Types.DECIMAL);
            }

            ps.executeUpdate();

            // insert reasons:
            if (p.getCurrentStatus().getReasons().size() > 0) {
                StringBuffer insertPaymentStatusReasons = new StringBuffer(300);
                insertPaymentStatusReasons.append("INSERT INTO payment_detail_status_reason_xref ");
                insertPaymentStatusReasons.append("(payment_detail_id, payment_status_reason_id) ");
                insertPaymentStatusReasons.append("VALUES (?, ?) ");
                ps.close();

                ps = c.prepareStatement(insertPaymentStatusReasons.toString());

                for (PaymentStatusReason reason : p.getCurrentStatus().getReasons()) {
                    ps.clearParameters();

                    ps.setLong(1, paymentDetailId);
                    ps.setLong(2, reason.getId());
                    ps.executeUpdate();
                }
            }

            return paymentDetailId;
        } finally {
            close(ps);
        }
    }

    // Helper function that adds the specified payment to the database
    // Assumes autocommit is false
    private long makeNewPayment(Connection c, Payment p, boolean createReferralPayment, long operatorUserId) throws Exception {
        log.debug("makeNewPayment called...");
        long paymentId = IdGeneratorClient.getSeqId("PAYMENT_SEQ");
        long paymentDetailId = 0;

        PreparedStatement ps = null;

        // Run validation checks
        checkPayment(c, p, true);

        try {
            fillPaymentNetAmount(p);

            String referralStr = "null";

            p.setRationaleId(MODIFICATION_NEW);
            paymentDetailId = insertPaymentDetail(c, p, operatorUserId);

            // Add the payment record
            StringBuffer insertPayment = new StringBuffer(300);
            insertPayment.append("INSERT INTO payment ");
            insertPayment.append(" (payment_id, user_id, most_recent_detail_id, has_global_ad, ");
            insertPayment.append("  referral_payment_id) ");
            insertPayment.append(" VALUES(?,?,?,?," + referralStr + ")");
            ps = c.prepareStatement(insertPayment.toString());
            ps.setLong(1, paymentId);
            ps.setLong(2, p.getHeader().getUser().getId());
            ps.setLong(3, paymentDetailId);
            ps.setBoolean(4, p.getHasGlobalAD());
            ps.executeUpdate();
            ps.close();
            ps = null;

            // Add the xref record
            StringBuffer insertXref = new StringBuffer(300);
            insertXref.append("INSERT INTO payment_detail_xref ");
            insertXref.append(" (payment_id, payment_detail_id) ");
            insertXref.append(" VALUES(?,?)");
            ps = c.prepareStatement(insertXref.toString());
            ps.setLong(1, paymentId);
            ps.setLong(2, paymentDetailId);
            ps.executeUpdate();
            ps.close();
            ps = null;

            // Create the referral payment if requested and if we can find a referring user
            if (createReferralPayment && p.getInstallmentNumber() == 1) {
                ResultSetContainer rsc = getReferrer(c, p.getHeader().getUser().getId(), p.getEventDate());

                if (rsc.getRowCount() > 0) {

                    double amount = p.getTotalAmount() == 0 ? p.getGrossAmount() : p.getTotalAmount();
                    Payment referPay = new Payment();
                    referPay.setGrossAmount(amount * REFERRAL_PERCENTAGE);
                    referPay.setNetAmount(0);

                    log.debug("saving referral payment");
                    long referId = Long.parseLong(rsc.getItem(0, "reference_id").toString());

                    CoderReferralPayment crp = new CoderReferralPayment(referId,
                            referPay.getGrossAmount(), paymentId);
                    (new PaymentStatusManager()).newPayment(crp);

                    referPay.setCurrentStatus(crp.getCurrentStatus());

                    String handle = rsc.getItem(0, "coder_handle").toString();
                    referPay.getHeader().setDescription("Referral bonus for " + handle + " " + p.getHeader().getDescription());
                    referPay.getHeader().setTypeId(CODER_REFERRAL_PAYMENT);
                    referPay.getHeader().getUser().setId(referId);
                    referPay.setDueDate(p.getDueDate());
                    referPay.getHeader().setParentPaymentId(paymentId);

                    // use the same client as the parent
                    // referral payments always get "TopCoder" as client
                    referPay.getHeader().setClient(REFERRAL_PAYMENTS_CLIENT);
                    log.debug("referrer found:" + handle);

                    // Recursive call
                    long referralId = makeNewPayment(c, referPay, false, operatorUserId);
                    referralStr = "" + referralId;
                }
            }

            // update referral_payment_id
            if (!"null".equals(referralStr)) {
                StringBuffer updatePayment = new StringBuffer(300);
                updatePayment.append("UPDATE payment set referral_payment_id = " + referralStr);
                updatePayment.append(" where payment_id = ?");
                ps = c.prepareStatement(updatePayment.toString());
                ps.setLong(1, paymentId);
                ps.executeUpdate();
                ps.close();
                ps = null;
            }

            return paymentId;
        } catch (Exception e) {
            try {
                if (ps != null) ps.close();
            } catch (Exception e1) {
                printException(e1);
            }
            ps = null;
            throw e;
        }
    }

    private long makeNewContractPayment(Connection c, long contractId, Payment p, long operatorUserId) throws Exception {
        long paymentId = makeNewPayment(c, p, false, operatorUserId);

        // Now add the contract_payment_xref entry
        StringBuffer insertXref = new StringBuffer(300);
        insertXref.append("INSERT INTO contract_payment_xref ");
        insertXref.append(" (contract_id, payment_id) ");
        insertXref.append(" VALUES(" + contractId + "," + paymentId + ")");
        runUpdateQuery(c, insertXref.toString());

        return paymentId;
    }

    // Helper function to check for validity
    private void checkTaxForm(TaxForm t) throws IllegalUpdateException {
        if (t.getDefaultWithholdingAmount() < 0) {
            throw new IllegalUpdateException("Tax form withholding amount cannot be negative");
        }

        if (t.getDefaultWithholdingPercentage() < 0 || t.getDefaultWithholdingPercentage() > 1) {
            throw new IllegalUpdateException("Tax form withholding percentage must be between 0 and 1");
        }
    }

    /**
     * Adds a tax form.
     *
     * @param t           The tax form to add.
     * @param taxFormText The tax form text.
     * @return The new tax form's ID.
     * @throws IllegalUpdateException If the user is trying to make an update that is not allowed.
     * @throws SQLException           If there is some problem updating the data
     */
    public long addTaxForm(TaxForm t, String taxFormText) throws IllegalUpdateException, SQLException {
        Connection c = null;
        PreparedStatement ps = null;

        // Check for validity
        checkTaxForm(t);

        try {
            c = DBMS.getConnection();
            long taxFormId = IdGeneratorClient.getSeqId("TAX_FORM_SEQ");

            StringBuffer insertTaxForm = new StringBuffer(300);
            insertTaxForm.append("INSERT INTO tax_form ");
            insertTaxForm.append(" (name, tax_form_id, text, status_id, tax_form_desc, default_withholding_amount, ");
            insertTaxForm.append("  default_withholding_percentage, use_percentage) ");
            insertTaxForm.append(" VALUES(?,?,?,?,?,?,?,?)");
            ps = c.prepareStatement(insertTaxForm.toString());
            ps.setString(1, t.getHeader().getName());
            ps.setLong(2, taxFormId);
            ps.setBytes(3, DBMS.serializeTextString(taxFormText));
            ps.setInt(4, t.getGenericFormStatusID());
            ps.setString(5, t.getDescription());
            ps.setDouble(6, t.getDefaultWithholdingAmount());
            ps.setDouble(7, t.getDefaultWithholdingPercentage());
            ps.setInt(8, t.isDefaultUsePercentage() ? 1 : 0);
            ps.executeUpdate();
            ps.close();
            ps = null;
            c.close();
            c = null;

            return taxFormId;
        } catch (Exception e) {
            printException(e);
            try {
                if (ps != null) ps.close();
            } catch (Exception e1) {
                printException(e1);
            }
            ps = null;
            try {
                if (c != null) c.close();
            } catch (Exception e1) {
                printException(e1);
            }
            c = null;
            throw new SQLException(e.getMessage());
        }
    }

    /**
     * Adds a user tax form.
     *
     * @param t The user tax form to add.
     * @throws SQLException If there is some problem updating the data
     */
    public void addUserTaxForm(TaxForm t) throws EventFailureException, SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        try {
            c = DBMS.getConnection(trxDataSource);

            StringBuffer getDefaults = new StringBuffer(300);
            getDefaults.append("SELECT default_withholding_amount, default_withholding_percentage, use_percentage ");
            getDefaults.append("FROM tax_form WHERE tax_form_id = " + t.getHeader().getId());
            ResultSetContainer rsc = runSelectQuery(c, getDefaults.toString());
            if (rsc.getRowCount() != 1) {
                throw new SQLException("Tax form ID " + t.getHeader().getId() + " not found or not unique");
            }

            double withholdAmount = TCData.getTCDouble(rsc.getRow(0), "default_withholding_amount");
            float withholdPercent = TCData.getTCFloat(rsc.getRow(0), "default_withholding_percentage");
            int usePercent = TCData.getTCInt(rsc.getRow(0), "use_percentage");

            StringBuffer insertTaxForm = new StringBuffer(300);
            insertTaxForm.append("INSERT INTO user_tax_form_xref ");
            insertTaxForm.append(" (tax_form_id, user_id, date_filed, withholding_amount, withholding_percentage, ");
            insertTaxForm.append("  status_id, use_percentage) ");
            insertTaxForm.append(" VALUES(?,?,?,?,?,?,?)");
            ps = c.prepareStatement(insertTaxForm.toString());
            ps.setLong(1, t.getHeader().getId());
            ps.setLong(2, t.getHeader().getUser().getId());
            try {
                ps.setTimestamp(3, makeTimestamp(t.getHeader().getDateFiled(), true, false));
            } catch (Exception e) {
                printException(e);
                throw new SQLException(e.getMessage());
            }
            ps.setDouble(4, withholdAmount);
            ps.setFloat(5, withholdPercent);
            ps.setInt(6, t.getHeader().getStatusId());
            ps.setInt(7, usePercent);
            ps.executeUpdate();
            ps.close();

            if (t.getHeader().getStatusId() == USER_TAX_FORM_STATUS_ACTIVE) {
                (new PaymentStatusManager()).newTaxForm(t.getHeader().getUser().getId());
            }

            ps = null;

        } catch (Exception e) {
            printException(e);
            ejbContext.setRollbackOnly();
            throw new SQLException(e.getMessage());
        } finally {
            close(ps);
            close(c);
        }
    }

    /**
     * Adds the specified note to the database, and also adds a cross-reference
     * attaching the note to the specified object.
     *
     * @param objectId      The ID of the object with which to associate the new note.
     * @param objectType    The type of the object with which to associate the new note.
     *                      Must be a type defined in <tt>PactsConstants.java</tt> and must be an object that
     *                      can have associated notes.
     * @param taxFormUserId If the object is a tax form, the user ID of
     *                      the tax form.  This parameter is otherwise disregarded.
     * @param n             Data for the new note.
     * @return The new note's ID.
     * @throws SQLException If the object does not exist, or if there is some other problem
     *                      updating the data
     */
    public long addObjectNote(long objectId, int objectType, long taxFormUserId, Note n)
            throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        try {
            c = DBMS.getConnection(trxDataSource);

            // Get ID number
            long noteId = IdGeneratorClient.getSeqId("NOTE_SEQ");

            // Add the note, then add to the appropriate xref table
            StringBuffer insertNote = new StringBuffer(300);
            insertNote.append("INSERT INTO note ");
            insertNote.append(" (text, note_type_id, note_id, submitted_by) ");
            insertNote.append(" VALUES(?,?,?,?)");
            ps = c.prepareStatement(insertNote.toString());
            ps.setBytes(1, DBMS.serializeTextString(n.getText()));
            ps.setInt(2, n.getHeader().getTypeId());
            ps.setLong(3, noteId);
            ps.setLong(4, n.getHeader().getUser().getId());
            ps.executeUpdate();
            ps.close();
            ps = null;

            StringBuffer insertXref = new StringBuffer(300);
            if (objectType == AFFIDAVIT_OBJ) {
                insertXref.append("INSERT INTO affidavit_note_xref ");
                insertXref.append(" (affidavit_id, note_id) ");
                insertXref.append(" VALUES(" + objectId + "," + noteId + ")");
            } else if (objectType == CONTRACT_OBJ) {
                insertXref.append("INSERT INTO contract_note_xref ");
                insertXref.append(" (contract_id, note_id) ");
                insertXref.append(" VALUES(" + objectId + "," + noteId + ")");
            } else if (objectType == PAYMENT_OBJ) {
                insertXref.append("INSERT INTO payment_note_xref ");
                insertXref.append(" (payment_id, note_id) ");
                insertXref.append(" VALUES(" + objectId + "," + noteId + ")");
            } else if (objectType == USER_PROFILE_OBJ) {
                insertXref.append("INSERT INTO user_note_xref ");
                insertXref.append(" (user_id, note_id) ");
                insertXref.append(" VALUES(" + objectId + "," + noteId + ")");
            } else if (objectType == USER_TAX_FORM_OBJ) {
                insertXref.append("INSERT INTO user_tax_form_note_xref ");
                insertXref.append(" (user_id, tax_form_id, note_id) ");
                insertXref.append(" VALUES(" + taxFormUserId + "," + objectId + "," + noteId + ")");
            }

            ps = c.prepareStatement(insertXref.toString());
            ps.executeUpdate();
            ps.close();
            ps = null;

            return noteId;
        } catch (Exception e) {
            printException(e);
            ejbContext.setRollbackOnly();
            throw new SQLException(e.getMessage());
        } finally {
            close(ps);
            close(c);
        }
    }

    /**
     * Adds a cross-reference attaching the specified note to the specified object.
     *
     * @param objectId      The ID of the object with which to associate the note.
     * @param objectType    The type of the object with which to associate the note.
     *                      Must be a type defined in <tt>PactsConstants.java</tt> and must allow notes.
     * @param taxFormUserId If the object is a tax form, the user ID of
     *                      the tax form.  This parameter is otherwise disregarded.
     * @param noteId        The ID of the note to attach.
     * @throws SQLException If there is some problem updating the data
     */
    public void addObjectNoteLink(long objectId, int objectType, long taxFormUserId, long noteId)
            throws SQLException {
        StringBuffer insertXref = new StringBuffer(300);
        if (objectType == AFFIDAVIT_OBJ) {
            insertXref.append("INSERT INTO affidavit_note_xref ");
            insertXref.append(" (affidavit_id, note_id) ");
            insertXref.append(" VALUES(" + objectId + "," + noteId + ")");
        } else if (objectType == CONTRACT_OBJ) {
            insertXref.append("INSERT INTO contract_note_xref ");
            insertXref.append(" (contract_id, note_id) ");
            insertXref.append(" VALUES(" + objectId + "," + noteId + ")");
        } else if (objectType == PAYMENT_OBJ) {
            insertXref.append("INSERT INTO payment_note_xref ");
            insertXref.append(" (payment_id, note_id) ");
            insertXref.append(" VALUES(" + objectId + "," + noteId + ")");
        } else if (objectType == USER_PROFILE_OBJ) {
            insertXref.append("INSERT INTO user_note_xref ");
            insertXref.append(" (user_id, note_id) ");
            insertXref.append(" VALUES(" + objectId + "," + noteId + ")");
        } else if (objectType == USER_TAX_FORM_OBJ) {
            insertXref.append("INSERT INTO user_tax_form_note_xref ");
            insertXref.append(" (user_id, tax_form_id, note_id) ");
            insertXref.append(" VALUES(" + taxFormUserId + "," + objectId + "," + noteId + ")");
        }
        runUpdateQuery(insertXref.toString());
    }

    /*****************************************************
     * Data update functions - updates
     *****************************************************/

    /**
     * Affirms the specified affidavit.
     *
     * @param affidavitId    The ID of the affidavit to affirm.
     * @param finalText      The finalized affidavit text
     * @param coderBirthDate The birth date of the coder
     * @throws IllegalUpdateException If the affidavit has expired or has already
     *                                been affirmed.
     * @throws NoObjectFoundException If the specified affidavit does not exist.
     * @throws SQLException           If there is some other problem updating the data
     */
    public void affirmAffidavit(long affidavitId, String finalText, String coderBirthDate)
            throws NoObjectFoundException, IllegalUpdateException, SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        int rowsModified = 0;
        try {
            c = DBMS.getConnection(trxDataSource);

            StringBuffer checkAffidavit = new StringBuffer(300);
            checkAffidavit.append("SELECT a.status_id, a.payment_id, a.affirmed, ");
            checkAffidavit.append("pd.payment_status_id AS payment_status_id ");
            checkAffidavit.append("FROM affidavit a, OUTER(payment p, payment_detail pd) ");
            checkAffidavit.append("WHERE affidavit_id = " + affidavitId + " ");
            checkAffidavit.append("AND a.payment_id = p.payment_id ");
            checkAffidavit.append("AND p.most_recent_detail_id = pd.payment_detail_id");
            ResultSetContainer rsc = runSelectQuery(c, checkAffidavit.toString());
            if (rsc.getRowCount() == 0) {
                throw new NoObjectFoundException("Affidavit " + affidavitId + " not found in database");
            }

            int statusId = TCData.getTCInt(rsc.getRow(0), "status_id");
            if (statusId == AFFIDAVIT_EXPIRED_STATUS) {
                throw new IllegalUpdateException("Affidavit " + affidavitId + " has expired and may not be affirmed");
            }

            int affirmed = TCData.getTCInt(rsc.getRow(0), "affirmed");
            if (affirmed == 1) {
                throw new IllegalUpdateException("Affidavit " + affidavitId + " has already been affirmed");
            }

            Long paymentId = (Long) rsc.getItem(0, "payment_id").getResultData();

            if (paymentId != null) {
                (new PaymentStatusManager()).affirmedAffidavit(paymentId);
            }

            StringBuffer updateAffidavit = new StringBuffer(300);
            updateAffidavit.append("UPDATE affidavit SET affirmed = 1, date_affirmed = ?, text = ?, ");
            updateAffidavit.append(" status_id = " + AFFIDAVIT_AFFIRMED_STATUS);
            updateAffidavit.append(" WHERE affidavit_id = " + affidavitId);
            ps = c.prepareStatement(updateAffidavit.toString());
            ps.setDate(1, new java.sql.Date(System.currentTimeMillis()));
            ps.setBytes(2, DBMS.serializeTextString(finalText));
            ps.executeUpdate();
            ps.close();

            StringBuffer updateCoder = new StringBuffer(300);
            updateCoder.append("UPDATE coder SET date_of_birth = ? WHERE coder_id = ");
            updateCoder.append(" (SELECT user_id FROM affidavit WHERE affidavit_id = " + affidavitId + ") ");
            ps = c.prepareStatement(updateCoder.toString());
            ps.setTimestamp(1, makeTimestamp(coderBirthDate, false, false));
            rowsModified = ps.executeUpdate();

            if (rowsModified == 0) {
                throw new NoObjectFoundException("User for affidavit " + affidavitId + " not found in database");
            }

        } catch (Exception e) {
            printException(e);
            ejbContext.setRollbackOnly();
            if (e instanceof NoObjectFoundException)
                throw (NoObjectFoundException) e;
            else if (e instanceof IllegalUpdateException)
                throw (IllegalUpdateException) e;
            else
                throw new SQLException(e.getMessage());
        } finally {
            close(ps);
            close(c);
        }
    }

    /**
     * Updates the given affidavit (excluding text updates and affirmations).
     *
     * @param a The updated affidavit information
     * @throws NoObjectFoundException If the specified affidavit was not found
     * @throws SQLException           If there is some problem updating the data
     */
    public void updateAffidavit(Affidavit a) throws NoObjectFoundException, SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        int rowsModified = 0;

        try {
            c = DBMS.getConnection(trxDataSource);

            String longStr = "";
            if (a.getRoundId() == null)
                longStr = "null";
            else
                longStr = "" + a.getRoundId().longValue();

            StringBuffer update = new StringBuffer(300);
            update.append("UPDATE affidavit SET round_id = " + longStr);
            update.append(" ,user_id = ?");
            update.append(" ,status_id = ?");
            update.append(" ,notarized = ?");
            update.append(" ,payment_id = ?");
            update.append(" ,affidavit_desc = ?");
            update.append(" ,affidavit_type_id = ?");
            update.append(" WHERE affidavit_id = ?");

            ps = c.prepareStatement(update.toString());
            ps.setLong(1, a.getHeader().getUser().getId());
            ps.setInt(2, a.getHeader().getStatusId());
            ps.setInt(3, (a.getHeader().isNotarized() ? 1 : 0));
            if (a.getPayment().getId() > 0) {
                ps.setLong(4, a.getPayment().getId());
            } else {
                ps.setNull(4, Types.NUMERIC);
            }
            ps.setString(5, a.getHeader().getDescription());
            ps.setInt(6, a.getHeader().getTypeId());
            ps.setLong(7, a.getHeader().getId());

            rowsModified = ps.executeUpdate();
        } catch (Exception e) {
            printException(e);
            throw new SQLException(e.getMessage());
        } finally {
            close(ps);
            close(c);
        }

        if (rowsModified == 0)
            throw new NoObjectFoundException("Affidavit " + a.getHeader().getId() + " not found in database");
    }


    public Map<Long, String> newPaymentEvent(String[] paymentIDs, int event, String value, Date payDate, long operatorUserId) {
        Map<Long, String> errors = new HashMap<Long, String>();
        List<BasePayment> updatePayments = new ArrayList<BasePayment>();

        boolean rollback = true;

        if (event==2 && payDate==null) {
            errors.put(0l, "Incorrect payment date.");
        }

        Map criteria = new HashMap();
        for (String paymentId : paymentIDs) {
            criteria.clear();
            criteria.put(PAYMENT_ID, paymentId);
            log.debug("looking for paymentId : " + paymentId);
            BasePayment payment = null;

            payment = findCoderPayments(criteria).get(0);

            // before applying the event, check users for inactivation
            try {
                if (checkInactiveCoders(payment.getCoderId()) == 0) {
                    PaymentStatusManager psm = new PaymentStatusManager();

                    try {
                        switch (event) {
                            case 1:
                                if (payment.getMethodId() == Constants.NOT_SET_PAYMENT_METHOD_ID) {
                                    errors.put(payment.getId(), "The payment method field is not set.");
                                } else {
                                    psm.newUserEvent(payment, UserEvents.ENTER_INTO_PAYMENT_SYSTEM_EVENT);
                                }
                                break;
                            case 2:
                                psm.newUserEvent(payment, UserEvents.PAY_EVENT);
                                payment.setPaidDate(payDate);
                                break;
                            case 3:
                                if (isInvoicedPayment(payment.getId())) {
                                    errors.put(payment.getId(), "Can't delete invoiced payment.");
                                } else {
                                    psm.newUserEvent(payment, UserEvents.DELETE_EVENT);
                                }
                                break;
                            case 4:
                                payment.setInvoiceNumber(value);
                                break;
                            case 5:
                                Long paymentMethodId = getUserPaymentMethod(payment.getCoderId());
                                if (paymentMethodId == null) {
                                    errors.put(payment.getId(), "The member has not set the preferred payment method.");
                                } else if (payment.getCurrentStatus().getId() != OwedPaymentStatus.ID) {
                                    errors.put(payment.getId(), "Can't assign payment method for payment in " +
                                               payment.getCurrentStatus().getDesc() + " status");
                                } else {
                                    payment.setMethodId(paymentMethodId);
                                }

                                break;
                        }
                    } catch (EventFailureException efe) {
                        errors.put(payment.getId(), efe.getCause().getMessage());
                    }
                    updatePayments.add(payment);
                } else {
                    errors.put(0l, "Inactive users detected, payments were canceled. Please check your selection and try again.");
                    rollback = false;
                }
            } catch (SQLException sqle) {
                errors.put(0l, "System error, action failed.");
            }
        }

        if (errors.size() > 0) {
            if (rollback) {
                ejbContext.setRollbackOnly();
            }
        } else {
            for (BasePayment payment : updatePayments) {
                try {
                    updatePayment(payment, false, operatorUserId);
                } catch (Exception e) {
                    ejbContext.setRollbackOnly();
                    errors.put(payment.getId(), e.getMessage());
                    return errors;
                }
            }
        }
        return errors;
    }

    /**
     * Updates the given contract (excluding text updates).
     *
     * @param c The updated contract information
     * @throws NoObjectFoundException If the specified contract was not found
     * @throws SQLException           If there is some problem updating the data
     */
    public void updateContract(Contract c) throws NoObjectFoundException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int rowsModified = 0;

        try {
            con = DBMS.getConnection();
            StringBuffer update = new StringBuffer(300);
            update.append("UPDATE contract SET name = ?");
            update.append(" ,contracted_user_id = ?");
            update.append(" ,start_date = ?");
            update.append(" ,end_date = ?");
            update.append(" ,contract_desc = ?");
            update.append(" ,status_id = ?");
            update.append(" ,contract_type_id = ?");
            update.append(" WHERE contract_id = ?");

            ps = con.prepareStatement(update.toString());
            ps.setString(1, c.getHeader().getName());
            ps.setLong(2, c.getHeader().getUser().getId());
            ps.setTimestamp(3, makeTimestamp(c.getStartDate(), true, false));
            ps.setTimestamp(4, makeTimestamp(c.getEndDate(), true, false));
            ps.setString(5, c.getDescription());
            ps.setInt(6, c.getHeader().getStatusId());
            ps.setInt(7, c.getHeader().getTypeId());
            ps.setLong(8, c.getHeader().getId());

            rowsModified = ps.executeUpdate();
            ps.close();
            ps = null;

            con.close();
            con = null;
        } catch (Exception e) {
            printException(e);
            try {
                if (ps != null) ps.close();
            } catch (Exception e1) {
                printException(e1);
            }
            ps = null;
            try {
                if (con != null) con.close();
            } catch (Exception e1) {
                printException(e1);
            }
            con = null;
            throw new SQLException(e.getMessage());
        }

        if (rowsModified == 0)
            throw new NoObjectFoundException("Contract " + c.getHeader().getId() + " not found in database");
    }

    /**
     * Helper function for a payment update for regular users
     * <p/>
     * Note: this methods assumes autocommit is false.
     *
     * @param p the payment to update
     * @throws Exception if the update fails
     */
    private void updatePayment(Payment p) throws Exception {
        updatePayment(p, false, 0);
    }

    /**
     * Helper function for a payment update
     * <p/>
     * Note: this methods assumes autocommit is false and uses a trxDataSource.
     *
     * @param p          the payment to update
     * @param supervisor true if the update requester is a supervisor
     * @param operatorUserId User ID of the operator or 0 if not set
     * @throws Exception if the update fails
     */
    private void updatePayment(Payment p, boolean supervisor, long operatorUserId) throws Exception {
        PreparedStatement ps = null;
        Connection c = null;

        try {
            c = DBMS.getConnection(trxDataSource);

            // if a supervisor is updating this payment, don't perform checks, they
            // can do anything.
            if (!supervisor) {
                // Check for validity
                checkPayment(c, p, false);
            }

            fillPaymentNetAmount(p);

            long paymentDetailId = insertPaymentDetail(c, p, operatorUserId);

            String paymentDetailStr = paymentDetailId + "";

            // Update the header
            StringBuffer updateHeader = new StringBuffer(300);
            updateHeader.append("UPDATE payment SET most_recent_detail_id = " + paymentDetailStr);
            updateHeader.append(" WHERE payment_id = " + p.getHeader().getId());
            ps = c.prepareStatement(updateHeader.toString());
            int rowsModified = ps.executeUpdate();
            ps.close();
            ps = null;

            // Insert the xref
            StringBuffer insertXref = new StringBuffer(300);
            insertXref.append("INSERT INTO payment_detail_xref ");
            insertXref.append(" (payment_id, payment_detail_id) ");
            insertXref.append(" VALUES(?,?)");
            ps = c.prepareStatement(insertXref.toString());
            ps.setLong(1, p.getHeader().getId());
            ps.setLong(2, paymentDetailId);
            ps.executeUpdate();
            ps.close();
            ps = null;

            if (rowsModified == 0) {
                throw new NoObjectFoundException("Payment " + p.getHeader().getId() + " not found in database");
            }
        } finally {
            close(ps);
            close(c);
        }
    }

    /**
     * Updates the given tax form (excluding text updates).
     *
     * @param t The updated tax form information
     * @throws NoObjectFoundException If the specified tax form was not found
     * @throws IllegalUpdateException If the user is trying to make an update that is not allowed
     * @throws SQLException           If there is some problem updating the data
     */
    public void updateTaxForm(TaxForm t) throws NoObjectFoundException, SQLException, IllegalUpdateException {
        Connection c = null;
        PreparedStatement ps = null;
        int rowsModified = 0;

        // Check for validity
        checkTaxForm(t);

        try {
            c = DBMS.getConnection();

            StringBuffer update = new StringBuffer(300);
            update.append("UPDATE tax_form SET name = ?");
            update.append(" ,status_id = ?");
            update.append(" ,tax_form_desc = ?");
            update.append(" ,default_withholding_amount = ?");
            update.append(" ,default_withholding_percentage = ?");
            update.append(" ,use_percentage = ?");
            update.append(" WHERE tax_form_id = ?");

            ps = c.prepareStatement(update.toString());
            ps.setString(1, t.getHeader().getName());
            ps.setInt(2, t.getGenericFormStatusID());
            ps.setString(3, t.getDescription());
            ps.setDouble(4, t.getDefaultWithholdingAmount());
            ps.setFloat(5, t.getDefaultWithholdingPercentage());
            ps.setInt(6, t.isDefaultUsePercentage() ? 1 : 0);
            ps.setLong(7, t.getHeader().getId());

            rowsModified = ps.executeUpdate();
            ps.close();
            ps = null;

            c.close();
            c = null;
        } catch (Exception e) {
            printException(e);
            try {
                if (ps != null) ps.close();
            } catch (Exception e1) {
                printException(e1);
            }
            ps = null;
            try {
                if (c != null) c.close();
            } catch (Exception e1) {
                printException(e1);
            }
            c = null;
            throw new SQLException(e.getMessage());
        }

        if (rowsModified == 0) {
            throw new NoObjectFoundException("Tax form " + t.getHeader().getId() + " not found in database");
        }
    }

    /**
     * Updates the given user tax form (user_tax_form_xref table only;
     * to update data in tax_form, use <tt>updateTaxForm()</tt>)
     *
     * @param t The updated tax form information
     * @throws NoObjectFoundException If the specified user tax form was not found
     * @throws IllegalUpdateException If the user is trying to make an update that is not allowed.
     * @throws SQLException           If there is some problem updating the data
     */
    public void updateUserTaxForm(TaxForm t) throws NoObjectFoundException, IllegalUpdateException, SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        int rowsModified = 0;

        if (t.getWithholdingAmount() < 0) {
            throw new IllegalUpdateException("Tax form withholding amount cannot be negative");
        }

        if (t.getWithholdingPercentage() < 0 || t.getWithholdingPercentage() > 1) {
            throw new IllegalUpdateException("Tax form withholding percentage must be between 0 and 1");
        }

        try {
            c = DBMS.getConnection(trxDataSource);

            StringBuffer update = new StringBuffer(300);
            update.append("UPDATE user_tax_form_xref SET date_filed = ?");
            update.append(" ,withholding_amount = ?");
            update.append(" ,withholding_percentage = ?");
            update.append(" ,status_id = ?");
            update.append(" ,use_percentage = ?");
            update.append(" WHERE tax_form_id = ? AND user_id = ?");

            ps = c.prepareStatement(update.toString());
            ps.setTimestamp(1, makeTimestamp(t.getHeader().getDateFiled(), true, false));
            ps.setDouble(2, t.getWithholdingAmount());
            ps.setFloat(3, t.getWithholdingPercentage());
            ps.setInt(4, t.getHeader().getStatusId());
            ps.setInt(5, t.isUsePercentage() ? 1 : 0);
            ps.setLong(6, t.getHeader().getId());
            ps.setLong(7, t.getHeader().getUser().getId());

            rowsModified = ps.executeUpdate();
            ps.close();
            ps = null;

            if (t.getHeader().getStatusId() == USER_TAX_FORM_STATUS_ACTIVE) {
                (new PaymentStatusManager()).newTaxForm(t.getHeader().getUser().getId());
            }

        } catch (Exception e) {
            printException(e);
            ejbContext.setRollbackOnly();
            throw new SQLException(e.getMessage());
        } finally {
            close(ps);
            close(c);
        }

        if (rowsModified == 0) {
            StringBuffer sb = new StringBuffer(300);
            sb.append("User tax form with user ID " + t.getHeader().getUser().getId() + " and tax form ID ");
            sb.append(t.getHeader().getUser() + " not found in database");
            throw new NoObjectFoundException(sb.toString());
        }
    }

    /**
     * Updates the text for the given contract or tax form.
     *
     * @param objectId   The object ID to update
     * @param objectType The object type to update
     * @param newText    The updated text
     * @throws NoObjectFoundException If the specified object does not exist.
     * @throws SQLException           If there is some other problem updating the data
     */
    public void updateText(long objectId, int objectType, String newText)
            throws NoObjectFoundException, SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        int rowsModified = 0;
        try {
            c = DBMS.getConnection(trxDataSource);
            StringBuffer update = new StringBuffer(300);

            if (objectType == CONTRACT_OBJ) {
                update.append("UPDATE contract SET text = ? WHERE contract_id = " + objectId);
            } else if (objectType == TAX_FORM_OBJ) {
                update.append("UPDATE tax_form SET text = ? WHERE tax_form_id = " + objectId);
            }

            ps = c.prepareStatement(update.toString());
            ps.setBytes(1, DBMS.serializeTextString(newText));
            rowsModified = ps.executeUpdate();

            if (rowsModified == 0) {
                throw new NoObjectFoundException("Object with ID " + objectId + " not found in database");
            }
        } catch (Exception e) {
            printException(e);
            ejbContext.setRollbackOnly();
            if (e instanceof NoObjectFoundException)
                throw (NoObjectFoundException) e;
            else
                throw new SQLException(e.getMessage());
        } finally {
            close(ps);
            close(c);
        }
    }

    // Helper function to make a list of ID's into a String
    private String makeList(long idList[]) {
        StringBuffer listBuffer = new StringBuffer();
        for (int i = 0; i < idList.length; i++) {
            if (i > 0)
                listBuffer.append(",");
            listBuffer.append(idList[i]);
        }
        return listBuffer.toString();
    }

    private String makeList(int idList[]) {
        long[] list = new long[idList.length];
        for (int i = 0; i < list.length; i++) {
            list[i] = (long) idList[i];
        }
        return makeList(list);
    }

    /*****************************************************
     * Utility functions
     *****************************************************/

    /**
     * Returns true iff the specified user is allowed to affirm an affidavit
     * of the specified type.  This will be the case if the user has at least
     * one notarized affidavit of that type on file, and has fully filled out
     * the member profile demographic information.  If the user does not exist
     * in the database, the method returns false.
     *
     * @param userId          The user ID to check.
     * @param affidavitTypeId The type of the affidavit.
     * @return Whether or not the user can affirm an affidavit of the specified type.
     * @throws SQLException If there is some problem querying the database
     */
    public boolean canAffirmAffidavit(long userId, int affidavitTypeId) throws SQLException {
        return hasNotarizedAffidavit(userId, affidavitTypeId) && hasAllDemographicAnswers(userId) && hasTaxForm(userId);
    }


    public boolean hasNotarizedAffidavit(long userId, int affidavitTypeId) throws SQLException {

        StringBuffer query = new StringBuffer(300);
        query.append("SELECT COUNT(*) FROM affidavit WHERE user_id = " + userId);
        //does it matter what type of affidavit was notarized?  i don't think so
        //query.append(" AND affidavit_type_id = " + affidavitTypeId);
        query.append(" AND notarized = 1");
        Connection c = null;
        boolean ret = false;
        try {
            c = DBMS.getConnection(trxDataSource);
            ResultSetContainer rsc = runSelectQuery(c, query.toString());
            ret = Integer.parseInt(rsc.getItem(0, 0).toString()) > 0;
        } finally {
            close(c);
        }
        return ret;

    }

    public boolean hasAllDemographicAnswers(long userId) throws SQLException {

        StringBuffer query = new StringBuffer(300);
        query.append("SELECT dq.demographic_question_id ");
        query.append(" , CASE WHEN EXISTS ");
        query.append("         (SELECT registration_type_id   ");
        query.append("          FROM user_group_xref x, ");
        query.append("               registration_type_lu r ");
        query.append("          WHERE x.group_id = r.security_group_id ");
        query.append("          AND x.login_id = " + userId);
        query.append("          AND r.registration_type_id =3) ");
        query.append("          THEN 1 ELSE 0 END as is_registered_hs ");
        query.append(" FROM demographic_assignment da, demographic_question dq ");
        query.append(" WHERE da.coder_type_id = ");
        query.append("  (SELECT coder_type_id from coder where coder_id = " + userId + ") ");
        query.append(" AND dq.demographic_question_id = da.demographic_question_id ");
        query.append(" and da.status = 'A'");
        query.append(" AND dq.demographic_question_id NOT IN ");
        query.append("  (SELECT demographic_question_id FROM demographic_response ");
        query.append("   WHERE user_id = " + userId + ") ");
        query.append(" AND da.registration_type_id in ( ");
        query.append("        SELECT registration_type_id ");
        query.append("        FROM user_group_xref x, ");
        query.append("             registration_type_lu r ");
        query.append("        WHERE x.group_id = r.security_group_id ");
        query.append("        AND x.login_id = " + userId + ") ");
        query.append(" AND da.is_required = 1 ");

        Connection c = null;
        boolean ret = false;
        try {
            c = DBMS.getConnection();
            ResultSetContainer rsc = runSelectQuery(c, query.toString());


            if (rsc.size() == 0) {
                log.debug("User " + userId + " has all demographic answers (no questions without reply)");
                return true;
            }

            // not registered for hs, should have all the questions answered
            if (rsc.getIntItem(0, "is_registered_hs") == 0) {
                log.debug("User " + userId + " is missing demographic answers");
                return false;
            }

            // the coder is in hs, can have some questions unanswered
            for (int i = 0; i < rsc.size(); i++) {
                Long l = rsc.getLongItem(i, "demographic_question_id");

                if (!(l.equals(COLLEGE_MAJOR) ||
                        l.equals(COLLEGE_MAJOR_DESC) ||
                        l.equals(DEGREE_PROGRAM))) {

                    log.debug("User " + userId + " is missing at least demographic answer for question " + l);

                    return false;
                }
            }

            log.debug("User " + userId + " has all demographic answers (hs exceptions applied)");
            return true;

        } catch (SQLException e) {
            close(c);
        } finally {
            close(c);
        }
        return ret;

    }

    /**
     * Get if the payment type requires client.
     *
     * @param paymentTypeId type id of the payment
     * @return true if the payment type requires client.
     */
    public int requiresClient(int paymentTypeId) throws SQLException {
        StringBuffer query = new StringBuffer(100);
        query.append(" SELECT requires_client_ind ");
        query.append(" FROM payment_type_lu ");
        query.append(" WHERE payment_type_id = " + paymentTypeId);

        ResultSetContainer rsc = runSelectQuery(query.toString());

        if (rsc.getRowCount() != 1) {
            throw new IllegalArgumentException("Payment type not found: " + paymentTypeId);
        }

        if (rsc.getItem(0, "requires_client_ind").getResultData() != null) {
            return rsc.getIntItem(0, "requires_client_ind");
        }

        return 0;
    }

    /**
     * Get if the payment type requires globalAD.
     *
     * @param paymentTypeId type id of the payment
     * @return true if the payment type requires global AD.
     */
    public boolean requiresGlobalAD(int paymentTypeId) throws SQLException {
        StringBuffer query = new StringBuffer(100);
        query.append(" SELECT global_ad_ind ");
        query.append(" FROM payment_type_lu ");
        query.append(" WHERE payment_type_id = " + paymentTypeId);

        ResultSetContainer rsc = runSelectQuery(query.toString());

        if (rsc.getRowCount() != 1) {
            throw new IllegalArgumentException("Payment type not found: " + paymentTypeId);
        }

        if (rsc.getItem(0, "global_ad_ind").getResultData() != null) {
            return (rsc.getBooleanItem(0, "global_ad_ind"));
        }

        return false;
    }
    public boolean hasTaxForm(long userId) throws SQLException {

        // Change to also check for tax forms on file
        StringBuffer query = new StringBuffer(300);
        query.append("SELECT COUNT(*) FROM user_tax_form_xref WHERE status_id=60 and user_id = " + userId);

        boolean ret = false;

        Connection c = null;
        try {
            c = DBMS.getConnection(trxDataSource);
            ResultSetContainer rsc = runSelectQuery(c, query.toString());
            ret = Integer.parseInt(rsc.getItem(0, 0).toString()) > 0;
        } finally {
            close(c);
        }

        return ret;
    }


    public boolean hasGlobalAD(long userId) throws SQLException {

        if ("on".equalsIgnoreCase(com.topcoder.web.tc.Constants.GLOBAL_AD_FLAG)) {
            StringBuffer query = new StringBuffer(300);
            query.append("SELECT COUNT(*) FROM assignment_document WHERE user_id = " + userId);
            query.append(" and assignment_document_type_id = " + AssignmentDocumentType.GLOBAL_TYPE_ID);
            query.append(" and assignment_document_status_id = " + AssignmentDocumentStatus.AFFIRMED_STATUS_ID);

            boolean ret = false;

            Connection c = null;
            try {
                c = DBMS.getConnection(trxDataSource);
                ResultSetContainer rsc = runSelectQuery(c, query.toString());
                ret = Integer.parseInt(rsc.getItem(0, 0).toString()) > 0;

            } finally {
                close(c);
            }
            return ret;
        } else {
            return false;
        }
    }

    public long getGlobalADId(long userId) throws SQLException {
        StringBuffer query = new StringBuffer(300);
        query.append("SELECT assignment_document_id FROM assignment_document WHERE user_id = " + userId);
        query.append(" and assignment_document_type_id = " + AssignmentDocumentType.GLOBAL_TYPE_ID);
        query.append(" and assignment_document_status_id = " + AssignmentDocumentStatus.AFFIRMED_STATUS_ID);

        long ret = 0;

        Connection c = null;
        try {
            c = DBMS.getConnection(trxDataSource);
            ResultSetContainer rsc = runSelectQuery(c, query.toString());
            if (rsc.size() > 0) {
                ret = rsc.getLongItem(0, 0);
            }
        } finally {
            close(c);
        }
        return ret;
    }

    private int generateRoundPayments(long roundId, int affidavitTypeId, boolean makeChanges)
            throws IllegalUpdateException, SQLException {
        return generateRoundPayments(roundId, affidavitTypeId, makeChanges, ALGORITHM_CONTEST_PAYMENT);
    }

    /**
     * Generates all the affidavits and payments for the people who won
     * money in the given contest round.  Returns the number of
     * affidavit/payment pairs generated.
     *
     * @param roundId     The ID of the round
     * @param makeChanges If true, updates the database; if false, logs
     *                    the changes that would have been made had this parameter been true.
     * @return The number of affidavit/payment pairs generated.
     * @throws IllegalUpdateException If the affidavit/payment information
     *                                has already been generated for this round.
     * @throws SQLException           If there was some error updating the data.
     */
    public int generateRoundPayments(long roundId, int affidavitTypeId, boolean makeChanges, int paymentTypeId)
            throws IllegalUpdateException, SQLException {
        log.debug("generateRoundPayments called...");
        int i;
        Connection c = null;
        SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_STRING);

        try {
            c = DBMS.getConnection(trxDataSource);

            // Make sure we haven't done this before for this round.
            StringBuffer checkNew = new StringBuffer(300);
            checkNew.append("SELECT COUNT(*) FROM affidavit WHERE round_id = " + roundId);
            ResultSetContainer rsc = runSelectQuery(c, checkNew.toString());
            int existingAffidavits = Integer.parseInt(rsc.getItem(0, 0).toString());
            if (existingAffidavits > 0) {
                throw new IllegalUpdateException("Data already generated for round " + roundId + "!");
            }

            AlgorithmContestPaymentDataRetriever retriever = new AlgorithmContestPaymentDataRetriever(roundId);
            String roundName = retriever.getRoundName();
            String dueDate = sdf.format(retriever.getDueDate());
            Date eventDate = retriever.getEventDate();

            StringBuffer getWinners = new StringBuffer(300);
            getWinners.append("SELECT rr.room_id, rr.coder_id, rr.room_placed, rp.paid, a.country_code, rp.payment_type_id ");
            getWinners.append("FROM room_result rr, user u, user_address_xref x, address a, round_payment rp ");
            getWinners.append("WHERE rr.round_id = " + roundId + " ");
            getWinners.append("AND rp.paid > 0 ");
            getWinners.append("AND rr.coder_id = u.user_id ");
            getWinners.append("and u.user_id = x.user_id ");
            getWinners.append("and x.address_id = a.address_id ");
            getWinners.append("and a.address_type_id = 2 ");
            getWinners.append("AND rr.coder_id = rp.coder_id ");
            getWinners.append("AND rr.round_id = rp.round_id ");
            getWinners.append(" ORDER BY rr.room_id, rr.room_placed");
            ResultSetContainer winners = runSelectQuery(c, getWinners.toString());
            int numWinners = winners.getRowCount();

            StringBuffer getAffidavitTexts = new StringBuffer(300);
            getAffidavitTexts.append("SELECT x.country_code, att.text ");
            getAffidavitTexts.append("FROM affidavit_template att, country_affidavit_template_xref x ");
            getAffidavitTexts.append("WHERE att.affidavit_type_id = " + affidavitTypeId);
            getAffidavitTexts.append(" and att.affidavit_template_id =x.affidavit_template_id ");
            ResultSetContainer texts = runSelectQuery(c, getAffidavitTexts.toString());
            int numTexts = texts.getRowCount();

            HashMap textMap = new HashMap();
            for (i = 0; i < numTexts; i++) {
                String key = texts.getItem(i, 0).toString();
                String value = texts.getItem(i, 1).toString();
                textMap.put(key, value);
            }

            for (i = 0; i < numWinners; i++) {
                long userId = Long.parseLong(winners.getItem(i, "coder_id").toString());

                Affidavit a = new Affidavit();
                a.setRoundId(new Long(roundId));
                a.getHeader().getUser().setId(userId);
                a.getHeader().setStatusId(AFFIDAVIT_PENDING_STATUS);
                a.getHeader().setDescription(roundName + " contest affidavit");
                a.getHeader().setTypeId(affidavitTypeId);

                Payment p = new Payment();
                p.setGrossAmount(TCData.getTCDouble(winners.getRow(i), "paid"));

                if (makeChanges) {
                    AlgorithmContestPayment acp = new AlgorithmContestPayment(userId, 0.01, roundId);
                    (new PaymentStatusManager()).newPayment(acp);
                    p.setCurrentStatus(acp.getCurrentStatus());
                }

                p.getHeader().setDescription(roundName + " winnings");
                p.getHeader().setTypeId(paymentTypeId);
                p.setDueDate(dueDate);
                p.getHeader().getUser().setId(userId);
                p.setEventDate(eventDate);
                p.getHeader().setAlgorithmRoundId(roundId);

                if (TCData.getTCInt(winners.getRow(i), "payment_type_id") == CHARITY_PAYMENT) {
                    p.setCharity(true);
                }

                String countryCode = winners.getItem(i, "country_code").toString();
                String text = (String) textMap.get(countryCode);
                if (text == null) {
                    throw new SQLException("Affidavit template is missing for country code " + countryCode +
                            " type " + affidavitTypeId);
                }

                if (makeChanges) {
                    makeAffidavitPayment(c, a, text, p);
                } else {
                    StringBuffer pairAdd = new StringBuffer(300);
                    pairAdd.append("Added an affidavit/payment pair with the following information:\n");
                    pairAdd.append("Affidavit round ID: " + a.getRoundId().longValue() + "\n");
                    pairAdd.append("Affidavit user ID: " + a.getHeader().getUser().getId() + "\n");
                    pairAdd.append("Affidavit status ID: " + a.getHeader().getStatusId() + "\n");
                    pairAdd.append("Affidavit description: " + a.getHeader().getDescription() + "\n");
                    pairAdd.append("Affidavit type ID: " + a.getHeader().getTypeId() + "\n");
                    pairAdd.append("Affidavit text (start): ");
                    if (text != null) {
                        pairAdd.append(text.substring(0, 50));
                    }
                    pairAdd.append("\nPayment gross amount: " + p.getGrossAmount() + "\n");
                    //pairAdd.append("Payment status ID: " + p.getCurrentStatus() + "\n");
                    pairAdd.append("Payment description: " + p.getHeader().getDescription() + "\n");
                    pairAdd.append("Payment type ID: " + p.getHeader().getTypeId() + "\n");
                    pairAdd.append("Payment due date: " + p.getDueDate() + "\n");
                    pairAdd.append("Payment user ID: " + p.getHeader().getUser().getId() + "\n");
                    ResultSetContainer referRsc = getReferrer(c, p.getHeader().getUser().getId(), p.getEventDate());
                    pairAdd.append("Added referral payment: " + (referRsc.getRowCount() == 1 ? "yes" : "no") + "\n");
                    pairAdd.append("----------------------------------");
                    log.info(pairAdd.toString());
                }
            }

            return numWinners;
        } catch (Exception e) {
            printException(e);
            if (makeChanges) {
                ejbContext.setRollbackOnly();
            }
            if (e instanceof IllegalUpdateException)
                throw (IllegalUpdateException) e;
            throw new SQLException(e.getMessage());
        } finally {
            close(c);
        }
    }

    public int generateRoundPayments(long roundId, boolean makeChanges)
            throws IllegalUpdateException, SQLException {
        return generateRoundPayments(roundId, CONTEST_WINNING_AFFIDAVIT, makeChanges);
    }

    public int generateRoundPayments(long roundId, boolean makeChanges, int paymentTypeId)
            throws IllegalUpdateException, SQLException {
        return generateRoundPayments(roundId, CONTEST_WINNING_AFFIDAVIT, makeChanges, paymentTypeId);
    }

    /**
    
     * Generates all the payments for the people who won money for the given project (winners and
     * and review board members).
     * It doesn't insert the payments in the DB, just generates and returns them.
     * <p>
     * Version 1.6 (Online Review Payments and Status Automation Assembly 1.0) Changes Notes:
     * <ul>
     * <li>Component Payments can only be paid once check is removed.</li>
     * <li>a new parameter is added to populate the related resource ids for generated component payments.</li>
     * </ul>
     * </p>
     *
     * @param projectId         The ID of the project
     * @param status            The project's status (see /topcoder/apps/review/projecttracker/ProjectStatus.java)
     * @param client            The project's client (optional)
     * @return The generated payments in a List of BasePayment
     * @throws IllegalUpdateException If the affidavit/payment information has already been generated for this round.
     * @throws SQLException           If there was some error updating the data.
     */
    public List generateComponentPayments(long projectId, long status, String client, List resourceIds)
            throws IllegalUpdateException, SQLException, EventFailureException {
        log.debug("generateComponentPayments called...");

        List payments = new ArrayList();
        ResultSetContainer rsc = null;
        List<Long> pendingUserIds = getPendingUserIds(projectId);
        Map<Long,Double> penalties = getPaymentPenalties(projectId);

        // Get winning designers/developers to be paid
        log.info("Generating payments for winners");

        StringBuffer getWinners = new StringBuffer(300);
        getWinners.append(" SELECT s.placement as placed, ri1.value::int as user_id, r.resource_id, stl.name as submission_type, ");

        getWinners.append(" CASE ");
        getWinners.append("    WHEN pcl.project_type_id = 3 OR ");
        getWinners.append("         exists (select 1 from tcs_catalog:submission s2, tcs_catalog:upload u2 where ");
        getWinners.append("             s2.upload_id=u2.upload_id and u.project_id=u2.project_id and s2.prize_id is not null) THEN NVL(pr.prize_amount,0) ");
        getWinners.append("    ELSE ROUND(ri7.value) ");
        getWinners.append(" END::float AS payment ");

        getWinners.append(" FROM tcs_catalog:project p "); 
        getWinners.append(" INNER JOIN tcs_catalog:project_category_lu pcl ON pcl.project_category_id = p.project_category_id ");
        getWinners.append(" INNER JOIN tcs_catalog:resource r ON r.project_id = p.project_id AND r.resource_role_id = 1 ");
        getWinners.append(" INNER JOIN tcs_catalog:resource_info ri1 ON r.resource_id = ri1.resource_id AND ri1.resource_info_type_id = 1 ");
        getWinners.append(" INNER JOIN tcs_catalog:resource_info ri7 ON r.resource_id = ri7.resource_id AND ri7.resource_info_type_id = 7 ");
        getWinners.append(" INNER JOIN tcs_catalog:upload u ON u.resource_id = r.resource_id AND u.upload_type_id = 1 AND u.upload_status_id = 1 ");
        getWinners.append(" INNER JOIN tcs_catalog:submission s ON s.upload_id = u.upload_id AND s.submission_type_id in (1,3) and s.placement IS NOT NULL ");
        getWinners.append(" INNER JOIN tcs_catalog:submission_type_lu stl ON stl.submission_type_id=s.submission_type_id ");
        getWinners.append(" LEFT OUTER JOIN tcs_catalog:prize pr ON pr.prize_id = s.prize_id ");

        getWinners.append(" WHERE p.project_id = " + projectId + " ");
        getWinners.append(" AND r.resource_id not in (SELECT ri8.resource_id FROM tcs_catalog:resource_info ri8 WHERE ri8.resource_info_type_id=8 AND ri8.value='Yes') ");

        rsc = runSelectQuery(getWinners.toString());
        for (int i = 0; i < rsc.size(); i++) {
            long coderId = Long.parseLong(rsc.getItem(i, "user_id").toString());
            if (!pendingUserIds.contains(coderId)) {
                int placed = rsc.getIntItem(i, "placed");
                long resourceId = rsc.getLongItem(i, "resource_id");
                String submissionType = rsc.getStringItem(i, "submission_type");
                
                double penalty = penalties.get(coderId) == null ? 0.0 : penalties.get(coderId);
                double amount = rsc.getDoubleItem(i, "payment")*(1.0-penalty);
                
                log.info("Generating payment. Coder: " + coderId + " placed: " + placed + " amount: " + amount + " penalty: " + penalty + " resourceId: " + resourceId);
                if (amount < 0.01) {
                    log.info("Ignoring the payment because of zero or negative amount.");
                    continue;
                }

                resourceIds.add(new Long(resourceId));

                if (submissionType.startsWith("Contest Submission")) {
                    BasePayment p = new ContestPayment(coderId, amount, client, projectId, placed);
                    if (placed == 1 && !isStudioProject(projectId)) {
                        p.setGrossAmount(amount * FIRST_INSTALLMENT_PERCENT);
                    }

                    payments.add(p);
                } else if (submissionType.startsWith("Milestone Submission")) {
                    payments.add(new ContestMilestonePayment(coderId, amount, client, projectId, placed));
                }
            } else {
                log.info("Payments for the coder " + coderId + " are skipped because he/she still has pending late deliverables.");
            }
        }

        StringBuffer commonQuery = new StringBuffer(300);
        commonQuery.append("from tcs_catalog:project p ");
        commonQuery.append("inner join tcs_catalog:resource r ");
        commonQuery.append("on p.project_id = r.project_id ");
        commonQuery.append("and (r.resource_role_id in (2,3,4,5,6,7,8,9,14,16,18,19,20)) ");
        commonQuery.append("inner join tcs_catalog:resource_info ri_u ");
        commonQuery.append("on r.resource_id = ri_u.resource_id ");
        commonQuery.append("and ri_u.resource_info_type_id = 1 ");
        commonQuery.append("and ri_u.value <> '0' ");
        commonQuery.append("inner join tcs_catalog:resource_info ri_p ");
        commonQuery.append("on r.resource_id = ri_p.resource_id ");
        commonQuery.append("and ri_p.resource_info_type_id = 7 ");
        commonQuery.append("and round(ri_p.value) > 0 ");
        commonQuery.append("and r.resource_id not in (select ri8.resource_id from tcs_catalog:resource_info ri8 where ri8.resource_info_type_id=8 and ri8.value='Yes') "); //make sure this resource has not been paid yet
        commonQuery.append("where p.project_id = " + projectId);

        // Get review board members to be paid
        StringBuffer getReviewers = new StringBuffer(300);
        getReviewers.append("select ");
        getReviewers.append("ri_u.value as user_id, ");
        getReviewers.append("CASE ");
        getReviewers.append("    WHEN r.resource_role_id in (2,3,4,5,6,7,8,9,16,19,20) THEN 'Review Payment' ");
        getReviewers.append("    WHEN r.resource_role_id = 14 THEN 'Copilot Payment' ");
        getReviewers.append("    WHEN r.resource_role_id = 18 THEN 'Spec Review Payment' ");
        getReviewers.append("    ELSE 'Unknown' ");
        getReviewers.append("END as payment_type, ");
        getReviewers.append("sum(round(ri_p.value)) as paid ");
        getReviewers.append(commonQuery);
        getReviewers.append(" group by 1, 2 ");

        log.info("get review payments - " + getReviewers.toString());
        rsc = runSelectQuery(getReviewers.toString());

        for (int i = 0; i < rsc.size(); i++) {
            long coderId = Long.parseLong(rsc.getStringItem(i, "user_id"));
            if (pendingUserIds.contains(coderId)) {
                log.info("Payments for the coder " + coderId + " are skipped because he/she still has pending late deliverables.");
                continue;
            }
            
            String paymentType = rsc.getStringItem(i, "payment_type");
            double penalty = penalties.get(coderId) == null ? 0.0 : penalties.get(coderId);
            double amount = rsc.getDoubleItem(i, "paid");
            double penalizedAmount = amount*(1.0-penalty);

            log.info("Generating payment. Coder: " + coderId + " amount: " + amount +
                     " penalized amount: " + penalizedAmount + " penalty: " + penalty);

            ComponentProjectReferencePayment p = null;
            int projectType = getProjectType(projectId);
 
            if (paymentType.startsWith("Copilot Payment")) {
                // The penalties are not applied to the copilot payments
                p = new CopilotPayment(coderId, amount, client, projectId);
            } else if (paymentType.startsWith("Spec Review Payment")) {
                p = new SpecificationReviewPayment(coderId, penalizedAmount, client, projectId);
            } else if (paymentType.startsWith("Review Payment")) {
                p = new ReviewBoardPayment(coderId, penalizedAmount, client, projectId);
                p.setGrossAmount(penalizedAmount);
            }

            payments.add(p);
        }

        // get the related resource ids.
        StringBuffer getResourceIds = new StringBuffer(300);
        getResourceIds.append("select r.resource_id as resource_id, ri_u.value as user_id ");
        getResourceIds.append(commonQuery);

        log.info("get resource ids:" + getResourceIds.toString());
        rsc = runSelectQuery(getResourceIds.toString());

        for (int i = 0; i < rsc.size(); i++) {
            long coderId = Long.parseLong(rsc.getStringItem(i, "user_id"));
            if (!pendingUserIds.contains(coderId)) {
                resourceIds.add(new Long(rsc.getLongItem(i, "resource_id")));
            }
        }

        return payments;
    }

    /**
     * Returns list of user IDs who have pending late deliverables for the specific project in the Online Review.
     * A late deliverable is pending if it has been explained by the late member but is not yet responded or if it
     * is still in the 24 hours window since the moment of creation (which means the late member can still explain it).
     *
     * @param projectId         The ID of the project
     * @return List of user IDs who have pending late deliverables for this project.     
     * @throws SQLException     If there was some error retrieving the data.
     */
    private List<Long> getPendingUserIds(long projectId) throws SQLException {
        StringBuffer query = new StringBuffer(300);
        query.append(" select distinct ri.value::int as user_id from ");
        query.append(" tcs_catalog:late_deliverable ld, tcs_catalog:resource r, tcs_catalog:resource_info ri where ");
        query.append(" ld.resource_id = r.resource_id and r.project_id = " + projectId + " and ");
        query.append(" r.resource_id = ri.resource_id and ri.resource_info_type_id = 1 and ");
        query.append(" ld.forgive_ind=0 and ");
        query.append(" ((ld.explanation is not null and ld.response is null) "); // if the explained record is waiting for the response        
        query.append(" or (ld.explanation is null and ld.create_date>current-24 units hour)) "); // or if the late member still has time to explain (24 hours)
        
        List<Long> userIds = new ArrayList<Long>();
        ResultSetContainer rsc = runSelectQuery(query.toString());
        for (int i = 0; i < rsc.size(); i++) {
            long userId = rsc.getLongItem(i, "user_id");
            userIds.add(new Long(userId));
        }
        return userIds;
    }

    /**
     * Returns mapping from user ID to payment penalties due to the late deliverables for the specific project.
     * The values of the map are real values in [0;0.5] interval, 0 means no penalty, 0.5 means the
     * member payment is reduced by 50%.
     *
     * @param projectId         The ID of the project
     * @return Map from user IDs to payment penalties.
     * @throws SQLException     If there was some error retrieving the data.
     */
    private Map<Long,Double> getPaymentPenalties(long projectId) throws SQLException {
        StringBuffer query = new StringBuffer(300);
        query.append(" select ri.value::int as user_id, nvl(sum(ld.delay),0) as total_delay, ");
        query.append(" sum(case when ld.late_deliverable_type_id=2 then 1 else 0 end)::int as rejected_final_fixes ");
        query.append(" from tcs_catalog:resource r, tcs_catalog:resource_info ri, tcs_catalog:late_deliverable ld where ");
        query.append(" r.project_id=" + projectId + " and r.resource_id=ld.resource_id and r.resource_id=ri.resource_id and ");
        query.append(" ri.resource_info_type_id=1 and ld.forgive_ind=0 ");
        query.append(" group by 1 ");
        
        Map<Long,Double> penalties = new HashMap<Long,Double>();
        ResultSetContainer rsc = runSelectQuery(query.toString());
        for (int i = 0; i < rsc.size(); i++) {
            long userId = rsc.getLongItem(i, "user_id");
            long delay = rsc.getLongItem(i, "total_delay");
            long rejectedFinalFixes = rsc.getLongItem(i, "rejected_final_fixes");
            
            long paymentPenaltyPercentage = (delay>0 ? 5 : 0) + (delay/3600) + rejectedFinalFixes * 5;
            if (paymentPenaltyPercentage > 50) {
                paymentPenaltyPercentage = 50;
            }
            
            penalties.put(userId, (double)paymentPenaltyPercentage/100.0);
        }
        return penalties;
    }

    /**
     * Adds online review payments in persistence and updates payment status to "Paid"
     * for the corresponding resources in the Online Review.
     *
     * @param payments the review payments
     * @param resourceIds the resource ids to update the payment status.
     * @param operatorUserId User ID of the operator or 0 if not set
     * @return the online review payments.
     * @throws RemoteException if any error occurs.
     * @throws SQLException if any sql error occurs.
     * @since Online Review Payments and Status Automation Assembly 1.0
     */
    public List addOnlineReviewPayments(List payments, List resourceIds, long operatorUserId) throws SQLException {
        log.info("addOnlineReviewPayments ..");

        if (!resourceIds.isEmpty()) {
            //we will first do update, if no record to update, then do insertion
            for (Iterator iter = resourceIds.iterator(); iter.hasNext();) {
                String resourceId = (String)iter.next().toString();

                StringBuffer updatePaymentStatus = new StringBuffer(300);
                updatePaymentStatus.append("UPDATE tcs_catalog:resource_info SET value='Yes' ");
                updatePaymentStatus.append("WHERE resource_info_type_id=8 ");
                updatePaymentStatus.append("AND resource_id=");
                updatePaymentStatus.append(resourceId);

                String updateQuery = updatePaymentStatus.toString();
                log.info("Update payment status for processed payment: " + updateQuery);

                int count = runUpdateQuery(updateQuery);

                if (count == 0) {
                    // no record found to update
                    String insertPaymentStatus = "INSERT INTO tcs_catalog:resource_info(resource_id,"
                            + " resource_info_type_id, value, create_user, create_date, modify_user, modify_date) VALUES (";
                    insertPaymentStatus += resourceId;
                    insertPaymentStatus += ", 8, 'Yes', 'System', CURRENT, 'System', CURRENT)";

                    log.info("Updating payment status failed, trying to insert payment status: " + insertPaymentStatus);

                    // insert new record
                    count = runUpdateQuery(insertPaymentStatus);

                    if (count == 0) {
                        throw new SQLException("record can not be inserted with sql - " + insertPaymentStatus);
                    }
                }
            }
        }

        return addPayments(payments, operatorUserId);
    }

    /**
     * Sets the status on all contest payments with Pending or On Hld status older than a specified time
     * to Expired. The time limit is specified in <tt>PactsConstants.java</tt>
     * and is currently set to 60 days.
     *
     * @return The number of affidavit/payment pairs thus affected.
     * @throws SQLException If there was some error updating the data.
     */
    public int expireOldPayments() throws SQLException {
        Connection c = null;

        try {
            c = DBMS.getConnection(trxDataSource);

            StringBuffer query = new StringBuffer(300);

            query.append(" SELECT p.payment_id ");
            query.append(" from payment_detail pd, payment p");
            query.append(" WHERE payment_type_id = " + ALGORITHM_CONTEST_PAYMENT);
            query.append(" AND pd.payment_detail_id = p.most_recent_detail_id");
            query.append(" AND payment_status_id = " + PaymentStatus.ON_HOLD_PAYMENT_STATUS.getId());
            query.append(" AND today - " + PAYMENT_EXPIRE_TIME + " units day > date_due");
            ResultSetContainer payments = runSelectQuery(c, query.toString());

            int rowCount = payments.getRowCount();
            long p[] = new long[rowCount];

            for (int i = 0; i < rowCount; i++) {
                p[i] = payments.getLongItem(i, 0);
            }

            // notify payments
            PaymentStatusManager psm = new PaymentStatusManager();
            long paymentId = 0;
            for (int i = 0; i < payments.getRowCount(); i++) {
                try {
                    paymentId = payments.getLongItem(i, 0);
                    psm.expiredPayment(paymentId);
                } catch (EventFailureException e) {
                    log.warn("Payment ID " + paymentId + " expiration could not be completed due to\n" +
                            e.getMessage());
                }
            }

            return rowCount;
        } catch (Exception e) {
            printException(e);
            ejbContext.setRollbackOnly();
            throw new SQLException(e.getMessage());
        } finally {
            close(c);
        }
    }


    /**
     * Sets the status on all affidavits older than a specified time
     * to Expired, and set the status on their associated payment (if any)
     * to Canceled.  The time limit is specified in <tt>PactsConstants.java</tt>
     * and is currently set to 60 days.  Any payments that were already paid
     * that would here have been canceled are logged.
     *
     * @return The number of affidavit/payment pairs thus affected.
     * @throws SQLException If there was some error updating the data.
     */
    public int expireOldAffidavits() throws SQLException {
        Connection c = null;

        try {
            c = DBMS.getConnection(trxDataSource);

            StringBuffer getPayments = new StringBuffer(300);
            getPayments.append("SELECT p.payment_id FROM affidavit a, payment p ");
            getPayments.append("WHERE a.affidavit_type_id = " + CONTEST_WINNING_AFFIDAVIT + " ");
            getPayments.append("AND a.payment_id = p.payment_id ");
            getPayments.append("AND a.date_created + " + AFFIDAVIT_EXPIRE_TIME + " UNITS DAY < TODAY ");
            getPayments.append("AND a.status_id = " + AFFIDAVIT_PENDING_STATUS + " ");
            getPayments.append("AND p.most_recent_detail_id IS NOT NULL");
            ResultSetContainer payments = runSelectQuery(c, getPayments.toString());

            StringBuffer updateAffidavits = new StringBuffer(300);
            updateAffidavits.append("UPDATE affidavit SET status_id = " + AFFIDAVIT_EXPIRED_STATUS);
            updateAffidavits.append(" WHERE affidavit_type_id = " + CONTEST_WINNING_AFFIDAVIT);
            updateAffidavits.append(" AND date_created + " + AFFIDAVIT_EXPIRE_TIME + " UNITS DAY < TODAY");
            updateAffidavits.append(" AND status_id = " + AFFIDAVIT_PENDING_STATUS);
            int rowsUpdated = runUpdateQuery(c, updateAffidavits.toString());

            // notify payments
            PaymentStatusManager psm = new PaymentStatusManager();
            long paymentId = 0;
            for (int i = 0; i < payments.getRowCount(); i++) {
                try {
                    paymentId = payments.getLongItem(i, 0);
                    psm.expiredAffidavit(paymentId);
                } catch (EventFailureException e) {
                    log.warn("Payment ID " + paymentId + " cancellation (expired Affidavit) could not be completed due to\n" +
                            e.getMessage());
                }
            }

            return rowsUpdated;
        } catch (Exception e) {
            printException(e);
            ejbContext.setRollbackOnly();
            throw new SQLException(e.getMessage());
        } finally {
            close(c);
        }
    }


    /**
     */
    public int checkInactiveCoders(long userId) throws SQLException {
        Connection c = null;

        try {
            c = DBMS.getConnection(trxDataSource);

            StringBuffer getHoldPayments = new StringBuffer(300);
            getHoldPayments.append("SELECT u.user_id ");
            getHoldPayments.append("FROM user u ");
            getHoldPayments.append("WHERE u.status != '" + ACTIVE_CODER_STATUS + "' ");
            if (userId != 0) {
                getHoldPayments.append("AND u.user_id == " + userId + " ");
            } else {
                getHoldPayments.append("AND user_id in (select distinct user_id from payment) ");
            }

            ResultSetContainer users = runSelectQuery(c, getHoldPayments.toString());

            // notify payments
            PaymentStatusManager psm = new PaymentStatusManager();
            long notifyUserId = 0;
            int count = 0;
            for (int i = 0; i < users.getRowCount(); i++) {
                notifyUserId = users.getLongItem(i, 0);
                count += psm.inactiveCoder(notifyUserId);
                log.debug("checkInactiveCoders: payments cancelled: " + count);
            }

            return count;
        } catch (Exception e) {
            printException(e);
            ejbContext.setRollbackOnly();
            throw new SQLException(e.getMessage());
        } finally {
            close(c);
        }
    }


    /**
     * Sets the status on all assignment documents older than a specified time
     * to Expired, and set the status on their associated payment (if any)
     * to Canceled.
     *
     * @return The number of affidavit/payment pairs thus affected.
     * @throws SQLException If there was some error updating the data.
     */
    public int expireOldAssignmentDocuments() throws SQLException {
        Connection c = null;

        try {
            c = DBMS.getConnection(trxDataSource);

            StringBuffer getPayments = new StringBuffer(300);
            getPayments.append("select p.payment_id from payment p, payment_detail pd, assignment_document ad ");
            getPayments.append("where p.most_recent_detail_id = pd.payment_detail_id ");
            getPayments.append("and date(ad.expire_date) <= date(current) ");
            getPayments.append("and ad.assignment_document_status_id = " + AssignmentDocumentStatus.PENDING_STATUS_ID);
            getPayments.append("and (pd.studio_contest_id = ad.studio_contest_id or pd.component_project_id = ad.component_project_id) ");
            getPayments.append("and pd.payment_status_id = " + PaymentStatus.ON_HOLD_PAYMENT_STATUS.getId());
            ResultSetContainer payments = runSelectQuery(c, getPayments.toString());

            StringBuffer updateAssignmentDocuments = new StringBuffer(300);
            updateAssignmentDocuments.append(" update assignment_document ");
            updateAssignmentDocuments.append(" set assignment_document_status_id = " + AssignmentDocumentStatus.EXPIRED_STATUS_ID + ", ");
            updateAssignmentDocuments.append(" modify_date = current ");
            updateAssignmentDocuments.append(" WHERE date(expire_date) <= date(current) ");
            updateAssignmentDocuments.append(" and assignment_document_status_id = " + AssignmentDocumentStatus.PENDING_STATUS_ID);

            int rowsUpdated = runUpdateQuery(c, updateAssignmentDocuments.toString());

            // notify payments
            PaymentStatusManager psm = new PaymentStatusManager();
            long paymentId = 0;
            for (int i = 0; i < payments.getRowCount(); i++) {
                try {
                    paymentId = payments.getLongItem(i, 0);
                    psm.expiredIPTransfer(paymentId);
                } catch (EventFailureException e) {
                    log.warn("Payment ID " + paymentId + " cancellation (expired IPTransfer) could not be completed due to\n" +
                            e.getMessage());
                }
            }

            return rowsUpdated;
        } catch (Exception e) {
            printException(e);
            ejbContext.setRollbackOnly();
            throw new SQLException(e.getMessage());
        } finally {
            close(c);
        }
    }


    public void createAffidavitTemplate(int affidavitTypeId, String text) throws SQLException {

        Connection conn = null;
        PreparedStatement ps = null;

        try {

            conn = DBMS.getConnection(trxDataSource);

            StringBuffer query = new StringBuffer(1024);
            query.append("insert into affidavit_template (affidavit_template_id, affidavit_type_id, text)");
            query.append("values (?, ?, ?)");


            long affidavitTemplateId = IdGeneratorClient.getSeqId("AFFIDAVIT_TEMPLATE_SEQ");

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, affidavitTemplateId);
            ps.setInt(2, affidavitTypeId);
            ps.setBytes(3, text.getBytes());

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw (new EJBException("Wrong number of rows updated in 'useaffidavit_tempater'. " +
                        "Updated " + rc + ", should have updated 1."));
            }
        } catch (IDGenerationException e) {
            throw new EJBException(e);
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw (new EJBException(e.getMessage()));
        } finally {
            close(ps);
            close(conn);
        }
    }

    public void createAssignmentDocumentTemplate(int assignmentdocumentTypeId, String text, String name) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {

            conn = DBMS.getConnection(trxDataSource);

            StringBuffer update = new StringBuffer(1024);
            update.append("update assignment_document_template set cur_version = 0 ");
            update.append("where assignment_document_type_id = ?");

            ps = conn.prepareStatement(update.toString());
            ps.setInt(1, assignmentdocumentTypeId);

            ps.executeUpdate();
            ps.close();

            StringBuffer query = new StringBuffer(1024);
            query.append("insert into assignment_document_template (assignment_document_template_id, assignment_document_type_id, assignment_document_template_text, assignment_document_template_name, cur_version)");
            query.append("values (?, ?, ?, ?, 1)");

            long assignmentDocumentTemplateId = IdGeneratorClient.getSeqId("ASSIGNMENT_DOCUMENT_TEMPLATE_SEQ");

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, assignmentDocumentTemplateId);
            ps.setInt(2, assignmentdocumentTypeId);
            ps.setBytes(3, text == null ? null : DBMS.serializeTextString(text));
            ps.setString(4, name);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw (new EJBException("Wrong number of rows updated in 'assignment_document_template'. " +
                        "Updated " + rc + ", should have updated 1."));
            }
        } catch (IDGenerationException e) {
            ejbContext.setRollbackOnly();
            throw new EJBException(e);
        } catch (SQLException e) {
            ejbContext.setRollbackOnly();
            DBMS.printSqlException(true, e);
            throw (new EJBException(e.getMessage(), e));
        } finally {
            close(ps);
            close(conn);
        }
    }


    public Payment getEmptyPayment(long userId) throws SQLException {
        log.debug("getemptypayment called...");
        StringBuffer query = new StringBuffer(1000);
        query.append(" select u.last_name ");
        query.append(" , u.first_name ");
        query.append(" , u.middle_name ");
        query.append(" , a.address1 ");
        query.append(" , a.address2 ");
        query.append(" , a.city ");
        query.append(" , s.state_name ");
        query.append(" , co.country_name ");
        query.append(" , a.state_code ");
        query.append(" , a.country_code ");
        query.append(" , a.zip ");
        query.append(" , a.address3 ");
        query.append(" , a.province ");
        query.append(" from user u ");
        query.append(" , user_address_xref x ");
        query.append(" , address a ");
        query.append(" , outer state s ");
        query.append(" , country co ");
        query.append(" where a.country_code = co.country_code ");
        query.append(" and a.state_code = s.state_code ");
        query.append(" and x.address_id = a.address_id ");
        query.append(" and x.user_id = u.user_id ");
        query.append(" and a.address_type_id = 2 ");
        query.append(" and u.user_id = ").append(userId);

        Connection conn = null;
        PreparedStatement ps = null;

        try {

            conn = DBMS.getConnection();
            ResultSetContainer rsc = runSelectQuery(conn, query.toString());

            if (rsc.isEmpty()) {
                throw new EJBException("could not find user information for user " + userId);
            } else {
                Payment ret = new Payment();
                ret.setAddress1(rsc.getStringItem(0, "address1"));
                ret.setAddress2(rsc.getStringItem(0, "address2"));
                ret.setAddress3(rsc.getStringItem(0, "address3"));
                ret.setProvince(rsc.getStringItem(0, "province"));
                ret.setFirstName(rsc.getStringItem(0, "first_name"));
                ret.setLastName(rsc.getStringItem(0, "last_name"));
                ret.setMiddleName(rsc.getStringItem(0, "middle_name"));
                ret.setCity(rsc.getStringItem(0, "city"));
                ret.setState(rsc.getStringItem(0, "state_name"));
                ret.setCountry(rsc.getStringItem(0, "country_name"));
                ret.setZip(rsc.getStringItem(0, "zip"));
                ret.setStateCode(rsc.getStringItem(0, "state_code"));
                ret.setCountryCode(rsc.getStringItem(0, "country_code"));
                return ret;
            }

        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw (new EJBException(e.getMessage()));
        } finally {
            close(ps);
            close(conn);
        }
    }

    private String filterCondition(String fieldName, String search) {
        return " UPPER(" + fieldName + ") " +
                (search.contains("%") ? " like UPPER(?)" : "=UPPER(?) ");

    }

    public Map findProblems(String search) throws SQLException {
        String query = "SELECT problem_id, name FROM problem WHERE " +
                filterCondition("name", search) + " ORDER BY name";

        ArrayList param = new ArrayList();
        param.add(search);
        ResultSetContainer rsc = runSearchQuery(query, param);

        HashMap hm = new HashMap();
        hm.put(ALGORITHM_PROBLEM_LIST, rsc);
        return hm;
    }

    public Map findProjects(String search) throws SQLException {
        return findProjects(search, -1);
    }

    public Map findProjects(String search, int categoryId) throws SQLException {
        StringBuffer query = new StringBuffer(1000);

        query.append(" select p.project_id, ");
        query.append(" pi_name.value || ' '  ||  ");
        query.append(" pc.name ||  ");
        query.append(" ' (' ||  NVL(pi_rated.value, 'UNKNWON')  || ')' as project_desc ");
        query.append(" from project p,  ");
        query.append(" project_info pi_name, ");
        query.append(" project_category_lu pc,  ");
        query.append(" OUTER project_info pi_rated  ");
        query.append(" where p.project_category_id = pc.project_category_id ");
        query.append(" and pi_rated.project_info_type_id = 22  ");
        query.append(" and pi_rated.project_id = p.project_id ");
        query.append(" and pi_name.project_id = p.project_id ");
        query.append(" and pi_name.project_info_type_id = 6 ");
        query.append(" and " + filterCondition("pi_name.value", search));
        if (categoryId > 0) {
            query.append(" and p.project_category_id = " + categoryId);
        }
        query.append(" order by pi_rated.value ");


        ArrayList param = new ArrayList();
        param.add(search);
        ResultSetContainer rsc = runSearchQuery(DBMS.TCS_OLTP_DATASOURCE_NAME, query.toString(), param);

        HashMap hm = new HashMap();
        hm.put(COMPONENT_PROJECT_LIST, rsc);
        return hm;
    }

    public Map findPaymentsByDescription(String search) throws SQLException {
        StringBuffer query = new StringBuffer(1000);
        query.append(" SELECT p.payment_id, u.handle || ' - ' || pd.payment_desc as payment_desc");
        query.append(" FROM payment_detail pd, payment p, user u ");
        query.append(" WHERE pd.payment_detail_id = p.most_recent_detail_id ");
        query.append(" AND p.user_id = u.user_id ");
        query.append(" AND " + filterCondition("'[' || u.handle || '] ' || pd.payment_desc", search));
        query.append(" ORDER BY 2");

        ArrayList param = new ArrayList();
        param.add(search);
        ResultSetContainer rsc = runSearchQuery(query.toString(), param);

        HashMap hm = new HashMap();
        hm.put(PARENT_REFERENCE_LIST, rsc);
        return hm;
    }

    public Map findComponentContests(String search) throws SQLException {
        StringBuffer query = new StringBuffer(1000);
        query.append(" select contest_id, event_desc || ' - ' || contest_name as contest_desc, c.start_date");
        query.append(" from contest c,");
        query.append(" event e");
        query.append(" where c.event_id = e.event_id");
        query.append(" and " + filterCondition("event_desc || ' - ' || contest_name", search));
        query.append(" union ");
        query.append(" select contest_id,  contest_name as contest_desc, c.start_date ");
        query.append(" from contest c ");
        query.append(" where c.event_id is null ");
        query.append(" and " + filterCondition("contest_name", search));
        query.append(" order by start_date");

        ArrayList param = new ArrayList();
        param.add(search);
        param.add(search);
        ResultSetContainer rsc = runSearchQuery(DBMS.TCS_OLTP_DATASOURCE_NAME, query.toString(), param);

        HashMap hm = new HashMap();
        hm.put(COMPONENT_CONTEST_LIST, rsc);
        return hm;
    }

    public Map findStudioContests(String search) throws SQLException {
        StringBuffer query = new StringBuffer(1000);
        query.append(" select contest_id, name");
        query.append(" from contest");
        query.append(" where " + filterCondition("name", search));
        query.append(" order by name");

        ArrayList param = new ArrayList();
        param.add(search);
        ResultSetContainer rsc = runSearchQuery(DBMS.STUDIO_DATASOURCE_NAME, query.toString(), param);

        HashMap hm = new HashMap();
        hm.put(STUDIO_CONTEST_LIST, rsc);
        return hm;
    }

    private StudioContest findStudioContestsById(long contestId) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ResultSetContainer rsc = null;

        try {
            conn = DBMS.getConnection(DBMS.STUDIO_DATASOURCE_NAME);

            StringBuffer query = new StringBuffer(1000);

            query.append(" select contest_id, name");
            query.append(" from contest");
            query.append(" where contest_id = ?");
            ps = conn.prepareStatement(query.toString());

            ps.setLong(1, contestId);
            rs = ps.executeQuery();
            rsc = new ResultSetContainer(rs, false);

            if (rsc.isEmpty()) {
                throw new IllegalUpdateException("Couldn't find studio contest for id: " + contestId);
            }

            StudioContest c = new StudioContest();

            c.setId(new Long(rsc.getLongItem(0, "contest_id")));
            c.setName(rsc.getStringItem(0, "name"));

            return c;
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw (new EJBException(e.getMessage()));
        } catch (Exception e) {
            throw (new EJBException(e.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
        }
    }

    private ComponentProject findComponentProjectById(long projectId) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ResultSetContainer rsc = null;

        try {
            conn = DBMS.getConnection(DBMS.TCS_OLTP_DATASOURCE_NAME);

            StringBuffer query = new StringBuffer(1000);

            query.append(" select p.project_id,  ");
            query.append(" component_name || ' '  || ");
            query.append(" pc.name || ");
            query.append(" ' (' ||  NVL(pi_rated.value, 'UNKNOWN')  || ')' as project_desc ");
            query.append(" from project p, ");
            query.append(" comp_catalog c, ");
            query.append(" project_category_lu pc, ");
            query.append(" project_info pi_comp, ");
            query.append(" OUTER project_info pi_rated ");
            query.append(" where pi_comp.value = c.component_id ");
            query.append(" and p.project_category_id = pc.project_category_id ");
            query.append(" and pi_rated.project_info_type_id = 22 ");
            query.append(" and pi_rated.project_id = p.project_id ");
            query.append(" and pi_comp.project_info_type_id = 2 ");
            query.append(" and pi_comp.project_id = p.project_id ");
            query.append(" and p.project_id = ?");
            ps = conn.prepareStatement(query.toString());

            ps.setLong(1, projectId);
            rs = ps.executeQuery();
            rsc = new ResultSetContainer(rs, false);

            if (rsc.isEmpty()) {
                throw new IllegalUpdateException("Couldn't find project for id: " + projectId);
            }

            ComponentProject cp = new ComponentProject();

            cp.setId(new Long(rsc.getLongItem(0, "project_id")));
            cp.setDescription(rsc.getStringItem(0, "project_desc"));

            return cp;
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw (new EJBException(e.getMessage()));
        } catch (Exception e) {
            throw (new EJBException(e.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
        }
    }

    public Map findRounds(String search, int[] roundTypes) throws SQLException {
        StringBuffer types = new StringBuffer(100);
        if (roundTypes.length > 0) {
            types.append(" and round_type_id in(");
            for (int i = 0; i < roundTypes.length; i++) {
                types.append(roundTypes[i] + (i < (roundTypes.length - 1) ? "," : ") "));
            }
        }
        StringBuffer query = new StringBuffer(1000);
        query.append(" select round_id, c.name || ' - ' || r.name as round_desc ");
        query.append(" from round r, ");
        query.append(" contest c ");
        query.append(" where r.contest_id = c.contest_id ");
        query.append(types);
        query.append(" and " + filterCondition("c.name || ' - ' || r.name", search));
        query.append(" order by c.start_date");

        ArrayList param = new ArrayList();
        param.add(search);
        ResultSetContainer rsc = runSearchQuery(query.toString(), param);

        HashMap hm = new HashMap();
        hm.put(ALGORITHM_ROUND_LIST, rsc);
        return hm;
    }

    public Map getDigitalRunSeasonList() throws SQLException {
        String query = "SELECT season_id, name FROM season ORDER BY name";

        ResultSetContainer rsc = runSearchQuery(DBMS.TCS_DW_DATASOURCE_NAME, query, new ArrayList());

        HashMap hm = new HashMap();
        hm.put(DIGITAL_RUN_SEASON_LIST, rsc);
        return hm;
    }

    public Map getDigitalRunStageList() throws SQLException {
        StringBuffer query = new StringBuffer(1000);
        query.append(" select stage_id, s.name || ' - ' || st.name as stage_desc");
        query.append(" from stage st, ");
        query.append(" season s ");
        query.append(" where s.season_id = st.season_id ");

        ResultSetContainer rsc = runSearchQuery(DBMS.TCS_DW_DATASOURCE_NAME, query.toString(),
                new ArrayList());

        HashMap hm = new HashMap();
        hm.put(DIGITAL_RUN_STAGE_LIST, rsc);
        return hm;
    }

    public Map getDigitalRunTrackList() throws SQLException {
        StringBuffer query = new StringBuffer(1000);
        query.append(" select track_id, track_desc");
        query.append(" from track t ");
        query.append(" where t.track_status_id <= 2");

        ResultSetContainer rsc = runSearchQuery(DBMS.TCS_DW_DATASOURCE_NAME, query.toString(),
                new ArrayList());

        HashMap hm = new HashMap();
        hm.put(DIGITAL_RUN_TRACK_LIST, rsc);
        return hm;
    }


    /**
     * Look up and fill data in the payment object.
     * It fills:
     * - the description based on the type of payment.
     * - the status (depending on whether the coder has filled the tax form or not)
     * - the due date
     *
     * @param payment the payment to fill its information
     * @return the payment with the information filled.
     * @throws SQLException is a problem occurs accessing db.
     */
    public BasePayment fillPaymentData(BasePayment payment) throws SQLException {
        Connection c = null;
        try {
            c = DBMS.getConnection();

            payment.getProcessor().fillData(payment);

            return payment;
        } catch (SQLException e) {
            printException(e);
            throw e;
        } finally {
            close(c);
        }

    }

    /**
     * Create a payment for an algorithm prize, including its affidavit.
     *
     * @param c       connection to use
     * @param p       payment to save
     * @param payment payment to save
     * @return the id of the inserted payment.
     * @throws Exception
     */
    private long makeNewAlgorithmPayment(Connection c, Payment p, AlgorithmRoundReferencePayment payment) throws Exception {
        log.debug("makeNewAlgorithmPayment called...");
        Affidavit a = new Affidavit();
        a.setRoundId(new Long(payment.getRoundId()));
        a.getHeader().getUser().setId(payment.getCoderId());
        a.getHeader().setStatusId(AFFIDAVIT_PENDING_STATUS);
        a.getHeader().setDescription(payment.getDescription() + " affidavit");
        a.getHeader().setTypeId(ALGORITHM_AFFIDAVIT_TYPE);


        long paymentId = makeAffidavitPayment(c, a, null, p)[0];

        log.debug("in makeNewAlgorithmPayment, the payment id is " + paymentId);
        return paymentId;

    }

    /**
     * Create a Payment object from a BasePayment
     *
     * @param payment the BasePayment from where to create a Payment
     * @return a Payment object based on the BasePayment
     */
    private Payment createPayment(BasePayment payment) {
        SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");

        Payment p = new Payment();
        p.setGrossAmount(payment.getGrossAmount());
        p.setNetAmount(payment.getNetAmount());
        p.setTotalAmount(payment.getTotalAmount());
        p.setInstallmentNumber(payment.getInstallmentNumber());
        p.setCurrentStatus(payment.getCurrentStatus());
        p.getHeader().setDescription(payment.getDescription());
        p.getHeader().setTypeId(payment.getPaymentType());
        p.setEventDate(payment.getEventDate());
        p.setDueDate(format.format(payment.getDueDate()));
        if (payment.getPaidDate() != null) {
            p.setPayDate(format.format(payment.getPaidDate()));
        }
        p.getHeader().getUser().setId(payment.getCoderId());
        p.setId(payment.getId());
        p.getHeader().setId(payment.getId());
        p.setCharity(payment.isCharity());
        p.setMethodId(payment.getMethodId());
        p.getHeader().setMethodId(payment.getMethodId());
        p.getHeader().setClient(payment.getClient());
        p.setInvoiceNumber(payment.getInvoiceNumber());
        p.getHeader().setInvoiceNumber(payment.getInvoiceNumber());        

        switch (payment.getReferenceTypeId()) {
            case REFERENCE_ALGORITHM_ROUND_ID:
                p.getHeader().setAlgorithmRoundId(((AlgorithmRoundReferencePayment) payment).getRoundId());
                break;
            case REFERENCE_COMPONENT_PROJECT_ID:
                p.getHeader().setComponentProjectId(((ComponentProjectReferencePayment) payment).getProjectId());
                p.getHeader().setJiraIssueName(((ComponentProjectReferencePayment) payment).getJiraIssueName());
                break;
            case REFERENCE_ALGORITHM_PROBLEM_ID:
                p.getHeader().setAlgorithmProblemId(((AlgorithmProblemReferencePayment) payment).getProblemId());
                break;
            case REFERENCE_STUDIO_CONTEST_ID:
                p.getHeader().setStudioContestId(((StudioContestReferencePayment) payment).getContestId());
                p.getHeader().setJiraIssueName(((StudioContestReferencePayment) payment).getJiraIssueName());
                break;
            case REFERENCE_COMPONENT_CONTEST_ID:
                p.getHeader().setComponentContestId(((ComponentContestReferencePayment) payment).getContestId());
                break;
            case REFERENCE_DIGITAL_RUN_STAGE_ID:
                p.getHeader().setDigitalRunStageId(((DigitalRunStageReferencePayment) payment).getStageId());
                break;
            case REFERENCE_DIGITAL_RUN_SEASON_ID:
                p.getHeader().setDigitalRunSeasonId(((DigitalRunSeasonReferencePayment) payment).getSeasonId());
                break;
            case REFERENCE_PARENT_PAYMENT_ID:
                p.getHeader().setParentPaymentId(((ParentReferencePayment) payment).getParentId());
                break;
            case REFERENCE_DIGITAL_RUN_TRACK_ID:
                p.getHeader().setDigitalRunTrackId(((DigitalRunTrackReferencePayment) payment).getTrackId());
                break;
        }


        return p;

    }

    /**
     * Update a payment for regular users.
     * The payment must be already saved in the database, or an exception will be thrown.
     * <p/>
     * This method assumes autocommit is set to false
     *
     * @param payment payment to update.
     * @return the updated payment.
     * @throws Exception if the update fails
     */
    public BasePayment updatePayment(BasePayment payment) throws Exception {
        return updatePayment(payment, false, 0);
    }

    /**
     * Update a payment for regular users.
     * The payment must be already saved in the database, or an exception will be thrown.
     * <p/>
     * This method assumes autocommit is set to false
     *
     * @param payment    payment to update.
     * @param supervisor true if the requester is a supervisor
     * @return the updated payment.
     * @throws Exception if the update fails
     */
    public BasePayment updatePayment(BasePayment payment, boolean supervisor) throws Exception {
        return updatePayment(payment, supervisor, 0);
    }

    /**
     * Update a payment for regular users.
     * The payment must be already saved in the database, or an exception will be thrown.
     * <p/>
     * This method assumes autocommit is set to false
     *
     * @param payment    payment to update.
     * @param supervisor true if the requester is a supervisor
     * @param operatorUserId User ID of the operator or 0 if not set
     * @return the updated payment.
     * @throws Exception if the update fails
     */
    public BasePayment updatePayment(BasePayment payment, boolean supervisor, long operatorUserId) throws Exception {
        try {
            if (payment.getId() <= 0) {
                throw new IllegalArgumentException("Payment is missing payment_id");
            }

            int rationale = payment.getModificationRationale();

            // if nothing seems to be changed, set the rationale to multiple fields
            // to be in the safe side.  It won't hurt.
            if (rationale == 0) {
                rationale = MODIFICATION_MULTIPLE_FIELDS;
            }

            (new PaymentStatusManager()).paymentUpdated(payment);

            Payment p = createPayment(payment);
            p.setRationaleId(rationale);
            updatePayment(p, supervisor, operatorUserId);
            payment.resetModificationRationale();

            return payment;
        } catch (Exception e) {
            ejbContext.setRollbackOnly();
            printException(e);
            throw e;
        }
    }

    private int getProjectType(long projectId) throws SQLException {
        ResultSetContainer rsc = runSelectQuery("SELECT project_category_id FROM tcs_catalog:project WHERE project_id=" + projectId);

        if (rsc.size() == 0) {
            return 0;
        }
        return rsc.getIntItem(0, 0);
    }

    private boolean isStudioProject(long projectId) throws SQLException {
        ResultSetContainer rsc = runSelectQuery("SELECT pcl.project_type_id FROM tcs_catalog:project_category_lu pcl, " + 
            " tcs_catalog:project p WHERE p.project_category_id=pcl.project_category_id and p.project_id=" + projectId);

        if (rsc.size() == 0) {
            throw new IllegalArgumentException("No project type found for project " + projectId);
        }

        return rsc.getIntItem(0, 0)==3;
    }

    /**
     * Checks whether the payment was invoiced.
     *
     * @param paymentId ID of the payment to check.
     * @return true if the payment was invoiced.
     * @throws SQLException
     */
    public boolean isInvoicedPayment(long paymentId) throws SQLException {
        ResultSetContainer rsc = runSelectQuery("SELECT invoice_record_id from invoice_record where payment_id = " + paymentId);

        return rsc.size() > 0;
    }

    /**
     * Add a payment in the database.
     * An instance of a subclass of BasePayment must be passed.
     *
     * @param payment payment to add.
     * @return payment the payment added.
     * @throws SQLException
     */
    public BasePayment addPayment(BasePayment payment) throws SQLException {
        return addPayment(payment, 0);
    }

    /**
     * Add a payment in the database.
     * An instance of a subclass of BasePayment must be passed.
     *
     * @param payment payment to add.
     * @return payment the payment added.
     * @param operatorUserId User ID of the operator or 0 if not set
     * @throws SQLException
     */
    public BasePayment addPayment(BasePayment payment, long operatorUserId) throws SQLException {
        Connection c = null;

        try {
            c = DBMS.getConnection(trxDataSource);
            BasePayment.Processor processor = payment.getProcessor();

            if (processor.isDuplicated(payment)) {
                throw new IllegalArgumentException("Payment is already in the database.");
            }

            processor.fillData(payment);

            // this need to be done in order to calculate the net amount before calling the status manager
            Payment tmp = createPayment(payment);
            fillPaymentNetAmount(tmp);
            payment.setNetAmount(tmp.getNetAmount());

            // delegate status to the manager
            (new PaymentStatusManager()).newPayment(payment);

            Payment p = createPayment(payment);

            long paymentId;

            // Special treating for algorithm payments, because they have affidavits.
            if (payment instanceof AlgorithmContestPayment ||
                    payment instanceof AlgorithmTournamentPrizePayment ||
                    payment instanceof HighSchoolTournamentPrizePayment ||
                    payment instanceof MarathonMatchPayment ||
                    payment instanceof MarathonMatchTournamentPrizePayment) {
                paymentId = makeNewAlgorithmPayment(c, p, (AlgorithmRoundReferencePayment) payment);
            } else if (payment.getContractId() > 0) {
                paymentId = makeNewContractPayment(c, payment.getContractId(), p, operatorUserId);
            } else {
                paymentId = makeNewPayment(c, p, p.payReferrer(), operatorUserId);
            }

            payment.setId(paymentId);
            payment.setNetAmount(p.getNetAmount());
            payment.resetModificationRationale();

            return payment;
        } catch (SQLException e) {
            printException(e);
            throw e;
        } catch (Exception e) {
            printException(e);
            throw new SQLException(e.getMessage());
        } finally {
            close(c);
        }
    }

    /**
     * Adds many payments at once in one transaction, so if one fails, it rolls back.
     *
     * @param payments payments to add to DB.
     * @return a list of the payments added, with the information completed (payment_id, net amount calculated)
     * @throws SQLException
     */
    public List addPayments(List payments) throws SQLException {
        return addPayments(payments, 0);
    }

    /**
     * Adds many payments at once in one transaction, so if one fails, it rolls back.
     *
     * @param payments payments to add to DB.
     * @return a list of the payments added, with the information completed (payment_id, net amount calculated)
     * @param operatorUserId User ID of the operator or 0 if not set
     * @throws SQLException
     */
    public List addPayments(List payments, long operatorUserId) throws SQLException {
        try {
            List p = new ArrayList();

            for (int i = 0; i < payments.size(); i++) {
                p.add(addPayment((BasePayment) payments.get(i), operatorUserId));
            }

            return p;
        } catch (SQLException e) {
            printException(e);
            throw e;
        } catch (Exception e) {
            printException(e);
            throw new SQLException(e.getMessage());
        }
    }

    private long getDesignProject(long projectId) throws SQLException {
        String query = "select p.project_id " +
                " from tcs_catalog:project p," +
                "     tcs_catalog:project_info vers " +
                " where p.project_id = vers.project_id " +
                " and vers.project_info_type_id = 1 " +
                " and project_status_id = 7 " +
                " and project_category_id = 1 " +
                " and value = (select value " +
                "              from tcs_catalog:project p," +
                "              tcs_catalog:project_info vers " +
                "              where p.project_id = vers.project_id " +
                "              and vers.project_info_type_id = 1 " +
                "              and project_status_id = 7" +
                " and p.project_id = " + projectId + ")";

        ResultSetContainer rsc = runSelectQuery(query);
        return rsc.size() == 0 ? -1 : rsc.getIntItem(0, 0);
    }

    /**
     * Find all the payments of a certain type.
     *
     * @param paymentTypeId type of payment to look for.
     * @return a List with instances of the specific class for the payment type (always a BasePayment subclass)
     * @throws SQLException
     */
    public List findPayments(int paymentTypeId) throws SQLException {
        Map searchCriteria = new HashMap();

        searchCriteria.put(PAYMENT_TYPE_ID, String.valueOf(paymentTypeId));
        return findCoderPayments(searchCriteria);
    }

    /**
     * Find all the payments of a certain type, referencing to a particular id.
     * For example, if the payment is for algorithm contest, in the referenceId you must pass the round_id to look for.
     * If the payment is for review board, you must pass the project_id and so on.
     *
     * @param paymentTypeId type of payment to look for.
     * @param referenceId   reference to look for
     * @return a List with instances of the specific class for the payment type (always a BasePayment subclass)
     * @throws SQLException
     */
    public List findPayments(int paymentTypeId, long referenceId) throws SQLException {
        Map searchCriteria = new HashMap();

        searchCriteria.put(PAYMENT_TYPE_ID, String.valueOf(paymentTypeId));
        searchCriteria.put(PAYMENT_REFERENCE_ID, String.valueOf(referenceId));
        return findCoderPayments(searchCriteria);
    }

    /**
     * Find all the payments for a coder, of any type.
     *
     * @param coderId the coder to find payments for.
     * @return a List of instances of BasePayment subclasses.
     * @throws SQLException
     */
    public List findCoderPayments(long coderId) throws SQLException, InvalidStatusException {
        Map searchCriteria = new HashMap();

        searchCriteria.put(USER_ID, String.valueOf(coderId));
        return findCoderPayments(searchCriteria);
    }

    /**
     * Find the payments of the specified type for a coder.
     *
     * @param coderId       the coder to find payments for.
     * @param paymentTypeId type of payment to look for.
     * @return a List with instances of the specific class for the payment type (always a BasePayment subclass)
     * @throws SQLException
     */
    public List findCoderPayments(long coderId, int paymentTypeId) throws SQLException, InvalidStatusException {
        Map searchCriteria = new HashMap();

        searchCriteria.put(PAYMENT_TYPE_ID, String.valueOf(paymentTypeId));
        searchCriteria.put(USER_ID, String.valueOf(coderId));
        return findCoderPayments(searchCriteria);
    }

    /**
     * Find the payments of the specified type for a coder.
     *
     * @param coderId       the coder to find payments for.
     * @param paymentTypeId type of payment to look for.
     * @param referenceId   the reference id.
     * @return a List with instances of the specific class for the payment type (always a BasePayment subclass)
     * @throws SQLException
     */
    public List findCoderPayments(long coderId, int paymentTypeId, long referenceId) throws SQLException, InvalidStatusException {
        Map searchCriteria = new HashMap();

        searchCriteria.put(PAYMENT_TYPE_ID, String.valueOf(paymentTypeId));
        searchCriteria.put(USER_ID, String.valueOf(coderId));
        searchCriteria.put(PAYMENT_REFERENCE_ID, String.valueOf(referenceId));
        return findCoderPayments(searchCriteria);
    }

    /**
     * Helper method to create the SQL select to find assignment document
     *
     * @return The SQL select to find assignment document
     */
    private StringBuffer getCoderPaymentsSelect() {
        StringBuffer sb = new StringBuffer(100);
        sb.append(" SELECT p.payment_id, p.user_id, pd.payment_desc, pd.payment_type_id, ");
        sb.append("    pd.gross_amount, pd.net_amount, pd.payment_status_id, s.payment_status_desc, pd.date_due, pd.date_paid, ");
        sb.append("    pd.algorithm_round_id, pd.component_project_id, pd.algorithm_problem_id, ");
        sb.append("    pd.studio_contest_id, pd.component_contest_id, pd.digital_run_stage_id, pd.digital_run_track_id, ");
        sb.append("    pd.digital_run_season_id, pd.parent_payment_id, pd.total_amount, pd.installment_number, pd.client, ");
        sb.append("    pd.invoice_number, pd.jira_issue_id, pd.payment_method_id, ");
        sb.append("    pd.charity_ind, pdsrx.payment_status_reason_id, ");
        sb.append("    (SELECT reference_field_name   ");
        sb.append("       FROM payment_reference_lu pr,payment_type_lu pt ");
        sb.append("       WHERE pd.payment_type_id = pt.payment_type_id ");
        sb.append("       AND pt.payment_reference_id = pr.payment_reference_id) as reference_field_name ");
        sb.append(" FROM payment p, payment_detail pd, payment_status_lu s, ");
        sb.append(" OUTER payment_detail_status_reason_xref pdsrx ");
        sb.append(" WHERE p.most_recent_detail_id = pd.payment_detail_id ");
        sb.append(" AND s.payment_status_id = pd.payment_status_id  ");
        sb.append(" AND pdsrx.payment_detail_id = pd.payment_detail_id ");
        return sb;
    }


    /**
     * Find the payments of the specified type for a coder, referencing to a particular id.
     * For example, if the payment is for algorithm contest, in the referenceId you must pass the round_id to look for.
     * If the payment is for review board, you must pass the project_id and so on.
     *
     * @param searchCriteria map for the search filter
     * @return a List with instances of the specific class for the payment type (always a BasePayment subclass)
     * @throws SQLException
     */
    public List<BasePayment> findCoderPayments(Map searchCriteria) {
        ResultSetContainer rsc = null;
        List l = new ArrayList();
        Connection conn = null;
        log.debug("findCoderPayments");
        try {
            conn = DBMS.getConnection(trxDataSource);

            StringBuffer query = getCoderPaymentsSelect();

            ArrayList objects = new ArrayList();
            Iterator i = searchCriteria.keySet().iterator();
            while (i.hasNext()) {
                String key = (String) i.next();
                String value = ((String) searchCriteria.get(key)).toUpperCase();
                if (key.equals(PAYMENT_TYPE_ID)) {
                    query.append(" AND pd.payment_type_id = ? ");
                    objects.add(value);
                } else if (key.equals(USER_ID)) {
                    query.append(" AND p.user_id = ? ");
                    objects.add(value);
                } else if (key.equals(PAYMENT_ID)) {
                    query.append(" AND p.payment_id in (" + value + ")");
                } else if (key.equals(PARENT_PAYMENT_ID)) {
                    query.append(" AND pd.parent_payment_id = ? ");
                    objects.add(value);
                } else if (key.equals(PAYMENT_REFERENCE_ID)) {
                    query.append(" AND (");
                    query.append("  pd.algorithm_round_id = ? OR ");
                    query.append("  pd.component_project_id = ? OR ");
                    query.append("  pd.algorithm_problem_id = ? OR ");
                    query.append("  pd.studio_contest_id = ? OR ");
                    query.append("  pd.component_contest_id = ? OR ");
                    query.append("  pd.digital_run_stage_id = ? OR ");
                    query.append("  pd.digital_run_season_id = ? OR ");
                    query.append("  pd.digital_run_track_id = ? OR ");
                    query.append("  pd.parent_payment_id = ?)");
                    for (int j = 0; j < 9; j++) {
                        objects.add(value);
                    }
                } else if (key.equals(PAYMENT_STATUS_ID)) {
                    query.append("AND pd.payment_status_id in (" + value + ") ");
                }
            }
            query.append(" ORDER BY p.payment_id asc ");

            rsc = runSearchQuery(conn, query.toString(), objects);

            // use control-break to get the reasons and then build and add the payment.

            long lastProcessedPayment = -1;
            List<Long> reasons = new ArrayList<Long>();
            ResultSetRow rsr = null;
            BasePayment payment = null;
            for (Iterator it = rsc.iterator(); it.hasNext();) {
                rsr = (ResultSetRow) it.next();

                if (lastProcessedPayment == -1) {
                    payment = getBasePaymentBean(rsr);
                }

                if (lastProcessedPayment != rsr.getLongItem("payment_id") && lastProcessedPayment != -1) {
                    for (Long reasonId : reasons) {
                        PaymentStatusReason psr = PaymentStatusReason.getStatusReasonUsingId(reasonId);
                        payment.getCurrentStatus().getReasons().add(psr);
                    }
                    l.add(payment);
                    reasons.clear();
                    payment = getBasePaymentBean(rsr);
                }

                // if there's a reason, add it.
                if (rsr.getItem("payment_status_reason_id").getResultData() != null) {
                    reasons.add(rsr.getLongItem("payment_status_reason_id"));
                }

                lastProcessedPayment = rsr.getLongItem("payment_id");
            }
            if (rsr != null) {
                for (Long reasonId : reasons) {
                    PaymentStatusReason psr = PaymentStatusReason.getStatusReasonUsingId(reasonId);
                    payment.getCurrentStatus().getReasons().add(psr);
                }
                l.add(payment);
            }
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw (new EJBException(e.getMessage(), e));
        } catch (Exception e) {
            throw (new EJBException(e.getMessage(), e));
        } finally {
            close(conn);
        }
        return l;
    }

    private BasePayment getBasePaymentBean(ResultSetRow rsr) throws InvalidStatusException, InvalidStatusReasonException {
        long paymentId = rsr.getLongItem("payment_id");
        long coder = rsr.getLongItem("user_id");
        double grossAmount = rsr.getDoubleItem("gross_amount");
        double netAmount = rsr.getDoubleItem("net_amount");
        double totalAmount = rsr.getDoubleItem("total_amount");
        int paymentType = rsr.getIntItem("payment_type_id");
        int installmentNumber = rsr.getIntItem("installment_number");
        Date dueDate = rsr.getTimestampItem("date_due");
        Date paidDate = rsr.getTimestampItem("date_paid");
        long statusId = rsr.getLongItem("payment_status_id");
        long methodId = rsr.getLongItem("payment_method_id");
        String description = rsr.getStringItem("payment_desc");
        String client = rsr.getStringItem("client");
        String referenceFieldName = rsr.getStringItem("reference_field_name");
        int charityInd = rsr.getIntItem("charity_ind");
        String invoiceNumber = rsr.getStringItem("invoice_number");
        String jiraIssueName = rsr.getStringItem("jira_issue_id");

        long reference = 0;
        if (referenceFieldName != null) {
            try {
                reference = rsr.getLongItem(referenceFieldName);
            } catch (Exception e) {
            }
        }

        BasePayment payment = BasePayment.createPayment(paymentType, coder, grossAmount, reference);

        payment.setId(paymentId);
        payment.setNetAmount(netAmount);
        payment.setTotalAmount(totalAmount);
        payment.setInstallmentNumber(installmentNumber);
        payment.setDueDate(dueDate);
        payment.setPaidDate(paidDate);
        payment.setDescription(description);
        payment.setCharity(charityInd == 1);
        payment.setInvoiceNumber(invoiceNumber);
        payment.setJiraIssueName(jiraIssueName);
        payment.setMethodId(methodId);

        BasePaymentStatus currentStatus = PaymentStatusFactory.createStatus(statusId);
        currentStatus.getReasons().clear();

        payment.setCurrentStatus(currentStatus);

//        if (payment instanceof ComponentProjectReferencePayment) {
//        ((ComponentProjectReferencePayment) payment).setClient(client);
        payment.setClient(client);
//        }

        return payment;
    }

    private XMLDocument prepareUserAssignmentDocumentInfo(long userId, String submissionTitle) {
        UserProfileBean upb = new UserProfileBean();
        UserProfile profile = upb.getUserProfile(userId);

        //first we must form the xml from the info
        XMLDocument tc = new XMLDocument("TC");

        RecordTag a = new RecordTag("AssignmentDocument");


        a.addTag(new ValueTag("first_name", profile.getFirstName()));
        a.addTag(new ValueTag("last_name", profile.getLastName()));
        a.addTag(new ValueTag("address1", profile.getAddress1()));
        a.addTag(new ValueTag("address2", profile.getAddress2()));
        a.addTag(new ValueTag("address3", profile.getAddress3()));
        a.addTag(new ValueTag("city", profile.getCity()));
        a.addTag(new ValueTag("state_name", profile.getState()));
        a.addTag(new ValueTag("zip", profile.getZip()));
        a.addTag(new ValueTag("province", profile.getProvince()));
        a.addTag(new ValueTag("country_name", profile.getCountry()));

        Calendar date = Calendar.getInstance();
        date.setTime(new Date());
        a.addTag(new ValueTag("current_date", new SimpleDateFormat("MM/dd/yyyy").format(date.getTime())));
        a.addTag(new ValueTag("submission_title", submissionTitle));

        tc.addTag(a);

        return tc;
    }

    /**
     * Get a BasePayment from the database.
     *
     * @param paymentId id of the payment to load.
     * @return the payment loaded or null if no payment found.
     * @throws SQLException
     */
    public BasePayment getBasePayment(long paymentId) throws SQLException, InvalidStatusException {
        Map searchCriteria = new HashMap();

        searchCriteria.put(PAYMENT_ID, String.valueOf(paymentId));
        return findCoderPayments(searchCriteria).get(0);
    }

    /**
     * Replaces null strings with "", others are returned untouched.
     */
    private String checkNull(String s) {
        return s == null ? "" : s;
    }

    /**
     * Get the affidavits for an user.
     *
     * @param userId        user to retrieve its affidavits
     * @param pendingOnly   whether to retrieve just the pending affidavits
     * @param sortColumn    number of column for sort
     * @param sortAscending whether to sort ascending
     * @return a ResultSetContainer with the affidavits
     * @throws SQLException
     */
    public ResultSetContainer getAffidavitHistory(long userId, boolean pendingOnly, int sortColumn, boolean sortAscending) throws SQLException {
        StringBuffer query = new StringBuffer(300);

        query.append("SELECT a.affidavit_desc, ");
        query.append("CASE WHEN a.status_id = 57 THEN 'Affirm now' ");
        query.append("WHEN a.status_id = 58 THEN 'Affirmed on ' || a.date_affirmed ");
        query.append("ELSE 'Expired' END as affirmation_order, ");
        query.append("CASE WHEN a.status_id = 57 THEN " + PactsConstants.AFFIDAVIT_EXPIRE_TIME + " units day - (today - a.date_created) || ' days' ");
        query.append("WHEN a.status_id = 58 THEN '' ");
        query.append("ELSE 'Expired' END as time_left_order, ");
        query.append("pd.net_amount, a.notarized, s.status_desc, pd.date_paid, a.date_affirmed, ");
        query.append("a.affidavit_id, a.affirmed, a.date_created, p.payment_id, a.status_id, ");
        query.append(PactsConstants.AFFIDAVIT_EXPIRE_TIME + " units day -(today - a.date_created) as time_left, a.date_created, a.date_affirmed, a.affidavit_type_id ");
        query.append("FROM affidavit a, status_lu s, ");
        query.append("OUTER (payment p, payment_detail pd) ");
        query.append("WHERE p.payment_id = a.payment_id ");
        query.append("AND p.most_recent_detail_id = pd.payment_detail_id ");
        query.append("AND a.status_id = s.status_id ");
        query.append("AND a.status_id in (57,58,59) ");
        query.append("AND a.date_created > mdy(1,1,2005) ");
        query.append("AND a.user_id = " + userId + " ");

        if (pendingOnly) {
            query.append(" AND a.status_id = " + PactsConstants.AFFIDAVIT_PENDING_STATUS + " ");
        }

        query.append(" ORDER BY " + sortColumn + (sortAscending ? " ASC " : " DESC "));

        return runSelectQuery(query.toString());
    }

    public ResultSetContainer getContestsInfo(long eid) throws SQLException {
        StringBuffer query = new StringBuffer(300);

        query.append("select e.event_desc ");
        query.append("  ,c.contest_id ");
        query.append("  ,c.contest_name ");
        query.append("  ,end_date < current as time_over ");
        query.append("  ,(select count(*)  ");
        query.append("    from tcs_catalog:project p, ");
        query.append("    tcs_catalog:contest_project_xref x ");
        query.append("    where p.project_id = x.project_id ");
        query.append("    and x.contest_id = c.contest_id ");
        query.append("    and p.project_status_id = 1) as active_projects ");
        query.append("   ,cp.place ");
        query.append("   ,cp.contest_prize_id ");
        query.append("   ,cp.place ");
        query.append("   ,cp.prize_amount ");
        query.append("from tcs_catalog:contest c, tcs_catalog:contest_prize cp, event e ");
        query.append("where  c.contest_id = cp.contest_id ");
        query.append("and c.event_id = e.event_id ");
        query.append("and c.event_id = " + eid);
        query.append(" order by contest_name  ");

        return runSelectQuery(query.toString());

    }

    class AlgorithmContestPaymentDataRetriever extends AlgorithmContestPayment {
        private final String roundName;
        private final Date dueDate;
        private final Date eventDate;

        public AlgorithmContestPaymentDataRetriever(long roundId) throws SQLException {
            super(1, 0.01, roundId);
            AlgorithmRoundReferencePayment.Processor processor = (AlgorithmRoundReferencePayment.Processor) getProcessor();
            roundName = processor.getRoundName(roundId);
            dueDate = processor.lookupDueDate(this);
            eventDate = processor.lookupEventDate(this);
        }

        public Date getDueDate() {
            return dueDate;
        }

        public Date getEventDate() {
            return eventDate;
        }

        public String getRoundName() {
            return roundName;
        }
    }
}

