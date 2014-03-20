package com.topcoder.utilities.pacts;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.sql.DBUtility;
import com.topcoder.web.ejb.pacts.*;

/**
 * 
 * @author VolodymyrK
 * @version 1.0
 */
public class PayORProjects extends DBUtility {
    
    private static final String SQL_QUERY_PROJECTS =
            "SELECT p.project_id, pcl.project_category_id, pcl.project_type_id, pi56.value::int as mm_round_id," +
            " (CASE WHEN " +
            "  -- check that review feedback is required for this project\n" +
            "  EXISTS (select 1 from project_info pi59 where pi59.project_id=p.project_id and pi59.project_info_type_id=59 and pi59.value='true')" +
            "  -- check that Review phase has closed\n" +
            "  AND EXISTS (select 1 from project_phase pp where pp.project_id=p.project_id and pp.phase_type_id=4 and pp.phase_status_id=3)" +
            "  -- check that the copilot is not the only reviewer (if at all)\n" +
            "  AND EXISTS (select 1 from resource r1, resource_info ri1, resource r2, resource_info ri2 where" +
            "              r1.project_id=p.project_id and r1.resource_role_id in (4,5,6,7) and r1.resource_id=ri1.resource_id and ri1.resource_info_type_id=1 and" +
            "              r2.project_id=p.project_id and r2.resource_role_id = 14 and r2.resource_id=ri2.resource_id and ri2.resource_info_type_id=1 and" +
            "              ri1.value != ri2.value)" +
            "  -- check that review feedback hasn't been submitted for this project yet\n" +
            "  AND NOT EXISTS (select 1 from review_feedback rf where rf.project_id=p.project_id) THEN 't' else 'f' END)::boolean as pending_review_feedback" +
            " FROM project p" +
            " INNER JOIN project_category_lu pcl ON pcl.project_category_id=p.project_category_id" +
            " LEFT OUTER JOIN project_info pi56 ON pi56.project_id=p.project_id and pi56.project_info_type_id=56" +
            " WHERE" +
            " exists -- check that there are unpaid resources\n" +
            " (" +
            "   select r.resource_id from resource r, resource_info ri1, project_payment pp" +
            "   where r.project_id=p.project_id and ri1.resource_id=r.resource_id and pp.resource_id=r.resource_id and" +
            "   ri1.resource_info_type_id=1 and pp.amount > 0 and pp.pacts_payment_id is null" +
            " )" +
            " and p.project_status_id not in (2,3) -- don't pay Draft and Deleted projects\n" +
            " and (select max(actual_end_time) from project_phase pp where pp.project_id=p.project_id) >= to_date('01/01/2011', '%m/%d/%Y') -- date cutoff for the old projects\n" +
            " -- check that the project is ready to be paid: it should be either in one of the 'closed' statuses or have passed a final review\n" +
            " and" +
            " (" +
            "   -- If the status is Completed or one of the Cancelled ones\n" +
            "   p.project_status_id in (4,5,6,7,8,9,10,11)" +
            "   or" +
            "   -- check that at least one Final Review passed\n" +
            "   exists (select 1 from review_comment rc, review rw where rc.comment_type_id=10 and rc.extra_info='Approved' and rw.review_id = rc.review_id and rw.committed=1 and" +
            "           rc.resource_id in (select resource_id from resource r where r.project_id=p.project_id and r.resource_role_id=9))" +
            " )";

    private static final String SQL_QUERY_PAYMENTS =
            "SELECT pp.project_payment_id," +
            " ri1.value::int as user_id, pp.amount, pptl.pacts_payment_type_id, pptl.mergeable, s.placement" +
            " FROM project_payment pp" +
            " INNER JOIN project_payment_type_lu pptl ON pptl.project_payment_type_id=pp.project_payment_type_id" +
            " INNER JOIN resource r ON r.resource_id=pp.resource_id and r.project_id = ?" +
            " INNER JOIN resource_info ri1 ON ri1.resource_id=r.resource_id and ri1.resource_info_type_id=1" +
            " LEFT OUTER JOIN submission s ON s.submission_id=pp.submission_id" +
            " WHERE pp.amount>0 and pp.pacts_payment_id is null";

