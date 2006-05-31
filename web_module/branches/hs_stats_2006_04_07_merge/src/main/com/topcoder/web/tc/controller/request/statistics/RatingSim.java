/*
 * RatingSim.java
 *
 * Created on October 18, 2004, 2:09 PM
 */

package com.topcoder.web.tc.controller.request.statistics;

import com.topcoder.shared.dataAccess.CachedQueryDataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.QueryRequest;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Map;
import java.util.Vector;

/**
 *
 * @author  rfairfax
 */
public class RatingSim extends Base {
    protected void businessProcessing() throws TCWebException {
        try {
            if (!userIdentified())
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));

            //defaults
            if (getRequest().getParameter("Contest") != null) {
                setDefault("Contest", getRequest().getParameter("Contest"));
            }

            if (getRequest().getParameter("Rating") != null) {
                setDefault("Rating", getRequest().getParameter("Rating"));
            }

            if (getRequest().getParameter("Vol") != null) {
                setDefault("Vol", getRequest().getParameter("Vol"));
            }

            if (getRequest().getParameter("Division") != null) {
                getRequest().setAttribute("Division", getRequest().getParameter("Division"));
            }

            if (getRequest().getParameter("Score") != null) {
                setDefault("Score", getRequest().getParameter("Score"));
            }

            Request r = new Request();
            r.setContentHandle("Rounds_By_Date");

            DataAccessInt dai = getDataAccess(true);

            Map m = dai.getData(r);

            getRequest().setAttribute("Rounds_By_Date", m.get("Rounds_By_Date"));

