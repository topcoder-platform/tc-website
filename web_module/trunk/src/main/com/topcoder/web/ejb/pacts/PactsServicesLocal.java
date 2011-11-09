package com.topcoder.web.ejb.pacts;

import java.rmi.RemoteException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.ejb.EJBLocalObject;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocument;
import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocumentTemplate;
import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocumentType;
import com.topcoder.web.ejb.pacts.payments.BasePaymentStatus;
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
 * The local interface for the PACTS EJB.  See the <tt>PactsServicesBean</tt>
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

public interface PactsServicesLocal extends EJBLocalObject {
    // Object retrieval
    Map getAffidavit(long affidavitId) throws SQLException;

    Map getContract(long contractId) throws SQLException;

    Map getNote(long noteId) throws SQLException;

    Map getPayment(long paymentId) throws SQLException;

    Map getPaymentAuditTrail(long paymentId) throws SQLException;

    Map getUserProfile(long userId) throws SQLException;

    Map getUserProfileHeader(long userId) throws SQLException;

    Map getTaxForm(long taxFormId) throws SQLException;

    Map getUserTaxForm(long userId, long taxFormId) throws SQLException;

    // Subobject retrieval
    Map getUserAffidavitList(long userId) throws SQLException;

    Map getUserContractList(long userId) throws SQLException;

    Map getUserPaymentList(long userId) throws SQLException;

    Map getUserPaymentDetailsList(long userId, int[] paymentTypes, boolean pendingOnly) throws SQLException;

    Map getUserTaxFormList(long userId) throws SQLException;

    Map getNoteList(long objectId, int objectType, long taxFormUserId)
            throws SQLException;

    Map getContractPaymentList(long contractId) throws SQLException;

    Map getText(long objectId, int objectType)
            throws SQLException;

    // Type listings and other miscellaneous retrieval
    Map getAffidavitTypes() throws SQLException;

    List<AssignmentDocumentType> getAssignmentDocumentTypes() throws SQLException;

    List getAssignmentDocumentStatus() throws SQLException;

    Map getContractTypes() throws SQLException;

    Map getNoteTypes() throws SQLException;

    Map getPaymentTypes() throws SQLException;

    Map getPaymentMethods() throws SQLException;

    Map getProjectTerminationStatusTypes() throws SQLException;

    Map getModificationRationales() throws SQLException;

    Map getStatusCodes() throws SQLException;

    Map getStatusCodes(int objectType) throws SQLException;

    Map getUserTypes() throws SQLException;

    Map getRounds() throws SQLException;

    Map getDemographicData(long userId) throws SQLException;

    Map getPaymentComponentData(long[] paymentIds) throws SQLException;

    Map getCreationDates(long[] paymentIds) throws SQLException;

    // Search routines
    Map findAffidavits(Map searchCriteria) throws SQLException;

    Map findContracts(Map searchCriteria) throws SQLException;

    Map findNoteObjects(long noteId) throws SQLException;

    Map findNotes(Map searchCriteria) throws SQLException;

    Map findPayments(Map searchCriteria) throws SQLException;

    Map findTaxForms(Map searchCriteria) throws SQLException;

    Map findUserTaxForms(Map searchCriteria) throws SQLException;

    Map findUsers(Map searchCriteria) throws SQLException;

    long addAffidavit(Affidavit a, String affidavitText, Payment p)
            throws IllegalUpdateException, SQLException;

    long addContract(Contract c, String contractText) throws SQLException;

    long addTaxForm(TaxForm t, String taxFormText)
            throws IllegalUpdateException, SQLException;

    void addUserTaxForm(TaxForm t) throws  SQLException, EventFailureException;

    long addObjectNote(long objectId, int objectType, long taxFormUserId, Note n)
            throws SQLException;

    void addObjectNoteLink(long objectId, int objectType, long taxFormUserId, long noteId)
            throws SQLException;

    // Updates
    void affirmAffidavit(long affidavitId, String finalText, String coderBirthDate)
            throws NoObjectFoundException, IllegalUpdateException, SQLException;

    void updateAffidavit(Affidavit a) throws NoObjectFoundException, SQLException;

    void updateContract(Contract c) throws NoObjectFoundException, SQLException;

    void updateTaxForm(TaxForm t)
            throws NoObjectFoundException, IllegalUpdateException, SQLException;

    void updateUserTaxForm(TaxForm t)
            throws NoObjectFoundException, IllegalUpdateException, SQLException;

    void updateText(long objectId, int objectType, String newText)
            throws NoObjectFoundException, SQLException;

    // Utility routines
    boolean canAffirmAffidavit(long userId, int affidavitTypeId)
            throws SQLException;

    int generateRoundPayments(long roundId, boolean makeChanges)
            throws IllegalUpdateException, SQLException;

    int generateRoundPayments(long roundId, boolean makeChanges, int paymentTypeI)
            throws IllegalUpdateException, SQLException;

    int generateRoundPayments(long roundId, int affidavitTypeId, boolean makeChanges, int paymentTypeId)
            throws IllegalUpdateException, SQLException;

    /**
     * Generates the payments for Online Review projects.
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
     * @param resourceIds the resource ids list to populate
     * @return the list of component payments.
     * @throws IllegalUpdateException if it is illegal to update.
     * @throws SQLException if any sql error occurs.
     * @throws EventFailureException if any error occurs.
     */
    List generateComponentPayments(long projectId, long status, String client, List resourceIds)
        throws IllegalUpdateException, SQLException, EventFailureException;

