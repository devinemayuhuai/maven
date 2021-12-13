package com.myh.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import javax.validation.constraints.Pattern;
import java.sql.Date;
@Component
public class User {
         private Integer id;

          @NotBlank(message = "账号不能为空")
         private String username;

         @Pattern(regexp = "(?![^a-zA-Z]+$)(?!\\D+$).{8,15}$",message = "密码长度为8到15个，必须包括字母和数字")
         private String password;

         @Email(message = "邮箱格式不正确")
         private String email;

        @DateTimeFormat(pattern = "yyyy-MM-dd")
        @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
         private Date  birth;

         private String headimg;
         private String gender;

    public User() {
    }

    public User(Integer id, String username, String password, String email, Date birth, String headimg, String gender) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.birth = birth;
        this.headimg = headimg;
        this.gender = gender;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public String getHeadimg() {
        return headimg;
    }

    public void setHeadimg(String headimg) {
        this.headimg = headimg;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", birth=" + birth +
                ", headimg='" + headimg + '\'' +
                ", gender='" + gender + '\'' +
                '}';
    }
}
