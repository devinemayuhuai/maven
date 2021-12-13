package com.myh.controller;

import com.myh.pojo.Book;
import com.myh.pojo.Cart;
import com.myh.pojo.CartItem;
import com.myh.pojo.User;
import com.myh.service.ServiceImpl.BookServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

@Controller
public class CartController {
    @Autowired
    private BookServiceImpl bookServiceImpl;

    @RequestMapping("/cart")
    public String myCart(){
         return "forward:/pages/cart/mycart.jsp";
      }

      @ResponseBody
      @RequestMapping("/additem")
      public Map addItem(@RequestParam("bookId") Integer bookId, @RequestParam("count")Integer count, HttpServletRequest request){

            User user=(User) request.getSession().getAttribute("userinfo");
            Map map=new HashMap();
            if (user!=null) {
                Book book = bookServiceImpl.queryBookById(bookId);
                BigDecimal cou = new BigDecimal(count);
                BigDecimal totalprice = book.getPrice().multiply(cou);
                CartItem cartItem = new CartItem(book.getId(), book.getImgpath(), book.getName(), count, book.getPrice(), totalprice);
                System.out.println(cartItem);
                Cart cart = (Cart) request.getSession().getAttribute("cart");
                if (cart == null) {
                    cart = new Cart();
                    request.getSession().setAttribute("cart", cart);
                }
                cart.addItem(cartItem);
                map.put("state","success");
            }else {
                map.put("state","fail");
            }


          return map;
      }


     @RequestMapping("/deleteItem")
      public String deleteItem(@RequestParam("id") Integer id,HttpServletRequest request){
         Cart cart=(Cart) request.getSession().getAttribute("cart");
         if (cart!=null) {
             cart.deleteItem(id);
         }
         return "forward:/pages/cart/mycart.jsp";
      }

      @RequestMapping("reduceItem")
    public String reduce(@RequestParam("id") Integer id,HttpServletRequest request){
        Cart cart=(Cart) request.getSession().getAttribute("cart");
        if (cart!=null) {
            cart.reduceItem(id);
        }
        return "forward:/pages/cart/mycart.jsp";
    }
    @RequestMapping("/addItem2")
    public String add(@RequestParam("id") Integer id,HttpServletRequest request){
        Cart cart=(Cart) request.getSession().getAttribute("cart");
        if (cart!=null) {
            cart.addItem2(id);
        }
        return "forward:/pages/cart/mycart.jsp";
    }

    @RequestMapping("/clearAll")
    public String clearAll(HttpServletRequest request){
        Cart cart=(Cart) request.getSession().getAttribute("cart");
        if (cart!=null) {
           cart.clear();
        }
        return "forward:/pages/cart/mycart.jsp";
    }







}
