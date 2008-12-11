//package com.topcoder.utilities;

import java.lang.*;
import java.util.*;
import java.sql.*;
import java.io.*;
//import javax.naming.*;
import java.text.DecimalFormat;

//import com.topcoder.netCommon.contest.*;
//import com.topcoder.server.common.*;

public class RatingQubits {

    public static void main(String[] args) {
        int numArgs = args.length;
        int phaseId = -1;
        int compId = -1;
        boolean isFinal = true;
        boolean runAll = false;
        RatingQubits tmp = new RatingQubits();
        if (numArgs == 1 && args[0].equals("ALL"))
        {
            runAll = true;
        }
        else if (numArgs != 3) {
            System.out.println("SYNTAX: java com.topcoder.utilities.RatingQubits <phase id> <comp_vers id> <isFinal true/false>");
            return;
        }
        else
        {
            phaseId = Integer.parseInt(args[0]);
            compId = Integer.parseInt(args[1]);
            isFinal = "true".equals(args[2]);

        }


// dpecora - wrap connection to enable external call (specifically,
// from AdminServicesBean)

        Connection c = null;
        try {
            Class.forName("com.informix.jdbc.IfxDriver");
            c = DriverManager.getConnection("jdbc:informix-sqli://172.16.20.25:1526/tcs_catalog2:INFORMIXSERVER=tc_memeber_dev_tcp;user=coder;password=altec");

            c.setAutoCommit(true);
            if(runAll){
                tmp.runAllScores(c);
            }
            else{
                tmp.runRatings(c, phaseId, compId, isFinal);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                //if (c != null) c.setAutoCommit(true);
            } catch (Exception e1) {
                System.out.println ("exception A: " + e1);
            }
            try {
                if (c != null) c.close();
            } catch (Exception e1) {
                System.out.println ("exception B: " + e1);
            }
        }
    }

    public void runAllScores(Connection conn)
    {
        String sqlStr ="   SELECT distinct phase_id, comp_vers_id" +
                       "     FROM user_component_score" +
                       "    WHERE processed = 0 " +
                       " ORDER BY phase_id asc, comp_vers_id asc";
        PreparedStatement ps = null;
        ResultSet rs = null;

        try{
            ps = conn.prepareStatement(sqlStr);
            rs = ps.executeQuery();
            while (rs.next()) {
                this.runRatings(conn, rs.getInt("phase_id"), rs.getInt("comp_vers_id"), true);
            }
        }
        catch(SQLException sqe){
            System.err.println(sqe);
        }
        catch(Exception sqe){
            System.err.println("Exception:" + sqe);
        }
        finally{
            if(rs != null)
                try{rs.close();}catch(Exception e){System.err.println("could not close");}
            if(ps != null)
                try{ps.close();}catch(Exception e){System.err.println("could not close");}
            ps = null;
            rs = null;
        }

   }

    // This function is what should be called if updating ratings from an external program
    // It is assumed that autocommit is false on the connection if updating ratings
    public void runRatings(Connection c, int phaseId, int compId, boolean isFinal) throws Exception {
        try {
            rateDesigns(c, phaseId, compId, isFinal);
            if (isFinal) {
                //c.commit();
            }
        } catch (Exception e) {
            try {
                System.out.println("trying to commit" + e);
                if (isFinal) c.rollback();
            } catch (Exception e1) {
                System.out.println ("exception C: " + e1);
            }
            throw e;
        }
    }


