package com.topcoder.web.tc.controller.request.data;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.datafeed.CommandRunner;
import com.topcoder.web.tc.controller.request.Base;

import javax.servlet.ServletOutputStream;
import java.io.IOException;
import java.util.Map;
import java.util.Vector;

/**
 * @author geldridge
 * @version $Revision$ Date: 2008/04/15 00:00:00
 *          Create Date: Apr 15, 2008
 * @deprecated this class has been moved to its own module and will be removed in the future
 */
public class DistanceFeed extends Base {

    class Coder {
        public String ID = null;
        public String handle = null;
        public int rating = 0;
        public Vector<Double> dist = new Vector<Double>();
        public String desc = "";
        public int overlap;
        public String image = null;
        public double lat = 0;
        public double lon = 0;
        public String country = null;
        public double calc_dist = 0;

        public Coder(String ID, String handle, int rating, String image) {
            this.ID = ID;
            this.handle = handle;
            this.rating = rating;
            this.image = image;
        }
    }

    protected void businessProcessing() throws Exception {
        Vector<Coder> them = getOverlapCoders();
        Coder me = getOverlapMe();

        CoderOverlap co = new CoderOverlap(me, them);

        int tflag = Integer.parseInt(getRequest().getParameter("tf"));
        int cflag = Integer.parseInt(getRequest().getParameter("cf"));

        co.process(tflag, cflag);

        getResponse().setContentType("text/xml");
        writeAsXML(me, them);
        getResponse().flushBuffer();
    }