    List generateComponentUserPayments(long coderId, double grossAmount, String client, long projectId, int placed)
        throws SQLException, EventFailureException;

    /**
     * Adds online review payments in persistence.
     *
     * @param payments the review payments
     * @param resourceIds the resource ids to update the payment status.
     * @return the online review payments.
     * @throws SQLException if any sql error occurs.
     * @since Online Review Payments and Status Automation Assembly 1.0
     */
    List addOnlineReviewPayments(List payments, List resourceIds) throws SQLException;

    int expireOldPayments() throws SQLException;

    int expireOldAffidavits() throws SQLException;

    int expireOldAssignmentDocuments() throws SQLException;

    int checkInactiveCoders(long userId) throws SQLException;

    void createAffidavitTemplate(int affidavitTypeId, String text) throws  SQLException;

    void createAssignmentDocumentTemplate(int assignmentdocumentTypeId, String text, String name);

    public List<AssignmentDocumentTemplate> getAssignmentDocumentTemplate(long assignmentDocumentTypeId, boolean onlyCurrent);

    boolean hasNotarizedAffidavit(long userId, int affidavitTypeId) throws SQLException;

    boolean hasAllDemographicAnswers(long userId) throws SQLException;

    int requiresClient(int paymentTypeId) throws SQLException;

    boolean requiresGlobalAD(int paymentTypeId) throws SQLException;

    boolean hasTaxForm(long userId) throws SQLException;

    boolean hasGlobalAD(long userId) throws SQLException;

    public long getGlobalADId(long userId) throws SQLException;

    Payment getEmptyPayment(long userId) throws SQLException;

    Map findRounds(String search, int[] roundTypes) throws SQLException;

    Map findProblems(String name) throws SQLException;

    Map findProjects(String search) throws SQLException;

    Map findProjects(String search, int categoryId) throws SQLException;

    Map findPaymentsByDescription(String search) throws SQLException;

    Map getDigitalRunSeasonList() throws SQLException;

    Map getDigitalRunStageList() throws SQLException;

    Map getDigitalRunTrackList() throws SQLException;

    Map findComponentContests(String search) throws SQLException;

    Map findStudioContests(String search) throws SQLException;

    ResultSetContainer getAffidavitHistory(long userId, boolean pendingOnly, int sortColumn, boolean sortAscending) throws SQLException;

    // ================== Methods from the Client Service ==================

    BasePayment addPayment(BasePayment payment) throws SQLException;

    List addPayments(List payments) throws SQLException;

    BasePayment updatePayment(BasePayment payment) throws  Exception;

    BasePayment updatePayment(BasePayment payment, boolean supervisor) throws  Exception;

    List findPayments(int paymentTypeId) throws  SQLException, InvalidStatusException;

    List findPayments(int paymentTypeId, long referenceId) throws  SQLException, InvalidStatusException;

    List findCoderPayments(long coderId) throws  SQLException, InvalidStatusException;

    List findCoderPayments(long coderId, int paymentTypeId, long referenceId) throws Exception, InvalidStatusException;

    List findCoderPayments(long coderId, int paymentTypeId) throws  SQLException, InvalidStatusException;

    BasePayment getBasePayment(long paymentId) throws  SQLException, InvalidStatusException;

    BasePayment fillPaymentData(BasePayment payment) throws SQLException;

    double computePaymentNetAmount(int paymentTypeId, double grossAmount, long coderId) throws SQLException;

    AssignmentDocument getAssignmentDocument(long assignmentDocumentId);

    List getAssignmentDocumentByProjectId(long projectId);

    void deleteAssignmentDocument(AssignmentDocument ad) throws DeleteAffirmedAssignmentDocumentException;

    AssignmentDocument addAssignmentDocument(AssignmentDocument ad, Long assignmentDocumentTemplateId) throws DeleteAffirmedAssignmentDocumentException;

    AssignmentDocument addAssignmentDocument(AssignmentDocument ad) throws DeleteAffirmedAssignmentDocumentException;

    List findAssignmentDocument(Map searchCriteria);

    List getAssignmentDocumentByUserId(long userId, long assignmentDocumentTypeId, boolean onlyPending);

    String getAssignmentDocumentTransformedText(long assignmentDocumentTypeId, AssignmentDocument ad);

    List getAssignmentDocumentByUserIdProjectId(long userId, long projectId);

    List getAssignmentDocumentByUserIdStudioContestId(long studioContestId, long projectId);

    Boolean hasHardCopyAssignmentDocumentByUserId(long userId, long assignmentDocumentTypeId);

    void affirmAssignmentDocument(AssignmentDocument ad);

    List<BasePaymentStatus> getPaymentStatusList() throws SQLException;

    boolean hasAffirmedAssignmentDocument(long paymentTypeId, long coderId, long contestId);

    public List<BasePayment> findCoderPayments(Map searchCriteria);

    public double getUserAccrualThreshold(long userId) throws SQLException;

    ResultSetContainer getContestsInfo(long eid) throws SQLException;

    public double getUserAccruingPaymentsTotal(long userId) throws SQLException;

    public void saveUserAccrualThreshold(long userId, double newAccrualAmount);

    public String getUserPaymentMethod(long userId) throws SQLException;

    public void saveUserPaymentMethod(long userId, String paymentMethod);

    public Map<Long, BasePaymentStatus> getPaymentStatusMap() throws SQLException;

    public Map<Long, String> newPaymentEvent(String[] paymentIDs, int event, String value);
}

