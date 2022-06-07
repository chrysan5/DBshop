package com.company.shop;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtil {

   public static String getCookieValue(String key, HttpServletRequest req) {
      // HttpServletRequest req는 jsp가 가지고 있는 request를 전달받아서 사용함.
      
      String value = null;
      
      Cookie[] cookies = req.getCookies(); // 모든 쿠키가 다 들어있다.
      if(cookies != null && cookies.length>0) {
         for(int i=0; i<cookies.length; i++) {
            if(cookies[i].getName().equals(key)) {
               value = cookies[i].getValue();
            }
         }
      }
      return value;
   }
   
   
   public String deleteCookie(String key, HttpServletRequest req, HttpServletResponse res) {
      String result = "키에 맞는 쿠키가 없다";
      
      Cookie[] cookies = req.getCookies();
      if(cookies != null && cookies.length>0) {
         for(int i=0; i<cookies.length; i++) {
            if(cookies[i].getName().equals(key)) {
               Cookie cookie = new Cookie(cookies[i].getName(),""); // 내용을 초기화
               // 하지만 아직가지 이 쿠키는 살아 있다.
               cookie.setMaxAge(0);
               // 쿠키는 물리적으로 지우는 방법은 가능하나, 특정 쿠키를 delete 같은 형태로
               // 지울수는 없다. 그래서 유지시간을 0으로 설정해 주면 알아서 지워진다.
               
               // 쿠키는 설정한 시간 이후에 지워진다. 이 메서드가 시간 설정 하는 부분
               // 0 이니까 0초 => 이 쿠키가 유지되는 전체 시간을 0으로 바꾼다.
               res.addCookie(cookie);
               
               result = "삭제완료";
               break;
            }
         }
      }
      return result;
   }
   
   public static String insertCookie(String key, String val, HttpServletResponse res) {
      String result = "입력실패";
      
      Cookie cookie = new Cookie(key, val);
      res.addCookie(cookie);
      
      result = "입력완료";
      
      return result;
   }
}