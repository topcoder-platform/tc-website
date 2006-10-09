package com.topcoder.web.ejb.pacts;

import com.topcoder.apps.review.projecttracker.ProjectStatus;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.messaging.QueueMessageSender;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.idgenerator.IDGenerationException;
import com.topcoder.web.common.IdGeneratorClient;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.web.tc.controller.legacy.pacts.common.*;

import javax.ejb.EJBException;
import javax.jms.JMSException;
import java.rmi.RemoteException;
import java.sql.*;
import java.text.DecimalFormat;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.*;


/**
 * The EJB class which handles database access for the PACTS system.
 *
 * @author Dave Pecora
 * @version 1.00, 03/06/2002
 * @see PactsConstants
 */

public class PactsServicesBean extends BaseEJB implements PactsConstants {
    private static final Logger log = Logger.getLogger(PactsServicesBean.class);
    private static QueueMessageSender pactsMsgSender = null;

    // Initialize the message queue
    static {
        log.info("Initializing PACTS message queue...");
        try {
            pactsMsgSender = new QueueMessageSender(ApplicationServer.JMS_FACTORY, DBMS.PACTS_QUEUE);
            pactsMsgSender.setPersistent(true);
            pactsMsgSender.setDBPersistent(false);
            pactsMsgSender.setFaultTolerant(false);
            log.info("PACTS message queue successfully initialized");
        } catch (Exception e) {
            log.error("Could not initialize PACTS message queue", e);
            pactsMsgSender = null;
        }
    }

