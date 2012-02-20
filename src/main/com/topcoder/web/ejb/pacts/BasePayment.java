/*
 * Copyright (C) 2004 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.ejb.pacts;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.pacts.payments.BasePaymentStatus;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;

/**
 * <p>Represents basic payment information, without reference information.
 * This class partially overlaps with Payment class.  However, this class is intendeed
 * to be uses with PactsClientServices, and tries to be more friendly.
 *
 * Payment is still used for internal processing, but maybe we can think in the future
 * to do just one class.</p>
 *
 * <p>
 *   Version 1.1 (PACTS Release Assembly 1.1.1) Change notes:
 *   <ol>
 *     <li>Added support for Copilot, Studio bug fixes, Studio enhancements and Studio specification review
 *         Payments.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.2 (BUGR-1843, BUGR-1845) Change notes:
 *   <ol>
 *     <li>Added constants to support Specification Writing, Studio Specification Writing, UI Prototype Competition,
 *         RIA Build Competition and RIA Component Competition Payments.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.3 (BUGR-1901) Change notes:
 *   <ol>
 *     <li>Added constants to support Deployment Task Payments.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.4 (Testing Competition Split Release Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Updated Application Testing to Test Suites</li>
 *     <li>Added support for new Test Scenarios competitions.</li>
 *   </ol>
 * </p>
 * <p>
 *   Version 1.5 (Studio Electronic Assignment Document Assembly version 1.0) Change notes:
 *   <ol>
 *     <li>Add a field hasGlobalAD to reflect the AD</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.6 (Copilot Selection Contest Online Review and TC Site Integration Assembly version 1.0) Change notes:
 *   <ol>
 *     <li>Add support for copilot posting competition</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.7 (Content Creation Contest Online Review and TC Site Integration Assembly version 1.0) Change notes:
 *   <ol>
 *     <li>Updated {@link #getReferenceTypeId(int)} method.</li>
 *     <li>Updated {@link #createPayment(int, long, double, long, int)} method.</li>
 *     <li>Updated {@link #getPaymentTypeDesc()} method.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.8 Change notes:
 *   <ol>
 *     <li>Added taxable DR payment types.</li>
 *   </ol>
 * </p> 
 *
 * @author cucu, pulky, Vitta, FireIce, VolodymyrK
 * @version 1.8
 */
public abstract class BasePayment implements Constants, java.io.Serializable {
    private static Logger log = Logger.getLogger(BasePayment.class);

    // payment Id
    private long id = 0;
    private long coderId;
    private double grossAmount;
    private double netAmount = 0;
    private Date dueDate = null;
    private Date paidDate = null;
    private BasePaymentStatus currentStatus;
    private String description = null;
    private final int paymentTypeId;
    private String referenceDescription = null;
    private boolean charity = false;
    private double totalAmount;
    private int installmentNumber;
    private long methodId = Constants.NOT_SET_PAYMENT_METHOD_ID;

    // If positive, the payment is for that contract, so a row relating the contact and the payment will be inserted
    private long contractId = 0;

    // Date when the event happened.  It is not stored in the database, but needed to know if referrals must be paid.
    private Date eventDate  = null;

    // Some payments include a placement to use in the description.
    private int placed = 0;

    // When updates are done to the fields, this member mantains a
    // value indicating which field was changed.
    private int modificationRationale = 0;

    private String client = null;

    private String jiraIssueName = null;

    /**
    * Indicate whether have the global AD.
    * @since 1.5
    */
    private boolean hasGlobalAD;

    /**
     * Create a base payment.
     *
     * @param paymentTypeId type of the payment
     * @param coderId coder that receives the payment.
     * @param grossAmount gross amount of the payment.
     */
    protected BasePayment(int paymentTypeId, long coderId, double grossAmount) {
        this(paymentTypeId,coderId, grossAmount, 0);
    }

    /**
     * Create a base payment including the placement position in a contest.
     * The placement is just for creating the description of the payment.
     *
     * @param paymentTypeId type of the payment
     * @param coderId coder that receives the payment.
     * @param grossAmount gross amount of the payment.
     * @param placed the position that the coder had in the contest.
     */
    protected BasePayment(int paymentTypeId, long coderId, double grossAmount, int placed) {
        this.paymentTypeId = paymentTypeId;
        this.coderId = coderId;
        this.grossAmount = grossAmount;
        this.totalAmount = grossAmount;
        this.installmentNumber = 1;
        this.placed = placed;
    }

    /**
     * Create a base payment.
     *
     * @param paymentTypeId type of the payment
     * @param coderId coder that receives the payment.
     * @param client the client related to this payment
     * @param grossAmount gross amount of the payment.
     */
    protected BasePayment(int paymentTypeId, long coderId, String client, double grossAmount) {
        this(paymentTypeId,coderId, client, grossAmount, 0);
    }

