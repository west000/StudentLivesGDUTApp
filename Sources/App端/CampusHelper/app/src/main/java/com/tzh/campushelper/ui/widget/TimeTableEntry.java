package com.tzh.campushelper.ui.widget;

import android.util.SparseArray;

import com.tzh.campushelper.service.ApiService;
import com.tzh.campushelper.service.ApiService.CurriculumResult.Course;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class TimeTableEntry {

    private SparseArray<List<CourseLocator>> locatorsMap;
    private int mWeekFilter;

    public static TimeTableEntry from(List<Course> courseList) {
        TimeTableEntry entry = new TimeTableEntry();

        entry.locatorsMap = new SparseArray<>();
        for (Course course : courseList) {
            CourseLocator locator = CourseLocator.from(course);
            Integer key = key(locator.start, locator.weekday);
            List<CourseLocator> locators = entry.locatorsMap.get(key);
            if (locators == null) {
                locators = new ArrayList<>();
                entry.locatorsMap.put(key, locators);
            }
            locators.add(locator);
        }

        return entry;
    }

    public List<CourseLocator> get(int start, int weekday) {
        return locatorsMap.get(key(start, weekday));
    }

    private static int key(int start, int weekday) {
        if (start < 1 || weekday < 1 || weekday > 7) {
            throw new IllegalArgumentException("Make sure the argument 0 < 'start' and 0 < 'weekday' < 8");
        }
        return (start - 1) * 7 + weekday;
    }

    public void setWeekFilter(int weekFilter) {
        mWeekFilter = weekFilter;
    }

    public int getWeekFilter() {
        return mWeekFilter;
    }

    public static class CourseLocator {
        private Course course;
        private String content;
        private int start;
        private int end;
        private ArrayList<Integer> weeks;
        private int weekday;

        private CourseLocator() {
        }

        public static CourseLocator from(Course course) {
            CourseLocator locator = new CourseLocator();

            locator.course = course;
            locator.content = course.cname + "\n"
                    + course.tname + "\n"
                    + course.classroom + "\n";

            Pattern pattern = Pattern.compile("第(.*)节\\{第([0-9]{1,2})\\-([0-9]{1,2})周(\\|.*)?\\}");
            Matcher matcher = pattern.matcher(course.time);
            if (!matcher.matches()) {
                return null;
            }

            String[] split = matcher.group(1).split(",");
            locator.start = (Integer.valueOf(split[0].trim()));
            locator.end = (Integer.valueOf(split[split.length - 1].trim()));

            final int startWeek = Integer.valueOf(matcher.group(2));
            final int endWeek = Integer.valueOf(matcher.group(3));
            final String weekFilter = matcher.group(4);
            locator.transformWeeks(startWeek, endWeek, weekFilter);
            locator.transformWeekday(course.weekday);

            return locator;
        }

        private void transformWeekday(String weekdayString) {
            final String[] WEEK_MAP = {"周一", "周二", "周三", "周四", "周五", "周六", "周日"};
            for (int i = 0; i < WEEK_MAP.length; i++) {
                if (WEEK_MAP[i].equals(weekdayString)) {
                    weekday = i + 1;
                }
            }
        }

        private void transformWeeks(int startWeek, int endWeek, String weekFilter) {
            // End week should larger than start week.
            if (endWeek >= startWeek) {
                weeks = new ArrayList<>();
                if (weekFilter == null || "".equals(weekFilter)) {
                    for (int i = startWeek; i <= endWeek; i++) {
                        weeks.add(i);
                    }
                } else if ("|单周".equals(weekFilter)) {
                    for (int i = startWeek; i <= endWeek; i++) {
                        if (i % 2 != 0) {
                            weeks.add(i);
                        }
                    }
                } else if ("|双周".equals(weekFilter)) {
                    for (int i = startWeek; i <= endWeek; i++) {
                        if (i % 2 == 0) {
                            weeks.add(i);
                        }
                    }
                }
            }
        }

        public Course getCourse() {
            return course;
        }

        public String getContent() {
            return content;
        }

        public int getStart() {
            return start;
        }

        public int getEnd() {
            return end;
        }

        public ArrayList<Integer> getWeeks() {
            return weeks;
        }

        public int getWeekday() {
            return weekday;
        }
    }

}
