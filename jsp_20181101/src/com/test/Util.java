package com.test;

public class Util {
   
     public static String toBin(int mok) {
        
        String result="";
        
        while(mok != 0) {
            int nmg = mok%2;
            mok =mok/2;
            
            result = nmg + result;
        }
        
        return result;
    }
     
}