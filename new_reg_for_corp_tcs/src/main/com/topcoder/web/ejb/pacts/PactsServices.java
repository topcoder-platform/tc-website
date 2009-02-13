package com.topcoder.web.ejb.pacts;

import com.topcoder.web.tc.controller.legacy.pacts.common.*;

import javax.ejb.EJBObject;
import javax.jms.JMSException;
import java.rmi.RemoteException;
import java.sql.SQLException;
import java.util.Map;

/**
 * The remote interface for the PACTS EJB.  See the <tt>PactsServicesBean</tt>
 * or <tt>DataInterfaceBean</tt> classes for API details.
 *
 * @author  Dave Pecora
 * @version 1.00, 03/06/2002
 *
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

    Map getModificationRationales() throws RemoteException, SQLException;

    Map getStatusCodes() throws RemoteException, SQLException;

    Map getStatusCodes(int objectType) throws RemoteException, SQLException;

    Map getUserTypes() throws RemoteException, SQLException;

    Map getRounds() throws RemoteException, SQLException;

    Map getDemographicData(long userId) throws RemoteException, SQLException;

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
    long addAffidavit(Affidavit a, String affidavitText)
            throws RemoteException, IllegalUpdateException, SQLException;

    long addAffidavit(Affidavit a, String affidavitText, Payment p)
            throws RemoteException, IllegalUpdateException, SQLException;

    long addContract(Contract c, String contractText) throws RemoteException, SQLException;

    long addPayment(Payment p) throws RemoteException, IllegalUpdateException, SQLException;

    long addContractPayment(long contractId, Payment p)
            throws RemoteException, IllegalUpdateException, SQLException;

    long addTaxForm(TaxForm t, String taxFormText)
            throws RemoteException, IllegalUpdateException, SQLException;

    void addUserTaxForm(TaxForm t) throws RemoteException, SQLException;

    long addObjectNote(long objectId, int objectType, long taxFormUserId, Note n)
            throws RemoteException, SQLException;

    void addObjectNoteLink(long objectId, int objectType, long taxFormUserId, long noteId)
            throws RemoteException, SQLException;

    // Updates
    void affirmAffidavit(long affidavitId, String finalText, String coderBirthDate)
            throws RemoteException, NoObjectFoundException, IllegalUpdateException, SQLException;

    void updateAffidavit(Affidavit a) throws RemoteException, NoObjectFoundException, SQLException;

    void updateContract(Contract c) throws RemoteException, NoObjectFoundException, SQLException;

    void updatePayment(Payment p)
            throws RemoteException, NoObjectFoundException, IllegalUpdateException, PaymentPaidException, SQLException;

    void updateTaxForm(TaxForm t)
            throws RemoteException, NoObjectFoundException, IllegalUpdateException, SQLException;

    void updateUserTaxForm(TaxForm t)
            throws RemoteException, NoObjectFoundException, IllegalUpdateException, SQLException;

    void updateText(long objectId, int objectType, String newText)
            throws RemoteException, NoObjectFoundException, SQLException;

    // Special payment update routines
    void batchUpdatePaymentStatus(long paymentId[], int statusId, long userId)
            throws RemoteException, IllegalUpdateException, JMSException;

    UpdateResults doBatchUpdatePaymentStatus(long paymentId[], int statusId)
            throws RemoteException, SQLException;

    void reviewPayments(long paymentId[])
            throws RemoteException, NoObjectFoundException, IllegalUpdateException, SQLException;

    void markPaymentsPaid(long paymentId[])
            throws RemoteException, NoObjectFoundException, IllegalUpdateException, SQLException;

    // Utility routines
    boolean canAffirmAffidavit(long userId, int affidavitTypeId)
            throws RemoteException, SQLException;

    String[] printPayments() throws RemoteException, PaymentNotReviewedException, SQLException;

    int generateRoundPayments(long roundId, boolean makeChanges)
            throws IllegalUpdateException, RemoteException, SQLException;

    int generateRoundPayments(long roundId, int affidavitTypeId, boolean makeChanges)
            throws IllegalUpdateException, RemoteException, SQLException;

    int expireOldAffidavits() throws RemoteException, SQLException;

    void createAffidavitTemplate(int affidavitTypeId, String text) throws RemoteException, SQLException;

    boolean hasNotarizedAffidavit(long userId, int affidavitTypeId) throws RemoteException, SQLException;

    boolean hasAllDemographicAnswers(long userId) throws RemoteException, SQLException;

    boolean hasTaxForm(long userId) throws RemoteException, SQLException;

    Payment getEmptyPayment(long userId) throws RemoteException, SQLException;


}

