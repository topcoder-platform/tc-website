
/*****************************************************************************
 *
 *                             ImageSaverInterface.java
 *
 * Interface that defines the methods supported by all classes that save
 * images in various formats.
 *
 * Java source created by Kary FRAMLING 12/2/1998
 *
 * Copyright 1998-2003 Kary Främling
 * Source code distributed under GNU LESSER GENERAL PUBLIC LICENSE,
 * included in the LICENSE.txt file in the topmost directory
 *
 *****************************************************************************/

//package fi.faidon.jis;
package com.topcoder.utilities.graph;

import java.awt.Image;

/**
 * Abstract class that defines the methods supported by all classes that save
 * images in various formats.
 */
public abstract class ImageSaverInterface {
    protected String savePath;
    protected Image saveImage;

    public abstract String getFormatCode();

    public abstract String getFormatString();

    public abstract String getFormatExtension();

    public abstract boolean saveIt();

    public abstract int checkSave();

    public Image getSaveImage() {
        return saveImage;
    }

    public void setSaveImage(Image img) {
        saveImage = img;
    }

    public String getSavePath() {
        return savePath;
    }

    public void setSavePath(String path) {
        savePath = path;
    }
}