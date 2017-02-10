package com.tzh.campushelper.ui;

import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.design.widget.TabLayout;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.content.ContextCompat;
import android.support.v4.graphics.drawable.DrawableCompat;
import android.support.v4.view.ViewPager;
import android.widget.Toast;

import com.tzh.campushelper.Injection;
import com.tzh.campushelper.R;
import com.tzh.campushelper.ui.tools.ToolsFragment;
import com.tzh.campushelper.ui.user.info.UserInfoFragment;

import static com.tzh.campushelper.util.Preconditions.checkNotNull;

public class MainActivity extends BaseActivity {

    private long mExitTime = 0;

    public static void start(Context context) {
        Intent starter = new Intent(context, MainActivity.class);
        context.startActivity(starter);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Create the adapter that will return a fragment for each of the two
        // primary sections of the activity.
        PagerAdapter adapter = new PagerAdapter(getSupportFragmentManager());

        // Set up the ViewPager with the sections adapter.
        ViewPager viewPager = (ViewPager) findViewById(R.id.container);
        viewPager.setAdapter(adapter);

        TabLayout tabLayout = (TabLayout) findViewById(R.id.tabs);
        tabLayout.setupWithViewPager(viewPager);
        // Set up the first icon
        Drawable icon1 = ContextCompat.getDrawable(this, R.drawable.ic_toolbar);
        DrawableCompat.setTintList(icon1, ContextCompat.getColorStateList(this, R.color.blue_tab_selector));
        checkNotNull(tabLayout.getTabAt(0)).setIcon(icon1);
        // Set up the second icon
        Drawable icon2 = ContextCompat.getDrawable(this, R.drawable.ic_person);
        DrawableCompat.setTintList(icon2, ContextCompat.getColorStateList(this, R.color.blue_tab_selector));
        checkNotNull(tabLayout.getTabAt(1)).setIcon(icon2);
    }

    @Override
    public void onBackPressed() {
        if ((System.currentTimeMillis() - mExitTime) > 2000) {
            mExitTime = System.currentTimeMillis();
            Toast.makeText(this, R.string.exit_app, Toast.LENGTH_SHORT).show();
        } else {
            super.onBackPressed();
        }
    }

    private class PagerAdapter extends FragmentPagerAdapter {

        private PagerAdapter(FragmentManager fm) {
            super(fm);
        }

        @Override
        public Fragment getItem(int position) {
            switch (position) {
                case 0:
                    return ToolsFragment.newInstance();
                case 1:
                    return UserInfoFragment.newInstanceWithPresenter(
                            Injection.provideBaseSchedulerProvider(),
                            Injection.provideApiService(MainActivity.this)
                    );
            }
            return null;
        }

        @Override
        public int getCount() {
            return 2;
        }
    }
}
