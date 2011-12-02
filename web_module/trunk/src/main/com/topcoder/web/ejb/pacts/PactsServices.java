package com.topcoder.web.ejb.pacts;

import java.rmi.RemoteException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.ejb.EJBObject;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocument;
import com.topcoder.web.ejb.pacts.payments.EventFailureException;
import com.topcoder.web.ejb.pacts.payments.InvalidStatusException;
import com.topcoder.web.tc.controller.legacy.pacts.common.Affidavit;
import com.topcoder.web.tc.controller.legacy.pacts.common.Contract;
import com.topcoder.web.tc.controller.legacy.pacts.common.IllegalUpdateException;
import com.topcoder.web.tc.controller.legacy.pacts.common.NoObjectFoundException;
import com.topcoder.web.tc.controller.legacy.pacts.common.Note;
import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;
import com.topcoder.web.tc.controller.legacy.pacts.common.TaxForm;

/**
 * The remote interface for the PACTS EJB.  See the <tt>PactsServicesBean</tt>
 * or <tt>DataInterfaceBean</tt> classes for API details.
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
 * @see PactsServicesBean
 * @see com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean
 */

public interface PactsServices extends EJBObject {
    // Object retrieval
    Map getAffidavit(long affidavitId) throws RemoteException, SQLException;

    Map getContract(long contractId) throws RemoteException, SQLException;

    Map getNote(long noteId) throws RemoteException, SQLException;

    Map getPayment(long paymentId) throws RemoteException, SQLException;

    Map getPaymentAuditTrail(long paymentId) throws RemoteException, SQLException;

    Map getUserProfile(long userId) throws RemoteException, SQLException;

    Map getUserProfileHeader(long userId) throws RemoteException, SQLException;

    Map getTaxForm(long taxFormId) throws RemoteException, SQLException;

    Map getUserTaxForm(long userId, long taxFormId) throws RemoteException, SQLException;

    // Subobject retrieval
    Map getUserAffidavitList(long userId) throws RemoteException, SQLException;

    Map getUserContractList(long userId) throws RemoteException, SQLException;

    Map getUserPaymentList(long userId) throws RemoteException, SQLException;

    Map getUserPaymentDetailsList(long userId, int[] paymentTypes, boolean pendingOnly) throws RemoteException, SQLException;

    Map getUserTaxFormList(long userId) throws RemoteException, SQLException;

    Map getNoteList(long objectId, int objectType, long taxFormUserId)
            throws RemoteException, SQLException;

    Map getContractPaymentList(long contractId) throws RemoteException, SQLException;

    Map getText(long objectId, int objectType)
            throws RemoteException, SQLException;

    // Type listings and other miscellaneous retrieval
    Map getAffidavitTypes() throws RemoteException, SQLException;

    Map getContractTypes() throws RemoteException, SQLException;

    Map getNoteTypes() throws RemoteException, SQLException;

    Map getPaymentTypes() throws RemoteException, SQLException;

    Map getPaymentMethods() throws RemoteException, SQLException;

    Map getProjectTerminationStatusTypes() throws RemoteException, SQLException;

    Map getModificationRationales() throws RemoteException, SQLException;

    Map getStatusCodes() throws RemoteException, SQLException;

    Map getStatusCodes(int objectType) throws RemoteException, SQLException;

    Map getUserTypes() throws RemoteException, SQLException;

    Map getRounds() throws RemoteException, SQLException;

    Map getDemographicData(long userId) throws RemoteException, SQLException;

    Map getPaymentComponentData(long[] paymentIds) throws RemoteException, SQLException;

    Map getCreationDates(long[] paymentIds) throws RemoteException, SQLException;

    // Search routines
    Map findAffidavits(Map searchCriteria) throws RemoteException, SQLException;

    Map findContracts(Map searchCriteria) throws RemoteException, SQLException;

    Map findNoteObjects(long noteId) throws RemoteException, SQLException;

    Map findNotes(Map searchCriteria) throws RemoteException, SQLException;

    Map findPayments(Map searchCriteria) throws RemoteException, SQLException;

    Map findTaxForms(Map searchCriteria) throws RemoteException, SQLException;

    Map findUserTaxForms(Map searchCriteria) throws RemoteException, SQLException;

    Map findUsers(Map searchCriteria) throws RemoteException, SQLException;

    // Data update routines
    // Additions

    long addAffidavit(Affidavit a, String affidavitText, Payment p)
            throws RemoteException, IllegalUpdateException, SQLException;

    long addContract(Contract c, String contractText) throws RemoteException, SQLException;

    long addTaxForm(TaxForm t, String taxFormText)
            throws RemoteException, IllegalUpdateException, SQLException;

    void addUserTaxForm(TaxForm t) throws RemoteException, SQLException, EventFailureException;

    long addObjectNote(long objectId, int objectType, long taxFormUserId, Note n)
            throws RemoteException, SQLException;

    void addObjectNoteLink(long objectId, int objectType, long taxFormUserId, long noteId)
            throws RemoteException, SQLException;

    // Updates
    void affirmAffidavit(long affidavitId, String finalText, String coderBirthDate)
            throws RemoteException, NoObjectFoundException, IllegalUpdateException, SQLException;

    void updateAffidavit(Affidavit a) throws RemoteException, NoObjectFoundException, SQLException;

    void updateContract(Contract c) throws RemoteException, NoObjectFoundException, SQLException;

    void updateTaxForm(TaxForm t)
            throws RemoteException, NoObjectFoundException, IllegalUpdateException, SQLException;

