package com.topcoder.web.ejb.pacts;

import java.rmi.RemoteException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.ejb.EJBLocalObject;
import javax.jms.JMSException;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.model.AssignmentDocument;
import com.topcoder.web.common.model.AssignmentDocumentTemplate;
import com.topcoder.web.tc.controller.legacy.pacts.common.Affidavit;
import com.topcoder.web.tc.controller.legacy.pacts.common.Contract;
import com.topcoder.web.tc.controller.legacy.pacts.common.IllegalUpdateException;
import com.topcoder.web.tc.controller.legacy.pacts.common.NoObjectFoundException;
import com.topcoder.web.tc.controller.legacy.pacts.common.Note;
import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;
import com.topcoder.web.tc.controller.legacy.pacts.common.PaymentNotReviewedException;
import com.topcoder.web.tc.controller.legacy.pacts.common.PaymentPaidException;
import com.topcoder.web.tc.controller.legacy.pacts.common.TaxForm;
import com.topcoder.web.tc.controller.legacy.pacts.common.UpdateResults;

/**
 * The local interface for the PACTS EJB.  See the <tt>PactsServicesBean</tt>
 * or <tt>DataInterfaceBean</tt> classes for API details.
 *
 * @author  Dave Pecora
 * @version 1.00, 03/06/2002
 *
 * @see PactsServicesBean
 * @see com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean
 */

public interface PactsServicesLocal extends EJBLocalObject {
    // Object retrieval
    Map getAffidavit(long affidavitId) throws  SQLException;

    Map getContract(long contractId) throws  SQLException;

    Map getNote(long noteId) throws  SQLException;

    Map getPayment(long paymentId) throws  SQLException;

    Map getPaymentAuditTrail(long paymentId) throws  SQLException;

    Map getUserProfile(long userId) throws  SQLException;

    Map getUserProfileHeader(long userId) throws  SQLException;

    Map getTaxForm(long taxFormId) throws  SQLException;

    Map getUserTaxForm(long userId, long taxFormId) throws  SQLException;

    // Subobject retrieval
    Map getUserAffidavitList(long userId) throws  SQLException;

    Map getUserContractList(long userId) throws  SQLException;

    Map getUserPaymentList(long userId) throws  SQLException;

    Map getUserPaymentDetailsList(long userId, int[] paymentTypes, boolean pendingOnly) throws  SQLException;

    Map getUserTaxFormList(long userId) throws  SQLException;

    Map getNoteList(long objectId, int objectType, long taxFormUserId)
            throws  SQLException;

    Map getContractPaymentList(long contractId) throws  SQLException;

    Map getText(long objectId, int objectType)
            throws  SQLException;

    // Type listings and other miscellaneous retrieval
    Map getAffidavitTypes() throws  SQLException;

    List getAssignmentDocumentTypes() throws  SQLException;

    List getAssignmentDocumentStatus() throws  SQLException;

    Map getContractTypes() throws  SQLException;

    Map getNoteTypes() throws  SQLException;

    Map getPaymentTypes() throws  SQLException;

    Map getPaymentMethods() throws  SQLException;

    Map getProjectTerminationStatusTypes() throws  SQLException;

    Map getModificationRationales() throws  SQLException;

    Map getStatusCodes() throws  SQLException;

    Map getStatusCodes(int objectType) throws  SQLException;

    Map getUserTypes() throws  SQLException;

    Map getRounds() throws  SQLException;

    Map getDemographicData(long userId) throws  SQLException;

    Map getPaymentComponentData(long[] paymentIds) throws  SQLException;

    Map getCreationDates(long[] paymentIds) throws  SQLException;

    // Search routines
    Map findAffidavits(Map searchCriteria) throws  SQLException;

    Map findContracts(Map searchCriteria) throws  SQLException;

    Map findNoteObjects(long noteId) throws  SQLException;

    Map findNotes(Map searchCriteria) throws  SQLException;

    Map findPayments(Map searchCriteria) throws  SQLException;

    Map findTaxForms(Map searchCriteria) throws  SQLException;

    Map findUserTaxForms(Map searchCriteria) throws  SQLException;

    Map findUsers(Map searchCriteria) throws  SQLException;

    // Data update routines
    // Additions
    long addAffidavit(Affidavit a, String affidavitText)
            throws  IllegalUpdateException, SQLException;

    long addAffidavit(Affidavit a, String affidavitText, Payment p)
            throws  IllegalUpdateException, SQLException;

    long addContract(Contract c, String contractText) throws  SQLException;

    long addPayment(Payment p) throws  IllegalUpdateException, SQLException;
    
    long addPayment(Payment p, boolean payReferrer) throws  IllegalUpdateException, SQLException;

    long addContractPayment(long contractId, Payment p)
            throws  IllegalUpdateException, SQLException;

    long addTaxForm(TaxForm t, String taxFormText)
            throws  IllegalUpdateException, SQLException;

    void addUserTaxForm(TaxForm t) throws  SQLException;

    long addObjectNote(long objectId, int objectType, long taxFormUserId, Note n)
            throws  SQLException;

    void addObjectNoteLink(long objectId, int objectType, long taxFormUserId, long noteId)
            throws  SQLException;

    // Updates
    void affirmAffidavit(long affidavitId, String finalText, String coderBirthDate)
            throws  NoObjectFoundException, IllegalUpdateException, SQLException;

    void updateAffidavit(Affidavit a) throws  NoObjectFoundException, SQLException;

    void updateContract(Contract c) throws  NoObjectFoundException, SQLException;