    private void writeAsXML(Coder first, Vector<Coder> v) {
        try {
            ServletOutputStream os = getResponse().getOutputStream();

            os.println("<map>");

            writeCoder(os, first);

            for (Coder c : v) {
                writeCoder(os, c);
            }

            os.println("</map>");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void writeCoder(ServletOutputStream os, Coder cur) {
        try {
            os.print("<coder>\n");
            os.print("<coder_id>");
            os.print(cur.ID);
            os.print("</coder_id>\n");
            os.print("<handle>");
            os.print(cur.handle);
            os.print("</handle>\n");
            os.print("<rating>");
            os.print(String.valueOf(cur.rating));
            os.print("</rating>\n");
            os.print("<image>");
            os.print(cur.image);
            os.print("</image>\n");
            os.print("<distance>");
            os.print(String.valueOf(cur.dist.get(0)));
            os.print("</distance>\n");
            os.print("<overlap>");
            os.print(String.valueOf(cur.overlap));
            os.print("</overlap>\n");
            os.print("<country>");
            os.print(cur.country);
            os.print("</country>\n");
            os.print("</coder>\n");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private Vector<Coder> getOverlapCoders() {
        Vector<Coder> ret = new Vector<Coder>();
        try {
            Request r = new Request();

            r.setContentHandle("dd_fast_overlap");
            r.setProperty("cr", getRequest().getParameter("cr"));
            DataAccessInt da = getDataAccess(DBMS.DW_DATASOURCE_NAME, false);
            CommandRunner cmd = new CommandRunner(da, r);
            Map<String, ResultSetContainer> dm = cmd.getData();

            ResultSetContainer rsc = dm.get("dd_fast_overlap");
            for (ResultSetContainer.ResultSetRow row : rsc) {
                long ID = row.getLongItem("coder_id");
                String handle = row.getStringItem("handle");
                int rating = row.getIntItem("rating");
                int shared_rounds = row.getIntItem("shared_rounds");
                String image = row.getStringItem("image_name");
                String country = row.getStringItem("country_name");
                double lat = row.getDoubleItem("latitude") * Math.PI / 180.0;
                double lon = row.getDoubleItem("longitude") * Math.PI / 180.0;

                Coder c = new Coder(String.valueOf(ID), handle, rating, image);
                c.overlap = shared_rounds;
                c.country = country;
                c.lat = lat;
                c.lon = lon;

                ret.add(c);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return ret;
    }

    private Coder getOverlapMe() {
        Coder ret = null;
        try {
            Request r = new Request();
            r.setContentHandle("dd_fast_overlap_me");
            r.setProperty("cr", getRequest().getParameter("cr"));

            DataAccessInt da = getDataAccess(DBMS.DW_DATASOURCE_NAME, false);
            CommandRunner cmd = new CommandRunner(da, r);
            Map<String, ResultSetContainer> dm = cmd.getData();
            ResultSetContainer rsc = dm.get("dd_fast_overlap_me");
            ResultSetContainer.ResultSetRow row = rsc.get(0);
            long ID = row.getLongItem("coder_id");
            String handle = row.getStringItem("handle");
            int rating = row.getIntItem("rating");
            int shared_rounds = row.getIntItem("shared_rounds");
            String country = row.getStringItem("country_name");
            double lat = row.getDoubleItem("latitude") * Math.PI / 180.0;
            double lon = row.getDoubleItem("longitude") * Math.PI / 180.0;

            ret = new Coder(String.valueOf(ID), handle, rating, "");
            ret.overlap = shared_rounds;
            ret.dist.add(0.0);
            ret.country = country;
            ret.lat = lat;
            ret.lon = lon;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return ret;
    }

    private class CoderOverlap {
        private Coder me = null;
        private Vector<Coder> them = null;
        private int maxOverlap = Integer.MIN_VALUE;
        private int minOverlap = Integer.MAX_VALUE;
        private static final double EARTH_RADIUS = 6367;
        private static final double MAX_EARTH_DIST = Math.PI * EARTH_RADIUS;

        public CoderOverlap(Coder me, Vector<Coder> them) {
            this.me = me;
            this.them = them;
        }

        public void process(int tflag, int cflag) {
            for (Coder cur : them) {
                if (cur.overlap > maxOverlap) {
                    maxOverlap = cur.overlap;
                }

                if (cur.overlap < minOverlap) {
                    minOverlap = cur.overlap;
                }
            }
            maxOverlap -= minOverlap - 1;

            if ((tflag & 1) != 0) {
                // do rating
                for (Coder cur : them) {
                    ratingDistance(cur);
                }
            }

            if ((tflag & 2) != 0) {
                // do overlap
                for (Coder cur : them) {
                    overlapDistance(cur);
                }
            }

            if ((tflag & 4) != 0) {
                // location
                for (Coder cur : them) {
                    locationDistance(cur);
                }
            }

            for (Coder cur : them) {
                double sum = 0;
                for (Double d : cur.dist) {
                    sum += d;
                }
                sum /= cur.dist.size();
                cur.dist.insertElementAt(sum, 0);
            }
        }

        private void overlapDistance(Coder target) {
            if (me.ID == target.ID) {
                target.dist.add(0.0);
                return;
            }

            double adj = target.overlap - minOverlap;

            target.dist.add(1 - (adj / maxOverlap));

            target.desc += "Shared matches: " + target.overlap + "\n";
        }

        private void ratingDistance(Coder target) {
            if (me.ID == target.ID) {
                target.dist.add(0.0);
                return;
            }

            target.dist.add(Math.abs(target.rating - me.rating) / 4000.0);
        }

        private void locationDistance(Coder you) {
            if (me.ID == you.ID) {
                you.dist.add(0.0);
                return;
            }

            double deltaLong = ((you.lon - me.lon) / 2.0);
            double sinv = Math.sin((you.lat - me.lat) / 2.0);
            double cosv = Math.cos(you.lat) * Math.cos(me.lat) * Math.sin(deltaLong) * Math.sin(deltaLong);
            double angle = 2 * Math.asin(Math.sqrt(sinv * sinv + cosv));
            double distance = EARTH_RADIUS * angle; // km

            you.dist.add(distance / MAX_EARTH_DIST);
            you.calc_dist = distance;
        }
    }


}
