package com.topcoder.web.tc.controller.legacy.pacts.bean;

import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.tc.controller.legacy.pacts.common.*;
import com.topcoder.web.ejb.pacts.*;
import com.topcoder.web.common.BaseProcessor;

import javax.jms.JMSException;
import javax.naming.InitialContext;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.rmi.RemoteException;
import java.sql.SQLException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * This class receives incoming requests from the dispatch beans
 * and passes them on to the EJB. <p>
 *
 * Each data retrieval function in this class returns a Map in
 * which each key is an object description in <tt>PactsConstants.java</tt>
 * and each value is a <tt>ResultSetContainer</tt> object with the
 * data promised by the object description.  With this scheme, the
 * content of data coming back is clearly identified.  Additionally,
 * function prototypes do not have to change if, for example, it is
 * subsequently desired to have a particular function return two
 * <tt>ResultSetContainer</tt> objects instead of one. <p>
 *
 * Each search function in this class takes in a Map of search criteria,
 * in which each key is a criterion description in <tt>PactsConstants.java</tt>
 * and each value is a <tt>String</tt> corresponding to the desired value
 * that search results will have for this criterion.  It is expected that
 * validation checks have already been performed on the search criteria values.
 * The search routines will throw exceptions if any criterion is invalid or not
 * applicable to the particular search.  For convenience, an input validator is
 * provided here that checks integer, decimal, date, and boolean input. <p>
 *
 * For all update functions, it is assumed that the user has authority
 * to execute the update in question. <p>
 *
 * The database access routines in this class throw an <tt>SQLException</tt>
 * if there is some problem executing their associated database queries.
 *
 * @author  Dave Pecora
 * @version 1.00, 03/06/2002
 *
 * @see ResultSetContainer
 * @see PactsServicesBean
 * @see PactsConstants
 */

public class DataInterfaceBean implements PactsConstants {

    // Get handle to the EJB.  All miscellaneous exceptions that can be
    // thrown by the various calls herein (CreateException, NamingException,
    // RemoteException) get packaged into a RemoteException for convenience.
    private PactsServices getEjbHandle() throws RemoteException {
        try {
            InitialContext c = TCContext.getInitial();
            return (PactsServices)BaseProcessor.createEJB(c, PactsServices.class);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RemoteException(e.getMessage());
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
                objectType == PAYMENT_OBJ ||
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
     * @param   affidavitId  The ID of the affidavit to retrieve.
     * @return  The affidavit data.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some problem retrieving the data
     */
    public Map getAffidavit(long affidavitId) throws RemoteException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.getAffidavit(affidavitId);
    }

    /**
     * Returns the contract specified by the given contract ID.  <p>
     *
     * @param   contractId  The ID of the contract to retrieve.
     * @return  The contract data.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some problem retrieving the data
     */
    public Map getContract(long contractId) throws RemoteException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.getContract(contractId);
    }

