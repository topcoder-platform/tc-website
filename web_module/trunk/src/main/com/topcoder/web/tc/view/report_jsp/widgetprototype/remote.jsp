<script>
// Notice that this is a third party library.
// It must be checked that the license is ok for TopCoder before using in production.
// Also notice that just the used part of the library was copied here, and 2 fixes were done (search "fix")
// Remote: http://doctyper.com/stuff/remote/

/**
 * @fileoverview Remote is a global XMLHttpRequest/JSON function.
 * It's meant to handle every scenario thrown at it. The list so far:
 * 1. Native XMLHttpRequest for browsers that support it.
 * 2. Revert to use of XML Data Islands in an ideal scenario (more on that later).
 * 3. Revert to ActiveX if needed.
 * 4. Handles both GET and POST.
 * 5. Handles parameters for both GET and POST.
 * 
 * @author Richard Herrera rich@doctyper.com
 * @version 1.1
 * 
 * @license Remote is released according to the Creative Commons Attribution-Share Alike 3.0 License. You are free to use, distribute, and modify (as long as you share alike).
 * @license-url http://creativecommons.org/licenses/by-sa/3.0/
 */

/**
 * @require: Remote namespace
 */
var Remote = window.Remote || {};

/**
 * The XHR object
 * @class This is the XHR "class"
 * @constructor
 * @param {String} url The url to request
 */