    /**
     * Create a base payment including the placement position in a contest.
     * The placement is just for creating the description of the payment.
     *
     * @param paymentTypeId type of the payment
     * @param coderId coder that receives the payment.
     * @param client the client related to this payment
     * @param grossAmount gross amount of the payment.
     * @param placed the position that the coder had in the contest.
     */
    protected BasePayment(int paymentTypeId, long coderId, String client, double grossAmount, int placed) {
        this(paymentTypeId,coderId, grossAmount, placed);
        this.client = client;
    }

    /**
     * Get the type of reference that this payment uses.
     * It will return the value of one of the constants: NO_REFERENCE or REFERENCE_*
     *
     * @return the type of reference that this payment uses.
     */
    public int getReferenceTypeId() {
        return getReferenceTypeId(getPaymentType());
    }

    /**
     * Get the type of reference for the specified type of payment.
     * It will return the value of one of the constants: NO_REFERENCE or REFERENCE_*
     *
     * @param paymenteType type of payment
     * @return the type of reference for the specified type of payment.
     */
    public static int getReferenceTypeId(int paymentType) {
        switch(paymentType) {
        case ALGORITHM_CONTEST_PAYMENT:
        case MARATHON_MATCH_PAYMENT:
        case MARATHON_MATCH_TOURNAMENT_PRIZE_PAYMENT:
        case ALGORITHM_TOURNAMENT_PRIZE_PAYMENT:
        case HIGH_SCHOOL_TOURNAMENT_PRIZE_PAYMENT:
        case PROBLEM_TESTING_PAYMENT:
            return REFERENCE_ALGORITHM_ROUND_ID;

        case STUDIO_REVIEW_BOARD_PAYMENT:
        case COMPONENT_PAYMENT:
        case REVIEW_BOARD_PAYMENT:
        case BUG_FIXES_PAYMENT:
        case COMPONENT_ENHANCEMENTS_PAYMENT:
        case SPECIFICATION_REVIEW_PAYMENT:
        case COMPONENT_BUILD_PAYMENT:
        case ASSEMBLY_COMPETITION_REVIEW:
        case ASSEMBLY_PAYMENT:
        case ARCHITECTURE_PAYMENT:
        case SPECIFICATION_CONTEST_PAYMENT:
        case CONCEPTUALIZATION_CONTEST_PAYMENT:
        case TEST_SUITES_PAYMENT:
        case TEST_SCENARIOS_PAYMENT:
        case COPILOT_PAYMENT:
        case DEPLOYMENT_TASK_PAYMENT:
        case COPILOT_POSTING_PAYMENT:
        case CONTENT_CREATION_PAYMENT:
        case CONTEST_PAYMENT:
        case CONTEST_MILESTONE_PAYMENT:
            return REFERENCE_COMPONENT_PROJECT_ID;

        case PROBLEM_WRITING_PAYMENT:
            return REFERENCE_ALGORITHM_PROBLEM_ID;

        case TC_STUDIO_TOURNAMENT_PRIZE_PAYMENT:
        case TC_STUDIO_PAYMENT:
        case STUDIO_BUG_FIXES_PAYMENT:
        case STUDIO_ENHANCEMENTS_PAYMENT:
        case STUDIO_SPECIFICATION_REVIEW_PAYMENT:
        case STUDIO_SUBMISSION_SCREENING_PAYMENT:
        case STUDIO_COPILOT_PAYMENT:
            return REFERENCE_STUDIO_CONTEST_ID;

        case COMPONENT_TOURNAMENT_BONUS_PAYMENT:
        case INTRO_EVENT_COMP_PAYMENT:
            return REFERENCE_COMPONENT_CONTEST_ID;

        case DIGITAL_RUN_PRIZE_PAYMENT:
        case DIGITAL_RUN_TOP_THIRD_PAYMENT:
            return REFERENCE_DIGITAL_RUN_STAGE_ID;

        case DIGITAL_RUN_V2_PRIZE_PAYMENT:
        case DIGITAL_RUN_V2_TOP_PERFORMERS_PAYMENT:
        case DIGITAL_RUN_V2_TAXABLE_PRIZE_PAYMENT:
        case DIGITAL_RUN_V2_TAXABLE_TOP_PERFORMERS_PAYMENT:		
            return REFERENCE_DIGITAL_RUN_TRACK_ID;

        case DIGITAL_RUN_ROCKIE_PRIZE_PAYMENT:
            return REFERENCE_DIGITAL_RUN_SEASON_ID;

        case CODER_REFERRAL_PAYMENT:
        case RELIABILITY_BONUS_PAYMENT:
        case REVIEW_BOARD_BONUS_PAYMENT:
            return REFERENCE_PARENT_PAYMENT_ID;
        case UI_PROTOTYPE_COMPETITION_PAYMENT:
            return REFERENCE_COMPONENT_PROJECT_ID;
        case RIA_BUILD_COMPETITION_PAYMENT:
            return REFERENCE_COMPONENT_PROJECT_ID;
        case RIA_COMPONENT_COMPETITION_PAYMENT:
            return REFERENCE_COMPONENT_PROJECT_ID;
        case SPECIFICATION_WRITING_PAYMENT:
            return REFERENCE_COMPONENT_PROJECT_ID;
        case STUDIO_SPECIFICATION_WRITING_PAYMENT:
            return REFERENCE_STUDIO_CONTEST_ID;
        default:
            return NO_REFERENCE;
        }
    }


