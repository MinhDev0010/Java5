package com.poly.shop;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class AsgJavaSpringBootApplication implements CommandLineRunner {

    public static void main(String[] args) {
        SpringApplication.run(AsgJavaSpringBootApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception {
        System.out.println("Started............................................");
    }
}
