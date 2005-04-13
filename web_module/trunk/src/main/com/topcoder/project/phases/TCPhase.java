package com.topcoder.project.phases;

import java.util.Date;
import java.util.List;

import com.topcoder.apps.review.TCWorkdays;
import com.topcoder.date.workdays.WorkdaysUnitOfTime;


/**
 * This class is used to provide extra functionality to the Phase class:
 * - Support for 0 length phases
 * - Support for construction using start and end date instead of start and length.
 * - Use minutes instead of hours.
 *
 * In order to use that class, the project must have an instance of TCWorkdays as its Workdays, because
 * this class has the needed method to substract dates.
 * VERY IMPORTANT:  if the Phase class is upgraded, please check that all the methods that use the
 * length variable or do a computation using hours are also upgraded here.
 *
 * @author cucu
 */
public class TCPhase extends Phase {
    /**
     * <p>Represents the project instance this phase belongs to, it is initialized in the constructor and never
     * changed afterward.</p>
     */
    private Project project = null;

    /**
     * Indicates wheter this phase has zero length.
     */
    private boolean zeroLength = false;

    /**
     * <p>Represents the end date of the phase. This variable stands as a cache. Once the startDate is adjusted,
     * it is cleared and will be calculated again once calcEndDate() is invoked. Otherwise it is returned without
     * calculation.</p>
     */
    private Date endDate = null;

    /**
     * Builds a phase for the indicated project, that starts in startDate and ends in endDate
     *
     * @param project the project this phase belongs to.
     * @param startDate the start date of the phase.
     * @param endDate the end date of the phase.
     */
    public TCPhase(Project project, Date startDate, Date endDate) {
        super(project, startDate, 1);
        this.project = project;
        fixLength(startDate, endDate);
    }

    /**
     * Builds a phase for the indicated project, that starts in startDate and ends in endDate, and
     * add the indicated dependencies.
     *
     * @param project the project this phase belongs to.
     * @param startDate the start date of the phase.
     * @param endDate the end date of the phase.
     * @param dependencies the phases this one depends on.
     */
    public TCPhase(Project project, Date startDate, Date endDate, List dependencies) {
        super(project, startDate, 1, dependencies);
        this.project = project;
        fixLength( startDate, endDate);
    }

    /**
     * <p>Create a new instance of Phase with the project this phase belongs to, the start date and length in minutes of
     * the phase. The startDate of the phase is expected to be after the project's startDate always.</p>
     *
     * @param project the project this phase belongs to.
     * @param startDate the start date of the phase.
     * @param length the length in minutes of the phase.
     *
     * @throws NullPointerException if project or startDate is null.
     * @throws IllegalArgumentException if the startDate is before the project's startDate or the length is
     *         non-positive.
     */
    public TCPhase(Project project, Date startDate, int length) {
        super(project, startDate, length == 0? 1 : length );
        this.project = project;
        if (length == 0) {
            setLength(0);
        }
    }

    /**
     * <p>Create a new instance of Phase with the project this phase belongs to, the start date and length in minutes of
     * the phase, and a list of phases the created phase depends on. The startDate of the phase is expected to be
     * after the project's startDate always.</p>
     *
     * @param project the project this phase belongs to.
     * @param startDate the start date of the phase.
     * @param length the length of the phase.
     * @param dependencies the phases this one depends on.
     *
     * @throws NullPointerException if project, startDate, or dependencies is null.
     * @throws IllegalArgumentException if the startDate is before the project's startDate or the length is
     *         non-positive, or the instance in dependencies list is not Phase object, or project of the phase in the
     *         list is not the same as the given one.
     */
    public TCPhase(Project project, Date startDate, int length, List dependencies) {
        super(project, startDate, length == 0? 1 : length, dependencies);
        this.project = project;
        if (length == 0) {
            setLength(0);
        }

    }


    /**
     * Set the length of the phase in minutes, supporting zero length phases.
     *
     * @param length the length of phase in minutes.
     *
     * @throws IllegalArgumentException if the length is negative
     */
    public void setLength(int length) {
        zeroLength = length == 0;
        if (!zeroLength) super.setLength(length);
    }

    /**
     * Return the length of the phase in minutes, supporting zero length phases.
     *
     * @return the length of phase in minutes.
     */
    public int getLength() {
        return zeroLength? 0 : super.getLength();
    }


    /**
     * Internal method used to calculate and set the length of the project.
     *
     * @param project the project this phase belongs to.
     * @param startDate the start date of the phase.
     * @param endDate the end date of the phase.
     */
    private void fixLength(Date startDate, Date endDate) {
        if (!(project.getWorkdays() instanceof TCWorkdays)) {
            throw new IllegalArgumentException("The project must have an instance of TCWorkdays as its workdays.");
        }
        TCWorkdays workdays =  (TCWorkdays) project.getWorkdays();

        setLength(workdays.getWorkableMinutes(startDate, endDate));
    }


    /**
     * Calculate the end date for this phase, using the time in minutes.
     *
     * @return the end date of the phase.
     */
    public Date calcEndDate() {
        if (zeroLength) {
            return super.getStartDate();
        }
        // If endDate is not cached, we perform the calculation.
        if (endDate == null) {
            endDate = project.getWorkdays().add(getStartDate(), WorkdaysUnitOfTime.MINUTES, getLength());
        }

        // Copy is made since Date is mutable.
        return new Date(endDate.getTime());
    }

    /**
     * Adjust the start date of the phase, it will be called in the project.adjustPhases() method to adjust the
     * Phase.adjustedStartDate() to correct time.
     *
     * @param startDate to start adjust with.
     */
    void adjustStartDate(Date startDate) {
        endDate = null;
        super.adjustStartDate(startDate);
    }


}
