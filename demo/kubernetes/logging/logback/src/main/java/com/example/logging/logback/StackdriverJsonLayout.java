package com.example.logging.logback;

import java.util.Map;

import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.contrib.json.classic.JsonLayout;

public class StackdriverJsonLayout extends JsonLayout {
    @Override
    protected void addCustomDataToJsonMap(Map<String, Object> map, ILoggingEvent event) {
        map.put("severity", String.valueOf(event.getLevel()));
    }
}