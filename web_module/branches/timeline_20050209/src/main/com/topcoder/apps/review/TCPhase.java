package com.topcoder.apps.review;

import java.util.Date;
import java.util.List;

import com.topcoder.project.phases.Phase;
import com.topcoder.project.phases.Project;

/**
 * This class is used to provide extra functionality to the Phase class:
 * - Support for 0 length phases
 * - Support for construction using start and end date instead of start and length.
 *
 * In order to use that class, the project must have an instance of TCWorkdays as its Workdays, because
 * this class has the needed method to substract dates.
 * VERY IMPORTANT:  if the Phase class is upgraded, please check that all the methods that use the
 * length variable are also upgraded here.
 *
 * @author cucu
 */
public class TCPhase extends Phase {
    /**
     * Indicates wheter this phase has zero length.
     */
    private boolean zeroLength = false;

    /**
     * Builds a phase for the indicated project, that starts in startDate and ends in endDate
     *
     * @param project the project this phase belongs to.
     * @param startDate the start date of the phase.
     * @param endDate the end date of the phase.
     */
    public TCPhase(Project project, Date startDate, Date endDate) {
        super(project, startDate, 1);
        fixLength(project, startDate, endDate);
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
        fixLength(project, startDate, endDate);
    }

    /**
     * <p>Create a new instance of Phase with the project this phase belongs to, the start date and length in hours of
     * the phase. The startDate of the phase is expected to be after the project's startDate always.</p>
     *
     * @param project the project this phase belongs to.
     * @param startDate the start date of the phase.
     * @param length the length in hours of the phase.
     *
     * @throws NullPointerException if project or startDate is null.
     * @throws IllegalArgumentException if the startDate is before the project's startDate or the length is
     *         non-positive.
     */
    public TCPhase(Project project, Date startDate, int length) {
        super(project, startDate, length == 0? 1 : length );
        if (length == 0) {
            setLength(0);
        }
    }

    /**
     * <p>Create a new instance of Phase with the project this phase belongs to, the start date and length in hours of
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
        if (length == 0) {
            setLength(0);
        }

    }


    /**
     * Set the length of the phase in hours, supporting zero length phases.
     *
     * @param length the length of phase in hours.
     *
     * @throws IllegalArgumentException if the length is negative
     */
    public void setLength(int length) {
        zeroLength = length == 0;
        if (!zeroLength) super.setLength(length);
    }

    /**
     * Return the length of the phase in hours, supporting zero length phases.
     *
     * @return the length of phase in hours.
     */
    public int getLength() {
        return zeroLength? 0 : super.getLength();
    }

    /**
     * Calculates when this phase ends, supporting zero length phases.
     */
    public Date calcEndDate() {
        return zeroLength? super.getStartDate() : super.calcEndDate();
    }

    /**
     * Internal method used to calculate and set the length of the project.
     *
     * @param project the project this phase belongs to.
     * @param startDate the start date of the phase.
     * @param endDate the end date of the phase.
     */
    private void fixLength(Project project, Date startDate, Date endDate) {
        if (!(project.getWorkdays() instanceof TCWorkdays)) {
            throw new IllegalArgumentException("The project must have an instance of TCWorkdays as its workdays.");
        }
        TCWorkdays workdays =  (TCWorkdays) project.getWorkdays();
        int hours = Math.round(workdays.getWorkableMinutes(startDate, endDate) / 60);

        setLength(hours);
    }
}