    /**
     * Create a payment using the specified information.
     * An instance of an extending class of BasePayment will be returned, depending on the type of payment.
     *
     * @param paymentTypeId type of payment
     * @param coderId id of the coder
     * @param grossAmount gross amount paid
     * @param referenceId the reference to another table PK for this payment.
     * @param placed the placement if it's a winning
     * @return an instance of an extending class of BasePayment , depending on the type of payment.
     */
    public static BasePayment createPayment(int paymentTypeId, long coderId, double grossAmount, long referenceId, int placed) {
        switch(paymentTypeId) {
        case ALGORITHM_CONTEST_PAYMENT: return new AlgorithmContestPayment(coderId, grossAmount, referenceId, placed);
        case MARATHON_MATCH_PAYMENT: return new MarathonMatchPayment(coderId, grossAmount, referenceId, placed);
        case ALGORITHM_TOURNAMENT_PRIZE_PAYMENT: return new AlgorithmTournamentPrizePayment(coderId, grossAmount, referenceId, placed);
        case HIGH_SCHOOL_TOURNAMENT_PRIZE_PAYMENT: return new HighSchoolTournamentPrizePayment(coderId, grossAmount, referenceId, placed);
        case COMPONENT_PAYMENT: return new ComponentWinningPayment(coderId, grossAmount, referenceId, placed);
        case REVIEW_BOARD_PAYMENT: return new ReviewBoardPayment(coderId, grossAmount, referenceId);
        case STUDIO_REVIEW_BOARD_PAYMENT: return new ReviewBoardPayment(coderId, grossAmount, referenceId);
        case PROBLEM_WRITING_PAYMENT: return new ProblemWritingPayment(coderId, grossAmount, referenceId);
        case PROBLEM_TESTING_PAYMENT: return new ProblemTestingPayment(coderId, grossAmount, referenceId);
        case TC_STUDIO_PAYMENT: return new StudioContestPayment(coderId, grossAmount, referenceId, placed);
        case COMPONENT_TOURNAMENT_BONUS_PAYMENT: return new ComponentTournamentBonusPayment(coderId, grossAmount, referenceId, placed);
        case INTRO_EVENT_COMP_PAYMENT: return new IntroEventCompPayment(coderId, grossAmount, referenceId, placed);
        case DIGITAL_RUN_PRIZE_PAYMENT: return new DigitalRunPrizePayment(coderId, grossAmount, referenceId, placed);
        case DIGITAL_RUN_TOP_THIRD_PAYMENT: return new DigitalRunTopThirdPayment(coderId, grossAmount, referenceId, placed);
        case DIGITAL_RUN_ROCKIE_PRIZE_PAYMENT: return new DigitalRunRockiePrizePayment(coderId, grossAmount, referenceId, placed);
        case CODER_REFERRAL_PAYMENT: return new CoderReferralPayment(coderId, grossAmount, referenceId);
        case RELIABILITY_BONUS_PAYMENT: return new ReliabilityBonusPayment(coderId, grossAmount, referenceId);
        case MARATHON_MATCH_TOURNAMENT_PRIZE_PAYMENT: return new MarathonMatchTournamentPrizePayment(coderId, grossAmount, referenceId, placed);
        case TC_STUDIO_TOURNAMENT_PRIZE_PAYMENT: return new StudioTournamentPrizePayment(coderId, grossAmount, referenceId, placed);
        case BUG_FIXES_PAYMENT: return new BugFixesPayment(coderId, grossAmount, referenceId);
        case DEPLOYMENT_TASK_PAYMENT: return new DeploymentTaskPayment(coderId, grossAmount, referenceId);
        case COMPONENT_ENHANCEMENTS_PAYMENT: return new ComponentEnhancementsPayment(coderId, grossAmount, referenceId);
        case SPECIFICATION_REVIEW_PAYMENT: return new SpecificationReviewPayment(coderId, grossAmount, referenceId);
        case REVIEW_BOARD_BONUS_PAYMENT: return new ReviewBoardBonusPayment(coderId, grossAmount, referenceId);
        case COMPONENT_BUILD_PAYMENT: return new ComponentBuildPayment(coderId, grossAmount, referenceId);
        case ASSEMBLY_COMPETITION_REVIEW: return new AssemblyReviewPayment(coderId, grossAmount, referenceId);
        case ASSEMBLY_PAYMENT: return new AssemblyPayment(coderId, grossAmount, referenceId, placed);
        case ARCHITECTURE_PAYMENT: return new ArchitecturePayment(coderId, grossAmount, referenceId, placed);
        case DIGITAL_RUN_V2_PRIZE_PAYMENT: return new DigitalRunV2PrizePayment(coderId, grossAmount, referenceId, placed);
        case DIGITAL_RUN_V2_TOP_PERFORMERS_PAYMENT: return new DigitalRunV2TopPerformersPayment(coderId, grossAmount, referenceId, placed);
        case DIGITAL_RUN_V2_TAXABLE_PRIZE_PAYMENT: return new DigitalRunV2TaxablePrizePayment(coderId, grossAmount, referenceId, placed);
        case DIGITAL_RUN_V2_TAXABLE_TOP_PERFORMERS_PAYMENT: return new DigitalRunV2TaxableTopPerformersPayment(coderId, grossAmount, referenceId, placed);		
        case SPECIFICATION_CONTEST_PAYMENT: return new SpecificationContestPayment(coderId, grossAmount, referenceId, placed);
        case CONTENT_CREATION_PAYMENT: return new ContentCreationContestPayment(coderId, grossAmount, referenceId, placed);
        case CONCEPTUALIZATION_CONTEST_PAYMENT: return new ConceptualizationContestPayment(coderId, grossAmount, referenceId, placed);
        case TEST_SUITES_PAYMENT: return new TestSuitesCompetitionPayment(coderId, grossAmount, referenceId, placed);
        case TEST_SCENARIOS_PAYMENT: return new TestScenariosCompetitionPayment(coderId, grossAmount, referenceId, placed);
        case COPILOT_POSTING_PAYMENT: return new CopilotPostingPayment(coderId, grossAmount, referenceId, placed);
        case COPILOT_PAYMENT: return new CopilotPayment(coderId, grossAmount, referenceId, placed);
        case STUDIO_BUG_FIXES_PAYMENT: return new StudioBugFixesPayment(coderId, grossAmount, referenceId, placed);
        case STUDIO_ENHANCEMENTS_PAYMENT: return new StudioEnhancementsPayment(coderId, grossAmount, referenceId, placed);
        case STUDIO_SPECIFICATION_REVIEW_PAYMENT: return new StudioSpecificationReviewPayment(coderId, grossAmount, referenceId, placed);
        case STUDIO_SUBMISSION_SCREENING_PAYMENT: return new StudioSubmissionScreeningPayment(coderId, grossAmount, referenceId, placed);
        case STUDIO_COPILOT_PAYMENT: return new StudioCopilotPayment(coderId, grossAmount, referenceId, placed);
        case UI_PROTOTYPE_COMPETITION_PAYMENT: return new UIPrototypeCompetitionPayment(coderId, grossAmount, referenceId, placed);
        case RIA_BUILD_COMPETITION_PAYMENT: return new RIABuildCompetitionPayment(coderId, grossAmount, referenceId, placed);
        case RIA_COMPONENT_COMPETITION_PAYMENT: return new RIAComponentCompetitionPayment(coderId, grossAmount, referenceId, placed);
        case SPECIFICATION_WRITING_PAYMENT: return new SpecificationWritingPayment(coderId, grossAmount, referenceId, placed);
        case STUDIO_SPECIFICATION_WRITING_PAYMENT: return new StudioSpecificationWritingPayment(coderId, grossAmount, referenceId, placed);
        case CONTEST_PAYMENT: return new ContestPayment(coderId, grossAmount, referenceId, placed);
        case CONTEST_MILESTONE_PAYMENT: return new ContestMilestonePayment(coderId, grossAmount, referenceId, placed);
        default: return new NoReferencePayment(paymentTypeId, coderId, grossAmount, "");
        }
    }