Remote.XHR = function(url) {
    
    /**
     * @returns false if neither callback nor url are defined
     */
    if (!url) {
        return;
    } else {
        Remote.XHR.url = url;
    }
    
    Remote.XHR.settings = {};
    this.queries = {};
    
};
Remote.XHR.prototype = {
    
    /**
     * Returns the function to call onreadystatechange (after some detection && tidying up).
     * @constructor
     * @extends Remote.XHR
     */
    callback : function(callback) {
        
        /**
         * @returns if callback is undefined
         */
        if (typeof callback === "undefined") {
            return;
        }
        
        /**
         * Adds queries to the local object
         */
        var queryString,
            queryArray = [],
            i;
        
        /**
         * If needed, define the method to use in request and convert it to uppercase (just to be friendly...)
         */
        if (!this.enableRPCMethod) {
            if (typeof Remote.XHR.settings["method"] === "undefined") {
                Remote.XHR.settings["method"] = "GET";
            }
            Remote.XHR.settings["method"] = Remote.XHR.settings["method"].toUpperCase();
            
            /**
             * Define a boolean to determine (true) responseXML or (false) responseText use
             */
            if ((typeof Remote.XHR.settings["response"] === "undefined") || (Remote.XHR.settings["response"].toUpperCase() === "XML")) {
                Remote.XHR.settings["response"] = true;
            } else if (Remote.XHR.settings["response"].toUpperCase() === "TEXT") {
                Remote.XHR.settings["response"] = false;
            }
            
            /**
             * Define parameters to use in request (null by default)
             */
            for (i in this.queries) {
                queryArray.push(i + "=" + this.queries[i]);
            }
            if (/\?/.test(Remote.XHR.url)) {
                queryString = "&";
            } else {
                queryString = ((Remote.XHR.settings["method"] === "GET") && (queryArray.length !== 0)) ? "?" : "";
            }
            queryString += queryArray.join("&");
        } else {
            
            /**
             * We have ourselves a Remote.JSON-RPC call
             */
            queryString = this.JSONQuery();
        }
        
        /**
         * Create the Remote.XHR object
         * @see Remote.XHR.prototype.prep
         */
        var request = new this.prep(),
            
            /**
             * Set the Content-Type to send (GET uses text/xml, POST uses application/x-www-form-urlencoded)
             */
            type = (Remote.XHR.settings["method"] === "GET") ? "text/xml" : "application/x-www-form-urlencoded",
            data;
        
        /**
         * If request exists...
         */
        if (request) {
            
            if (this.pipeline && Remote.isBusy) {
                request.onreadystatechange = function() {};
                request.abort();
            }
            
            /**
             * Check for request.open support (XML Data Island method does not need to open a connection)
             */
            if (typeof request.open !== "undefined") {
                
                /**
                 * If GET is used, check for and append params to end of url. Then open the request.
                 */
                if (Remote.XHR.settings["method"] === "GET") {
                    request.open(Remote.XHR.settings["method"], Remote.XHR.url + queryString, true);
                } else {
                    
                    /**
                     * If POST is used, set a few more Request Headers. Then open the request.
                     */
                    request.open(Remote.XHR.settings["method"], Remote.XHR.url, true);
                    request.setRequestHeader("Content-Length", queryString.length);
                    request.setRequestHeader("Connection", "close");
                }
                
                /**
                 * Set a few more Request Headers. (Doesn't hurt... does it?)
                 */
                request.setRequestHeader("Content-Type", type);
                request.setRequestHeader("Cache-Control", "no-cache");
                
                if (this.pipeline) {
                    Remote.isBusy = true;
                }
            }
            
            /**
            * onreadystatechange function.
             */
            request.onreadystatechange = function() {
                
                /**
                 * Check for readyState
                 * switch (readyState) {
                 *  case 0 :
                 *  return "Uninitialized - open() has not been called yet"
                 *  break;
                 *  case 1 :
                 *  return "Loading - send() has not been called yet"
                 *  case 2 :
                 *  return "Loaded - send() has been called, headers and status are available"
                 *  break;
                 *  case 3 :
                 *  return "Interactive - Downloading, response(XML|Text) holds the partial data"
                 *  break;
                 *  case 4 :
                 *  return "Completed - Finished with all operations"
                 *  break;
                 * }
                 */
                if (request.readyState === 4) {
                
                    /**
                     * Check for status
                     * switch (status) {
                     *  case 200 :
                     *  return "OK"
                     *  break;
                     *  case 304 :
                     *  return "Not Modified"
                     *  break;
                     *  default :
                     *  return "Whoops, something weird happened!"
                     * }
                     */
                    if ((request.status === 200 || request.status === 304) || (typeof request.open === "undefined")) {
                        if (this.pipeline) {
                            Remote.isBusy = false;
                        }
                        Remote.XHR.prototype.onreadystatechange(request, callback);
                    
                    /**
                     * Error Check w/ Firebug (if available)
                     */
                    } else if ((typeof window.console !== "undefined") && (typeof console.log !== "undefined")) {
                        console.log("Whoops, something weird happened. Error:", request.status);
                    }
                }
            };
    
            /**
             * Send parameters (if supported)
             */
            if (typeof request.send !== "undefined") {
                request.send(queryString);
            }
        }
    },
    
    /**
     * onreadystatechange function
     * @extends Remote.XHR
     * @returns An Remote.XHR object (XMLHttpRequest || XML Data Island || ActiveXObject)
     * and calls the requested function
     */
    onreadystatechange : function(request, callback) {
        var data; // fix : IE didn't work well without it
    
        /**
        * Switch statement to test for Remote.XHR.type
         */
        switch (Remote.XHR.type) {
            
            /**
             * The cream of the crop: XMLHttpRequest.
             * If browser supports this, test and overrideMimeType
             * and pick a responseType.
             */
            case "XMLHttpRequest" :
            ;
            if (request.overrideMimeType) {
                request.overrideMimeType("text/xml");
            }
            
            /**
             * Check settings for response type
             */
            if (Remote.XHR.settings["response"] === true) {
                data = request.responseXML;                
            } else {
                data = request.responseText;     
            }
            break;
            
            /**
             * XML Data Island Support.
             * If browser supports this, set the data variable
             */
            case "XMLDataIsland" :
            data = request;
            break;
            
            /**
             * ActiveXObject Support.
             * If browser supports this, pick a responseType
             * Also has the option to parse XML as responseText
             * if responseXML is not available. (Comes up every
             * once in a while).
             */
            case "ActiveXObject" :
            
            /**
             * Check settings for response type
             */
            if (Remote.XHR.settings["response"] === true) {
                
                /**
                 * If IE actually does what it should (responseXML)
                 */
                if (request.responseXML) {
                    data = request.responseXML;
                    
                    /**
                     * Otherwise, if responseXML fails, force it with a nasty hack...
                     */
                } else {
                    data = new ActiveXObject("Microsoft.XMLDOM");
                    data.loadXML(request.responseText);
                }
            } else {
                data = request.responseText;
            }
            break;
        }
        
            
        /**
         * Awesomely split and append any namespaced objects to the window event
         * This avoids evaluating the function (yay!), and also avoids having to create a new function (yay!!)
         */
        if (/\./.test(callback)) {
            var calls = callback.split("."),
                fire = window[calls[0]];
            for (var i = 1; i < calls.length; i++) {
                fire = fire[calls[i]];
            }
            fire(data);
            
        } else {
            // window[callback](data);
            eval(callback + "(" + data + ")"); // fix by cucu
        }
    },
    
    /**
     * Create the Remote.XHR.
     * @constructor
     * @extends Remote.XHR
     * @returns An Remote.XHR object (XMLHttpRequest || XML Data Island || ActiveXObject)
     */
    prep : function() {
        var req,
        xml;
        
        /**
         * The cream of the crop: XMLHttpRequest.
         * If browser supports this, go nuts.
         */
        if (typeof window.XMLHttpRequest !== "undefined") {
            try { 
                Remote.XHR.type = "XMLHttpRequest";
                req = new XMLHttpRequest();
            } catch(e) {
                return false;
            }
            
            /**
             * XML Data Island Support.
             * Data islands can only be used in one ideal scenario (w/o nasty hacks):
             * Requesting an XML document, only when using "GET", amd only when using responseXML
             */
        } else if ((document.createElement) && (Remote.XHR.settings["method"] !== "POST") && (Remote.XHR.settings["response"] === true)) {
            Remote.XHR.type = "XMLDataIsland";
            xml = document.createElement("xml");
            xml.src = Remote.XHR.url;
            document.body.appendChild(xml);
            req = xml.XMLDocument;
            document.body.removeChild(xml);
            
            /**
             * ActiveXObject Support.
             * If all else fails, reluctantly use an ActiveXObject (Msxml2 preferred)
             */
        } else if (window.ActiveXObject) {
            Remote.XHR.type = "ActiveXObject";
            try {
                req = new ActiveXObject("Msxml2.XMLHTTP");
            } catch(e) {
                try {
                    req = new ActiveXObject("Microsoft.XMLHTTP");
                } catch(e) {
                    req = false;
                }
            }
        } else {
            req = false;
        }
        
        /**
         * @returns Remote.XHR Object
         */
        return req;
    },
    
    /**
     * Receive the settings, and append to local array
     */
    setResponse : function(value) {
        if (!Remote.XHR.settings) {
            Remote.XHR.settings = {};
        }
        
        Remote.XHR.settings["response"] = value;
    },
    
    /**
     * Receive the settings, and append to local array
     */
    setMethod : function(value) {
        if (this.enableRPCMethod) {
            return this.enableRPC.setMethod(e);
        } else {
            if (!Remote.XHR.settings) {
                Remote.XHR.settings = {};
            }
            Remote.XHR.settings["method"] = value;
        }
    },
    
    /**
     * Adds queries to the local object
     */
    setQuery : function(name, value) {
        
        /**
         * If item is an object, divide n' conquer
         */
        if (typeof name === "object") {
            for (var i in name) {
                if (/\s/g.test(name[i])) {
                    name[i] = name[i].replace(/\s/g, "+");
                }
                this.queries[i] = name[i];
            }
            
            /**
             * Otherwise do the vanilla thang...
             */
        } else {
            if (/\s/g.test(value)) {
                value = value.replace(/\s/g, "+");
            }
            this.queries[name] = value;
        }
    },
    
    setPipelining : function(e) {
        this.pipeline = e;
    },
    
    /**
     * Enables JSON-RPC
     */
    enableRPC : function() {
        
        /**
         * Bypass settings detection. JSON-RPC supports
         * only these settings.
         */
        this.enableRPCMethod = true;
        Remote.XHR.settings["method"] = "POST";
        Remote.XHR.settings["response"] = false;
        
        /**
         * Define objects
         */
        this.params = [];
        this.JSONObject = {};
        
        /**
         * Append parameters to JSONObject
         */
        this.setParams = function(object) {
            this.JSONObject["params"] = object;
        };
        
        /**
         * Append id to JSONObject
         */
        this.setId = function(e) {
            if (!e || e === null) {
                e = "null";
            }
            this.JSONObject["id"] = e;
        };
        
        /**
         * Append method to Remote.JSONObject
         * @returns callback function
         */
        this.setMethod = function(e) {
            this.JSONObject["method"] = e;
            return this.callback(e);
        };
        
        /**
         * Remote.JSONQuery defines the queryString to use
         * when using Remote.JSON-RPC
         * @returns a single object serialized using Remote.JSON
         */
        this.JSONQuery = function() {
            var queryArray = [],
            objectArray = [],
            queryString = "",
            i, j;
            for (i in this.JSONObject) {
                if (typeof this.JSONObject[i] === "number") {
                    queryArray.push("\"" + i + "\":" + this.JSONObject[i]);
                } else if (typeof this.JSONObject[i] === "string") {
                    queryArray.push("\"" + i + "\":\"" + this.JSONObject[i] + "\"");
                } else {
                    for (j = 0; j < this.JSONObject[i].length; j++) {
                        objectArray.push("\"" + this.JSONObject[i][j] + "\"");
                    }
                    queryArray.push("\"" + i + "\":[" + objectArray.join(",") + "]");
                }
            }
            queryString = "{" + queryArray.join(",") + "}";
            return queryString;
        };
    },
    
    /**
     * Redirect for tidyness
     * @see this.enableRPC.setParams(e);
     */
    setParams : function(e) {
        return this.enableRPC.setParams(e);
    },
    
    /**
     * Redirect for tidyness
     * @see this.enableRPC.setId(e);
     */
    setId : function(e) {
        return this.enableRPC.setId(e);
    }
};

</script>