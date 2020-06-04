package com.springbootjsp;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
/**
 * SpringBoot的启动类
 * 自动启动内置的tomcat
 * @author Administrator
 *
 */
@SpringBootApplication(scanBasePackages="com.springbootjsp")
@MapperScan("com.springbootjsp.mapper")
@ServletComponentScan
public class ApplicationMain {

	public static void main(String[] args) {
		SpringApplication.run(ApplicationMain.class,args);
	}

	@Bean
	public InternalResourceViewResolver setupViewResolver(){
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/jsp/");
		resolver.setSuffix(".jsp");
		return resolver;
	}
}
