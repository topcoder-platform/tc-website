package com.topcoder.web.tc.controller.request.development;

import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SoftwareComponent;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.Constants;

/**
 * <pProcessor class for design/development active contests processing.</p>
 *
 * <p><b>Change Log:</b></p>
 * <p>
 *   <table>
 *     <tr>
 *         <td>Version 1.1 (BUGR-2749)</td>
 *         <td>
 *           <ul>
 *             <li>Added reliabiity bonus column calculation.</li>
 *           </ul>
 *         </td>
 *     </tr>
 *   </table>
 * </p>
 *
 * @author dok, pulky
 * @version 1.1
 */
public class ViewActiveContests extends Base {
    private String PHASE_ID_KEY = Constants.PHASE_ID;
    
    protected void developmentProcessing() throws TCWebException {
        try {
            int phase_id = Integer.parseInt(StringUtils.checkNull(getRequest().getParameter(PHASE_ID_KEY)));
            if (!(phase_id == SoftwareComponent.DESIGN_PHASE || phase_id == SoftwareComponent.DEV_PHASE)) {
                throw new TCWebException("Missing or invalid phase_id parameter (" + PHASE_ID_KEY + ") expected)");
            }
            getRequest().setAttribute("phase_id_is_design", new Boolean(phase_id == SoftwareComponent.DESIGN_PHASE));


            // Gets sort parameters.
            String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
            String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

            setDefault(DataAccessConstants.SORT_DIRECTION, getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
            setDefault(DataAccessConstants.SORT_COLUMN, getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

            Request r = new Request();
            r.setContentHandle("active_contests");
            if (!sortCol.equals("") && !sortDir.equals("") && !sortCol.equals(RELIABILITY_BONUS_COLUMN_INDEX)) {
                r.setProperty(DataAccessConstants.SORT_DIRECTION, sortDir);
                r.setProperty(DataAccessConstants.SORT_COLUMN, sortCol);
            }
            r.setProperty(DataAccessConstants.SORT_QUERY, "active_contests");

            Map<String, ResultSetContainer> result = getDataAccess().getData(r);
            
            ResultSetContainer rscDev = new ResultSetContainer(result.get("dev_contests"), 
                    new ReliabilityBonusColumnCalculator());
            
            if (sortCol.equals(RELIABILITY_BONUS_COLUMN_INDEX) && !sortDir.equals("")) {
                rscDev.sortByColumn(rscDev.getColumnCount() - 1, sortDir.equals("asc"));
            }
            
            getRequest().setAttribute("devContests", rscDev);

            ResultSetContainer rscDesign = new ResultSetContainer(result.get("design_contests"), 
                    new ReliabilityBonusColumnCalculator());

            if (sortCol.equals(RELIABILITY_BONUS_COLUMN_INDEX) && !sortDir.equals("")) {
                rscDesign.sortByColumn(rscDesign.getColumnCount() - 1, sortDir.equals("asc"));
            }
            
            getRequest().setAttribute("designContests", rscDesign);


            // defines column's default sort.
            SortInfo s = new SortInfo();
            s.addDefault(3, "asc");   // Catalog    
            s.addDefault(2, "asc");   // Component  
            s.addDefault(4, "desc");   // rated Registrants
            s.addDefault(5, "desc");   // unrated Registrants
            s.addDefault(7, "desc");   // total Registrants
            s.addDefault(10, "desc"); // Reg. End   
            s.addDefault(6, "desc");  // Submissions
            s.addDefault(1, "desc");  // Payment    
            s.addDefault(0, "desc");  // Submit by  
            s.addDefault(15, "desc"); // dr points   
            s.addDefault(16, "asc"); // dr points   
            s.addDefault(99, "desc");  // reliability bonus  
            getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
            
            setNextPage("/dev/activeContests.jsp");
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