    /**
     * Returns the note specified by the given note ID.  <p>
     *
     * @param   noteId  The ID of the note to retrieve.
     * @return  The note data.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some problem retrieving the data
     */
    public Map getNote(long noteId) throws RemoteException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.getNote(noteId);
    }

    /**
     * Returns the payment specified by the given payment ID.  The data returned will consist
     * of the payment header, the most recent payment detail record (with print address, if
     * applicable), and the current coder address information. <p>
     *
     * @param   paymentId  The ID of the payment to retrieve.
     * @return  The payment data.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some problem retrieving the data
     */
    public Map getPayment(long paymentId) throws RemoteException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.getPayment(paymentId);
    }

    /**
     * Returns the complete audit trail for the payment specified by the given payment ID.
     * Data returned will include the payment header, all payment detail records (with print
     * addresses, if applicable), and the current coder address. <p>
     *
     * @param   paymentId  The ID of the payment to retrieve.
     * @return  The payment audit trail data.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some problem retrieving the data
     */
    public Map getPaymentAuditTrail(long paymentId) throws RemoteException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.getPaymentAuditTrail(paymentId);
    }

    /**
     * Returns the user profile corresponding to the given user ID.  <p>
     *
     * @param   userId  The user ID for which to retrieve the user profile.
     * @return  The user profile data.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some problem retrieving the data
     */
    public Map getUserProfile(long userId) throws RemoteException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.getUserProfile(userId);
    }

    /**
     * Returns the user profile header corresponding to the given user ID.  <p>
     *
     * @param   userId  The user ID for which to retrieve the user profile header.
     * @return  The user profile header data.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some problem retrieving the data
     */
    public Map getUserProfileHeader(long userId) throws RemoteException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.getUserProfileHeader(userId);
    }

    /**
     * Returns the generic tax form specified by the given tax form ID.  <p>
     *
     * @param   taxFormId  The ID of the generic tax form to retrieve.
     * @return  The tax form data.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some problem retrieving the data
     */
    public Map getTaxForm(long taxFormId) throws RemoteException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.getTaxForm(taxFormId);
    }

    /**
     * Returns the user-specific tax form specified by the given tax form ID.  <p>
     *
     * @param   userId  The user ID of the tax form to retrieve.
     * @param   taxFormId  The tax form ID of the tax form to retrieve.
     * @return  The tax form data.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some problem retrieving the data
     */
    public Map getUserTaxForm(long userId, long taxFormId) throws RemoteException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.getUserTaxForm(userId, taxFormId);
    }

    /*****************************************************
     * Subobject retrieval functions
     *****************************************************/

    /**
     * Returns the list of affidavits for the given user.
     *
     * @param   userId  The coder ID of the affidavits.
     * @return  The affidavit header list.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some problem retrieving the data
     */
    public Map getUserAffidavitList(long userId) throws RemoteException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.getUserAffidavitList(userId);
    }

    /**
     * Returns the list of contracts for the given user.
     *
     * @param   userId  The contracted user ID of the contracts.
     * @return  The contract header list.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some problem retrieving the data
     */
    public Map getUserContractList(long userId) throws RemoteException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.getUserContractList(userId);
    }

    /**
     * Returns the list of payments to the given user.
     *
     * @param   userId  The coder ID of the payments.
     * @return  The payment header list.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some problem retrieving the data
     */
    public Map getUserPaymentList(long userId) throws RemoteException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.getUserPaymentList(userId);
    }

    /**
     * Returns the list of tax forms for the given user.
     *
     * @param   userId  The user ID of the tax forms.
     * @return  The tax form header list.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some problem retrieving the data
     */
    public Map getUserTaxFormList(long userId) throws RemoteException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.getUserTaxFormList(userId);
    }

    /**
     * Returns the list of notes associated with the given object,
     * which can be an affidavit, contract, user tax form, payment, or
     * user profile.
     *
     * @param   objectId  The ID of the object.
     * @param   objectType The type of the object, as defined in
     * <tt>PactsConstants.java</tt>
     * @param   taxFormUserId If the object is a tax form, the user ID of
     * the tax form.  This parameter is otherwise disregarded.
     * @return  The note header list.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  IllegalArgumentException if the object type does not exist or does not have notes.
     * @throws  SQLException If there is some problem retrieving the data
     */
    public Map getNoteList(long objectId, int objectType, long taxFormUserId)
            throws RemoteException, SQLException {
        if (!objectTypeHasNotes(objectType))
            throw new IllegalArgumentException("Object type " + objectType +
                    " does not exist or does not have notes");
        PactsServices ps = getEjbHandle();
        return ps.getNoteList(objectId, objectType, taxFormUserId);
    }

    /**
     * Returns the list of payments associated with the given contract.
     *
     * @param   contractId  The contract ID of the payments.
     * @return  The payment header list.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some problem retrieving the data
     */
    public Map getContractPaymentList(long contractId) throws RemoteException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.getContractPaymentList(contractId);
    }

    /**
     * Returns the text of an affidavit, contract, note, or tax form.
     *
     * @param   objectId  The ID of the object.
     * @param   objectType The type of the object, as defined in
     * <tt>PactsConstants.java</tt>
     * @return  The text associated with the object.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  IllegalArgumentException if the object type does not exist or does not have
     * associated text.
     * @throws  SQLException If there is some problem retrieving the data
     */
    public Map getText(long objectId, int objectType) throws RemoteException, SQLException {
        if (!objectTypeHasText(objectType))
            throw new IllegalArgumentException("Object type " + objectType +
                    " does not exist or does not have text");
        PactsServices ps = getEjbHandle();
        return ps.getText(objectId, objectType);
    }

    /*****************************************************
     * Type listing retrieval functions
     *****************************************************/

    /**
     * Returns the list of all affidavit types.
     *
     * @return  The list of affidavit types
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some problem retrieving the data
     */
    public Map getAffidavitTypes() throws RemoteException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.getAffidavitTypes();
    }

    /**
     * Returns the list of all contract types.
     *
     * @return  The list of contract types
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some problem retrieving the data
     */
    public Map getContractTypes() throws RemoteException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.getContractTypes();
    }

    /**
     * Returns the list of all note types.
     *
     * @return  The list of note types
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some problem retrieving the data
     */
    public Map getNoteTypes() throws RemoteException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.getNoteTypes();
    }

    /**
     * Returns the list of all payment types.
     *
     * @return  The list of payment types
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some problem retrieving the data
     */
    public Map getPaymentTypes() throws RemoteException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.getPaymentTypes();
    }

    /**
     * Returns the list of all payment modification rationales.
     *
     * @return  The list of rationales
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some problem retrieving the data
     */
    public Map getModificationRationales() throws RemoteException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.getModificationRationales();
    }

    /**
     * Returns the list of all status codes.
     *
     * @return  The list of status codes
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some problem retrieving the data
     */
    public Map getStatusCodes() throws RemoteException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.getStatusCodes();
    }

    /**
     * Returns the list of all status codes for a given object type.
     *
     * @param   objectType The object type
     * @return  The list of status codes
     * @throws  IllegalArgumentException If the specified object type does
     * not exist.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some problem retrieving the data
     */
    public Map getStatusCodes(int objectType) throws RemoteException, SQLException {
        if (!objectTypeExists(objectType))
            throw new IllegalArgumentException("The specified object type " + objectType + " does not exist");
        PactsServices ps = getEjbHandle();
        return ps.getStatusCodes(objectType);
    }

    /**
     * Returns the list of all user types.
     *
     * @return  The list of user types
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some problem retrieving the data
     */
    public Map getUserTypes() throws RemoteException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.getUserTypes();
    }

    /**
     * Returns the list of all rounds.
     *
     * @return  The list of all rounds
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some problem retrieving the data
     */
    public Map getRounds() throws RemoteException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.getRounds();
    }

    /**
     * Returns the demographic data for a given user.
     *
     * @return  The demographic data
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some problem retrieving the data
     */
    public Map getDemographicData(long userId) throws RemoteException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.getDemographicData(userId);
    }

    /*****************************************************
     * Search functions
     *****************************************************/

    /**
     * Checks to see if the specified string input can be parsed to a
     * valid example of the specified input type.
     *
     * @param   input  The input in question.
     * @param   inputType  Crtierion input type as specified in
     * <tt>PactsConstants.java</tt>.  Currently integer, decimal,
     * boolean, and date inputs can be checked for compliance.
     * @return  Whether or not the given input is valid.
     * @throws  IllegalArgumentException if the input type is not a valid type.
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
     * @param   searchCriteria  The crtieria to search by.
     * @return  A list of affidavit headers for the affidavits that satisfy the criteria.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some problem retrieving the data
     * @throws  UnsupportedSearchException If attempting to search by a criterion unsupported
     * by the search routine.
     * @throws  InvalidSearchInputException If any particular criterion fails validation.
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
                    key.equals(STATUS_CODE) ||
                    key.equals(AFFIDAVIT_ID) ||
                    key.equals(ROUND_ID) ||
                    key.equals(TYPE_CODE))
                inputOk = validateInput(value, INTEGER);
            else if (key.equals(IS_AFFIRMED) ||
                    key.equals(IS_NOTARIZED))
                inputOk = validateInput(value, BOOLEAN);
            else if (key.equals(HANDLE))
                inputOk = validateInput(value, STRING);
            else
                throw new UnsupportedSearchException("Search by " + key + " not supported");

            if (!inputOk)
                throw new InvalidSearchInputException("Value " + value + " invalid for " + key);
        }
        PactsServices ps = getEjbHandle();
        return ps.findAffidavits(searchCriteria);
    }

    /**
     * Finds contracts that match the specified search criteria.
     *
     * @param   searchCriteria  The crtieria to search by.
     * @return  A list of contract headers for the contracts that satisfy the criteria.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some problem retrieving the data
     * @throws  UnsupportedSearchException If attempting to search by a criterion unsupported
     * by the search routine.
     * @throws  InvalidSearchInputException If any particular criterion fails validation.
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
        PactsServices ps = getEjbHandle();
        return ps.findContracts(searchCriteria);
    }

    /**
     * Finds objects that a given note is associated with.
     *
     * @param   noteId  The note ID for which to find associated objects.
     * @return  A list of headers for the objects that are associated with the given note.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some problem retrieving the data
     */
    public Map findNoteObjects(long noteId) throws RemoteException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.findNoteObjects(noteId);
    }

    /**
     * Finds notes that match the specified search criteria.
     *
     * @param   searchCriteria  The crtieria to search by.
     * @return  A list of note headers for the notes that
     * satisfy the criteria.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some problem retrieving the data
     * @throws  UnsupportedSearchException If attempting to search by a criterion unsupported
     * by the search routine.
     * @throws  InvalidSearchInputException If any particular criterion fails validation.
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
        PactsServices ps = getEjbHandle();
        return ps.findNotes(searchCriteria);
    }

    /**
     * Finds payments that match the specified search criteria.
     *
     * @param   searchCriteria  The crtieria to search by.
     * @return  A list of payment headers for the payments that
     * satisfy the criteria.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some problem retrieving the data
     * @throws  UnsupportedSearchException If attempting to search by a criterion unsupported
     * by the search routine.
     * @throws  InvalidSearchInputException If any particular criterion fails validation.
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
            if (key.equals(EARLIEST_PRINT_DATE) ||
                    key.equals(LATEST_PRINT_DATE) ||
                    key.equals(EARLIEST_PAY_DATE) ||
                    key.equals(LATEST_PAY_DATE) ||
                    key.equals(EARLIEST_DUE_DATE) ||
                    key.equals(LATEST_DUE_DATE))
                inputOk = validateInput(value, DATE);
            else if (key.equals(CONTRACT_ID) ||
                    key.equals(AFFIDAVIT_ID) ||
                    key.equals(PAYMENT_ID) ||
                    key.equals(USER_ID) ||
                    key.equals(STATUS_CODE) ||
                    key.equals(TYPE_CODE))
                inputOk = validateInput(value, INTEGER);
            else if (key.equals(LOWEST_NET_AMOUNT) ||
                    key.equals(HIGHEST_NET_AMOUNT))
                inputOk = validateInput(value, DECIMAL);
            else if (key.equals(HANDLE))
                inputOk = validateInput(value, STRING);
            else if (key.equals(IS_REVIEWED))
                inputOk = validateInput(value, BOOLEAN);
            else
                throw new UnsupportedSearchException("Search by " + key + " not supported");

            if (!inputOk)
                throw new InvalidSearchInputException("Value " + value + " invalid for " + key);
        }
        PactsServices ps = getEjbHandle();
        return ps.findPayments(searchCriteria);
    }

    /**
     * Finds generic tax forms that match the specified search criteria.
     *
     * @param   searchCriteria  The crtieria to search by.
     * @return  A list of tax form headers for the generic tax forms that
     * satisfy the criteria.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some problem retrieving the data
     * @throws  UnsupportedSearchException If attempting to search by a criterion unsupported
     * by the search routine.
     * @throws  InvalidSearchInputException If any particular criterion fails validation.
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
        PactsServices ps = getEjbHandle();
        return ps.findTaxForms(searchCriteria);
    }

    /**
     * Finds user-specific tax forms that match the specified search criteria.
     *
     * @param   searchCriteria  The crtieria to search by.
     * @return  A list of tax form headers for the user-specific tax forms that
     * satisfy the criteria.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some problem retrieving the data
     * @throws  UnsupportedSearchException If attempting to search by a criterion unsupported
     * by the search routine.
     * @throws  InvalidSearchInputException If any particular criterion fails validation.
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
        PactsServices ps = getEjbHandle();
        return ps.findUserTaxForms(searchCriteria);
    }

    /**
     * Finds user profiles that match the specified search criteria.
     *
     * @param   searchCriteria  The crtieria to search by.
     * @return  A list of user profile headers for the user profiles that
     * satisfy the criteria.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some problem retrieving the data
     * @throws  UnsupportedSearchException If attempting to search by a criterion unsupported
     * by the search routine.
     * @throws  InvalidSearchInputException If any particular criterion fails validation.
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
                    key.equals(HANDLE))
                inputOk = validateInput(value, STRING);
            else if (key.equals(HAS_ACTIVE_CONTRACTS) ||
                    key.equals(HAS_PENDING_AFFIDAVITS) ||
                    key.equals(HAS_TAX_FORMS_ON_FILE) ||
                    key.equals(IS_OWED_MONEY))
                inputOk = validateInput(value, BOOLEAN);
            else
                throw new UnsupportedSearchException("Search by " + key + " not supported");

            if (!inputOk)
                throw new InvalidSearchInputException("Value " + value + " invalid for " + key);
        }
        PactsServices ps = getEjbHandle();
        return ps.findUsers(searchCriteria);
    }

    /*****************************************************
     * Data update functions - additions
     *****************************************************/

    /**
     * Adds a new affidavit to the database without any corresponding payment.
     *
     * @param   a Data for the new affidavit.
     * @param   affidavitText The new affidavit's text
     * @throws  IllegalUpdateException If the user is trying to make an illegal update.
     * @throws  SQLException If there is some problem updating the data
     * @return  The new affidavit's ID.
     */
    public long addAffidavit(Affidavit a, String affidavitText)
            throws RemoteException, IllegalUpdateException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.addAffidavit(a, affidavitText);
    }

    /**
     * Adds the specified affidavit and payment to the database, and associates the two.
     * Also adds a correpsonding referral payment if the affidavit is a contest winnings
     * affidavit and someone referred the winning coder. <p>
     *
     * If the payment input parameter is null, the affidavit will still be created, but
     * without being associated with a payment.
     *
     * @param   a Data for the new affidavit.
     * @param   affidavitText The new affidavit's text
     * @param   p Data for the new payment
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  IllegalUpdateException If the user is trying to make an update that is not allowed.
     * @throws  SQLException If there is some problem updating the data
     * @return  The new affidavit's ID.
     */
    public long addAffidavit(Affidavit a, String affidavitText, Payment p)
            throws RemoteException, IllegalUpdateException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.addAffidavit(a, affidavitText, p);
    }

    /**
     * Adds the specified contract to the database.
     *
     * @param   c Data for the new contract.
     * @param   contractText The new contract text.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some problem updating the data
     * @return  The new contract's ID.
     */
    public long addContract(Contract c, String contractText) throws RemoteException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.addContract(c, contractText);
    }

    /**
     * Adds the specified payment to the database.  Does not add a corresponding
     * referral payment.
     *
     * @param   p Data for the new payment.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  IllegalUpdateException If the user is trying to make an update that is not allowed.
     * @throws  SQLException If there is some problem updating the data
     * @return  The new payment's ID.
     */
    public long addPayment(Payment p) throws RemoteException, IllegalUpdateException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.addPayment(p);
    }

    /**
     * Adds the specified payment to the database, and to the specified contract.  Does
     * not add a corresponding referral payment.
     *
     * @param   contractId The ID of the contract to which to add the payment.
     * @param   p The payment data to add.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  IllegalUpdateException If the user is trying to make an update that is not allowed.
     * @throws  SQLException If there is some other problem updating the data
     * @return  The new payment's ID.
     */
    public long addContractPayment(long contractId, Payment p) throws RemoteException, IllegalUpdateException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.addContractPayment(contractId, p);
    }

    /**
     * Adds a tax form.
     *
     * @param   t The tax form to add.
     * @param   taxFormText The tax form text.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  IllegalUpdateException If the user is trying to make an update that is not allowed.
     * @throws  SQLException If there is some other problem updating the data
     * @return  The new tax form's ID.
     */
    public long addTaxForm(TaxForm t, String taxFormText) throws RemoteException, IllegalUpdateException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.addTaxForm(t, taxFormText);
    }

    /**
     * Adds a user tax form.
     *
     * @param   t The user tax form to add.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some other problem updating the data
     */
    public void addUserTaxForm(TaxForm t) throws RemoteException, SQLException {
        PactsServices ps = getEjbHandle();
        ps.addUserTaxForm(t);
    }

    /**
     * Adds the specified note to the database, and also adds a cross-reference
     * attaching the note to the specified object.
     *
     * @param   objectId The ID of the object with which to associate the new note.
     * @param   objectType The type of the object with which to associate the new note.
     * Must be a type defined in <tt>PactsConstants.java</tt> and must be an object that
     * can have associated notes.
     * @param   taxFormUserId If the object is a tax form, the user ID of
     * the tax form.  This parameter is otherwise disregarded.
     * @param   n Data for the new note.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  IllegalArgumentException If the specified object type does not exist or does
     * not allow notes.
     * @throws  SQLException If the specified object does not exist or if there is some other
     * problem updating the data
     * @return  The new note's ID.
     */
    public long addObjectNote(long objectId, int objectType, long taxFormUserId, Note n)
            throws RemoteException, SQLException {
        if (!objectTypeHasNotes(objectType))
            throw new IllegalArgumentException("Object type " + objectType +
                    " does not exist or does not have notes");
        PactsServices ps = getEjbHandle();
        return ps.addObjectNote(objectId, objectType, taxFormUserId, n);
    }

    /**
     * Adds a cross-reference attaching the specified note to the specified object.
     *
     * @param   objectId The ID of the object with which to associate the note.
     * @param   objectType The type of the object with which to associate the note.
     * Must be a type defined in <tt>PactsConstants.java</tt> and must allow notes.
     * @param   taxFormUserId If the object is a tax form, the user ID of
     * the tax form.  This parameter is otherwise disregarded.
     * @param   noteId The ID of the note to attach.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  IllegalArgumentException If the specified object type is invalid or does
     * not allow notes.
     * @throws  SQLException If there is some other problem updating the data
     */
    public void addObjectNoteLink(long objectId, int objectType, long taxFormUserId, long noteId)
            throws RemoteException, SQLException {
        if (!objectTypeHasNotes(objectType))
            throw new IllegalArgumentException("Object type " + objectType +
                    " does not exist or does not have notes");
        PactsServices ps = getEjbHandle();
        ps.addObjectNoteLink(objectId, objectType, taxFormUserId, noteId);
    }

    /*****************************************************
     * Data update functions - updates
     *****************************************************/

    /**
     * Affirms the specified affidavit.
     *
     * @param   affidavitId The ID of the affidavit to affirm.
     * @param   finalText The finalized affidavit text
     * @param   coderBirthDate The birth date of the coder
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  NoObjectFoundException If the specified affidavit does not exist.
     * @throws  IllegalUpdateException If the affidavit has expired or has already
     * been affirmed.
     * @throws  SQLException If there is some other problem updating the data
     */
    public void affirmAffidavit(long affidavitId, String finalText, String coderBirthDate)
            throws RemoteException, NoObjectFoundException, IllegalUpdateException, SQLException {
        PactsServices ps = getEjbHandle();
        ps.affirmAffidavit(affidavitId, finalText, coderBirthDate);
    }

    /**
     * Updates the given affidavit (excluding text updates and affirmations).
     *
     * @param   a The updated affidavit information
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  NoObjectFoundException If the specified object does not exist.
     * @throws  SQLException If there is some problem updating the data
     */
    public void updateAffidavit(Affidavit a) throws RemoteException, NoObjectFoundException, SQLException {
        PactsServices ps = getEjbHandle();
        ps.updateAffidavit(a);
    }

    /**
     * Updates the given contract (excluding text updates).
     *
     * @param   c The updated affidavit information
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  NoObjectFoundException If the specified object does not exist.
     * @throws  SQLException If there is some problem updating the data
     */
    public void updateContract(Contract c) throws RemoteException, NoObjectFoundException, SQLException {
        PactsServices ps = getEjbHandle();
        ps.updateContract(c);
    }

    /**
     * Updates the given payment.  This process creates a new payment detail record, and also
     * a new payment address record if the payment status is "Ready to Print".  It will throw an
     * IllegalUpdateException if the payment's status is "Printed" or "Paid" - these status
     * updates are done automatically by the system.
     *
     * @param   p The updated payment information
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  NoObjectFoundException If the specified object does not exist.
     * @throws  IllegalUpdateException If the user tried to make an update that is not allowed.
     * @throws  PaymentPaidException If the payment has already been paid.
     * @throws  SQLException If there is some problem updating the data
     */
    public void updatePayment(Payment p)
            throws RemoteException, NoObjectFoundException, IllegalUpdateException, PaymentPaidException, SQLException {
        PactsServices ps = getEjbHandle();
        ps.updatePayment(p);
    }

    /**
     * Updates the given tax form (excluding text updates).
     *
     * @param   t The updated tax form information
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  NoObjectFoundException If the specified object does not exist.
     * @throws  IllegalUpdateException If the user is trying to make an update that is not allowed.
     * @throws  SQLException If there is some problem updating the data
     */
    public void updateTaxForm(TaxForm t) throws RemoteException, NoObjectFoundException, IllegalUpdateException, SQLException {
        PactsServices ps = getEjbHandle();
        ps.updateTaxForm(t);
    }

    /**
     * Updates the given user tax form (user_tax_form_xref table only;
     * to update data in tax_form, use <tt>updateTaxForm()</tt>)
     *
     * @param   t The updated tax form information
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  NoObjectFoundException If the specified object does not exist.
     * @throws  IllegalUpdateException If the user is trying to make an update that is not allowed.
     * @throws  SQLException If there is some problem updating the data
     */
    public void updateUserTaxForm(TaxForm t) throws RemoteException, NoObjectFoundException, IllegalUpdateException, SQLException {
        PactsServices ps = getEjbHandle();
        ps.updateUserTaxForm(t);
    }

    /**
     * Updates the text for the given contract or tax form.
     *
     * @param   objectId The object ID to update
     * @param   objectType The object type to update
     * @param   newText The updated text
     * @throws  IllegalArgumentException If the specified object type does not exist or does not
     * have updatable text.
     * @throws  NoObjectFoundException If the specified object does not exist.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some other problem updating the data
     */
    public void updateText(long objectId, int objectType, String newText)
            throws NoObjectFoundException, RemoteException, SQLException {
        if (!objectTypeHasUpdatableText(objectType))
            throw new IllegalArgumentException("Object type " + objectType +
                    " does not exist or does not have updatable text");
        PactsServices ps = getEjbHandle();
        ps.updateText(objectId, objectType, newText);
    }

    /**
     * Updates the specified payments to the specified status. This function
     * should only be called by the Pacts message handler upon receipt of a message
     * passed in by the <tt>batchUpdatePaymentStatus</tt> function.
     *
     * @param   paymentId The payments to update
     * @param   statusId The new status
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some other problem updating the data
     */
    public UpdateResults doBatchUpdatePaymentStatus(long paymentId[], int statusId)
            throws RemoteException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.doBatchUpdatePaymentStatus(paymentId, statusId);
    }

    /**
     * Updates the status on all the given payments to the given status.
     * Because this is a payment modification, this process creates a new
     * detail record for each payment involved, and a new address record if
     * called with &quot;Ready to Print&quot; status.  This function should be called
     * with the &quot;Ready to Print&quot; status to ready payments for printing. <p>
     *
     * This function actually just puts a message on the JMS queue.  The message handler,
     * upon receipt of the message, will call the function <tt>doBatchUpdatePaymentStatus()</tt>
     * which performs the modifications.
     *
     * @param   paymentId The payments to update
     * @param   statusId The new status
     * @param   userId The ID of the user submitting the request
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  IllegalUpdateException If the user is attempting to update the status to Printed or Paid
     * @throws  JMSException If there is some problem putting the message on the queue
     */
    public void batchUpdatePaymentStatus(long paymentId[], int statusId, long userId)
            throws RemoteException, IllegalUpdateException, JMSException {
        PactsServices ps = getEjbHandle();
        ps.batchUpdatePaymentStatus(paymentId, statusId, userId);
    }

    /**
     * Marks the given payments as reviewed.  This function should be called if the
     * user wants to reprint payments that have already been printed, prior to the
     * reprint request.  Its purpose is to ensure that payments don't get printed
     * multiple times without good reason.
     *
     * @param   paymentId The payments to mark as reviewed.
     * @throws  NoObjectFoundException If any payment does not exist
     * @throws  IllegalUpdateException If any payment has not been printed
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some other problem updating the data
     */
    public void reviewPayments(long paymentId[])
            throws RemoteException, NoObjectFoundException, IllegalUpdateException, SQLException {
        PactsServices ps = getEjbHandle();
        ps.reviewPayments(paymentId);
    }

    /**
     * Marks the given payments as paid.  Specifically, for each payment, this function
     * searches through all its detail records, and marks the most recent record with a
     * status of "Printed" as having been paid - this is done by changing the status to
     * "Paid" and filling in the date_paid field with the current date and time.  This method
     * will throw an IllegalUpdateException if it finds any of the given payments has already
     * been paid or lacks a detail record with the status of "Printed".
     *
     * @param   paymentId The payments to update
     * @throws  NoObjectFoundException If any payment does not exist
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  IllegalUpdateException If any payment could not be marked as paid
     * @throws  SQLException If there is some other problem updating the data
     */
    public void markPaymentsPaid(long paymentId[])
            throws RemoteException, NoObjectFoundException, IllegalUpdateException, SQLException {
        PactsServices ps = getEjbHandle();
        ps.markPaymentsPaid(paymentId);
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
     * @param   userId The user ID to check.
     * @param   affidavitTypeId The type of the affidavit.
     * @return  Whether or not the user can affirm an affidavit.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  SQLException If there is some problem querying the database
     */
    public boolean canAffirmAffidavit(long userId, int affidavitTypeId) throws RemoteException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.canAffirmAffidavit(userId, affidavitTypeId);
    }

    /**
     * Prints the payments that have status of "Ready to Print" to an external location.
     * For each payment, updates the status to "Printed", updates the print count, sets
     * the review field to zero, and sets the date printed to the current date and time.
     * The payment information, and the separate payee or "vendor" information, are returned
     * in a two-element string array, the payment information coming first.
     *
     * @return  The payment and vendor information in String form
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws  PaymentNotReviewedException If any of the payments to print has been
     * previously printed and not subsequently reviewed
     * @throws  SQLException If there is some problem updating the database
     */
    public String[] printPayments() throws RemoteException, PaymentNotReviewedException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.printPayments();
    }


    /**
     * Generates all the affidavits and payments for the people who won
     * money in the given contest round.  Returns the number of
     * affidavit/payment pairs generated.
     *
     * @param roundId The ID of the round
     * @param makeChanges If true, updates the database; if false, logs
     * the changes that would have been made had this parameter been true.
     * @return The number of affidavit/payment pairs generated.
     * @throws  RemoteException If there is some communication problem with the EJB
     * @throws IllegalUpdateException If the affidavit/payment information
     * has already been generated for this round.
     * @throws SQLException If there was some error updating the data.
     */
    public int generateRoundPayments(long roundId, boolean makeChanges)
            throws RemoteException, IllegalUpdateException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.generateRoundPayments(roundId, makeChanges);
    }

    public int generateRoundPayments(long roundId, int affidavitTypeId, boolean makeChanges)
            throws RemoteException, IllegalUpdateException, SQLException {
        PactsServices ps = getEjbHandle();
        return ps.generateRoundPayments(roundId, affidavitTypeId, makeChanges);
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
        PactsServices ps = getEjbHandle();
        return ps.expireOldAffidavits();
    }
}