    private static final String SQL_QUERY_PENDING_USERS =
            "SELECT distinct ri.value::int as user_id " +
            " FROM late_deliverable ld" +
            " INNER JOIN resource r ON ld.resource_id = r.resource_id and r.project_id = ?" +
            " INNER JOIN resource_info ri ON r.resource_id = ri.resource_id and ri.resource_info_type_id = 1" +
            " WHERE ld.forgive_ind=0 and" +
            " (" +
            "   (ld.explanation is not null and ld.response is null) -- if the explained record is waiting for the response\n" +
            " or" +
            "   (ld.explanation is null and ld.create_date>current-24 units hour) -- or if the late member still has time to explain (24 hours)\n" +
            " )";

    private static final String SQL_QUERY_PENALTIES =
            "SELECT ri.value::int as user_id, nvl(sum(ld.delay),0) as total_delay," +
            " sum(case when ld.late_deliverable_type_id=2 then 1 else 0 end)::int as rejected_final_fixes" +
            " FROM resource r" +
            " INNER JOIN resource_info ri ON r.resource_id=ri.resource_id and ri.resource_info_type_id=1" +
            " INNER JOIN late_deliverable ld ON r.resource_id=ld.resource_id and ld.forgive_ind=0" +
            " WHERE r.project_id=?" +
            " GROUP BY 1";

    private static final String SQL_UPDATE_PROJECT_PAYMENT =
            "UPDATE project_payment SET pacts_payment_id = ?, modify_user = ?, modify_date = current WHERE project_payment_id = ?";

    private static final double FIRST_INSTALLMENT_PERCENT = 0.75;
    private static final int SECOND_INSTALLMENT_HOLD_PERIOD = 30;
    private static final int MARATHON_MATCH_PROJECT_CATEGORY_ID = 37;

    /**
     * This variable tells if only an analysis is wanted.
     */
    private boolean onlyAnalyze;

    /**
     * This variable tells whether to send email when something goes wrong.
     */
    private boolean sendEmail;

    /**
     * This variable defines the operator user ID.
     */
    private String operator;

    /**
     * This variable tells the "from" address of the email.
     */
    private String emailFrom;

    /**
     * This variable tells the "to" address of the email.
     */
    private String emailTo;