    /**
     * Create a payment using the specified information.
     * An instance of an extending class of BasePayment will be returned, depending on the type of payment.
     *
     * @param paymentTypeId type of payment
     * @param coderId id of the coder
     * @param grossAmount gross amount paid
     * @param referenceId the reference to another table PK for this payment.
     * @return an instance of an extending class of BasePayment , depending on the type of payment.
     */
    public static BasePayment createPayment(int paymentTypeId, long coderId, double grossAmount, long referenceId) {
        return createPayment(paymentTypeId, coderId, grossAmount, referenceId, 0);
    }

    /**
     * This method should be called when a field that is in the DB is changed.
     * It takes care of setting the value of modification rationale.
     *
     * @param rationale rationale that should be set for the field that is changed
     * @param hasChanged whether the field was changed or not.  If not changed, nothing is done.
     */
    protected void fieldChanged(int rationale, boolean hasChanged) {
        // if the field is not in db yet, or the field has not changed,
        // we don't care about modifications
        if (id == 0 || !hasChanged) {
            return;
        }

        // if the field being changed is the same that was already changed, or the rationale
        // is already multiple fields, don't do anything.
        if (modificationRationale == rationale || modificationRationale == MODIFICATION_MULTIPLE_FIELDS) {
            return;
        }

        // if no field was previously changed, store the rationale.
        // if a field was changed, move to multiple fields.
        if (modificationRationale == 0) {
            modificationRationale = rationale;
        } else {
            modificationRationale = MODIFICATION_MULTIPLE_FIELDS;
        }
    }

