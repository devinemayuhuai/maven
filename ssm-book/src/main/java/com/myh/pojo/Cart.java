package com.myh.pojo;

import java.math.BigDecimal;
import java.util.LinkedHashMap;
import java.util.Map;

public class Cart {

    private Map<Integer,CartItem> items=new LinkedHashMap<Integer,CartItem>();

    /**
     * 添加商品到购物车
     */
     public void addItem(CartItem cartItem){
         CartItem item= items.get(cartItem.getId());
         if (item==null){
             //之前没添加过此商品

             items.put(cartItem.getId(),cartItem);
          //   item.setTotalPrice(item.getPrice().multiply(new BigDecimal(item.getCount())));//更新总金额
         }else {
             //已经添加过的情况
             System.out.println("数量"+cartItem.getCount());
             item.setCount(item.getCount()+ cartItem.getCount());//商品种类累加
             item.setTotalPrice(item.getPrice().multiply(new BigDecimal(item.getCount())));//更新总金额
         }


     }

    /**
     * 通过商品id删除该商品
     */
     public void deleteItem(Integer id){
        items.remove(id);

     }

    /**
     * 清空购物车
     */
    public void clear(){
        items.clear();

    }

    /**
     * 修改商品数量
     */

    public void updateCount(Integer id ,Integer count){
        //先查看购物车中是否有次商品，如果有，修改商品数量，更新总金额
        CartItem cartItem= items.get(id);
        if (cartItem!=null){
            cartItem.setCount(count);//修改商品数量
            cartItem.setTotalPrice(cartItem.getPrice().multiply(new BigDecimal(cartItem.getCount())));//更新总金额
        }



    }
    /**
     *
     * 通过减号按钮减少购物车中的商品数量
     */
    public void reduceItem(Integer id){
        //查看购物车中是否有这件商品
        CartItem item= items.get(id);
        if (item!=null) {
            //已经添加过的情况
            item.setCount(item.getCount() - 1);//数量减一
            if (item.getCount()==0){
                deleteItem(id);
            }
            item.setTotalPrice(item.getPrice().multiply(new BigDecimal(item.getCount())));//更新总金额
        }

    }

    public void addItem2(Integer id){
        //查看购物车中是否有这件商品
        CartItem item= items.get(id);
        if (item!=null) {
            //已经添加过的情况
            item.setCount(item.getCount() + 1);//数量加一
            item.setTotalPrice(item.getPrice().multiply(new BigDecimal(item.getCount())));//更新总金额
        }

    }

    /**
     * 获取购物车中的商品总数量
     * @return
     */
    public Integer getTotalCount() {
        Integer totalCount=0;
        for (Map.Entry<Integer,CartItem> entry:items.entrySet()){
            totalCount+=entry.getValue().getCount();
        }

        return totalCount;
    }


    /**
     * 获取购物车中商品的总金额
     * @return
     */
    public BigDecimal getTotalPrice() {
        BigDecimal totalPrice=new BigDecimal(0);
        for (Map.Entry<Integer,CartItem> entry:items.entrySet()){
            totalPrice=totalPrice.add(entry.getValue().getTotalPrice());
        }
        return totalPrice;
    }


    /**
     * 获取购物车中的商品信息用于保存在session中
     * @return
     */
    public Map<Integer, CartItem> getItems() {
        return items;
    }

    public void setItems(Map<Integer, CartItem> items) {
        this.items = items;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "totalCount=" + getTotalCount() +
                ", totalPrice=" + getTotalPrice() +
                ", items=" + items +
                '}';
    }




}