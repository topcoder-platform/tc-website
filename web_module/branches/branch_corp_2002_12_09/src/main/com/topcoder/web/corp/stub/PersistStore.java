package com.topcoder.web.corp.stub;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.output.XMLOutputter;

import com.topcoder.shared.security.User;
import com.topcoder.shared.util.logging.Logger;

/**
 * My comments/description/notes go here
 * 
 * 
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public class PersistStore {
    protected static final Logger log = Logger.getLogger(PersistStore.class);
    public static final String STORAGE_FILE = "pstore.xml";
    private Document store = null;
    private File xmlStore = null;
    private static PersistStore me = null;
    
    /**
     * 
     * @see java.lang.Object#Object()
     */
    private PersistStore() {
    }
    
    /**
     * 
     * @param dir
     * @return PersistStore
     */
    public static PersistStore getInstance(File dir) {
        if( dir != null ) {
            log.debug("--- where xml would be= "+dir.getAbsolutePath());
        }
        if( me == null ) {
            synchronized(STORAGE_FILE) {
                if( me == null ) {
                    me = new PersistStore();
                    me.xmlStore = new File(dir, STORAGE_FILE);
                    me.load();
                }
            }
        }
        return me;
    }
    
    /**
     * 
     * My comments/description/notes go here
     * 
     * 
     * @author djFD molc@mail.ru
     * @version 1.02
     *
     */
    class u_iter implements Iterator {
        private List lst;
        private int ix;
        private u_iter(List ulst) {
            lst = ulst;
            ix = 0;
        }
       /**
         * @see java.util.Iterator#hasNext()
         */
        public boolean hasNext() {
            return ix < lst.size();
        }

        /**
         * @see java.util.Iterator#next()
         */
        public Object next() {
            if( hasNext() ) {
                return userCr((Element)lst.get(ix++));
            }
            return null;
        }

        /**
         * @see java.util.Iterator#remove()
         */
        public void remove() {}
    }
    
    /**
     * 
     * @return Iterator
     */
    public Iterator userList() {
        return new u_iter(getUsersNode().getChildren());
    }

    /**
     * 
     * @return Element
     */    
    private Element getUsersNode() {
        List nodes = store.getRootElement().getChildren();
        for(int i=0; i<nodes.size(); ++i) {
            Element l = (Element)nodes.get(i);
            if( "user-list".equals(l.getName()) ) {
                return l;
            }
        }
        return null;
    }

    /**
     * 
     * @param u
     * @return User
     */
    private User userCr(Element u) {
        try {
            return new UserStub(
                u.getAttributeValue("handle"),
                u.getAttributeValue("passw"),
                u.getAttribute("id").getLongValue(),
                u.getAttributeValue("group") );
        }
        catch(Exception e) {
            return null;
        }
    }
        
    /**
     * 
     * @param id
     * @return User
     */
    public User getUser(long id) {
        if( id == UserStub.USER_ANONYMOUS_ID ) {
            return UserStub.getAnonymous();
        }
        
        Element ulist = getUsersNode();
        List users = ulist.getChildren();
        for(int i=0; i<users.size(); ++i) {
            Element u = (Element)users.get(i);
            try {
                if( id == u.getAttribute("id").getLongValue() ) {
                    //found
                    User usr = userCr(u);
                    if( usr != null ) {
                        return usr;
                    }
                }
            }
            catch(Exception e) {
                continue;
            }
        }
        return null;
    }

    public User getUser(String name) {
        Element ulist = getUsersNode();
        List users = ulist.getChildren();
        for(int i=0; i<users.size(); ++i) {
            Element u = (Element)users.get(i);
            if( name.equals(u.getAttributeValue("handle")) ) {
                //found
                User usr = userCr(u);
                if( usr != null ) {
                    return usr;
                }
            }
        }
        return null;
    }

    public void insertUser(User user) {
        Element u = new Element("user");
        u.setAttribute("id", ""+user.getId());
        u.setAttribute("handle", user.getUserName());
        u.setAttribute("passw", user.getPassword());
        u.setAttribute("group", user.getGroup());
        getUsersNode().addContent(u);
        save();
    }
    
    private void save() {
        boolean error = false;
        File tempFile = null;
        OutputStream os = null;
        try {
            tempFile = File.createTempFile("bla-bla", null);
            tempFile.deleteOnExit();
            os = new BufferedOutputStream(new FileOutputStream(tempFile));
            XMLOutputter outputter = new XMLOutputter();
            outputter.setIndent(true);
            outputter.setTextNormalize(true);
            outputter.setLineSeparator("\n");
            outputter.setNewlines(true);
            outputter.output(store, os);
        }
        catch (Exception e) {
            e.printStackTrace();
            error = true;
        }
        finally {
            try {
                os.close();
            }
            catch (Exception e) {
                e.printStackTrace();
                error = true;
            }
        }
        if (!error) {
            xmlStore.delete();
            tempFile.renameTo(xmlStore);
        }
    }

    private void load() {
        String path = xmlStore.getAbsolutePath();
        try {
            store = (new org.jdom.input.DOMBuilder()).build(xmlStore);
        }
        catch(org.jdom.JDOMException e) {
            e.printStackTrace();
        }
    }
}
