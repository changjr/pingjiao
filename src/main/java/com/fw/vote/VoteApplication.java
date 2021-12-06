package com.fw.vote;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
@MapperScan(basePackages = "com.fw.vote.dao")
//添加扫描，把需要的东西扫描出来
@SpringBootApplication
public class VoteApplication {

    public static void main(String[] args){
        SpringApplication.run(VoteApplication.class, args);
    }
}
