package com.topcoder.web.tc.controller.legacy.pacts.bean;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.rmi.RemoteException;
import java.sql.SQLException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.naming.InitialContext;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.DeleteAffirmedAssignmentDocumentException;
import com.topcoder.web.ejb.pacts.PactsServices;
import com.topcoder.web.ejb.pacts.PactsServicesBean;
import com.topcoder.web.ejb.pacts.PactsServicesLocal;
import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocument;
import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocumentTemplate;
import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocumentType;
import com.topcoder.web.ejb.pacts.payments.BasePaymentStatus;
import com.topcoder.web.ejb.pacts.payments.EventFailureException;
import com.topcoder.web.ejb.pacts.payments.InvalidStatusException;
import com.topcoder.web.tc.controller.legacy.pacts.bean.pacts_client.dispatch.AffidavitBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.Affidavit;
import com.topcoder.web.tc.controller.legacy.pacts.common.AffidavitWithText;
import com.topcoder.web.tc.controller.legacy.pacts.common.Contract;
import com.topcoder.web.tc.controller.legacy.pacts.common.IllegalUpdateException;
import com.topcoder.web.tc.controller.legacy.pacts.common.InvalidSearchInputException;
import com.topcoder.web.tc.controller.legacy.pacts.common.NoObjectFoundException;
import com.topcoder.web.tc.controller.legacy.pacts.common.Note;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;
import com.topcoder.web.tc.controller.legacy.pacts.common.TaxForm;
import com.topcoder.web.tc.controller.legacy.pacts.common.UnsupportedSearchException;

/**
 * This class receives incoming requests from the dispatch beans
 * and passes them on to the EJB. <p>
 * <p/>
 * Each data retrieval function in this class returns a Map in
 * which each key is an object description in <tt>PactsConstants.java</tt>
 * and each value is a <tt>ResultSetContainer</tt> object with the
 * data promised by the object description.  With this scheme, the
 * content of data coming back is clearly identified.  Additionally,
 * function prototypes do not have to change if, for example, it is
 * subsequently desired to have a particular function return two
 * <tt>ResultSetContainer</tt> objects instead of one. <p>
 * <p/>
 * Each search function in this class takes in a Map of search criteria,
 * in which each key is a criterion description in <tt>PactsConstants.java</tt>
 * and each value is a <tt>String</tt> corresponding to the desired value
 * that search results will have for this criterion.  It is expected that
 * validation checks have already been performed on the search criteria values.
 * The search routines will throw exceptions if any criterion is invalid or not
 * applicable to the particular search.  For convenience, an input validator is
 * provided here that checks integer, decimal, date, and boolean input. <p>
 * <p/>
 * For all update functions, it is assumed that the user has authority
 * to execute the update in question. <p>
 * <p/>
 * The database access routines in this class throw an <tt>SQLException</tt>
 * if there is some problem executing their associated database queries.
 *
 * <p>
 * Version 1.1 (Online Review Payments and Status Automation Assembly 1.0) Changes Notes:
 * <ol>
 * <li>a new parameter is added for the three generateComponentPayments methods to populate the related resource
 *     ids for generated component payments.</li>
 * <li>a new method {@link #addOnlineReviewPayments(List, List)} is added for adding payments in persistence and
 *     populating the payment statuses for the given resource ids.</li>
 * </ol>
 * </p>
 *
 * @author Dave Pecora, FireIce
 * @version 1.1
 * @see ResultSetContainer
 * @see PactsServicesBean
 * @see PactsConstants
 */

public class DataInterfaceBean implements PactsConstants {

    private static final Logger log = Logger.getLogger(DataInterfaceBean.class);

    // Get handle to the EJB.  All miscellaneous exceptions that can be
    // thrown by the various calls herein (CreateException, NamingException,
    // RemoteException) get packaged into a RemoteException for convenience.
    private PactsServicesLocal getEjbHandle() throws RemoteException {
        InitialContext c = null;
        try {
            c = TCContext.getInitial();
            return (PactsServicesLocal) BaseProcessor.createLocalEJB(c, PactsServices.class);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RemoteException(e.getMessage());
        } finally {
            TCContext.close(c);
        }
    }

    // Does the specified object type allow notes?
    private boolean objectTypeHasNotes(int objectType) {
        return (objectType == AFFIDAVIT_OBJ ||
                objectType == CONTRACT_OBJ ||
                objectType == PAYMENT_OBJ ||
                objectType == USER_PROFILE_OBJ ||
                objectType == USER_TAX_FORM_OBJ);
    }

    // Does the specified object type allow text?
    private boolean objectTypeHasText(int objectType) {
        return (objectType == AFFIDAVIT_OBJ ||
                objectType == CONTRACT_OBJ ||
                objectType == TAX_FORM_OBJ ||
                objectType == NOTE_OBJ);
    }

    // Does the specified object type allow text?
    private boolean objectTypeHasUpdatableText(int objectType) {
        return (objectType == CONTRACT_OBJ ||
                objectType == TAX_FORM_OBJ);
    }

    // Does the specified object type exist?
    private boolean objectTypeExists(int objectType) {
        return (objectType == AFFIDAVIT_OBJ ||
                objectType == CONTRACT_OBJ ||
                //objectType == PAYMENT_OBJ ||
                objectType == USER_PROFILE_OBJ ||
                objectType == TAX_FORM_OBJ ||
                objectType == NOTE_OBJ ||
                objectType == USER_TAX_FORM_OBJ);
    }

    /*****************************************************
     * Object retrieval functions
     *****************************************************/

    /**
     * Returns the affidavit specified by the given affidavit ID.  <p>
     *
     * @param affidavitId The ID of the affidavit to retrieve.
     * @return The affidavit data.
     * @throws RemoteException If there is some communication problem with the EJB
     * @throws SQLException    If there is some problem retrieving the data
     */
    public Map getAffidavit(long affidavitId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getAffidavit(affidavitId);
    }

    /**
     * Returns the contract specified by the given contract ID.  <p>
     *
     * @param contractId The ID of the contract to retrieve.
     * @return The contract data.
     * @throws RemoteException If there is some communication problem with the EJB
     * @throws SQLException    If there is some problem retrieving the data
     */
    public Map getContract(long contractId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getContract(contractId);
    }

    /**
     * Returns the note specified by the given note ID.  <p>
     *
     * @param noteId The ID of the note to retrieve.
     * @return The note data.
     * @throws RemoteException If there is some communication problem with the EJB
     * @throws SQLException    If there is some problem retrieving the data
     */
    public Map getNote(long noteId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getNote(noteId);
    }

    /**
     * Returns the payment specified by the given payment ID.  The data returned will consist
     * of the payment header, the most recent payment detail record (with print address, if
     * applicable), and the current coder address information. <p>
     *
     * @param paymentId The ID of the payment to retrieve.
     * @return The payment data.
     * @throws RemoteException If there is some communication problem with the EJB
     * @throws SQLException    If there is some problem retrieving the data
     */
    public Map getPayment(long paymentId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getPayment(paymentId);
    }

    /**
     * Returns the complete audit trail for the payment specified by the given payment ID.
     * Data returned will include the payment header, all payment detail records (with print
     * addresses, if applicable), and the current coder address. <p>
     *
     * @param paymentId The ID of the payment to retrieve.
     * @return The payment audit trail data.
     * @throws RemoteException If there is some communication problem with the EJB
     * @throws SQLException    If there is some problem retrieving the data
     */
    public Map getPaymentAuditTrail(long paymentId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getPaymentAuditTrail(paymentId);
    }

