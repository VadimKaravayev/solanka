package com.buddy.springboot.demo.springdemo.rest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FunRestController {

    @Value("${author.name}")
    private String authorName;

    @Value("${author.email}")
    private String authorEmail;

    @GetMapping("/")
    public String sayHello() {
        return "Hello World";
    }

    @GetMapping("/workout")
    public String getDailyWorkout() {
        return "Run hard 5k";
    }

    @GetMapping("/fortune")
    public String getDailyFortune() {
        return "Today is your lucky day";
    }

    @GetMapping("/author-contacts")
    public Object getAuthorContacts() {
        record Author(String authorName, String authorEmail, String location) {}

        return new Author(
                this.authorName,
                this.authorEmail,
                "Lviv, Ukraine");
    }
}
