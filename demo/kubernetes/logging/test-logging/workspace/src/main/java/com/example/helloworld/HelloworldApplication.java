package com.example.helloworld;

import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.cloud.logging.LoggingHandler;

@SpringBootApplication
public class HelloworldApplication {
	private static final Logger LOGGER = Logger.getLogger(HelloworldApplication.class.getName());

	@Value("${TARGET:World}")
	String target;

	@RestController
	class HelloworldController {
		@GetMapping("/")
		String hello() {
			LOGGER.info("Testing info JUL");
			LOGGER.severe("Testing error JUL");
			return "Testing!";
		}
	}

	public static void main(String[] args) {
		LoggingHandler.addHandler(LOGGER, new LoggingHandler());
		SpringApplication.run(HelloworldApplication.class, args);

		Logger logger = Logger.getLogger(HelloworldApplication.class.getName());

		logger.info("Logging INFO with java.util.logging");
		logger.severe("Logging ERROR with java.util.logging");

	}
}