            //check if postback
            if (getRequest().getParameter("postback") != null && getRequest().getParameter("postback").equals("true")) {
                boolean valid = true;
                //round
                int roundId = 0;
                if (getRequest().getParameter("Contest") != null && !getRequest().getParameter("Contest").equals("")) {
                    try {
                        roundId = Integer.parseInt(getRequest().getParameter("Contest"));
                    } catch (Exception e) {
                        addError("Contest", "Invalid number format");
                        valid = false;
                    }
                } else {
                    addError("Contest", "Please select a round");
                    valid = false;
                }

                //rating
                int rating = 0;
                if (getRequest().getParameter("Rating") != null && !getRequest().getParameter("Rating").equals("")) {
                    try {
                        rating = Integer.parseInt(getRequest().getParameter("Rating"));
                    } catch (Exception e) {
                        addError("Rating", "Invalid number format");
                        valid = false;
                    }
                } else {
                    addError("Rating", "Please enter a rating");
                    valid = false;
                }

                //vol
                int vol = 0;
                if (getRequest().getParameter("Vol") != null && !getRequest().getParameter("Vol").equals("")) {
                    try {
                        vol = Integer.parseInt(getRequest().getParameter("Vol"));
                    } catch (Exception e) {
                        addError("Vol", "Invalid number format");
                        valid = false;
                    }
                } else {
                    addError("Vol", "Please enter a volatility");
                    valid = false;
                }

                //division
                int division = 0;
                if (getRequest().getParameter("Division") != null && !getRequest().getParameter("Division").equals("")) {
                    try {
                        division = Integer.parseInt(getRequest().getParameter("Division"));
                    } catch (Exception e) {
                        addError("Division", "Invalid number format");
                        valid = false;
                    }
                } else {
                    addError("Division", "Please select a division");
                    valid = false;
                }

                //score
                double score = 0;
                if (getRequest().getParameter("Score") != null && !getRequest().getParameter("Score").equals("")) {
                    try {
                        score = Double.parseDouble(getRequest().getParameter("Score"));
                    } catch (Exception e) {
                        addError("Score", "Invalid number format");
                        valid = false;
                    }
                } else {
                    addError("Score", "Please enter a score");
                    valid = false;
                }

                if (valid) {
                    //run
                    int newrating = doIt(roundId, division, getUser().getId(), rating, vol, score);

                    getRequest().setAttribute("sim_results", String.valueOf(newrating));
                }
            }
        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }


        setNextPage(Constants.RATING_SIM);
        setIsNextPageInContext(true);
    }

    private int doIt(int roundId, int divisionId, long coderId, int rating, int vol, double score) throws Exception {

        StringBuffer sqlStr = new StringBuffer(400);
        int room,newrating,newvol,coder,retVal,newratingnovol;
        Vector names,ratings,volatilities,timesplayed,scores,endratings,endvols,endratingsnovol,ratingsplusprov,namesplusprov,
                volatilitiesplusprov,timesplayedplusprov,scoresplusprov,stringnames,stringnamesplusprov;
        ArrayList results = new ArrayList();
        ArrayList resultsplusprov = new ArrayList();

        try {

            CachedQueryDataAccess daccess = new CachedQueryDataAccess(DBMS.OLTP_DATASOURCE_NAME);
            QueryRequest r = new QueryRequest();

            CachedQueryDataAccess dwaccess = new CachedQueryDataAccess(DBMS.DW_DATASOURCE_NAME);
            QueryRequest rdw = new QueryRequest();

            names = new Vector();
            namesplusprov = new Vector();
            ratings = new Vector();
            ratingsplusprov = new Vector();
            volatilities = new Vector();
            volatilitiesplusprov = new Vector();
            timesplayed = new Vector();
            timesplayedplusprov = new Vector();
            scores = new Vector();
            scoresplusprov = new Vector();
            stringnames = new Vector();
            stringnamesplusprov = new Vector();

            //get a bunch of info of coders in the room
            sqlStr.replace(0, sqlStr.length(), "SELECT ra.coder_id,ra.rating_no_vol,ra.vol,ra.num_ratings,rr.point_total,rr.attended,u.handle ");
            sqlStr.append("FROM rating ra, user u,room_result rr, room r ");
            sqlStr.append("WHERE rr.round_id = " + roundId + " and u.user_id=ra.coder_id and rr.coder_id=ra.coder_id and r.room_id = rr.room_id and r.division_id = " + divisionId + " and rr.coder_id <> " + coderId);

            r.addQuery("rating_sim_coder_data_" + roundId + "_" + coderId, sqlStr.toString());

            sqlStr.replace(0, sqlStr.length(), "SELECT rr.round_id, r.name, r.contest_id, cal.date, c.name, rr.new_rating, rr.room_id ");
            sqlStr.append("FROM contest c, round r, calendar cal, room_result rr ");
            sqlStr.append("WHERE rr.coder_id = " + coderId + " ");
            sqlStr.append("AND r.round_id = rr.round_id ");
            sqlStr.append("AND c.contest_id = r.contest_id ");
            sqlStr.append("AND cal.calendar_id = r.calendar_id ");
            sqlStr.append("AND r.round_type_id IN (1,2,10) ");
            sqlStr.append("AND r.calendar_id < (select calendar_id from round where round_id = " + roundId + ") ");

            rdw.addQuery("rating_sim_coder_info_" + coderId, sqlStr.toString());

            Map data = daccess.getData(r);
            ResultSetContainer rsCoders = (ResultSetContainer) data.get("rating_sim_coder_data_" + roundId + "_" + coderId);

            data = dwaccess.getData(rdw);
            ResultSetContainer rsInfo = (ResultSetContainer) data.get("rating_sim_coder_info_" + coderId);

            //add each coder and his info to the vectors.
            String handle = "";

            for (int i = 0; i < rsCoders.size(); i++) {
                if (rsCoders.getStringItem(i, "attended").equals("Y")) {
                    namesplusprov.add("" + rsCoders.getIntItem(i, "coder_id"));
                    timesplayedplusprov.add(new Integer(rsCoders.getIntItem(i, "num_ratings")));
                    scoresplusprov.add(new Double(rsCoders.getDoubleItem(i, "point_total")));
                    handle = rsCoders.getStringItem(i, "handle");
                    if (handle == null) handle = "";
                    stringnamesplusprov.add(handle);

                    if (rsCoders.getIntItem(i, 4) > 0) {
                        volatilitiesplusprov.add(new Double(rsCoders.getIntItem(i, "vol")));
                        ratingsplusprov.add(new Double(rsCoders.getIntItem(i, "rating_no_vol")));
                        names.add("" + rsCoders.getIntItem(i, "coder_id"));
                        ratings.add(new Double(rsCoders.getIntItem(i, "rating_no_vol")));
                        volatilities.add(new Double(rsCoders.getIntItem(i, "vol")));
                        timesplayed.add(new Integer(rsCoders.getIntItem(i, "num_ratings")));
                        scores.add(new Double(rsCoders.getDoubleItem(i, "point_total")));
                        stringnames.add(handle);
                    } else {
                        volatilitiesplusprov.add(new Double(515));
                        ratingsplusprov.add(new Double(1200.0));
                    }

                }
            }

            //add user data
            namesplusprov.add("" + coderId);
            timesplayedplusprov.add(new Integer(rsInfo.size()));
            scoresplusprov.add(new Double(score));
            stringnamesplusprov.add("" + coderId);
            if (rating > 0) {
                volatilitiesplusprov.add(new Double(vol));
                ratingsplusprov.add(new Double(rating));
                names.add("" + coderId);
                ratings.add(new Double(rating));
                volatilities.add(new Double(vol));
                timesplayed.add(new Integer(rsInfo.size()));
                scores.add(new Double(score));
                stringnames.add("" + coderId);
            } else {
                volatilitiesplusprov.add(new Double(515));
                ratingsplusprov.add(new Double(1200.0));
            }

            //run qubits rating algorithm on them

            if (rating > 0) {
                results = rateEvent(names, ratings, volatilities, timesplayed, scores, stringnames, false);
            } else {
                results = rateEvent(namesplusprov, ratingsplusprov, volatilitiesplusprov, timesplayedplusprov, scoresplusprov, stringnamesplusprov, true);
            }

            //lookup user

            endratings = (Vector) results.get(2);
            endvols = (Vector) results.get(1);
            endratingsnovol = (Vector) results.get(0);

            while (endratings.size() > 0) {
                newrating = Math.round(((Double) endratings.remove(0)).floatValue());
                //newratingnovol = Math.round(((Double) endratingsnovol.remove(0)).floatValue());
                //newvol = Math.round(((Double) endvols.remove(0)).floatValue());
                coder = (new Integer(names.remove(0).toString())).intValue();

                if (coder == coderId) {
                    return newrating;
                }

            } // end while loop over endratings


// All changes made
        } catch (Exception e) {
            throw e;
        }
        return 0;
    }

