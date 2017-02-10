package com.tzh.campushelper.ui.widget;

import android.content.Context;
import android.graphics.Color;
import android.graphics.Point;
import android.support.v4.content.ContextCompat;
import android.util.AttributeSet;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.tzh.campushelper.R;
import com.tzh.common.common.logger.Log;

import java.util.List;
import java.util.Random;

/**
 * 课程表控件
 */
public class TimetableView extends LinearLayout {
    private static final String[] DAYS = {"一", "二", "三", "四", "五", "六", "日"};

    private static final int[] COLORS = {
            R.color.md_amber300, R.color.md_amber400, R.color.md_amber500, R.color.md_amber600,
            R.color.md_blue300, R.color.md_blue400, R.color.md_blue500, R.color.md_blue600,
            R.color.md_cyan300, R.color.md_cyan400, R.color.md_cyan500, R.color.md_cyan600,
            R.color.md_orange300, R.color.md_orange400, R.color.md_orange500, R.color.md_orange600,
            R.color.md_indigo300, R.color.md_indigo400, R.color.md_indigo500, R.color.md_indigo600,
            R.color.md_pink300, R.color.md_pink400, R.color.md_pink500, R.color.md_pink600,
            R.color.md_red300, R.color.md_red400, R.color.md_red500, R.color.md_red600,
            R.color.md_green300, R.color.md_green400, R.color.md_green500, R.color.md_green600,
    };

    private static final int DAY_TEXT_HEIGHT = 40;

    private static final int RANK_TEXT_WIDTH = 24;

    private static final int TIMETABLE_HEIGHT = 64;

    //每天课程最大节数
    private static final int COURSE_TOTAL = 12;

    //分界线的直径
    private static final int LINE_DIAMETER = 1;

    private TimeTableEntry mTimeTableEntry;

    private Random mRandom = new Random();

    public TimetableView(Context context) {
        super(context);
        initView();
    }

    public TimetableView(Context context, AttributeSet attrs) {
        super(context, attrs);
        initView();
    }

    public TimetableView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        initView();
    }

    public void setTimeTableEntry(TimeTableEntry timeTableEntry) {
        mTimeTableEntry = timeTableEntry;
        refresh();
    }

    public void initView() {
        //主布局
        setOrientation(LinearLayout.HORIZONTAL);

        //先来绘制第一列代表节数的LinearLayout
        LinearLayout firstLayout = new LinearLayout(getContext());
        firstLayout.setOrientation(LinearLayout.VERTICAL);
        LayoutParams params = new LayoutParams(dp(RANK_TEXT_WIDTH), ViewGroup.LayoutParams.WRAP_CONTENT);
        firstLayout.setLayoutParams(params);

        // The first blank cell.
        TextView blankText = new TextView(getContext());
        blankText.setWidth(dp(RANK_TEXT_WIDTH));
        blankText.setHeight(dp(DAY_TEXT_HEIGHT));
        firstLayout.addView(blankText);
        // Add a line.
        firstLayout.addView(getTransverseLine(dp(RANK_TEXT_WIDTH)));

        //添加代表节数的文本
        for (int i = 0; i < COURSE_TOTAL; i++) {
            TextView rankText = new TextView(getContext());
            rankText.setWidth(dp(RANK_TEXT_WIDTH));
            rankText.setHeight(dp(TIMETABLE_HEIGHT));
            rankText.setGravity(Gravity.CENTER);
            rankText.setText(String.valueOf(i + 1));
            firstLayout.addView(rankText);
            firstLayout.addView(getTransverseLine(dp(RANK_TEXT_WIDTH)));
        }
        //向主布局添加第一列
        addView(firstLayout);

        // 继续添加星期一到星期日的每一列
        LayoutParams layoutParams = new LayoutParams(getViewWidth(), ViewGroup.LayoutParams.WRAP_CONTENT);
        for (int day = 0; day < DAYS.length; day++) {
            LinearLayout dayLayout = new LinearLayout(getContext());
            dayLayout.setOrientation(LinearLayout.VERTICAL);
            dayLayout.setLayoutParams(layoutParams);

            // Add column head.
            TextView columnHead = new TextView(getContext());
            columnHead.setHeight(dp(DAY_TEXT_HEIGHT));
            columnHead.setGravity(Gravity.CENTER);
            columnHead.setText(DAYS[day]);

            dayLayout.addView(columnHead);
            dayLayout.addView(getTransverseLine(getViewWidth()));

            FrameLayout timesLayout = new FrameLayout(getContext());
            timesLayout.setLayoutParams(new ViewGroup.LayoutParams(LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            for (int course = 0; mTimeTableEntry != null && course < COURSE_TOTAL; course++) {
                List<TimeTableEntry.CourseLocator> locators = mTimeTableEntry.get(course + 1, day + 1);
                if (locators != null) {
                    for (TimeTableEntry.CourseLocator locator : locators) {
                        if (mTimeTableEntry.getWeekFilter() > 0
                                && locator.getWeeks() != null
                                && !locator.getWeeks().contains(mTimeTableEntry.getWeekFilter())) {
                            continue;
                        }
                        TextView tv = new TextView(getContext());
                        FrameLayout.LayoutParams tvParams = new FrameLayout.LayoutParams(getViewWidth(), (locator.getEnd() - locator.getStart() + 1) * dp(TIMETABLE_HEIGHT));
                        tvParams.setMargins(0, (locator.getStart() - 1) * dp(TIMETABLE_HEIGHT), 0, 0);
                        tv.setLayoutParams(tvParams);
                        tv.setTextColor(Color.WHITE);
                        tv.setGravity(Gravity.CENTER);
                        tv.setBackgroundColor(ContextCompat.getColor(getContext(), getRandomColor()));
                        tv.setText(locator.getContent());
                        tv.setTag(locator);
                        timesLayout.addView(tv);
                    }
                }// if end
            } // for end
            dayLayout.addView(timesLayout);

            // Add day layout.
            addView(getVerticalLine(dp(COURSE_TOTAL * TIMETABLE_HEIGHT + DAY_TEXT_HEIGHT + LINE_DIAMETER * (COURSE_TOTAL + 1))));
            addView(dayLayout);
        }
    }

    private void refresh() {
        removeAllViews();
        initView();
        requestLayout();
    }

    private int dp(float value) {
        float scale = getContext().getResources().getDisplayMetrics().density;
        return (int) (value * scale + 0.5f);
    }

    /**
     * 计算每个包含课程信息的TextView的宽度
     */
    private int getViewWidth() {
        return (dp(64));
    }

    /**
     * 获取横向分界线
     */
    private View getTransverseLine(int length) {
        TextView line = new TextView(getContext());
        line.setWidth(length);
        line.setHeight(LINE_DIAMETER);
        line.setBackgroundColor(ContextCompat.getColor(getContext(), R.color.md_bluegrey100));
        return line;
    }

    /**
     * 获取竖向分界线
     */
    private View getVerticalLine(int length) {
        TextView line = new TextView(getContext());
        line.setWidth(LINE_DIAMETER);
        line.setHeight(length);
        line.setBackgroundColor(ContextCompat.getColor(getContext(), R.color.md_bluegrey100));
        return line;
    }

    public int getRandomColor() {
        return COLORS[mRandom.nextInt(COLORS.length)];
    }

}
