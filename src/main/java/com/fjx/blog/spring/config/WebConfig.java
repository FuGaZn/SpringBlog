package com.fjx.blog.spring.config;

import com.fjx.blog.spring.interceptor.SecurityInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
@ComponentScan("com.fjx.blog.spring")
public class WebConfig implements WebMvcConfigurer {
    @Autowired
    private PropertiesConfig propertiesConfig;

    @Bean
    public SecurityInterceptor securityInterceptor() {
        return new SecurityInterceptor();
    }


    @Bean
    public ViewResolver viewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");
        resolver.setViewClass(JstlView.class);
       // resolver.setPrefix(propertiesConfig.getWebViewPrefix());
      //  resolver.setSuffix(propertiesConfig.getWebViewSuffix());
        resolver.setExposeContextBeansAsAttributes(true);
        return resolver;
    }

    @Bean(name = "multipartResolver") // bean必须写name属性且必须为multipartResolver
    protected CommonsMultipartResolver multipartResolver() {
        CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver();
        commonsMultipartResolver.setMaxUploadSize(5 * 1024 * 1024);
        commonsMultipartResolver.setMaxInMemorySize(0);
        commonsMultipartResolver.setDefaultEncoding("UTF-8");
        return commonsMultipartResolver;
    }

    /*
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler(propertiesConfig.getWebStaticHandler()).addResourceLocations(propertiesConfig.getWebStaticResource());
    }
    */

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
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
