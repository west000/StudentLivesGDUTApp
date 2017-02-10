package com.tzh.campushelper.ui.edu.timetable;

import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static junit.framework.Assert.assertEquals;


public class TimeTableEntryTest {

    @Test
    public void transformRankTest() {
    }

    private void assertWeeks(int[] excepted, int[] actual) {
        assertEquals(excepted.length, actual.length);
        for (int i = 0; i < excepted.length; i++) {
            assertEquals(excepted[i], actual[i]);
        }
    }

}