package com.example.demo;

import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Apurva Acharya <apr.acharya@gmail.com>
 * @since 2026-05-14 9:46 p.m.
 */
@RestController
@RequestMapping("/test")
@Slf4j
public class Controller {
    @GetMapping()
    public ResponseEntity<@NonNull String> testGet() {
        String response = "Hi, welcome!";
        log.info("Response: {}", response);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }
}