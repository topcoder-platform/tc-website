package com.topcoder.web.tc.controller.request.development;

import java.sql.Types;

import com.topcoder.shared.dataAccess.resultSet.CalculatedColumn;
import com.topcoder.shared.dataAccess.resultSet.TCDoubleResult;
import com.topcoder.shared.dataAccess.resultSet.TCResultItem;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.web.tc.controller.request.util.ReliabilityBonusCalculator;

/**
 * Column calculator class to be added in a ResultSetContainer to display reliability bonus in active contests page
 *
 * @author pulky
 * @version 1.0
 * 
 * @since BUGR-2749
 */
public class ReliabilityBonusColumnCalculator extends CalculatedColumn {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;
    
    /**
     * Attribute holding the ReliabilityBonusCalculator instance.
     */
    private ReliabilityBonusCalculator reliabilityBonus;

    /**
     * Default constructor
     */
    public ReliabilityBonusColumnCalculator() {
        super(Types.DECIMAL, "reliability_bonus", 10, 2, "");

        try {
            reliabilityBonus = ReliabilityBonusCalculator.getInstance();
        } catch (Exception e) {
            throw new RuntimeException("Could not get ReliabilityBonusCalculator instance", e);
        }
    }

    /**
     * Custom calculation method for this column
     * 
     * @param rsr the ResultSetRow being processed
     * 
     * @return TCResultItem with the value for the new column
     * 
     * @see com.topcoder.shared.dataAccess.resultSet.CalculatedColumn#calculate(com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow)
     */
    @Override
    public TCResultItem calculate(ResultSetRow rsr) {
        Double result = reliabilityBonus.getReliabilityPercent(1.0, rsr.getTimestampItem("posting_date"), 
                rsr.getLongItem("project_category_id")) * rsr.getDoubleItem("price");
        
        return new TCDoubleResult(result);
    }

}
