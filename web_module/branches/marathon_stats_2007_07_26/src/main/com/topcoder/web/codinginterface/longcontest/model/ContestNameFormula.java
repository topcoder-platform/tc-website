package com.topcoder.web.codinginterface.longcontest.model;

import java.sql.Types;

import com.topcoder.shared.dataAccess.resultSet.FormulaColumn;
import com.topcoder.shared.dataAccess.resultSet.TCResultItem;
import com.topcoder.shared.dataAccess.resultSet.TCStringResult;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.web.codinginterface.longcontest.Constants;

public class ContestNameFormula extends FormulaColumn {

    /**
     * Change it if the serialization for this object will change
     */
    private static final long serialVersionUID = 1L;

    public ContestNameFormula(String columnName) {
        super(Types.VARCHAR, columnName,0,0,"");
    }
    
    @Override
    public TCResultItem calculate(ResultSetRow rsr) {
        String result;
        if (rsr.getIntItem("round_type_id") == Constants.LONG_ROUND_TOURNAMENT_TYPE_ID) {
            result = rsr.getStringItem("contest_name") + " " + rsr.getStringItem("round_name");            
        } else {
            result = rsr.getStringItem("round_name");
        }
        return new TCStringResult(result);
    }

}