    private void rateDesigns(Connection conn, int phaseId, int compVersId, boolean isFinal) throws Exception {
        PreparedStatement ps = null, ps2 = null;
        ResultSet rs2 = null, rsUser = null;
        StringBuffer sqlStr = new StringBuffer(400);
        int i,room,newrating,newvol,coder,retVal,newratingnovol,levelId;
        double score;
        ArrayList results, resultsplusprov;
        Vector names,ratings,volatilities,timesplayed,scores,endratings,endvols,endratingsnovol,ratingsplusprov,namesplusprov,
                volatilitiesplusprov,timesplayedplusprov,scoresplusprov,stringnames,stringnamesplusprov;

        endratings = new Vector();
        endvols = new Vector();
        endratingsnovol = new Vector();
        try {

      Timestamp currentTime = new Timestamp((new java.util.Date()).getTime());
          //Timestamp currentTime = ServerContestConstants.getCurrentTimestamp(conn);

          for (levelId = 100; levelId <= 500; levelId += 100) {
              //Timestamp currentTime = ServerContestConstants.getCurrentTimestamp(conn);

            int processed = 0;
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

            if (phaseId == 12345) {
              sqlStr.replace(0, sqlStr.length(), "DELETE from user_rating;UPDATE user_component_score SET processed = 0");
              ps = conn.prepareStatement(sqlStr.toString());
              retVal = ps.executeUpdate();
              ps.close();
              System.out.println("Users cleared");
              return;
            }
                    sqlStr.replace(0, sqlStr.length(), "UPDATE user_component_score SET processed=1 ");
                            sqlStr.append(" WHERE processed = 0 and comp_vers_id = ? and phase_id = ?");
                    //sqlStr.append(" WHERE comp_vers_id = ? and phase_id = ?");
                    ps = conn.prepareStatement(sqlStr.toString());
                    ps.setInt(1, compVersId);
                    ps.setInt(2, phaseId);
                    retVal = ps.executeUpdate();
                    ps.close();
                    ps = null;


            //get a bunch of info of designers
            sqlStr.replace(0, sqlStr.length(), "SELECT user_id, score, create_date_time, comp_vers_id");
            sqlStr.append(" FROM user_component_score");
            sqlStr.append(" WHERE comp_vers_id = ? and phase_id = ? and level_id = ? and processed = 1");
                sqlStr.append(" ORDER BY create_date_time desc");

            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, compVersId);
            ps.setInt(2, phaseId);
            ps.setInt(3, levelId);
            rs2 = ps.executeQuery();

            //add each coder and his info to the vectors.
            String handle = "";

            while (rs2.next()) {
                processed++;
                // First add developers
                sqlStr.replace(0, sqlStr.length(), " SELECT rating, num_ratings, vol, rating_no_vol");
                sqlStr.append(" FROM user_rating");
                sqlStr.append(" WHERE user_id = ? and phase_id = ?");
                ps2 = conn.prepareStatement(sqlStr.toString());

                int userID = rs2.getInt("user_id");
                double rndScore = rs2.getDouble("score");
                ps2.setInt(1, userID);

                ps2.setInt(2, phaseId);
                rsUser = ps2.executeQuery();

                namesplusprov.add("" + userID);

                handle = ""+userID;

                stringnamesplusprov.add(handle);
                scoresplusprov.add(new Double(rndScore));
                if (rsUser.next()) {
                    Integer temp = new Integer(rsUser.getInt("num_ratings"));

                    ratingsplusprov.add(new Double(rsUser.getDouble("rating")));
                   // timesplayedplusprov.add(new Integer(rsUser.getInt("num_ratings")));
                    timesplayedplusprov.add(temp);
                    volatilitiesplusprov.add(new Double(rsUser.getDouble("vol")));

                } else {
                    sqlStr.replace(0, sqlStr.length(), "INSERT INTO user_rating (num_ratings, user_id, phase_id) VALUES(0,?,?)");
                    ps2 = conn.prepareStatement(sqlStr.toString());
                    ps2.setInt(1, userID);
                    ps2.setInt(2, phaseId);

                    retVal = ps2.executeUpdate();


                    ratingsplusprov.add(new Double(initialScore));
                    timesplayedplusprov.add(new Integer(0));
                    volatilitiesplusprov.add(new Double(initialVolatility));
                }
                ps2.close();
                ps2 = null;
            }
            System.out.println("Processing " + processed + " entries for level " + levelId);
            if (processed == 0)
              continue;
            String database = "scores_" + phaseId + "." + levelId;
            rs2.close();
            rs2 = null;
            ps.close();
            ps = null;

            // Next load history database

            try {
                FileInputStream history = new FileInputStream(database);
                do {
                    int c = history.read();
                    String s = "";
                    if (c == '#') {
                        // Reading a comment.  Throw away the line
                        do { c = history.read(); }
                        while (c != '\n');
                        continue;
                    }
                    if (c == -1)
                        break;
                    while (c != ' ' && c != -1) {
                        s += (char)c;
                        c = history.read();
                    }
                    if (c == -1)
                        break;
                    Double result = new Double(s);
                    s = "";
                    c = history.read();
                    while (c != ' ' && c != -1) {
                        s += (char)c;
                        c = history.read();
                    }
                    Double rating = new Double(s);
                    s = "";
                    c = history.read();
                    while (c != '\n' && c != -1) {
                        s += (char)c;
                        c = history.read();
                    }
                    Double vol = new Double(s);
                    namesplusprov.add("0");
                    timesplayedplusprov.add(new Integer(1));
                    scoresplusprov.add(result);
                    stringnamesplusprov.add("0");
                    volatilitiesplusprov.add(vol);
                    ratingsplusprov.add(rating);
                } while(true);
                history.close();
            } catch (FileNotFoundException e) {
                System.out.println("WARNING: History database " + database +
                                   " not found.  Creating new database.");
              // No database file exists yet.  That's ok.  The rating will be somewhat bogus, but
              // the database will be created at the end and it will be more accurate as it grows.
            }

            //run qubits rating algorithm on them
            //log.info("Ratings for provisional: round " + roundId + ", div " + divisionId + ":");

            resultsplusprov = rateEvent(namesplusprov, ratingsplusprov, volatilitiesplusprov, timesplayedplusprov, scoresplusprov, stringnamesplusprov, false);

            names = (Vector) resultsplusprov.get(3);
            endratings = (Vector) resultsplusprov.get(2);
            endvols = (Vector) resultsplusprov.get(1);
            endratingsnovol = (Vector) resultsplusprov.get(0);


            if (isFinal) {

                FileOutputStream fos = new FileOutputStream(database, true);
                PrintStream stream = new PrintStream(fos);
                while (endratings.size() > 0) {



                    newrating = Math.round(((Double) endratings.remove(0)).floatValue());
                    newratingnovol = Math.round(((Double) endratingsnovol.remove(0)).floatValue());
                    newvol = Math.round(((Double) endvols.remove(0)).floatValue());
                    coder = (new Integer(names.remove(0).toString())).intValue();
                    score = ((Double) scoresplusprov.remove(0)).floatValue();


                    sqlStr.replace(0, sqlStr.length(), "UPDATE user_component_score SET processed=2, rating = ? ");
                    sqlStr.append(" WHERE processed = 1 and comp_vers_id = ? and phase_id = ? and user_id = ?");

                    ps = conn.prepareStatement(sqlStr.toString());
                    ps.setDouble(1, newrating);
                    ps.setInt(2, compVersId);
                    ps.setInt(3, phaseId);
                    ps.setInt(4, coder);
                    //System.out.println(compVersId + ":" + phaseId + sqlStr.toString());
                    retVal = ps.executeUpdate();

                    ps.close();
                    ps = null;


                    if (coder == 0) {
                        // This is a database entry - skip it
                        continue;
                    }
                    sqlStr.replace(0, sqlStr.length(), "UPDATE user_rating SET rating = ?, vol = ? ,rating_no_vol = ?, last_component_rated = ?, num_ratings = num_ratings + 1, ");
                    sqlStr.append(" mod_date_time = CURRENT WHERE user_id = ? and phase_id = ?");
                    ps = conn.prepareStatement(sqlStr.toString());
                    ps.setDouble(1, newrating);
                    ps.setInt(2, newvol);
                    ps.setInt(3, newratingnovol);
                    ps.setInt(4, compVersId);
                    ps.setInt(5, coder);
                    ps.setInt(6, phaseId);
                    retVal = ps.executeUpdate();
                    ps.close();
                    ps = null;

                    //if (retVal != 1)
                    //    log.error("ERROR: New rating not updated in CODER_RATING table");

                    // Don't forget to add score entry to design score history database
                    stream.println("" + scr(new Double(score)) + " " + in4(new Double(newrating)) + " " + newvol);
                } // end while loop over endratings
                stream.close();
		tailFile(database, 50 /* lines */);
            }
          }

// All changes made
        } catch (Exception e) {
                System.out.println("Thrown Error A " + e);
            //log.error(e);
            throw e;
        } finally {
            try {
                if (rs2 != null) rs2.close();
            } catch (Exception e1) {
            }
            try {
                if (ps != null) ps.close();
            } catch (Exception e1) {
            }
        }
    }

    void tailFile(String filename, int linesSaved) {
    ArrayList lines = new ArrayList();
    String line;

    try {
        BufferedReader br = new BufferedReader(new FileReader(filename));
	
	line = br.readLine();
	while (line != null) {
	    lines.add(line);
	    line = br.readLine();
	}
	br.close();
        FileOutputStream fos = new FileOutputStream(filename, false);
	PrintStream ps = new PrintStream(fos);
	for (int i = Math.max(0, lines.size() - linesSaved); i < lines.size(); i++) {
	    ps.println(lines.get(i).toString());
        }
        ps.close();
    } catch (Exception e) {}
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
    double matchStdDevEquals = 500.0;   /* rating points */
    int people = 0;
    double sqiv = 0.0;
    int people2 = 0;
    double sqfv = 0.0;
    double fv = 0.0;
    int people3 = 0;
    double sb = 0.0;
    int people4 = 0;
    double sqdf = 0.0;

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
        if (ratings.size() > 1)
          matchStdDevEquals = Math.sqrt(vtemp / ratings.size() + rtemp / (ratings.size() - 1));
        else
          matchStdDevEquals = 0;
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

        System.out.println("Handle   Player  # Rate Vol Es.R E.SD  Score  Ac.R A.SD D.SD N.RT N.V N.VR");
        for (i = 0; i < names.size(); i++) {
            if (!"0".equals((String)stringnames.elementAt(i)))
            if (!prov || (prov && ((Integer) timesPlayed.elementAt(i)).intValue() == 0))
                System.out.println(
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
                        fD2(new Double(((Double) perf.elementAt(i)).doubleValue(
) -
                        ((Double) eperf.elementAt(i)).doubleValue())) +
                        " " + in4((Double) newRating.elementAt(i)) + " " +
                        ((Double) newVolatility.elementAt(i)).intValue()
                        + " " + in4((Double) newRatingWithVol.elementAt(i))
                );
        }
        System.out.println(newRating.size() + ":" + newVolatility.size()   + ":" + newRatingWithVol.size()
            + ":" + names.size() );
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
    
    private double snormdens(double v) {
        return Math.exp(-v*v/2) / Math.sqrt(2* Math.PI);
    }

    private double snorm(double v) {
        if (v >= 0) {
            double t = 1 / (1 + 0.33267 * v);
            return 1 - snormdens(v) * t * (0.4361836 - t * (0.1201676 + 0.9372980 * t));
        } else {
            double t = 1 / (1 - 0.33267 * v);
            return snormdens(-v) * t * (0.4361836 - t * (0.1201676 + 0.9372980 * t));
	}
    }

    private double winprobability(double meana, double stddeva, double meanb, double stddevb) {
        if (1==1) return snorm((meana-meanb)/Math.sqrt(stddeva*stddeva + stddevb*stddevb));
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
//----------------------END RATING FUNCTIONS0-----------------------------------------------

}
