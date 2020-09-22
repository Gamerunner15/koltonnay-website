package org.kolton;

import nz.net.ultraq.thymeleaf.LayoutDialect;
import org.thymeleaf.spring5.SpringTemplateEngine;

public class ThymeleafConfiguration {
    public SpringTemplateEngine thymeleafLayoutDialect() {
        SpringTemplateEngine engine = new SpringTemplateEngine();
        engine.addDialect(new LayoutDialect());
        return engine;
    }
}