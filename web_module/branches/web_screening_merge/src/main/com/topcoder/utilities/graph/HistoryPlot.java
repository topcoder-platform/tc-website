/*****************************************************************************/
/* HistoryPlot.java  by Chuck Grant  Copyright 2003
 *                   a.k.a Rustyoldman a.k.a. fx4m
 *****************************************************************************
 * Permission is hereby granted for TopCoder Inc. to use this code on
 * their server(s) to generate members' rating history plots.  TopCoder
 * Inc. may modify this code for the above purpose.
 * No other use or distribution is authorized. This notice must be preserved
 * in any copy or modification of this code.
 *
 * This is a completely ad hoc class to make TopCoder rating history plots.
 * The code is ugly but the plot is nice.  This was created and tested
 * using Java 1.4.1 on Mac OS X 10.2.6. and Java 1.3.1 on Windows 2000
 *
 * Three GLGPL'ed files are lifted from fi.faidon.jis to do the PNG image
 * file output. The only modification was to move them into this package.
 * PNGImageSaver.java, ImageSaverInterface.java, and ByteArrayConversion.java
 * Those three plus this file, HistoryPlot.java, are the whole package.
 *
 * Package:  com.fx4m.plot13
 * Class:    com.fx4m.plot13.HistoryPlot
 * Method:   com.fx4m.plot13.HistoryPlot.plot
 * API:
 *
 ********************
 * Four different ways of specifying the dates are provided.
 * The resulting plots are identical.
 *********************
 *
 *   static void plot ( int[]r, double[]d, String h, String f)
 *   throws IOException
 *
 *   int[]r     array of rating values
 *   double[]d  array of corresponding dates, in years and fractions of years.
 *              example 2000.5  = July 1, 2000
 *   String h   handle of TopCoder
 *   String f   file name for output (should end with .png)
 *              ".png" appended if not present
 *
 **********************
 *
 *   static void plot ( int[]r, String[]d, String h, String f)
 *   throws IOException
 *
 *   int[]r     array of rating values
 *   String[]d  array of corresponding match dates,
 *              format: "2000 12 31" or "12 31 2000" (any delims ignored)
 *   String h   handle of TopCoder
 *   String f   file name for output (should end with .png)
 *              ".png" appended if not present
 *
 **********************
 *
 *   static void plot ( int[]r, Date[]d, String h, String f)
 *   throws IOException
 *
 *   int[]r             array of rating values
 *   java.util.Date[]d  array of corresponding match dates,
 *   String h           handle of TopCoder
 *   String f           file name for output (should end with .png)
 *                      ".png" appended if not present
 *
 **********************
 *
 *   static void plot ( int[]r, Calendar[]d, String h, String f)
 *   throws IOException
 *
 *   int[]r                 array of rating values
 *   java.util.Calendar[]d  array of corresponding match dates,
 *   String h               handle of TopCoder
 *   String f               file name for output (should end with .png)
 *                          ".png" appended if not present
 *
 *
 * You can invoke the class with the dates of the matches represented
 * with either Dates, Calendars, Strings or doubles. The rating after each
 * match is an int. The number of ratings should equal the number of dates.
 * Ratings and dates should be in chronological order
 *
 * The double date is approximated assuming all months have 31 days.
 * use this: (time = noon that day)
 * date[i]=year[i]+(month[i]-1)/12+(day[i]-0.5)/31/12 ;
 * Ratings should be >= 0 and the range of lowest to highest rating for
 * a coder should not be much larger than 3600, or it will look bad.
 * The length of the rating (and date) array(s) can be zero or more
 * I don't know how big it goes, but the format adjusts as it goes up.
 * It should be good for at least the next twenty years.
 * Various delimeters are are ok in the date Strings, not just spaces.
 * But the month must be numeric, not spelled out. Year must be four digits.
 *
 * I think it should be thread-safe.  The static method
 * does a "new" so a different instance is created for each plot.
 *
 * The size of the output is fixed at 800x600 pixels.
 *
 * The results might be slightly better if the first and last dates
 * represent a time of day which is not midnight on the first of a month
 * (so that it correctly places the first and last tick mark). But this
 * is a very minor issue. The actual time of the match is
 * fine, as well as a random value, such as noon. Noon is used if the dates
 * are specified as strings. Midnight Dates and Calendars are used as if they
 * were noon, otherwise the hour is preserved. Minutes and seconds are
 * ignored in Dates and Calendars. (Hey who can see such detail anyway?)
 */
