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
 *   static byte [] plot ( int[]r, double[]d, String h )
 *
 *   int[]r     array of rating values
 *   double[]d  array of corresponding dates, in years and fractions of years.
 *              example 2000.5  = July 1, 2000
 *   String h   handle of TopCoder
 *
 **********************
 *
 *   static byte [] plot ( int[]r, String[]d, String h )
 *
 *   int[]r     array of rating values
 *   String[]d  array of corresponding match dates,
 *              format: "2000 12 31" or "12 31 2000" (any delims ignored)
 *   String h   handle of TopCoder
 *
 **********************
 *
 *   static byte [] plot ( int[]r, Date[]d, String h )
 *
 *   int[]r             array of rating values
 *   java.util.Date[]d  array of corresponding match dates,
 *   String h           handle of TopCoder
 *
 **********************
 *
 *   static byte [] plot ( int[]r, Calendar[]d, String h )
 *
 *   int[]r                 array of rating values
 *   java.util.Calendar[]d  array of corresponding match dates,
 *   String h               handle of TopCoder
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
package com.fx4m.plot13;

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
    static final int pb = 55; // black border width
    static final int bw = 10; // additional border spacing constant
    static final int w = 800; // image width
    static final int h = 600; // image height
    static final int maxyearlabels = 21;
    static final Color plotColor = new Color(255, 255, 255);
    static final Color gridColor = new Color(255, 255, 255);
    Graphics2D g;
    DataBuffer db;
    int datapoints;
    static final int[] TCcolors = {204, 204, 204, 900, // topcoder gray  <900
                                   153, 255, 51, 1200, // topcoder green <1200
                                   132, 204, 204, 1500, // topcoder blue  <1500
                                   255, 255, 0, 2200, // topcoder yellow<2200
                                   255, 0, 0, 3000, // topcoder red   <3000
                                   255, 40, 40, 9999};//   pink
