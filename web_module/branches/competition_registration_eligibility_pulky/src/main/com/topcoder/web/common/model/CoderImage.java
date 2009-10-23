package com.topcoder.web.common.model;

import java.io.Serializable;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 21, 2006
 */
public class CoderImage extends Base {
    private Identifier id;
    private Coder coder;
    private Image image;
    private Boolean display;

    public CoderImage() {
        super();
    }

    public Identifier getId() {
        return id;
    }

    public void setId(Identifier id) {
        this.id = id;
    }

    public Coder getCoder() {
        return coder;
    }

    public void setCoder(Coder coder) {
        this.coder = coder;
    }

    public Image getImage() {
        return image;
    }

    public void setImage(Image image) {
        this.image = image;
    }

    public Boolean getDisplay() {
        return display;
    }

    public void setDisplay(Boolean display) {
        this.display = display;
    }

    public static class Identifier implements Serializable, Cloneable {

        private Long coderId;
        private Long imageId;

        public Identifier() {

        }

        public Identifier(Long coderId, Long imageId) {
            this.coderId = coderId;
            this.imageId = imageId;
        }

        public Long getCoderId() {
            return coderId;
        }

        public void setCoderId(Long coderId) {
            this.coderId = coderId;
        }

        public Long getImageId() {
            return imageId;
        }

        public void setImageId(Long imageId) {
            this.imageId = imageId;
        }


        public boolean equals(Object o) {
            if (o == null) {
                return false;
            } else {
                try {
                    CoderImage.Identifier oa = (CoderImage.Identifier) o;
                    return (oa.coderId.equals(coderId) &&
                            oa.imageId.equals(imageId));
                } catch (ClassCastException e) {
                    return false;
                }
            }
        }

        public int hashCode() {
            StringBuffer buf = new StringBuffer(100);
            buf.append(coderId);
            buf.append(" ");
            buf.append(imageId);
            return buf.toString().hashCode();
        }


    }


}
