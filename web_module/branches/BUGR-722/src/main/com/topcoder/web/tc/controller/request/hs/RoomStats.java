package com.topcoder.web.tc.controller.request.hs;

import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultFilter;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;

/**
 *
 * @author cucu
 */
public class RoomStats extends Base {

    class RoomFilter implements ResultFilter {

        private int room;

        public RoomFilter(int room) {
            this.room = room;
        }

        public boolean include(ResultSetRow rsr) {
            return rsr.getIntItem("room_id") == room;
        }

    }

    
    protected void businessProcessing() throws TCWebException {
        try {
            if (!userIdentified()) {
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            }

            RoundInfo round = getRoundAndSeasonIds(getRequest());
            ListInfo li = new ListInfo(getRequest(), 4, "ASC");

            int cr = -1;
            if (hasParameter("cr")) {
                cr = Integer.parseInt(getRequest().getParameter("cr"));
            }

            Request r = new Request();
            r.setContentHandle("hs_room_stats");
            r.setProperty("rd", round.getRoundId() + "");
            r.setProperty("snid", round.getSeasonId() + "");
            r.setProperty("sntid", HS_SNTID + "");
            r.setProperty("cr", cr + "");

            DataAccessInt dai = getDataAccess(true);
            Map result = dai.getData(r);

            ResultSetContainer indResult = (ResultSetContainer) result.get("hs_ind_result");

            int rm = -1;
            if (hasParameter("rm")) {
                rm = Integer.parseInt(getRequest().getParameter("rm"));
            } else {
                for (int i = 0; i < indResult.getRowCount(); i++)
                {
                    if (indResult.getIntItem(i, "coder_id") == cr) {
                        rm = indResult.getIntItem(i, "room_id");
                        break;
                    }
                }
            }


            fillRoundAndSeasonNames (round, result);

            ResultSetContainer roomResult = new ResultSetContainer(indResult, new RoomFilter(rm));
            result.put("room_result", roomResult);

            sortAndCrop(result, "room_result", li);
            getRequest().setAttribute("resultMap", result);
            getRequest().setAttribute("roundInfo", round);
            getRequest().setAttribute("listInfo", li);
            getRequest().setAttribute("cr", cr + "");

            setNextPage(Constants.HS_ROOM_STATS);
            setIsNextPageInContext(true);
        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }


}
