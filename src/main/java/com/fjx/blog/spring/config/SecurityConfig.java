package com.fjx.blog.spring.config;

import com.fjx.blog.spring.interceptor.SecurityInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

@Configuration
public class SecurityConfig extends WebMvcConfigurationSupport {
    @Bean
    public SecurityInterceptor securityInterceptor() {
        return new SecurityInterceptor();
    }


    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        InterceptorRegistration registration = registry.addInterceptor(securityInterceptor());
        registration.excludePathPatterns("/home/*");
        registration.excludePathPatterns("/");
        registration.excludePathPatterns("/login");
        registration.addPathPatterns("/admin/*");
        registration.addPathPatterns("/admin");
        // super.addInterceptors(registry);
    }
}