    /**
     * Returns the user profile corresponding to the given user ID.  <p>
     *
     * @param userId The user ID for which to retrieve the user profile.
     * @return The user profile data.
     * @throws RemoteException If there is some communication problem with the EJB
     * @throws SQLException    If there is some problem retrieving the data
     */
    public Map getUserProfile(long userId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getUserProfile(userId);
    }

    /**
     * Returns the user profile header corresponding to the given user ID.  <p>
     *
     * @param userId The user ID for which to retrieve the user profile header.
     * @return The user profile header data.
     * @throws RemoteException If there is some communication problem with the EJB
     * @throws SQLException    If there is some problem retrieving the data
     */
    public Map getUserProfileHeader(long userId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getUserProfileHeader(userId);
    }

    /**
     * Returns the generic tax form specified by the given tax form ID.  <p>
     *
     * @param taxFormId The ID of the generic tax form to retrieve.
     * @return The tax form data.
     * @throws RemoteException If there is some communication problem with the EJB
     * @throws SQLException    If there is some problem retrieving the data
     */
    public Map getTaxForm(long taxFormId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getTaxForm(taxFormId);
    }

    /**
     * Returns the user-specific tax form specified by the given tax form ID.  <p>
     *
     * @param userId    The user ID of the tax form to retrieve.
     * @param taxFormId The tax form ID of the tax form to retrieve.
     * @return The tax form data.
     * @throws RemoteException If there is some communication problem with the EJB
     * @throws SQLException    If there is some problem retrieving the data
     */
    public Map getUserTaxForm(long userId, long taxFormId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getUserTaxForm(userId, taxFormId);
    }

    /*****************************************************
     * Subobject retrieval functions
     *****************************************************/

    /**
     * Returns the list of affidavits for the given user.
     *
     * @param userId The coder ID of the affidavits.
     * @return The affidavit header list.
     * @throws RemoteException If there is some communication problem with the EJB
     * @throws SQLException    If there is some problem retrieving the data
     */
    public Map getUserAffidavitList(long userId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getUserAffidavitList(userId);
    }

    /**
     * Returns the list of contracts for the given user.
     *
     * @param userId The contracted user ID of the contracts.
     * @return The contract header list.
     * @throws RemoteException If there is some communication problem with the EJB
     * @throws SQLException    If there is some problem retrieving the data
     */
    public Map getUserContractList(long userId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getUserContractList(userId);
    }

    /**
     * Returns the list of payments to the given user.
     *
     * @param userId The coder ID of the payments.
     * @return The payment header list.
     * @throws RemoteException If there is some communication problem with the EJB
     * @throws SQLException    If there is some problem retrieving the data
     */
    public Map getUserPaymentList(long userId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getUserPaymentList(userId);
    }

