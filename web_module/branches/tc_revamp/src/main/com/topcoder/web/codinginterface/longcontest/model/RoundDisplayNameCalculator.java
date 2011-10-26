package com.topcoder.web.codinginterface.longcontest.model;

import java.sql.Types;

import com.topcoder.shared.dataAccess.resultSet.CalculatedColumn;
import com.topcoder.shared.dataAccess.resultSet.TCResultItem;
import com.topcoder.shared.dataAccess.resultSet.TCStringResult;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.web.codinginterface.longcontest.Helper;

/**
 * Calculated column to be added in a ResultSetContainer for the display name of a round.
 *
 * @author Cucu
 *
 */
public class RoundDisplayNameCalculator extends CalculatedColumn {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;

    public RoundDisplayNameCalculator(String columnName) {
        super(Types.VARCHAR, columnName,0,0,"");
    }

    @Override
    public TCResultItem calculate(ResultSetRow rsr) {
        String result = Helper.displayName(rsr.getIntItem("round_type_id"),
                rsr.getStringItem("contest_name"), rsr.getStringItem("round_name"));
        return new TCStringResult(result);
    }

}