    public void ejbRemove() {
        super.ejbRemove();
        // Tear down the message queue if necessary
        if (pactsMsgSender != null) {
            log.info("Destroying PACTS Message Queue...");
            pactsMsgSender.close();
            pactsMsgSender = null;
        }
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

    private ResultSetContainer runSelectQuery(String query, boolean setLockTimeout) throws SQLException {
        String s[] = new String[1];
        s[0] = query;
        ResultSetContainer rsc[] = runSelectQuery(s, setLockTimeout);
        return rsc[0];
    }

    private ResultSetContainer[] runSelectQuery(String query[], boolean setLockTimeout) throws SQLException {
        Connection c = null;

        try {
            c = DBMS.getConnection();
            ResultSetContainer rsc[] = runSelectQuery(c, query, setLockTimeout);
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

    private ResultSetContainer runSelectQuery(Connection c, String query, boolean setLockTimeout) throws SQLException {
        String s[] = new String[1];
        s[0] = query;
        ResultSetContainer rsc[] = runSelectQuery(c, s, setLockTimeout);
        return rsc[0];
    }

    private ResultSetContainer[] runSelectQuery(Connection c, String query[], boolean setLockTimeout) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ResultSetContainer rsc[] = new ResultSetContainer[query.length];
            if (setLockTimeout)
                setLockTimeout(c);
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

    private int runUpdateQuery(String query, boolean setLockTimeout) throws SQLException {
        Connection c = null;
        try {
            c = DBMS.getConnection();
            int rowsModified = runUpdateQuery(c, query, setLockTimeout);
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

    private int runUpdateQuery(Connection c, String query, boolean setLockTimeout) throws SQLException {
        PreparedStatement ps = null;
        try {
            if (setLockTimeout)
                setLockTimeout(c);
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

    private ResultSetContainer runSearchQuery(String query, ArrayList objects, boolean setLockTimeout) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            c = DBMS.getConnection();
            if (setLockTimeout)
                setLockTimeout(c);
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

    private void setLockTimeout(Connection c) throws SQLException {
        PreparedStatement ps = null;
        try {
            ps = c.prepareStatement("SET LOCK MODE TO WAIT " + LOCK_TIMEOUT_VALUE);
            ps.executeUpdate();
        } finally {
            DBMS.close(ps);
        }
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
            c = DBMS.getConnection();
            // Get affidavit header
            ResultSetContainer rsc = runSelectQuery(c, selectAffidavitHeader.toString(), true);
            if (rsc.getRowCount() == 0) {
                c.close();
                c = null;
                throw new NoObjectFoundException("No affidavit found with ID " + affidavitId);
            }
            HashMap hm = new HashMap();
            hm.put(AFFIDAVIT_HEADER_LIST, rsc);

            // Get affidavit details
            rsc = runSelectQuery(c, selectAffidavitDetails.toString(), false);
            if (rsc.getRowCount() == 0) {
                c.close();
                throw new NoObjectFoundException("No affidavit details found with ID " + affidavitId);
            }
            boolean hasPayment = rsc.getStringItem(0, "payment_id") != null;
            hm.put(AFFIDAVIT_DETAIL, rsc);

            if (hasPayment) {
                long paymentId = Long.parseLong(rsc.getItem(0, "payment_id").toString());
                // Get payment header for affidavit
                StringBuffer selectPaymentHeader = new StringBuffer(300);
                selectPaymentHeader.append("SELECT p.payment_id, pd.payment_desc, pd.payment_type_id, ");
                selectPaymentHeader.append("pt.payment_type_desc, pd.payment_method_id, pm.payment_method_desc, ");
                selectPaymentHeader.append("pd.net_amount, pd.status_id, s.status_desc, ");
                selectPaymentHeader.append("p.user_id, u.handle, pd.date_modified, pd.gross_amount, pd.project_id, pd.client, p.review ");
                selectPaymentHeader.append("FROM payment p, payment_type_lu pt, payment_method_lu pm, payment_detail pd, ");
                selectPaymentHeader.append("status_lu s, user u ");
                selectPaymentHeader.append("WHERE p.payment_id = " + paymentId + " ");
                selectPaymentHeader.append("AND p.most_recent_detail_id = pd.payment_detail_id ");
                selectPaymentHeader.append("AND pt.payment_type_id = pd.payment_type_id ");
                selectPaymentHeader.append("AND pm.payment_method_id = pd.payment_method_id ");
                selectPaymentHeader.append("AND s.status_id = pd.status_id ");
                selectPaymentHeader.append("AND p.user_id = u.user_id ");

                rsc = runSelectQuery(c, selectPaymentHeader.toString(), false);
                if (rsc.getRowCount() == 0) {
                    c.close();
                    throw new NoObjectFoundException("No payment header details found for payment ID " + paymentId);
                }
                hm.put(PAYMENT_HEADER_LIST, rsc);
            }

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
        selectPaymentHeaders.append("SELECT p.payment_id, pd.payment_desc, pd.payment_type_id, pd.payment_method_id, ");
        selectPaymentHeaders.append("pt.payment_type_desc, pm.payment_method_desc, pd.net_amount, pd.status_id, s.status_desc, ");
        selectPaymentHeaders.append("p.user_id, u.handle, pd.date_modified, pd.gross_amount, pd.project_id, pd.client, p.review ");
        selectPaymentHeaders.append("FROM contract_payment_xref cpx, payment p, payment_type_lu pt, payment_method_lu pm, ");
        selectPaymentHeaders.append("payment_detail pd, status_lu s, user u ");
        selectPaymentHeaders.append("WHERE cpx.contract_id = " + contractId + " ");
        selectPaymentHeaders.append("AND cpx.payment_id = p.payment_id ");
        selectPaymentHeaders.append("AND p.most_recent_detail_id = pd.payment_detail_id ");
        selectPaymentHeaders.append("AND pt.payment_type_id = pd.payment_type_id ");
        selectPaymentHeaders.append("AND pm.payment_method_id = pd.payment_method_id ");
        selectPaymentHeaders.append("AND s.status_id = pd.status_id ");
        selectPaymentHeaders.append("AND p.user_id = u.user_id ");
        selectPaymentHeaders.append("ORDER BY 1");

        String queries[] = new String[3];
        queries[0] = selectContractHeader.toString();
        queries[1] = selectContractDetails.toString();
        queries[2] = selectPaymentHeaders.toString();
        ResultSetContainer rsc[] = runSelectQuery(queries, true);

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
        ResultSetContainer rsc[] = runSelectQuery(queries, true);

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
        selectPaymentDetails.append("pd.date_paid, pd.date_printed, pd.status_id, s.status_desc, ");
        selectPaymentDetails.append("pd.modification_rationale_id, mr.modification_rationale_desc, ");
        selectPaymentDetails.append("pd.payment_type_id, pt.payment_type_desc, pd.payment_desc, ");
        selectPaymentDetails.append("pd.payment_method_id, pm.payment_method_desc, ");
        selectPaymentDetails.append("pa.first_name, pa.middle_name, pa.last_name, pa.address1, ");
        selectPaymentDetails.append("pa.address2, pa.city, pa.state_code, pa.zip, pa.country_code, ");
        selectPaymentDetails.append("state.state_name, country.country_name, pd.date_modified, pd.date_due, pa.address3, pa.province ");
        selectPaymentDetails.append("FROM payment p, payment_detail pd, status_lu s, ");
        selectPaymentDetails.append("modification_rationale_lu mr, payment_type_lu pt, payment_method_lu pm, ");
        selectPaymentDetails.append("OUTER(payment_address pa, OUTER state, OUTER country) ");
        selectPaymentDetails.append("WHERE p.payment_id = " + paymentId + " ");
        selectPaymentDetails.append("AND pd.payment_detail_id = p.most_recent_detail_id ");
        selectPaymentDetails.append("AND pt.payment_type_id = pd.payment_type_id ");
        selectPaymentDetails.append("AND pm.payment_method_id = pd.payment_method_id ");
        selectPaymentDetails.append("AND pa.payment_address_id = pd.payment_address_id ");
        selectPaymentDetails.append("AND s.status_id = pd.status_id ");
        selectPaymentDetails.append("AND mr.modification_rationale_id = pd.modification_rationale_id ");
        selectPaymentDetails.append("AND state.state_code = pa.state_code ");
        selectPaymentDetails.append("AND country.country_code = pa.country_code");

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
        selectPaymentDetails.append("pd.date_paid, pd.date_printed, pd.status_id, s.status_desc, ");
        selectPaymentDetails.append("pd.modification_rationale_id, mr.modification_rationale_desc, ");
        selectPaymentDetails.append("pd.payment_type_id, pt.payment_type_desc, pd.payment_desc, ");
        selectPaymentDetails.append("pd.payment_method_id, pm.payment_method_desc, ");
        selectPaymentDetails.append("pa.first_name, pa.middle_name, pa.last_name, pa.address1, ");
        selectPaymentDetails.append("pa.address2, pa.city, pa.state_code, pa.zip, pa.country_code, ");
        selectPaymentDetails.append("state.state_name, country.country_name, pd.date_modified, pd.date_due, pa.address3, pa.province ");
        selectPaymentDetails.append("FROM payment p, payment_detail_xref pdx, payment_detail pd, ");
        selectPaymentDetails.append("status_lu s, modification_rationale_lu mr, payment_type_lu pt, payment_method_lu pm, ");
        selectPaymentDetails.append("OUTER(payment_address pa, OUTER state, OUTER country) ");
        selectPaymentDetails.append("WHERE p.payment_id = " + paymentId + " ");
        selectPaymentDetails.append("AND pdx.payment_id = p.payment_id ");
        selectPaymentDetails.append("AND pd.payment_detail_id = pdx.payment_detail_id ");
        selectPaymentDetails.append("AND pt.payment_type_id = pd.payment_type_id ");
        selectPaymentDetails.append("AND pm.payment_method_id = pd.payment_method_id ");
        selectPaymentDetails.append("AND pa.payment_address_id = pd.payment_address_id ");
        selectPaymentDetails.append("AND s.status_id = pd.status_id ");
        selectPaymentDetails.append("AND mr.modification_rationale_id = pd.modification_rationale_id ");
        selectPaymentDetails.append("AND state.state_code = pa.state_code ");
        selectPaymentDetails.append("AND country.country_code = pa.country_code ");
        selectPaymentDetails.append("ORDER BY 1");

        return doPayment(paymentId, selectPaymentDetails.toString());
    }

    // Helper function to retrieve payment information
    private Map doPayment(long paymentId, String detailsQuery) throws SQLException {
        log.debug("dopayment(long, String) called...");
        StringBuffer selectPaymentHeader = new StringBuffer(300);
        selectPaymentHeader.append("SELECT p.payment_id, pd.payment_desc, pd.payment_type_id, ");
        selectPaymentHeader.append("pt.payment_type_desc, pd.payment_method_id, pm.payment_method_desc, ");
        selectPaymentHeader.append("pd.net_amount, pd.status_id, s.status_desc, ");
        selectPaymentHeader.append("p.user_id, u.handle, pd.date_modified, pd.gross_amount, pd.project_id, pd.client, p.review ");
        selectPaymentHeader.append("FROM payment p, payment_type_lu pt, payment_method_lu pm, payment_detail pd, ");
        selectPaymentHeader.append("status_lu s, user u ");
        selectPaymentHeader.append("WHERE p.payment_id = " + paymentId + " ");
        selectPaymentHeader.append("AND p.most_recent_detail_id = pd.payment_detail_id ");
        selectPaymentHeader.append("AND pt.payment_type_id = pd.payment_type_id ");
        selectPaymentHeader.append("AND pm.payment_method_id = pd.payment_method_id ");
        selectPaymentHeader.append("AND s.status_id = pd.status_id ");
        selectPaymentHeader.append("AND p.user_id = u.user_id");

        Connection c = null;
        try {
            c = DBMS.getConnection();
            ResultSetContainer rsc = runSelectQuery(c, selectPaymentHeader.toString(), true);
            if (rsc.getRowCount() == 0) {
                throw new NoObjectFoundException("Payment " + paymentId + " not found");
            }
            long userId = Long.parseLong(rsc.getItem(0, "user_id").toString());

            HashMap hm = new HashMap();
            hm.put(PAYMENT_HEADER_LIST, rsc);

            rsc = runSelectQuery(c, detailsQuery, false);
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

            rsc = runSelectQuery(c, selectCoderAddress.toString(), false);
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
        selectDetails.append("c.coder_type_id, ct.coder_type_desc, a.address3, a.province ");
        selectDetails.append("FROM coder c, user u, email e, coder_type ct, OUTER state, OUTER country, phone p, address a, user_address_xref x ");
        selectDetails.append("WHERE c.coder_id = " + userId + " ");
        selectDetails.append("AND u.user_id = " + userId + " ");
        selectDetails.append("AND u.user_id = e.user_id ");
        selectDetails.append("AND e.primary_ind = 1 ");
        selectDetails.append("and p.user_id = u.user_id ");
        selectDetails.append("and p.primary_ind = 1 ");
        selectDetails.append("and x.user_id = u.user_id ");
        selectDetails.append("and x.address_id = a.address_id ");
        selectDetails.append("and a.address_type_id = 2 ");
        selectDetails.append("AND ct.coder_type_id = c.coder_type_id ");
        selectDetails.append("AND state.state_code = a.state_code ");
        selectDetails.append("AND country.country_code = a.country_code");

        Connection c = null;
        try {
            c = DBMS.getConnection();
            setLockTimeout(c);
            HashMap hm = new HashMap();
            hm.putAll(getUserProfileHeader(c, userId));
            ResultSetContainer rsc = runSelectQuery(c, selectDetails.toString(), false);
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
            setLockTimeout(c);
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
        selectHeader.append("SELECT u.user_id, u.handle, u.first_name, u.middle_name, u.last_name FROM user u");
        selectHeader.append(" WHERE user_id = " + userId);

        StringBuffer selectGroups = new StringBuffer(300);
        selectGroups.append("SELECT group_id FROM group_user ");
        selectGroups.append("WHERE user_id = " + userId + " ");

        String queries[] = new String[2];
        queries[0] = selectHeader.toString();
        queries[1] = selectGroups.toString();

        ResultSetContainer rsc[] = runSelectQuery(c, queries, false);
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

        ResultSetContainer rsc = runSelectQuery(selectTaxForm.toString(), true);
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

        ResultSetContainer rsc[] = runSelectQuery(queries, true);
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
        // Old version which sorted by affidavit ID
        /*
        selectAffidavitHeaders.append("SELECT a.affidavit_id, a.status_id, s.status_desc, a.user_id, ");
        selectAffidavitHeaders.append("a.notarized, a.affirmed, a.date_created, u.handle, ");
        selectAffidavitHeaders.append("a.affidavit_type_id, atl.affidavit_type_desc ");
        selectAffidavitHeaders.append("FROM affidavit a, status_lu s, user u, affidavit_type_lu atl ");
        selectAffidavitHeaders.append("WHERE a.user_id = " + userId + " ");
        selectAffidavitHeaders.append("AND u.user_id = " + userId + " ");
        selectAffidavitHeaders.append("AND a.affidavit_type_id = atl.affidavit_type_id ");
        selectAffidavitHeaders.append("AND a.status_id = s.status_id ");
        selectAffidavitHeaders.append("ORDER BY 1");
        */

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

        ResultSetContainer rsc = runSelectQuery(selectAffidavitHeaders.toString(), true);
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

        ResultSetContainer rsc = runSelectQuery(selectContractHeaders.toString(), true);
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
        selectPaymentHeaders.append("SELECT p.payment_id, pd.payment_desc, pd.payment_type_id, pd.payment_method_id, ");
        selectPaymentHeaders.append("pt.payment_type_desc, pm.payment_method_desc, pd.net_amount, pd.status_id, s.status_desc, ");
        selectPaymentHeaders.append("p.user_id, u.handle, pd.date_modified, pd.gross_amount, pd.project_id, pd.client, p.review ");
        selectPaymentHeaders.append("FROM payment p, payment_type_lu pt, payment_method_lu pm, payment_detail pd, ");
        selectPaymentHeaders.append("status_lu s, user u ");
        selectPaymentHeaders.append("WHERE p.user_id = " + userId + " ");
        selectPaymentHeaders.append("AND u.user_id = " + userId + " ");
        selectPaymentHeaders.append("AND p.most_recent_detail_id = pd.payment_detail_id ");
        selectPaymentHeaders.append("AND pt.payment_type_id = pd.payment_type_id ");
        selectPaymentHeaders.append("AND pm.payment_method_id = pd.payment_method_id ");
        selectPaymentHeaders.append("AND s.status_id = pd.status_id ");
        selectPaymentHeaders.append("ORDER BY 1");

        ResultSetContainer rsc = runSelectQuery(selectPaymentHeaders.toString(), true);
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
        selectPaymentDetails.append("pd.date_paid, pd.date_printed, pd.status_id, s.status_desc, ");
        selectPaymentDetails.append("pd.modification_rationale_id, mr.modification_rationale_desc, ");
        selectPaymentDetails.append("pd.payment_type_id, pt.payment_type_desc, pd.payment_desc, ");
        selectPaymentDetails.append("pd.payment_method_id, pm.payment_method_desc, ");
        selectPaymentDetails.append("pa.first_name, pa.middle_name, pa.last_name, pa.address1, ");
        selectPaymentDetails.append("pa.address2, pa.city, pa.state_code, pa.zip, pa.country_code, ");
        selectPaymentDetails.append("state.state_name, country.country_name, pd.date_modified, pd.date_due, pa.address3, pa.province ");
        selectPaymentDetails.append("FROM payment p, payment_detail pd, status_lu s, ");
        selectPaymentDetails.append("modification_rationale_lu mr, payment_type_lu pt, payment_method_lu pm, ");
        selectPaymentDetails.append("OUTER(payment_address pa, OUTER state, OUTER country) ");
        selectPaymentDetails.append("WHERE p.user_id = " + userId + " ");
        selectPaymentDetails.append("AND pd.payment_type_id IN (" + paymentTypeList + ") ");
        selectPaymentDetails.append("AND pd.payment_detail_id = p.most_recent_detail_id ");
        selectPaymentDetails.append("AND pt.payment_type_id = pd.payment_type_id ");
        selectPaymentDetails.append("AND pm.payment_method_id = pd.payment_method_id ");
        selectPaymentDetails.append("AND pa.payment_address_id = pd.payment_address_id ");
        selectPaymentDetails.append("AND s.status_id = pd.status_id ");
        selectPaymentDetails.append("AND mr.modification_rationale_id = pd.modification_rationale_id ");
        selectPaymentDetails.append("AND state.state_code = pa.state_code ");
        selectPaymentDetails.append("AND country.country_code = pa.country_code ");

        if (pendingOnly) {
            selectPaymentDetails.append(" AND pd.status_id IN (" + PAYMENT_ON_HOLD_STATUS + "," +
                    PAYMENT_OWED_STATUS + "," + PAYMENT_PENDING_STATUS + ")");
        }

        selectPaymentDetails.append("ORDER BY 1");

        return doUserPayments(userId, selectPaymentDetails.toString(), paymentTypes, pendingOnly);
    }

    //  Helper function to retrieve payment information for a given user.
    private Map doUserPayments(long userId, String detailsQuery, int[] paymentTypes, boolean pendingOnly) throws SQLException {
        String paymentTypeList = makeList(paymentTypes);
        StringBuffer selectPaymentHeaders = new StringBuffer(300);
        selectPaymentHeaders.append("SELECT p.payment_id, pd.payment_desc, pd.payment_type_id, ");
        selectPaymentHeaders.append("pt.payment_type_desc, pd.payment_method_id, pm.payment_method_desc, ");
        selectPaymentHeaders.append("pd.net_amount, pd.status_id, s.status_desc, ");
        selectPaymentHeaders.append("p.user_id, u.handle, pd.date_modified, pd.gross_amount, pd.project_id, pd.client, p.review ");
        selectPaymentHeaders.append("FROM payment p, payment_detail pd, status_lu s, user u, ");
        selectPaymentHeaders.append("modification_rationale_lu mr, payment_type_lu pt, payment_method_lu pm, ");
        selectPaymentHeaders.append("OUTER(payment_address pa, OUTER state, OUTER country) ");
        selectPaymentHeaders.append("WHERE p.user_id = " + userId + " ");
        selectPaymentHeaders.append("AND p.user_id = u.user_id ");
        selectPaymentHeaders.append("AND pd.payment_type_id IN (" + paymentTypeList + ") ");
        selectPaymentHeaders.append("AND pd.payment_detail_id = p.most_recent_detail_id ");
        selectPaymentHeaders.append("AND pt.payment_type_id = pd.payment_type_id ");
        selectPaymentHeaders.append("AND pm.payment_method_id = pd.payment_method_id ");
        selectPaymentHeaders.append("AND pa.payment_address_id = pd.payment_address_id ");
        selectPaymentHeaders.append("AND s.status_id = pd.status_id ");
        selectPaymentHeaders.append("AND mr.modification_rationale_id = pd.modification_rationale_id ");
        selectPaymentHeaders.append("AND state.state_code = pa.state_code ");
        selectPaymentHeaders.append("AND country.country_code = pa.country_code ");

        if (pendingOnly) {
            selectPaymentHeaders.append(" AND pd.status_id IN (" + PAYMENT_ON_HOLD_STATUS + "," +
                    PAYMENT_OWED_STATUS + "," + PAYMENT_PENDING_STATUS + ")");
        }

        selectPaymentHeaders.append("ORDER BY 1");

        Connection c = null;
        try {
            c = DBMS.getConnection();
            ResultSetContainer rsc = runSelectQuery(c, selectPaymentHeaders.toString(), true);

            HashMap hm = new HashMap();
            hm.put(PAYMENT_HEADER_LIST, rsc);

            rsc = runSelectQuery(c, detailsQuery, false);
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

            rsc = runSelectQuery(c, selectCoderAddress.toString(), false);
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

        ResultSetContainer rsc = runSelectQuery(selectHeaders.toString(), true);
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

        ResultSetContainer rsc = runSelectQuery(selectNoteHeaders.toString(), true);
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
        selectPaymentHeaders.append("SELECT p.payment_id, pd.payment_desc, pd.payment_type_id, pd.payment_method_id, ");
        selectPaymentHeaders.append("pt.payment_type_desc, pm.payment_method_desc, pd.net_amount, pd.status_id, s.status_desc, ");
        selectPaymentHeaders.append("p.user_id, u.handle, pd.date_modified, pd.gross_amount, pd.project_id, pd.client, p.review ");
        selectPaymentHeaders.append("FROM contract_payment_xref cpx, payment p, payment_type_lu pt, payment_method_lu pm, ");
        selectPaymentHeaders.append("payment_detail pd, status_lu s, user u ");
        selectPaymentHeaders.append("WHERE cpx.contract_id = " + contractId + " ");
        selectPaymentHeaders.append("AND cpx.payment_id = p.payment_id ");
        selectPaymentHeaders.append("AND p.most_recent_detail_id = pd.payment_detail_id ");
        selectPaymentHeaders.append("AND pt.payment_type_id = pd.payment_type_id ");
        selectPaymentHeaders.append("AND pm.payment_method_id = pd.payment_method_id ");
        selectPaymentHeaders.append("AND s.status_id = pd.status_id ");
        selectPaymentHeaders.append("AND p.user_id = u.user_id ");
        selectPaymentHeaders.append("ORDER BY 1");

        ResultSetContainer rsc = runSelectQuery(selectPaymentHeaders.toString(), true);
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

        ResultSetContainer rsc = runSelectQuery(selectClause, true);
        HashMap hm = new HashMap();
        hm.put(TEXT, rsc);
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

        ResultSetContainer rsc = runSelectQuery(sb.toString(), true);
        HashMap hm = new HashMap();
        hm.put(AFFIDAVIT_TYPE_LIST, rsc);
        return hm;
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

        ResultSetContainer rsc = runSelectQuery(sb.toString(), true);
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

        ResultSetContainer rsc = runSelectQuery(sb.toString(), true);
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
        sb.append("SELECT payment_type_id, payment_type_desc FROM payment_type_lu ORDER BY 2");
        ResultSetContainer rsc = runSelectQuery(sb.toString(), true);
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
        ResultSetContainer rsc = runSelectQuery(sb.toString(), true);
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

        ResultSetContainer rsc = runSelectQuery(sb.toString(), true);
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
        sb.append("SELECT project_stat_id, project_stat_name FROM project_status ORDER BY 2");

        Connection c = null;

        try {
            c = DBMS.getConnection(DBMS.TCS_OLTP_DATASOURCE_NAME);
            ResultSetContainer rsc = runSelectQuery(c, sb.toString(), true);
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

        ResultSetContainer rsc = runSelectQuery(sb.toString(), true);
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

        ResultSetContainer rsc = runSelectQuery(sb.toString(), true);
        HashMap hm = new HashMap();
        hm.put(STATUS_CODE_LIST, rsc);
        return hm;
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

        ResultSetContainer rsc = runSelectQuery(sb.toString(), true);
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

        ResultSetContainer rsc = runSelectQuery(sb.toString(), true);
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

        ResultSetContainer rsc = runSelectQuery(sb.toString(), true);
        HashMap hm = new HashMap();
        hm.put(USER_DEMOGRAPHICS, rsc);

        sb.replace(0, sb.length(), "SELECT cs.school_id, cs.coder_id, s.name as school_name from  ")
                .append(" current_school cs, school s where cs.school_id = s.school_id and coder_id = " + userId);

        rsc = null;
        rsc = runSelectQuery(sb.toString(), true);
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
    public Map getPaymentComponentData(long[] paymentIds) throws RemoteException, SQLException {
        String paymentList = makeList(paymentIds);
        StringBuffer sb = new StringBuffer(300);
        sb.append("SELECT pd.project_id, cc.component_id ");
        sb.append("FROM payment p, payment_detail pd, tcs_catalog:project proj, ");
        sb.append("tcs_catalog:comp_catalog cc, tcs_catalog:comp_versions cv ");
        sb.append("WHERE pd.project_id = proj.project_id ");
        sb.append("AND proj.comp_vers_id = cv.comp_vers_id ");
        sb.append("AND cc.component_id = cv.component_id ");
        sb.append("AND p.payment_id IN (" + paymentList + ") ");
        sb.append("AND p.most_recent_detail_id = pd.payment_detail_id ");
        sb.append("AND pd.payment_type_id IN (" + COMPONENT_PAYMENT + "," + REVIEW_BOARD_PAYMENT + ") ");
        sb.append("AND proj.cur_version = 1");

        ResultSetContainer rsc = runSelectQuery(sb.toString(), true);
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
    public Map getCreationDates(long[] paymentIds) throws RemoteException, SQLException {
        String paymentList = makeList(paymentIds);
        StringBuffer sb = new StringBuffer(300);
        sb.append("SELECT pdx.payment_id, min(pd.date_modified) as date_created ");
        sb.append("FROM payment_detail_xref pdx, payment_detail pd ");
        sb.append("WHERE payment_id IN (" + paymentList + ") ");
        sb.append("AND pdx.payment_detail_id = pd.payment_detail_id ");
        sb.append("GROUP BY 1 ");
        sb.append("ORDER BY 1 ");

        ResultSetContainer rsc = runSelectQuery(sb.toString(), true);
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
        // Old version which sorted by affidavit_id
        /*
        selectHeaders.append("SELECT a.affidavit_id, a.status_id, s.status_desc, a.user_id, ");
        selectHeaders.append("a.notarized, a.affirmed, a.date_created, u.handle, ");
        selectHeaders.append("a.affidavit_type_id, atl.affidavit_type_desc ");
        selectHeaders.append("FROM affidavit a, status_lu s, user u, affidavit_type_lu atl ");
        selectHeaders.append("WHERE a.affidavit_type_id = atl.affidavit_type_id ");
        selectHeaders.append("AND a.status_id = s.status_id ");
        selectHeaders.append("AND u.user_id = a.user_id");
        */

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
                    selectHeaders.append(" AND a.status_id = " + value);
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

        // Old version which sorted by affidavit ID
        /*
        selectHeaders.append(" ORDER BY 1");
        */
        selectHeaders.append(" ORDER BY origin_date DESC");
        ResultSetContainer rsc = runSearchQuery(selectHeaders.toString(), objects, true);
        HashMap hm = new HashMap();
        hm.put(AFFIDAVIT_HEADER_LIST, rsc);
        return hm;
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

        ResultSetContainer rsc = runSearchQuery(selectContractHeaders.toString(), objects, true);
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

        ResultSetContainer rsc = runSelectQuery(select.toString(), true);
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

        ResultSetContainer rsc = runSearchQuery(selectNoteHeaders.toString(), objects, true);

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
        StringBuffer selectHeaders = new StringBuffer(300);
        selectHeaders.append("SELECT p.payment_id, pd.payment_desc, pd.payment_type_id, pd.payment_method_id, ");
        selectHeaders.append("pt.payment_type_desc, pm.payment_method_desc, pd.net_amount, pd.status_id, s.status_desc, ");
        selectHeaders.append("p.user_id, u.handle, u.first_name, u.middle_name, u.last_name, ");
        selectHeaders.append("pd.date_modified, pd.gross_amount, p.review, pd.project_id, pd.client ");

        StringBuffer from = new StringBuffer(300);
        from.append("FROM payment p, payment_type_lu pt, payment_method_lu pm, payment_detail pd, ");
        from.append("status_lu s, user u, coder c ");

        StringBuffer whereClauses = new StringBuffer(300);
        whereClauses.append(" WHERE p.most_recent_detail_id = pd.payment_detail_id ");
        whereClauses.append(" AND pt.payment_type_id = pd.payment_type_id ");
        whereClauses.append(" AND pm.payment_method_id = pd.payment_method_id ");
        whereClauses.append(" AND s.status_id = pd.status_id ");
        whereClauses.append(" AND p.user_id = u.user_id ");
        whereClauses.append(" AND u.user_id = c.coder_id ");

        ArrayList objects = new ArrayList();
        Iterator i = searchCriteria.keySet().iterator();
        try {
            while (i.hasNext()) {
                String key = (String) i.next();
                String value = ((String) searchCriteria.get(key)).toUpperCase();
                if (key.equals(EARLIEST_CREATION_DATE)) {
                    whereClauses.append(" AND pd.date_modified >= ?");
                    objects.add(makeTimestamp(value, false, false));
                } else if (key.equals(LATEST_CREATION_DATE)) {
                    whereClauses.append(" AND pd.date_modified <= ?");
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
                    from.append(", contract_payment_xref cpx");
                    whereClauses.append(" AND cpx.payment_id = p.payment_id");
                    whereClauses.append(" AND cpx.contract_id = " + value);
                } else if (key.equals(AFFIDAVIT_ID)) {
                    from.append(", affidavit a");
                    whereClauses.append(" AND a.payment_id = p.payment_id");
                    whereClauses.append(" AND a.affidavit_id = " + value);
                } else if (key.equals(USER_ID)) {
                    whereClauses.append(" AND p.user_id = " + value);
                } else if (key.equals(PAYMENT_ID)) {
                    whereClauses.append(" AND p.payment_id = " + value);
                } else if (key.equals(HANDLE)) {
                    whereClauses.append(" AND UPPER(u.handle) LIKE ?");  //todo user handle_lower
                    objects.add(value);
                } else if (key.equals(STATUS_CODE)) {
                    whereClauses.append(" AND pd.status_id IN (" + value + ")");
                } else if (key.equals(TYPE_CODE)) {
                    whereClauses.append(" AND pd.payment_type_id IN (" + value + ")");
                } else if (key.equals(METHOD_CODE)) {
                    whereClauses.append(" AND pd.payment_method_id IN (" + value + ")");
                } else if (key.equals(PROJECT_ID)) {
                    whereClauses.append(" AND pd.project_id = " + value);
                } else if (key.equals(LOWEST_NET_AMOUNT)) {
                    whereClauses.append(" AND pd.net_amount >= " + value);
                } else if (key.equals(HIGHEST_NET_AMOUNT)) {
                    whereClauses.append(" AND pd.net_amount <= " + value);
                } else if (key.equals(IS_REVIEWED)) {
                    whereClauses.append(" AND p.review = " + (makeBoolean(value) ? 1 : 0));
                } // end if
            } // end while
        } catch (Exception e) {
            throw new SQLException(e.getMessage());
        }

        selectHeaders.append(from.toString());
        selectHeaders.append(whereClauses.toString());
        selectHeaders.append(" ORDER BY 1");

        ResultSetContainer rsc = runSearchQuery(selectHeaders.toString(), objects, true);
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

        ResultSetContainer rsc = runSelectQuery(selectTaxForms.toString(), true);
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

        ResultSetContainer rsc = runSearchQuery(selectHeaders.toString(), objects, true);
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
        selectHeader.append("SELECT u.user_id, u.handle, UPPER(u.handle) AS uchandle, u.first_name, u.middle_name, u.last_name ");

        StringBuffer from = new StringBuffer(300);
        from.append("FROM user u ");

        ArrayList whereClauses = new ArrayList();
        ArrayList orClauses = new ArrayList();
        ArrayList objects = new ArrayList();

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
                    clause.append("        AND payment_detail.status_id = " + PAYMENT_OWED_STATUS + ")");
                    orClauses.add(clause.toString());
                } // end if
            } // end while
        } catch (Exception e) {
            throw new SQLException(e.getMessage());
        }

        selectHeader.append(from.toString());
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

        ResultSetContainer rsc = runSearchQuery(selectHeader.toString(), objects, true);
        HashMap hm = new HashMap();
        hm.put(USER_PROFILE_HEADER_LIST, rsc);
        return hm;
    }

    /*****************************************************
     * Data update functions - additions
     *****************************************************/

    /**
     * Adds a new affidavit to the database without any corresponding payment.
     *
     * @param a             Data for the new affidavit.
     * @param affidavitText The new affidavit's text
     * @return The new affidavit's ID.
     * @throws IllegalUpdateException If the user is trying to make an illegal update.
     * @throws SQLException           If there is some problem updating the data
     */
    public long addAffidavit(Affidavit a, String affidavitText)
            throws IllegalUpdateException, SQLException {
        return addAffidavit(a, affidavitText, null);
    }

    /**
     * Adds the specified affidavit and payment to the database, and associates the two.
     * Also adds a correpsonding referral payment if the affidavit is a contest winnings
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
            c = DBMS.getConnection();
            c.setAutoCommit(false);
            setLockTimeout(c);

            long affidavitId = makeAffidavitPayment(c, a, affidavitText, p);

            c.commit();
            c.setAutoCommit(true);
            c.close();
            c = null;

            return affidavitId;
        } catch (Exception e) {
            printException(e);
            try {
                c.rollback();
            } catch (Exception e1) {
                printException(e1);
            }
            try {
                c.setAutoCommit(true);
            } catch (Exception e1) {
                printException(e1);
            }
            try {
                if (c != null) c.close();
            } catch (Exception e1) {
                printException(e1);
            }
            c = null;
            if (e instanceof IllegalUpdateException)
                throw (IllegalUpdateException) e;
            throw new SQLException(e.getMessage());
        }
    }

    // Helper function, assumes autocommit is false
    private long makeAffidavitPayment(Connection c, Affidavit a, String text, Payment p) throws Exception {
        log.debug("makeAffidavitPayment called...");
        PreparedStatement ps = null;
        try {
            // Get ID numbers.  As affidavit references payment, we must add the
            // payment first (if applicable).
            long affidavitId = (long) DBMS.getSeqId(c, DBMS.AFFIDAVIT_SEQ);
            String paymentStr = "null";
            if (p != null) {
                long paymentId = makeNewPayment(c, p, p.payReferrer());
                paymentStr = "" + paymentId;
            }

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
                ResultSetContainer rsc = runSelectQuery(c, getAffidavitTexts.toString(), false);
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

            return affidavitId;
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
            setLockTimeout(con);

            // Get ID numbers
            long contractId = (long) DBMS.getSeqId(con, DBMS.CONTRACT_SEQ);

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
        // Not allowed to manually set status to Printed or Paid.  This can only be done
        // by the system.
        if (p.getStatusId() == PAID_STATUS) {
            throw new IllegalUpdateException("Payment status cannot be manually set to paid");
        }

        // Can't have net amount > gross amount
        if (p.getNetAmount() > p.getGrossAmount()) {
            throw new IllegalUpdateException("Net amount cannot exceed gross amount");
        }

        if (p.getGrossAmount() <= 0) {
            throw new IllegalUpdateException("Gross amount must be greater than zero");
        }

        if (newPayment) {
            return;
        }

        // dpecora - disabled this check.  Net amount <= 0 results in the payment
        // being put on hold
        /*
        if (p._netAmount <= 0) {
            throw new IllegalUpdateException("Net amount must be greater than zero");
        }
        */

        // Can't update if payment has already been paid
        StringBuffer checkPaid = new StringBuffer(300);
        checkPaid.append("SELECT COUNT(*) FROM payment p, payment_detail pd, payment_detail_xref pdx ");
        checkPaid.append("WHERE p.payment_id = pdx.payment_id ");
        checkPaid.append("AND pdx.payment_detail_id = pd.payment_detail_id ");
        checkPaid.append("AND pd.status_id = " + PAID_STATUS + " ");
        checkPaid.append("AND p.payment_id = " + p.getHeader().getId());
        ResultSetContainer rsc = runSelectQuery(c, checkPaid.toString(), false);
        int paidRecords = Integer.parseInt(rsc.getItem(0, 0).toString());
        if (paidRecords > 0) {
            throw new PaymentPaidException("Payment " + p.getHeader().getId() + " has already been paid " +
                    "and cannot be updated");
        }
    }

    // Helper function that calculates the payment net amount if necessary
    private void fillPaymentNetAmount(Connection c, Payment p) throws SQLException {
        // If the net amount is zero, fill in the appropriate net amount based on the
        // withholdings specified in the user_tax_form_xref for the payee.  If that isn't available,
        // we use the withholdings specified in the default tax form for the payee's country.
        // If that isn't available, we just set net amount = gross amount.

        if (p.getNetAmount() != 0)
            return;

        log.debug("In fillPaymentNetAmount");

        double withholdAmount = 0.0;
        float withholdPercent = 0.0F;
        int usePercent = 0;
        boolean dataFound = false;

        if (p.getHeader().getTypeId() != COMPONENT_PAYMENT &&
                p.getHeader().getTypeId() != REVIEW_BOARD_PAYMENT) {
            StringBuffer getUserWithholding = new StringBuffer(300);
            getUserWithholding.append("SELECT utf.withholding_amount, utf.withholding_percentage, ");
            getUserWithholding.append("utf.use_percentage ");
            getUserWithholding.append("FROM user_tax_form_xref utf, user_address_xref x, address a, country ");
            getUserWithholding.append("WHERE x.user_id = " + p.getHeader().getUser().getId() + " ");
            getUserWithholding.append("AND a.country_code = country.country_code ");
            getUserWithholding.append("and a.address_id = x.address_id ");
            getUserWithholding.append("and a.address_type_id = 2 ");
            getUserWithholding.append("AND utf.user_id = " + p.getHeader().getUser().getId());
            ResultSetContainer rsc = runSelectQuery(c, getUserWithholding.toString(), false);
            if (rsc.getRowCount() > 0) {
                withholdAmount = TCData.getTCDouble(rsc.getRow(0), "withholding_amount");
                withholdPercent = TCData.getTCFloat(rsc.getRow(0), "withholding_percentage");
                usePercent = TCData.getTCInt(rsc.getRow(0), "use_percentage");
                dataFound = true;
                log.debug("Got user withholding");
            } else {
                // country withholding removed since 6/22/2006 - mktong
                /*
                    StringBuffer getWithholding = new StringBuffer(300);
                    getWithholding.append("SELECT tf.default_withholding_amount, tf.default_withholding_percentage,");
                    getWithholding.append("tf.use_percentage AS default_use_percentage ");
                    getWithholding.append("FROM tax_form tf, user_address_xref x, address a,  country ");
                    getWithholding.append("WHERE x.user_id = " + p.getHeader().getUser().getId() + " ");
                    getWithholding.append("AND a.country_code = country.country_code ");
                    getWithholding.append("and x.address_id = a.address_id ");
                    getWithholding.append("and a.address_type_id = 2 ");
                    getWithholding.append("AND country.default_taxform_id = tf.tax_form_id");

                    rsc = runSelectQuery(c, getWithholding.toString(), false);
                    if (rsc.getRowCount() > 0) {
                        log.debug("Got country withholding");
                        withholdAmount = TCData.getTCDouble(rsc.getRow(0), "default_withholding_amount");
                        withholdPercent = TCData.getTCFloat(rsc.getRow(0), "default_withholding_percentage");
                        usePercent = TCData.getTCInt(rsc.getRow(0), "default_use_percentage");
                        dataFound = true;
                    }
                    */
            }
        }

        // Calculate the amount
        p.setNetAmount(p.getGrossAmount());
        if (dataFound) {
            if (usePercent == 1) {
                p.setNetAmount(p.getNetAmount() * (1 - withholdPercent));
            } else {
                p.setNetAmount(p.getNetAmount() - withholdAmount);
            }

            // Net amount can't be negative
            if (p.getNetAmount() < 0) {
                p.setNetAmount(0);
            }

            // Round to nearest penny
            DecimalFormat df = new DecimalFormat("0.00");
            String netAmount = df.format(p.getNetAmount());
            p.setNetAmount(new Double(netAmount).doubleValue());
        }
    }

    // Helper function getting the referring user
    private ResultSetContainer getReferrer(Connection c, long userId) throws SQLException {
        StringBuffer getReferralUser = new StringBuffer(300);
        getReferralUser.append("SELECT cr.reference_id, u.handle AS referrer_handle, ");
        getReferralUser.append("u2.handle AS coder_handle ");
        getReferralUser.append("FROM coder_referral cr, user u, user u2 ");
        getReferralUser.append("WHERE cr.coder_id = " + userId + " ");
        getReferralUser.append("AND cr.referral_id = " + CODER_REFERRAL_TYPE + " ");
        getReferralUser.append("AND u.user_id = cr.reference_id ");
        getReferralUser.append("AND u2.user_id = cr.coder_id");
        return runSelectQuery(c, getReferralUser.toString(), false);
    }

    // Helper function that adds the specified payment to the database
    // Assumes autocommit is false
    private long makeNewPayment(Connection c, Payment p, boolean createReferralPayment) throws Exception {
        log.debug("makeNewPayment called...");
        long paymentId = (long) DBMS.getSeqId(c, DBMS.PAYMENT_SEQ);
        long paymentDetailId = (long) DBMS.getSeqId(c, DBMS.PAYMENT_DETAIL_SEQ);
        PreparedStatement ps = null;

        // Run validation checks
        checkPayment(c, p, true);

        try {
            fillPaymentNetAmount(c, p);

            // We have a problem if the payment net amount is <= 0.  Put the payment
            // on hold.
            if (p.getNetAmount() <= 0)
                p.setStatusId(PAYMENT_ON_HOLD_STATUS);

            String addrStr = "null";

            // If the user is creating the payment with Ready to Print status, we need
            // to create the payment_address entry
            if (p.getStatusId() == READY_TO_PRINT_STATUS) {
                StringBuffer selectAddress = new StringBuffer(300);
                selectAddress.append("SELECT a.country_code, a.zip, a.state_code, a.city, ");
                selectAddress.append("a.address1, a.address2, u.first_name, u.middle_name, ");
                selectAddress.append("u.last_name, state.state_name, country.country_name, a.address3, a.province ");
                selectAddress.append("FROM user u, address a, user_address_xref x, OUTER state, OUTER country ");
                selectAddress.append("WHERE u.user_id = " + p.getHeader().getUser().getId() + " ");
                selectAddress.append("AND state.state_code = a.state_code ");
                selectAddress.append("AND country.country_code = a.country_code ");
                selectAddress.append("and u.user_id = x.user_id ");
                selectAddress.append("and x.address_id = a.address_id ");
                selectAddress.append("and a.address_type_id = 2 ");

                ResultSetContainer rsc = runSelectQuery(c, selectAddress.toString(), false);
                if (rsc.getRowCount() == 0)
                    throw new NoObjectFoundException("Coder " + p.getHeader().getUser().getId() + " not found in database");

                long paymentAddressId = (long) DBMS.getSeqId(c, DBMS.PAYMENT_ADDRESS_SEQ);
                addrStr = "" + paymentAddressId;

                StringBuffer addAddress = new StringBuffer(300);
                addAddress.append("INSERT INTO payment_address ");
                addAddress.append(" (payment_address_id, first_name, middle_name, last_name, ");
                addAddress.append("  address1, address2, city, state_code, zip, country_code,address3, province) ");
                addAddress.append(" VALUES(?,?,?,?,?,?,?,?,?,?)");
                ps = c.prepareStatement(addAddress.toString());
                ps.setLong(1, paymentAddressId);
                ps.setString(2, (String) rsc.getItem(0, "first_name").getResultData());
                ps.setString(3, (String) rsc.getItem(0, "middle_name").getResultData());
                ps.setString(4, (String) rsc.getItem(0, "last_name").getResultData());
                ps.setString(5, (String) rsc.getItem(0, "address1").getResultData());
                ps.setString(6, (String) rsc.getItem(0, "address2").getResultData());
                ps.setString(7, (String) rsc.getItem(0, "city").getResultData());
                ps.setString(8, (String) rsc.getItem(0, "state_code").getResultData());
                ps.setString(9, (String) rsc.getItem(0, "zip").getResultData());
                ps.setString(10, (String) rsc.getItem(0, "country_code").getResultData());
                ps.setString(11, (String) rsc.getItem(0, "address3").getResultData());
                ps.setString(12, (String) rsc.getItem(0, "province").getResultData());

                ps.executeUpdate();
                ps.close();
                ps = null;
            }

            String referralStr = "null";

            // Create the referral payment if requested and if we can find a referring user
            if (createReferralPayment) {
                ResultSetContainer rsc = getReferrer(c, p.getHeader().getUser().getId());
                if (rsc.getRowCount() > 0) {
                    Payment referPay = new Payment();
                    referPay.setGrossAmount(p.getGrossAmount() * REFERRAL_PERCENTAGE);
                    referPay.setNetAmount(0);
                    referPay.setStatusId(PAYMENT_OWED_STATUS);
                    long referId = Long.parseLong(rsc.getItem(0, "reference_id").toString());
                    String handle = rsc.getItem(0, "coder_handle").toString();
                    referPay.getHeader().setDescription("Referral bonus for " + handle + " " + p.getHeader().getDescription());
                    referPay.getHeader().setTypeId(CODER_REFERRAL_PAYMENT);
                    referPay.getHeader().getUser().setId(referId);

                    // Recursive call
                    long referralId = makeNewPayment(c, referPay, false);
                    referralStr = "" + referralId;
                }
            }

            StringBuffer insertPaymentDetail = new StringBuffer(300);
            insertPaymentDetail.append("INSERT INTO payment_detail ");
            insertPaymentDetail.append(" (payment_detail_id, net_amount, date_paid, date_printed, ");
            insertPaymentDetail.append("  gross_amount, status_id, payment_address_id, modification_rationale_id, ");
            insertPaymentDetail.append("  payment_desc, payment_type_id, payment_method_id, date_modified, date_due, project_id, client) ");
            insertPaymentDetail.append(" VALUES(?,?,null,null,?,?," + addrStr + ",?,?,?,?,?,?,?,?)");

            ps = c.prepareStatement(insertPaymentDetail.toString());
            ps.setLong(1, paymentDetailId);
            ps.setDouble(2, p.getNetAmount());
            ps.setDouble(3, p.getGrossAmount());
            ps.setInt(4, p.getStatusId());
            ps.setInt(5, MODIFICATION_NEW); // modification_rationale_id
            ps.setString(6, p.getHeader().getDescription());
            ps.setInt(7, p.getHeader().getTypeId());
            ps.setInt(8, p.getHeader().getMethodId());
            ps.setTimestamp(9, new Timestamp(System.currentTimeMillis())); // date_modified
            ps.setTimestamp(10, makeTimestamp(p.getDueDate(), true, false));
            if (p.getHeader().getProjectId() != 0) {
                ps.setLong(11, p.getHeader().getProjectId());
            } else {
                ps.setNull(11, Types.DECIMAL);
            }
            if (!StringUtils.checkNull(p.getHeader().getClient()).equals("")) {
                ps.setString(12, p.getHeader().getClient());
            } else {
                ps.setNull(12, Types.VARCHAR);
            }

            ps.executeUpdate();
            ps.close();
            ps = null;

            // Add the payment record
            StringBuffer insertPayment = new StringBuffer(300);
            insertPayment.append("INSERT INTO payment ");
            insertPayment.append(" (payment_id, user_id, most_recent_detail_id, print_count, review, ");
            insertPayment.append("  referral_payment_id) ");
            insertPayment.append(" VALUES(?,?,?,?,?," + referralStr + ")");
            ps = c.prepareStatement(insertPayment.toString());
            ps.setLong(1, paymentId);
            ps.setLong(2, p.getHeader().getUser().getId());
            ps.setLong(3, paymentDetailId);
            ps.setInt(4, 0); // print_count
            ps.setInt(5, 0); // review
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

    /**
     * Adds the specified payment to the database.  Does not add a corresponding referral
     * payment.
     *
     * @param p Data for the new payment.
     * @return The new payment's ID.
     * @throws IllegalUpdateException If the user is trying to make some update that is not allowed
     * @throws SQLException           If there is some problem updating the data
     */
    public long addPayment(Payment p) throws IllegalUpdateException, SQLException {
        Connection c = null;
        try {
            c = DBMS.getConnection();
            c.setAutoCommit(false);
            setLockTimeout(c);
            long paymentId = makeNewPayment(c, p, false);
            c.commit();
            c.setAutoCommit(true);
            c.close();
            c = null;
            return paymentId;
        } catch (Exception e) {
            printException(e);
            try {
                c.rollback();
            } catch (Exception e1) {
                printException(e1);
            }
            try {
                c.setAutoCommit(true);
            } catch (Exception e1) {
                printException(e1);
            }
            try {
                if (c != null) c.close();
            } catch (Exception e1) {
                printException(e1);
            }
            c = null;
            if (e instanceof IllegalUpdateException)
                throw (IllegalUpdateException) e;
            throw new SQLException(e.getMessage());
        }
    }

    /**
     * Adds the specified payment to the database, and to the specified contract.  Does
     * not add a corresponding referral payment.
     *
     * @param contractId The ID of the contract to which to add the payment.
     * @param p          The payment data to add.
     * @return The new payment's ID.
     * @throws IllegalUpdateException If the user is trying to make an update that is not allowed
     * @throws SQLException           If there is some problem updating the data
     */
    public long addContractPayment(long contractId, Payment p) throws IllegalUpdateException, SQLException {
        Connection c = null;
        try {
            c = DBMS.getConnection();
            c.setAutoCommit(false);
            setLockTimeout(c);
            long paymentId = makeNewPayment(c, p, false);

            // Now add the contract_payment_xref entry
            StringBuffer insertXref = new StringBuffer(300);
            insertXref.append("INSERT INTO contract_payment_xref ");
            insertXref.append(" (contract_id, payment_id) ");
            insertXref.append(" VALUES(" + contractId + "," + paymentId + ")");
            runUpdateQuery(c, insertXref.toString(), false);

            c.commit();
            c.setAutoCommit(true);
            c.close();
            c = null;
            return paymentId;
        } catch (Exception e) {
            printException(e);
            try {
                c.rollback();
            } catch (Exception e1) {
                printException(e1);
            }
            try {
                c.setAutoCommit(true);
            } catch (Exception e1) {
                printException(e1);
            }
            try {
                if (c != null) c.close();
            } catch (Exception e1) {
                printException(e1);
            }
            c = null;
            if (e instanceof IllegalUpdateException)
                throw (IllegalUpdateException) e;
            throw new SQLException(e.getMessage());
        }
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
            setLockTimeout(c);
            long taxFormId = (long) DBMS.getSeqId(c, DBMS.TAX_FORM_SEQ);

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
    public void addUserTaxForm(TaxForm t) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        try {
            c = DBMS.getConnection();
            setLockTimeout(c);

            StringBuffer getDefaults = new StringBuffer(300);
            getDefaults.append("SELECT default_withholding_amount, default_withholding_percentage, use_percentage ");
            getDefaults.append("FROM tax_form WHERE tax_form_id = " + t.getHeader().getId());
            ResultSetContainer rsc = runSelectQuery(c, getDefaults.toString(), false);
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
            ps.setTimestamp(3, makeTimestamp(t.getHeader().getDateFiled(), true, false));
            ps.setDouble(4, withholdAmount);
            ps.setFloat(5, withholdPercent);
            ps.setInt(6, t.getHeader().getStatusId());
            ps.setInt(7, usePercent);
            ps.executeUpdate();
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
            c = DBMS.getConnection();
            c.setAutoCommit(false);
            setLockTimeout(c);

            // Get ID number
            long noteId = (long) DBMS.getSeqId(c, DBMS.NOTE_SEQ);

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

            c.commit();
            c.setAutoCommit(true);
            c.close();
            c = null;

            return noteId;
        } catch (Exception e) {
            printException(e);
            try {
                if (ps != null) ps.close();
            } catch (Exception e1) {
                printException(e1);
            }
            ps = null;
            try {
                c.rollback();
            } catch (Exception e1) {
                printException(e1);
            }
            try {
                c.setAutoCommit(true);
            } catch (Exception e1) {
                printException(e1);
            }
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
        runUpdateQuery(insertXref.toString(), true);
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
            c = DBMS.getConnection();
            c.setAutoCommit(false);
            setLockTimeout(c);

            StringBuffer checkAffidavit = new StringBuffer(300);
            checkAffidavit.append("SELECT a.status_id, a.payment_id, a.affirmed, ");
            checkAffidavit.append("pd.status_id AS payment_status_id ");
            checkAffidavit.append("FROM affidavit a, OUTER(payment p, payment_detail pd) ");
            checkAffidavit.append("WHERE affidavit_id = " + affidavitId + " ");
            checkAffidavit.append("AND a.payment_id = p.payment_id ");
            checkAffidavit.append("AND p.most_recent_detail_id = pd.payment_detail_id");
            ResultSetContainer rsc = runSelectQuery(c, checkAffidavit.toString(), false);
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

            // Change to not update the associated payment if the payment is on hold or canceled.
            Integer paymentStatusId = (Integer) rsc.getItem(0, "payment_status_id").getResultData();
            boolean okToUpdate = false;
            if (paymentId != null) {
                if (paymentStatusId == null) {
                    log.error("Null payment status id found for payment " + paymentId.longValue());
                    okToUpdate = true;
                } else {
                    long statusIdValue = paymentStatusId.longValue();
                    if (statusIdValue != PAYMENT_CANCELED_STATUS) {
                        okToUpdate = true;
                    }
                }
            }

            if (okToUpdate) {
                long inputs[] = new long[1];
                inputs[0] = paymentId.longValue();
                try {
                    updatePaymentStatus(c, inputs, PAYMENT_OWED_STATUS);
                } catch (Exception e) {
                    // If the payment has already been paid, ignore the error.  Otherwise, there is a problem.
                    if (!(e instanceof PaymentPaidException))
                        throw e;
                }
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
            ps.close();

            if (rowsModified == 0) {
                throw new NoObjectFoundException("User for affidavit " + affidavitId + " not found in database");
            }

            c.commit();
            c.setAutoCommit(true);
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
                c.rollback();
            } catch (Exception e1) {
                printException(e1);
            }
            try {
                c.setAutoCommit(true);
            } catch (Exception e1) {
                printException(e1);
            }
            try {
                if (c != null) c.close();
            } catch (Exception e1) {
                printException(e1);
            }
            c = null;
            if (e instanceof NoObjectFoundException)
                throw (NoObjectFoundException) e;
            else if (e instanceof IllegalUpdateException)
                throw (IllegalUpdateException) e;
            else
                throw new SQLException(e.getMessage());
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
            c = DBMS.getConnection();
            setLockTimeout(c);

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

        if (rowsModified == 0)
            throw new NoObjectFoundException("Affidavit " + a.getHeader().getId() + " not found in database");
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
            setLockTimeout(con);

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
     * Updates the given payment.  This process creates a new payment
     * detail record, and also a new payment address record if the updated
     * status is "Ready to Print".
     *
     * @param p The updated payment information
     * @throws NoObjectFoundException If the specified payment was not found
     * @throws PaymentPaidException   If the payment has already been paid
     * @throws IllegalUpdateException If the user attempted to make some update that was not allowed
     * @throws SQLException           If there is some problem updating the data
     */
    public void updatePayment(Payment p)
            throws NoObjectFoundException, IllegalUpdateException, PaymentPaidException, SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        try {
            c = DBMS.getConnection();
            c.setAutoCommit(false);
            setLockTimeout(c);

            ResultSetContainer.ResultSetRow addressData = null;

            if (p.getStatusId() == READY_TO_PRINT_STATUS) {
                StringBuffer selectAddresses = new StringBuffer(300);
                selectAddresses.append("SELECT a.country_code, a.zip, a.state_code, a.city, ");
                selectAddresses.append("a.address1, a.address2, u.first_name, u.middle_name, ");
                selectAddresses.append("u.last_name, state.state_name, country.country_name, ");
                selectAddresses.append("p.payment_id, a.address3, a.province ");
                selectAddresses.append("FROM user u, address a, user_address_xref x, payment p, OUTER state, OUTER country ");
                selectAddresses.append("WHERE p.payment_id = " + p.getHeader().getId() + " ");
                selectAddresses.append("AND u.user_id = p.user_id ");
                selectAddresses.append("AND state.state_code = a.state_code ");
                selectAddresses.append("AND country.country_code = a.country_code ");
                selectAddresses.append("and a.address_id = x.address_id ");
                selectAddresses.append("and a.address_type_id = 2 ");
                selectAddresses.append("and x.user_id = u.user_id ");


                ResultSetContainer rsc = runSelectQuery(c, selectAddresses.toString(), false);
                if (rsc.getRowCount() == 0)
                    throw new NoObjectFoundException("Payment " + p.getHeader().getId() + " not found in database");
                addressData = rsc.getRow(0);
            }

            updatePayment(c, p, addressData);

            c.commit();
            c.setAutoCommit(true);
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
                c.rollback();
            } catch (Exception e1) {
                printException(e1);
            }
            try {
                c.setAutoCommit(true);
            } catch (Exception e1) {
                printException(e1);
            }
            try {
                if (c != null) c.close();
            } catch (Exception e1) {
                printException(e1);
            }
            c = null;
            if (e instanceof NoObjectFoundException)
                throw (NoObjectFoundException) e;
            else if (e instanceof IllegalUpdateException)
                throw (IllegalUpdateException) e;
            else if (e instanceof PaymentPaidException)
                throw (PaymentPaidException) e;
            throw new SQLException(e.getMessage());
        }
    }

    // Helper function, assumes autocommit is false
    private void updatePayment(Connection c, Payment p, ResultSetContainer.ResultSetRow addressData) throws Exception {
        String addrStr = "null";
        PreparedStatement ps = null;

        // Check for validity
        checkPayment(c, p, false);

        fillPaymentNetAmount(c, p);

        // We have a problem if the payment net amount is <= 0.  Put the payment
        // on hold.
        if (p.getNetAmount() <= 0)
            p.setStatusId(PAYMENT_ON_HOLD_STATUS);

        try {
            // Add address record if necessary
            if (addressData != null && p.getStatusId() != PAYMENT_ON_HOLD_STATUS) {
                long paymentAddressId = (long) DBMS.getSeqId(c, DBMS.PAYMENT_ADDRESS_SEQ);
                addrStr = "" + paymentAddressId;

                StringBuffer addAddress = new StringBuffer(300);
                addAddress.append("INSERT INTO payment_address ");
                addAddress.append(" (payment_address_id, first_name, middle_name, last_name, ");
                addAddress.append("  address1, address2, city, state_code, zip, country_code, address3, province) ");
                addAddress.append(" VALUES(?,?,?,?,?,?,?,?,?,?,?,?)");
                ps = c.prepareStatement(addAddress.toString());
                ps.setLong(1, paymentAddressId);
                ps.setString(2, (String) addressData.getItem("first_name").getResultData());
                ps.setString(3, (String) addressData.getItem("middle_name").getResultData());
                ps.setString(4, (String) addressData.getItem("last_name").getResultData());
                ps.setString(5, (String) addressData.getItem("address1").getResultData());
                ps.setString(6, (String) addressData.getItem("address2").getResultData());
                ps.setString(7, (String) addressData.getItem("city").getResultData());
                ps.setString(8, (String) addressData.getItem("state_code").getResultData());
                ps.setString(9, (String) addressData.getItem("zip").getResultData());
                ps.setString(10, (String) addressData.getItem("country_code").getResultData());
                ps.setString(11, (String) addressData.getItem("address3").getResultData());
                ps.setString(12, (String) addressData.getItem("province").getResultData());

                ps.executeUpdate();
                ps.close();
                ps = null;
            }

            long paymentDetailId = (long) DBMS.getSeqId(c, DBMS.PAYMENT_DETAIL_SEQ);

            // Insert the detail record
            StringBuffer insertPaymentDetail = new StringBuffer(300);
            insertPaymentDetail.append("INSERT INTO payment_detail ");
            insertPaymentDetail.append(" (payment_detail_id, net_amount, date_paid, date_printed, ");
            insertPaymentDetail.append("  gross_amount, status_id, payment_address_id, modification_rationale_id, ");
            insertPaymentDetail.append("  payment_desc, payment_type_id, payment_method_id, date_modified, date_due, project_id, client) ");
            insertPaymentDetail.append(" VALUES(?,?,null,null,?,?," + addrStr + ",?,?,?,?,?,?,?,?)");

            ps = c.prepareStatement(insertPaymentDetail.toString());
            ps.setLong(1, paymentDetailId);
            ps.setDouble(2, p.getNetAmount());
            ps.setDouble(3, p.getGrossAmount());
            ps.setInt(4, p.getStatusId());
            ps.setInt(5, p.getRationaleId());
            ps.setString(6, p.getHeader().getDescription());
            ps.setInt(7, p.getHeader().getTypeId());
            ps.setInt(8, p.getHeader().getMethodId());
            ps.setTimestamp(9, new Timestamp(System.currentTimeMillis())); // date_modified
            ps.setTimestamp(10, makeTimestamp(p.getDueDate(), true, false));
            if (p.getHeader().getProjectId() != 0) {
                ps.setLong(11, p.getHeader().getProjectId());
            } else {
                ps.setNull(11, Types.DECIMAL);
            }
            if (!StringUtils.checkNull(p.getHeader().getClient()).equals("")) {
                ps.setString(12, p.getHeader().getClient());
            } else {
                ps.setNull(12, Types.VARCHAR);
            }
            ps.executeUpdate();
            ps.close();
            ps = null;

            // Update the header
            StringBuffer updateHeader = new StringBuffer(300);
            updateHeader.append("UPDATE payment SET most_recent_detail_id = " + paymentDetailId);
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
            setLockTimeout(c);

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
            c = DBMS.getConnection();
            setLockTimeout(c);

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
            c = DBMS.getConnection();
            setLockTimeout(c);
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
            if (e instanceof NoObjectFoundException)
                throw (NoObjectFoundException) e;
            else
                throw new SQLException(e.getMessage());
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

    // This is a lot like the helper function below, but requires payment-level granularity and
    // a record of each payment update outcome.  Also commits after each payment update to release
    // locks.
    private UpdateResults batchUpdateStatus(Connection c, long paymentId[], int statusId)
            throws SQLException {
        ResultSetContainer addressData, detailData;
        int i;

        // Do in ascending order
        Arrays.sort(paymentId);

        // Get status name
        String query = "SELECT status_desc FROM status_lu WHERE status_id = " + statusId;
        ResultSetContainer statusName = runSelectQuery(c, query, false);

        if (statusName.getRowCount() == 0) {
            throw new SQLException("Status code " + statusId + " not found in database");
        }

        String statusDesc = statusName.getItem(0, 0).toString();
        UpdateResults ur = new UpdateResults(paymentId, statusId, statusDesc);

        for (i = 0; i < paymentId.length; i++) {
            addressData = null;

            if (statusId == READY_TO_PRINT_STATUS) {
                StringBuffer selectAddress = new StringBuffer(2000);
                selectAddress.append("SELECT a.country_code, a.zip, a.state_code, a.city, ");
                selectAddress.append("a.address1, a.address2, u.first_name, u.middle_name, ");
                selectAddress.append("u.last_name, state.state_name, country.country_name, ");
                selectAddress.append("p.payment_id, a.address3, a.province ");
                selectAddress.append("FROM user u, address a, user_address_xref x, payment p, OUTER state, OUTER country ");
                selectAddress.append("WHERE p.payment_id = " + paymentId[i] + " ");
                selectAddress.append("AND u.user_id = p.user_id ");
                selectAddress.append("AND state.state_code = a.state_code ");
                selectAddress.append("AND country.country_code = a.country_code ");
                selectAddress.append("and u.user_id = x.user_id ");
                selectAddress.append("and x.address_id = a.address_id ");
                selectAddress.append("and a.address_type_id = 2 ");

                addressData = runSelectQuery(c, selectAddress.toString(), false);
                if (addressData.getRowCount() != 1) {
                    ur.put(paymentId[i], new NoObjectFoundException("Payment not found in database"));
                    continue;
                }
            }

            // Get all the payment detail data
            StringBuffer selectData = new StringBuffer(300);
            selectData.append("SELECT p.payment_id, pd.net_amount, pd.gross_amount, pd.status_id, ");
            selectData.append("pd.modification_rationale_id, pd.payment_desc, pd.payment_type_id, pd.payment_method_id, ");
            selectData.append("pd.project_id, pd.client, pd.date_due ");
            selectData.append("FROM payment p, payment_detail pd ");
            selectData.append("WHERE p.most_recent_detail_id = pd.payment_detail_id ");
            selectData.append("AND p.payment_id = " + paymentId[i]);

            detailData = runSelectQuery(c, selectData.toString(), false);
            if (detailData.getRowCount() != 1) {
                ur.put(paymentId[i], new NoObjectFoundException("Payment not found in database"));
                continue;
            }

            Payment p = new Payment();
            p.getHeader().setId(paymentId[i]);

            p.setNetAmount(TCData.getTCDouble(detailData.getRow(0), "net_amount", 0, false));
            p.setGrossAmount(TCData.getTCDouble(detailData.getRow(0), "gross_amount", 0, false));
            p.setStatusId(statusId);
            p.setRationaleId(MODIFICATION_STATUS);
            p.getHeader().setDescription(TCData.getTCString(detailData.getRow(0), "payment_desc", "", false));
            p.getHeader().setTypeId(TCData.getTCInt(detailData.getRow(0), "payment_type_id", 1, false));
            p.getHeader().setMethodId(TCData.getTCInt(detailData.getRow(0), "payment_method_id", 1, false));
            p.getHeader().setProjectId(TCData.getTCLong(detailData.getRow(0), "project_id", 0, false));
            p.getHeader().setClient(TCData.getTCString(detailData.getRow(0), "client", "", false));
            p.setDueDate(TCData.getTCDate(detailData.getRow(0), "date_due", null, false));

            // All the data modifications happen here
            try {
                if (addressData == null) {
                    updatePayment(c, p, null);
                } else {
                    updatePayment(c, p, addressData.getRow(0));
                }
                // Commit after each payment update to release locks for anybody else waiting on the
                // payment tables
                c.commit();
            } catch (Exception e) {
                // Record error and keep going, unless there's a database problem
                // dpecora 05/03 - a database problem is probably a lock timeout which
                // is a transient problem.  Furthermore throwing an exception here will
                // mean that earlier payment modifications in this loop which did go through
                // will be incorrectly reported as having had this same exception thrown.
                // (If the higher level functions get an exception from here, they construct
                // an UpdateResults object with that same exception associated with ALL
                // payments.)
                //
                // Therefore, this is now commented out.
                //
                //if (e instanceof SQLException)
                //    throw (SQLException) e;
                ur.put(paymentId[i], e);
            }
        } // end for loop over the payments

        return ur;
    } // end batchUpdateStatus() function

    // Helper function, assumes autocommit false
    private void updatePaymentStatus(Connection c, long paymentId[], int statusId) throws Exception {
        ResultSetContainer addressData = null, detailData = null;
        int i;

        // Do in ascending order
        Arrays.sort(paymentId);
        String paymentList = makeList(paymentId);

        // Get all the address data we need (if applicable)
        if (statusId == READY_TO_PRINT_STATUS) {
            StringBuffer selectAddresses = new StringBuffer(2000);
            selectAddresses.append("SELECT a.country_code, a.zip, a.state_code, a.city, ");
            selectAddresses.append("a.address1, a.address2, u.first_name, u.middle_name, ");
            selectAddresses.append("u.last_name, state.state_name, country.country_name, ");
            selectAddresses.append("p.payment_id, a.address3, a.province ");
            selectAddresses.append("FROM user u, address a, user_address_xref x, payment p, OUTER state, OUTER country ");
            selectAddresses.append("WHERE p.payment_id IN(" + paymentList + ") ");
            selectAddresses.append("AND u.user_id = p.user_id ");
            selectAddresses.append("AND state.state_code = a.state_code ");
            selectAddresses.append("AND country.country_code = a.country_code ");
            selectAddresses.append("and u.user_id = x.user_id ");
            selectAddresses.append("and x.address_id = a.address_id ");
            selectAddresses.append("and a.address_type_id = 2 ");
            selectAddresses.append("ORDER BY p.payment_id");

            addressData = runSelectQuery(c, selectAddresses.toString(), false);
            if (addressData.getRowCount() != paymentId.length) {
                throw new NoObjectFoundException("Some payment ID's could not be found to update.");
            }
        }

        // Get all the payment detail data
        StringBuffer selectData = new StringBuffer(300);
        selectData.append("SELECT p.payment_id, pd.net_amount, pd.gross_amount, pd.status_id, ");
        selectData.append("pd.modification_rationale_id, pd.payment_desc, pd.payment_type_id, pd.payment_method_id, ");
        selectData.append("pd.project_id, pd.client, pd.date_due ");
        selectData.append("FROM payment p, payment_detail pd ");
        selectData.append("WHERE p.most_recent_detail_id = pd.payment_detail_id ");
        selectData.append("AND p.payment_id IN(" + paymentList + ") ");
        selectData.append("ORDER BY p.payment_id");

        detailData = runSelectQuery(c, selectData.toString(), false);
        if (detailData.getRowCount() != paymentId.length) {
            throw new NoObjectFoundException("Some payment ID's could not be found to update.");
        }

        Payment p = new Payment();
        for (i = 0; i < paymentId.length; i++) {
            p.getHeader().setId(paymentId[i]);

            p.setNetAmount(TCData.getTCDouble(detailData.getRow(i), "net_amount", 0, false));
            p.setGrossAmount(TCData.getTCDouble(detailData.getRow(i), "gross_amount", 0, false));
            p.setStatusId(statusId);
            p.setRationaleId(MODIFICATION_STATUS);
            p.getHeader().setDescription(TCData.getTCString(detailData.getRow(i), "payment_desc", "", false));
            p.getHeader().setTypeId(TCData.getTCInt(detailData.getRow(i), "payment_type_id", 1, false));
            p.getHeader().setMethodId(TCData.getTCInt(detailData.getRow(i), "payment_method_id", 1, false));
            p.getHeader().setProjectId(TCData.getTCLong(detailData.getRow(i), "project_id", 0, false));
            p.getHeader().setClient(TCData.getTCString(detailData.getRow(i), "client", "", false));
            p.setDueDate(TCData.getTCDate(detailData.getRow(i), "date_due", null, false));

            // All the data modifications happen here
            if (addressData == null) {
                updatePayment(c, p, null);
            } else {
                updatePayment(c, p, addressData.getRow(i));
            }
        }
    }

    /**
     * Updates the specified payments to the specified status. This function
     * should only be called by the Pacts message handler upon receipt of a message
     * passed in by the <tt>batchUpdatePaymentStatus</tt> function.
     *
     * @param paymentId The payments to update
     * @param statusId  The new status
     * @throws SQLException If there is some other problem updating the data
     */
    public UpdateResults doBatchUpdatePaymentStatus(long paymentId[], int statusId) throws SQLException {
        Connection c = null;
        try {
            log.debug("In doBatchUpdatePaymentStatus()");
            c = DBMS.getConnection();
            c.setAutoCommit(false);
            setLockTimeout(c);

            UpdateResults ur = batchUpdateStatus(c, paymentId, statusId);

            // Commits done after each payment in batchUpdateStatus()
            // c.commit();
            c.setAutoCommit(true);
            c.close();
            c = null;

            return ur;
        } catch (Exception e) {
            printException(e);
            try {
                c.rollback();
            } catch (Exception e1) {
                printException(e1);
            }
            try {
                c.setAutoCommit(true);
            } catch (Exception e1) {
                printException(e1);
            }
            try {
                if (c != null) c.close();
            } catch (Exception e1) {
                printException(e1);
            }
            c = null;
            if (e instanceof SQLException)
                throw (SQLException) e;
            throw new SQLException(e.getMessage());
        }
    }

    /**
     * Updates the status on all the given payments to the given status.
     * Because this is a payment modification, this process creates a new
     * detail record for each payment involved, and a new address record if
     * called with &quot;Ready to Print&quot; status.  This function should be called
     * with the &quot;Ready to Print&quot; status to ready payments for printing. <p>
     * <p/>
     * This function actually just puts a message on the JMS queue.  The message handler,
     * upon receipt of the message, will call the function <tt>doBatchUpdatePaymentStatus()</tt>
     * which performs the modifications.
     *
     * @param paymentId The payments to update
     * @param statusId  The new status
     * @param userId    The ID of the user submitting the request
     * @throws IllegalUpdateException If the user is attempting to update the status to Printed or Paid
     * @throws JMSException           If there is some problem putting the message on the queue
     */
    public void batchUpdatePaymentStatus(long paymentId[], int statusId, long userId)
            throws IllegalUpdateException, JMSException {
        try {
            log.debug("In batchUpdatePaymentStatus()");

            // Not allowed to manually set status to Printed or Paid.  This can only be done
            // by the system.
            if (statusId == PAID_STATUS) {
                throw new IllegalUpdateException("Payment status cannot be manually set to paid");
            }

            HashMap properties = new HashMap();
            properties.put(STATUS_PROPERTY, new Integer(statusId));
            properties.put(USER_PROPERTY, new Long(userId));
            properties.put(UPDATE_TYPE_PROPERTY, new Integer(STATUS_UPDATE_TYPE));

            if (pactsMsgSender == null) {
                throw new JMSException("PACTS message queue has not been properly initialized.  Redeploy PACTS.");
            }

            if (!pactsMsgSender.sendMessage(properties, paymentId)) {
                throw new JMSException("Could not post batch update request to PACTS message queue.");
            }
        } catch (Exception e) {
            printException(e);
            if (e instanceof IllegalUpdateException)
                throw (IllegalUpdateException) e;
            throw (JMSException) e;
        }
    }

    /**
     * Marks the given payments as reviewed.  This function should be called if the
     * user wants to reprint payments that have already been printed, prior to the
     * reprint request.  Its purpose is to ensure that payments don't get printed
     * multiple times without good reason.
     *
     * @param paymentId The payments to mark as reviewed.
     * @throws NoObjectFoundException If any payment does not exist
     * @throws IllegalUpdateException If any payment has not been printed
     * @throws SQLException           If there is some other problem updating the data
     */
    public void reviewPayments(long paymentId[])
            throws NoObjectFoundException, IllegalUpdateException, SQLException {
        Connection c = null;

        try {
            c = DBMS.getConnection();
            setLockTimeout(c);

            Arrays.sort(paymentId);
            String idList = makeList(paymentId);

            ResultSetContainer rsc = runSelectQuery(c, "SELECT COUNT(*) FROM payment WHERE payment_id IN(" + idList + ")", false);
            int paymentCount = Integer.parseInt(rsc.getItem(0, 0).toString());
            if (paymentCount != paymentId.length) {
                throw new NoObjectFoundException("Some of the payments to update could not be found");
            }

            rsc = runSelectQuery(c, "SELECT COUNT(*) FROM payment WHERE payment_id IN(" + idList + ") AND print_count > 0", false);
            paymentCount = Integer.parseInt(rsc.getItem(0, 0).toString());
            if (paymentCount != paymentId.length) {
                throw new IllegalUpdateException("Some of the payments to mark as reviewed have not been printed");
            }

            runUpdateQuery(c, "UPDATE payment SET review = 1 WHERE payment_id IN(" + idList + ")", false);
            c.close();
            c = null;
        } catch (Exception e) {
            printException(e);
            try {
                if (c != null) c.close();
            } catch (Exception e1) {
                printException(e1);
            }
            c = null;
            if (e instanceof NoObjectFoundException)
                throw (NoObjectFoundException) e;
            else if (e instanceof IllegalUpdateException)
                throw (IllegalUpdateException) e;
            throw new SQLException(e.getMessage());
        }
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
            c = DBMS.getConnection();
            ResultSetContainer rsc = runSelectQuery(c, query.toString(), false);
            ret = Integer.parseInt(rsc.getItem(0, 0).toString()) > 0;

        } catch (SQLException e) {
            close(c);
        } finally {
            close(c);
        }
        return ret;

    }

    public boolean hasAllDemographicAnswers(long userId) throws SQLException {

        StringBuffer query = new StringBuffer(300);
        query.append("SELECT COUNT(*) FROM demographic_assignment da, demographic_question dq ");
        query.append("WHERE da.coder_type_id = ");
        query.append("  (SELECT coder_type_id from coder where coder_id = " + userId + ") ");
        query.append(" AND dq.demographic_question_id = da.demographic_question_id ");
        query.append(" and da.status = 'A'");
        query.append(" AND dq.demographic_question_id NOT IN ");
        query.append("  (SELECT demographic_question_id FROM demographic_response ");
        query.append("   WHERE user_id = " + userId + ") ");
        query.append(" AND da.registration_type_id = 1 ");
        query.append(" AND da.is_required = 1 ");

        Connection c = null;
        boolean ret = false;
        try {
            c = DBMS.getConnection();
            ResultSetContainer rsc = runSelectQuery(c, query.toString(), false);
            ret = Integer.parseInt(rsc.getItem(0, 0).toString()) == 0;

        } catch (SQLException e) {
            close(c);
        } finally {
            close(c);
        }
        return ret;

    }

    public boolean hasTaxForm(long userId) throws SQLException {

        // Change to also check for tax forms on file
        StringBuffer query = new StringBuffer(300);
        query.append("SELECT COUNT(*) FROM user_tax_form_xref WHERE user_id = " + userId);

        Connection c = null;
        boolean ret = false;
        try {
            c = DBMS.getConnection();
            ResultSetContainer rsc = runSelectQuery(c, query.toString(), false);
            ret = Integer.parseInt(rsc.getItem(0, 0).toString()) > 0;

        } catch (SQLException e) {
            close(c);
        } finally {
            close(c);
        }
        return ret;
    }


    // Surrounds with "" if the string contains a comma, as QuickBooks won't like
    // a CSV file with this String otherwise.
    private String shroud(String s) {
        if (s.indexOf(",") < 0)
            return s;
        return '"' + s + '"';
    }

    /**
     * Prints the payments that have status of "Ready to Print" to an external location.
     * For each payment, updates the status to "Paid", updates the print count, sets
     * the review field to zero, and sets the date paid to the current date and time.
     * The payment information, and the separate payee or "vendor" information, are returned
     * in a two-element string array, the payment information coming first.
     *
     * @return The payment and vendor information in String form
     * @throws PaymentNotReviewedException If any of the payments to print has been
     *                                     previously printed and not subsequently reviewed
     * @throws SQLException                If there is some problem updating the database
     */
    public String[] printPayments() throws PaymentNotReviewedException, SQLException {
        log.debug("printPayments called...");
        Connection c = null;
        PreparedStatement ps = null;
        try {
            c = DBMS.getConnection();
            c.setAutoCommit(false);
            setLockTimeout(c);

            // First we have to put payments on hold if they belong to inactive coders.
            // This also includes the corresponding referral payments.
            StringBuffer getHoldPayments = new StringBuffer(300);
            getHoldPayments.append("SELECT p.payment_id, p2.payment_id ");
            getHoldPayments.append("FROM payment p, payment_detail pd, user u, OUTER payment p2 ");
            getHoldPayments.append("WHERE p.referral_payment_id = p2.payment_id ");
            getHoldPayments.append("AND p.user_id = u.user_id ");
            getHoldPayments.append("AND p.most_recent_detail_id = pd.payment_detail_id ");
            getHoldPayments.append("AND pd.status_id = " + READY_TO_PRINT_STATUS + " ");
            getHoldPayments.append("AND u.status != '" + ACTIVE_CODER_STATUS + "' ");
            ResultSetContainer rsc = runSelectQuery(c, getHoldPayments.toString(), false);

            int rc = rsc.getRowCount();

            if (rc > 0) {
                // Found stuff to put on hold.  Use a TreeSet to weed out duplicates
                // (which will occur if a payment and its referral both belong to inactive
                // coders).
                TreeSet holders = new TreeSet();

                for (int i = 0; i < rc; i++) {
                    Long paymentId = (Long) rsc.getItem(i, 0).getResultData();
                    Long referId = (Long) rsc.getItem(i, 1).getResultData();
                    holders.add(paymentId);

                    if (referId != null) {
                        holders.add(referId);
                    }
                }

                long holdArray[] = new long[holders.size()];
                Iterator it = holders.iterator();
                int j = 0;
                while (it.hasNext()) {
                    holdArray[j++] = ((Long) it.next()).longValue();
                }

                // There's a small chance that a referral payment in this set has
                // already been paid.  So we can't update all at once.
                long pid[] = new long[1];
                for (int i = 0; i < holdArray.length; i++) {
                    try {
                        pid[0] = holdArray[i];
                        updatePaymentStatus(c, pid, PAYMENT_ON_HOLD_STATUS);
                    } catch (PaymentPaidException e) {
                        log.warn("Payment " + pid[0] + " is a referral payment for an inactive coder.\n" +
                                "It should go on hold but has already been paid.");
                    }
                }
            }

            // Now get the surviving payments that are ready to print
            StringBuffer select = new StringBuffer(700);
            select.append("SELECT p.payment_id, p.user_id, pd.payment_desc, pd.payment_type_id, ");
            select.append("pd.payment_detail_id, pd.net_amount, pd.gross_amount, ");
            select.append("pa.first_name, pa.middle_name, pa.last_name, pa.address1, ");
            select.append("pa.address2, pa.city, pa.state_code, state.state_name, ");
            select.append("pa.zip, pa.country_code, country.country_name, e.address AS email, ");
            select.append("c.contract_type_id, p.print_count, p.review, pd.date_due, ");
            select.append("utx.tax_form_id AS w9_tax_form, utx2.tax_form_id AS w8ben_tax_form, pa.address3, pa.province ");
            select.append("FROM payment p, payment_detail pd, payment_address pa, ");
            select.append("user u, email e, OUTER state, OUTER country, ");
            select.append("OUTER(contract_payment_xref cpx, contract c), ");
            select.append("OUTER(user_tax_form_xref utx, tax_form tx), ");
            select.append("OUTER(user_tax_form_xref utx2, tax_form tx2) ");
            select.append("WHERE p.most_recent_detail_id = pd.payment_detail_id ");
            select.append("AND pd.status_id = " + READY_TO_PRINT_STATUS + " ");
            select.append("AND pd.payment_address_id = pa.payment_address_id ");
            select.append("AND p.user_id = u.user_id ");
            select.append("AND u.user_id = e.user_id ");
            select.append("AND e.primary_ind = 1 ");
            select.append("AND state.state_code = pa.state_code ");
            select.append("AND country.country_code = pa.country_code ");
            select.append("AND cpx.payment_id = p.payment_id ");
            select.append("AND c.contract_id = cpx.contract_id ");
            select.append("AND utx.user_id = p.user_id ");
            select.append("AND utx.tax_form_id = tx.tax_form_id ");
            select.append("AND tx.name = '" + W9_TAX_FORM + "' ");
            select.append("AND utx2.user_id = p.user_id ");
            select.append("AND utx2.tax_form_id = tx2.tax_form_id ");
            select.append("AND tx2.name = '" + W8BEN_TAX_FORM + "'");

            rsc = runSelectQuery(c, select.toString(), false);
            log.debug("found " + rsc.size() + " payments to print");

            // Check the print_count and review fields to ensure that we're not printing
            // a payment without review
            int i, rowCount = rsc.getRowCount();
            for (i = 0; i < rowCount; i++) {
                int printCount = TCData.getTCInt(rsc.getRow(i), "print_count", 0, false);
                int review = TCData.getTCInt(rsc.getRow(i), "review", 0, false);
                if (printCount > 0 && review == 0) {
                    long pid = TCData.getTCLong(rsc.getRow(i), "payment_id", 0, false);

                    //Matt 4/13/02 - Removed Carriage Return From The Exception Message
                    //Front End Uses \n as a Token When Displaying Error

                    //throw new PaymentNotReviewedException("Payment " + pid + " has been previously printed.\n" +
                    throw new PaymentNotReviewedException("Payment " + pid + " has been previously printed.  " +
                            "It may not be printed again without being reviewed.");
                }
            }

            StringBuffer payments = new StringBuffer(10000);
            payments.append("!TRNS,TRNSID,TRNSTYPE,DATE,ACCNT,NAME,CLASS,AMOUNT,DOCNUM,MEMO,CLEAR,TOPRINT,DUEDATE\n");
            payments.append("!SPL,SPLID,TRNSTYPE,DATE,ACCNT,NAME,CLASS,AMOUNT,DOCNUM,MEMO,CLEAR,,\n");
            payments.append("!ENDTRNS,,,,,,,,,,,,\n");

            StringBuffer vendors = new StringBuffer(10000);
            vendors.append("!VEND,NAME,PRINTAS,ADDR1,ADDR2,ADDR3,ADDR4,ADDR5,VTYPE,CONT1,EMAIL,SALUTATION,FIRSTNAME,MIDINIT,LASTNAME\n");

            HashSet codersPrinted = new HashSet();

            // Get current date string
            GregorianCalendar g = new GregorianCalendar();
            String currentDate = g.get(Calendar.MONTH) + "/" + g.get(Calendar.DAY_OF_MONTH) + "/" +
                    g.get(Calendar.YEAR);

            for (i = 0; i < rowCount; i++) {
                log.debug("printing payment index " + i);
                // Build fields requiring manipulations
                // Coder name and middle initial
                StringBuffer name = new StringBuffer(100);
                String firstName = rsc.getItem(i, "first_name").toString();
                String middleName = rsc.getItem(i, "middle_name").toString();
                String middleInitial = "";
                String lastName = rsc.getItem(i, "last_name").toString();
                name.append(firstName);
                if (middleName.length() > 0) {
                    name.append(" " + middleName.charAt(0));
                    middleInitial = "" + middleName.charAt(0);
                }

                if (lastName.length() > 0)
                    name.append(" " + lastName);
                String coderName = name.toString();

                // Third address line
                String city = rsc.getItem(i, "city").toString();
                String state_code = rsc.getItem(i, "state_code").toString();
                String zip = rsc.getItem(i, "zip").toString();
                StringBuffer address = new StringBuffer();
                address.append(city);
                if (state_code.length() > 0)
                    address.append(", " + state_code);
                if (zip.length() > 0)
                    address.append("  " + zip);
                String cityLine = address.toString();

                // Payments, formatted to two decimal places
                double gross = Double.parseDouble(rsc.getItem(i, "gross_amount").toString());
                double net = Double.parseDouble(rsc.getItem(i, "net_amount").toString());
                DecimalFormat df = new DecimalFormat("0.00");
                String grossPay = df.format(gross);
                String netPayDeduct = df.format(-net);
                String withholdDeduct = df.format(net - gross);

                // Vendor type
                String vendorType = "";
                if (rsc.getItem(i, "w9_tax_form").getResultData() != null)
                    vendorType = CONTRACTOR_1099;
                else if (rsc.getItem(i, "w8ben_tax_form").getResultData() != null)
                    vendorType = CONTRACTOR_1042S;

                // Other miscellaneous elements
                String country = rsc.getItem(i, "country_name").toString();
                int paymentType = Integer.parseInt(rsc.getItem(i, "payment_type_id").toString());
                long paymentId = Long.parseLong(rsc.getItem(i, "payment_id").toString());
                String paymentDesc = rsc.getItem(i, "payment_desc").toString();
                String address1 = rsc.getItem(i, "address1").toString();
                String address2 = rsc.getItem(i, "address2").toString();
                String email = rsc.getItem(i, "email").toString();
                String userId = rsc.getItem(i, "user_id").toString();
                String dueDate = rsc.getItem(i, "date_due").toString().equals("00/00/0000") ? currentDate : rsc.getItem(i, "date_due").toString();
                vendors.append("!VEND,NAME,PRINTAS,ADDR1,ADDR2,ADDR3,ADDR4,ADDR5,VTYPE,CONT1,EMAIL,SALUTATION,FIRSTNAME,MIDINIT,LASTNAME\n");
                // Add the vendor line if necessary
                if (!codersPrinted.contains(userId)) {
                    codersPrinted.add(userId);
                    vendors.append("VEND," + shroud(coderName) + "," + shroud(coderName) + ",");
                    vendors.append(shroud(coderName) + "," + shroud(address1) + "," + shroud(address2) + "," + shroud(cityLine));
                    vendors.append("," + shroud(country) + "," + vendorType + "," + shroud(coderName) + ",");
                    vendors.append(shroud(email) + ",," + shroud(firstName) + "," + shroud(middleInitial));
                    vendors.append("," + shroud(lastName) + "\n");
                }

                String creditAccount = "";
                if (paymentType == CONTEST_PAYMENT) {
                    creditAccount = CONTEST_ACCOUNT;
                } else if (paymentType == CONTRACT_PAYMENT) {
                    int contractType = TCData.getTCInt(rsc.getRow(i), "contract_type_id", -1, false);
                    if (contractType == MAINTENANCE_CONTRACT)
                        creditAccount = MAINTENANCE_ACCOUNT;
                    else
                        creditAccount = CONTRACTOR_ACCOUNT;
                } else if (paymentType == PROBLEM_PAYMENT) {
                    creditAccount = PROBLEM_WRITER_TESTER_ACCOUNT;
                } else if (paymentType == CODER_REFERRAL_PAYMENT) {
                    creditAccount = CODER_REFERRAL_ACCOUNT;
                }

                // First line
                payments.append("TRNS,,BILL," + currentDate + "," + PAYABLE_ACCOUNT);
                payments.append("," + shroud(coderName) + ",," + netPayDeduct + "," + paymentId + ",");
                payments.append(shroud(paymentDesc) + ",N,Y," + dueDate + "\n");

                // Second line
                payments.append("SPL,,BILL," + currentDate + "," + creditAccount + ",,," + grossPay);
                payments.append(",," + shroud(paymentDesc) + ",,,\n");

                // Third line, if applicable
                if (gross != net) {
                    payments.append("SPL,,BILL," + currentDate + "," + WITHHOLDING_ACCOUNT);
                    payments.append(",,," + withholdDeduct + ",," + shroud(paymentDesc) + ",,,\n");
                }

                // Last line
                payments.append("ENDTRNS,,,,,,,,,,,,\n");
            }

            /*
            // Save the payment and vendor "files" via JNDI
            Context con = TCContext.getInitial();
            con.rebind(JNDI_PAYMENT_FILE_NAME, payments.toString());
            con.rebind(JNDI_VENDOR_FILE_NAME, vendors.toString());
            */

            String rv[] = new String[2];
            rv[0] = payments.toString();
            rv[1] = vendors.toString();

            // Log the stuff in case there are problems
            log.info("Payments printed.  Payment file:\n" + payments + "-----\nVendor file:\n" + vendors
                    + "-----\n");

            // Update print_count and review in payment headers
            StringBuffer updateHeaders = new StringBuffer(300);
            updateHeaders.append("UPDATE payment SET print_count = NVL(print_count + 1, 1) ");
            updateHeaders.append(" ,review = 0 ");
            updateHeaders.append("WHERE most_recent_detail_id IN ");
            updateHeaders.append(" (SELECT payment_detail_id FROM payment_detail ");
            updateHeaders.append("  WHERE status_id = " + READY_TO_PRINT_STATUS + ")");

            ps = c.prepareStatement(updateHeaders.toString());
            ps.executeUpdate();
            ps.close();
            ps = null;

            // Update date_paid and status in payment detail records
            StringBuffer updateDetails = new StringBuffer(300);
            updateDetails.append("UPDATE payment_detail SET date_paid = ?, ");
            updateDetails.append("status_id = " + PAID_STATUS + " ");
            updateDetails.append("WHERE status_id = " + READY_TO_PRINT_STATUS + " ");
            updateDetails.append("AND payment_detail_id IN ");
            updateDetails.append(" (SELECT most_recent_detail_id FROM payment) ");

            ps = c.prepareStatement(updateDetails.toString());
            ps.setTimestamp(1, new Timestamp(System.currentTimeMillis()));
            ps.executeUpdate();

            c.commit();
            c.setAutoCommit(true);
            c.close();
            c = null;

            return rv;
        } catch (Exception e) {
            printException(e);
            try {
                if (ps != null) ps.close();
            } catch (Exception e1) {
                printException(e1);
            }
            ps = null;
            try {
                c.rollback();
            } catch (Exception e1) {
                printException(e1);
            }
            try {
                c.setAutoCommit(true);
            } catch (Exception e1) {
                printException(e1);
            }
            try {
                if (c != null) c.close();
            } catch (Exception e1) {
                printException(e1);
            }
            c = null;
            if (e instanceof PaymentNotReviewedException)
                throw (PaymentNotReviewedException) e;
            throw new SQLException(e.getMessage());
        }
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
    public int generateRoundPayments(long roundId, int affidavitTypeId, boolean makeChanges)
            throws IllegalUpdateException, SQLException {
        log.debug("generateRoundPayments called...");
        int i;
        Connection c = null;

        try {
            c = DBMS.getConnection();
            if (makeChanges) {
                c.setAutoCommit(false);
            }
            setLockTimeout(c);

            // Get list of users with taxforms
            StringBuffer getUsers = new StringBuffer(300);
            getUsers.append(" SELECT u.user_id FROM user u, user_tax_form_xref utfx ")
                    .append(" , room_result rr where u.user_id = utfx.user_id and u.user_id = rr.coder_id ")
                    .append(" and utfx.user_id = rr.coder_id and rr.round_id = " + roundId);
            ResultSetContainer rscUser = runSelectQuery(c, getUsers.toString(), false);
            HashSet userTaxFormSet = new HashSet();
            for (i = 0; i < rscUser.getRowCount(); i++) {
                userTaxFormSet.add(new Long(rscUser.getItem(i, 0).toString()));
            }

            // Make sure we haven't done this before for this round.
            StringBuffer checkNew = new StringBuffer(300);
            checkNew.append("SELECT COUNT(*) FROM affidavit WHERE round_id = " + roundId);
            ResultSetContainer rsc = runSelectQuery(c, checkNew.toString(), false);
            int existingAffidavits = Integer.parseInt(rsc.getItem(0, 0).toString());
            if (existingAffidavits > 0) {
                throw new IllegalUpdateException("Data already generated for round " + roundId + "!");
            }

            // Make sure the round exists; in the process, get the name and due date.
            StringBuffer checkExists = new StringBuffer(300);
            checkExists.append("SELECT con.name, r.name, ");
            checkExists.append("con.end_date + " + DUE_DATE_INTERVAL + " UNITS DAY AS due_date ");
            checkExists.append("FROM round r, contest con ");
            checkExists.append("WHERE r.round_id = " + roundId + " ");
            checkExists.append("AND con.contest_id = r.contest_id");
            rsc = runSelectQuery(c, checkExists.toString(), false);
            if (rsc.getRowCount() != 1) {
                throw new IllegalUpdateException("Round " + roundId + " does not exist or is not unique");
            }
            String roundName = rsc.getItem(0, 0).toString() + " " + rsc.getItem(0, 1).toString();
            String dueDate = TCData.getTCDate(rsc.getRow(0), "due_date", null, true);

            StringBuffer getWinners = new StringBuffer(300);
            getWinners.append("SELECT rr.room_id, rr.coder_id, rr.room_placed, rp.paid, a.country_code ");
            getWinners.append("FROM room_result rr, user u, user_address_xref x, address a, round_payment rp ");
            getWinners.append("WHERE rr.round_id = " + roundId + " ");
            getWinners.append("AND rp.paid > 0 ");
            getWinners.append("AND rr.coder_id = u.user_id ");
            getWinners.append("and u.user_id = x.user_id ");
            getWinners.append("and x.address_id = a.address_id ");
            getWinners.append("and a.address_type_id = 2 ");
            getWinners.append("AND rr.coder_id = rp.coder_id ");
            getWinners.append("AND rr.round_id = rp.round_id ");
            getWinners.append("AND rp.payment_type_id = " + CONTEST_PAYMENT);
            getWinners.append(" ORDER BY rr.room_id, rr.room_placed");
            ResultSetContainer winners = runSelectQuery(c, getWinners.toString(), false);
            int numWinners = winners.getRowCount();

            StringBuffer getAffidavitTexts = new StringBuffer(300);
            getAffidavitTexts.append("SELECT x.country_code, att.text ");
            getAffidavitTexts.append("FROM affidavit_template att, country_affidavit_template_xref x ");
            getAffidavitTexts.append("WHERE att.affidavit_type_id = " + affidavitTypeId);
            getAffidavitTexts.append(" and att.affidavit_template_id =x.affidavit_template_id ");
            ResultSetContainer texts = runSelectQuery(c, getAffidavitTexts.toString(), false);
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
                p.setStatusId(userTaxFormSet.contains(new Long(userId)) ? PAYMENT_PENDING_STATUS : PAYMENT_ON_HOLD_STATUS);
                p.getHeader().setDescription(roundName + " winnings");
                p.getHeader().setTypeId(CONTEST_PAYMENT);
                p.setDueDate(dueDate);
                p.getHeader().getUser().setId(userId);

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
                    pairAdd.append("Payment status ID: " + p.getStatusId() + "\n");
                    pairAdd.append("Payment description: " + p.getHeader().getDescription() + "\n");
                    pairAdd.append("Payment type ID: " + p.getHeader().getTypeId() + "\n");
                    pairAdd.append("Payment due date: " + p.getDueDate() + "\n");
                    pairAdd.append("Payment user ID: " + p.getHeader().getUser().getId() + "\n");
                    ResultSetContainer referRsc = getReferrer(c, p.getHeader().getUser().getId());
                    pairAdd.append("Added referral payment: " + (referRsc.getRowCount() == 1 ? "yes" : "no") + "\n");
                    pairAdd.append("----------------------------------");
                    log.info(pairAdd.toString());
                }
            }

            if (makeChanges) {
                c.commit();
                c.setAutoCommit(true);
            }
            c.close();
            c = null;

            return numWinners;

        } catch (Exception e) {
            printException(e);
            if (makeChanges) {
                try {
                    c.rollback();
                } catch (Exception e1) {
                    printException(e1);
                }
                try {
                    c.setAutoCommit(true);
                } catch (Exception e1) {
                    printException(e1);
                }
            }
            try {
                if (c != null) c.close();
            } catch (Exception e1) {
                printException(e1);
            }
            c = null;
            if (e instanceof IllegalUpdateException)
                throw (IllegalUpdateException) e;
            throw new SQLException(e.getMessage());
        }
    }

    public int generateRoundPayments(long roundId, boolean makeChanges)
            throws IllegalUpdateException, SQLException {
        return generateRoundPayments(roundId, CONTEST_WINNING_AFFIDAVIT, makeChanges);
    }


    /**
     * Generates all the payments for the people who won money for the given project (designers, developers,
     * and review board members). Returns the number of payments generated.
     *
     * @param projectId   The ID of the project
     * @param status      The project's status (see /topcoder/apps/review/projecttracker/ProjectStatus.java)
     * @param client      The project's client (optional)
     * @param makeChanges If true, updates the database; if false, logs
     *                    the changes that would have been made had this parameter been true.
     * @return The number of component payments generated, followed by the number of review board payments generated.
     * @throws IllegalUpdateException If the affidavit/payment information
     *                                has already been generated for this round.
     * @throws SQLException           If there was some error updating the data.
     */
    public int[] generateComponentPayments(long projectId, long status, String client, boolean makeChanges)
            throws IllegalUpdateException, SQLException {
        log.debug("generateComponentPayments called...");
        int i;
        Connection c = null;

        try {
            c = DBMS.getConnection();
            if (makeChanges) {
                c.setAutoCommit(false);
            }
            setLockTimeout(c);

            // Get list of users with taxforms
            StringBuffer getUsers = new StringBuffer(300);
            getUsers.append(" SELECT u.user_id FROM user u, user_tax_form_xref utfx ")
                    .append(" , tcs_catalog:project_result pr where u.user_id = utfx.user_id and u.user_id = pr.user_id ")
                    .append(" and utfx.user_id = pr.user_id and pr.project_id = " + projectId);
            ResultSetContainer rscUser = runSelectQuery(c, getUsers.toString(), false);
            HashSet userTaxFormSet = new HashSet();
            for (i = 0; i < rscUser.getRowCount(); i++) {
                userTaxFormSet.add(new Long(rscUser.getItem(i, 0).toString()));
            }

            // Make sure we haven't done this before for this project.
            StringBuffer checkNew = new StringBuffer(300);
            checkNew.append("SELECT COUNT(*) FROM payment_detail pd, payment_type_lu pt WHERE pd.project_id = " + projectId)
                    .append(" AND pd.payment_type_id = pt.payment_type_id ")
                    .append(" AND pt.payment_type_desc IN ('Component Payment', 'Review Board Payment')");
            ResultSetContainer rsc = runSelectQuery(c, checkNew.toString(), false);
            int existingAffidavits = Integer.parseInt(rsc.getItem(0, 0).toString());
            if (existingAffidavits > 0) {
                throw new IllegalUpdateException("Data already generated for project " + projectId + "!");
            }

            // Make sure the project exists; in the process, get the name and due date.
            StringBuffer checkExists = new StringBuffer(300);
            checkExists.append("SELECT cc.component_name, p.complete_date + " + COMPONENT_DUE_DATE_INTERVAL + " UNITS DAY AS due_date ");
            checkExists.append("FROM tcs_catalog:project p, tcs_catalog:comp_versions cv, tcs_catalog:comp_catalog cc ");
            checkExists.append("WHERE p.comp_vers_id = cv.comp_vers_id ");
            checkExists.append("AND cv.component_id = cc.component_id ");
            checkExists.append("AND p.project_id = " + projectId + " ");
            checkExists.append("AND p.cur_version = 1");
            rsc = runSelectQuery(c, checkExists.toString(), false);
            if (rsc.getRowCount() != 1) {
                throw new IllegalUpdateException("Project " + projectId + " does not exist or is not unique");
            }
            String componentName = rsc.getItem(0, 0).toString();
            String dueDate = TCData.getTCDate(rsc.getRow(0), "due_date", null, true);

            int[] numWinners = new int[2];
            ResultSetContainer[] winners = new ResultSetContainer[2];

            // Get winning designers/developers to be paid
            if (status == ProjectStatus.ID_COMPLETED) {
                StringBuffer getWinners = new StringBuffer(300);
                getWinners.append("select pr.placed, pr.user_id, payment as paid, pt.project_type_name, pr.old_reliability as reliability ");
                getWinners.append("from tcs_catalog:project_result pr, tcs_catalog:project p, tcs_catalog:project_type pt ");
                getWinners.append("where pr.project_id = " + projectId + " ");
                getWinners.append("and pr.project_id = p.project_id ");
                getWinners.append("and p.project_type_id = pt.project_type_id ");
                getWinners.append("and p.cur_version = 1 ");
                getWinners.append("and pr.placed IN (1,2) ");
                getWinners.append("and pr.payment > 0 ");
                getWinners.append("order by pr.placed");
                winners[0] = runSelectQuery(c, getWinners.toString(), false);
                numWinners[0] = winners[0].getRowCount();
            }

            // Get review board members to be paid
            StringBuffer getReviewers = new StringBuffer(300);
            getReviewers.append("select ur.login_id as user_id, sum(pi.payment) as paid, pt.project_type_name ");
            getReviewers.append("from tcs_catalog:payment_info pi, tcs_catalog:payment_status ps, tcs_catalog:r_user_role ur, ");
            getReviewers.append("tcs_catalog:project p, tcs_catalog:project_type pt, tcs_catalog:review_role rr ");
            getReviewers.append("where ur.project_id = " + projectId + " ");
            getReviewers.append("and ur.project_id = p.project_id ");
            getReviewers.append("and p.project_type_id = pt.project_type_id ");
            getReviewers.append("and p.cur_version = 1 ");
            getReviewers.append("and pi.payment_info_id = ur.payment_info_id ");
            getReviewers.append("and ur.r_role_id = rr.review_role_id ");
            getReviewers.append("and rr.review_role_id IN (2,3,4,5) ");
            getReviewers.append("and pi.payment_stat_id = ps.payment_stat_id ");
            getReviewers.append("and ps.payment_stat_id = 2 ");
            getReviewers.append("and pi.cur_version = 1 ");
            getReviewers.append("and ur.cur_version = 1 ");
            getReviewers.append("group by login_id, pt.project_type_name");
            winners[1] = runSelectQuery(c, getReviewers.toString(), false);
            numWinners[1] = winners[1].getRowCount();

            // Identify component categories            
            String category = "";
            StringBuffer getCategories = new StringBuffer(300);
            getCategories.append("select p.project_id, cat.category_name, cv.version_text ");
            getCategories.append("from tcs_catalog:comp_catalog cc, tcs_catalog:project p, ");
            getCategories.append("tcs_catalog:categories cat, tcs_catalog:comp_versions cv ");
            getCategories.append("where p.comp_vers_id = cv.comp_vers_id ");
            getCategories.append("and cv.component_id = cc.component_id ");
            getCategories.append("and p.project_id = " + projectId + " ");
            getCategories.append("and p.cur_version = 1 ");
            getCategories.append("and cc.root_category_id = cat.category_id ");
            getCategories.append("and cat.parent_category_id is null");
            ResultSetContainer categoryRsc = runSelectQuery(c, getCategories.toString(), false);
            category = "(" + categoryRsc.getItem(0, 1).toString() + ", v" +
                    categoryRsc.getItem(0, 2).toString().trim() + ")";

            for (int j = 0; j < numWinners.length; j++) {
                for (i = 0; i < numWinners[j]; i++) {
                    long userId = Long.parseLong(winners[j].getItem(i, "user_id").toString());

                    Payment p = new Payment();
                    p.setGrossAmount(TCData.getTCDouble(winners[j].getRow(i), "paid"));
                    p.setStatusId(userTaxFormSet.contains(new Long(userId)) ? PAYMENT_OWED_STATUS : PAYMENT_ON_HOLD_STATUS);
                    if (j == 0) {
                        double reliability = TCData.getTCDouble(winners[j].getRow(i), "reliability");
                        p.setGrossAmount(getReliabilityPayment(p.getGrossAmount(), reliability));
                        String projectType = winners[j].getItem(i, 3).toString();
                        String placed = winners[j].getItem(i, 0).toString();
                        if (placed.equals("1")) {
                            placed = "1st place";
                        } else if (placed.equals("2")) {
                            placed = "2nd place";
                        }
                        String description = category + " " + componentName + " winnings - " + projectType + ", " + placed;
                        p.getHeader().setDescription(description);
                        p.getHeader().setTypeId(COMPONENT_PAYMENT);
                    } else if (j == 1) {
                        String projectType = winners[j].getItem(i, 2).toString();
                        String description = category + " " + componentName + " - " + projectType + " review board";
                        p.getHeader().setDescription(description);
                        p.getHeader().setTypeId(REVIEW_BOARD_PAYMENT);
                    }
                    p.setDueDate(dueDate);
                    p.getHeader().getUser().setId(userId);
                    p.getHeader().setProjectId(projectId);
                    p.getHeader().setClient(client);

                    if (makeChanges) {
                        makeNewPayment(c, p, false);
                    } else {
                        StringBuffer paymentAdd = new StringBuffer(300);
                        paymentAdd.append("Payment gross amount: " + p.getGrossAmount() + "\n");
                        paymentAdd.append("Payment status ID: " + p.getStatusId() + "\n");
                        paymentAdd.append("Payment description: " + p.getHeader().getDescription() + "\n");
                        paymentAdd.append("Payment type ID: " + p.getHeader().getTypeId() + "\n");
                        paymentAdd.append("Payment due date: " + p.getDueDate() + "\n");
                        paymentAdd.append("Payment user ID: " + p.getHeader().getUser().getId() + "\n");
                        ResultSetContainer referRsc = getReferrer(c, p.getHeader().getUser().getId());
                        paymentAdd.append("Added referral payment: " + (referRsc.getRowCount() == 1 ? "yes" : "no") + "\n");
                        paymentAdd.append("----------------------------------");
                        log.info(paymentAdd.toString());
                    }
                }
            }

            if (makeChanges) {
                c.commit();
                c.setAutoCommit(true);
            }
            c.close();
            c = null;

            return numWinners;

        } catch (Exception e) {
            printException(e);
            if (makeChanges) {
                try {
                    c.rollback();
                } catch (Exception e1) {
                    printException(e1);
                }
                try {
                    c.setAutoCommit(true);
                } catch (Exception e1) {
                    printException(e1);
                }
            }
            try {
                if (c != null) c.close();
            } catch (Exception e1) {
                printException(e1);
            }
            c = null;
            if (e instanceof IllegalUpdateException)
                throw (IllegalUpdateException) e;
            throw new SQLException(e.getMessage());
        }
    }


    /**
     * Helper function that calculates the component payment given the base payment and winner's reliability.
     *
     * @return The payment for the winning component designer or developer.
     */
    private double getReliabilityPayment(double payment, double reliability) {
        double bonus = 0;
        if (reliability >= .95) {
            bonus = .2;
        } else if (reliability >= .9) {
            bonus = .15;
        } else if (reliability >= .8) {
            bonus = .1;
        }
        return payment * (1 + bonus);
    }


    /**
     * Sets the status on all contest payments with Pending or On Hold status older than a specified time
     * to Expired. The time limit is specified in <tt>PactsConstants.java</tt>
     * and is currently set to 60 days.
     *
     * @return The number of affidavit/payment pairs thus affected.
     * @throws SQLException If there was some error updating the data.
     */
    public int expireOldPayments() throws SQLException {
        Connection c = null;

        try {
            c = DBMS.getConnection();
            c.setAutoCommit(false);
            setLockTimeout(c);

            StringBuffer updatePayments = new StringBuffer(300);
            updatePayments.append("update payment_detail ");
            updatePayments.append("set status_id = " + PAYMENT_EXPIRED_STATUS + " ");
            updatePayments.append("where payment_type_id = " + CONTEST_PAYMENT + " and status_id IN (" +
                    PAYMENT_ON_HOLD_STATUS + "," + PAYMENT_PENDING_STATUS + ") ");
            updatePayments.append("and today - " + PAYMENT_EXPIRE_TIME + " units day > date_due");
            int rowsUpdated = runUpdateQuery(c, updatePayments.toString(), false);

            c.commit();
            c.setAutoCommit(true);
            c.close();
            c = null;
            return rowsUpdated;
        } catch (Exception e) {
            printException(e);
            try {
                c.rollback();
            } catch (Exception e1) {
                printException(e1);
            }
            try {
                c.setAutoCommit(true);
            } catch (Exception e1) {
                printException(e1);
            }
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
            c = DBMS.getConnection();
            c.setAutoCommit(false);
            setLockTimeout(c);

            StringBuffer getPayments = new StringBuffer(300);
            getPayments.append("SELECT payment_id FROM affidavit ");
            getPayments.append("WHERE affidavit_type_id = " + CONTEST_WINNING_AFFIDAVIT + " ");
            getPayments.append("AND date_created + " + AFFIDAVIT_EXPIRE_TIME + " UNITS DAY < TODAY ");
            getPayments.append("AND status_id = " + AFFIDAVIT_PENDING_STATUS + " ");
            getPayments.append("AND payment_id IS NOT NULL");
            ResultSetContainer payments = runSelectQuery(c, getPayments.toString(), false);

            StringBuffer updateAffidavits = new StringBuffer(300);
            updateAffidavits.append("UPDATE affidavit SET status_id = " + AFFIDAVIT_EXPIRED_STATUS);
            updateAffidavits.append(" WHERE affidavit_type_id = " + CONTEST_WINNING_AFFIDAVIT);
            updateAffidavits.append(" AND date_created + " + AFFIDAVIT_EXPIRE_TIME + " UNITS DAY < TODAY");
            updateAffidavits.append(" AND status_id = " + AFFIDAVIT_PENDING_STATUS);
            int rowsUpdated = runUpdateQuery(c, updateAffidavits.toString(), false);

            int i, rowCount = payments.getRowCount();
            long j[] = new long[1];
            for (i = 0; i < rowCount; i++) {
                try {
                    j[0] = Integer.parseInt(payments.getItem(i, 0).toString());
                    log.debug("updating payment id " + j[0]);
                    updatePaymentStatus(c, j, PAYMENT_CANCELED_STATUS);
                } catch (PaymentPaidException e) {
                    log.warn("Payment ID " + j[0] + " would have been canceled due to expired affidavit\n" +
                            "but has already been paid");
                }
            }

            c.commit();
            c.setAutoCommit(true);
            c.close();
            c = null;
            return rowsUpdated;
        } catch (Exception e) {
            printException(e);
            try {
                c.rollback();
            } catch (Exception e1) {
                printException(e1);
            }
            try {
                c.setAutoCommit(true);
            } catch (Exception e1) {
                printException(e1);
            }
            try {
                if (c != null) c.close();
            } catch (Exception e1) {
                printException(e1);
            }
            c = null;
            throw new SQLException(e.getMessage());
        }
    }


    public void createAffidavitTemplate(int affidavitTypeId, String text) throws SQLException {

        Connection conn = null;
        PreparedStatement ps = null;

        try {

            conn = DBMS.getConnection();

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
                throw(new EJBException("Wrong number of rows updated in 'useaffidavit_tempater'. " +
                        "Updated " + rc + ", should have updated 1."));
            }
        } catch (IDGenerationException e) {
            throw new EJBException(e);
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw(new EJBException(e.getMessage()));
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
            ResultSetContainer rsc = runSelectQuery(conn, query.toString(), false);

            if (rsc.isEmpty()) {
                throw new EJBException("could not find user information for user " + userId);
            } else {
                Payment ret = new Payment();
                ret.setAddress1(rsc.getStringItem(0, "address1"));
                ret.setAddress2(rsc.getStringItem(0, "address2"));
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
            throw(new EJBException(e.getMessage()));
        } finally {
            close(ps);
            close(conn);
        }
    }

}