    void updatePayment(Payment p)
            throws  NoObjectFoundException, IllegalUpdateException, PaymentPaidException, SQLException;

    void updateTaxForm(TaxForm t)
            throws  NoObjectFoundException, IllegalUpdateException, SQLException;

    void updateUserTaxForm(TaxForm t)
            throws  NoObjectFoundException, IllegalUpdateException, SQLException;

    void updateText(long objectId, int objectType, String newText)
            throws  NoObjectFoundException, SQLException;

    // Special payment update routines
    void batchUpdatePaymentStatus(long paymentId[], int statusId, long userId)
            throws  IllegalUpdateException, JMSException;

    UpdateResults doBatchUpdatePaymentStatus(long paymentId[], int statusId)
            throws  SQLException;

    void reviewPayments(long paymentId[])
            throws  NoObjectFoundException, IllegalUpdateException, SQLException;

    // Utility routines
    boolean canAffirmAffidavit(long userId, int affidavitTypeId)
            throws  SQLException;

    String[] printPayments() throws  PaymentNotReviewedException, SQLException;

    int generateRoundPayments(long roundId, boolean makeChanges)
            throws IllegalUpdateException,  SQLException;

    int generateRoundPayments(long roundId, boolean makeChanges, int paymentTypeI)
    		throws IllegalUpdateException,  SQLException;

    int generateRoundPayments(long roundId, int affidavitTypeId, boolean makeChanges)
            throws IllegalUpdateException,  SQLException;

    int generateRoundPayments(long roundId, int affidavitTypeId, boolean makeChanges, int paymentTypeId)
    	throws IllegalUpdateException,  SQLException;

    List generateComponentPayments(long projectId, long status, String client)
            throws IllegalUpdateException,  SQLException;

    List generateComponentPayments(long projectId, long status, String client, long devSupportCoderId)
    		throws IllegalUpdateException,  SQLException;

    List generateComponentUserPayments(long coderId, double grossAmount, String client, long projectId, int placed) throws SQLException;

    List generateComponentUserPayments(long coderId, double grossAmount, String client, long projectId, int placed, long devSupportCoderId) throws SQLException;

    int expireOldPayments() throws  SQLException;

    int expireOldAffidavits() throws  SQLException;

    int expireOldAssignmentDocuments() throws  SQLException;

    void createAffidavitTemplate(int affidavitTypeId, String text) throws  SQLException;

    void createAssignmentDocumentTemplate(int assignmentdocumentTypeId, String text);

    boolean hasNotarizedAffidavit(long userId, int affidavitTypeId) throws  SQLException;

    boolean hasAllDemographicAnswers(long userId) throws  SQLException;

    boolean hasTaxForm(long userId) throws  SQLException;

    Payment getEmptyPayment(long userId) throws  SQLException;

    Map findRounds(String search, int[] roundTypes) throws  SQLException;

    Map findProblems(String name) throws  SQLException;

    Map findProjects(String search) throws  SQLException;

    Map findPaymentsByDescription(String search) throws  SQLException;
    
    Map getDigitalRunSeasonList() throws  SQLException;

    Map getDigitalRunStageList() throws  SQLException;

    Map findComponentContests(String search) throws  SQLException;

    Map findStudioContests(String search) throws  SQLException;
    
    ResultSetContainer getPaymentHistory(long userId, boolean pendingOnly, int sortColumn, boolean sortAscending) throws   SQLException;
    
    ResultSetContainer getAffidavitHistory(long userId, boolean pendingOnly, int sortColumn, boolean sortAscending) throws   SQLException;
    
    // ================== Methods from the Client Service ================== 
    
    BasePayment addPayment(BasePayment payment)  throws SQLException;
    
    List addPayments(List payments) throws SQLException;
    
    BasePayment updatePayment(BasePayment payment) throws  Exception;

    List findPayments(int paymentTypeId) throws  SQLException;

    List findPayments(int paymentTypeId, long referenceId) throws  SQLException;

    List findCoderPayments(long coderId) throws  SQLException;

    List findCoderPayments(long coderId, int paymentTypeId) throws  SQLException;

    List findCoderPayments(long coderId, int paymentTypeId, long referenceId) throws  SQLException;
    
    BasePayment getBasePayment(long paymentId) throws  SQLException;
    
    void deletePayment(long paymentId) throws  SQLException;

    void deletePayment(BasePayment payment) throws  SQLException;

    BasePayment fillPaymentData(BasePayment payment) throws  SQLException;

    AssignmentDocument getAssignmentDocument(long assignmentDocumentId);

    List getAssignmentDocumentByProjectId(long projectId);

    void deleteAssignmentDocument(AssignmentDocument ad) throws DeleteAffirmedAssignmentDocumentException;

    AssignmentDocument addAssignmentDocument(AssignmentDocument ad) throws DeleteAffirmedAssignmentDocumentException;

    List findAssignmentDocument(Map searchCriteria);

    List getAssignmentDocumentByUserId(long userId, long assignmentDocumentTypeId, boolean onlyPending);

    String getAssignmentDocumentTransformedText(long assignmentDocumentTypeId, AssignmentDocument ad);
    
    List getAssignmentDocumentByUserIdProjectId(long userId,  long projectId);
    
    List getAssignmentDocumentByUserIdStudioContestId(long studioContestId,  long projectId);

    Boolean hasHardCopyAssignmentDocumentByProjectId(long userId, long assignmentDocumentTypeId);

    void affirmAssignmentDocument(AssignmentDocument ad);

    void rejectAssignmentDocument(AssignmentDocument ad);

}

