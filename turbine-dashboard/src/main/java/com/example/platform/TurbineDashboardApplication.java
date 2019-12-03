package com.example.platform;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.turbine.stream.EnableTurbineStream;

@EnableDiscoveryClient
@EnableTurbineStream
@SpringBootApplication
public class TurbineDashboardApplication {

	public static void main(String[] args) {
		SpringApplication.run(TurbineDashboardApplication.class, args);
	}

}
