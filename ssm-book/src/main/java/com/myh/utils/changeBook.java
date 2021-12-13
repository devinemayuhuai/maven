package com.myh.utils;

import com.myh.pojo.Book;
import org.springframework.stereotype.Component;

@Component
public class changeBook {

    public Book change(Book book){
        Book book1=new Book();
        if ("".equals(book.getName())){

        }else {
            book1.setName(book.getName());
        }

        if ("".equals(book.getAuthor())){

        }else {
            book1.setAuthor(book.getAuthor());
        }

        if ("".equals(book.getPress())){

        }else{
            book1.setPrice(book.getPrice());
        }

        if ("".equals(book.getType())){

        }else {
            book1.setType(book.getType());
        }
        return book1;
    }
}