    /**
     * Returns the list of payment details of the given type(s) for the given user.
     *
     * @param userId       The coder ID of the payments.
     * @param paymentTypes The payment type(s) to filter on.
     * @param pendingOnly  True when only pending/owed details should be returned.
     * @return The payment header list.
     * @throws RemoteException If there is some communication problem with the EJB
     * @throws SQLException    If there is some problem retrieving the data
     */
    public Map getUserPaymentDetailsList(long userId, int[] paymentTypes, boolean pendingOnly) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getUserPaymentDetailsList(userId, paymentTypes, pendingOnly);
    }

    /**
     * Returns the list of tax forms for the given user.
     *
     * @param userId The user ID of the tax forms.
     * @return The tax form header list.
     * @throws RemoteException If there is some communication problem with the EJB
     * @throws SQLException    If there is some problem retrieving the data
     */
    public Map getUserTaxFormList(long userId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getUserTaxFormList(userId);
    }

    /**
     * Returns the list of notes associated with the given object,
     * which can be an affidavit, contract, user tax form, payment, or
     * user profile.
     *
     * @param objectId      The ID of the object.
     * @param objectType    The type of the object, as defined in
     *                      <tt>PactsConstants.java</tt>
     * @param taxFormUserId If the object is a tax form, the user ID of
     *                      the tax form.  This parameter is otherwise disregarded.
     * @return The note header list.
     * @throws RemoteException          If there is some communication problem with the EJB
     * @throws IllegalArgumentException if the object type does not exist or does not have notes.
     * @throws SQLException             If there is some problem retrieving the data
     */
    public Map getNoteList(long objectId, int objectType, long taxFormUserId)
            throws RemoteException, SQLException {
        if (!objectTypeHasNotes(objectType))
            throw new IllegalArgumentException("Object type " + objectType +
                    " does not exist or does not have notes");
        PactsServicesLocal ps = getEjbHandle();
        return ps.getNoteList(objectId, objectType, taxFormUserId);
    }

    /**
     * Returns the list of payments associated with the given contract.
     *
     * @param contractId The contract ID of the payments.
     * @return The payment header list.
     * @throws RemoteException If there is some communication problem with the EJB
     * @throws SQLException    If there is some problem retrieving the data
     */
    public Map getContractPaymentList(long contractId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getContractPaymentList(contractId);
    }

    /**
     * Returns the text of an affidavit, contract, note, or tax form.
     *
     * @param objectId   The ID of the object.
     * @param objectType The type of the object, as defined in
     *                   <tt>PactsConstants.java</tt>
     * @return The text associated with the object.
     * @throws RemoteException          If there is some communication problem with the EJB
     * @throws IllegalArgumentException if the object type does not exist or does not have
     *                                  associated text.
     * @throws SQLException             If there is some problem retrieving the data
     */
    public Map getText(long objectId, int objectType) throws RemoteException, SQLException {
        if (!objectTypeHasText(objectType))
            throw new IllegalArgumentException("Object type " + objectType +
                    " does not exist or does not have text");
        PactsServicesLocal ps = getEjbHandle();
        return ps.getText(objectId, objectType);
    }

    /*****************************************************
     * Type listing retrieval functions
     *****************************************************/

    /**
     * Returns the list of all affidavit types.
     *
     * @return The list of affidavit types
     * @throws RemoteException If there is some communication problem with the EJB
     * @throws SQLException    If there is some problem retrieving the data
     */
    public Map getAffidavitTypes() throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getAffidavitTypes();
    }

    /**
     * Returns the list of all assignment document types.
     *
     * @return The list of assignment document types
     * @throws RemoteException If there is some communication problem with the EJB
     * @throws SQLException    If there is some problem retrieving the data
     */
    public List<AssignmentDocumentType> getAssignmentDocumentTypes() throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getAssignmentDocumentTypes();
    }

    /**
     * Returns the requested assignment document.
     *
     * @return The requested assignment document
     * @throws RemoteException If there is some communication problem with the EJB
     */
    public AssignmentDocument getAssignmentDocument(long assignmentDocumentId) throws RemoteException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getAssignmentDocument(assignmentDocumentId);
    }

    /**
     * deletes the provided assignment document
     *
     * @throws RemoteException If there is some communication problem with the EJB
     */
    public void deleteAssignmentDocument(AssignmentDocument ad) throws RemoteException, DeleteAffirmedAssignmentDocumentException {
        PactsServicesLocal ps = getEjbHandle();
        ps.deleteAssignmentDocument(ad);
    }

    /**
     * adds the provided assignment document
     *
     * @return The added assignment document
     * @throws RemoteException If there is some communication problem with the EJB
     */
    public AssignmentDocument addAssignmentDocument(AssignmentDocument ad) throws RemoteException, DeleteAffirmedAssignmentDocumentException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.addAssignmentDocument(ad);
    }

    /**
     * adds the provided assignment document
     *
     * @return The added assignment document
     * @throws RemoteException If there is some communication problem with the EJB
     */
    public AssignmentDocument addAssignmentDocument(AssignmentDocument ad, Long assignmentDocumentTemplateId) throws RemoteException, DeleteAffirmedAssignmentDocumentException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.addAssignmentDocument(ad, assignmentDocumentTemplateId);
    }

    /**
     * Returns the list of all assignment document status.
     *
     * @return The list of assignment document status
     * @throws RemoteException If there is some communication problem with the EJB
     * @throws SQLException    If there is some problem retrieving the data
     */
    public List getAssignmentDocumentStatus() throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getAssignmentDocumentStatus();
    }

    /**
     * Returns the list of all contract types.
     *
     * @return The list of contract types
     * @throws RemoteException If there is some communication problem with the EJB
     * @throws SQLException    If there is some problem retrieving the data
     */
    public Map getContractTypes() throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getContractTypes();
    }

    /**
     * Returns the list of all note types.
     *
     * @return The list of note types
     * @throws RemoteException If there is some communication problem with the EJB
     * @throws SQLException    If there is some problem retrieving the data
     */
    public Map getNoteTypes() throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getNoteTypes();
    }

    /**
     * Returns the list of all payment types.
     *
     * @return The list of payment types
     * @throws RemoteException If there is some communication problem with the EJB
     * @throws SQLException    If there is some problem retrieving the data
     */
    public Map getPaymentTypes() throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getPaymentTypes();
    }

    /**
     * Returns the list of all payment methods.
     *
     * @return The list of payment methods
     * @throws RemoteException If there is some communication problem with the EJB
     * @throws SQLException    If there is some problem retrieving the data
     */
    public Map getPaymentMethods() throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getPaymentMethods();
    }

    /**
     * Returns the list of all project termination status types.
     *
     * @return The list of project termination status types
     * @throws RemoteException If there is some communication problem with the EJB
     * @throws SQLException    If there is some problem retrieving the data
     */
    public Map getProjectTerminationStatusTypes() throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getProjectTerminationStatusTypes();
    }

    /**
     * Returns the list of all payment modification rationales.
     *
     * @return The list of rationales
     * @throws RemoteException If there is some communication problem with the EJB
     * @throws SQLException    If there is some problem retrieving the data
     */
    public Map getModificationRationales() throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getModificationRationales();
    }

    /**
     * Returns the list of all status codes.
     *
     * @return The list of status codes
     * @throws RemoteException If there is some communication problem with the EJB
     * @throws SQLException    If there is some problem retrieving the data
     */
    public Map getStatusCodes() throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getStatusCodes();
    }

    /**
     * Returns the list of all status codes for a given object type.
     *
     * @param objectType The object type
     * @return The list of status codes
     * @throws IllegalArgumentException If the specified object type does
     *                                  not exist.
     * @throws RemoteException          If there is some communication problem with the EJB
     * @throws SQLException             If there is some problem retrieving the data
     */
    public Map getStatusCodes(int objectType) throws RemoteException, SQLException {
        if (!objectTypeExists(objectType))
            throw new IllegalArgumentException("The specified object type " + objectType + " does not exist");
        PactsServicesLocal ps = getEjbHandle();
        return ps.getStatusCodes(objectType);
    }

    /**
     * Returns the list of all user types.
     *
     * @return The list of user types
     * @throws RemoteException If there is some communication problem with the EJB
     * @throws SQLException    If there is some problem retrieving the data
     */
    public Map getUserTypes() throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getUserTypes();
    }

    /**
     * Returns the list of all rounds.
     *
     * @return The list of all rounds
     * @throws RemoteException If there is some communication problem with the EJB
     * @throws SQLException    If there is some problem retrieving the data
     */
    public Map getRounds() throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getRounds();
    }

    /**
     * Returns the demographic data for a given user.
     *
     * @return The demographic data
     * @throws RemoteException If there is some communication problem with the EJB
     * @throws SQLException    If there is some problem retrieving the data
     */
    public Map getDemographicData(long userId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getDemographicData(userId);
    }

    /**
     * Returns the created dates for the given payments.
     *
     * @return The created dates
     * @throws RemoteException If there is some communication problem with the EJB
     * @throws SQLException    If there is some problem retrieving the data
     */
    public Map getCreationDates(long[] paymentIds) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getCreationDates(paymentIds);
    }

    /**
     * Return a Payment creation date, or null if it couldn't be found.
     *
     * @param paymentId Payment to retrieve its creation date
     * @return the Payment creation date, or null if it couldn't be found.
     * @throws RemoteException
     * @throws SQLException
     */
    public Date getCreationDate(long paymentId) throws RemoteException, SQLException {
        Map results = getCreationDates(new long[]{paymentId});
        ResultSetContainer rsc = (ResultSetContainer) results.get(CREATION_DATE_LIST);

        return rsc.getRowCount() > 0 ? rsc.getTimestampItem(0, "date_created") : null;
    }

    /*****************************************************
     * Search functions
     *****************************************************/

    /**
     * Checks to see if the specified string input can be parsed to a
     * valid example of the specified input type.
     *
     * @param input     The input in question.
     * @param inputType Criterion input type as specified in
     *                  <tt>PactsConstants.java</tt>.  Currently integer, decimal,
     *                  boolean, and date inputs can be checked for compliance.
     * @return Whether or not the given input is valid.
     * @throws IllegalArgumentException if the input type is not a valid type.
     */
    public boolean validateInput(String input, int inputType) {
        if (inputType == INTEGER) {
            try {
                new BigInteger(input);
                return true;
            } catch (Exception e) {
                return false;
            }
        } else if (inputType == DECIMAL) {
            try {
                new BigDecimal(input);
                return true;
            } catch (Exception e) {
                return false;
            }
        } else if (inputType == DATE) {
            try {
                // Check that what we have first in the string is a valid date,
                // in the expected format.
                SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_STRING);
                sdf.setLenient(false);
                ParsePosition pp = new ParsePosition(0);
                java.util.Date dt = sdf.parse(input, pp);
                if (dt == null)
                    return false;

                // Passed checks OK
                return true;
            } catch (Exception e) {
                return false;
            }
        } else if (inputType == BOOLEAN) {
            String s = input.toUpperCase();
            return (s.equals("T") || s.equals("TRUE") || s.equals("F") || s.equals("FALSE"));
        } else if (inputType == STRING) {
            return true;
        }

        // Unknown input type!
        throw new IllegalArgumentException("Input type " + inputType + " is unknown");
    }

    /**
     * Finds affidavits that match the specified search criteria.
     *
     * @param searchCriteria The crtieria to search by.
     * @return A list of affidavit headers for the affidavits that satisfy the criteria.
     * @throws RemoteException             If there is some communication problem with the EJB
     * @throws SQLException                If there is some problem retrieving the data
     * @throws UnsupportedSearchException  If attempting to search by a criterion unsupported
     *                                     by the search routine.
     * @throws InvalidSearchInputException If any particular criterion fails validation.
     */
    public Map findAffidavits(Map searchCriteria)
            throws RemoteException, SQLException, UnsupportedSearchException, InvalidSearchInputException {
        HashSet hs = new HashSet();
        Iterator i = searchCriteria.keySet().iterator();
        while (i.hasNext()) {
            String key = (String) i.next();
            String value = (String) searchCriteria.get(key);
            if (hs.contains(key)) {
                throw new InvalidSearchInputException("Key " + key + " specified multiple times");
            }
            hs.add(key);
            boolean inputOk;
            if (key.equals(EARLIEST_CREATION_DATE) ||
                    key.equals(LATEST_CREATION_DATE))
                inputOk = validateInput(value, DATE);
            else if (key.equals(USER_ID) ||
                    key.equals(AFFIDAVIT_ID) ||
                    key.equals(ROUND_ID) ||
                    key.equals(TYPE_CODE))
                inputOk = validateInput(value, INTEGER);
            else if (key.equals(IS_AFFIRMED) ||
                    key.equals(IS_NOTARIZED))
                inputOk = validateInput(value, BOOLEAN);
            else if (key.equals(HANDLE) ||
                    key.equals(STATUS_CODE))
                inputOk = validateInput(value, STRING);
            else
                throw new UnsupportedSearchException("Search by " + key + " not supported");

            if (!inputOk)
                throw new InvalidSearchInputException("Value " + value + " invalid for " + key);
        }
        PactsServicesLocal ps = getEjbHandle();
        return ps.findAffidavits(searchCriteria);
    }

    /**
     * Finds contracts that match the specified search criteria.
     *
     * @param searchCriteria The crtieria to search by.
     * @return A list of contract headers for the contracts that satisfy the criteria.
     * @throws RemoteException             If there is some communication problem with the EJB
     * @throws SQLException                If there is some problem retrieving the data
     * @throws UnsupportedSearchException  If attempting to search by a criterion unsupported
     *                                     by the search routine.
     * @throws InvalidSearchInputException If any particular criterion fails validation.
     */
    public Map findContracts(Map searchCriteria)
            throws RemoteException, SQLException, UnsupportedSearchException, InvalidSearchInputException {
        HashSet hs = new HashSet();
        Iterator i = searchCriteria.keySet().iterator();
        while (i.hasNext()) {
            String key = (String) i.next();
            String value = (String) searchCriteria.get(key);
            if (hs.contains(key)) {
                throw new InvalidSearchInputException("Key " + key + " specified multiple times");
            }
            hs.add(key);
            boolean inputOk;
            if (key.equals(EARLIEST_CREATION_DATE) ||
                    key.equals(LATEST_CREATION_DATE) ||
                    key.equals(EARLIEST_START_DATE) ||
                    key.equals(LATEST_START_DATE) ||
                    key.equals(EARLIEST_END_DATE) ||
                    key.equals(LATEST_END_DATE))
                inputOk = validateInput(value, DATE);
            else if (key.equals(USER_ID) ||
                    key.equals(STATUS_CODE) ||
                    key.equals(CONTRACT_ID) ||
                    key.equals(PAYMENT_ID) ||
                    key.equals(TYPE_CODE))
                inputOk = validateInput(value, INTEGER);
            else if (key.equals(HANDLE) ||
                    key.equals(CONTRACT_NAME))
                inputOk = validateInput(value, STRING);
            else
                throw new UnsupportedSearchException("Search by " + key + " not supported");

            if (!inputOk)
                throw new InvalidSearchInputException("Value " + value + " invalid for " + key);
        }
        PactsServicesLocal ps = getEjbHandle();
        return ps.findContracts(searchCriteria);
    }

    /**
     * Finds objects that a given note is associated with.
     *
     * @param noteId The note ID for which to find associated objects.
     * @return A list of headers for the objects that are associated with the given note.
     * @throws RemoteException If there is some communication problem with the EJB
     * @throws SQLException    If there is some problem retrieving the data
     */
    public Map findNoteObjects(long noteId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.findNoteObjects(noteId);
    }

    /**
     * Finds notes that match the specified search criteria.
     *
     * @param searchCriteria The crtieria to search by.
     * @return A list of note headers for the notes that
     *         satisfy the criteria.
     * @throws RemoteException             If there is some communication problem with the EJB
     * @throws SQLException                If there is some problem retrieving the data
     * @throws UnsupportedSearchException  If attempting to search by a criterion unsupported
     *                                     by the search routine.
     * @throws InvalidSearchInputException If any particular criterion fails validation.
     */
    public Map findNotes(Map searchCriteria)
            throws RemoteException, SQLException, UnsupportedSearchException, InvalidSearchInputException {
        HashSet hs = new HashSet();
        Iterator i = searchCriteria.keySet().iterator();
        while (i.hasNext()) {
            String key = (String) i.next();
            String value = (String) searchCriteria.get(key);
            if (hs.contains(key)) {
                throw new InvalidSearchInputException("Key " + key + " specified multiple times");
            }
            hs.add(key);
            boolean inputOk;
            if (key.equals(EARLIEST_CREATION_DATE) ||
                    key.equals(LATEST_CREATION_DATE))
                inputOk = validateInput(value, DATE);
            else if (key.equals(CONTRACT_ID) ||
                    key.equals(AFFIDAVIT_ID) ||
                    key.equals(NOTE_ID) ||
                    key.equals(USER_ID) ||
                    key.equals(SUBMITTING_USER_ID) ||
                    key.equals(PAYMENT_ID) ||
                    key.equals(TYPE_CODE) ||
                    key.equals(TAX_FORM_USER_ID) ||
                    key.equals(TAX_FORM_ID))
                inputOk = validateInput(value, INTEGER);
            else if (key.equals(HANDLE) ||
                    key.equals(SUBMITTING_HANDLE) ||
                    key.equals(IN_DEPTH_HANDLE))
                inputOk = validateInput(value, STRING);
            else
                throw new UnsupportedSearchException("Search by " + key + " not supported");

            if (!inputOk)
                throw new InvalidSearchInputException("Value " + value + " invalid for " + key);
        }
        PactsServicesLocal ps = getEjbHandle();
        return ps.findNotes(searchCriteria);
    }

    /**
     * Finds payments that match the specified search criteria.
     *
     * @param searchCriteria The crtieria to search by.
     * @return A list of payment headers for the payments that
     *         satisfy the criteria.
     * @throws RemoteException             If there is some communication problem with the EJB
     * @throws SQLException                If there is some problem retrieving the data
     * @throws UnsupportedSearchException  If attempting to search by a criterion unsupported
     *                                     by the search routine.
     * @throws InvalidSearchInputException If any particular criterion fails validation.
     */
    public Map findPayments(Map searchCriteria)
            throws RemoteException, SQLException, UnsupportedSearchException, InvalidSearchInputException {
        HashSet hs = new HashSet();
        Iterator i = searchCriteria.keySet().iterator();
        while (i.hasNext()) {
            String key = (String) i.next();
            String value = (String) searchCriteria.get(key);
            if (hs.contains(key)) {
                throw new InvalidSearchInputException("Key " + key + " specified multiple times");
            }
            hs.add(key);
            boolean inputOk;
            if (key.equals(EARLIEST_CREATION_DATE) ||
                    key.equals(LATEST_CREATION_DATE) ||
                    key.equals(EARLIEST_PAY_DATE) ||
                    key.equals(LATEST_PAY_DATE) ||
                    key.equals(EARLIEST_MODIFICATION_DATE) ||
                    key.equals(LATEST_MODIFICATION_DATE) ||
                    key.equals(EARLIEST_DUE_DATE) ||
                    key.equals(LATEST_DUE_DATE))
                inputOk = validateInput(value, DATE);
            else if (key.equals(CONTRACT_ID) ||
                    key.equals(AFFIDAVIT_ID) ||
                    key.equals(USER_ID) ||
                    key.equals(PROJECT_ID))
                inputOk = validateInput(value, INTEGER);
            else if (key.equals(LOWEST_NET_AMOUNT) ||
                    key.equals(HIGHEST_NET_AMOUNT))
                inputOk = validateInput(value, DECIMAL);
            else if (key.equals(STATUS_CODE) ||
                    key.equals(TYPE_CODE) ||
                    key.equals(METHOD_CODE) ||
                    key.equals(COCKPIT_PROJECT) ||
                    key.equals(BILLING_ACCOUNT) ||
                    key.equals(HANDLE))
                inputOk = validateInput(value, STRING);
            else if (key.equals(PAYMENT_ID)) {
                String[] s = value.split(",");
                inputOk = true;
                for (int j = 0; j < s.length && inputOk; j++) {
                    inputOk = validateInput(s[j], INTEGER);
                }
            } else throw new UnsupportedSearchException("Search by " + key + " not supported");
            if (!inputOk)
                throw new InvalidSearchInputException("Value " + value + " invalid for " + key);
        }
        PactsServicesLocal ps = getEjbHandle();
        return ps.findPayments(searchCriteria);
    }

    /**
     * Finds generic tax forms that match the specified search criteria.
     *
     * @param searchCriteria The crtieria to search by.
     * @return A list of tax form headers for the generic tax forms that
     *         satisfy the criteria.
     * @throws RemoteException             If there is some communication problem with the EJB
     * @throws SQLException                If there is some problem retrieving the data
     * @throws UnsupportedSearchException  If attempting to search by a criterion unsupported
     *                                     by the search routine.
     * @throws InvalidSearchInputException If any particular criterion fails validation.
     */
    public Map findTaxForms(Map searchCriteria)
            throws RemoteException, SQLException, UnsupportedSearchException, InvalidSearchInputException {
        HashSet hs = new HashSet();
        Iterator i = searchCriteria.keySet().iterator();
        while (i.hasNext()) {
            String key = (String) i.next();
            String value = (String) searchCriteria.get(key);
            if (hs.contains(key)) {
                throw new InvalidSearchInputException("Key " + key + " specified multiple times");
            }
            hs.add(key);
            boolean inputOk;
            if (key.equals(STATUS_CODE) ||
                    key.equals(TAX_FORM_ID))
                inputOk = validateInput(value, INTEGER);
            else if (key.equals(LOWEST_WITHHOLDING_AMOUNT) ||
                    key.equals(HIGHEST_WITHHOLDING_AMOUNT) ||
                    key.equals(LOWEST_WITHHOLDING_PERCENTAGE) ||
                    key.equals(HIGHEST_WITHHOLDING_PERCENTAGE))
                inputOk = validateInput(value, DECIMAL);
            else
                throw new UnsupportedSearchException("Search by " + key + " not supported");

            if (!inputOk)
                throw new InvalidSearchInputException("Value " + value + " invalid for " + key);
        }
        PactsServicesLocal ps = getEjbHandle();
        return ps.findTaxForms(searchCriteria);
    }

    /**
     * Finds user-specific tax forms that match the specified search criteria.
     *
     * @param searchCriteria The crtieria to search by.
     * @return A list of tax form headers for the user-specific tax forms that
     *         satisfy the criteria.
     * @throws RemoteException             If there is some communication problem with the EJB
     * @throws SQLException                If there is some problem retrieving the data
     * @throws UnsupportedSearchException  If attempting to search by a criterion unsupported
     *                                     by the search routine.
     * @throws InvalidSearchInputException If any particular criterion fails validation.
     */
    public Map findUserTaxForms(Map searchCriteria)
            throws RemoteException, SQLException, UnsupportedSearchException, InvalidSearchInputException {
        HashSet hs = new HashSet();
        Iterator i = searchCriteria.keySet().iterator();
        while (i.hasNext()) {
            String key = (String) i.next();
            String value = (String) searchCriteria.get(key);
            if (hs.contains(key)) {
                throw new InvalidSearchInputException("Key " + key + " specified multiple times");
            }
            hs.add(key);
            boolean inputOk;
            if (key.equals(EARLIEST_DATE_FILED) ||
                    key.equals(LATEST_DATE_FILED))
                inputOk = validateInput(value, DATE);
            else if (key.equals(USER_ID) ||
                    key.equals(STATUS_CODE) ||
                    key.equals(TAX_FORM_ID))
                inputOk = validateInput(value, INTEGER);
            else if (key.equals(LOWEST_WITHHOLDING_AMOUNT) ||
                    key.equals(HIGHEST_WITHHOLDING_AMOUNT) ||
                    key.equals(LOWEST_WITHHOLDING_PERCENTAGE) ||
                    key.equals(HIGHEST_WITHHOLDING_PERCENTAGE))
                inputOk = validateInput(value, DECIMAL);
            else if (key.equals(HANDLE))
                inputOk = validateInput(value, STRING);
            else
                throw new UnsupportedSearchException("Search by " + key + " not supported");

            if (!inputOk)
                throw new InvalidSearchInputException("Value " + value + " invalid for " + key);
        }
        PactsServicesLocal ps = getEjbHandle();
        return ps.findUserTaxForms(searchCriteria);
    }

    /**
     * Finds user profiles that match the specified search criteria.
     *
     * @param searchCriteria The crtieria to search by.
     * @return A list of user profile headers for the user profiles that
     *         satisfy the criteria.
     * @throws RemoteException             If there is some communication problem with the EJB
     * @throws SQLException                If there is some problem retrieving the data
     * @throws UnsupportedSearchException  If attempting to search by a criterion unsupported
     *                                     by the search routine.
     * @throws InvalidSearchInputException If any particular criterion fails validation.
     */
    public Map findUsers(Map searchCriteria)
            throws RemoteException, SQLException, UnsupportedSearchException, InvalidSearchInputException {
        HashSet hs = new HashSet();
        Iterator i = searchCriteria.keySet().iterator();
        while (i.hasNext()) {
            String key = (String) i.next();
            String value = (String) searchCriteria.get(key);
            if (hs.contains(key)) {
                throw new InvalidSearchInputException("Key " + key + " specified multiple times");
            }
            hs.add(key);
            boolean inputOk;
            if (key.equals(PAYMENT_ID) ||
                    key.equals(CONTRACT_ID) ||
                    key.equals(AFFIDAVIT_ID) ||
                    key.equals(TAX_FORM_ID) ||
                    key.equals(USER_ID))
                inputOk = validateInput(value, INTEGER);
            else if (key.equals(FIRST_NAME) ||
                    key.equals(MIDDLE_NAME) ||
                    key.equals(LAST_NAME) ||
					key.equals(METHOD_CODE) ||
                    key.equals(HANDLE))
                inputOk = validateInput(value, STRING);
            else if (key.equals(HAS_ACTIVE_CONTRACTS) ||
                    key.equals(HAS_PENDING_AFFIDAVITS) ||
                    key.equals(HAS_TAX_FORMS_ON_FILE) ||
                    key.equals(IS_OWED_MONEY) ||
                    key.equals(HAS_GLOBAL_AD))
                inputOk = validateInput(value, BOOLEAN);
            else
                throw new UnsupportedSearchException("Search by " + key + " not supported");

            if (!inputOk)
                throw new InvalidSearchInputException("Value " + value + " invalid for " + key);
        }
        PactsServicesLocal ps = getEjbHandle();
        return ps.findUsers(searchCriteria);
    }

    /*****************************************************
     * Data update functions - additions
     *****************************************************/

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
     * @throws RemoteException        If there is some communication problem with the EJB
     * @throws IllegalUpdateException If the user is trying to make an update that is not allowed.
     * @throws SQLException           If there is some problem updating the data
     */
    public long addAffidavit(Affidavit a, String affidavitText, Payment p)
            throws RemoteException, IllegalUpdateException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.addAffidavit(a, affidavitText, p);
    }

    /**
     * Adds the specified contract to the database.
     *
     * @param c            Data for the new contract.
     * @param contractText The new contract text.
     * @return The new contract's ID.
     * @throws RemoteException If there is some communication problem with the EJB
     * @throws SQLException    If there is some problem updating the data
     */
    public long addContract(Contract c, String contractText) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.addContract(c, contractText);
    }

    /**
     * Adds a tax form.
     *
     * @param t           The tax form to add.
     * @param taxFormText The tax form text.
     * @return The new tax form's ID.
     * @throws RemoteException        If there is some communication problem with the EJB
     * @throws IllegalUpdateException If the user is trying to make an update that is not allowed.
     * @throws SQLException           If there is some other problem updating the data
     */
    public long addTaxForm(TaxForm t, String taxFormText) throws RemoteException, IllegalUpdateException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.addTaxForm(t, taxFormText);
    }

    /**
     * Adds a user tax form.
     *
     * @param t The user tax form to add.
     * @throws RemoteException If there is some communication problem with the EJB
     * @throws SQLException    If there is some other problem updating the data
     */
    public void addUserTaxForm(TaxForm t) throws RemoteException, SQLException, EventFailureException {
        PactsServicesLocal ps = getEjbHandle();
        ps.addUserTaxForm(t);
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
     * @throws RemoteException          If there is some communication problem with the EJB
     * @throws IllegalArgumentException If the specified object type does not exist or does
     *                                  not allow notes.
     * @throws SQLException             If the specified object does not exist or if there is some other
     *                                  problem updating the data
     */
    public long addObjectNote(long objectId, int objectType, long taxFormUserId, Note n)
            throws RemoteException, SQLException {
        if (!objectTypeHasNotes(objectType))
            throw new IllegalArgumentException("Object type " + objectType +
                    " does not exist or does not have notes");
        PactsServicesLocal ps = getEjbHandle();
        return ps.addObjectNote(objectId, objectType, taxFormUserId, n);
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
     * @throws RemoteException          If there is some communication problem with the EJB
     * @throws IllegalArgumentException If the specified object type is invalid or does
     *                                  not allow notes.
     * @throws SQLException             If there is some other problem updating the data
     */
    public void addObjectNoteLink(long objectId, int objectType, long taxFormUserId, long noteId)
            throws RemoteException, SQLException {
        if (!objectTypeHasNotes(objectType))
            throw new IllegalArgumentException("Object type " + objectType +
                    " does not exist or does not have notes");
        PactsServicesLocal ps = getEjbHandle();
        ps.addObjectNoteLink(objectId, objectType, taxFormUserId, noteId);
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
     * @throws RemoteException        If there is some communication problem with the EJB
     * @throws NoObjectFoundException If the specified affidavit does not exist.
     * @throws IllegalUpdateException If the affidavit has expired or has already
     *                                been affirmed.
     * @throws SQLException           If there is some other problem updating the data
     */
    public void affirmAffidavit(long affidavitId, String finalText, String coderBirthDate)
            throws RemoteException, NoObjectFoundException, IllegalUpdateException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        ps.affirmAffidavit(affidavitId, finalText, coderBirthDate);
    }

    /**
     * Affirms the specified affidavit, searching the affidavit text and doing the replacements.
     * This method should be used for Indian coders, since they require the family name and age.
     *
     * @param affidavitId The ID of the affidavit to affirm.
     * @param birthday    The birth date of the coder
     * @param familyName  family name of the coder
     * @param aged        age of the couder
     * @throws RemoteException        If there is some communication problem with the EJB
     * @throws NoObjectFoundException If the specified affidavit does not exist.
     * @throws IllegalUpdateException If the affidavit has expired or has already
     *                                been affirmed.
     * @throws SQLException           If there is some other problem updating the data
     */
    public void affirmAffidavit(long affidavitId, Date birthday, String familyName, int aged)
            throws RemoteException, NoObjectFoundException, IllegalUpdateException, SQLException {
        SimpleDateFormat dfmt = new SimpleDateFormat(DATE_FORMAT_STRING);
        AffidavitBean bean = new AffidavitBean();

        AffidavitWithText a = bean.getAffidavitWithText(affidavitId, dfmt.format(birthday));

        if (a == null) {
            throw new NoObjectFoundException("Couldn't find affidavit " + affidavitId);
        }

        //first replace the aged
        int aIdx = a.getAffidavitText().indexOf("FILL IN AGED");
        int bIdx = aIdx + (new String("FILL IN AGED")).length();
        a.setAffidavitText(a.getAffidavitText().substring(0, aIdx) +
                " " + aged + " " + a.getAffidavitText().substring(bIdx));

        //now the family name
        aIdx = a.getAffidavitText().indexOf("FILL IN BELOW");
        bIdx = aIdx + (new String("FILL IN BELOW")).length();
        a.setAffidavitText(a.getAffidavitText().substring(0, aIdx) +
                " " + familyName + " " + a.getAffidavitText().substring(bIdx));

        // if we got here everything is good, we should affirm the affidavit
        affirmAffidavit(a.getAffidavit().getHeader().getId(), a.getAffidavitText(), dfmt.format(birthday));
    }

    /**
     * Affirms the specified affidavit, searching the affidavit text.
     *
     * @param affidavitId The ID of the affidavit to affirm.
     * @param birthday    The birth date of the coder
     * @throws RemoteException        If there is some communication problem with the EJB
     * @throws NoObjectFoundException If the specified affidavit does not exist.
     * @throws IllegalUpdateException If the affidavit has expired or has already
     *                                been affirmed.
     * @throws SQLException           If there is some other problem updating the data
     */
    public void affirmAffidavit(long affidavitId, Date birthday)
            throws RemoteException, NoObjectFoundException, IllegalUpdateException, SQLException {

        SimpleDateFormat dfmt = new SimpleDateFormat(DATE_FORMAT_STRING);
        AffidavitBean bean = new AffidavitBean();

        AffidavitWithText a = bean.getAffidavitWithText(affidavitId, dfmt.format(birthday));

        if (a == null) {
            throw new NoObjectFoundException("Couldn't find affidavit " + affidavitId);
        }

        affirmAffidavit(a.getAffidavit().getHeader().getId(), a.getAffidavitText(), dfmt.format(birthday));
    }

    /**
     * Updates the given affidavit (excluding text updates and affirmations).
     *
     * @param a The updated affidavit information
     * @throws RemoteException        If there is some communication problem with the EJB
     * @throws NoObjectFoundException If the specified object does not exist.
     * @throws SQLException           If there is some problem updating the data
     */
    public void updateAffidavit(Affidavit a) throws RemoteException, NoObjectFoundException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        ps.updateAffidavit(a);
    }

    /**
     * Updates the given contract (excluding text updates).
     *
     * @param c The updated affidavit information
     * @throws RemoteException        If there is some communication problem with the EJB
     * @throws NoObjectFoundException If the specified object does not exist.
     * @throws SQLException           If there is some problem updating the data
     */
    public void updateContract(Contract c) throws RemoteException, NoObjectFoundException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        ps.updateContract(c);
    }

    /**
     * Updates the given tax form (excluding text updates).
     *
     * @param t The updated tax form information
     * @throws RemoteException        If there is some communication problem with the EJB
     * @throws NoObjectFoundException If the specified object does not exist.
     * @throws IllegalUpdateException If the user is trying to make an update that is not allowed.
     * @throws SQLException           If there is some problem updating the data
     */
    public void updateTaxForm(TaxForm t) throws RemoteException, NoObjectFoundException, IllegalUpdateException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        ps.updateTaxForm(t);
    }

    /**
     * Updates the given user tax form (user_tax_form_xref table only;
     * to update data in tax_form, use <tt>updateTaxForm()</tt>)
     *
     * @param t The updated tax form information
     * @throws RemoteException        If there is some communication problem with the EJB
     * @throws NoObjectFoundException If the specified object does not exist.
     * @throws IllegalUpdateException If the user is trying to make an update that is not allowed.
     * @throws SQLException           If there is some problem updating the data
     */
    public void updateUserTaxForm(TaxForm t) throws RemoteException, NoObjectFoundException, IllegalUpdateException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        ps.updateUserTaxForm(t);
    }

    /**
     * Updates the text for the given contract or tax form.
     *
     * @param objectId   The object ID to update
     * @param objectType The object type to update
     * @param newText    The updated text
     * @throws IllegalArgumentException If the specified object type does not exist or does not
     *                                  have updatable text.
     * @throws NoObjectFoundException   If the specified object does not exist.
     * @throws RemoteException          If there is some communication problem with the EJB
     * @throws SQLException             If there is some other problem updating the data
     */
    public void updateText(long objectId, int objectType, String newText)
            throws NoObjectFoundException, RemoteException, SQLException {
        if (!objectTypeHasUpdatableText(objectType))
            throw new IllegalArgumentException("Object type " + objectType +
                    " does not exist or does not have updatable text");
        PactsServicesLocal ps = getEjbHandle();
        ps.updateText(objectId, objectType, newText);
    }

    /*****************************************************
     * Utility functions
     *****************************************************/

    /**
     * Returns true iff the specified user is allowed to affirm an affidavit of
     * the specified type.  This will be the case if the user has at least one
     * notarized affidavit of that type on file, and has fully filled out the
     * member profile demographic information.  If the user does not exist in
     * the database, the method returns false.
     *
     * @param userId          The user ID to check.
     * @param affidavitTypeId The type of the affidavit.
     * @return Whether or not the user can affirm an affidavit.
     * @throws RemoteException If there is some communication problem with the EJB
     * @throws SQLException    If there is some problem querying the database
     */
    public boolean canAffirmAffidavit(long userId, int affidavitTypeId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.canAffirmAffidavit(userId, affidavitTypeId);
    }

    public boolean hasNotarizedAffidavit(long userId, int affidavitTypeId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.hasNotarizedAffidavit(userId, affidavitTypeId);
    }

    public boolean hasAllDemographicAnswers(long userId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.hasAllDemographicAnswers(userId);
    }

    public boolean hasTaxForm(long userId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.hasTaxForm(userId);
    }

    public boolean hasGlobalAD(long userId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.hasGlobalAD(userId);
    }

    public long getGlobalADId(long userId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getGlobalADId(userId);
    }

    public int requiresClient(int paymentTypeId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.requiresClient(paymentTypeId);
    }

    public boolean requiresGlobalAD(int paymentTypeId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.requiresGlobalAD(paymentTypeId);
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
     * @throws RemoteException        If there is some communication problem with the EJB
     * @throws IllegalUpdateException If the affidavit/payment information
     *                                has already been generated for this round.
     * @throws SQLException           If there was some error updating the data.
     */
    public int generateRoundPayments(long roundId, boolean makeChanges)
            throws RemoteException, IllegalUpdateException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.generateRoundPayments(roundId, makeChanges);
    }

    public int generateRoundPayments(long roundId, int affidavitTypeId, boolean makeChanges, int paymentTypeId)
            throws RemoteException, IllegalUpdateException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.generateRoundPayments(roundId, affidavitTypeId, makeChanges, paymentTypeId);
    }


    public int generateRoundPayments(long roundId, boolean makeChanges, int paymentTypeId)
            throws RemoteException, IllegalUpdateException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.generateRoundPayments(roundId, makeChanges, paymentTypeId);
    }


    /**
     * Generates the payments for Online Review project.
     *
     * <p>
     * Version 1.1 (Online Review Payments and Status Automation Assembly 1.0) Changes Notes:
     * <ol>
     * <li>a new parameter is added to populate the related resource ids for generated component payments.</li>
     * </ol>
     * </p>
     *
     * @param projectId the project id
     * @param status the project status code
     * @param client the client name
     * @param applyReviewerWithholding whether to apply reviewer with holding.
     * @param payRboardBonus the bonus for paying review board.
     * @param resourceIds the resource ids list to populate
     * @return the list of component payments.
     * @throws IllegalUpdateException if it is illegal to update.
     * @throws RemoteException if any error occurs.
     * @throws SQLException if any sql error occurs.
     * @throws EventFailureException if any error occurs.
     */
    public List generateComponentPayments(long projectId, long status, String client, List resourceIds)
            throws IllegalUpdateException, SQLException, EventFailureException, RemoteException {
      PactsServicesLocal ps = getEjbHandle();
      return ps.generateComponentPayments(projectId, status, client, resourceIds);
    }

    /**
     * Adds online review payments in persistence.
     *
     * @param payments the review payments
     * @param resourceIds the resource ids to update the payment status.
     * @param operatorUserId User ID of the operator or 0 if not set
     * @return the online review payments.
     * @throws RemoteException if any error occurs.
     * @throws SQLException if any sql error occurs.
     * @since Online Review Payments and Status Automation Assembly 1.0
     */
    public List addOnlineReviewPayments(List payments, List resources, long operatorUserId) throws SQLException, RemoteException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.addOnlineReviewPayments(payments, resources, operatorUserId);
    }

    /**
     * Generates a map with project ID keys and component ID values from the component and review board
     * payments in the given list.
     *
     * @param paymentIds The list of payment IDs.
     * @return the map of (projectID, componentID) pairs
     */
    public Map getPaymentComponentData(long[] paymentIds) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getPaymentComponentData(paymentIds);
    }

    public ResultSetContainer getAffidavitHistory(long userId, boolean pendingOnly, int sortColumn, boolean sortAscending) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getAffidavitHistory(userId, pendingOnly, sortColumn, sortAscending);
    }

    /**
     * Sets the status on all contest payments with Pending or On Hold status older than a specified time
     * to Expired. The time limit is specified in <tt>PactsConstants.java</tt>
     * and is currently set to 60 days.
     *
     * @return The number of affidavit/payment pairs thus affected.
     * @throws SQLException If there was some error updating the data.
     */
    public int expireOldPayments() throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.expireOldPayments();
    }

    /**
     */
    public int checkInactiveCoders() throws RemoteException, SQLException {
        return checkInactiveCoders(0);
    }

    /**
     */
    public int checkInactiveCoders(long userId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.checkInactiveCoders(userId);
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
    public int expireOldAffidavits() throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.expireOldAffidavits();
    }

    /**
     * Sets the status on all assignment documents older than a specified time
     * to Expired, and set the status on their associated payment (if any)
     * to Canceled.
     *
     * @return The number of affidavit/payment pairs thus affected.
     * @throws SQLException If there was some error updating the data.
     */
    public int expireOldAssignmentDocuments() throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.expireOldAssignmentDocuments();
    }

    public void createAffidavitTemplate(int affidavitTypeId, String text) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        ps.createAffidavitTemplate(affidavitTypeId, text);
    }

    public void createAssignmentDocumentTemplate(int assignmentdocumentTypeId, String text, String name) throws RemoteException {
        PactsServicesLocal ps = getEjbHandle();
        ps.createAssignmentDocumentTemplate(assignmentdocumentTypeId, text, name);
    }

    public List<AssignmentDocumentTemplate> getAssignmentDocumentTemplate(long assignmentDocumentTypeId, boolean onlyCurrent) throws RemoteException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getAssignmentDocumentTemplate(assignmentDocumentTypeId, onlyCurrent);
    }


    public Payment getEmptyPayment(long userId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getEmptyPayment(userId);
    }

    public Map findProblems(String search) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.findProblems(search);
    }

    public Map findProjects(String search) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.findProjects(search);
    }

    public Map findProjects(String search, int categoryId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.findProjects(search, categoryId);
    }

    public Map findComponentContests(String search) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.findComponentContests(search);
    }

    public Map findStudioContests(String search) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.findStudioContests(search);
    }

    public Map findRounds(String search, int[] roundTypes) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.findRounds(search, roundTypes);
    }

    public Map getDigitalRunSeasonList() throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getDigitalRunSeasonList();
    }

    public Map getDigitalRunStageList() throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getDigitalRunStageList();
    }

    public Map getDigitalRunTrackList() throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getDigitalRunTrackList();
    }

    public Map findPaymentsByDescription(String search) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.findPaymentsByDescription(search);
    }

    public BasePayment fillPaymentData(BasePayment payment) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.fillPaymentData(payment);
    }

    public double computePaymentNetAmount(int paymentTypeId, double grossAmount, long coderId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.computePaymentNetAmount(paymentTypeId, grossAmount, coderId);
    }   

    public BasePayment addPayment(BasePayment payment) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.addPayment(payment);
    }

    public BasePayment addPayment(BasePayment payment, long operatorUserId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.addPayment(payment, operatorUserId);
    }

    public BasePayment updatePayment(BasePayment payment) throws RemoteException, Exception {
        PactsServicesLocal ps = getEjbHandle();
        return ps.updatePayment(payment);
    }

    public BasePayment updatePayment(BasePayment payment, boolean supervisor) throws RemoteException, Exception {
        PactsServicesLocal ps = getEjbHandle();
        return ps.updatePayment(payment, supervisor);
    }

    public BasePayment updatePayment(BasePayment payment, boolean supervisor, long operatorUserId) throws RemoteException, Exception {
        PactsServicesLocal ps = getEjbHandle();
        return ps.updatePayment(payment, supervisor, operatorUserId);
    }

    public BasePayment getBasePayment(long paymentId) throws RemoteException, SQLException, InvalidStatusException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getBasePayment(paymentId);
    }

    public List addPayments(List payments) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.addPayments(payments);
    }

    public List addPayments(List payments, long operatorUserId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.addPayments(payments, operatorUserId);
    }

    public List findPayments(int paymentTypeId, long referenceId) throws RemoteException, SQLException, InvalidStatusException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.findPayments(paymentTypeId, referenceId);
    }

    public List findAssignmentDocument(Map searchCriteria) throws RemoteException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.findAssignmentDocument(searchCriteria);
    }

    public List getAssignmentDocumentByUserId(long userId, long assignmentDocumentTypeId, boolean onlyPending) throws RemoteException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getAssignmentDocumentByUserId(userId, assignmentDocumentTypeId, onlyPending);
    }

    public String getAssignmentDocumentTransformedText(long assignmentDocumentTypeId, AssignmentDocument ad) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getAssignmentDocumentTransformedText(assignmentDocumentTypeId, ad);
    }

    public List getAssignmentDocumentByUserIdProjectId(long userId, long projectId) throws RemoteException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getAssignmentDocumentByUserIdProjectId(userId, projectId);
    }

    public List getAssignmentDocumentByUserIdStudioContestId(long studioContestId, long projectId) throws RemoteException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getAssignmentDocumentByUserIdStudioContestId(studioContestId, projectId);
    }

    public Boolean hasHardCopyAssignmentDocumentByUserId(long userId, long assignmentDocumentTypeId) throws RemoteException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.hasHardCopyAssignmentDocumentByUserId(userId, assignmentDocumentTypeId);
    }

    public void affirmAssignmentDocument(AssignmentDocument ad) throws RemoteException {
        PactsServicesLocal ps = getEjbHandle();
        ps.affirmAssignmentDocument(ad);
    }

    public List<BasePaymentStatus> getPaymentStatusList() throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getPaymentStatusList();
    }

    public boolean hasAffirmedAssignmentDocument(long paymentTypeId, long coderId, long contestId) throws RemoteException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.hasAffirmedAssignmentDocument(paymentTypeId, coderId, contestId);
    }

    public List<BasePayment> findCoderPayments(Map searchCriteria) throws RemoteException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.findCoderPayments(searchCriteria);
    }

    public double getUserAccrualThreshold(long userId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getUserAccrualThreshold(userId);
    }

    public double getUserAccruingPaymentsTotal(long userId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getUserAccruingPaymentsTotal(userId);
    }

    public ResultSetContainer getContestsInfo(Long eid) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getContestsInfo(eid);
    }

    /**
     * saves the provided accrual amount to the specified user
     *
     * @throws RemoteException If there is some communication problem with the EJB
     */
    public void saveUserAccrualThreshold(long userId, double newAccrualAmount) throws RemoteException {
        PactsServicesLocal ps = getEjbHandle();
        ps.saveUserAccrualThreshold(userId, newAccrualAmount);
    }

    public Long getUserPaymentMethod(long userId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getUserPaymentMethod(userId);
    }

    public void saveUserPaymentMethod(long userId, long paymentMethodId) throws RemoteException {
        PactsServicesLocal ps = getEjbHandle();
        ps.saveUserPaymentMethod(userId, paymentMethodId);
    }

    public String getUserPayPalAccount(long userId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getUserPayPalAccount(userId);
    }

    public void saveUserPayPalAccount(long userId, String payPalAccount) throws RemoteException {
        PactsServicesLocal ps = getEjbHandle();
        ps.saveUserPayPalAccount(userId, payPalAccount);
    }

    /**
     */
    public Map<Long, BasePaymentStatus> getPaymentStatusMap() throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getPaymentStatusMap();
    }

    public Map<Long, String> newPaymentEvent(String[] paymentIDs, int event, Date payDate, long operatorUserId) throws RemoteException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.newPaymentEvent(paymentIDs, event, payDate, operatorUserId);
    }

    public String getInvoiceNumber(long paymentId) throws RemoteException, SQLException {
        PactsServicesLocal ps = getEjbHandle();
        return ps.getInvoiceNumber(paymentId);
    }
}


