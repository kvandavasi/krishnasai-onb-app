package com.example;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class MainTest {
     @Test
     public void evaluatesExpression() {
        int sum = 1+2+3+4+5;
        assertEquals(15, sum);
     }
}