    /**
     * Reset the modification rationale.
     * This method must be called after saving or updating a payment.
     *
     */
    protected void resetModificationRationale() {
        modificationRationale = 0;
    }

    /**
     * Get the type for this payment.
     *
     * @return the type for this payment.
     */
    public int getPaymentType() {
        return paymentTypeId;
    }

    /**
     * Get the type desc for this payment.
     *
     * @return the type desc for this payment.
     */
    public String getPaymentTypeDesc() {
        switch(paymentTypeId) {
            case ALGORITHM_CONTEST_PAYMENT: return "Algorithm Contest Payment";
            case CONTRACT_PAYMENT: return "Contract Payment";
            case PROBLEM_PAYMENT: return "Problem Payment";
            case CODER_REFERRAL_PAYMENT: return "Coder Referral Payment";
            case CHARITY_PAYMENT: return "Charity Payment";
            case COMPONENT_PAYMENT: return "Component Payment";
            case REVIEW_BOARD_PAYMENT: return "Review Board Payment";
            case STUDIO_REVIEW_BOARD_PAYMENT: return "Studio Review Board Payment";
            case ONE_OFF_PAYMENT: return "One-off Payment";
            case ARTICLE_PAYMENT: return "Article Payment";
            case ASSEMBLY_PAYMENT: return "Assembly Payment";
            case TESTING_PAYMENT: return "Testing Payment";
            case LOGO_CONTEST_PAYMENT: return "Logo Contest Payment";
            case TC_STUDIO_PAYMENT: return "TopCoder Studio Contest Payment";
            case TC_STUDIO_TOURNAMENT_PRIZE_PAYMENT: return "TopCoder Studio Tournament Prize Payment";
            case PROBLEM_TESTING_PAYMENT: return "Problem Testing Payment";
            case PROBLEM_WRITING_PAYMENT: return "Problem Writing Payment";
            case CCIP_PAYMENT: return "CCIP Payment";
            case DIGITAL_RUN_PRIZE_PAYMENT: return "Digital Run Payment";
            case DIGITAL_RUN_ROCKIE_PRIZE_PAYMENT: return "Digital Run Rookie Payment";
            case COMPONENT_TOURNAMENT_BONUS_PAYMENT: return "Component Tournament Bonus Payment";
            case ROYALTY_PAYMENT: return "Royalty Payment";
            case MARATHON_MATCH_PAYMENT: return "Marathon Match Payment";
            case MARATHON_MATCH_TOURNAMENT_PRIZE_PAYMENT: return "Marathon Match Tournament Prize Payment";
            case ALGORITHM_TOURNAMENT_PRIZE_PAYMENT: return "Algorithm Tournament Prize Payment";
            case HIGH_SCHOOL_TOURNAMENT_PRIZE_PAYMENT: return "High School Tournament Prize Payment";
            case COLLEGE_TOUR_REP_PAYMENT: return "College Tour Representative Payment";
            case BUG_FIXES_PAYMENT: return "Bug Fixes Payment";
            case DEPLOYMENT_TASK_PAYMENT: return "Deployment Task Payment";
            case COMPONENT_ENHANCEMENTS_PAYMENT: return "Component Enhancements Payment";
            case RELIABILITY_BONUS_PAYMENT: return "Reliability Bonus Payment";
            case DIGITAL_RUN_TOP_THIRD_PAYMENT: return "Digital Run Top Performers Payment";
            case ARCHITECTURE_REVIEW_PAYMENT: return "Architecture Review Payment";
            case SPECIFICATION_REVIEW_PAYMENT: return "Specification Review Payment";
            case ASSEMBLY_COMPETITION_REVIEW: return "Assembly Competition Review ";
            case ARCHITECTURE_PAYMENT: return "Architecture Payment";
            case PREDICTIVE_CONTEST_PAYMENT: return "Predictive Contest Payment";
            case INTRO_EVENT_COMP_PAYMENT: return "Introductory Event Component Contest Payment";
            case REVIEW_BOARD_BONUS_PAYMENT: return "Review Board Bonus Payment";
            case COMPONENT_BUILD_PAYMENT: return "Component Build Payment";
            case DIGITAL_RUN_V2_PRIZE_PAYMENT: return "Digital Run v2 Payment";
            case DIGITAL_RUN_V2_TOP_PERFORMERS_PAYMENT: return "Digital Run v2 Top Performers Payment";
            case DIGITAL_RUN_V2_TAXABLE_PRIZE_PAYMENT: return "Digital Run v2 Payment (taxable)";
            case DIGITAL_RUN_V2_TAXABLE_TOP_PERFORMERS_PAYMENT: return "Digital Run v2 Top Performers Payment (taxable)";			
            case SPECIFICATION_CONTEST_PAYMENT: return "Specification Contest Payment";
            case CONCEPTUALIZATION_CONTEST_PAYMENT: return "Conceptualization Contest Payment";
            case TEST_SUITES_PAYMENT: return "Test Suites Payment";
            case TEST_SCENARIOS_PAYMENT: return "Test Scenarios Payment";
            case COPILOT_POSTING_PAYMENT: return "Copilot Posting Payment";
            case COPILOT_PAYMENT: return "Copilot Payment";
            case STUDIO_BUG_FIXES_PAYMENT: return "TopCoder Studio bug fixes Payment";
            case STUDIO_ENHANCEMENTS_PAYMENT: return "TopCoder Studio enhancements Payment";
            case STUDIO_SPECIFICATION_REVIEW_PAYMENT: return "TopCoder Studio specification review Payment";
            case STUDIO_SUBMISSION_SCREENING_PAYMENT: return "TopCoder Studio Submission Screening Payment";
            case STUDIO_COPILOT_PAYMENT: return "TopCoder Studio Copilot Payment";
            case UI_PROTOTYPE_COMPETITION_PAYMENT: return "UI Prototype Competition Payment";
            case RIA_BUILD_COMPETITION_PAYMENT: return "RIA Build Competition Payment";
            case RIA_COMPONENT_COMPETITION_PAYMENT: return "RIA Component Competition Payment";
            case SPECIFICATION_WRITING_PAYMENT: return "Specification Writing Payment";
            case STUDIO_SPECIFICATION_WRITING_PAYMENT: return "Studio Specification Writing Payment";
            case CONTENT_CREATION_PAYMENT: return "Content Creation Payment";
            case CONTEST_PAYMENT: return "Contest Payment";
            case CONTEST_MILESTONE_PAYMENT: return "Contest Milestone Payment";

            default: return "Other Payment";
        }
    }

