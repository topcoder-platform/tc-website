/*
 * ShapeCombiner.java
 *
 * Created on September 24, 2004, 9:41 AM
 */

package com.topcoder.utilities;

import com.topcoder.utilities.GIFEncoder.GifEncoder;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Hashtable;

/**
 *
 * @author  rfairfax
 */
public class ShapeCombiner {

    /** Creates a new instance of ShapeCombiner */
    public ShapeCombiner() {
    }

    /**
     * @param args the command line arguments
     */

    private static final String[] colorNames = {"w", "g", "n", "b", "y", "r"};

    private static final String[] bgNames = {"B", "W"};
    private static final String[] bgFolders = {"onBlue", "onWhite"};

    public static void main(String[] args) {
        // TODO code application logic here
        try {

            Frame f = new Frame();
            MediaTracker mt = new MediaTracker(f);

            ArrayList al = new ArrayList();

            //for each bg
            for (int i = 0; i < bgNames.length; i++) {
                //for each color
                for (int j = 0; j < colorNames.length; j++) {
                    al.add("shapes/" + bgFolders[i] + "/circle/" + colorNames[j] + ".gif");
                    al.add("shapes/" + bgFolders[i] + "/square/" + colorNames[j] + ".gif");
                    al.add("shapes/" + bgFolders[i] + "/triangle/" + colorNames[j] + ".gif");
                }
            }

            Hashtable images = new Hashtable();

            for (int i = 0; i < al.size(); i++) {
                Image img = Toolkit.getDefaultToolkit().getImage((String) al.get(i));
                images.put(al.get(i), img);
                mt.addImage(img, i);
            }

            mt.waitForAll();

            for (int i = 0; i < bgNames.length; i++) {
                for (int circ = 0; circ < colorNames.length; circ++) {
                    for (int tri = 0; tri < colorNames.length; tri++) {
                        for (int sq = 0; sq < colorNames.length; sq++) {
                            BufferedImage bi = new BufferedImage(32, 10, BufferedImage.TYPE_INT_ARGB);

                            Graphics2D g = bi.createGraphics();

                            g.setComposite(AlphaComposite.Clear);
                            g.drawRect(0, 0, 32, 10);

                            g.setComposite(AlphaComposite.Src);
                            g.drawImage((Image) images.get("shapes/" + bgFolders[i] + "/circle/" + colorNames[circ] + ".gif"), 0, 0, null);
                            g.drawImage((Image) images.get("shapes/" + bgFolders[i] + "/triangle/" + colorNames[tri] + ".gif"), 11, 0, null);
                            g.drawImage((Image) images.get("shapes/" + bgFolders[i] + "/square/" + colorNames[sq] + ".gif"), 22, 0, null);

                            OutputStream out = new FileOutputStream("out/" + colorNames[circ] + colorNames[tri] + colorNames[sq] + bgNames[i] + ".gif");
                            GifEncoder gi = new GifEncoder(bi, out);
                            gi.encode();
                            out.close();
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