//static int tcf  = 32 ;
//static int tcfl = 24 ;
//static int tcfd = 28 ;
    static int tcf = 24;
    static int tcfl = 32;
    static int tcfd = 21;

    /*****************************************************************************/
    public static byte[] plot(int[] rating, double[] time, String name)
            /*****************************************************************************/ {
        HistoryPlot hp = new HistoryPlot();
        return hp.plotRating(rating, time, name, true);
    }

    /*****************************************************************************/
    public static byte[] plot(int[] r, String[] d, String n)
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
        return plot(r, db, n);
    }

    /*****************************************************************************/
    public static byte[] plot(int[] r, Calendar[] c, String n)
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
        return plot(r, db, n);
    }

    /*****************************************************************************/
    public static byte[] plot(int[] r, Date[] d, String n)
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
        return plot(r, db, n);
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
        return new Color(TCcolors[i * 4], TCcolors[i * 4 + 1], TCcolors[i * 4 + 2]);
    }

    /*****************************************************************************/
    static int[] plotColor(int n)
            /*****************************************************************************/ {
        int i;
        int[] c;

        i = 0;
        while (dv[i] <= n) i++;
        c = new int[3];
        c[0] = TCcolors[i * 4];
        c[1] = TCcolors[i * 4 + 1];
        c[2] = TCcolors[i * 4 + 2];
        return c;
    }

    /*****************************************************************************/
    private byte[] plotRating(int[] data, double[] time, String name,
                              boolean border)
            /*****************************************************************************/ {
        datapoints = data.length;
        if (data.length == 0) { // should figure out current year here, oh well
            data = new int[2];
            time = new double[2];
            GregorianCalendar cal = new GregorianCalendar();
            time[0] = cal.get(Calendar.YEAR);
            time[1] = time[0] + 1;
            return iplotRating(data, time, name, border);
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
            return iplotRating(ndata, ntime, name, border);
        }
        ;
        if (data.length > 2 && time.length == 2) {
            double[] nd = new double[data.length];
            for (int i = 0; i < data.length; i++)
                nd[i] = time[0] + (time[1] - time[0]) * i / (data.length - 1.0);
            time = nd;
        }
        return iplotRating(data, time, name, border);
    }

    /*****************************************************************************/
    void setpx(int x, int y, int r, int g, int b) { // set pixel in databuffer to specified color
        db.setElem(3 * (x + w * y) + 0, b);
        db.setElem(3 * (x + w * y) + 1, g);
        db.setElem(3 * (x + w * y) + 2, r);
    }

    /*****************************************************************************/
    void setline(double x1, double y1, double x2, double y2,
                 int r, int g, int blue, double th) { // set pixel in databuffer to specified color
        double t;
        int x , y;
        x1 = Math.floor(x1);
        y1 = Math.floor(y1);
        x2 = Math.floor(x2);
        y2 = Math.floor(y2);

// x2-x1/y2-y1 = x2-x/y2-y ;
// (x2-x1)*(y2-y)=(x2-x)*(y2-y1) ;
// x2y2-x1y2-x2y+x1y=x2y2-x2y1-y2x+y1x ;
// y2x-y1x + x1y-x2y + x2y2 - x1y2 - x2y2 + x2y1 = 0 ;
        double a,b,c,e;
        e = Math.sqrt((y2 - y1) * (y2 - y1) + (x1 - x2) * (x1 - x2));
        a = (y2 - y1) / e;
        b = (x1 - x2) / e;
        c = (x2 * y1 - x1 * y2) / e;
        int xpad;
        int ypad;

        ypad = 2;
        xpad = 1;
        if (Math.abs((y1 - y2) / (x1 - x2)) > 2) xpad = 2;
        double th2;
        th2 = th + 1.0; // magix antialiasing fiddly number
        if (th < 0.1) {
            th = 0.5;
            th2 = 0;
        }

        for (x = (int) Math.min(x1, x2) - xpad; x <= Math.max(x1, x2) + xpad; x++)
            for (y = (int) Math.min(y1, y2) - ypad; y <= Math.max(y1, y2) + ypad; y++) {
                e = Math.abs(a * x + b * y + c);
                if (e < th) {
                    db.setElem(3 * (x + w * y) + 0, blue);
                    db.setElem(3 * (x + w * y) + 1, g);
                    db.setElem(3 * (x + w * y) + 2, r);
                } else if (e < th2) {
                    int b1 = db.getElem(3 * (y * w + x) + 0);
                    int g1 = db.getElem(3 * (y * w + x) + 1);
                    int r1 = db.getElem(3 * (y * w + x) + 2);

                    e -= th;
                    e /= (th2 - th);
                    e = 1 - e;
                    db.setElem(3 * (x + w * y) + 0, (int) Math.min(blue * e + (1 - e) * b1, 255));
                    db.setElem(3 * (x + w * y) + 1, (int) Math.min(g * e + (1 - e) * g1, 255));
                    db.setElem(3 * (x + w * y) + 2, (int) Math.min(r * e + (1 - e) * r1, 255));
                }
            }
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
    private byte[] iplotRating(int[] data, double[] time, String name,
                               boolean doborder)
            /*****************************************************************************/
            // double time... hup hup hup...
    {
        int i;
        BufferedImage bi;
        int x , y , b;

        bi = new BufferedImage(w, h, BufferedImage.TYPE_3BYTE_BGR);
        g = bi.createGraphics();
        g.setFont(Font.decode("SansSerif-plain-13")); // make sure
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
        g.setColor(new Color(4, 4, 4));
        g.drawString("Rustyoldman fx4m Chuck Grant", w / 2, h - 2);// .sig
        y = bw / 2 + 15;
        java.awt.geom.AffineTransform save = g.getTransform();
        g.setFont(Font.decode("SansSerif-plain-25"));
        g.setColor(gridColor);
/*
        if (data.length > 50 && data[0] == 864 && data[1] == 707 && data[2] == 683)
            g.drawString("You call this progress?", pb, pb - 10);
        else
*/
        g.drawString("Rating History", pb, pb - 10);
        g.setTransform(save);

        g.setFont(Font.decode("SanSerif-plain-13"));
        g.setColor(new Color(0, 0, 0)); // plotting surface
        g.fill(new Rectangle(pb, pb + 1, w - pb - pb, h - pb - pb - 1));
        g.setColor(gridColor);
        g.draw(new Rectangle(pb, pb, w - pb - pb, h - pb - pb));
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
        g.setColor(rateColor(Math.min(2999, maxd)));
        TextLayout tl = null;
        Rectangle2D tbnd = null;
        g.setFont(Font.decode("SanSerif-plain-20"));
        if (datapoints == 0) {
            tl = new TextLayout(name + " no rating",
                    g.getFont(), g.getFontRenderContext());
            tbnd = tl.getBounds();
            mw = (int) tbnd.getWidth();
            g.drawString(name + " no rating",
                    w - pb - mw, pb - 10);
        } else if (datapoints == 1) {
            tl = new TextLayout(name + " " + data[1] + "  (" + data[1] + " max)",
                    g.getFont(), g.getFontRenderContext());
            tbnd = tl.getBounds();
            mw = (int) tbnd.getWidth();
            g.drawString(name + " " + data[1] + "  (" + data[1] + " max)",
                    w - pb - mw, pb - 10);
        } else {
            tl = new TextLayout("(" + maxd + " max)",
                    g.getFont(), g.getFontRenderContext());
            tbnd = tl.getBounds();
            mw = (int) tbnd.getWidth();
            g.drawString("(" + maxd + " max)",
                    w - pb - mw, pb - 10);
            tl = new TextLayout(name + " " + data[data.length - 1] + "  (" + maxd + " max)",
                    g.getFont(), g.getFontRenderContext());
            tbnd = tl.getBounds();
            mw = (int) tbnd.getWidth();
            g.setColor(rateColor(Math.min(2999, data[data.length - 1])));
            g.drawString(name + " " + data[data.length - 1], w - pb - mw, pb - 10);
        }
        g.setFont(Font.decode("SanSerif-plain-13"));
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
                for (y = h - pb; y <= h - pb + 20; y++) setpx(xi, y, 255, 255, 255);
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
                            if (xxx > 0 && xi >= pb && xi <= w - pb)
                                for (y = h - pb; y <= h - pb + 6; y++)
                                    setpx(xi, y, 255, 255, 255);
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
            yc[(int) (y * yscale + yoff)][0] = c[0] * tcf / 64;
            yc[(int) (y * yscale + yoff)][1] = c[1] * tcf / 64;
            yc[(int) (y * yscale + yoff)][2] = c[2] * tcf / 64;
        }
// every 100 pts a pixel in lut is brighter, makes horz lines
        for (y = mind; y <= maxd; y += 100) {
            int[] c;
            c = plotColor(y);
            yc[(int) (y * yscale + yoff)][0] = c[0] * tcfl / 64;
            yc[(int) (y * yscale + yoff)][1] = c[1] * tcfl / 64;
            yc[(int) (y * yscale + yoff)][2] = c[2] * tcfl / 64;
            //   yc[(int)(y*yscale+yoff)][0]= 127 ;
            //   yc[(int)(y*yscale+yoff)][1]= 127 ;
            //   yc[(int)(y*yscale+yoff)][2]= 127 ;
        }
        for (x = pb + 1; x < w - pb; x++) {
            for (y = h - pb - 1; y > pb; y--) {
                setpx(x, y, yc[y][0], yc[y][1], yc[y][2]);
            }
        }
        int ddy;
        ddy = (maxd - mind) > 2000 ? 200 : 100;
        for (y = mind; y < maxd; y += ddy) {
            int[] cl = plotColor(y + 50);
            g.setColor(new Color(cl[0] * tcfd / 64, cl[1] * tcfd / 64, cl[2] * tcfd / 64));
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
            setline(time[1] * xscale + xoff, 0 * yscale + yoff,
                    time[1] * xscale + xoff, data[1] * yscale + yoff, 255, 255, 255, 0);
            setline(time[0] * xscale + xoff, 0 * yscale + yoff,
                    time[2] * xscale + xoff, 0 * yscale + yoff, 255, 255, 255, 0);
        } else {
            for (i = 0; i < data.length - 1; i++)
                setline(time[i] * xscale + xoff, data[i] * yscale + yoff,
                        time[i + 1] * xscale + xoff, data[i + 1] * yscale + yoff, 255, 255, 255, 0.0);
        }
        boolean in; // here is where coloring above/below curve is done
        for (x = pb + 1; x < w - pb; x++) {
            in = true; // start assuming we are below the curve
            for (y = h - pb - 1; y > pb; y--) {  // curve pixels are bright white
                int r,g;
                if ((b = db.getElem(3 * (y * w + x) + 0)) +
                        (g = db.getElem(3 * (y * w + x) + 1)) +
                        (r = db.getElem(3 * (y * w + x) + 2)) > 255 * 3 - 40) {
                    in = false;
                    setpx(x, y, Math.min(255, r + r), Math.min(255, g + g), Math.min(255, b + b));
                } else if (in) {
                    setpx(x, y, Math.min(255, r + r), Math.min(255, g + g), Math.min(255, b + b));
                }
            } // twice as bright if under curve
        }
        g.setColor(plotColor); // coloring <700  messes up the antialiasing
        if (datapoints == 1) // of the curve, so we replot it now
        {
            setline(time[1] * xscale + xoff, 0 * yscale + yoff,
                    time[1] * xscale + xoff, data[1] * yscale + yoff, 255, 255, 255, 0.5);
            setline(time[0] * xscale + xoff, 0 * yscale + yoff,
                    time[2] * xscale + xoff, 0 * yscale + yoff, 255, 255, 255, 0.5);
        } else {
            for (i = 0; i < data.length - 1; i++) {
                setline(time[i] * xscale + xoff, data[i] * yscale + yoff,
                        time[i + 1] * xscale + xoff, data[i + 1] * yscale + yoff, 0, 0, 0, 0);
                setline(time[i] * xscale + xoff, data[i] * yscale + yoff,
                        time[i + 1] * xscale + xoff, data[i + 1] * yscale + yoff, 255, 255, 255, 0.5);
            }
        }
        for (i = 0; i < data.length; i++) // put roundish markers for each match
        {
            x = (int) (time[i] * xscale + xoff);
            y = (int) (data[i] * yscale + yoff);
            int[] c = plotColor(data[i]);
            if (datapoints > 0) {
                if (data[i] == maxRating) {
                    for (int o = 5; o < 12; o++) {
                        setpx(x + o, y + o, 255, 255, 255);  // highest rating is marked
                        setpx(x - o, y + o, 255, 255, 255);  // highest rating is marked
                        setpx(x + o, y - o, 255, 255, 255);  // highest rating is marked
                        setpx(x - o, y - o, 255, 255, 255);  // highest rating is marked
                    }
                    for (int o = 7; o < 17; o++) {
                        setpx(x, y + o, 255, 255, 255);  // highest rating is marked
                        setpx(x - o, y, 255, 255, 255);  // highest rating is marked
                        setpx(x + o, y, 255, 255, 255);  // highest rating is marked
                        setpx(x, y - o, 255, 255, 255);  // highest rating is marked
                    }
                }
                for (int z = x - 2; z < x + 3; z++)
                    for (int u = y - 2; u < y + 3; u++) {
                        if ((z != x - 2 && z != x + 2) || (u != y - 2 && u != y + 2)) {
                            if (datapoints > 1 || datapoints == 1 && i == 1)
                                if ((Math.abs(z - x) > 1 || Math.abs(y - u) > 1) && data[i] > 2999)
                                    setpx(z, u, 255, 1, 2);
                                else if ((Math.abs(z - x) > 0 || Math.abs(y - u) > 0))
                                    setpx(z, u, 255, 255, 255);
                                else if ((Math.abs(z - x) > 0 || Math.abs(y - u) > 0))
                                    setpx(z, u, 255, 255, 255);
                                else if (data[i] < 3000)
                                    setpx(z, u, 0, 0, 0);
                                else
                                    setpx(z, u, 255, 255, 255);
                        }
                    }
            }
        }
        bi.flush(); // done, done, and done.
        bi.releaseWritableTile(0, 0);
        bi.flush(); // done, done, and done.

// 1.4.x clean way
// javax.imageio.ImageIO.write(bi,"png",new File(filename));

// 1.3 way
        PNGImageSaver saver = new PNGImageSaver();
        saver.setSaveImage(bi);
        saver.saveIt();
        return saver.getBytes();
// end 1.3 way
    }
    /*****************************************************************************/
} /* end of class HistoryPLot */

/*****************************************************************************/