    void updateUserTaxForm(TaxForm t)
            throws RemoteException, NoObjectFoundException, IllegalUpdateException, SQLException;

    void updateText(long objectId, int objectType, String newText)
            throws RemoteException, NoObjectFoundException, SQLException;

    // Utility routines
    boolean canAffirmAffidavit(long userId, int affidavitTypeId)
            throws RemoteException, SQLException;

    int generateRoundPayments(long roundId, boolean makeChanges)
            throws IllegalUpdateException, RemoteException, SQLException;

    int generateRoundPayments(long roundId, boolean makeChanges, int paymentTypeI)
            throws IllegalUpdateException, RemoteException, SQLException;

    int generateRoundPayments(long roundId, int affidavitTypeId, boolean makeChanges, int paymentTypeId)
            throws IllegalUpdateException, RemoteException, SQLException;

    /**
     * Generate payments for Online Review projects.
     * <p>
     * Version 1.6 (Online Review Payments and Status Automation Assembly 1.0) Changes Notes:
     * <ol>
     * <li>a new parameter is added to populate the related resource ids for generated component payments.</li>
     * </ol>
     * </p>
     */
    List generateComponentPayments(long projectId, long status, String client, List resourceIds)
        throws IllegalUpdateException, RemoteException, SQLException, EventFailureException;

    /**
     * Adds online review payments in persistence.
     *
     * @param payments the review payments
     * @param resourceIds the resource ids to update the payment status.
     * @return the online review payments.
     * @throws RemoteException if any error occurs.
     * @throws SQLException if any sql error occurs.
     * @since Online Review Payments and Status Automation Assembly 1.0
     */
    List addOnlineReviewPayments(List payments, List resourceIds, long operatorUserId) throws RemoteException, SQLException;

    int expireOldPayments() throws RemoteException, SQLException;

    int expireOldAffidavits() throws RemoteException, SQLException;

    void createAffidavitTemplate(int affidavitTypeId, String text) throws RemoteException, SQLException;

    boolean hasNotarizedAffidavit(long userId, int affidavitTypeId) throws RemoteException, SQLException;

    boolean hasAllDemographicAnswers(long userId) throws RemoteException, SQLException;

    boolean hasTaxForm(long userId) throws RemoteException, SQLException;

    boolean hasGlobalAD(long userId) throws RemoteException, SQLException;

    public long getGlobalADId(long userId) throws RemoteException, SQLException;

    Payment getEmptyPayment(long userId) throws RemoteException, SQLException;

    Map findRounds(String search, int[] roundTypes) throws RemoteException, SQLException;

    Map findProblems(String name) throws RemoteException, SQLException;

    Map findProjects(String search) throws RemoteException, SQLException;

    Map findProjects(String search, int categoryId) throws RemoteException, SQLException;

    Map findPaymentsByDescription(String search) throws RemoteException, SQLException;

    Map getDigitalRunSeasonList() throws RemoteException, SQLException;

    Map getDigitalRunStageList() throws RemoteException, SQLException;

    Map getDigitalRunTrackList() throws RemoteException, SQLException;

    Map findComponentContests(String search) throws RemoteException, SQLException;

    Map findStudioContests(String search) throws RemoteException, SQLException;

    ResultSetContainer getAffidavitHistory(long userId, boolean pendingOnly, int sortColumn, boolean sortAscending) throws RemoteException,  SQLException;

    // ================== Methods from the Client Service ==================

    BasePayment addPayment(BasePayment payment) throws RemoteException, SQLException;

    List addPayments(List payments) throws RemoteException, SQLException;

    BasePayment updatePayment(BasePayment payment) throws RemoteException, Exception;

    List findPayments(int paymentTypeId) throws RemoteException, Exception, InvalidStatusException;

    List findPayments(int paymentTypeId, long referenceId) throws RemoteException, Exception, InvalidStatusException;

    List findCoderPayments(long coderId) throws RemoteException, Exception, InvalidStatusException;

    List findCoderPayments(long coderId, int paymentTypeId) throws RemoteException, Exception, InvalidStatusException;

    List findCoderPayments(long coderId, int paymentTypeId, long referenceId) throws RemoteException, Exception, InvalidStatusException;

    BasePayment getBasePayment(long paymentId) throws RemoteException, SQLException, InvalidStatusException;

    BasePayment fillPaymentData(BasePayment payment) throws RemoteException, SQLException;

    double computePaymentNetAmount(int paymentTypeId, double grossAmount, long coderId) throws RemoteException, SQLException;

    void deleteAssignmentDocument(AssignmentDocument ad) throws RemoteException, DeleteAffirmedAssignmentDocumentException;

    AssignmentDocument addAssignmentDocument(AssignmentDocument ad) throws RemoteException, DeleteAffirmedAssignmentDocumentException;

    List getAssignmentDocumentByProjectId(long projectId) throws RemoteException;

    String getAssignmentDocumentTransformedText(long assignmentDocumentTypeId, AssignmentDocument ad) throws RemoteException;

    List getAssignmentDocumentByUserId(long userId, long assignmentDocumentTypeId, boolean onlyPending) throws RemoteException;

    AssignmentDocument getAssignmentDocument(long assignmentDocumentId) throws RemoteException;

    Boolean hasHardCopyAssignmentDocumentByUserId(long userId, long assignmentDocumentTypeId) throws RemoteException;

    public void affirmAssignmentDocument(AssignmentDocument ad) throws RemoteException;

    public List getAssignmentDocumentByUserIdProjectId(long userId, long projectId) throws RemoteException;

    public List getAssignmentDocumentByUserIdStudioContestId(long userId, long studioContestId) throws RemoteException;
}

