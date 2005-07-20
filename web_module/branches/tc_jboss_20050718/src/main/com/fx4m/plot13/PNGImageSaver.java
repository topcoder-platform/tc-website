/*****************************************************************************
 *
 *                               PNGImageSaver.java
 *
 * Java source created by Kary FRAMLING 6/6/1998
 *
 * Copyright 1998-2003 Kary Framling
 * Source code distributed under GNU LESSER GENERAL PUBLIC LICENSE,
 * included in the LICENSE.txt file in the topmost directory
 *
 *****************************************************************************/

//package fi.faidon.jis;
package com.fx4m.plot13;

import java.awt.image.*;
import java.io.Serializable;
import java.util.Hashtable;
import java.util.zip.CRC32;
import java.util.zip.Deflater;

//import fi.faidon.util.ByteArrayConversion;


/**
 * Class for saving an image in the PNG format. We always use 24-bit RGB
 * true-color coding for the moment.
 *
 * @author Kary FRAMLING
 */
public class PNGImageSaver extends ImageSaverInterface
        implements Serializable, ImageConsumer {
    //--------------------------------------------------------------------------------------
    // Public constants.
    //--------------------------------------------------------------------------------------
    public static final String FORMAT_CODE = "PNG";
    public static final String FORMAT_COMPLETE_NAME = "Portable Network Graphics (PNG)";
    public static final String FORMAT_EXTENSION = "png";

    //--------------------------------------------------------------------------------------
    // Private constants.
    //--------------------------------------------------------------------------------------
    private final boolean OBLIGATORY_REGISTRATION = false;
    private final int DEFLATE_INPUT_SIZE = 512;
    private final byte[] PNG_IDENTIFICATION_BYTES = {(byte) 137, (byte) 80, (byte) 78, (byte) 71, (byte) 13, (byte) 10, (byte) 26, (byte) 10};
    private final int IHDR_DATA_SIZE = 13;
    private final int CHUNK_TYPE_SIZE = 4;
    private final byte[] IHDR_CHUNK_TYPE = {(byte) 0x49, (byte) 0x48, (byte) 0x44, (byte) 0x52};
    private final byte[] IDAT_CHUNK_TYPE = {(byte) 0x49, (byte) 0x44, (byte) 0x41, (byte) 0x54};
    private final byte[] IEND_CHUNK_TYPE = {(byte) 0x49, (byte) 0x45, (byte) 0x4E, (byte) 0x44};
    private final byte COLOR_TYPE_COLOR = 2;
    private final byte COLOR_TYPE_USE_ALPHA_CHANNEL = 4;
    private final byte DEFLATE_INFLATE_COMPRESSION = 0;
    private final byte NO_INTERLACE = 0;
    private final byte NO_FILTER = 0;
    private final byte SUB_FILTER = 1;

    //--------------------------------------------------------------------------------------
    // Private fields.
    //--------------------------------------------------------------------------------------
    //    private FileOutputStream	writeFileHandle;
    private int width;
    private int height;
    private int saveStatus;
    private int byteCount;
    private int bytesPerPixel;
    private CRC32 crcCounter;
    private Deflater pixmapDeflater;
    private long idatChunkSizeOffset;
    private long idatDataSize;
    private boolean headerIsWritten;
    private boolean imageCompleteDone;
    private boolean includeAlphaChannel;
    private byte[] theBytes;
    private int theByteCount;

    //--------------------------------------------------------------------------------------
    // Public methods.
    //--------------------------------------------------------------------------------------

    //=============================================================================
    // Constructor
    //=============================================================================
    /**
     * @author Kary FRAMLING 6/6/1998.
     */
    //=============================================================================
    public PNGImageSaver() {
        // Registration check.
        /*
        if ( OBLIGATORY_REGISTRATION ) {
            fi.faidon.protection.SerialNumberManager sm = new fi.faidon.protection.SerialNumberManager();
            if ( !sm.verifyCurrentPackage() ) {
                System.err.println(fi.faidon.protection.SerialNumberManager.STR_REG_VERIFICATION_FAILED);
                System.err.println("Exiting...");
                System.exit(1);
            }
        }
         */
        // We use the same CRC counter all the way.
        crcCounter = new CRC32();

        // Nothing written yet.
        headerIsWritten = false;
        imageCompleteDone = false;

        // Three bytes per pixel by default.
        bytesPerPixel = 3;

        // No alpha channel by default.
        includeAlphaChannel = false;
        theBytes = new byte[100000];
        theByteCount = 0;
    }

    private void stuffBytes(byte[] a, int off, int len) {
        for (int i = 0; i < len; i++) {
            if (theByteCount >= theBytes.length) {
                byte[] b = new byte[3 * a.length / 2];
                for (int j = 0; j < theBytes.length; j++) b[j] = theBytes[j];
                theBytes = b;
            }
            theBytes[theByteCount++] = a[i + off];
        }
    }

    private void stuffBytes(byte[] a) {
        stuffBytes(a, 0, a.length);
    }

    public byte[] getBytes() {
        byte[] b = new byte[theByteCount];
        for (int j = 0; j < theByteCount; j++) b[j] = theBytes[j];
        theBytes = b;
        return theBytes;
    }

    //=============================================================================
    /**
     * ImageSaverInterface method implementations.
     */
    //=============================================================================
    public String getFormatCode() {
        return FORMAT_CODE;
    }

    public String getFormatString() {
        return FORMAT_COMPLETE_NAME;
    }

    public String getFormatExtension() {
        return FORMAT_EXTENSION;
    }

    //=============================================================================
    // saveIt
    //=============================================================================
    /**
     * Save the image.
     */
    //=============================================================================
    public boolean saveIt() {
        ImageProducer ip;

        // Verify that we have an image.
        if (saveImage == null) return false;

        // No status information yet.
        saveStatus = 0;

        // Open the file.
        //	try {
        //	    writeFileHandle = new FileOutputStream(savePath);
        //	} catch ( IOException e ) { System.out.println("IOException occurred opening FileOutputStream : " + e); }

        // Return straight away if we couldn't get a handle.
        //	if ( writeFileHandle == null ) return false;

        // Set us up as image consumer and start producing.
        ip = saveImage.getSource();
        if (ip == null) return false;
        ip.startProduction(this);

        // Nothing more to do, just get data and close file at the end.
        return true;
    }

    //=============================================================================
    // checkSave
    //=============================================================================
    /**
     * Return ImageObserver constants for indicating the state of the image saving.
     *
     * @author Kary FRAMLING 30/4/1998.
     */
    //=============================================================================
    public int checkSave() {
        return saveStatus;
    }

    //=============================================================================
    // getUseAlphaChannel
    //=============================================================================
    /**
     * Returns if an alpha channel is to be used or not.
     *
     * @author Kary FRAMLING
     */
    //=============================================================================
    public boolean getUseAlphaChannel() {
        return includeAlphaChannel;
    }

    //=============================================================================
    // setUseAlphaChannel
    //=============================================================================
    /**
     * Indicate if an alpha channel should be used or not.
     *
     * @author Kary FRAMLING
     */
    //=============================================================================
    public void setUseAlphaChannel(boolean use) {
        includeAlphaChannel = use;
        if (includeAlphaChannel)
            bytesPerPixel = 4;
        else
            bytesPerPixel = 3;
    }

    //=============================================================================
    /**
     * ImageConsumer method implementations.
     */
    //=============================================================================
    public void setProperties(Hashtable props) {
        saveStatus |= ImageObserver.PROPERTIES;
    }

    public void setHints(int hintflags) {
    }

    //=============================================================================
    // setColorModel
    //=============================================================================
    /**
     * If the default color model is an indexed color model and if it has a
     * transparency pixel, then we put in an alpha channel.
     */
    //=============================================================================
    public void setColorModel(ColorModel model) {
        // Change alpha channel mode only if the header isn't written yet.
        if (!headerIsWritten && model instanceof IndexColorModel) {
            if (((IndexColorModel) model).getTransparentPixel() != -1) {
                includeAlphaChannel = true;
                bytesPerPixel = 4;
            }
        }
    }

    //=============================================================================
    // setDimensions
    //=============================================================================
    /**
     */
    //=============================================================================
    public void setDimensions(int w, int h) {
        // Store width and height.
        width = w;
        height = h;

        // Update save status.
        saveStatus |= ImageObserver.WIDTH | ImageObserver.HEIGHT;
    }

    //=============================================================================
    // setPixels
    //=============================================================================
    /**
     * Write the pixels into the file as RGB data. For this to work correctly,
     * pixels should be delivered in topdownleftright order with complete
     * scanlines. If we have several lines, the lines should be complete scanlines,
     * otherwise the saving fails.
     * @see ImageConsumer.
     */
    //=============================================================================
    public void setPixels(int x, int y, int w, int h,
                          ColorModel model, byte pixels[], int off,
                          int scansize) {
        int i, rgb;
        int transparent_pixel = -1;
        int[] int_pix_buf;

        // Change alpha channel mode only if the header isn't written yet.
        // We only use an alpha channel if the model has a transparent color.
        // This is allright if only one color model is used or if the first
        // one used has a transparent color. Otherwise there will be no
        // alpha channel.
        if (!headerIsWritten && model instanceof IndexColorModel) {
            if (((IndexColorModel) model).getTransparentPixel() != -1) {
                includeAlphaChannel = true;
                bytesPerPixel = 4;
            }
        }

        // If we are using an alpha channel, then get the transparent pixel
        // index if any.
        if (includeAlphaChannel && model instanceof IndexColorModel) {
            transparent_pixel = ((IndexColorModel) model).getTransparentPixel();
        }

        // Transform the byte array into the corresponding RGB array.
        int_pix_buf = new int[pixels.length];
        for (i = off; i < pixels.length; i++) {
            // Funny, we have to mask out the last byte for this to work correctly.
            int_pix_buf[i] = model.getRGB(pixels[i] & 0xFF);

            // Set alpha channel value if applicable.
            if (includeAlphaChannel && (pixels[i] & 0xFF) == transparent_pixel)
                int_pix_buf[i] &= 0xFFFFFF;
        }

        // Call the int array method.
        setPixels(x, y, w, h, ColorModel.getRGBdefault(), int_pix_buf, off, scansize);
    }

    //=============================================================================
    // setPixels
    //=============================================================================
    /**
     * @see ImageConsumer.
     */
    //=============================================================================
    public void setPixels(int x, int y, int w, int h,
                          ColorModel model, int pixels[], int off,
                          int scansize) {
        int i, j, buf_off, rgb, deflate_size, in_byte_off;
        byte[] buf;
        byte[] deflate_buf = new byte[DEFLATE_INPUT_SIZE];
        byte[] four_byte_buf = new byte[4];
        int r, g, b, alpha;
        int old_r, old_g, old_b;

        // Write out the header if it is not written yet.
        if (!headerIsWritten) writeHeader();

        // Fill the pixel buffer to pack. We suppose that we always get
        // entire scanlines if "h" is bigger than 1. The "+ h" is because
        // we insert a filtering indication byte at the beginning of each
        // scanline.
        buf = new byte[w * h * bytesPerPixel + h];
        buf_off = 0;
        old_r = old_g = old_b = 0;
        for (i = 0; i < h; i++) {
            // Set the filtering byte in the beginning of the scanline.
            if (x == 0) buf[buf_off++] = NO_FILTER;
            //			if ( x == 0 ) buf[buf_off++] = SUB_FILTER;

            // Treat the scanline.
            for (j = 0; j < w; j++) {
                // Get the RGB value in one go.
                rgb = model.getRGB(pixels[off + i * scansize + j]);

                // Set red, green and blue components.
                r = ((rgb >> 16) & 0xFF);
                g = ((rgb >> 8) & 0xFF);
                b = (rgb & 0xFF);
                buf[buf_off++] = (byte) (r & 0xFF);
                buf[buf_off++] = (byte) (g & 0xFF);
                buf[buf_off++] = (byte) (b & 0xFF);
/*				buf[buf_off++] = (byte) ((r - old_r)&0xFF);
				buf[buf_off++] = (byte) ((g - old_g)&0xFF);
				buf[buf_off++] = (byte) ((b - old_b)&0xFF);
				old_r = r;
				old_g = g;
				old_b = b; */

                // If we have an alpha channel to include, then add it after
                // the RGB values.
                if (includeAlphaChannel) {
                    alpha = model.getAlpha(pixels[off + i * scansize + j]);
                    buf[buf_off++] = (byte) (alpha & 0xFF);
                }
            }
        }

        // Compress the data and write it out as it is compressed.
        // We do this in 512 byte chunks, because it seems like
        // doing one big setInput gives a stack overflow.
        for (in_byte_off = 0; in_byte_off < buf.length; in_byte_off += DEFLATE_INPUT_SIZE) {
            pixmapDeflater.setInput(buf, in_byte_off, (int) Math.min(DEFLATE_INPUT_SIZE, buf.length - in_byte_off));
            while (!pixmapDeflater.needsInput()) {
                deflate_size = pixmapDeflater.deflate(deflate_buf);
                //try {
                stuffBytes(deflate_buf, 0, deflate_size);
//} catch ( IOException e ) { saveStatus = ImageObserver.ERROR; }
                byteCount += deflate_size;
                idatDataSize += deflate_size;
                crcCounter.update(deflate_buf, 0, deflate_size);
            }
        }

        // Update save status.
        saveStatus |= ImageObserver.SOMEBITS;
    }

    //=============================================================================
    // imageComplete
    //=============================================================================
    /**
     * Get imageComplete message so that we can close the output file.
     * @see ImageConsumer.
     */
    //=============================================================================
    public void imageComplete(int status) {
        int deflate_size;
        byte[] four_byte_buf = new byte[4];
        byte[] deflate_buf = new byte[DEFLATE_INPUT_SIZE];

        // Finish everything if it has not been done yet.
        if (!imageCompleteDone) {
            // Write out the remaining pixel data and add the CRC of the IDAT chunk.
            pixmapDeflater.finish();
            while (!pixmapDeflater.finished()) {
                deflate_size = pixmapDeflater.deflate(deflate_buf);
                //try {
                stuffBytes(deflate_buf, 0, deflate_size);
//} catch ( IOException e ) { saveStatus = ImageObserver.ERROR; }
                byteCount += deflate_size;
                idatDataSize += deflate_size;
                crcCounter.update(deflate_buf, 0, deflate_size);
            }
            ByteArrayConversion.ulongAsBytesBE(crcCounter.getValue(), four_byte_buf, 0, four_byte_buf.length);
            //try {
            stuffBytes(four_byte_buf);
//} catch ( IOException e ) { saveStatus = ImageObserver.ERROR; }
            byteCount += four_byte_buf.length;

            // Data length. 0 for IEND.
            ByteArrayConversion.uintAsBytesBE(0, four_byte_buf, 0, four_byte_buf.length);
            //try {
            stuffBytes(four_byte_buf);
//} catch ( IOException e ) { saveStatus = ImageObserver.ERROR; }
            byteCount += four_byte_buf.length;

            // IEND type.
            //try {
            stuffBytes(IEND_CHUNK_TYPE);
//} catch ( IOException e ) { saveStatus = ImageObserver.ERROR; }
            byteCount += IEND_CHUNK_TYPE.length;

            // Chunk CRC.
            crcCounter.reset();
            crcCounter.update(IEND_CHUNK_TYPE);
            ByteArrayConversion.ulongAsBytesBE(crcCounter.getValue(), four_byte_buf, 0, four_byte_buf.length);
            //try {
            stuffBytes(four_byte_buf);
//} catch ( IOException e ) { saveStatus = ImageObserver.ERROR; }
            byteCount += four_byte_buf.length;

            // Close the file and reopen in random access mode. This is just for setting
            // the size of the IDAT chunk data.
//	    if ( writeFileHandle != null ) {
//		try { writeFileHandle.close(); } catch ( IOException e ) { saveStatus = ImageObserver.ERROR; }
//	    }
//	    try {
//		RandomAccessFile rf = new RandomAccessFile(savePath, "rw");
//		rf.seek(idatChunkSizeOffset);
//		ByteArrayConversion.ulongAsBytesBE(idatDataSize, four_byte_buf, 0, four_byte_buf.length);
//		rf.write(four_byte_buf);
//		rf.close();
//	    } catch ( IOException e ) { System.out.println("IOException occurred opening RandomAccessFile : " + e); }

            ByteArrayConversion.ulongAsBytesBE(idatDataSize, four_byte_buf, 0, four_byte_buf.length);
            theBytes[(int) (idatChunkSizeOffset++)] = four_byte_buf[0];
            theBytes[(int) (idatChunkSizeOffset++)] = four_byte_buf[1];
            theBytes[(int) (idatChunkSizeOffset++)] = four_byte_buf[2];
            theBytes[(int) (idatChunkSizeOffset++)] = four_byte_buf[3];

            // We are ready with imageComplete treatment.
            imageCompleteDone = true;
        }

        // Update save status.
        saveStatus |= ImageObserver.ALLBITS;
    }

    //--------------------------------------------------------------------------------------
    // Private methods.
    //--------------------------------------------------------------------------------------

    //=============================================================================
    // writeHeader
    //=============================================================================
    /**
     * Writes out the entire PNG header and the start of the IDAT chunk. It should
     * be definitely known at this time if we use an alpha channel or not.
     */
    //=============================================================================
    private synchronized void writeHeader() {
        int i, off;
        long crc;
        byte[] buf;
        byte[] one_byte_buf = new byte[1];
        byte[] two_byte_buf = new byte[2];
        byte[] four_byte_buf = new byte[4];

        // No bytes written yet.
        byteCount = 0;

        // Write the PNG identification byte array.
        //try {
        stuffBytes(PNG_IDENTIFICATION_BYTES);
        //} catch ( IOException e ) { saveStatus = ImageObserver.ERROR; }
        byteCount += PNG_IDENTIFICATION_BYTES.length;

        // Write out header chunk.
        ByteArrayConversion.uintAsBytesBE(IHDR_DATA_SIZE, four_byte_buf, 0, 4);
        // Data length.
        //try {
        stuffBytes(four_byte_buf);
        //} catch ( IOException e ) { saveStatus = ImageObserver.ERROR; }
        byteCount += four_byte_buf.length;
        // IHDR type.
        //try {
        stuffBytes(IHDR_CHUNK_TYPE);
        //} catch ( IOException e ) { saveStatus = ImageObserver.ERROR; }
        byteCount += IHDR_CHUNK_TYPE.length;
        // Chunk data.
        buf = new byte[IHDR_DATA_SIZE];
        off = 0;
        ByteArrayConversion.uintAsBytesBE(width, buf, off, off + 4);
        off += 4;
        ByteArrayConversion.uintAsBytesBE(height, buf, off, off + 4);
        off += 4;
        buf[off++] = 8;
        if (includeAlphaChannel)
            buf[off++] = COLOR_TYPE_COLOR + COLOR_TYPE_USE_ALPHA_CHANNEL;
        else
            buf[off++] = COLOR_TYPE_COLOR;
        buf[off++] = DEFLATE_INFLATE_COMPRESSION;
        buf[off++] = 0;
        buf[off++] = NO_INTERLACE;
        //try {
        stuffBytes(buf);
        //} catch ( IOException e ) { saveStatus = ImageObserver.ERROR; }
        byteCount += buf.length;
        // Chunk CRC.
        crcCounter.reset();
        crcCounter.update(IHDR_CHUNK_TYPE);
        crcCounter.update(buf);
        ByteArrayConversion.ulongAsBytesBE(crcCounter.getValue(), four_byte_buf, 0, four_byte_buf.length);
        //try {
        stuffBytes(four_byte_buf);
        //} catch ( IOException e ) { saveStatus = ImageObserver.ERROR; }
        byteCount += four_byte_buf.length;

        // The header is written, so don't write it again if ever this method
        // gets called a second time.
        headerIsWritten = true;

        // Write the first IDAT chunk and set up the deflater. For the moment,
        // we suppose that one chunk will be sufficient for storing any resonable
        // image. This is mainly limited by the chunk size field (4 bytes),
        // which means that the maximal size is 2^31 - 1 bytes
        // if we take the maximal unsigned value.
        pixmapDeflater = new Deflater();

        // Write out the data length. This is not known yet, so we have to
        // come back afterwards in direct access mode and set it.
        idatChunkSizeOffset = byteCount;
        ByteArrayConversion.uintAsBytesBE(0, four_byte_buf, 0, four_byte_buf.length);
        //try {
        stuffBytes(four_byte_buf);
        //} catch ( IOException e ) { saveStatus = ImageObserver.ERROR; }
        byteCount += four_byte_buf.length;
        idatDataSize = 0;

        // IDAT type.
        //try {
        stuffBytes(IDAT_CHUNK_TYPE);
        //} catch ( IOException e ) { saveStatus = ImageObserver.ERROR; }
        byteCount += IDAT_CHUNK_TYPE.length;

        // Then we reset the CRC counter and just add the type field.
        crcCounter.reset();
        crcCounter.update(IDAT_CHUNK_TYPE);
    }

}


