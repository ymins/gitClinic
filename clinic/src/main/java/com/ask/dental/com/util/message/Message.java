package com.ask.dental.com.util.message; 
import java.util.Locale;

import org.springframework.context.support.MessageSourceAccessor;

/**
  * Message
  * @author Park you min
  */
public class Message {
     
    /**
      * MessageSourceAccessor
      */
    private static MessageSourceAccessor msAcc = null;
     
     public void setMessageSourceAccessor(MessageSourceAccessor msAcc) {
    	 Message.msAcc = msAcc;
     }
     
    /**
      * KEY에 해당하는 메세지 반환
     * @param key
      * @return
      */
    public static String getMessage(String key) {
         return msAcc.getMessage(key, Locale.getDefault());
     }
     
    /**
      * KEY에 해당하는 메세지 반환
     * @param key
      * @param objs
      * @return
      */
    public static String getMessage(String key, Object[] objs) {
         return msAcc.getMessage(key, objs, Locale.getDefault());
     }
 }
