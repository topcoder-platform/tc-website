package com.topcoder.web.tc.controller.legacy.pacts.common;

import java.util.List;


public class Links implements PactsConstants {

    private static String createLink(String module, String param1, String value1) {
        return INTERNAL_SERVLET_URL + "?module=" + module + "&" + param1 + "=" + value1;
    }

    private static String createLink(String module, String param1, String value1, String param2, String value2) {
        return INTERNAL_SERVLET_URL + "?module=" + module + "&" + param1 + "=" + value1 + "&" + param2 + "=" + value2;
    }

    public static String addAffidavit(long userId) {
        return createLink("AddAffidavit", USER_ID, userId + "");
    }

    public static String updateUserAccrual(long userId) {
        return createLink("EditUserAccrualAmount", USER_ID, userId + "");
    }
    
    public static String addGlobalAD(long userId) {
        return createLink("AddGlobalAD", USER_ID, userId + "");
    }
    
    public static String addAssignmentDocument(long userId) {
        return createLink("AddAssignmentDocument", USER_ID, userId + "");
    }

    public static String addAffidavitForPayment(long userId, long paymentId) {
        return createLink("AddAffidavit", USER_ID, userId + "", PAYMENT_ID, paymentId + "");
    }

    public static String updateAssignmentDocument(long assignmentDocumentId) {
        return createLink("AddAssignmentDocument", ASSIGNMENT_DOCUMENT_ID, assignmentDocumentId + "");
    }

    public static String updateAffidavit(long affidavitId) {
        return createLink("UpdateAffidavit", AFFIDAVIT_ID, affidavitId + "");
    }

    public static String viewAffidavit(long affidavitId) {
        return PactsConstants.INTERNAL_SERVLET_URL + "?t=view&c=affidavit&" + AFFIDAVIT_ID + "=" + affidavitId;
    }

    public static String viewAssignmentDocument(long assignmentDocuumentId) {
        return createLink("ViewAssignmentDocument", ASSIGNMENT_DOCUMENT_ID, assignmentDocuumentId + "");
    }

    public static String viewUser(long userId) {
        return PactsConstants.INTERNAL_SERVLET_URL + "?t=view&c=user&" + USER_ID + "=" + userId;
    }
    public static String viewContract(long contractId) {
        return PactsConstants.INTERNAL_SERVLET_URL + "?t=view&c=contract&" + CONTRACT_ID + "=" + contractId;
    }

    public static String addPayment(long userId) {
        return createLink("EditPayment", USER_ID, userId + "");
    }
    public static String addContractPayment(long contractId) {
        return createLink("EditPayment", CONTRACT_ID, contractId + "");
    }

    public static String updatePayment(long paymentId) {
        return createLink("EditPayment", PAYMENT_ID, paymentId + "");
    }

    public static String updatePaymentStatus(long paymentId) {
        return createLink("EditPaymentStatus", PAYMENT_ID, paymentId + "");
    }

    public static String viewPayment(long paymentId) {
        return createLink("ViewPayment", PAYMENT_ID, paymentId + "");
    }

    public static String viewPayments(List paymentsId) {
    	StringBuffer sb = new StringBuffer(30);
    	for (int i = 0; i < paymentsId.size(); i++) {
    		sb.append("&payment_id=" + paymentsId.get(i));
    	}
        return INTERNAL_SERVLET_URL + "?module=PaymentList" + sb.toString();
    }

}