//-------------FUNCTIONS AND VARIABLES USED BY QUBITS RATING SYSTEM-----------------------
    int STEPS = 100;
    double initialScore = 1200.0;
    double oneStdDevEquals = 1200.0; /* rating points */
    double initialVolatility = 515;
    double firstVolatility = 385;
    double initialWeight = 0.60;
    double finalWeight = 0.18;
    double volatilityWeight = 0;
    double matchStdDevEquals = 500.0;	/* rating points */
    int people = 0;
    double sqiv = 0.0;
    int people2 = 0;
    double sqfv = 0.0;
    double fv = 0.0;
    int people3 = 0;
    double sb = 0.0;
    int people4 = 0;
    double sqdf = 0.0;

    /**
     *
     * @param names
     * @param ratings
     * @param volatilities
     * @param timesPlayed
     * @param scores
     * @param stringnames
     * @param prov if true, the list includes people that have been never been rated before this round
     * @return
     */
    private ArrayList rateEvent(Vector names, Vector ratings, Vector volatilities, Vector timesPlayed, Vector scores, Vector stringnames, boolean prov) {
        Vector eranks = new Vector();
        Vector eperf = new Vector();
        Vector ranks = new Vector();
        Vector perf = new Vector();
        Vector newVolatility = new Vector();
        Vector newRating = new Vector();
        Vector newRatingWithVol = new Vector();
        int i, j;
        double aveVol = 0,rating,vol;

        /* COMPUTE AVERAGE RATING */
        double rave = 0.0;
        for (i = 0; i < ratings.size(); i++) {
            rave += ((Double) ratings.elementAt(i)).doubleValue();
        }
        rave /= ratings.size();

        /* COMPUTE COMPETITION FACTOR */
        double rtemp = 0, vtemp = 0;
        for (i = 0; i < ratings.size(); i++) {
            vtemp += sqr(((Double) volatilities.elementAt(i)).doubleValue());
            rtemp += sqr(((Double) ratings.elementAt(i)).doubleValue() - rave);
        }
        matchStdDevEquals = Math.sqrt(vtemp / ratings.size() + rtemp / (ratings.size() - 1));

        /* COMPUTE EXPECTED RANKS */
        for (i = 0; i < names.size(); i++) {
            ranks.addElement(new Double(0));
            perf.addElement(new Double(0));
            double est = 0.5;
            double myskill = (((Double) ratings.elementAt(i)).doubleValue() - initialScore) / oneStdDevEquals;
            double mystddev = ((Double) volatilities.elementAt(i)).doubleValue() / oneStdDevEquals;
            for (j = 0; j < names.size(); j++) {
                est += winprobability(myskill, mystddev, (((Double) ratings.elementAt(j)).doubleValue() - initialScore) / oneStdDevEquals, ((Double) volatilities.elementAt(j)).doubleValue() / oneStdDevEquals);
            }
            eranks.addElement(new Double(est));
            eperf.addElement(new Double(-normsinv((est - .5) / names.size())));
        }

        /* COMPUTE ACTUAL RANKS */
        for (i = 0; i < names.size();) {
            double max = Double.NEGATIVE_INFINITY;
            int count = 0;

            for (j = 0; j < names.size(); j++) {
                if (((Double) scores.elementAt(j)).doubleValue() >= max && ((Double) ranks.elementAt(j)).doubleValue() == 0) {
                    if (((Double) scores.elementAt(j)).doubleValue() == max)
                        count++;
                    else
                        count = 1;
                    max = ((Double) scores.elementAt(j)).doubleValue();
                }
            }
            for (j = 0; j < names.size(); j++) {
                if (((Double) scores.elementAt(j)).doubleValue() == max) {
                    ranks.setElementAt(new Double(i + 0.5 + count / 2.0), j);
                    perf.setElementAt(new Double(-normsinv((i + count / 2.0) / names.size())), j);
                }
            }
            i += count;
        }

        /* UPDATE RATINGS */
        for (i = 0; i < names.size(); i++) {
            double diff = ((Double) perf.elementAt(i)).doubleValue() - ((Double) eperf.elementAt(i)).doubleValue();
            sqdf += diff * diff;
            people4++;
            double oldrating = ((Double) ratings.elementAt(i)).doubleValue();
            double performedAs = oldrating + diff * matchStdDevEquals;
            double weight = (initialWeight - finalWeight) / (((Integer) timesPlayed.elementAt(i)).intValue() + 1) + finalWeight;

            //get weight - reduce weight for highly rated people
            weight = 1 / (1 - weight) - 1;
            if (oldrating >= 2000 && oldrating < 2500) weight = weight * 4.5 / 5.0;
            if (oldrating >= 2500) weight = weight * 4.0 / 5.0;

            double newrating = (oldrating + weight * performedAs) / (1 + weight);

            //get and inforce a cap
            double cap = 150 + 1500 / (2 + ((Integer) timesPlayed.elementAt(i)).intValue());
            if (oldrating - newrating > cap) newrating = oldrating - cap;
            if (newrating - oldrating > cap) newrating = oldrating + cap;
            if (newrating < 1) newrating = 1;

            newRating.addElement(new Double(newrating));

            if (((Integer) timesPlayed.elementAt(i)).intValue() != 0) {
                if (((Integer) timesPlayed.elementAt(i)).intValue() == 1) {
                    fv += (performedAs - oldrating);
                    sqfv += (performedAs - oldrating) * (performedAs - oldrating);
                    people2++;
                } else {
                    sb += (performedAs - oldrating) * (performedAs - oldrating);
                    people3++;
                }
                double oldVolatility = ((Double) volatilities.elementAt(i)).doubleValue();
                newVolatility.addElement(new Double(Math.sqrt((oldVolatility * oldVolatility
                        + weight * (diff * matchStdDevEquals) * (diff * matchStdDevEquals) / (1 + weight)) / (1 + weight))));
            } else {
                sqiv += (performedAs - oldrating) * (performedAs - oldrating);
                people++;
                newVolatility.addElement(new Double(firstVolatility));
            }
        }
        aveVol = 385;

        for (i = 0; i < newVolatility.size(); i++) {
            rating = ((Double) newRating.elementAt(i)).doubleValue();
            vol = ((Double) newVolatility.elementAt(i)).doubleValue();
            newRatingWithVol.addElement(new Double(rating + volatilityWeight * (aveVol - vol)));
            //if this includes includes the people that have never been rated before
            //and this particular person has been rated before them, then pull them out of the lists
            if (prov && ((Integer) timesPlayed.elementAt(i)).intValue() > 0) {
                names.remove(i);
                timesPlayed.remove(i);
                ratings.remove(i);
                volatilities.remove(i);
                eranks.remove(i);
                eperf.remove(i);
                scores.remove(i);
                ranks.remove(i);
                perf.remove(i);
                newRating.remove(i);
                newVolatility.remove(i);
                newRatingWithVol.remove(i);
                stringnames.remove(i);
                i--;
            }
        }

        log.info("Handle   Player  # Rate Vol Es.R E.SD  Score  Ac.R A.SD D.SD N.RT N.V N.VR");
        for (i = 0; i < names.size(); i++) {
            if (!prov || (prov && ((Integer) timesPlayed.elementAt(i)).intValue() == 0))
                log.info(
                        fS1((String) stringnames.elementAt(i)) + " " +
                        ((String) names.elementAt(i)) + "  " +
                        ((Integer) timesPlayed.elementAt(i)).intValue() + " " +
                        in4((Double) ratings.elementAt(i)) + " " +
                        ((Double) volatilities.elementAt(i)).intValue() + " " +
                        rat((Double) eranks.elementAt(i)) + " " +
                        fD2((Double) eperf.elementAt(i)) + " " +
                        scr((Double) scores.elementAt(i)) + " " +
                        rat((Double) ranks.elementAt(i)) + " " +
                        fD2((Double) perf.elementAt(i)) + " " +
                        fD2(new Double(((Double) perf.elementAt(i)).doubleValue() -
                        ((Double) eperf.elementAt(i)).doubleValue())) +
                        " " + in4((Double) newRating.elementAt(i)) + " " +
                        ((Double) newVolatility.elementAt(i)).intValue()
                        + " " + in4((Double) newRatingWithVol.elementAt(i))
                );
        }

        ArrayList al = new ArrayList();
        al.add(newRating);
        al.add(newVolatility);
        al.add(newRatingWithVol);
        al.add(names);
        return al;
    }

    private String fS1(String in) {
        if (in.length() > 8) return in.substring(0, 8);
        while (in.length() < 8) in = in + " ";
        return in;
    }

    private String fD1(Double in) {
        DecimalFormat oneDigit = new DecimalFormat("0.0");
        return oneDigit.format(in.doubleValue());
    }

    private String fD2(Double in) {
        DecimalFormat oneDigit = new DecimalFormat("0.0");
        DecimalFormat twoDigits = new DecimalFormat("0.00");
        if (in.doubleValue() < 0)
            return oneDigit.format(in.doubleValue());
        return twoDigits.format(in.doubleValue());
    }

    private String scr(Double in) {
        DecimalFormat sixDigits = new DecimalFormat("0000.00");
        DecimalFormat fiveDigits = new DecimalFormat("000.00");
        if (in.doubleValue() < 0)
            return fiveDigits.format(in.doubleValue());
        return sixDigits.format(in.doubleValue());
    }

    private String rat(Double in) {
        DecimalFormat twoDigits = new DecimalFormat("00.0");
        DecimalFormat threeDigits = new DecimalFormat("000.");
        if (in.doubleValue() < 100)
            return twoDigits.format(in.doubleValue());
        return threeDigits.format(in.doubleValue());
    }

    private String in4(Double in) {
        DecimalFormat oneDigit = new DecimalFormat("0000");
        return oneDigit.format(in.doubleValue());
    }

    private double sqr(double j) {
        return j * j;
    }

    private double normsinv(double p) {
        /* Calculates approximation to the inverse of the cumulative
             standard normal distribution function

             http://www.pitt.edu/~wpilib/statfaq/gaussfaq.html */

        if (p <= 0) return Double.NEGATIVE_INFINITY;
        if (p >= 1) return Double.POSITIVE_INFINITY;

        double t;

        if (p <= .5) {
            t = Math.sqrt(-2.0 * Math.log(p));
            return -t + (2.515517 + t * (0.802853 + t * 0.010328)) / (1 + t * (1.432788 + t * (0.189269 + t * 0.001308)));
        } else {
            t = Math.sqrt(-2.0 * Math.log(1 - p));
            return t - (2.515517 + t * (0.802853 + t * 0.010328)) / (1 + t * (1.432788 + t * (0.189269 + t * 0.001308)));
        }
    }

    private double norminv(double p, double mean, double stddev) {
        return mean + normsinv(p) * stddev;
    }

    private double winprobability(double meana, double stddeva, double meanb, double stddevb) {
        double count = 0;
        double a = 0, b = 0;
        double fa = norminv((a + 0.5) / STEPS, meana, stddeva);
        double fb = norminv((b + 0.5) / STEPS, meanb, stddevb);
        while (a < STEPS) {
            if (fa < fb) {
                count += STEPS - b;
                a++;
                fa = norminv((a + 0.5) / STEPS, meana, stddeva);
            } else if (fa == fb) {
                count += STEPS - b - 0.5;
                a++;
                b++;
                fa = norminv((a + 0.5) / STEPS, meana, stddeva);
                fb = norminv((b + 0.5) / STEPS, meanb, stddevb);
            } else {
                b++;
                if (b == STEPS) break;
                fb = norminv((b + 0.5) / STEPS, meanb, stddevb);
            }
        }
        return count / (STEPS * STEPS);
    }
//----------------------END RATING FUNCTIONS-----------------------------------------------

}
