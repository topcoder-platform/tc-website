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
 * @see DataInterfaceBean
 */

public interface PactsServices extends EJBObject {
    // Object retrieval
    public Map getAffidavit(long affidavitId) throws RemoteException, SQLException;

    public Map getContract(long contractId) throws RemoteException, SQLException;

    public Map getNote(long noteId) throws RemoteException, SQLException;

    public Map getPayment(long paymentId) throws RemoteException, SQLException;

    public Map getPaymentAuditTrail(long paymentId) throws RemoteException, SQLException;

    public Map getUserProfile(long userId) throws RemoteException, SQLException;

    public Map getUserProfileHeader(long userId) throws RemoteException, SQLException;

    public Map getTaxForm(long taxFormId) throws RemoteException, SQLException;

    public Map getUserTaxForm(long userId, long taxFormId) throws RemoteException, SQLException;

    // Subobject retrieval
    public Map getUserAffidavitList(long userId) throws RemoteException, SQLException;

    public Map getUserContractList(long userId) throws RemoteException, SQLException;

    public Map getUserPaymentList(long userId) throws RemoteException, SQLException;

    public Map getUserTaxFormList(long userId) throws RemoteException, SQLException;

    public Map getNoteList(long objectId, int objectType, long taxFormUserId)
            throws RemoteException, SQLException;

    public Map getContractPaymentList(long contractId) throws RemoteException, SQLException;

    public Map getText(long objectId, int objectType)
            throws RemoteException, SQLException;

    // Type listings and other miscellaneous retrieval
    public Map getAffidavitTypes() throws RemoteException, SQLException;

    public Map getContractTypes() throws RemoteException, SQLException;

    public Map getNoteTypes() throws RemoteException, SQLException;

    public Map getPaymentTypes() throws RemoteException, SQLException;

    public Map getModificationRationales() throws RemoteException, SQLException;

    public Map getStatusCodes() throws RemoteException, SQLException;

    public Map getStatusCodes(int objectType) throws RemoteException, SQLException;

    public Map getUserTypes() throws RemoteException, SQLException;

    public Map getRounds() throws RemoteException, SQLException;

    public Map getDemographicData(long userId) throws RemoteException, SQLException;

    // Search routines
    public Map findAffidavits(Map searchCriteria) throws RemoteException, SQLException;

    public Map findContracts(Map searchCriteria) throws RemoteException, SQLException;

    public Map findNoteObjects(long noteId) throws RemoteException, SQLException;

    public Map findNotes(Map searchCriteria) throws RemoteException, SQLException;

    public Map findPayments(Map searchCriteria) throws RemoteException, SQLException;

    public Map findTaxForms(Map searchCriteria) throws RemoteException, SQLException;

    public Map findUserTaxForms(Map searchCriteria) throws RemoteException, SQLException;

    public Map findUsers(Map searchCriteria) throws RemoteException, SQLException;

    // Data update routines
    // Additions
    public long addAffidavit(Affidavit a, String affidavitText)
            throws RemoteException, IllegalUpdateException, SQLException;

    public long addAffidavit(Affidavit a, String affidavitText, Payment p)
            throws RemoteException, IllegalUpdateException, SQLException;

    public long addContract(Contract c, String contractText) throws RemoteException, SQLException;

    public long addPayment(Payment p) throws RemoteException, IllegalUpdateException, SQLException;

    public long addContractPayment(long contractId, Payment p)
            throws RemoteException, IllegalUpdateException, SQLException;

    public long addTaxForm(TaxForm t, String taxFormText)
            throws RemoteException, IllegalUpdateException, SQLException;

    public void addUserTaxForm(TaxForm t) throws RemoteException, SQLException;

    public long addObjectNote(long objectId, int objectType, long taxFormUserId, Note n)
            throws RemoteException, SQLException;

    public void addObjectNoteLink(long objectId, int objectType, long taxFormUserId, long noteId)
            throws RemoteException, SQLException;

    // Updates
    public void affirmAffidavit(long affidavitId, String finalText, String coderBirthDate)
            throws RemoteException, NoObjectFoundException, IllegalUpdateException, SQLException;

    public void updateAffidavit(Affidavit a) throws RemoteException, NoObjectFoundException, SQLException;

    public void updateContract(Contract c) throws RemoteException, NoObjectFoundException, SQLException;

    public void updatePayment(Payment p)
            throws RemoteException, NoObjectFoundException, IllegalUpdateException, PaymentPaidException, SQLException;

    public void updateTaxForm(TaxForm t)
            throws RemoteException, NoObjectFoundException, IllegalUpdateException, SQLException;

    public void updateUserTaxForm(TaxForm t)
            throws RemoteException, NoObjectFoundException, IllegalUpdateException, SQLException;

    public void updateText(long objectId, int objectType, String newText)
            throws RemoteException, NoObjectFoundException, SQLException;

    // Special payment update routines
    public void batchUpdatePaymentStatus(long paymentId[], int statusId, long userId)
            throws RemoteException, IllegalUpdateException, JMSException;

    public UpdateResults doBatchUpdatePaymentStatus(long paymentId[], int statusId)
            throws RemoteException, SQLException;

    public void reviewPayments(long paymentId[])
            throws RemoteException, NoObjectFoundException, IllegalUpdateException, SQLException;

    public void markPaymentsPaid(long paymentId[])
            throws RemoteException, NoObjectFoundException, IllegalUpdateException, SQLException;

    // Utility routines
    public boolean canAffirmAffidavit(long userId, int affidavitTypeId)
            throws RemoteException, SQLException;

    public String[] printPayments() throws RemoteException, PaymentNotReviewedException, SQLException;

    public int generateRoundPayments(long roundId, boolean makeChanges)
            throws IllegalUpdateException, RemoteException, SQLException;

    public int generateRoundPayments(long roundId, int affidavitTypeId, boolean makeChanges)
            throws IllegalUpdateException, RemoteException, SQLException;

    public int expireOldAffidavits() throws RemoteException, SQLException;
}