    /**
     * Get a processor for filling necessary information in the payment.
     *
     * @return a processor for filling necessary information in the payment.
     */
    protected abstract BasePayment.Processor getProcessor();



    public void setId(long id) {
        this.id = id;
    }

    protected int getPlaced() {
        return placed;
    }

    /**
     * Get the client for the project.
     *
     * @return the client for the project.
     */
    public String getClient() {
        return client;
    }

    /**
     * Set the client for the project.
     *
     * @param client the client for the project.
     */
    public void setClient(String client) {
        fieldChanged(MODIFICATION_REFERENCE, client != null && client != this.client);
        this.client = client;
    }


    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        fieldChanged(MODIFICATION_DESCRIPTION, description != null && !description.equals(this.description));
        this.description = description;
    }

    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        fieldChanged(MODIFICATION_DATE_PAID, dueDate != null && !dueDate.equals(this.dueDate));
        this.dueDate = dueDate;
    }

    public Date getPaidDate() {
        return paidDate;
    }

    public void setPaidDate(Date paidDate) {
        fieldChanged(MODIFICATION_DATE_PAID, paidDate != null && !paidDate.equals(this.paidDate));
        this.paidDate = paidDate;
    }

    public double getGrossAmount() {
        return grossAmount;
    }

    public void setGrossAmount(double grossAmount) {
        fieldChanged(MODIFICATION_GROSS_AMOUNT, grossAmount != this.grossAmount);
        this.grossAmount = grossAmount;
    }

    public double getNetAmount() {
        return netAmount;
    }

    public void setNetAmount(double netAmount) {
        fieldChanged(MODIFICATION_NET_AMOUNT, netAmount != this.netAmount);
        this.netAmount = netAmount;
    }

    public BasePaymentStatus getCurrentStatus() {
        return currentStatus;
    }

    public long getCoderId() {
        return coderId;
    }
    public long getId() {
        return id;
    }

    public Date getEventDate() {
        return eventDate;
    }

    public int getModificationRationale() {
        return modificationRationale;
    }

    public void setEventDate(Date eventDate) {
        this.eventDate = eventDate;
    }

    protected void setReferenceDescription(String referenceDescription) {
        this.referenceDescription = referenceDescription;
    }

    public String getReferenceDescription() {
        return referenceDescription;
    }

    public boolean isCharity() {
        return charity;
    }

    public void setCharity(boolean charity) {
        this.charity = charity;
    }


    public int getInstallmentNumber() {
        return installmentNumber;
    }

    public void setInstallmentNumber(int installmentNumber) {
        fieldChanged(MODIFICATION_GROSS_AMOUNT, installmentNumber != this.installmentNumber);
        this.installmentNumber = installmentNumber;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        fieldChanged(MODIFICATION_GROSS_AMOUNT, totalAmount != this.totalAmount);
        this.totalAmount = totalAmount;
    }

    public long getMethodId() {
        return methodId;
    }

    public void setMethodId(long methodId) {
        this.methodId = methodId;
    }

    public void setModificationRationale(int modificationRationale) {
        this.modificationRationale = modificationRationale;
    }

    /**
     * Set the status id.
     * If the value changes, statusDesc is set to null, because that value must be looked up from DB.
     *
     * @param statusId the new status id.
     */
    public void setCurrentStatus(BasePaymentStatus status) {
        fieldChanged(MODIFICATION_STATUS, !status.equals(this.currentStatus));

        this.currentStatus = status;
    }

    public long getContractId() {
        return contractId;
    }

    public void setContractId(long contractId) {
        this.contractId = contractId;
    }
    /**
     * Return the global ad.
     * @return hasGlobalAD the new global ad.
	 * @since 1.5
     */
	public boolean getHasGlobalAD() {
        return hasGlobalAD;
    }

    /**
     * Set the global ad.
     * @param hasGlobalAD the new global ad.
	 * @since 1.5
     */
    public void setHasGlobalAD(boolean hasGlobalAD) {
        this.hasGlobalAD = hasGlobalAD;
    }

    public String getJiraIssueName() {
        return jiraIssueName;
    }

    public void setJiraIssueName(String jiraIssueName) {
        this.jiraIssueName = jiraIssueName;
    }

    /**
     * Base class for processing payments, i.e. completing some information that must be looked
     * up in other tables.
     *
     * @author Cucu
     */
    protected static abstract class Processor {
        /**
         * Implementing classes must return the description of the payment.
         *
         * @return the description of the payment.
         * @throws SQLException if an error occurred trying to access db.
         */
        public abstract String lookupDescription(BasePayment payment) throws SQLException;

        /**
         * Implementing classes must return the description of the reference of the payment.
         *
         * @return the description of the reference of the payment
         * @throws SQLException if an error occurred trying to access db.
         */
        public abstract String lookupReferenceDescription(BasePayment payment) throws SQLException;

        /**
         * Implementing classes must return the date that the event being paid took place.
         *
         * @return the description the date that the event being paid took place.
         * @throws SQLException if an error occurred trying to access db.
         */
        public abstract Date lookupEventDate(BasePayment payment) throws SQLException;

        /**
         * Get the due date of the payment.
         * It is calculated as the day the event being paid took place plus
         * an interval of days that is looked up from the database
         *
         * @return the due date of the payment.
         * @throws SQLException if an error occurred trying to access db.
         */
        public Date lookupDueDate(BasePayment payment) throws SQLException {
            Date eventDate = payment.getEventDate();

            if (eventDate == null) {
                eventDate = new Date();
            }

            return getDueDate(eventDate, payment.getPaymentType());
        }

        /**
         * Fill eventDate, dueDate, statusId and description for the payment.
         *
         * @param payment payment to fill
         * @throws SQLException
         */
        protected void fillData(BasePayment payment) throws SQLException {
            if (payment.getEventDate() == null) {
                payment.setEventDate(lookupEventDate(payment));
            }

            if (payment.getDueDate() == null) {
                payment.setDueDate(lookupDueDate(payment));
            }

            if (payment.getDescription() == null) {
                payment.setDescription(lookupDescription(payment));
            }

            payment.setReferenceDescription(lookupReferenceDescription(payment));
        }


        /**
         * Checks whether the payment is already in the DB.
         * The default behavior is to return always false.
         *
         * @param payment the payment to check for duplicates.
         * @return false
         * @throws SQLException
         */
        public boolean isDuplicated(BasePayment payment) throws SQLException {
            return false;
        }


        /**
         * Close a PreparedStatement.
         *
         * @param ps the PreparedStatement to close.
         */
        protected void close(PreparedStatement ps) {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement.");
                    ignore.printStackTrace();
                }
            }
        }

        /**
         * Close a ResultSet.
         *
         * @param ps the ResultSet to close.
         */
        protected void close(ResultSet rs) {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet.");
                    ignore.printStackTrace();
                }
            }
        }

        /**
         * Close a Connection.
         *
         * @param ps the Connection to close.
         */
        protected void close(Connection conn) {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection.");
                    ignore.printStackTrace();
                }
            }

        }


        /**
         * Run a query in the specified database.
         *
         * @param dbName the name of the database to run the query.
         * @param query query to run.
         * @return the ResultSetContainer for executing the query.
         * @throws SQLException
         */
        protected ResultSetContainer runSelectQuery(String dbName, String query) throws SQLException {
            Connection c = null;
            try {
                c = DBMS.getConnection(dbName);

                return runSelectQuery(c, query);
            } finally {
                close(c);
            }
        }

        /**
         * Run a query in OLTP.
         *
         * @param query query to run.
         * @return the ResultSetContainer for executing the query.
         * @throws SQLException
         */
        protected ResultSetContainer runSelectQuery(String query) throws SQLException {
            return runSelectQuery(DBMS.OLTP_DATASOURCE_NAME, query);
        }

        /**
         * Run a query in the specified connection.
         *
         * @param c connection where the query will run.
         * @param query query to run.
         * @return the ResultSetContainer for executing the query.
         * @throws SQLException
         */
        protected ResultSetContainer runSelectQuery(Connection c, String query) throws SQLException {
            PreparedStatement ps = null;
            ResultSet rs = null;
            try {
                ps = c.prepareStatement(query);
                rs = ps.executeQuery();
                return new ResultSetContainer(rs, false);

            } catch (SQLException e) {
                log.error("SQLException running query: " + query);
                log.error(e.getMessage());
                throw e;

            } catch (Exception e) {
                log.error("Exception running query: " + query);
                log.error(e.getMessage());
                throw new SQLException(e.getMessage());
            } finally {
                close(rs);
                close(ps);
            }
        }

        /**
         * Get the due date for the payment.
         *
         * @param eventDate the date the event took place.
         * @param paymentTypeId type id of the payment
         * @return the due date for the payment.
         */
        protected Date getDueDate(Date eventDate, int paymentTypeId) throws SQLException {
            StringBuffer query = new StringBuffer(100);
            query.append(" SELECT due_date_interval, pay_on_day ");
            query.append(" FROM payment_type_lu ");
            query.append(" WHERE payment_type_id = " + paymentTypeId);

            ResultSetContainer rsc = runSelectQuery(query.toString());

            if (rsc.getRowCount() != 1) {
                throw new IllegalArgumentException("Payment type not found: " + paymentTypeId);
            }

            Calendar dueDateCal = Calendar.getInstance();

            if (rsc.getItem(0, "due_date_interval").getResultData() != null) {
                int days = rsc.getIntItem(0, "due_date_interval");
                dueDateCal.setTime(eventDate);
                dueDateCal.add(Calendar.DAY_OF_YEAR, days);
            } else {
                dueDateCal.setTime(new Date());
                dueDateCal.add(Calendar.MONTH, 1);
                dueDateCal.set(Calendar.DAY_OF_MONTH, rsc.getIntItem(0, "pay_on_day"));
            }

            return dueDateCal.getTime();
        }

        /**
         * Returns whether the user has already sent a Tax form.
         *
         * @param coderId coder to check for tax form
         * @return whether the user has already sent a Tax form.
         * @throws SQLException if a problem occurs accessing DB
         */
        protected boolean hasTaxForm(long coderId) throws SQLException {
            StringBuffer query = new StringBuffer(1000);
            query.append(" SELECT 1 ");
            query.append(" FROM user_tax_form_xref ");
            query.append(" WHERE user_id = " + coderId);

            ResultSetContainer rsc = runSelectQuery(query.toString());

            return rsc.getRowCount() > 0;
        }


        /**
         * Get an ordinal string for a placement.
         * If it's 0, "winnings" is returned, if not, "1st place", "2nd place", "3rd place" and so on.
         *
         * @param placed the placement.
         * @return an ordinal string for a placement.
         */
        protected String getOrdinal(int placed) {
            switch (placed) {
            case 0: return "winnings";
            case 1: return "1st place";
            case 2: return "2nd place";
            case 3: return "3rd place";
            }
            return placed + "th place";
        }
    }
}