/*****************************************************************************/
package com.topcoder.utilities.graph;

import java.lang.*;
import java.util.*;
import java.io.*;
import java.awt.*;
import java.awt.font.*;
import java.awt.geom.*;
import java.awt.image.*;

/*****************************************************************************/
public class HistoryPlot
        /*****************************************************************************/ {
    static final int pb = 55; // black and red border width
    static final int bw = 10; // red border width
    static final int w = 800; // image width
    static final int h = 600; // image height
    static final int blackwidth = 180;  // for the black to grey background
    static final int fadewidth = 100;  // for the black to grey background
    static final int grayish = 100;
    static final int maxyearlabels = 21;
    static final Color plotColor = new Color(255, 255, 255);
    static final Color gridColor = new Color(255, 255, 55);
    static final Color redBorderColor = new Color(200, 40, 40);
    static final Color whiteBorderColor = new Color(200, 200, 200);
    static final Color coderColor = new Color(200, 55, 55);
    static final Color topColor = new Color(220, 220, 220);
    static final Color bracketColor = new Color(220, 200, 50);
    Graphics2D g;
    DataBuffer db;
    int datapoints;

    /*****************************************************************************/
    public static void plot(int[] rating, double[] time, String name,
                            String filename) throws IOException
            /*****************************************************************************/ {
        HistoryPlot hp = new HistoryPlot();
        hp.plotRating(rating, time, name, filename, true);
    }

    /*****************************************************************************/
    public static void plot(int[] r, String[] d, String n, String f)
            throws IOException
            /*****************************************************************************/ { // dates as strings entry point
        double[] db = new double[d.length];
        for (int i = 0; i < d.length; i++) {
            StringTokenizer t = new StringTokenizer(d[i], // only look at numbers
                    " -/.,_=:;!@#$%^&*()+<>[]{}|\\~abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ");
            int y = Integer.parseInt(t.nextToken()); // years must be 4 digits
            if (y > 1900)
                db[i] = y + (Integer.parseInt(t.nextToken()) - 1) / 12.0 +
                        (Integer.parseInt(t.nextToken()) - 1) / 12.0 / 31;
            else
                db[i] = (y - 1) / 12.0 + (Integer.parseInt(t.nextToken()) - 1) / 12.0 / 31 +
                        (Integer.parseInt(t.nextToken()));
            db[i] += 0.5 / (12 * 31); // noon
        }
        plot(r, db, n, f);
    }

    /*****************************************************************************/
    public static void plot(int[] r, Calendar[] c, String n, String f)
            throws IOException
            /*****************************************************************************/ { // dates as Calendars entry point
        double[] db = new double[c.length];
        for (int i = 0; i < c.length; i++) {
            db[i] = c[i].get(c[i].YEAR) + (c[i].get(c[i].MONTH) - c[i].JANUARY) / 12.0
                    + (c[i].get(c[i].DAY_OF_MONTH) - 1.0) / 12.0 / 31.0
                    + (c[i].get(c[i].HOUR_OF_DAY)) / 12.0 / 31.0 / 24.0;
            if ((i == 0 || i == c.length) &&
                    c[i].get(c[i].DAY_OF_MONTH) == 0 &&
                    c[i].get(c[i].HOUR_OF_DAY) == 0)
                db[i] += 0.5 / 12.0 / 31.0;
        }
        plot(r, db, n, f);
    }

    /*****************************************************************************/
    public static void plot(int[] r, Date[] d, String n, String f)
            throws IOException
            /*****************************************************************************/ { // dates as Dates entry point
        double[] db = new double[d.length];
        GregorianCalendar c = new GregorianCalendar();
        for (int i = 0; i < d.length; i++) {
            c.setTime(d[i]);
            db[i] = c.get(c.YEAR) + (c.get(c.MONTH) - c.JANUARY) / 12.0
                    + (c.get(c.DAY_OF_MONTH) - 1.0) / 12.0 / 31.0
                    + (c.get(c.HOUR_OF_DAY)) / 12.0 / 31.0 / 24.0;
            if ((i == 0 || i == d.length) &&
                    c.get(c.DAY_OF_MONTH) == 0 &&
                    c.get(c.HOUR_OF_DAY) == 0)
                db[i] += 0.5 / 12.0 / 31.0;
        }
        plot(r, db, n, f);
    }

    /*****************************************************************************/
    static int[] namecolors = {255, 255, 255, // saturated versions for title
                               0, 255, 0,
                               0, 0, 254,
                               255, 255, 50,
                               255, 0, 0,
                               255, 200, 200};
    static int[] dv = {900, 1200, 1500, 2200, 3000, 1999999999};
    static int[] plotcolors = {80, 80, 80, // gray   pastels for plot
                               50, 90, 50, // green  1/2 and 2x also used
                               50, 50, 127, // blue
                               100, 100, 25, // yellow
                               100, 25, 25, // red
                               100, 75, 75};  // pink

    /*****************************************************************************/
    static Color rateColor(int n)
            /*****************************************************************************/ {
        int i;

        i = 0;
        while (dv[i] <= n) i++;
        return new Color(namecolors[i * 3], namecolors[i * 3 + 1], namecolors[i * 3 + 2]);
    }

    /*****************************************************************************/
    static int[] plotColor(int n)
            /*****************************************************************************/ {
        int i;
        int[] c;

        i = 0;
        while (dv[i] <= n) i++;
        c = new int[3];
        c[0] = plotcolors[i * 3];
        c[1] = plotcolors[i * 3 + 1];
        c[2] = plotcolors[i * 3 + 2];
        return c;
    }

    /*****************************************************************************/
    private void plotRating(int[] data, double[] time, String name,
                            String filename, boolean border) throws IOException
            /*****************************************************************************/ {
        datapoints = data.length;
        if (data.length == 0) { // should figure out current year here, oh well
            data = new int[2];
            time = new double[2];
            GregorianCalendar cal = new GregorianCalendar();
            time[0] = cal.get(Calendar.YEAR);
            time[1] = time[0] + 1;
            iplotRating(data, time, name, filename, border);
            return;
        }
        ;
        if (data.length == 1) {
            int[] ndata = new int[3];
            double[] ntime = new double[3];
            ntime[0] = (int) (time[0]);
            ndata[0] = 0;
            ntime[1] = time[0];
            ndata[1] = data[0];
            ntime[2] = (int) (time[0] + 1);
            ndata[2] = 0;
            iplotRating(ndata, ntime, name, filename, border);
            return;
        }
        ;
        if (data.length > 2 && time.length == 2) {
            double[] nd = new double[data.length];
            for (int i = 0; i < data.length; i++)
                nd[i] = time[0] + (time[1] - time[0]) * i / (data.length - 1.0);
            time = nd;
        }
        iplotRating(data, time, name, filename, border);
    }

    /*****************************************************************************/
    void setpx(int x, int y, int r, int g, int b) { // set pixel in databuffer to specified color
        db.setElem(3 * (x + w * y) + 0, b);
        db.setElem(3 * (x + w * y) + 1, g);
        db.setElem(3 * (x + w * y) + 2, r);
    }
    /*****************************************************************************/
    /*****************************************************************************/
    void outline(int d, int r, int g, int b)
            /*****************************************************************************/ { // g.draw-ing lines and rectangles is way slow, so fiddle pixels directly
        int x,y;
        y = d;
        for (x = d; x < w - d; x++) setpx(x, y, r, g, b);
        y = h - d - 1;
        for (x = d; x < w - d; x++) setpx(x, y, r, g, b);
        x = d;
        for (y = d; y < h - d; y++) setpx(x, y, r, g, b);
        x = w - d - 1;
        for (y = d; y < h - d; y++) setpx(x, y, r, g, b);
    }

    /*****************************************************************************/
    private void iplotRating(int[] data, double[] time, String name,
                             String filename, boolean doborder) throws IOException
            /*****************************************************************************/
            // double time... hup hup hup...
    {
        int i;
        BufferedImage bi;
        int x , y , b;

        bi = new BufferedImage(w, h, BufferedImage.TYPE_3BYTE_BGR);
        g = bi.createGraphics();
        g.setFont(Font.decode("SansSerif-bold-13")); // make sure
        db = bi.getWritableTile(0, 0).getDataBuffer();
        RenderingHints hints = new RenderingHints(null);
        hints.put(RenderingHints.KEY_ANTIALIASING,
                RenderingHints.VALUE_ANTIALIAS_ON);
        hints.put(RenderingHints.KEY_TEXT_ANTIALIASING,
                RenderingHints.VALUE_TEXT_ANTIALIAS_ON);
        hints.put(RenderingHints.KEY_STROKE_CONTROL,
                RenderingHints.VALUE_STROKE_NORMALIZE);
        g.setStroke(new BasicStroke(2.0f));
        g.addRenderingHints(hints);
        g.setPaintMode();
        for (x = 0; x < w; x++) {
            b = grayish;  // black to gray background
            if (x < blackwidth + fadewidth) b = grayish * (x - blackwidth) / fadewidth;
            if (x < blackwidth) b = 0;
            for (y = 0; y < h; y++) setpx(x, y, b, b, b);
        }
        g.setColor(new Color(grayish + 3, grayish + 3, grayish + 3));
        g.drawString("Rustyoldman fx4m Chuck Grant", w / 2, h - bw - 2);// .sig
        y = bw / 2 + 15;
        java.awt.geom.AffineTransform save = g.getTransform();
        if (doborder) { // make 3D-ish red border
            outline(0, 255, 128, 128);
            outline(1, 255, 64, 64);
            for (i = 2; i < bw - 2; i++)
                outline(i, 255, 0, 0);
            outline(bw - 2, 128, 0, 0);
            outline(bw - 1, 200, 200, 200);
            for (x = 0; x < w; x++) { // turn bottom border upside down
                y = h - 1;
                setpx(x, y, 128, 0, 0);
                if (x > 0 && x < w - 1) {
                    y = h - 2;
                    setpx(x, y, 200, 0, 0);
                }
                if (x > bw - 2 && x < w - bw + 1) {
                    y = h - bw + 1;
                    setpx(x, y, 255, 128, 128);
                }
                if (x > bw - 3 && x < w - bw + 2) {
                    y = h - bw + 2;
                    setpx(x, y, 255, 64, 64);
                }
            }
            // do a crude logo
            g.translate(0, pb / 2 + 12);
            g.scale(4.0, 4.0);
            g.scale(1.0, 1.5);
            y = bw / 2 + 15;
            x = bw / 2 + 2;
            int y14 = (int) (bw / 2.8 + 8);
            int y2 = (int) (bw / 1.5 + 7);
            g.setFont(Font.decode("SansSerif-bold-5"));
            g.setColor(topColor);
            g.drawString("[", x + 1, 0);
            g.drawString("]", x + 30, 0);
            g.setTransform(save);
            g.translate(0, pb / 2 + 10);
            g.scale(4.0, 4.0);
            g.setColor(coderColor);
            g.drawString("C", x + 13, 0);
            g.setColor(topColor);
            g.drawString("T", x + 3, 0);
            g.scale(1.0, 0.750);
            g.setColor(coderColor);
            g.drawString("ODER", x + 16, 0);
            g.setColor(topColor);
            g.drawString("OP", x + 6, 0);
            g.setTransform(save);
            g.setFont(Font.decode("SansSerif-plain-13"));
            g.scale(0.5, 0.5);
            g.drawString("TM", 310, pb - 16);
            g.scale(4.0, 4.0);
            g.setColor(gridColor);
            g.drawString("Rating History", w / 5 - 25, y + 1);
            g.setTransform(save);
        }
        g.setFont(Font.decode("SanSerif-bold-13"));
        g.setColor(new Color(0, 0, 0)); // plotting surface
        g.fill(new Rectangle(pb, pb + 1, w - pb - pb, h - pb - pb - 1));
        g.setColor(gridColor);
        g.draw(new Rectangle(pb, pb, w - pb - pb, h - pb - pb));
        if (!doborder) {
            g.scale(2.0, 2.0);
            g.drawString("Rating History", w / 5 - 45, y + 1);
            g.setTransform(save);
        }
        /*****************************************************************************/
        /* vert scale and labels */
        /*****************************************************************************/
        int maxd = 0;
        int mind = 50000;
        for (i = 0; i < data.length; i++) {
            if (data[i] > maxd) maxd = data[i];
            if (data[i] < mind) mind = data[i];
        }
        int maxRating = maxd;
        int mw = 0;
        g.setColor(rateColor(maxd));
        TextLayout tl = null;
        Rectangle2D tbnd = null;
        if (datapoints == 0) {
            tl = new TextLayout(name + " no rating",
                    g.getFont(), g.getFontRenderContext());
            tbnd = tl.getBounds();
            mw = (int) tbnd.getWidth();
            g.drawString(name + " no rating",
                    w - pb - mw, pb / 4 * 3);
        } else if (datapoints == 1) {
            tl = new TextLayout(name + " " + data[1] + "  (" + data[1] + " max)",
                    g.getFont(), g.getFontRenderContext());
            tbnd = tl.getBounds();
            mw = (int) tbnd.getWidth();
            g.drawString(name + " " + data[1] + "  (" + data[1] + " max)",
                    w - pb - mw, pb / 4 * 3);
        } else {
            tl = new TextLayout("(" + maxd + " max)",
                    g.getFont(), g.getFontRenderContext());
            tbnd = tl.getBounds();
            mw = (int) tbnd.getWidth();
            g.drawString("(" + maxd + " max)",
                    w - pb - mw, pb / 4 * 3);
            tl = new TextLayout(name + " " + data[data.length - 1] + "  (" + maxd + " max)",
                    g.getFont(), g.getFontRenderContext());
            tbnd = tl.getBounds();
            mw = (int) tbnd.getWidth();
            g.setColor(rateColor(data[data.length - 1]));
            g.drawString(name + " " + data[data.length - 1], w - pb - mw, pb / 4 * 3);
        }
        while (maxd % 100 != 0) maxd++;
        while (mind % 100 != 0) mind--;
        maxd += 100;
        if (maxd < 1300) maxd = 1300;
        mind -= 100;
        if (datapoints < 2) {
            maxd = 3500;
            mind = -100;
        }
        double yscale = -(h - pb - pb) / (maxd - (double) mind);
        double yoff = h - pb - mind * yscale;
        double lt = time[time.length - 1];
        double ft = time[0];
        if (Math.abs(lt - ((int) (lt * 12)) / 12) < 0.0001) lt += 0.001;
        if (Math.abs(ft - ((int) (ft * 12)) / 12) < 0.0001) ft -= 0.001;
        double xscale = (w - pb - pb - 2) / (double) (lt - ft);
        double xoff = pb - time[0] * xscale + 1;
        g.setColor(gridColor);
        for (y = Math.max(0, mind); y < maxd; y += 100) {
            g.drawString(y < 1000 ? "  " + y : "" + y, bw + 3, (int) (y * yscale + yoff) + 4);
        }
        /*****************************************************************************/
/* horz scale and labels */
        /*****************************************************************************/
        // as the duration of the plot gets longer, thin out the scale detail
        int dspx = 1 + (int) ((lt - ft) / maxyearlabels);
        for (x = (int) time[0]; x <= (int) (time[time.length - 1]); x++) {
            // year tick
            if (x >= ft && x <= lt) {
                int xi = (int) (x * xscale + xoff);
                for (y = h - pb; y <= h - pb + 20; y++) setpx(xi, y, 200, 200, 50);
            }
            double xy;
            xy = 0;
            if (x < (int) lt && x > (int) ft)
                xy = x + 0.5;
            else if (x == (int) ft && (ft - (int) ft) * xscale > 26)
                xy = (ft + (int) ft + 1) / 2;
            else if (x == (int) ft && (ft - (int) ft) * xscale > 13)
                xy = ft;
            else if (x == (int) lt && (lt - (int) lt) * xscale > 26)
                xy = (lt + (int) lt) / 2;
            else if (x == (int) lt && (lt - (int) lt) * xscale > 13)
                xy = lt;
            else
                xy = 0;

            if (xy * xscale + xoff < pb) xy = 0;
            if (xy * xscale + xoff > w - pb) xy = 0;

            if (xy != 0 && x % dspx == 0)
            // year label
                g.drawString("" + x, (int) (xy * xscale + xoff) - 13, h - pb + 34);

            int m = 0;
            int mm;
            if (lt - ft <= maxyearlabels / 1.5)
                for (int xxx = 0; xxx < 12; xxx++) {
                    double xx;
                    xx = x + xxx / 12.0;
                    double fm , lm;
                    fm = (int) (ft * 12);
                    lm = (int) (lt * 12);
                    fm /= 12.0;
                    lm /= 12.0;
                    m++;
                    if (lt - ft <= maxyearlabels / 5)
                        mm = m;
                    else
                        mm = m % 10;
                    if (xx >= fm && xx <= lm + 1 / 12.0) {
                        if (xx <= lt) {
                            // month tick
                            int xi = (int) (xx * xscale + xoff);
                            if (xxx > 0)
                                for (y = h - pb; y <= h - pb + 6; y++) setpx(xi, y, 200, 200, 50);
                        }
                        if (lt - ft <= maxyearlabels / 3) {
                            xy = 0;
                            if (fm == lm && xx == fm)
                                xy = (ft + lt) / 2;
                            else if (xx >= fm + 1 / 12.0 && xy < lm)
                                xy = xx + 1.0 / 24;
                            else if (xx >= lm && (lt - lm) * xscale > 8)
                                xy = (lt + lm) / 2;
                            else if (xx >= lm && (lt - lm) * xscale > 4)
                                xy = lt;
                            else if (xx < fm + 1 / 12.0 && (fm - ft + 1 / 12.0) * xscale > 8)
                                xy = (ft + fm + 1 / 12.0) / 2;
                            else if (xx < fm + 1 / 12.0 && (fm - ft + 1 / 12.0) * xscale > 4)
                                xy = ft;
                            else
                                xy = 0;
                            if (xy * xscale + xoff < pb - 1) xy = 0;
                            if (xy * xscale + xoff > w - pb + 1) xy = 0;
                            if (xy != 0) {
                                g.drawString("" + mm, (int) ((xy) * xscale + xoff) - (mm > 9 ? 8 : 3),
                                        h - pb + 20);
                            }
                        }
                    }
                }
        }
        /*****************************************************************************/
        // build lookup table for y -> color
        int[][] yc = new int[h][3];
        for (y = mind; y <= maxd; y++) {
            int[] c;
            c = plotColor(y);
            yc[(int) (y * yscale + yoff)][0] = c[0] / 2;
            yc[(int) (y * yscale + yoff)][1] = c[1] / 2;
            yc[(int) (y * yscale + yoff)][2] = c[2] / 2;
        }
// every 100 pts a pixel in lut is twice as bright, makes horz lines
        for (y = mind; y <= maxd; y += 100) {
            yc[(int) (y * yscale + yoff)][0] = yc[(int) (y * yscale + yoff)][0] * 2;
            yc[(int) (y * yscale + yoff)][1] = yc[(int) (y * yscale + yoff)][1] * 2;
            yc[(int) (y * yscale + yoff)][2] = yc[(int) (y * yscale + yoff)][2] * 2;
        }
        for (x = pb + 1; x < w - pb - 1; x++) {
            for (y = h - pb - 1; y > pb; y--) {
                setpx(x, y, yc[y][0], yc[y][1], yc[y][2]);
            }
        }
        int ddy;
        ddy = (maxd - mind) > 2000 ? 200 : 100;
        for (y = mind; y < maxd; y += ddy) {
            int[] cl = plotColor(y + 50);
            g.setColor(new Color(cl[0] * 4 / 7, cl[1] * 4 / 7, cl[2] * 4 / 7));
            for (x = 100; x < 700; x += 100) {
                if (y < 1200)
                    g.drawString("Division-II", x, (int) ((y + 50) * yscale + yoff + 5));
                else
                    g.drawString("Division-I", x, (int) ((y + 50) * yscale + yoff + 5));
            }
        }
        g.setColor(plotColor);
        // this if statement is the actual plot, except we redo it later
        // all the rest is fluff!
        if (datapoints == 1) {
            g.draw(new Line2D.Double(time[1] * xscale + xoff, 0 * yscale + yoff,
                    time[1] * xscale + xoff, data[1] * yscale + yoff));
            g.draw(new Line2D.Double(time[0] * xscale + xoff, 0 * yscale + yoff,
                    time[2] * xscale + xoff, 0 * yscale + yoff));
        } else
            for (i = 0; i < data.length - 1; i++) {
                g.draw(new Line2D.Double(time[i] * xscale + xoff, data[i] * yscale + yoff,
                        time[i + 1] * xscale + xoff, data[i + 1] * yscale + yoff));
            }
        boolean in; // here is where coloring above/below curve is done
        for (x = pb + 1; x < w - pb - 1; x++) {
            in = true; // start assuming we are below the curve
            for (y = h - pb - 1; y > pb; y--) {  // curve pixels are bright white
                int r,g;
                if ((b = db.getElem(3 * (y * w + x) + 0)) +
                        (g = db.getElem(3 * (y * w + x) + 1)) +
                        (r = db.getElem(3 * (y * w + x) + 2)) > 700)
                    in = false;
                else if (in) {
                    setpx(x, y, r + r, g + g, b + b);
                }
            } // twice as bright if under curve
        }
        g.setColor(plotColor); // coloring <700  messes up the antialiasing
        if (datapoints == 1) // of the curve, so we replot it now
        {
            g.draw(new Line2D.Double(time[1] * xscale + xoff, 0 * yscale + yoff,
                    time[1] * xscale + xoff, data[1] * yscale + yoff));
            g.draw(new Line2D.Double(time[0] * xscale + xoff, 0 * yscale + yoff,
                    time[2] * xscale + xoff, 0 * yscale + yoff));
        } else
            for (i = 0; i < data.length - 1; i++) {
                g.draw(new Line2D.Double(time[i] * xscale + xoff, data[i] * yscale + yoff,
                        time[i + 1] * xscale + xoff, data[i + 1] * yscale + yoff));
            }
        for (i = 0; i < data.length; i++) // put roundish markers for each match
        {
            x = (int) (time[i] * xscale + xoff + 0.5);
            y = (int) (data[i] * yscale + yoff - 0.5);
            for (int z = x - 2; z < x + 3; z++)
                for (int u = y - 2; u < y + 3; u++)
                    if (datapoints > 0)
                        if ((z != x - 2 && z != x + 2) || (u != y - 2 && u != y + 2)) {
                            if (datapoints == 1 && i == 1 || datapoints > 1 && data[i] == maxRating)
                                setpx(z, u, 255, 0, 0);  // highest rating is marked red
                            else if (datapoints > 1)
                                setpx(z, u, 180, 255, 255);
                        }
        }
        bi.releaseWritableTile(0, 0);
        bi.flush(); // done, done, and done.

        if (filename.length() <= 4 ||
                !filename.substring(filename.length() - 4).equalsIgnoreCase(".png"))
            filename += ".png";



        // 1.4.x clean way
        // javax.imageio.ImageIO.write(bi,"png",new File(filename));

        // 1.3 way
        PNGImageSaver saver = new PNGImageSaver();
        saver.setSaveImage(bi);
        saver.setSavePath(filename);
        saver.saveIt();
        // end 1.3 way
    }
    /*****************************************************************************/
} /* end of class HistoryPLot */

/*****************************************************************************/

