package com.topcoder.utilities.ratingimage;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;

/**
 * @author dok
 * Date: Feb 27, 2004
 */
public class Generator {

    private static final Color ORANGE = Color.decode("0xFF9900");
    private static final Color WHITE = Color.decode("0xFFFFFF");
    private static final Color GRAY = Color.decode("0x999999");
    private static final Color GREEN = Color.decode("0x00A900");
    private static final Color BLUE = Color.decode("0x6666FF");
    private static final Color YELLOW = Color.decode("0xDDCC00");
    private static final Color RED = Color.decode("0xEE0000");

    private static final Color FRAME_COLOR = Color.decode("0x666666");

    private static final Color[] colors = {ORANGE, WHITE, GRAY, GREEN, BLUE, YELLOW, RED};
    private static final String[] colorNames = {"o", "w", "g", "n", "b", "y", "r"};
    private static final int ADMIN = 0;

    private static final int OUTSIDE_FRAME_WIDTH = 1;
    private static final int INSIDE_FRAME_WIDTH = 1;

    private int width = 22;
    private int height = 13;

    public static void main(String[] args) {
        try {

            Generator g = new Generator();
            g.makeImage("./ri/" + colorNames[ADMIN] + colorNames[ADMIN] + colorNames[ADMIN] + ".png",
                    new Color[]{colors[ADMIN], colors[ADMIN], colors[ADMIN]});
            for (int i = 1; i < colors.length; i++) {
                for (int j = 1; j < colors.length; j++) {
                    for (int k = 1; k < colors.length; k++) {
                        g.makeImage("./ri/" + colorNames[i] + colorNames[j] + colorNames[k] + ".png",
                                new Color[]{colors[i], colors[j], colors[k]});
                    }
                }
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static boolean isValidDimension(int width, int height) {
        return ((width - ((2 * OUTSIDE_FRAME_WIDTH) + (2 * INSIDE_FRAME_WIDTH))) % 3 == 0);
    }


    private void makeImage(String fileName, Color[] colors) throws Exception {
        BufferedImage bi = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
        Graphics2D g = bi.createGraphics();

        for (int i = 0; i < colors.length; i++) {
            g.setColor(colors[i]);
            drawBlock(g, i + 1);
        }

        g.setColor(FRAME_COLOR);
        drawOutsideFrame(g);
        drawInsideFrame(g);

        bi.flush();

        ImageIO.write(bi, "png", new File(fileName));

    }

    private void drawOutsideFrame(Graphics2D g) {
        Rectangle top = new Rectangle(0, 0, width, OUTSIDE_FRAME_WIDTH);
        Rectangle left = new Rectangle(0, OUTSIDE_FRAME_WIDTH, OUTSIDE_FRAME_WIDTH, height - (2 * OUTSIDE_FRAME_WIDTH));
        Rectangle right = new Rectangle(width - OUTSIDE_FRAME_WIDTH, OUTSIDE_FRAME_WIDTH, OUTSIDE_FRAME_WIDTH, height - (2 * OUTSIDE_FRAME_WIDTH));
        Rectangle bottom = new Rectangle(0, height - OUTSIDE_FRAME_WIDTH, width, OUTSIDE_FRAME_WIDTH);
        g.fill(top);
        g.fill(left);
        g.fill(right);
        g.fill(bottom);
    }

    private void drawInsideFrame(Graphics2D g) {
        Rectangle leftSplit = new Rectangle(OUTSIDE_FRAME_WIDTH + getBlockWidth(), OUTSIDE_FRAME_WIDTH, INSIDE_FRAME_WIDTH, getBlockHeight());
        Rectangle rightSplit = new Rectangle(OUTSIDE_FRAME_WIDTH + getBlockWidth() * 2 + INSIDE_FRAME_WIDTH, OUTSIDE_FRAME_WIDTH, OUTSIDE_FRAME_WIDTH, height - (2 * OUTSIDE_FRAME_WIDTH));
        g.fill(leftSplit);
        g.fill(rightSplit);
    }

    private void drawBlock(Graphics2D g, int index) {
        int x = 0;
        int y = OUTSIDE_FRAME_WIDTH;
        if (index < 1) throw new IllegalArgumentException("index was " + index);
        if (index == 1) {
            x = OUTSIDE_FRAME_WIDTH;
        } else {
            x = ((index - 1) * INSIDE_FRAME_WIDTH) +
                    ((index - 1) * getBlockWidth()) +
                    OUTSIDE_FRAME_WIDTH;
        }
//        System.out.println("x: " + x + " y: " + y + " w: " + getBlockWidth() + " h: " + getBlockHeight());
        Rectangle rect = new Rectangle(x, y, getBlockWidth(), getBlockHeight());
        g.fill(rect);
    }

    private int getBlockHeight() {
        return height - (2 * OUTSIDE_FRAME_WIDTH);
    }

    private int getBlockWidth() {
        return (width - ((2 * OUTSIDE_FRAME_WIDTH) + (2 * INSIDE_FRAME_WIDTH))) / 3;
    }

}