    /**
     * Processes all Online Review payments.
     * The method first retrieves the list of projects that have pending payments and then processes each project separately.
     * @throws Exception when any error happens
     */
	protected void runUtility() throws Exception {
        log.info("");
        log.info("-----------------------------------------------");
        long projectsAnalyzed = 0, paidProjectPayments = 0;

        PactsClientServices  pactsEjb = (PactsClientServices) createEJB();
        PreparedStatement psSelProjects = prepareStatement("informixoltp", SQL_QUERY_PROJECTS);
        PreparedStatement psSelPayments = prepareStatement("informixoltp", SQL_QUERY_PAYMENTS);

        ResultSet rs = null, rs2 = null;
        try {
            // Get the list of projects with pending payments.
            rs = psSelProjects.executeQuery(); 
            while(rs.next()) {
                long projectId = rs.getLong("project_id");
                long projectCategoryId = rs.getLong("project_category_id");
                long projectTypeId = rs.getLong("project_type_id");
                boolean pendingReviewFeedback = rs.getBoolean("pending_review_feedback");

                log.info("Analyzing payments for project " + projectId);

                List<Long> pendingUserIds = getPendingUserIds(projectId);
                Map<Long,Double> penalties = getPaymentPenalties(projectId);

                // Now get all pending payments for this project.
                List<Payment> payments = new ArrayList<Payment>();
                psSelPayments.clearParameters();
                psSelPayments.setLong(1, projectId);
                rs2 = psSelPayments.executeQuery();
                while(rs2.next()) {
                    long projectPaymentId = rs2.getLong("project_payment_id");
                    int pactsPaymentTypeId = rs2.getInt("pacts_payment_type_id");
                    long userId = rs2.getLong("user_id");

                    // Skip payment if the user has pending late deliverables.
                    if (pendingUserIds.contains(userId)) {
                        log.info("Payment " + projectPaymentId + " for user " + userId + " is skipped because the user still has pending late deliverables.");
                        continue;
                    }

                    // Skip copilot payment if the review feedback hasn't been submitted yet (if applicable for this contest).
                    if (pactsPaymentTypeId == BasePayment.COPILOT_PAYMENT && pendingReviewFeedback) {
                        log.info("Copilot payment " + projectPaymentId + " for user " + userId +
                                " is skipped because the review feedback hasn't been submitted yet.");
                        continue;
                    }

                    Payment payment = new Payment();
                    payment.userId = userId;
                    payment.projectPaymentIds.add(projectPaymentId);
                    payment.amount = rs2.getDouble("amount");
                    payment.pactsPaymentTypeId = pactsPaymentTypeId;
                    payment.place = rs2.getInt("placement");

                    // If the payment type is "mergeable" it means all user payments of that type should be merged and
                    // created as a single PACTS payment.
                    if (rs2.getBoolean("mergeable")) {
                        // Find a project payment for the user of this type and update its amount.
                        Payment refPayment = null;
                        for(Payment payment2 : payments) {
                            if (payment2.userId == payment.userId && payment2.pactsPaymentTypeId == payment.pactsPaymentTypeId) {
                                refPayment=payment2;
                                break;
                            }
                        }
                        if (refPayment != null) {
                            // Update the existing payment instead of adding a new one.
                            refPayment.amount += payment.amount;
                            refPayment.projectPaymentIds.add(projectPaymentId);
                        } else {
                            // If there's no such payment yet, add this one.
                            payments.add(payment);
                        }
                    } else {
                        payments.add(payment);
                    }
                }

                // Now process all pending payments for this project which are ready to be paid
                // by transferring them to PACTS and updating the records in project_payment table.
                for(Payment payment : payments) {
                    log.info("Processing payments: " + concat(payment.projectPaymentIds));

                    BasePayment pactsPayment = null, pactsPayment2 = null;

                    // Get the penalty percentage. Copilot payments and payments for Marathon Matches are not subject to penalties.
                    double penalty = penalties.get(payment.userId) == null ? 0.0 : penalties.get(payment.userId);
                    if (payment.pactsPaymentTypeId == BasePayment.COPILOT_PAYMENT ||
                        projectCategoryId == MARATHON_MATCH_PROJECT_CATEGORY_ID) {
                        penalty = 0;
                    }
                    if (penalty > 0.0) {
                        log.info("The lateness penalty applies : " + penalty);
                    }
                    double amount =  payment.amount*(1.0-penalty);

                    if (payment.pactsPaymentTypeId == BasePayment.CONTEST_PAYMENT) {
                        if (projectCategoryId == MARATHON_MATCH_PROJECT_CATEGORY_ID) { // If Marathon Match
                            long mmRoundId = rs.getLong("mm_round_id");
                            if (rs.wasNull()) {
                                log.warn("MM round ID is not set for project " + projectId + ". Ignoring the payment.");
                                continue;
                            }
                            pactsPayment = new MarathonMatchNonTaxablePayment(payment.userId, amount, mmRoundId, payment.place);
                        } else {
                            pactsPayment = new ContestPayment(payment.userId, amount, projectId, payment.place);

                            // If this is the winner's payment for a SW contest, split the payment in two installments
                            if (payment.place == 1 && projectTypeId != 3) {
                                pactsPayment.setGrossAmount(amount * FIRST_INSTALLMENT_PERCENT);

                                // Create the 2nd installment
                                pactsPayment2 = new ContestPayment(payment.userId, amount, projectId, payment.place);
                                pactsPayment2.setGrossAmount(amount - (amount * FIRST_INSTALLMENT_PERCENT));
                                pactsPayment2.setInstallmentNumber(2);

                                // Calculate the due date for the 2nd installment.
                                // It should be max(general due date assigned by the system, SECOND_INSTALLMENT_HOLD_PERIOD days from now).
                                Calendar cal = Calendar.getInstance();
                                cal.add(Calendar.DATE, SECOND_INSTALLMENT_HOLD_PERIOD);

                                pactsPayment2 = pactsEjb.fillPaymentData(pactsPayment2);
                                pactsPayment2.setDueDate(max(pactsPayment2.getDueDate(), cal.getTime()));
                            }
                        }
                    } else {
                        pactsPayment = BasePayment.createPayment(payment.pactsPaymentTypeId, payment.userId, amount, projectId, payment.place);
                    }

                    log.info("Adding PACTS payment: user " + pactsPayment.getCoderId() + ", amount " + pactsPayment.getGrossAmount() +
                            ", type " + pactsPayment.getPaymentTypeDesc() + ", project " + projectId);
                    if (!onlyAnalyze) {
                        pactsPayment = pactsEjb.addPayment(pactsPayment);
                        log.info("PACTS payment id: " + pactsPayment.getId());
                    }
                    if (pactsPayment2 != null) {
                        log.info("Adding PACTS payment: user " + pactsPayment2.getCoderId() + ", amount " + pactsPayment2.getGrossAmount() +
                                ", type " + pactsPayment2.getPaymentTypeDesc() + ", project " + projectId);
                        if (!onlyAnalyze) {
                            pactsPayment2 = pactsEjb.addPayment(pactsPayment2);
                            log.info("PACTS payment id: " + pactsPayment2.getId());
                        }
                    }

                    if (!onlyAnalyze) {
                        updateProjectPayments(payment.projectPaymentIds, pactsPayment.getId());
                    }
                    paidProjectPayments += payment.projectPaymentIds.size();
                }

                projectsAnalyzed++;
            }

            log.info("-----------------------------------------------");
            log.info("Successfully analyzed " + projectsAnalyzed + " projects and paid " + paidProjectPayments + " project payments.\n");
        } catch (Exception e) {
            log.error("Exception caught when processing project payments.", e);
            sendFailureEmail(e);
        } finally {
            DBMS.close(rs);
            DBMS.close(rs2);
            DBMS.close(psSelProjects);
            DBMS.close(psSelPayments);
        }
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
        List<Long> userIds = new ArrayList<Long>();
        PreparedStatement psSelPendingUsers = prepareStatement("informixoltp", SQL_QUERY_PENDING_USERS);
        psSelPendingUsers.setLong(1, projectId);
        ResultSet rs = null;
        try {
            rs = psSelPendingUsers.executeQuery();
            while(rs.next()) {
                long userId = rs.getLong("user_id");
                userIds.add(userId);
            }
        } finally {
            DBMS.close(rs);
            DBMS.close(psSelPendingUsers);
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
        Map<Long,Double> penalties = new HashMap<Long,Double>();
        PreparedStatement psSelPenalties = prepareStatement("informixoltp", SQL_QUERY_PENALTIES);
        psSelPenalties.setLong(1, projectId);
        ResultSet rs = null;
        try {
            rs = psSelPenalties.executeQuery();
            while(rs.next()) {
                long userId = rs.getLong("user_id");
                long delay = rs.getLong("total_delay");
                long rejectedFinalFixes = rs.getLong("rejected_final_fixes");

                // The penalty for delays is 5% plus 1% per each full hour of delay.
                // The penalty for rejected final fixes is 5% per rejected final fix submission.
                long paymentPenaltyPercentage = (delay>0 ? 5 : 0) + (delay/3600) + rejectedFinalFixes * 5;
                if (paymentPenaltyPercentage > 50) {
                    paymentPenaltyPercentage = 50;
                }

                penalties.put(userId, (double)paymentPenaltyPercentage/100.0);
            }
        } finally {
            DBMS.close(rs);
            DBMS.close(psSelPenalties);
        }

        return penalties;
    }

    /**
     * Sets the project_payment.pacts_payment_id field, which effectively marks the project payments as paid.
     *
     * @param projectPaymentIds         The list of project payment IDs
     * @param pactsPaymentId         The ID of the PACTS payment
     * @throws SQLException     If there was some error updating the data.
     */
    private void updateProjectPayments(List<Long> projectPaymentIds, long pactsPaymentId) throws SQLException {
        PreparedStatement psUpdProjectPayment = prepareStatement("informixoltp", SQL_UPDATE_PROJECT_PAYMENT);
        psUpdProjectPayment.setLong(1, pactsPaymentId);
        psUpdProjectPayment.setString(2, operator);

        try {
            for(Long projectPaymentId : projectPaymentIds) {
                psUpdProjectPayment.setLong(3, projectPaymentId);
                psUpdProjectPayment.executeUpdate();
            }
        } finally {
            DBMS.close(psUpdProjectPayment);
        }
    }
    
    /**
     * Returns the maximum of two dates. A null date is considered to be less than any non-null date.
     * @param d1 The first date.
     * @param d2 The second date.
     * @return The minimum date.
     */
    private static Date max(Date d1, Date d2) {
        if (d1 == null && d2 == null) {
            return null;
        }
        if (d1 == null) {
            return d2;
        }
        if (d2 == null) {
            return d1;
        }
        return (d1.after(d2)) ? d1 : d2;
    }

    /**
     * Returns comma-separated list of values as a string.
     * @param values list of integer values.
     * @return The string containing comma-separated list of values.
     */
    private static String concat(List<Long> values) {
        StringBuilder sb = new StringBuilder();
        for(int i=0;i+1<values.size();i++) {
            sb.append(values.get(i)).append(",");
        }
        sb.append(values.get(values.size()-1));
        return sb.toString();
    }

    public static Object createEJB() throws NamingException, Exception {
        InitialContext initial = TCContext.getInitial();

        Object objref = initial.lookup(PactsClientServicesHome.class.getName());
        PactsClientServicesHome home = (PactsClientServicesHome) 
            PortableRemoteObject.narrow(objref, PactsClientServicesHome.class);

        return(home.create());
    }

    /**
     * Sends notification emails when the payments processing fails.
     * @param cause Exception describing the problem.
     * @throws Exception if an error happens when sending the email.
     */
    private void sendFailureEmail(Exception cause) throws Exception {
        String emailSubject = "Processing Online Review payments failed";

        StringWriter str = new StringWriter();
        PrintWriter writer = new PrintWriter(str);
        cause.printStackTrace(writer);
        String emailBody =
                "An error happened when processing Online Review payments.\n" +
                "The support team needs to look into the cause immediately. The details follow.\n\n" + str.getBuffer().toString();

        try {
            if (sendEmail) {
                sendMail(emailFrom, emailTo, emailSubject, emailBody);
                log.info("Sending failure email to " + emailTo);
            }
        } catch (Exception e) {
            throw new Exception("Unable to send failure email.", e);
        } finally {
            str.close();
            writer.close();
        }
    }
    
    /**
     * Process and validates the parameters.
     */
    protected void processParams() {
        super.processParams();

        String tmp = (String) params.get("onlyAnalyze");
        if (tmp == null) {
            setUsageError("Please specify onlyAnalyze.\n");
        } else {
            onlyAnalyze = tmp.equalsIgnoreCase("true");
        }
        params.remove("onlyAnalyze");

        tmp = (String) params.get("sendEmail");
        if (tmp == null) {
            setUsageError("Please specify sendEmail.\n");
        } else {
            sendEmail = tmp.equalsIgnoreCase("true");
        }
        params.remove("sendEmail");

        tmp = (String) params.get("operator");
        if (tmp == null) {
            setUsageError("Please specify operator.\n");
        } else {
            operator = tmp.trim();
        }
        params.remove("operator");

        tmp = (String) params.get("emailFrom");
        if (tmp == null) {
            setUsageError("Please specify emailFrom.\n");
        } else {
            emailFrom = tmp.trim();
        }
        params.remove("emailFrom");

        tmp = (String) params.get("emailTo");
        if (tmp == null) {
            setUsageError("Please specify emailTo.\n");
        } else {
            emailTo = tmp.trim();
        }
        params.remove("emailTo");

        log.info("onlyAnalyze : " + onlyAnalyze);
    }

    /**
     * Show usage of the PayORProjects.
     *
     * @param msg The error message.
     */
    protected void setUsageError(String msg) {
        sErrorMsg.setLength(0);
        sErrorMsg.append(msg + "\n");
        sErrorMsg.append("PayORProjects:\n");
        sErrorMsg.append("   The following parameters should be included in the XML or the command line");
        sErrorMsg.append("   -onlyAnalyze : whether to just analyze without updates.\n");
        sErrorMsg.append("   -sendEmail : whether to send email when something goes wrong.\n");
        sErrorMsg.append("   -operator : defines the operator user ID for audit records.\n");
        sErrorMsg.append("   -emailFrom : the 'from' address of the email.\n");
        sErrorMsg.append("   -emailTo : the 'to' address of the email.\n");
        fatal_error();
    }

   private class Payment {
       long userId;
       List<Long> projectPaymentIds = new ArrayList<Long>();
       int pactsPaymentTypeId;
       double amount;
       int place;
   }

}
